Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2391FC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeBR6a4fARGb+Tt7ZRQG0e0quZGS87vOfNdRRdyuU+E=; b=LuIW0BdFCdk2bn
	WlSr/T79HISonARBB1Ud1OTr4SOWUJdEaykPGhM2NFYb5nTWCwgWQS6qpAn6KZ2K6mHDvefmL5Qys
	QjV5w+vFKHQoVF687NXvkl2agbH4RGgfWWSmcFrytMLFQHy59Phl9utbrINp0/qbREq2lx6arpUZv
	DDiK/F3wXy3e5NZO+p13nkkOXHz6LDbXM2mFvT8fmyxSQM4QiTiB0aKOr9vUPlQ12XuCPQ8OIuYTK
	ZB0Gg4kT8EYmz+DQt5uxgtwvRdRTbUJP3o+OsNSG66kxk3P5shCO18BGwDQfUeazSKf8AxU2pVKQl
	/aJjj5Qfl55b0CRJdIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQn-0000000GaM4-45FV;
	Mon, 12 Aug 2024 01:01:05 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJPe-0000000GZsx-4BB7
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 00:59:56 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3db1657c0fdso2718060b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 17:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424394; x=1724029194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDiQZULOrmkIQ76w8p/0qXlEheAvD+F8k2bdCW40Dj8=;
        b=FO4zhSiEB0cd//oKILZUydXn1L11s25NgiVYcL9GLqu0tFQzVjODQ2W1k2cfS1vXrd
         gJDYydX33lrMLNhFzN/Ne/HClaY+h99tXmr1UyP/mBDtIyTUKjkQlbzcqNdeCVXnD/VL
         hSC1bNWYqxyiTXqlpNcxoJJ12dYhnJzBLOMMhm9580sdFkqOkMPxqZN0rFmgDZQAfRD1
         TThZNwG1/hqCwyQa7oS/nj8JYrV6KOtVTUNqv8wCtOJkZbytDEQXrPUICjL1MKnhJxlT
         45WzTYKNiXsNaJwkLe8EIEerBgzrMmqP4+HP+zyYCk+mY4prUuZ4WkSF7zwhqIxokRIJ
         EZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424394; x=1724029194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDiQZULOrmkIQ76w8p/0qXlEheAvD+F8k2bdCW40Dj8=;
        b=urMRWS3z6N+HgmSxjR00x/bYkZ1oCTFoCAexLvICAHkas/bUhDyEEerbUR644Lv7X8
         XM5y0l77kVoZYZAnkT45mAOCUaP60YtpasAzHdbchvOqCCrBr9usle/OJtoTMC+cRHQe
         TZ/EpQG2YAphrY9JryOjR5oOZ8pxZxFLxR3pviAR5bxXXCQf3Am2esUg0UXVoa1fN1rW
         BxlPSe/CExoD5moqwr+iZuDCE2oC0NymG9y1kAdftOfqWZLjfDXoQ69uv8R1/V/95SQ2
         msmuRx/jpaiB6JSU3IiF5bZw0U80TwizBx1dMqwSN8rUua86xiDCNg58ZK7GiI8n0U2U
         KviA==
X-Forwarded-Encrypted: i=1; AJvYcCV0VWTkXfio3oWSGAHi47M3XwnbOEQ69RsIthxH4kuRftwFVIG/u/nMKn1T1rjXCjnhLJ+cSKCHZPWF8oYM8KdbRPBbzzyYSHM5uJHyq9Lr
X-Gm-Message-State: AOJu0YzHWQ1ibRuSaZ7Vll99lSdxVD7cJO85kc2716q6zduwxOB+yN6g
	HwF6IcMmtmsKcIb945rSM6IbU98wdMHCr2MTobUFGlHefmVFfHc2+cJmwpQtEvM=
X-Google-Smtp-Source: AGHT+IFZ+1tDJ3142HVFsLE4ya3SPYZxnEcsV+61Xh8a+xb4OPG7zVmGoKf++d88AMIRm4sWlhcOOQ==
X-Received: by 2002:a05:6808:2185:b0:3db:fe8:f744 with SMTP id 5614622812f47-3dc4168aac0mr9047447b6e.24.1723424393786;
        Sun, 11 Aug 2024 17:59:53 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.17.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 17:59:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 02/17] ACPI: scan: Add a weak arch_sort_irqchip_probe() to order the IRQCHIP probe
Date: Mon, 12 Aug 2024 06:29:14 +0530
Message-ID: <20240812005929.113499-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_175955_057105_7B8E4061 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="cp1252"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VW5saWtlIE9GIGZyYW1ld29yaywgdGhlIGlycWNoaXAgcHJvYmUgdXNpbmcgSVJRQ0hJUF9BQ1BJ
X0RFQ0xBUkUgaGFzIG5vCm9yZGVyIGRlZmluZWQuIERlcGVuZGluZyBvbiB0aGUgTWFrZWZpbGUg
aXMgbm90IGEgZ29vZCBpZGVhLiBTbywKdXN1YWxseSBpdCBpcyB3b3JrZWQgYXJvdW5kIGJ5IG1h
bmRhdGluZyBvbmx5IHJvb3QgaW50ZXJydXB0IGNvbnRyb2xsZXIKcHJvYmVkIHVzaW5nIElSUUNI
SVBfQUNQSV9ERUNMQVJFIGFuZCBvdGhlciBpbnRlcnJ1cHQgY29udHJvbGxlcnMgYXJlCnByb2Jl
ZCB2aWEgY2FzY2FkZSBtZWNoYW5pc20uCgpIb3dldmVyLCB0aGlzIGlzIGFsc28gbm90IGEgY2xl
YW4gc29sdXRpb24gYmVjYXVzZSBpZiB0aGVyZSBhcmUgbXVsdGlwbGUKcm9vdCBjb250cm9sbGVy
cyAoZXg6IFJJTlRDIGluIFJJU0MtViB3aGljaCBpcyBwZXIgQ1BVKSB3aGljaCBuZWVkIHRvIGJl
CnByb2JlZCBmaXJzdCwgdGhlbiB0aGUgY2FzY2FkZSB3aWxsIGhhcHBlbiBmb3IgZXZlcnkgcm9v
dCBjb250cm9sbGVyLgpTbywgaW50cm9kdWNlIGFuIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyB3ZWFr
IGZ1bmN0aW9uCmFyY2hfc29ydF9pcnFjaGlwX3Byb2JlKCkgdG8gb3JkZXIgdGhlIHByb2Jpbmcg
b2YgdGhlIGludGVycnVwdApjb250cm9sbGVycyB3aGljaCBjYW4gYmUgaW1wbGVtZW50ZWQgYnkg
ZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgYXMgcGVyCnRoZWlyIGludGVycnVwdCBjb250cm9sbGVy
IGhpZXJhcmNoeS4KClNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWlj
cm8uY29tPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0t
CiBkcml2ZXJzL2FjcGkvc2Nhbi5jICB8IDMgKysrCiBpbmNsdWRlL2xpbnV4L2FjcGkuaCB8IDIg
KysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9hY3BpL3NjYW4uYyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKaW5kZXggNTk3NzE0MTI2ODZiLi41
MmE5ZGZjOGUxOGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNwaS9zY2FuLmMKKysrIGIvZHJpdmVy
cy9hY3BpL3NjYW4uYwpAQCAtMjc1NSw2ICsyNzU1LDggQEAgc3RhdGljIGludCBfX2luaXQgYWNw
aV9tYXRjaF9tYWR0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAqaGVhZGVyLAogCXJldHVy
biAwOwogfQogCit2b2lkIF9fd2VhayBhcmNoX3NvcnRfaXJxY2hpcF9wcm9iZShzdHJ1Y3QgYWNw
aV9wcm9iZV9lbnRyeSAqYXBfaGVhZCwgaW50IG5yKSB7IH0KKwogaW50IF9faW5pdCBfX2FjcGlf
cHJvYmVfZGV2aWNlX3RhYmxlKHN0cnVjdCBhY3BpX3Byb2JlX2VudHJ5ICphcF9oZWFkLCBpbnQg
bnIpCiB7CiAJaW50IGNvdW50ID0gMDsKQEAgLTI3NjMsNiArMjc2NSw3IEBAIGludCBfX2luaXQg
X19hY3BpX3Byb2JlX2RldmljZV90YWJsZShzdHJ1Y3QgYWNwaV9wcm9iZV9lbnRyeSAqYXBfaGVh
ZCwgaW50IG5yKQogCQlyZXR1cm4gMDsKIAogCW11dGV4X2xvY2soJmFjcGlfcHJvYmVfbXV0ZXgp
OworCWFyY2hfc29ydF9pcnFjaGlwX3Byb2JlKGFwX2hlYWQsIG5yKTsKIAlmb3IgKGFwZSA9IGFw
X2hlYWQ7IG5yOyBhcGUrKywgbnItLSkgewogCQlpZiAoQUNQSV9DT01QQVJFX05BTUVTRUcoQUNQ
SV9TSUdfTUFEVCwgYXBlLT5pZCkpIHsKIAkJCWFjcGlfcHJvYmVfY291bnQgPSAwOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9hY3BpLmggYi9pbmNsdWRlL2xpbnV4L2FjcGkuaAppbmRleCAw
Njg3YTQ0MmZlYzcuLjNmZmY4NmY5NWMyZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9hY3Bp
LmgKKysrIGIvaW5jbHVkZS9saW51eC9hY3BpLmgKQEAgLTEzNDMsNiArMTM0Myw4IEBAIHN0cnVj
dCBhY3BpX3Byb2JlX2VudHJ5IHsKIAlrZXJuZWxfdWxvbmdfdCBkcml2ZXJfZGF0YTsKIH07CiAK
K3ZvaWQgYXJjaF9zb3J0X2lycWNoaXBfcHJvYmUoc3RydWN0IGFjcGlfcHJvYmVfZW50cnkgKmFw
X2hlYWQsIGludCBucik7CisKICNkZWZpbmUgQUNQSV9ERUNMQVJFX1BST0JFX0VOVFJZKHRhYmxl
LCBuYW1lLCB0YWJsZV9pZCwgc3VidGFibGUsCVwKIAkJCQkgdmFsaWQsIGRhdGEsIGZuKQkJCVwK
IAlzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfcHJvYmVfZW50cnkgX19hY3BpX3Byb2JlXyMjbmFt
ZQlcCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
