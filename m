Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6A0C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9fDrrYpNE0FocQ/dpWLcBDDyuVQdM6n1DalHmOzbCk=; b=tm7/LlcbsqQIIZ
	J6efxyVLe0gzVSqpnJrJfGjW4TsGVNzWhaYMi1C289VkRUxuuEdVChooaRru7T9boZNBNaEK58x8S
	gRnjQBMXLhSJJZqrDCHgHPAHrZxFJOHqo09H8mR/l3uZS4gI53qrer4e3l2yZ3vVzXZbco6ikHIvb
	qoxvkX72eK//bRDpfWW3eR70u1u0jcwYy9FwlfH89v63l/l0byrRvjOtPNfuM/Nt3l9wrr493a64C
	d/WLAx3L+A2nX0BrZIV/y3213QGuCqT+/KP9PR68kRLFnWbVrtrkHkjXjQCPFx23dAS50uSH9rCyv
	rPfHK1DElfPaOZkkkxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6k-00000004Zj1-1aRS;
	Tue, 04 Mar 2025 12:10:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwh-00000004V8M-26aR
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-390f5556579so2145538f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089622; x=1741694422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuV5PBYNprCWaplq1fE9KG6ZTDkt+mehdrAbLFdmJ0U=;
        b=M6mit9Wa9WzsEGxd1TaedSBng5J5cr6fQZUvTwkHvOnT1WRNoE+NGzSeXDRgHEtNFv
         GdOvXCLNhBAiBTYOUpcAd+tgWjDgBDy07Mnz0tgwQpbCqjORJuj2ordhctYnLWWJokYs
         FSPOToK65v2rEgec0vAzPU1W+7yyx+s1Nos/Ti9FZH3t5eHrGkC0LBO3jKj4UVvTKW1f
         1T8RRrVuUUB8QL7/tzRZcgZdYKtoaFTmD9pyrGzON6IAUDVfb1FIC/HNY0uKaUeI6bQr
         5h50JnxgOpXnJzaTSWo63n7hdCNqnVBkttvro2Zd2nvIInLsFoaOy+BN7O4DFtYI9CyY
         yYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089622; x=1741694422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuV5PBYNprCWaplq1fE9KG6ZTDkt+mehdrAbLFdmJ0U=;
        b=S33+HCJ2MvGRr74BOurbzNmC6moYIZd8gCa2V6EvmdCYUvKxEaZMJ+PIFOBfgSGcwn
         5f7TWK4paGSJSH5dSeamP0fXTYiJ9P1PM4/cdj34+ch7cTW6mlloOysJFXoY9ue9hyn8
         /Ivv8q6AxyKTmiLjUtSRC093lsZr69qb2U5uXRxHCuXYnG7OEvd2C7MBs3CFlBRprCPW
         fvKntx0OfBMTT1KraaxErrg/9PNEkK65vzor1lV7XekLN7NBJ5LOZ9oMNLuWnhgDnixl
         uAuOwanvAv9AMniUqXCRdvRJ/etNV9CucOuEz973c0sHNO4lyeFEeDkhZaMO4+kep9Mk
         3p7Q==
X-Gm-Message-State: AOJu0YxzhBSoE+r9CSiKbU6zuhkjyRAK20R8LuxeHGo+CUqWcO/4r3hn
	VaQuvnok4V524BEi50nFdjpal9FvvaTrTWxnx+NAgrttpPUhTkINtmIZlGSyYxXjzMgQpIaJD4P
	M
X-Gm-Gg: ASbGncsOfn0knCnV+hKxq8NfF6mjFeKmet+E4a9FubokrcvDYC7rkWuzA4EJ4lpmvD9
	Vn0JS4yIWBrOWtYw5AbApIdHQmSQqHepY7HvwGaKvCiOfXO3Rg165RSDguuA4WGtYeE/izSZYCT
	zror2QJydt2ZERImoEUIDt6nTV+Izugbahp84ImdJdhSozDJgY7w2Mb04K+Ipe5M+z/t7quGd8g
	VxisADfvTMeJ/9cmKZZzQJmF/P7vbg6OjyWAX0ZWHzUZh51PZCl7JAt8VaH530KMvJtho6Rk6wa
	ZPiH+5wENBb6/r2xXY7QK7JflWrKcDZF
X-Google-Smtp-Source: AGHT+IGcci4G63CqfkUGtRt/jLkQ1vLNMVzi6Jgp49YWUaQ3MwCP8mUgjvhFVQaeb/Hx3FHq79pKNw==
X-Received: by 2002:a05:6000:42c9:b0:38f:43c8:f765 with SMTP id ffacd0b85a97d-390ec7d2e69mr10172733f8f.26.1741089621937;
        Tue, 04 Mar 2025 04:00:21 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844892sm17593655f8f.64.2025.03.04.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:21 -0800 (PST)
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
Subject: [PATCH v3 5/8] riscv: Fix set up of cpu hotplug callbacks
Date: Tue,  4 Mar 2025 13:00:20 +0100
Message-ID: <20250304120014.143628-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040023_540049_8486DA8B 
X-CRM114-Status: GOOD (  13.42  )
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
