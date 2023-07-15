Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79DCEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NnucvhRR9PUgnh9NdDCYPFT8/UIpv3nEmrRGLwmRgc=; b=chsn7OMr+Mnebx
	xlx01QAxbu/FXPlp7ZwE3Rjf4eYBexAAmGjlE7H6/wF/7F3zyYUeYIXQbMWaHjm8+H4gBrU9mIhhY
	PbKtxU+7Oh1XX1SUlzRN+bi3vksjFd42RmBrs5S5LlX0QhQypGtCKvO0ZXReM91Tl4zg9MsN5flEM
	e4k2FxVVa7Lf6p4qKnFK7CKy8XhxettQnOCk7J/YvlC5NrJxmY+wwyRIRe9W3YGS7/xcpooYkpV5y
	12DvJJZrdsp7l9JCTV+pXdvy4gqs6Beq0akPKKpMoVxGQK2GX9qgaAIcwI2+JwlhnO7sGo4hBXAeZ
	EilVa6bGRfD/3hvYtk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKYV3-0080rV-0A;
	Sat, 15 Jul 2023 06:11:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKYUz-0080qw-2s
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 06:11:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F8D160918
	for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 06:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781CBC433CD
	for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 06:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689401478;
	bh=vID90gT555eZSUAUkQIkjg8dB/bhWRRx1D7AfoGm1+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RtRBwLa+ww0TkFtyxsLpl4SMYIBYrX4qMc6F4jXjn5ccoPGYBfLTG3fm0916k/GSG
	 Wu0SqKTcyC1sHgPAUKqCL0Xb2xMoSTd1C7L77NmN/GR67R0FYOkWbc/FkYEeKwMec7
	 lm5MvYZvBgEHAHJkZpuYgI5epBu6C2qTFgu72Ef1BX28OqNPHnnpae44cz5mxWZ/kt
	 wdgXr64rGk0hh2itSvTK++spjqP4pzCvdblZtmsdqJ/He/x+l2xeOkpKguCfNhDkLF
	 lCuJ/56TmNRp9wdtRdCeHuTSQmAYC9qI+LsayYvwx4Z8D9t8kb8vwkLWHLM92nhPbN
	 5Svbr86L+4KBA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-98de21518fbso363020966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 23:11:18 -0700 (PDT)
X-Gm-Message-State: ABy/qLaAifO4W5L2c7bClLfBniCznyhTYjN+o1spKNAulw8FbIaX9uOE
	1KEYJRLzGc5BiVRiJ0+J8n5oIXV7IiN42Q/DXgc=
X-Google-Smtp-Source: APBJJlHcE6cqWzyfz0hA5KdJxhUG/RtlTzXHPyX+lGq42RgkDB5yUKta69wymFYX4vfByBtiyWFUyg3vq/8O3JPCLrQ=
X-Received: by 2002:a17:906:64cf:b0:994:1fc7:a7e6 with SMTP id
 p15-20020a17090664cf00b009941fc7a7e6mr6538711ejn.4.1689401476675; Fri, 14 Jul
 2023 23:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-postal-affiliate-0d61a209897f@spud> <ZLAoIWX+qqWvucWz@xhacker>
 <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
 <20230713-statutory-balance-f2c9e862f2e3@spud> <CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com>
 <20230714-saturate-verbalize-27571671249d@spud> <20230714-scrambled-monogram-0dd1029a030c@spud>
In-Reply-To: <20230714-scrambled-monogram-0dd1029a030c@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 15 Jul 2023 14:11:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBNzi=-6QVzqDWWO3nZFMiD2vjiei-i5O2bO2GZ0Fh+A@mail.gmail.com>
Message-ID: <CAJF2gTTBNzi=-6QVzqDWWO3nZFMiD2vjiei-i5O2bO2GZ0Fh+A@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, palmer@dabbelt.com, heiko@sntech.de, 
	charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_231122_038467_AC0DA2A9 
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

T24gU2F0LCBKdWwgMTUsIDIwMjMgYXQgMjo0NeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCAxMjoxMDoyNFBNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCAwMjox
NDo0NVBNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBh
dCAxOjQ14oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4g
Pgo+ID4gPiA+IE9uIFRodSwgSnVsIDEzLCAyMDIzIGF0IDAxOjMzOjU2UE0gLTA0MDAsIEd1byBS
ZW4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIEp1bCAxMywgMjAyMyBhdCAxMjo0OOKAr1BNIEpp
c2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFdl
ZCwgSnVsIDEyLCAyMDIzIGF0IDA2OjQ4OjAyUE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgLyoKPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAqICJWIiBpbiBJU0Egc3RyaW5ncyBpcyBhbWJpZ3VvdXMgaW4gcHJhY3RpY2U6
IGl0IHNob3VsZCBtZWFuCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgKiBqdXN0IHRoZSBz
dGFuZGFyZCBWLTEuMCBidXQgdmVuZG9ycyBhcmVuJ3Qgd2VsbCBiZWhhdmVkLgo+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICogTWFueSB2ZW5kb3JzIHdpdGggVC1IZWFkIENQVSBjb3JlcyB3
aGljaCBpbXBsZW1lbnQgdGhlIDAuNy4xCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgKiB2
ZXJzaW9uIG9mIHRoZSB2ZWN0b3Igc3BlY2lmaWNhdGlvbiBwdXQgInYiIGludG8gdGhlaXIgRFRz
Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgKiBhbmQgbm8gVC1IZWFkIENQVSBjb3JlcyB3
aXRoIHRoZSBzdGFuZGFyZCB2ZXJzaW9uIG9mIHZlY3Rvcgo+ID4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICogYXJlIGluIGNpcmN1bGF0aW9uIHlldC4KPiA+ID4gPgo+ID4gPiA+ID4gVC1IRUFE
J3MgdmVjdG9yIDEuMCBTb0NzIGlzIGluIGNpcmN1bGF0aW9uLiBLZW5kcnl0ZSBLMjMwIGlzIHRo
ZQo+ID4gPiA+ID4gc2hpcHBlZCBTb0MgY2hpcCwgd2hpY2ggdmVuZG9yIGlkID0gVEhFQURfVkVO
RE9SX0lEIGFuZCB3aXRoIHZlY3Rvcgo+ID4gPiA+ID4gMS4wLgo+ID4gPiA+Cj4gPiA+ID4gV2hl
cmUgY2FuIEkgYnV5IG9uZSwgaWYgaXQgaXMgaW4gY2lyY3VsYXRpb24/Cj4gPiA+ID4gR29vZ2xp
bmcgaW4gRW5nbGlzaCBtaWdodCBub3QgYmUgdGhlIGJlc3QgdGhpbmcgdG8gZG8sIGJ1dCBkb2lu
ZyBzbyBJCj4gPiA+ID4gY291bGQgZmluZCBiYXNpY2FsbHkgbm8gaW5mb3JtYXRpb24gb24gdGhl
IGsyMzAgLSBJIGRpZCBrbm93IGl0IGV4aXN0ZWQKPiA+ID4gPiBhbmQgdHJpZWQgdG8gZmluZCBz
b21lIGluZm8gb24gaXQgYmVmb3JlIHNlbmRpbmcgdGhlIHBhdGNoLgo+ID4gPiA+IElmIGl0IGlz
IG5vdCBpbiBjaXJjdWxhdGlvbiwgdGhlbiB0aGUgY29tbWVudCBpcyBub3QgaW5hY2N1cmF0ZSAm
IHdoZW4KPiA+ID4gPiB0aGV5IGRvIGFycml2ZSB0aGV5IGNhbiB1c2UgdGhlIG5ldyBkZWRpY2F0
ZWQgcHJvcGVydHkgdG8gY29udmV5IHN1cHBvcnQKPiA+ID4gPiBmb3IgdmVjdG9yLgo+ID4KPiA+
IEkgc2F3IHlvdSBzZW50IHRvIFBhbG1lciBhIGxpbmsgdG8gdGhlIGsyMzAuIFdoZW4gSSBjbGlj
a2VkIHRoZSBsaW5rLAo+ID4gaXQgZ2F2ZSAocGVyIGdvb2dsZSB0cmFuc2xhdGUpIHB1cmNoYXNl
IG9wdGlvbnMgZm9yIGsyMTAgYW5kIGs1MTAgb25seS4KPiA+IEkgZmlndXJlIHRoYXQgbWVhbnMg
dGhlcmUgaXMgbm90aGluZyBfcHVibGljbHlfIGF2YWlsYWJsZT8KPiA+Cj4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgKiBQbGF0Zm9ybXMgd2l0aCBULUhlYWQgQ1BVIGNvcmVzIHRoYXQgc3Vw
cG9ydCB0aGUgc3RhbmRhcmQKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAqIHZlcnNpb24g
b2YgdmVjdG9yIG11c3QgcHJvdmlkZSB0aGUgZXhwbGljaXQgViBwcm9wZXJ0eSwKPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAqIHdoaWNoIGlzIHdlbGwgZGVmaW5lZC4KPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAqLwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKGFjcGlf
ZGlzYWJsZWQgJiYgcmlzY3ZfY2FjaGVkX212ZW5kb3JpZChjcHUpID09IFRIRUFEX1ZFTkRPUl9J
RCkgewo+ID4gPiA+ID4gSWYgeW91IGluc2lzdCBvbiBkb2luZyB0aGlzLCBwbGVhc2U6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gaWYgKGFjcGlfZGlzYWJsZWQgJiYgcmlzY3ZfY2FjaGVkX212ZW5kb3Jp
ZChjcHUpID09IFRIRUFEX1ZFTkRPUl9JRCAmJgo+ID4gPiA+ID4gcmlzY3ZfY2FjaGVkX21hcmNo
aWQoY3B1KSA9PSAwICYmIHJpc2N2X2NhY2hlZF9taW1waWQoY3B1KSA9PSAwKSB7Cj4gPiA+ID4K
PiA+ID4gPiBXaHk/IERvZXMgdGhlIGM5MDggcmVwb3J0IG5vbi16ZXJvIG1pbXBpZC9tYXJjaGlk
Pwo+ID4KPiA+ID4gWWVzCj4gPgo+ID4gPiA+IElmIHllcywgZG9lcyBpdCBuZWVkIGVpdGhlciB0
aGUgZXJyYXRhIGZvciBDTU9zIG9yIHRoZSBwYWdlIHRhYmxlcz8KPiA+Cj4gPiA+IEM5MDggaXMg
Y29tcGF0aWJsZSB0byBSVkEyMiBQcm9maWxlLCBoZXJlIGlzIHRoZSBkZXRhaWwgbGluazoKPiA+
ID4gaHR0cHM6Ly94cnZtLmNvbS9jcHUtZGV0YWlscz9pZD00MTA3OTA0NDY2Nzg5OTI4OTYwCj4g
Pgo+ID4gVGhhdCdzIGZhbnRhc3RpYyBuZXdzISBJJ2xsIHN1Ym1pdCBhIHYzIG9mIHRoaXMgd2l0
aCB0aGUgaGFtbWVyIHJlZHVjZWQsCj4gPiBhcyB5b3UgaGF2ZSBzdWdnZXN0ZWQgYWJvdmUuCj4K
PiBGcm9tIHNvbWUgY2hhdCBvbiBJUkMsIEkgcmVhbGlzZWQgdGhhdCB0aGlzIHhydm0uY29tIGxp
bmsgbWVudGlvbnMgdGhhdAo+IHRoZSBjOTA4IHN1cHBvcnRzIGJvdGggWE1BRSBhbmQgU3ZwYm10
Lgo+IElmIGl0IGRvZXMgc3VwcG9ydCBib3RoLCBjb3VsZCB5b3UgZXhwbGFpbiBhYm91dCBob3cg
dGhhdCB3b3Jrcz8KPiBJcyB0aGVyZSBzb21lIENTUiB0aGF0IGFsbG93cyB0byBzd2l0Y2ggYmV0
d2VlbiB0aGVtPwo+IEhvdyBkbyB5b3UgaW50ZW5kIGNvbW11bmljYXRpbmcgdG8gcy1tb2RlIGV0
YyB3aGljaCBvZiB0aGVtIGlzIGluIHVzZT8KV2Ugc3RpbGwga2VlcCBYTUFFIGFzIGEgYmFja3Vw
IHNvbHV0aW9uLCBhbmQgb3VyIGN1c3RvbSBtLW1vZGUgY3NyCnJlZ2lzdGVyIGNvdWxkIHN3aXRj
aCBpdC4gU28gaXQgd291bGRuJ3QgYWZmZWN0IHRoZSBjdXJyZW50IExpbnV4CmNvZGUuIE91ciBu
ZXh0IGdlbmVyYXRpb24gb2YgY29yZXMgd291bGQgYWJhbmRvbiBpdCBncmFkdWFsbHkuCgo+Cj4g
VGhhbmtzLAo+IENvbm9yLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
