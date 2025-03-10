Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027F2C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rskNOFn283JNL34tkBQLBTsbWlru5zf1YnBFK/97J20=; b=gImeoUBB8nOzg6
	o0QwP+9Z9BHNus1zltdq75s5clxZvBgCPz+nCBHdUFMtUVd3iB28yhv6WwOpagOp2ubXOwthl2v5k
	enDLYFMaRKZavWGxkaBXyqRAt41lhaX+qvuGgTQVzdcc8wZvWKtr5KJY/9BOhVWrODOE71MGHsjjz
	zz9rLK+rjY0DIYs4sS9yWwR7DGjtdGcnWIh6GT1L6G6xbdIc2zGZP8t+0V10fvgu921Bxx5BTENcW
	6j4azCdIhbCvp+SMKUpRTvoT23FEb0VujkzAYpgLBWeURP3ODjHHTV012VBqTNQIGysZ2iJndSFeP
	OLPnNmohCarLvh1jjmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLw-00000003Fzo-0oD8;
	Mon, 10 Mar 2025 15:47:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trep8-000000037kU-03BE
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2243803b776so68739075ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619625; x=1742224425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCBi+dVMU97ACIzU1KLcK/YVJVSSJGwq4MBxilXjNH4=;
        b=l40Zjtt41MAgR0VHZ/ZdG9WYohEwvn/HaZjBuYMe8FTTJN+HNRS3Md4XW+uwo/lU4h
         6vgvjJXlXGeqnHKS9PWmxAs6zocDro645D8rFqzhtsDU9BKopiC9bgiic3nD2WcaEp28
         0TNBruSAH7/hxhWRanVA/lgZb1nT4cW8DW0IkqBLZIyTv3IGiOTntbP/x7ggk5qrscHD
         tq1TW6mQ0vv9y1oPGOUSBtgpOqdlo6XgSDICWq+CGOV6WnSwhxXfdo2hT3aKVK5isDFG
         MRFhtyGD7Wv2oAlIK20FirccAF++yBELMKCz9VIo1cEUwa4G/8cvgW0Q+WQgNdWzVwm/
         Ks6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619625; x=1742224425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCBi+dVMU97ACIzU1KLcK/YVJVSSJGwq4MBxilXjNH4=;
        b=XYyEFL9De9mM06kcNKu2wKk8n6wpNTml3tqEJJWPhMWjydsIVqnk6DjOSRvYrRfHDQ
         p51HFyRJuPp/n3ciAhTcSXD+39xzo0143BMKei2V4NQYkP+gFPEAki6oyl64yQz7hQmS
         aOZUb7aBXFyrda93hTLYrV5I/wc1qfjPMgAgK1OWkOqnxOZSztC2jwT3rPu6DFeOil95
         hj81QOqmuuZv2tTVxLwpjTbKS1/f64EwUTxy2TqpdVEakHy5w/KkcIjjaeY0KvymFOJq
         NxL1UeUYsNBUNbNAqGrf+rwnwVPp2dZc8Ct4x1oUWjFMo2f67GPktD66mqdKTCLXrZRL
         9rHw==
X-Forwarded-Encrypted: i=1; AJvYcCXZPIsbFrNdgzzZFnPp7cev1//zT9BnYb1A+stz6h7XKyQqFr4EAB4LLZ0yyFbuJqkg/mxebA7ICZ6jQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywey6bsY9tMYHGDBEznMJCTzOilWPgJOCSO8ZfdbFOn6gRAu9XQ
	G/+13KvZfTbGQIpUqKziXgYIagUbRfYKPh9fSgGlgPHBOb4DNPOScOjBb3xjikY=
X-Gm-Gg: ASbGncsWlL4V4MDZWi0PwfgvthzkUekSech2ZgI0vYH2uc3sfHPcaAujX8GUwd/85H9
	0a8NX/oTK30pB4G+KR1PsSJ7EfgX9VoRmPsedgk4Lg/Xg6vk+9hHFHo9ulmmb04HPvRK+MlaBa+
	iyZOpg7N/+Kl6oy/9ByjVDT6R9CxFzjHKFfH1ZKftKkXHfMm5LUYZqLJrzyKSUd9weSl2qZIoDe
	ejFo7UciZ/OVvYAzcbTTBLaKlTcd/+uyqOwT3+KCJlb8qSZGniMdWtQ0UXXSCKFuHkfoP2sjI+L
	dgcupcyyBPJLbmhN9OgqfZi3uW0zBLycv6lYcUyqUv7lDg==
X-Google-Smtp-Source: AGHT+IEfHZuAa7IrsxCaNkSR7EwHAs8m2MJ5ac0OEsbyXjAWI9w4OglgcFN0I6P8WNfULj+ZAYb2cg==
X-Received: by 2002:a17:903:283:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-2242888ab0cmr237920295ad.19.1741619625536;
        Mon, 10 Mar 2025 08:13:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 07/17] riscv: misaligned: move emulated access uniformity check in a function
Date: Mon, 10 Mar 2025 16:12:14 +0100
Message-ID: <20250310151229.2365992-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081346_049897_C27A2CDA 
X-CRM114-Status: GOOD (  11.91  )
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

U3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcwpwZXJmb3JtYW5jZSBvbiBhbGwgY3B1cyBmcm9tIGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKQp0byBpdHMgb3duIGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgZGVsZWdhdGlvbiBjaGVjay4gTm8KZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDE4ICsrKysrKysr
KysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IDdmZTI1YWRmMjUzOS4u
ZGIzMTk2NmE4MzRlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC02NzMs
MTAgKzY3MywyMCBAQCBzdGF0aWMgaW50IGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19lbXVsYXRlZCh1bnNpZ25lZCBpbnQgY3B1KQogCXJldHVybiAwOwogfQogCi1ib29sIGNoZWNr
X3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKK3N0YXRpYyBib29sIGFs
bF9jcHVzX3VuYWxpZ25lZF9zY2FsYXJfYWNjZXNzX2VtdWxhdGVkKHZvaWQpCiB7CiAJaW50IGNw
dTsKIAorCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQorCQlpZiAocGVyX2NwdShtaXNhbGlnbmVk
X2FjY2Vzc19zcGVlZCwgY3B1KSAhPQorCQkgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1ND
QUxBUl9FTVVMQVRFRCkKKwkJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorCiti
b29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKK3sKIAkv
KgogCSAqIFdlIGNhbiBvbmx5IHN1cHBvcnQgUFJfVU5BTElHTiBjb250cm9scyBpZiBhbGwgQ1BV
cyBoYXZlIG1pc2FsaWduZWQKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0YXNrcyByZXF1
ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQpAQCAtNjg0LDEwICs2OTQsOCBAQCBi
b29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAkgKi8K
IAlvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkLCBOVUxMLCAxKTsK
IAotCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQotCQlpZiAocGVyX2NwdShtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCwgY3B1KQotCQkgICAgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxB
Ul9FTVVMQVRFRCkKLQkJCXJldHVybiBmYWxzZTsKKwlpZiAoIWFsbF9jcHVzX3VuYWxpZ25lZF9z
Y2FsYXJfYWNjZXNzX2VtdWxhdGVkKCkpCisJCXJldHVybiBmYWxzZTsKIAogCXVuYWxpZ25lZF9j
dGwgPSB0cnVlOwogCXJldHVybiB0cnVlOwotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
