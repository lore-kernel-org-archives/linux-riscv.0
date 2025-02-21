Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4416C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9fDrrYpNE0FocQ/dpWLcBDDyuVQdM6n1DalHmOzbCk=; b=bLXG0DCn8u3kEG
	TyEnTBIAgpr0SGIV4hYUek2xegjRNovJo393PXzDFmjmrSGWjYy4BQIOWrnh8Or8y8FNpOKgXhKvm
	zBOqa4aKN8Fw2VaUXlj+Rx1PuqLYeEsyXkOW8AWvlmLDfl+9359nZ8hdGvkkYxAFqU0w9+KuR6rqU
	lLzyHBMvivLW5Zb5+F9lWdebw3NbbUBYHsSW+nHh9bVh2TswAiISVOUOSYE1CUewdW1MdfFzdDnNa
	Jm+qqdTjdNcuXS000lqtt9s/rtfjDlGZUzl57za3yLuvayUkGIKS0wFsB3RQ6y+p3kHT0KkBY3Zqf
	/t/cf8GuXRbIfxQ1Nv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT5-00000005tws-3keu;
	Fri, 21 Feb 2025 14:57:31 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT2-00000005ttk-2Zmk
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:29 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso14178925e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149847; x=1740754647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuV5PBYNprCWaplq1fE9KG6ZTDkt+mehdrAbLFdmJ0U=;
        b=et3wcMdJ/mIhYDyo1qh3IWrmTe/znuRGoQR85oAZUowY90S7IQEaIzgBLbdm1Hw62X
         3v8f5Uurckx7aeva6xqvU3SwQ9ogJzmU03LVB9R3opgNrUrOIgO6lEdiav0uv6TE+r+V
         j6DiURMyaX38+U35Qly7Gbv5Hn8zggIe8BNuO0cQOKSCk8K75C790eDE0amj/2pVlbrZ
         jduljrFEdk9Fzv6atWuJ3Y2uBD59Wm/rcBqcosJa3CGI2U4vicOaZxiEzfDR1cFpm1Uz
         yw703HcjaicgCYxA9sg7RWBTEDXv9CXPnp1xEcIbm6I956/yPm0GpasjofD276uz1R/n
         Ic7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149847; x=1740754647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuV5PBYNprCWaplq1fE9KG6ZTDkt+mehdrAbLFdmJ0U=;
        b=vMt6eWQYKQLm7qojCIPECxqKXFCtuFQ8jBqfwAjbvfetGkJRSdKerUL5dvBOGHvvti
         IHj4oLC4FTyuHzKKYXKMw66Nb+Nz7YLEBxky72CtySJViR0QCPXjgVRBTSwPC9nDw8o4
         kxzFGqHVFfjVj1ThIMFuceXg351GULSlWeb5LQR4YmUqcJE6Ko6WpPjBcyVYsbTiRHSs
         T9dHzjbYXyPEP9XjO5LTc4omJN6tPgMJyrSH2iP/AUkwila4dsl/RQhXDNUBml7Uf+Xc
         CU7NXQG6waRogDoiJ24zf68MTWH8Gek8c68OxXw0oMCT5KsNxkJCWjfgv0dpyBHU+Qxy
         gMMA==
X-Gm-Message-State: AOJu0YxySkkckOggRbypyQt4drNtkcnuP+/OGe/kiATXi2noVa+UGWe6
	wafxxoInW2q2GNhC06PeAcscNjkvySCO/6Fr6uSmK8tU22USYcie3gLXgWtNqI5fkQnzWd1FsTA
	2
X-Gm-Gg: ASbGncvHCXnD7TQ0pih1mVo1TcOtrT7mDbSUSDcYDfdhPgUCDuq6Td7t2GsKfON7d7i
	7QWK+LZ5oBZHmYHfBl3b033Ir0gd5VzZKJaVWV1iiyS+cwAgroD1NWeyW98q76BWpBzVTxURK2C
	rs+Ri3gHc7gOgerUGUI51Wvv+JLvNfQ78mD45kK6mNWiujqqlqlkeXHE5vXBkI0Q5Eb1tx5uL1U
	tMFIaALFFv1dSYzAyleSXzxbJiSV4GqFdTr/KLBPCpuCRLGD7Y3Xo+EYrPEuC8d+Ef1YVOe++ua
	54Fk00idaCCWxQ==
X-Google-Smtp-Source: AGHT+IGHZnZDVV5eRijtS6wrNNcgTs4f/Eq2MbcFOsu4rDM5Dk/QukfiIU0puOl95OM+JkdtWtwE1A==
X-Received: by 2002:a05:600c:3515:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-439ae1e6ee6mr35034335e9.11.1740149846766;
        Fri, 21 Feb 2025 06:57:26 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcf08sm23925368f8f.36.2025.02.21.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:26 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 5/8] riscv: Fix set up of cpu hotplug callbacks
Date: Fri, 21 Feb 2025 15:57:24 +0100
Message-ID: <20250221145718.115076-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065728_650895_DAA17025 
X-CRM114-Status: GOOD (  12.50  )
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

Q1BVIGhvdHBsdWcgY2FsbGJhY2tzIHNob3VsZCBiZSBzZXQgdXAgZXZlbiBpZiB3ZSBkZXRlY3Rl
ZCBhbGwKY3VycmVudCBjcHVzIGVtdWxhdGUgbWlzYWxpZ25lZCBhY2Nlc3Nlcywgc2luY2Ugd2Ug
d2FudCB0bwplbnN1cmUgb3VyIGV4cGVjdGF0aW9ucyBvZiBhbGwgY3B1cyBlbXVsYXRpbmcgaXMg
bWFpbnRhaW5lZC4KCkZpeGVzOiA2ZTVjZTdmMmVhZTMgKCJyaXNjdjogRGVjb3VwbGUgZW11bGF0
ZWQgdW5hbGlnbmVkIGFjY2Vzc2VzIGZyb20gYWNjZXNzIHNwZWVkIikKRml4ZXM6IGU3YzlkNjZl
MzEzYiAoIlJJU0MtVjogUmVwb3J0IHZlY3RvciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIGh3cHJv
YmUiKQpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgotLS0KIGFy
Y2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8IDI3ICsrKysrKysrKysr
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3Nw
ZWVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKaW5kZXgg
NzgwZjFjNWY1MTJhLi5jOWQzMjM3NjQ5YmIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWdu
ZWRfYWNjZXNzX3NwZWVkLmMKQEAgLTI0NywxMyArMjQ3LDYgQEAgc3RhdGljIHZvaWQgX19pbml0
IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCkKIAkvKiBDaGVjayBj
b3JlIDAuICovCiAJc21wX2NhbGxfb25fY3B1KDAsIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MsIGJ1
ZnNbMF0sIHRydWUpOwogCi0JLyoKLQkgKiBTZXR1cCBob3RwbHVnIGNhbGxiYWNrcyBmb3IgYW55
IG5ldyBDUFVzIHRoYXQgY29tZSBvbmxpbmUgb3IgZ28KLQkgKiBvZmZsaW5lLgotCSAqLwotCWNw
dWhwX3NldHVwX3N0YXRlX25vY2FsbHMoQ1BVSFBfQVBfT05MSU5FX0RZTiwgInJpc2N2Om9ubGlu
ZSIsCi0JCQkJICByaXNjdl9vbmxpbmVfY3B1LCByaXNjdl9vZmZsaW5lX2NwdSk7Ci0KIG91dDoK
IAlmb3JfZWFjaF9jcHUoY3B1LCBjcHVfb25saW5lX21hc2spIHsKIAkJaWYgKGJ1ZnNbY3B1XSkK
QEAgLTM4MywxMyArMzc2LDYgQEAgc3RhdGljIGludCBfX2luaXQgdmVjX2NoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCAqdW51c2VkIF9fYWx3YXkKIHsKIAlzY2hlZHVs
ZV9vbl9lYWNoX2NwdShjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzcyk7CiAKLQkvKgotCSAq
IFNldHVwIGhvdHBsdWcgY2FsbGJhY2tzIGZvciBhbnkgbmV3IENQVXMgdGhhdCBjb21lIG9ubGlu
ZSBvciBnbwotCSAqIG9mZmxpbmUuCi0JICovCi0JY3B1aHBfc2V0dXBfc3RhdGVfbm9jYWxscyhD
UFVIUF9BUF9PTkxJTkVfRFlOLCAicmlzY3Y6b25saW5lIiwKLQkJCQkgIHJpc2N2X29ubGluZV9j
cHVfdmVjLCBOVUxMKTsKLQogCXJldHVybiAwOwogfQogI2Vsc2UgLyogQ09ORklHX1JJU0NWX1BS
T0JFX1ZFQ1RPUl9VTkFMSUdORURfQUNDRVNTICovCkBAIC00MTUsNiArNDAxLDE5IEBAIHN0YXRp
YyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKIAkJCSAg
ICBOVUxMLCAidmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMiKTsKIAl9
CiAKKwkvKgorCSAqIFNldHVwIGhvdHBsdWcgY2FsbGJhY2tzIGZvciBhbnkgbmV3IENQVXMgdGhh
dCBjb21lIG9ubGluZSBvciBnbworCSAqIG9mZmxpbmUuCisJICovCisjaWZkZWYgQ09ORklHX1JJ
U0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MKKwljcHVocF9zZXR1cF9zdGF0ZV9ub2NhbGxzKENQ
VUhQX0FQX09OTElORV9EWU4sICJyaXNjdjpvbmxpbmUiLAorCQkJCSAgcmlzY3Zfb25saW5lX2Nw
dSwgcmlzY3Zfb2ZmbGluZV9jcHUpOworI2VuZGlmCisjaWZkZWYgQ09ORklHX1JJU0NWX1BST0JF
X1ZFQ1RPUl9VTkFMSUdORURfQUNDRVNTCisJY3B1aHBfc2V0dXBfc3RhdGVfbm9jYWxscyhDUFVI
UF9BUF9PTkxJTkVfRFlOLCAicmlzY3Y6b25saW5lIiwKKwkJCQkgIHJpc2N2X29ubGluZV9jcHVf
dmVjLCBOVUxMKTsKKyNlbmRpZgorCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuNDguMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
