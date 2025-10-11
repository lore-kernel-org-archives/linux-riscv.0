Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCC8CCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IGuxTFiYEkOgG7dapsNKpMrQdLuuLsp7ghcqVKfE9I=; b=rg9yzFbCMBXMME
	t3jy2D41lYUWNi1WJCie1JKkdAZENrNNWSk5kwQOk1ye9y4xu9qycT0SHGNkJdaM53cKOUOB+UDol
	dl+2fhPrUl8LSPPyeMTaQ1/L3otqPKqcToIHSDQ4awgY73hg5uAXaogNwDPBpx8cdvItYupdLLl1c
	C6n5E/m2Etbh9q7ga/8IkOyHk1s3twZPYGnptNqzZArrfzLAusu4yhNg1xqeYzL+jkksP4nDv3eJL
	AY41KD50h9pJNIwtPIlWRhMCd/F1Ja9a7oD2S/LlzuKs1t2RoedN8TqOLW29uTSaqqhXpPmtyssFf
	IIQeQqwGKFyJMpFcl3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7b6O-0000000AHKQ-1ry1;
	Sat, 11 Oct 2025 15:01:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7b6M-0000000AHJg-1l0h
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 15:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30EDA44086
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 15:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B9CC116C6
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760194901;
	bh=l+BZFi7FQ0gPIfmUyKUU89IcSli2ZdE01CP6ZymDA1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tsHAGq8dCVb2hVSocMgxqr7qyYj5+AKGnNNotgILXaJcZW20HJ9zHbk5bc8MAasJB
	 DGIgOAcZoh181a0g3qHUSjhsInio82Gzpz/0bSDpc9HMowZhB0UYG+wL685LcxiDHA
	 GHDirQ4tLupNMXXJCX07tPelAY0JHllVubWToOWC0fFxRIJMyQebl/4kfn7XL/tLpe
	 i1SUOxXGMViX3cjRPGrAnFt4WJkRMR9jfqaGHwAoSrdQ+L1QfCD3gFsPaLtCJvgOg0
	 8t04jZiPVC8y3aEqpyCX99zqFY0hHt3A+faZRg0StkoJRoQQdFmqX0a8kNyNzCZZfQ
	 ilr5qP68oSOFA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso6498462a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 08:01:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMQJrgNPxujzMpYfc3Uggc3M7z67Vhl+NNlMfpVtatPb2hOEnl/zDpwFCGigdKNcM6Xv9tbGIKQL3KNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZb/UveR0KKprE655FeaiNncxnMyB9FlP6dZ2E7WE+WULTydPH
	6WHX24irEJ9hOQmQoaoUf1TG4a0rPrN1yks2OW52aKIlIP53P9KDHEt9+pyL4Bv03NodjsFLKeg
	vrfRlfCdJDBRDQDHjVOQ1pKd/FfbiuSk=
X-Google-Smtp-Source: AGHT+IHAAjGILFWSLd2horNFRfV9fxdmdzWYj3ySTCm2Rj6N1tAB750HNgdkpDddPHK+8MUEnYbHC/EcCmKKJlMNNAU=
X-Received: by 2002:a05:6402:254f:b0:637:e4d1:aeff with SMTP id
 4fb4d7f45d1cf-639d5c3ebc3mr15509926a12.19.1760194899593; Sat, 11 Oct 2025
 08:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
In-Reply-To: <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Oct 2025 23:01:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
X-Gm-Features: AS18NWAB1PQYI1FQztjMtlWlWvM53GRJ5zRkwYU-MM98Alr4NPAHm_TfvKHj05U
Message-ID: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_080142_494812_F8B5530F 
X-CRM114-Status: GOOD (  34.92  )
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

T24gU2F0LCBPY3QgMTEsIDIwMjUgYXQgMTA6NDjigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgMTEgT2N0IDIwMjUgYXQgMDA6NDMsIEh1YWNh
aSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgT2N0
IDExLCAyMDI1IGF0IDM6MjnigK9QTSBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5j
bj4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDIwMjUvMTAvMTEg5LiK5Y2IMTE6NDAsIEFyZCBCaWVz
aGV1dmVsIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgMTAgT2N0IDIwMjUgYXQgMTk6NTQsIEh1YWNh
aSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Pgo+ID4gPiA+PiBP
biBTYXQsIE9jdCAxMSwgMjAyNSBhdCA5OjEz4oCvQU0gVGllemh1IFlhbmcgPHlhbmd0aWV6aHVA
bG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPiA+Pj4KPiA+ID4gPj4+IE9uIDIwMjUvMTAvMTEg5LiK
5Y2IMTI6MjUsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+ID4gPiA+Pj4gLi4uCj4gPiA+ID4+Pj4g
V2h5IGRvIHdlIG5lZWQgYm90aCAoMSkgYW5kICgyKT8KPiA+ID4gPj4+Cj4gPiA+ID4+PiBOb3Qg
Ym90aCwgZWl0aGVyICgxKSBvciAoMikuCj4gPiA+ID4+PiBXaGljaCBvbmUgZG8geW91IHByZWZl
cj8gT3IgYW55IG90aGVyIHN1Z2dlc3Rpb25zPwo+ID4gPiA+Pj4KPiA+ID4gPj4+IFRha2luZyBh
bGwgb2YgdGhlIGNvbnNpZGVyYXRpb25zIGluIGJhbGFuY2UsIHdlIHNob3VsZCBkZWNpZGUKPiA+
ID4gPj4+IHdoYXQgaXMgdGhlIHByb3BlciB3YXkuCj4gPiA+ID4+IEFzIGEgc3VtbWFyeSwgdGhl
cmUgYXJlIHRocmVlIG1ldGhvZHM6Cj4gPiA+ID4+ICgxKSBPbmx5IGxpbmsgbGlic3R1YiB3aXRo
IHZtbGludXgubyBkdXJpbmcgdGhlIGZpbmFsIHZtbGludXggbGluay4KPiA+ID4gPj4gKDIpIFJl
bW92ZSB0aGUgYXR0cmlidXRlIF9fbm9yZXR1cm4gZm9yIHJlYWxfa2VybmVsX2VudHJ5KCkgYW5k
IGFkZCB3aGlsZSAoMSkuCj4gPiA+ID4+ICgzKSBJZ25vcmUgIl9fZWZpc3R1Yl8iIHByZWZpeCBp
biBvYmp0b29sLgo+ID4gPiA+Pgo+ID4gPiA+PiBKb3NoIHByZWZlcnMgbWV0aG9kICgxKSwgSSBw
cmVmZXIgbWV0aG9kICgzKSBidXQgYWxzbyBhY2NlcHQgbWV0aG9kCj4gPiA+ID4+ICgxKSBpZiBp
dCBpcyBub3Qgb25seSBzcGVjaWZpYyB0byBsb29uZ2FyY2guCj4gPiA+ID4+Cj4gPiA+ID4KPiA+
ID4gPiBUaGlzIGlzIGEgZmFsc2UgcG9zaXRpdmUgd2FybmluZyBpbiBvYmp0b29sLCB3aGljaCBj
b21wbGFpbnMgYWJvdXQgYQo+ID4gPiA+IGZ1bmN0aW9uIHRoYXQgZmFsbHMgdGhyb3VnaCwgZXZl
biB0aG91Z2ggdGhhdCBjYW4gbmV2ZXIgaGFwcGVuIGluCj4gPiA+ID4gcmVhbGl0eS4KPiA+ID4g
Pgo+ID4gPiA+IFRvIG1lLCBpdCBpcyBub3QgYWNjZXB0YWJsZSB0byBtb2RpZnkgaG93IHZtbGlu
dXgubyBpcyBjb25zdHJ1Y3RlZAo+ID4gPiA+IGFsc28gZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMs
IGluIG9yZGVyIHRvIGhpZGUgc29tZSBvZiBpdHMgY29uc3RpdHVlbnQKPiA+ID4gPiBwYXJ0cyBm
cm9tIG9ianRvb2wsIHdoaWNoIGRvIG5vdCB1c2Ugb2JqdG9vbCB0byBiZWdpbiB3aXRoLgo+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBJZiB5b3UgYXJlIG5vdCB3aWxsaW5nIHRvIGZpeCBvYmp0b29s
LCBJIHN1Z2dlc3QgZml4aW5nIHRoZSBsb29uZ2FyY2gKPiA+ID4gPiBjb2RlIGxpa2UgdGhpczoK
PiA+ID4KPiA+ID4gVGhhbmsgeW91Lgo+ID4gPgo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZmlybXdh
cmUvZWZpL2xpYnN0dWIvbG9vbmdhcmNoLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2Zpcm13YXJl
L2VmaS9saWJzdHViL2xvb25nYXJjaC5jCj4gPiA+ID4gQEAgLTEwLDcgKzEwLDcgQEAKPiA+ID4g
PiAgICNpbmNsdWRlICJlZmlzdHViLmgiCj4gPiA+ID4gICAjaW5jbHVkZSAibG9vbmdhcmNoLXN0
dWIuaCIKPiA+ID4gPgo+ID4gPiA+IC10eXBlZGVmIHZvaWQgX19ub3JldHVybiAoKmtlcm5lbF9l
bnRyeV90KShib29sIGVmaSwgdW5zaWduZWQgbG9uZyBjbWRsaW5lLAo+ID4gPiA+ICt0eXBlZGVm
IHZvaWQgKCprZXJuZWxfZW50cnlfdCkoYm9vbCBlZmksIHVuc2lnbmVkIGxvbmcgY21kbGluZSwK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBzeXN0YWIpOwo+ID4gPiA+Cj4gPiA+ID4gICBlZmlfc3RhdHVzX3QgY2hlY2tfcGxh
dGZvcm1fZmVhdHVyZXModm9pZCkKPiA+ID4gPiBAQCAtODEsNCArODEsNiBAQAo+ID4gPiA+Cj4g
PiA+ID4gICAgICAgICAgcmVhbF9rZXJuZWxfZW50cnkodHJ1ZSwgKHVuc2lnbmVkIGxvbmcpY21k
bGluZV9wdHIsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxv
bmcpZWZpX3N5c3RlbV90YWJsZSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgcmV0dXJuIEVG
SV9MT0FEX0VSUk9SOwo+ID4gPiA+ICAgfQo+ID4gPgo+ID4gPiBJIHRlc3RlZCB0aGUgYWJvdmUg
Y2hhbmdlcywgdGhlIGZhbGxzIHRocm91Z2ggb2JqdG9vbCB3YXJuaW5nIGNhbgo+ID4gPiBiZSBm
aXhlZCBiZWNhdXNlIGVmaV9ib290X2tlcm5lbCgpIGVuZHMgd2l0aCBhIHJldHVybiBpbnN0cnVj
dGlvbiwKPiA+ID4gSSB0aGluayB0aGlzIGlzIHJlYXNvbmFibGUuCj4gPiA+Cj4gPiA+IGVmaV9i
b290X2tlcm5lbCgpIGhhcyBhIHJldHVybiB2YWx1ZSwgdGhlcmUgYXJlICJyZXR1cm4gc3RhdHVz
IiBpbgo+ID4gPiBvdGhlciBwYXJ0cyBvZiBlZmlfYm9vdF9rZXJuZWwoKSwgaXQgc2hvdWxkIGFs
c28gcmV0dXJuIGF0IHRoZSBlbmQKPiA+ID4gb2YgZWZpX2Jvb3Rfa2VybmVsKCkgaW4gdGhlb3J5
LCBhbHRob3VnaCB3ZSBzaG91bGQgbmV2ZXIgZ2V0IGhlcmUuCj4gPiA+Cj4gPiA+IElmIHRoZXJl
IGFyZSBtb3JlIGNvbW1lbnRzLCBwbGVhc2UgbGV0IG1lIGtub3cuCj4gPiBJIHN0aWxsIGRvbid0
IHdhbnQgTG9vbmdBcmNoIHRvIGJlIGEgc3BlY2lhbCBjYXNlLCB3aGljaCBtZWFucwo+ID4gZWZp
X2Jvb3Rfa2VybmVsKCkgaW4gZmR0LmMsIGp1bXBfa2VybmVsX2Z1bmMgaW4gcmlzY3YuYyBhbmQK
PiA+IGVudGVyX2tlcm5lbCBpbiBhcm02NC5jIHNob3VsZCBhbHNvIGJlIG1vZGlmaWVkLgo+ID4K
Pgo+IFlvdSBoYXZlIG1hZGUgTG9vbmdBcmNoIGEgc3BlY2lhbCBjYXNlIGJ5IGFkZGluZyBvYmp0
b29sIHN1cHBvcnQsCj4gd2hpY2ggIGFybTY0IGFuZCBSSVNDLVYgZG8gbm90IGhhdmUuCj4KPiBT
byBOQUsgdG8gY2hhbmdpbmcgYXJtNjQgYW5kIFJJU0MtViBhcyB3ZWxsLgpIbW1tLCBJIHdhbnQg
dG8ga25vdyB3aGV0aGVyIHRoaXMgcHJvYmxlbSBpcyBhbiBvYmp0b29sIGlzc3VlIG9yIGFuCmVm
aXN0dWIgaXNzdWUgaW4gZXNzZW5jZS4gSWYgaXQgaXMgYW4gb2JqdG9vbCBpc3N1ZSwgd2Ugc2hv
dWxkIGZpeApvYmp0b29sIGFuZCBkb24ndCB0b3VjaCBlZmlzdHViLiBJZiBpdCBpcyBhbiBlZmlz
dHViIGlzc3VlLCB0aGVuIHdlCnNob3VsZCBtb2RpZnkgZWZpc3R1YiAoYnV0IG5vdCBzcGVjaWZp
YyB0byBMb29uZ0FyY2gsIHdoZW4gUklTQy1WIGFuZApBUk02NCBhZGQgb2JqdG9vbCB0aGV5IHdp
bGwgbWVldCB0aGUgc2FtZSBpc3N1ZSkuCgpIdWFjYWkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
