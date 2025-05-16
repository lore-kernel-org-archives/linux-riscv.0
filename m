Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E8DC3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkLhjnu54nJiO8tcV/+k4gh5Q3WGv9KDiULOhiC1LL0=; b=vEJbr1hdTJ+VYQ
	ZhHv219iLEQSAv2eeFPM6YsoScBVE17RrRpmRenrrVVsB+XNWKqGVFqmd8co36pI2DbRk8nBHpdBk
	LmdVjVyKYHIKZ/d997xgLIFmaMuPSVwosc7B/Pzq4/pyA7US5lK8f/dg93YaQDPLpAYN9jMqJthGy
	51g+AxZCeQFMrhPyKta/GuN6RY+pj2HqbMVbX5XezxvF6xIFYXL/5mCaLgZdNh+huCA76hKo5oS0d
	BF6P39Yt8QX2DFNITAIoQryuxaa+6IxTlytmux73iFjJ7dFAbkJFFVKczbl35gtfs2eK5zs938v71
	BBBFpWwLI+XFhWY4AI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwV6-00000003kOy-37PH;
	Fri, 16 May 2025 14:57:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvqw-00000003der-20Cb
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 14:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA9B62A01
	for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 14:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC242C4AF0C
	for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404955;
	bh=JPP6PZVPCyPpBi7NX7odUW7qXIUoGkCGhRHKl7+rxGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dw1gTVs/jf57SCOW6Wymkm1DyWIU7m/KHmweRe48yAnCuwGNkrr+xIx9LK8fX1j0V
	 7yFdIZnwEJ7TLBP8M+buGhUc+/6YNsrYA8yZnxcxY38ddJQSFb4ivK0M6ADp4Cs44W
	 3i013u1Qd7zcOk1Tiu2IZDmJSRXNoL4ElfJTsIWgkVjeK0P+hZBgADKD4VjulusLQd
	 a0nMqe5bBzYUcDa0j00Mkbk24yoVfzHVGNIM8msBTvyezmkC0zmvEzAHpBIr8PgJVI
	 UQC30myGs6a9R3Js4QfEEmHKNRPoUT6nH5Z1U5WfP30NFfoswM/FFvYtL/xWIlSd2s
	 B6d1r2+IW0Nag==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-400fa6eafa9so1723599b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 07:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTjIaVacMJKGOPJ8UVrlKBCP7qqXU3yDAJ7pVwihRNP6YVL45vcC0HkcwRx2bxFMbB7f+zrwJS2ASmUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAvliBlRQCJp7+9fEYE3FdfnG6UwlDJCPB3QDXtNFmeT1JMPxz
	YYnW85sVCNDxDft7wgrMGiq3vnAZq3pbXJqqgNYH0TTQIN+6Xu8ktoJT/qLpJJyNQP4ZIexD7Gc
	0RoI7Y8tTztPYz7G+B0i8m6PH9IVn7Nw=
X-Google-Smtp-Source: AGHT+IEifMgJi4I9KIB7g9la5wpxkudYHh/KMp5hArruRNgMVIpvFmFB7Kl/JfKlT61P+OJfapZDeIhIDy2BsGE64us=
X-Received: by 2002:a05:6808:6a89:b0:402:862:93ae with SMTP id
 5614622812f47-404d86e321bmr2322505b6e.16.1747404955135; Fri, 16 May 2025
 07:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250514055723.1328557-1-sunilvl@ventanamicro.com> <20250514055723.1328557-4-sunilvl@ventanamicro.com>
In-Reply-To: <20250514055723.1328557-4-sunilvl@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 16 May 2025 16:15:44 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iVvDZJFxcHG6x23G4_88DE_A9JLx0o7ejypNv=M2Qg6g@mail.gmail.com>
X-Gm-Features: AX0GCFtlXnPveldiowmA4mqsiA61H-XtjgSSx2COK0UFQUnxxpWloVNNJI4sskQ
Message-ID: <CAJZ5v0iVvDZJFxcHG6x23G4_88DE_A9JLx0o7ejypNv=M2Qg6g@mail.gmail.com>
Subject: Re: [PATCH 3/4] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev, 
	acpica-devel@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgNzo1N+KAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IGFjcGlfaW9tbXVfY29uZmlndXJlX2lkKCkgY3VycmVu
dGx5IHN1cHBvcnRzIG9ubHkgSU9SVCAoQVJNKSBhbmQgVklPVC4KPiBBZGQgc3VwcG9ydCBmb3Ig
UklTQy1WIGFzIHdlbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT4KClRoaXMgaXMgZmluZSBieSBtZSwgc28KCkFja2VkLWJ5OiBSYWZhZWwg
Si4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+CgphbmQgcGxlYXNlIHJvdXRl
IGl0IHZpYSBSSVNDLVYsIGJ1dCByZW1lbWJlciBhYm91dCB0aGUgZGVwZW5kZW5jeSBvbgp0aGUg
bmV3IEFDUElDQSBjaGFuZ2UuCgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvc2Nhbi5jIHwgOSArKysr
KysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvc2Nhbi5jIGIvZHJpdmVycy9hY3BpL3NjYW4u
Ywo+IGluZGV4IGZiMWZlOWYzYjFhMy4uNzBmNTdkNThmZDYxIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYWNwaS9zY2FuLmMKPiArKysgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gQEAgLTExLDYgKzEx
LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvYWNw
aS5oPgo+ICAjaW5jbHVkZSA8bGludXgvYWNwaV9pb3J0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9h
Y3BpX3JpbXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2FjcGlfdmlvdC5oPgo+ICAjaW5jbHVkZSA8
bGludXgvaW9tbXUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NpZ25hbC5oPgo+IEBAIC0xNjI4LDgg
KzE2MjksMTIgQEAgc3RhdGljIGludCBhY3BpX2lvbW11X2NvbmZpZ3VyZV9pZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIGNvbnN0IHUzMiAqaWRfaW4pCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGVyciA9
IGlvcnRfaW9tbXVfY29uZmlndXJlX2lkKGRldiwgaWRfaW4pOwo+IC0gICAgICAgaWYgKGVyciAm
JiBlcnIgIT0gLUVQUk9CRV9ERUZFUikKPiAtICAgICAgICAgICAgICAgZXJyID0gdmlvdF9pb21t
dV9jb25maWd1cmUoZGV2KTsKPiArICAgICAgIGlmIChlcnIgJiYgZXJyICE9IC1FUFJPQkVfREVG
RVIpIHsKPiArICAgICAgICAgICAgICAgZXJyID0gcmltdF9pb21tdV9jb25maWd1cmVfaWQoZGV2
LCBpZF9pbik7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIgJiYgZXJyICE9IC1FUFJPQkVfREVG
RVIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gdmlvdF9pb21tdV9jb25maWd1cmUo
ZGV2KTsKPiArICAgICAgIH0KPiArCj4gICAgICAgICBtdXRleF91bmxvY2soJmlvbW11X3Byb2Jl
X2RldmljZV9sb2NrKTsKPgo+ICAgICAgICAgcmV0dXJuIGVycjsKPiAtLQo+IDIuNDMuMAo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
