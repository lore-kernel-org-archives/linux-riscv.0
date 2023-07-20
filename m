Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343A3EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 18:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgpiHPr5AMXYoL3PgJ8KLq7e9atAGNNF+SHEeVBhsmE=; b=gNx8FrnbWt/vpf
	J12WhYujskbJzeQVi9VvrrVKF3Dw/bfqC6fhY1sfe9oXdf+MaV12f1qUU+eZQ2tt87Fv/LhPCOGFl
	kRVGVI8wA0LElS9Tyk5Rq5NujPznVtCZ7pPNh2KAGWUMQST2J+lYHqkuiOFPi749XYfwa8b2arOA2
	rWuT1E9tvHHnA8gstLeA5tV19cg9xdRe2sce/WMLlicm+885bODsH93cRe1Emrx4/07sxiF7mr5sX
	u49EKeFkVx8Vf3geOSvnV/MY9yndBPUZiqzZB3bRhVDXwNnzkWiz7oDwhFNIYMNttCz+qrA3FiPu6
	dyK6j0Ceh8Oh6FU6jFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYPt-00Bu5C-30;
	Thu, 20 Jul 2023 18:30:21 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYPq-00Bu3y-2V
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 18:30:20 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-262e5e71978so793212a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 11:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689877814; x=1690482614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkhjk/nVBrnNuMjmXsk/jA6PNc5ly2hNBTN0yfAkH5Q=;
        b=b2Pe1xIPWJCDsg6h66rbrpgxHYq51tgb/OXB6KHRNSesz35L8jVwo4n89JSY1WX6fm
         DjqF1Jswmg201FhvUH6hGoWb7tW+wOCwbweIAthSeQeJF9/gVCCyIo9T2/aNCo0pGd2r
         vtdxC6aEX1EVRLwItj22Rc+wxV8eX0D9IJ+2Yv2luBEw6+Z9zlMRws9UYFFv6awtnz8Y
         Hv9Mf7tS/i1/SedIQnnFYzLK92Gh43NMMVcNzmOPKgYiZNIUNzuQgDwCxw1eq+96rQmM
         o/dkQaKs5DT74ynoWMGRpONBSpXBPm1UJXtTK/7D5ay4Z8RROWam8WzsAYNhHZOwGwAK
         X9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689877814; x=1690482614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkhjk/nVBrnNuMjmXsk/jA6PNc5ly2hNBTN0yfAkH5Q=;
        b=ZIOIVLY5UGjS4X5ruE9wNkO2aYJi41WzYLlHqqYEJq4J4nlgZnnE00LSk0XueQD0CO
         6MXbnzlcpRJdgHjEl+6nH1Oi6oDxtGGVifUENnb0785H4d/SsvdhPyaXFCz8ULbTCXE0
         Kui3D8alnyZmDcbdkM54uEcrrR6y2XB+Hg36n3yb8RkHsmRbjplQ378QxivQnvE8A3ER
         o1VGli7+Ko6UKONzVR+WVkF9fcHLSLu/afjgaHQgSe9pAtCqhRagBvekHk0ZeeoiId8O
         qIviYGRgK945qszEST8ATaSNpMQb5Te29RGzYWuRDQ0CoXWnWiXLCv9GdfJHiVh/WDhl
         ZLIQ==
X-Gm-Message-State: ABy/qLbg3F4xaQwWv0wPUhOzRCpAhcj8Z4BoNkFO7est9uyImbQVGfcD
	Zctk3bEwtE1HO5dyZ6f+bMtGBezNIuhcFuuZNeG4UFlMWr6J2Q6lbUJXqg==
X-Google-Smtp-Source: APBJJlGFbUizqz1vNI7vMUQ0ylZG3q2JJ4UhCTVRD6md7r3Rcjt9plOMw7o0JnLrKKGUNqRDannn0g50nIaGzfRduP0=
X-Received: by 2002:a17:90a:c28c:b0:261:219b:13b3 with SMTP id
 f12-20020a17090ac28c00b00261219b13b3mr53612pjt.16.1689877814079; Thu, 20 Jul
 2023 11:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
 <c26d029e-dabc-9ad2-ed42-bb6ee276e3fb@kernel.org>
In-Reply-To: <c26d029e-dabc-9ad2-ed42-bb6ee276e3fb@kernel.org>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 20 Jul 2023 11:30:03 -0700
Message-ID: <CAH2o1u6pMF3MN=oFBcs9kOf-nwnEYfD2Vv=89+DzUanV59R5dw@mail.gmail.com>
Subject: Re: [PATCH 05/11] RISC-V: drivers/iommu/riscv: Add sysfs interface
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_113018_836465_68EC4398 
X-CRM114-Status: GOOD (  23.53  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgMTE6MzjigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTkvMDcvMjAyMyAyMTozMywgVG9tYXN6IEpl
em5hY2ggd3JvdGU6Cj4gPiBFbmFibGUgc3lzZnMgZGVidWcgLyB2aXNpYmlsaXR5IGludGVyZmFj
ZSBwcm92aWRpbmcgcmVzdHJpY3RlZAo+ID4gYWNjZXNzIHRvIGhhcmR3YXJlIHJlZ2lzdGVycy4K
Pgo+IFBsZWFzZSB1c2Ugc3ViamVjdCBwcmVmaXhlcyBtYXRjaGluZyB0aGUgc3Vic3lzdGVtLiBZ
b3UgY2FuIGdldCB0aGVtIGZvcgo+IGV4YW1wbGUgd2l0aCBgZ2l0IGxvZyAtLW9uZWxpbmUgLS0g
RElSRUNUT1JZX09SX0ZJTEVgIG9uIHRoZSBkaXJlY3RvcnkKPiB5b3VyIHBhdGNoIGlzIHRvdWNo
aW5nLgo+CgphY2suCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBKZXpuYWNoIDx0amV6
bmFjaEByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L01ha2Vm
aWxlICAgICAgfCAgIDIgKy0KPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXN5c2ZzLmMg
fCAxODMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9pb21tdS9y
aXNjdi9pb21tdS5jICAgICAgIHwgICA3ICsrCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21t
dS5oICAgICAgIHwgICAyICsKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE5MyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUtc3lzZnMuYwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2
L01ha2VmaWxlIGIvZHJpdmVycy9pb21tdS9yaXNjdi9NYWtlZmlsZQo+ID4gaW5kZXggMzg3MzBj
MTFlNGE4Li45NTIzZWIwNTNjZmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2
L01ha2VmaWxlCj4gPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlCj4gPiBAQCAt
MSArMSBAQAo+ID4gLW9iai0kKENPTkZJR19SSVNDVl9JT01NVSkgKz0gaW9tbXUubyBpb21tdS1w
Y2kubyBpb21tdS1wbGF0Zm9ybS5vCj4gPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPiA+
ICtvYmotJChDT05GSUdfUklTQ1ZfSU9NTVUpICs9IGlvbW11Lm8gaW9tbXUtcGNpLm8gaW9tbXUt
cGxhdGZvcm0ubyBpb21tdS1zeXNmcy5vCj4gPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUK
Pgo+IFlvdSBoYXZlIHRoaXMgZXJyb3IgaW4gbXVsdGlwbGUgcGxhY2VzLgo+CgphY2suIG5leHQg
dmVyc2lvbiB3aWxsIHJ1biB0aHJvdWdoIGNoZWNrcGF0Y2gucGwsIHNob3VsZCBzcG90IHN1Y2gg
cHJvYmxlbXMuCgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtc3lz
ZnMuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtc3lzZnMuYwo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjAzOGVhODQ0NWM1Cj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXN5c2ZzLmMKPiA+IEBA
IC0wLDAgKzEsMTgzIEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQo+ID4gKy8qCj4gPiArICogSU9NTVUgQVBJIGZvciBSSVNDLVYgYXJjaGl0ZWN0ZWQgWmlv
bW11IGltcGxlbWVudGF0aW9ucy4KPiA+ICsgKgo+ID4gKyAqIENvcHlyaWdodCDCqSAyMDIyLTIw
MjMgUml2b3MgSW5jLgo+ID4gKyAqCj4gPiArICogQXV0aG9yOiBUb21hc3ogSmV6bmFjaCA8dGpl
em5hY2hAcml2b3NpbmMuY29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gPiArI2luY2x1ZGUgPGxp
bnV4L2NvbXBpbGVyLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+Cj4gPiArI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gKyNpbmNsdWRlIDxhc20vcGFnZS5oPgo+
ID4gKwo+ID4gKyNpbmNsdWRlICJpb21tdS5oIgo+ID4gKwo+ID4gKyNkZWZpbmUgc3lzZnNfZGV2
X3RvX2lvbW11KGRldikgXAo+ID4gKyAgICAgY29udGFpbmVyX29mKGRldl9nZXRfZHJ2ZGF0YShk
ZXYpLCBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlLCBpb21tdSkKPiA+ICsKPiA+ICtzdGF0aWMg
c3NpemVfdCBhZGRyZXNzX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+
Cj4KPiBXaGVyZSBpcyB0aGUgc3lzZnMgQUJJIGRvY3VtZW50ZWQ/Cj4KClN5c2ZzIGZvciBub3cg
aXMgdXNlZCBvbmx5IHRvIGV4cG9zZSBzZWxlY3RlZCBJT01NVSBtZW1vcnkgbWFwcGVkCnJlZ2lz
dGVycywgd2l0aCBjb21wbGV0ZSBkb2N1bWVudGF0aW9uIGluIHRoZSBSSVNDLVYgSU9NTVUgQXJj
aCBTcGVjClsxXSwgYW5kIHNvbWUgY29tbWVudHMgaW4gaW9tbXUtYml0cy5oIGZpbGUuCkxNSyBJ
ZiBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcHV0IGEgZGVkaWNhdGVkIGZpbGUgZG9jdW1lbnRpbmcg
dGhvc2UKd2l0aCB0aGUgcGF0Y2ggaXRzZWxmLgoKClsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1pb21tdS9yZWxlYXNlcy9kb3dubG9hZC92MS4wL3Jpc2N2LWlvbW11
LnBkZgoKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKcmVnYXJkcywKLSBUb21hc3oK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
