Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC43C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ig7Nyh0Lix1wFtgFD/mV8Htlgv+BpsAkaEdnH0asbsA=; b=tmMqzA5kjdGUzM
	LEmhCONYl/Usl2Upwt8mJD6wBmEp2f+ODJobOGkB6NvmELsjeefPaq8DfLNF4LRJJhg/zt2BcoMI8
	U2bvTwy8q/GibgPJg48tglf4+RO2flRDlwcpQdjAiaWmt32Bl7LX2h01CFfxvddl0h176/3iZVbgC
	VbOFyLfoy5t8wr+AUk9447EVjuwzJR0MANZK97F5Xkn1mHn8w8Fw9dWUF8M/jxtKAuTu3SU8trg5m
	EAOjD2cmr3vwYL/JvMvAXN9GgMPafSc+jIHHGMp2pJ5zO9gxogknbqT1D+5Rd6xdjHf8OyYk/AEVC
	53DhdTY3q1u2yR/x6Bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJV4-0000000GbtR-3WkG;
	Mon, 12 Aug 2024 01:05:30 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQM-0000000GaAZ-4B7d
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:41 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3db1e4219f8so2164465b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424438; x=1724029238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yHv4RQ+8m8uuAieiHb/ndAopbPkfvfPnrF/+OTZxeU=;
        b=ieLdqa8apK66DuwDSNsKIahqT4dyxxHmRFsZddYZnHeEzpASlUGhIz3A/DH9p7ZNXx
         BiIM/PxSw1xceZeWYEixLrIcgbdQXNCHIHxjMh2rktV9dYTXVlfb0py7hJSiw2bm6xl8
         BmSTi6Yb8YyoCux7wUUgWe8B4fP5wsRAim5qD2i/e0PqX2REtLwQZPduHylRPcNbPyfb
         VE/gDOs57QOZb8ezIJPCYNB9oOFeivytm//jiQ0p0WrnuIISvpUccU/K4UY1n71wrmx9
         o7wjUo+v5CEr/KEHXb83GFa5pseXYM7/RwyYDQgFdFimDcH0Xj94IxlVeuUgWqqqlRCf
         4l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424438; x=1724029238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yHv4RQ+8m8uuAieiHb/ndAopbPkfvfPnrF/+OTZxeU=;
        b=srR5fQIK86KTW75kqeO1zZD9raCXnPxWyahXxZZgLBgG1OfGTFcYdLaWQel8EnKqXp
         SWKjA0X/Edw8ueTg607ZS3zOiacHn3mt7Nz5j2ZE+HaDkzCom4ehYGAKaxmZEPx4KrXY
         9dw7OzJVsvdcpSrDOgPcI3CrUU/9LT0JtaA9VimIvH48FgoKb+E7gCkUhl7OLk/SKzlp
         /rHD9C0CR9/3DOFGYXjVYWEtMYQk5THfNM6+uPG3+6K2o6TeQRMopVn7I1CSed8SESkR
         xI7Q0yOwumQrhPbSBOmNNr+6l2k6cWq+RHqkW0GQZcEUz4ge0/sr1YkyFb+mWEhXW1xI
         0ndg==
X-Forwarded-Encrypted: i=1; AJvYcCUDc5NFRYPqsY94fbY8SDUsCSALbM/843fAxTDDAO3wUlx/qv8TrAsosGVW1AxyrU1dQYeEaZIJWrUNUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaBrwCS4CO1An3dhpVEmRkft17AhtIKog6UCQZXWdS5zcPnQ9O
	I4hCtuwp+D7EAS8bTKLUSAFzoVIXGxFmL3a1GMJmV6mGZh09dXrfTOS4nbEU6ak=
X-Google-Smtp-Source: AGHT+IFun0gorfvtl1RVjdN/jm32amrHRkag2ROgDMVcRhqDHKcAfRdwMw49PRBtm4+7+S1MCEJ11g==
X-Received: by 2002:a05:6808:16a0:b0:3db:fe8:f74c with SMTP id 5614622812f47-3dc41689574mr7836368b6e.24.1723424437728;
        Sun, 11 Aug 2024 18:00:37 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:37 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 09/17] ACPI: RISC-V: Implement PCI related functionality
Date: Mon, 12 Aug 2024 06:29:21 +0530
Message-ID: <20240812005929.113499-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180039_079493_DAC69985 
X-CRM114-Status: GOOD (  13.88  )
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

UmVwbGFjZSB0aGUgZHVtbXkgaW1wbGVtZW50YXRpb24gZm9yIFBDSSByZWxhdGVkIGZ1bmN0aW9u
cyB3aXRoIGFjdHVhbAppbXBsZW1lbnRhdGlvbi4gVGhpcyBuZWVkcyBFQ0FNIGFuZCBNQ0ZHIENP
TkZJRyBvcHRpb25zIHRvIGJlIGVuYWJsZWQKZm9yIFJJU0MtVi4KClNpZ25lZC1vZmYtYnk6IFN1
bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgfCAg
MiArKwogYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIHwgMzMgKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tCiBkcml2ZXJzL3BjaS9wY2ktYWNwaS5jICAgfCAgMiArLQogMyBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggMGYzY2Q3YzNhNDM2
Li5hMjY5ZTU3NzI4NGUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNo
L3Jpc2N2L0tjb25maWcKQEAgLTEzLDYgKzEzLDcgQEAgY29uZmlnIDMyQklUCiBjb25maWcgUklT
Q1YKIAlkZWZfYm9vbCB5CiAJc2VsZWN0IEFDUElfR0VORVJJQ19HU0kgaWYgQUNQSQorCXNlbGVj
dCBBQ1BJX01DRkcgaWYgKEFDUEkgJiYgUENJKQogCXNlbGVjdCBBQ1BJX1BQVFQgaWYgQUNQSQog
CXNlbGVjdCBBQ1BJX1JFRFVDRURfSEFSRFdBUkVfT05MWSBpZiBBQ1BJCiAJc2VsZWN0IEFDUElf
U1BDUl9UQUJMRSBpZiBBQ1BJCkBAIC0xODgsNiArMTg5LDcgQEAgY29uZmlnIFJJU0NWCiAJc2Vs
ZWN0IE9GX0VBUkxZX0ZMQVRUUkVFCiAJc2VsZWN0IE9GX0lSUQogCXNlbGVjdCBQQ0lfRE9NQUlO
U19HRU5FUklDIGlmIFBDSQorCXNlbGVjdCBQQ0lfRUNBTSBpZiAoQUNQSSAmJiBQQ0kpCiAJc2Vs
ZWN0IFBDSV9NU0kgaWYgUENJCiAJc2VsZWN0IFJJU0NWX0FMVEVSTkFUSVZFIGlmICFYSVBfS0VS
TkVMCiAJc2VsZWN0IFJJU0NWX0FQTElDCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9h
Y3BpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMKaW5kZXggYmE5NTdhYWNhNWNiLi42ZTBk
MzMzZjU3ZTUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9hY3BpLmMKQEAgLTMxMSwyOSArMzExLDI2IEBAIHZvaWQgX19pb21lbSAq
YWNwaV9vc19pb3JlbWFwKGFjcGlfcGh5c2ljYWxfYWRkcmVzcyBwaHlzLCBhY3BpX3NpemUgc2l6
ZSkKICNpZmRlZiBDT05GSUdfUENJCiAKIC8qCi0gKiBUaGVzZSBpbnRlcmZhY2VzIGFyZSBkZWZp
bmVkIGp1c3QgdG8gZW5hYmxlIGJ1aWxkaW5nIEFDUEkgY29yZS4KLSAqIFRPRE86IFVwZGF0ZSBp
dCB3aXRoIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiB3aGVuIGV4dGVybmFsIGludGVycnVwdAotICog
Y29udHJvbGxlciBzdXBwb3J0IGlzIGFkZGVkIGluIFJJU0MtViBBQ1BJLgorICogcmF3X3BjaV9y
ZWFkL3dyaXRlIC0gUGxhdGZvcm0tc3BlY2lmaWMgUENJIGNvbmZpZyBzcGFjZSBhY2Nlc3MuCiAg
Ki8KLWludCByYXdfcGNpX3JlYWQodW5zaWduZWQgaW50IGRvbWFpbiwgdW5zaWduZWQgaW50IGJ1
cywgdW5zaWduZWQgaW50IGRldmZuLAotCQkgaW50IHJlZywgaW50IGxlbiwgdTMyICp2YWwpCitp
bnQgcmF3X3BjaV9yZWFkKHVuc2lnbmVkIGludCBkb21haW4sIHVuc2lnbmVkIGludCBidXMsCisJ
CSB1bnNpZ25lZCBpbnQgZGV2Zm4sIGludCByZWcsIGludCBsZW4sIHUzMiAqdmFsKQogewotCXJl
dHVybiBQQ0lCSU9TX0RFVklDRV9OT1RfRk9VTkQ7CisJc3RydWN0IHBjaV9idXMgKmIgPSBwY2lf
ZmluZF9idXMoZG9tYWluLCBidXMpOworCisJaWYgKCFiKQorCQlyZXR1cm4gUENJQklPU19ERVZJ
Q0VfTk9UX0ZPVU5EOworCXJldHVybiBiLT5vcHMtPnJlYWQoYiwgZGV2Zm4sIHJlZywgbGVuLCB2
YWwpOwogfQogCi1pbnQgcmF3X3BjaV93cml0ZSh1bnNpZ25lZCBpbnQgZG9tYWluLCB1bnNpZ25l
ZCBpbnQgYnVzLCB1bnNpZ25lZCBpbnQgZGV2Zm4sCi0JCSAgaW50IHJlZywgaW50IGxlbiwgdTMy
IHZhbCkKK2ludCByYXdfcGNpX3dyaXRlKHVuc2lnbmVkIGludCBkb21haW4sIHVuc2lnbmVkIGlu
dCBidXMsCisJCSAgdW5zaWduZWQgaW50IGRldmZuLCBpbnQgcmVnLCBpbnQgbGVuLCB1MzIgdmFs
KQogewotCXJldHVybiBQQ0lCSU9TX0RFVklDRV9OT1RfRk9VTkQ7CisJc3RydWN0IHBjaV9idXMg
KmIgPSBwY2lfZmluZF9idXMoZG9tYWluLCBidXMpOworCisJaWYgKCFiKQorCQlyZXR1cm4gUENJ
QklPU19ERVZJQ0VfTk9UX0ZPVU5EOworCXJldHVybiBiLT5vcHMtPndyaXRlKGIsIGRldmZuLCBy
ZWcsIGxlbiwgdmFsKTsKIH0KIAotaW50IGFjcGlfcGNpX2J1c19maW5kX2RvbWFpbl9ucihzdHJ1
Y3QgcGNpX2J1cyAqYnVzKQotewotCXJldHVybiAtMTsKLX0KLQotc3RydWN0IHBjaV9idXMgKnBj
aV9hY3BpX3NjYW5fcm9vdChzdHJ1Y3QgYWNwaV9wY2lfcm9vdCAqcm9vdCkKLXsKLQlyZXR1cm4g
TlVMTDsKLX0KICNlbmRpZgkvKiBDT05GSUdfUENJICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bj
aS9wY2ktYWNwaS5jIGIvZHJpdmVycy9wY2kvcGNpLWFjcGkuYwppbmRleCA4ZWQ4MWEzNzNiZDcu
LmFmMzcwNjI4ZTU4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvcGNpLWFjcGkuYworKysgYi9k
cml2ZXJzL3BjaS9wY2ktYWNwaS5jCkBAIC0xNTQzLDcgKzE1NDMsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBhY3BpX3BjaV9pbml0KHZvaWQpCiB9CiBhcmNoX2luaXRjYWxsKGFjcGlfcGNpX2luaXQp
OwogCi0jaWYgZGVmaW5lZChDT05GSUdfQVJNNjQpCisjaWYgZGVmaW5lZChDT05GSUdfQVJNNjQp
IHx8IGRlZmluZWQoQ09ORklHX1JJU0NWKQogCiAvKgogICogVHJ5IHRvIGFzc2lnbiB0aGUgSVJR
IG51bWJlciB3aGVuIHByb2JpbmcgYSBuZXcgZGV2aWNlCi0tIAoyLjQzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
