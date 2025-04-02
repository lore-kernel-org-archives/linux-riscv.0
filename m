Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF91FC36014
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H5cM2f3Z3d/1q2c+eKNS45SwlpmGwbclPDLtv1QSBwQ=; b=BIclJkjtLOPpgC
	QQ+B8Zcx43Xb82XyySByRv0A8pPXuH1nzsimRX8Be34l+jC4JuML0ryZSY6NUT5oEfe1y4bfMZv3N
	zkHxiZn9s+7F7ZQY6WpMmuS4Cr7ftFCmGhvFTlUdkgrG2rYtcK7jYi/iDchaaZUZAgl/p7UlyFNEa
	wrKcFnUJVhlAdhYml2ggabeAz4vcfRupCZcZygV9NZAqYsiYBO6p7w4AMAklZ4s6Ah/v6ffCkK4eF
	YxXribFSrQh68aeievONu8LoHpVgly8X6zgeeDrRK//MZP/w9KwyKHA3HJybqAy26kRfrhvRu+gsr
	DbGOnS8G35l7OkeoHHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztFc-00000005V44-0LVF;
	Wed, 02 Apr 2025 08:15:08 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztF7-00000005Uzz-21zg
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 08:14:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223fb0f619dso121716315ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Apr 2025 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743581676; x=1744186476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H2pGk9Xt83EqX1emcWyT/wv59qxjeCHQBirwKtcHUmE=;
        b=UeivQ0OfHaAybPdm493B170wE0juFyLKqJK0oZg6/xaMwqmS3aGkaj8bgY/DEXnrYZ
         9RmhDdaHZGwLBFAiO7LlWBV6Tq+yz21SoOq//R37mg7sUTvN8W5CzgC1QFM++puB6Ag4
         8imgbVKE/n3nJD/q3hiKrwmJuILBrqfarQeEjzbaeEJUEzyad6C3u20itF9lV3yJyvys
         ZbmwxkXvugyUdF+QFsOE3lcXcXvIZVpbtUSstzDQkrfz9CouHrFrYEvimtXGRraTDRLn
         /7fuPezbUPPJ7d/oyarVA5MVmK/u1S0L/GSsVDbeWfKDTA7XL1l+SY9DdfEM9Bvi91/N
         nYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581676; x=1744186476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2pGk9Xt83EqX1emcWyT/wv59qxjeCHQBirwKtcHUmE=;
        b=BV68ww44FEoP+/fJGwJJd92evVbKPk/lmfEBs/GCun7Hi+WrkjJ35RUqrGTYNThTat
         gLmdVHGXWOb+k3IIwJqHmmycBO/iFULO3ELgdyJ+ujU1I7G0v1eN4aMpLeLJ+U/HguAj
         cBE40l64ktnZ5do74Zz+6WV88gzc1bg9/VIcSqmCUK6Rfsm7aAe7blZ1RLTrYOKwn98U
         NAUUek0/x9QsJIR4MEHMyZBE2+M0XPow8hWXxS7Rl2g3FGukWiTQ+Nn5TgpEFLKI0Dwk
         G/ho88ouHfbi6rS+vvZAKhigpaVHVhli1RQtiFeDxd1NoMFMvqwvq58uqxZbANk0VQGe
         Mq1A==
X-Forwarded-Encrypted: i=1; AJvYcCVhVawk6AfqYQks32/iDUJw99BzZP+7mFNuj1Two6NmYED0MgiisSAUy4h8veXkmhu9sbsaJpUlKQiqfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbEpRfN3o3Olc2zsaxCqwbbb86Xv2euOd3pHN9gZrtK5eylpwZ
	QNfSDsm60K+d1Ccsz5nScoXmyCCWwacdCnPOUK4jDnj7FzjUEHbg
X-Gm-Gg: ASbGncsoCYnmVNHiXMHrewkPCQexXroFoqORAV4yJZnj96ne0SXMQQarS0Y36Q7aLbe
	eJK1eIxrzlhZPZF0W5s/BgNJWwzGx9QXuix/oQXoNfDyeJvQ3Pnm9l/IEC+deZRCI7kAVUigxY5
	IKwNKLt1hToOXngQ6OVzubCmyDSoFLvpSSZE5oCasV1WTGdJ+zguxfiZ27zWkoRuBaGSNUQCZhY
	HEPkgOHfxlFxcA7OEv5gzF+ypaXneXFjHSMaupLFyZBmCN5ENzfm6wZ615smoeTZmtrML01rTqJ
	BsyIvu/fd+R2XeDM7d23dw9UW8QX9iC5Lypeoulr9T8qjD+/7jqkvoX417w=
X-Google-Smtp-Source: AGHT+IHXeWf41ELBhiyb5olY5krHGUt+MYYN6uMk2S7KVFQGjX4OvIziCRxqlNlpFpPMnfIiSwIW+A==
X-Received: by 2002:a05:6a20:9f46:b0:1f3:293b:7aa with SMTP id adf61e73a8af0-200d12ff415mr9546957637.4.1743581676573;
        Wed, 02 Apr 2025 01:14:36 -0700 (PDT)
Received: from localhost.localdomain ([136.24.137.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e51356sm10340871b3a.79.2025.04.02.01.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:14:36 -0700 (PDT)
From: wgpierce17@gmail.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	cleger@rivosinc.com,
	Will Pierce <wgpierce17@gmail.com>
Subject: [PATCH v2] riscv: Use kvmalloc_array on relocation_hashtable
Date: Wed,  2 Apr 2025 01:14:26 -0700
Message-ID: <20250402081426.5197-1-wgpierce17@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_011437_520750_7F784E8B 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogV2lsbCBQaWVyY2UgPHdncGllcmNlMTdAZ21haWwuY29tPgoKVGhlIG51bWJlciBvZiBy
ZWxvY2F0aW9ucyBtYXkgYmUgYSBodWdlIHZhbHVlIHRoYXQgaXMgdW5hbGxvY2F0YWJsZQpieSBr
bWFsbG9jLiBVc2Uga3ZtYWxsb2MgaW5zdGVhZCBzbyB0aGF0IGl0IGRvZXMgbm90IGZhaWwuCgpG
aXhlczogOGZkNmM1MTQyMzk1ICgicmlzY3Y6IEFkZCByZW1haW5pbmcgbW9kdWxlIHJlbG9jYXRp
b25zIikKU2lnbmVkLW9mZi1ieTogV2lsbCBQaWVyY2UgPHdncGllcmNlMTdAZ21haWwuY29tPgpT
dWdnZXN0ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNo
L3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL21vZHVsZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKaW5kZXggNDdkMGViZWVj
OTNjLi4wYWUzNGQ3OWI4N2IgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCkBAIC02NDgsNyArNjQ4LDcgQEAgcHJv
Y2Vzc19hY2N1bXVsYXRlZF9yZWxvY2F0aW9ucyhzdHJ1Y3QgbW9kdWxlICptZSwKIAkJa2ZyZWUo
YnVja2V0X2l0ZXIpOwogCX0KIAotCWtmcmVlKCpyZWxvY2F0aW9uX2hhc2h0YWJsZSk7CisJa3Zm
cmVlKCpyZWxvY2F0aW9uX2hhc2h0YWJsZSk7CiB9CiAKIHN0YXRpYyBpbnQgYWRkX3JlbG9jYXRp
b25fdG9fYWNjdW11bGF0ZShzdHJ1Y3QgbW9kdWxlICptZSwgaW50IHR5cGUsCkBAIC03NTIsOSAr
NzUyLDEwIEBAIGluaXRpYWxpemVfcmVsb2NhdGlvbl9oYXNodGFibGUodW5zaWduZWQgaW50IG51
bV9yZWxvY2F0aW9ucywKIAogCWhhc2h0YWJsZV9zaXplIDw8PSBzaG91bGRfZG91YmxlX3NpemU7
CiAKLQkqcmVsb2NhdGlvbl9oYXNodGFibGUgPSBrbWFsbG9jX2FycmF5KGhhc2h0YWJsZV9zaXpl
LAotCQkJCQkgICAgICBzaXplb2YoKipyZWxvY2F0aW9uX2hhc2h0YWJsZSksCi0JCQkJCSAgICAg
IEdGUF9LRVJORUwpOworCS8qIE51bWJlciBvZiByZWxvY2F0aW9ucyBtYXkgYmUgbGFyZ2UsIHNv
IGt2bWFsbG9jIGl0ICovCisJKnJlbG9jYXRpb25faGFzaHRhYmxlID0ga3ZtYWxsb2NfYXJyYXko
aGFzaHRhYmxlX3NpemUsCisJCQkJCSAgICAgICBzaXplb2YoKipyZWxvY2F0aW9uX2hhc2h0YWJs
ZSksCisJCQkJCSAgICAgICBHRlBfS0VSTkVMKTsKIAlpZiAoISpyZWxvY2F0aW9uX2hhc2h0YWJs
ZSkKIAkJcmV0dXJuIDA7CiAKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
