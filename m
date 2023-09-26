Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED7DE7E64B
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpadI+AqRUMJJG59CvAcDJ3fHAjLLg54OrbQv6olX+s=; b=ALW77AsV00lJmN
	AtNVJ4cDV1PgiYvoZvJIe/07PYfI1XpDFovG57IUZVaGSC+bB0MfRdfDv4bVaaPg/HkcGTTaZDkln
	2HnZGPhZ470ce444Xh0WoHmMBjMWTwMqGKsloK1U9fL4aqKRrh1MPSUPFjkHSMt5yLD0g3YSdnZt6
	Gfm9QJPU0V7t6u4MXp9LqBY3OAuQGabG1bxztU0+5wnDz6YxfVJB1zv6m/6qIXmAjdUVKQk7Q7QOB
	o+1MgmORYKwv+KSdbRjqqnlCiTTTt7k9DVJf6BS6KbLW720zjqElSgwd8viDc9gEkhA7ir2uuWNMW
	Hw+iSCp0SsTuwFTOAwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bS-00GbLF-2X;
	Tue, 26 Sep 2023 15:03:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bQ-00GbK8-1P
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 15:03:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3231e138f44so694347f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695740635; x=1696345435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nyDpPdQazxwk2pvs7+quB1sTF8r3wWKIala/GUDnoY=;
        b=HsABgrjDPrM1xT2fkCzuhxaU3pVnt8DJMubp7hyStuf1JWkmhpN4eMCpAcUuQ/WgRM
         DAUopv5Dy6+P90K5BeeugpXNPpHfVf5OVVp3NggiDs4d5rzmo32iPnEXpl4Lk5+bk7q1
         UcgJ/mgc+0LRAktQOu0gPFLtYAG4Wdz8FOxoeguLaK/AIod3z7ArsoRKcdzYDVyc7Q7y
         2+g63XImCP9Ty4EJM7ABfq78OhjKeEr9pwU7LADu1PNkpgT0eiwjGOwkByweL139zDWm
         F+df0MDc/OPn+eTcH/H3jfEuP0Ef3WJunpxkyPYFMvK1LYodvNE270loqdG7bdFagoXb
         au8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740635; x=1696345435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nyDpPdQazxwk2pvs7+quB1sTF8r3wWKIala/GUDnoY=;
        b=HRoE8vgZc/rJ3YK7iQEPpWLaoGyBAp7tM3GfavStH+XLX08vC9rroM7Udag93FakCI
         MN3MqxpqX6yGRtNsgZYRz1n4qE+Zbdj1rcN96ekghfZI5VGAdNDeKz7bpF9HEi2iNXTm
         zmAK4q3f1S7vhzC8gNznClM9MhX82oGFye/VX+wBFSO4KPZz70yvHJWCJ55EosCpi1gq
         mgLnOCApSQrnKjvbLZzKAqcE+F/7xBo2e/ei/HlqriWk01dFaui2ZdtMfUDn3h+zj8nj
         geBqTNjMWXf3sHCa9krXP1UmhDWk4ate8dDyLZ+1KseylnejNx6HOveuOi4Cw/eR0QCh
         a7/w==
X-Gm-Message-State: AOJu0YyVT33OhXVrHC4pwIfv1Fy+7AXwNFQGk1DH+BlUoQoR7m3Fy3Xd
	1TrAcCSiRanotg43uU6GGLtTsQ==
X-Google-Smtp-Source: AGHT+IGYli5WdDX3fLxDTBPXQEXiU0p8vh4593GY6BMsCSxPr/ByItH+Sc2kbRCDAkHR7bnBCb9y6w==
X-Received: by 2002:a5d:595e:0:b0:31f:899b:a47 with SMTP id e30-20020a5d595e000000b0031f899b0a47mr8497274wri.4.1695740634745;
        Tue, 26 Sep 2023 08:03:54 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2b3d:6c70:9dbf:5ede])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm14926060wru.41.2023.09.26.08.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 08:03:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: [PATCH 3/7] riscv: report perf event for misaligned fault
Date: Tue, 26 Sep 2023 17:03:12 +0200
Message-Id: <20230926150316.1129648-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926150316.1129648-1-cleger@rivosinc.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080356_494278_F4A49AA7 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

QWRkIG1pc3NpbmcgY2FsbHMgdG8gYWNjb3VudCBmb3IgbWlzYWxpZ25lZCBmYXVsdCBldmVudCB1
c2luZwpwZXJmX3N3X2V2ZW50KCkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA5ZGFlZDdkNzU2YWUuLjgwNGY2YzVlMGU0NCAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNiw2ICs2LDcgQEAKICNpbmNs
dWRlIDxsaW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgvbW0uaD4KICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvaXJxLmg+CiAjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+CiAKQEAgLTI5NCw2ICsyOTUs
OCBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAl1
bnNpZ25lZCBsb25nIGFkZHIgPSByZWdzLT5iYWRhZGRyOwogCWludCBpLCBmcCA9IDAsIHNoaWZ0
ID0gMCwgbGVuID0gMDsKIAorCXBlcmZfc3dfZXZlbnQoUEVSRl9DT1VOVF9TV19BTElHTk1FTlRf
RkFVTFRTLCAxLCByZWdzLCBhZGRyKTsKKwogCWlmIChnZXRfaW5zbihyZWdzLCBlcGMsICZpbnNu
KSkKIAkJcmV0dXJuIC0xOwogCkBAIC0zODIsNiArMzg1LDggQEAgaW50IGhhbmRsZV9taXNhbGln
bmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCXVuc2lnbmVkIGxvbmcgYWRkciA9IHJl
Z3MtPmJhZGFkZHI7CiAJaW50IGksIGxlbiA9IDA7CiAKKwlwZXJmX3N3X2V2ZW50KFBFUkZfQ09V
TlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7CisKIAlpZiAoZ2V0X2luc24o
cmVncywgZXBjLCAmaW5zbikpCiAJCXJldHVybiAtMTsKIAotLSAKMi40MC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
