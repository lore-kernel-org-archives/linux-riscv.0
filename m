Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974A1C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpIxgjpRG2soh/O10soSMflzFjLJZSQhqvfPER/z+t4=; b=o1nYG1pd2Lucb9
	15tXoDP8m0b2/yXeNbHxBWiM3ZkWmT4wQDhQ9HCS1t/A/MmDfUAQAgdxq1cMr4/JYsnRoXzEhv/9l
	rB7J/6h5dPcsqhiPotAqrOdRv3uBFhBDHOiib1VyVskIZAHP1qb/lgxU2Dzd3OmKfV39Qp52uyPeK
	pBtc5aBD+6c3vMxpnnWwPVtj4asRa7XVLJMP2+L7P5KNogjQ5AikqepkfXFM/5NLzdm6Hdbji3tno
	KVlFzyvt9twxRGqlHkJBLQZt20GDinWqTV3itVO25ecChhlmEDQEhIUiON/EhWVykaMwnGkxMDs6N
	keVtXM0RPOptc65zoVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJTo-0000000Gba4-0Emk;
	Mon, 12 Aug 2024 01:04:12 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQB-0000000Ga5B-0A6p
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:28 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-39c2f653efcso6923445ab.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424426; x=1724029226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBzMby0USGxgSPaQIBT4AQA8EH7Ak7bVCmTWfoSfRt4=;
        b=TwR8wvBOYpvP9grUpBtoUmEyc9Ap1r1qzoemFRki5IV+KYuFi212lSap+ch/0QCnWI
         Nu0PlMQIzgyizQfYOfSXNKVG8Y6rQ2EfX5QTtLHaFw7eQo8GwN0ApxTbeJNnMDXfm12i
         b3cXmTy5J5Itg3WF+AlQouzT8Iu5SrusFZkU22IjtgyC3walx58y4H4MsBUrPUyejR1b
         FylmOpIDSVHHhoZUueicIB4oC9KoKGv60HB0ZdvGKA3qnf0WOG1kpUvvU/8xBKdy78NK
         On0+YasNegq1r1kZPQED7razlnsvVV+oKla5w7ndPORFE2AYkjjlZ16kuPAwRSyoTx4F
         BNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424426; x=1724029226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBzMby0USGxgSPaQIBT4AQA8EH7Ak7bVCmTWfoSfRt4=;
        b=u8c0O7qGvDaaTv8QhFFibngGAhwq0wHQeg7/0AW5dj2l4fUcxACXYMc4U5NElyXxBk
         haUr1FrDRNPW1dMXWaWawqLQUpZ9veYcZFawWKE2I/HfdHL+3837bM7dNERtxB2KPf9D
         Fn/sjrvfUaiJGnZrfdSTpVMRFxH3T6qaoRjSMUltl+zuQRqIALQRSSc0ktd0CzvJ03b7
         PyT8Z7skBvuJZwzDoqjuU3uNfSephAnPRilAaG6sIueuIFVOdPtYfQkzWDJLe6g8kFrU
         WH+POe1tyUnbxytIiVlBa7JvzZfIDOi21QbfD2IC0RQ2gMcR+ebEy2ll2YKSAlZ8L2DT
         wn5g==
X-Forwarded-Encrypted: i=1; AJvYcCUmIqmh0ppPUe7qci8/pR7X32/OJBpZgzGI0U0aN4ssNokZuTPU+nBstq06oxE+73cZ7cVZBGkRjZRiA0+x88uiHAMmFVWwu4YQ2Q1X/WaJ
X-Gm-Message-State: AOJu0YwliGXSLib5FpHsBv9/tnppZP9GXo1B1ZWcx2T+3lsrZIAvLN6H
	ovwHvWU/rTX+8W0qc0/4DXJQV424mUwWOeMNU5KH5X/bylAfy12gylB+O7FF6KU=
X-Google-Smtp-Source: AGHT+IGLgGjZy1f4lXkyD9IeGxkMxZC7bl0GKZ86dlIJhEZNBpnAOTW5ak8/coJIxlUXH7m3lfD9qw==
X-Received: by 2002:a05:6e02:20c9:b0:39a:ea4c:8c26 with SMTP id e9e14a558f8ab-39b7a475a0amr105191515ab.1.1723424424986;
        Sun, 11 Aug 2024 18:00:24 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 07/17] ACPI: bus: Add RINTC IRQ model for RISC-V
Date: Mon, 12 Aug 2024 06:29:19 +0530
Message-ID: <20240812005929.113499-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180027_117931_2A09FA84 
X-CRM114-Status: GOOD (  10.16  )
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

QWRkIHRoZSBJUlEgbW9kZWwgZm9yIFJJU0MtViBJTlRDIHNvIHRoYXQgYWNwaV9zZXRfaXJxX21v
ZGVsIGNhbiB1c2UgdGhpcwpmb3IgUklTQy1WLgoKU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
cml2b3NpbmMuY29tPgotLS0KIGRyaXZlcnMvYWNwaS9idXMuYyAgIHwgMyArKysKIGluY2x1ZGUv
bGludXgvYWNwaS5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9idXMuYyBiL2RyaXZlcnMvYWNwaS9idXMuYwppbmRleCA0
OGQyNzc2NTcyMDMuLjE2OTE3ZGMzYWQ2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9hY3BpL2J1cy5j
CisrKyBiL2RyaXZlcnMvYWNwaS9idXMuYwpAQCAtMTIwMyw2ICsxMjAzLDkgQEAgc3RhdGljIGlu
dCBfX2luaXQgYWNwaV9idXNfaW5pdF9pcnEodm9pZCkKIAljYXNlIEFDUElfSVJRX01PREVMX0xQ
SUM6CiAJCW1lc3NhZ2UgPSAiTFBJQyI7CiAJCWJyZWFrOworCWNhc2UgQUNQSV9JUlFfTU9ERUxf
UklOVEM6CisJCW1lc3NhZ2UgPSAiUklOVEMiOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlwcl9p
bmZvKCJVbmtub3duIGludGVycnVwdCByb3V0aW5nIG1vZGVsXG4iKTsKIAkJcmV0dXJuIC1FTk9E
RVY7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2FjcGkuaCBiL2luY2x1ZGUvbGludXgvYWNw
aS5oCmluZGV4IDg5MjAyNWQ4NzNmMC4uM2EyMWYxY2YxMjZmIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2xpbnV4L2FjcGkuaAorKysgYi9pbmNsdWRlL2xpbnV4L2FjcGkuaApAQCAtMTA3LDYgKzEwNyw3
IEBAIGVudW0gYWNwaV9pcnFfbW9kZWxfaWQgewogCUFDUElfSVJRX01PREVMX1BMQVRGT1JNLAog
CUFDUElfSVJRX01PREVMX0dJQywKIAlBQ1BJX0lSUV9NT0RFTF9MUElDLAorCUFDUElfSVJRX01P
REVMX1JJTlRDLAogCUFDUElfSVJRX01PREVMX0NPVU5UCiB9OwogCi0tIAoyLjQzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
