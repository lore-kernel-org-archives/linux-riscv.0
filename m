Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E58ACCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcDz3HFW6S8GjQzkXCyWjNQ191p4eCZ49HSazsF6F0M=; b=vVuyRaB/p52Wt8
	FLUdIc/9NwZaD5Oh/kAiCPAMeuX9nSezJ70Bd/wZkVznH8xkBAc174/VwHFdjsMfDO5AiNSK9NCKK
	mz7pGVpBFA7IfRPQd046ANaU/MUpIlJwP3qt7kvIXVZir76X2QaPoiBVkH20jqg7fz90rIsEyrLy9
	xi5IsO/QOA7gorfj0sMIjm1Q6PAmmCyRWWKthODyd9Ze+8No96Vlxk93MmWs/wp2OXo0dk54SEhsE
	Ga8ZM72tR9IS5R/wO5hnn++AjwrRJJQpO9RDoGceDWNdi4Pm/hNSufUrJEdW8UJy5RM/VOkpwl1TZ
	MxJDCLuAwiwYV2HG5/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7atR-0000000AGEs-0FxG;
	Sat, 11 Oct 2025 14:48:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7atQ-0000000AGEg-1NPC
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 14:48:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E96AA6042F
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 14:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9314DC16AAE
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760194098;
	bh=wXStBs+UvcT5ZrTpS1/1ckIwHRUEME48TSqbgkHwb+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oLlMKRHb9j5zca9gdcHz3nPcO7CWeuLIPHjl65qT2ulkC1tRQIFninovONVjG/+pi
	 xlJPV9b35BmCBiYDnvjtYkvfsgCKLcTv7aU+UCPAwJCFH7e1YRwQTWuw6+AFLPJbp7
	 6oId1EXpdBUig96uubNo6+DPOd34dH5Ho3jy47trzx19Tz9FKDIdc08BH5215KlMAO
	 zHfV8cUJzMgeAaEn4t0CPuAh9YsvD1QkbTWrBBFig6M94acAuabpGdlZl+HL27+pn2
	 3aabXazeHX5eCCzxiN1jZeB7tQKIrXZGDduFarAG2uocTIPF/JGfdVEBLr14vZyNOc
	 veOWX/dRp43Pw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-371e4858f74so34839371fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 07:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNhBBSn0d6dEtUk3gdShwNOXoM7gbWCPA4ulfsXVIAV03TWUDex+i+BlWypPCYCfngfljIYXyGSJMJCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/i+HMv27L1fmoFFviLRU+FctyYlLGPFK0JX22ayyU6bi63meB
	iJMmxDQfwq8aUaHWjSxTqADJITiP3nOigqRkALE1qdBOt+8m2L1JlFGXPsKzZoEXHfbySuRCUsR
	5Sh71XG/6uUwe1WZZDxeyO3x1ql9euNk=
X-Google-Smtp-Source: AGHT+IHYOhl0vOE2LTdwiTtFP0Fr+VU2h59AG96E/Zqsb1S5Qep9A2cRFtxP03lVo9G+6+RIphfLphc9aa7av4+nnEQ=
X-Received: by 2002:a2e:b8c1:0:b0:372:8d09:d53f with SMTP id
 38308e7fff4ca-375f52a306emr52589131fa.20.1760194096892; Sat, 11 Oct 2025
 07:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
In-Reply-To: <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 11 Oct 2025 07:48:04 -0700
X-Gmail-Original-Message-ID: <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
X-Gm-Features: AS18NWBtlErlqiroFax4UVMcNYMWDvSx1dti0RxYcAZ5hVrwUXFzJJzynSJJpSU
Message-ID: <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gU2F0LCAxMSBPY3QgMjAyNSBhdCAwMDo0MywgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE9jdCAxMSwgMjAyNSBhdCAzOjI54oCvUE0gVGll
emh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjUv
MTAvMTEg5LiK5Y2IMTE6NDAsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+ID4gPiBPbiBGcmksIDEw
IE9jdCAyMDI1IGF0IDE5OjU0LCBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4+Cj4gPiA+PiBPbiBTYXQsIE9jdCAxMSwgMjAyNSBhdCA5OjEz4oCvQU0gVGll
emh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPj4+Cj4gPiA+Pj4g
T24gMjAyNS8xMC8xMSDkuIrljYgxMjoyNSwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gPiA+Pj4g
Li4uCj4gPiA+Pj4+IFdoeSBkbyB3ZSBuZWVkIGJvdGggKDEpIGFuZCAoMik/Cj4gPiA+Pj4KPiA+
ID4+PiBOb3QgYm90aCwgZWl0aGVyICgxKSBvciAoMikuCj4gPiA+Pj4gV2hpY2ggb25lIGRvIHlv
dSBwcmVmZXI/IE9yIGFueSBvdGhlciBzdWdnZXN0aW9ucz8KPiA+ID4+Pgo+ID4gPj4+IFRha2lu
ZyBhbGwgb2YgdGhlIGNvbnNpZGVyYXRpb25zIGluIGJhbGFuY2UsIHdlIHNob3VsZCBkZWNpZGUK
PiA+ID4+PiB3aGF0IGlzIHRoZSBwcm9wZXIgd2F5Lgo+ID4gPj4gQXMgYSBzdW1tYXJ5LCB0aGVy
ZSBhcmUgdGhyZWUgbWV0aG9kczoKPiA+ID4+ICgxKSBPbmx5IGxpbmsgbGlic3R1YiB3aXRoIHZt
bGludXgubyBkdXJpbmcgdGhlIGZpbmFsIHZtbGludXggbGluay4KPiA+ID4+ICgyKSBSZW1vdmUg
dGhlIGF0dHJpYnV0ZSBfX25vcmV0dXJuIGZvciByZWFsX2tlcm5lbF9lbnRyeSgpIGFuZCBhZGQg
d2hpbGUgKDEpLgo+ID4gPj4gKDMpIElnbm9yZSAiX19lZmlzdHViXyIgcHJlZml4IGluIG9ianRv
b2wuCj4gPiA+Pgo+ID4gPj4gSm9zaCBwcmVmZXJzIG1ldGhvZCAoMSksIEkgcHJlZmVyIG1ldGhv
ZCAoMykgYnV0IGFsc28gYWNjZXB0IG1ldGhvZAo+ID4gPj4gKDEpIGlmIGl0IGlzIG5vdCBvbmx5
IHNwZWNpZmljIHRvIGxvb25nYXJjaC4KPiA+ID4+Cj4gPiA+Cj4gPiA+IFRoaXMgaXMgYSBmYWxz
ZSBwb3NpdGl2ZSB3YXJuaW5nIGluIG9ianRvb2wsIHdoaWNoIGNvbXBsYWlucyBhYm91dCBhCj4g
PiA+IGZ1bmN0aW9uIHRoYXQgZmFsbHMgdGhyb3VnaCwgZXZlbiB0aG91Z2ggdGhhdCBjYW4gbmV2
ZXIgaGFwcGVuIGluCj4gPiA+IHJlYWxpdHkuCj4gPiA+Cj4gPiA+IFRvIG1lLCBpdCBpcyBub3Qg
YWNjZXB0YWJsZSB0byBtb2RpZnkgaG93IHZtbGludXgubyBpcyBjb25zdHJ1Y3RlZAo+ID4gPiBh
bHNvIGZvciBvdGhlciBhcmNoaXRlY3R1cmVzLCBpbiBvcmRlciB0byBoaWRlIHNvbWUgb2YgaXRz
IGNvbnN0aXR1ZW50Cj4gPiA+IHBhcnRzIGZyb20gb2JqdG9vbCwgd2hpY2ggZG8gbm90IHVzZSBv
Ymp0b29sIHRvIGJlZ2luIHdpdGguCj4gPiA+Cj4gPiA+Cj4gPiA+IElmIHlvdSBhcmUgbm90IHdp
bGxpbmcgdG8gZml4IG9ianRvb2wsIEkgc3VnZ2VzdCBmaXhpbmcgdGhlIGxvb25nYXJjaAo+ID4g
PiBjb2RlIGxpa2UgdGhpczoKPiA+Cj4gPiBUaGFuayB5b3UuCj4gPgo+ID4gPiAtLS0gYS9kcml2
ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2xvb25nYXJjaC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
ZmlybXdhcmUvZWZpL2xpYnN0dWIvbG9vbmdhcmNoLmMKPiA+ID4gQEAgLTEwLDcgKzEwLDcgQEAK
PiA+ID4gICAjaW5jbHVkZSAiZWZpc3R1Yi5oIgo+ID4gPiAgICNpbmNsdWRlICJsb29uZ2FyY2gt
c3R1Yi5oIgo+ID4gPgo+ID4gPiAtdHlwZWRlZiB2b2lkIF9fbm9yZXR1cm4gKCprZXJuZWxfZW50
cnlfdCkoYm9vbCBlZmksIHVuc2lnbmVkIGxvbmcgY21kbGluZSwKPiA+ID4gK3R5cGVkZWYgdm9p
ZCAoKmtlcm5lbF9lbnRyeV90KShib29sIGVmaSwgdW5zaWduZWQgbG9uZyBjbWRsaW5lLAo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBzeXN0YWIpOwo+ID4gPgo+ID4gPiAgIGVmaV9zdGF0dXNfdCBjaGVja19wbGF0Zm9ybV9mZWF0
dXJlcyh2b2lkKQo+ID4gPiBAQCAtODEsNCArODEsNiBAQAo+ID4gPgo+ID4gPiAgICAgICAgICBy
ZWFsX2tlcm5lbF9lbnRyeSh0cnVlLCAodW5zaWduZWQgbG9uZyljbWRsaW5lX3B0ciwKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpZWZpX3N5c3RlbV90YWJs
ZSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICByZXR1cm4gRUZJX0xPQURfRVJST1I7Cj4gPiA+ICAg
fQo+ID4KPiA+IEkgdGVzdGVkIHRoZSBhYm92ZSBjaGFuZ2VzLCB0aGUgZmFsbHMgdGhyb3VnaCBv
Ymp0b29sIHdhcm5pbmcgY2FuCj4gPiBiZSBmaXhlZCBiZWNhdXNlIGVmaV9ib290X2tlcm5lbCgp
IGVuZHMgd2l0aCBhIHJldHVybiBpbnN0cnVjdGlvbiwKPiA+IEkgdGhpbmsgdGhpcyBpcyByZWFz
b25hYmxlLgo+ID4KPiA+IGVmaV9ib290X2tlcm5lbCgpIGhhcyBhIHJldHVybiB2YWx1ZSwgdGhl
cmUgYXJlICJyZXR1cm4gc3RhdHVzIiBpbgo+ID4gb3RoZXIgcGFydHMgb2YgZWZpX2Jvb3Rfa2Vy
bmVsKCksIGl0IHNob3VsZCBhbHNvIHJldHVybiBhdCB0aGUgZW5kCj4gPiBvZiBlZmlfYm9vdF9r
ZXJuZWwoKSBpbiB0aGVvcnksIGFsdGhvdWdoIHdlIHNob3VsZCBuZXZlciBnZXQgaGVyZS4KPiA+
Cj4gPiBJZiB0aGVyZSBhcmUgbW9yZSBjb21tZW50cywgcGxlYXNlIGxldCBtZSBrbm93Lgo+IEkg
c3RpbGwgZG9uJ3Qgd2FudCBMb29uZ0FyY2ggdG8gYmUgYSBzcGVjaWFsIGNhc2UsIHdoaWNoIG1l
YW5zCj4gZWZpX2Jvb3Rfa2VybmVsKCkgaW4gZmR0LmMsIGp1bXBfa2VybmVsX2Z1bmMgaW4gcmlz
Y3YuYyBhbmQKPiBlbnRlcl9rZXJuZWwgaW4gYXJtNjQuYyBzaG91bGQgYWxzbyBiZSBtb2RpZmll
ZC4KPgoKWW91IGhhdmUgbWFkZSBMb29uZ0FyY2ggYSBzcGVjaWFsIGNhc2UgYnkgYWRkaW5nIG9i
anRvb2wgc3VwcG9ydCwKd2hpY2ggIGFybTY0IGFuZCBSSVNDLVYgZG8gbm90IGhhdmUuCgpTbyBO
QUsgdG8gY2hhbmdpbmcgYXJtNjQgYW5kIFJJU0MtViBhcyB3ZWxsLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
