Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD16C46CCD
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 22:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tghyZyJZj+k+WqDh5SUmvt8YcOBuS4dI7tsq24WIIrQ=; b=uO5V7ggIHuMTO+
	zuYlxzPbCdgNPBzHsNiSuhJdG9Npf+d2fukGw8j+QndmETbsFgZEenr7CGFz4crg8CX9yCqShFltO
	ojM008OlpBM1O7PBr240wwUpp1Xu150hsMsRwhDxOfd7sKYrR9XRy95m+UqYnnYNnZYu9BEgxjkVv
	osV31dzoq21tk2SKc8okCdGNPgKEq5InJIHxA3Z2DGDlceVE1lzCAv3ht5QklyYffbjZfVAPDjB76
	9qssNJY2VcvycNGVm6EHiz2llLegLmgEY2ChSal4Je2wfi40V9mHklHdJUissLP2riM4c1vOLK0k5
	qP01Ml6N8jy29uo+WVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGRW5-004JLF-2s;
	Thu, 21 Dec 2023 22:27:45 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGRW2-004JKQ-1V
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 22:27:44 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C24FD5C011A;
	Thu, 21 Dec 2023 17:27:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 21 Dec 2023 17:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1703197656;
	 x=1703284056; bh=D3XrcpmwSUo4Jh0flb6Uu5UWPtnHv0fDYb0xkIsdRag=; b=
	ajp0ZrzORgYya9RxrSC/ZBpVlPkUGrydFB9a1C+Gca7EalgQtn7FiKb9R6Odhy7J
	i8kvMh8/kcjR0gORarpO5NYUepVVHH1E+rCRWr7fbrBe42mOoAHaN38taZmWd4nP
	teNmi6NTfY4WZbLiNi3XSopXBJpsRSFwHtiG46STDydYXnyNIQrMOEWY0tuUdU/9
	kGy0OXlT0EQWicbrMmuhIwot0mUTsBu7AmeTxQ7YwcbY4SSHyh+SCjedZ9V7WRDT
	0SNX8m1iSAyMcYZM0lCZ1Ye5/DPCHAzbDf/XHyabnt80gA/1Pcj5WB4nrInI6CEt
	tuMdl17WUq3scRUQ0pcPUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703197656; x=
	1703284056; bh=D3XrcpmwSUo4Jh0flb6Uu5UWPtnHv0fDYb0xkIsdRag=; b=d
	aLkiNZeElD4ukKPg/YCO1frIjgShagfukeUV8psUNAy/UzDB3ZFAcFjtZShvACNN
	o5KcC1zX2m/YQv+k1q+eZj6ryK3zfbaOHghRKytJqH/0SK4+VlCzjOGPQYK+GS2U
	v9xmURPfylN6VLoAapHJbeDZJhdBjcDQ3Nw+tNKL+lM4XbKDb4HPkH30OSJ1+Y6w
	A/2B7W+8AaWXj64lkw0L7ZVDIFeGEExk+Lt2mzOOwI4UJ1eOviNRsrY72/kz26XX
	ObF4FDZYiFaKZUQDYrxfinuginoTMO69ZTZkAiHeIAxUha3kqUmHK2AXznNOujn+
	qkUCa87FZPwiQFu9e9InA==
X-ME-Sender: <xms:17uEZRaZxFCc_FeZ-aGkI6jRraVGGGlQ0-4mFDtN6Ltq6lgOroTStA>
    <xme:17uEZYYOfYHllnQ3ixOcpHjeePW7kPUj8M6FTuuiJ7ew-2JlwPnn1NeL_AAL3gVXz
    fJCwFq6GedQAXFMEI4>
X-ME-Received: <xmr:17uEZT_rMwx0TakRM0FnlG4uWXTObDLepqD1Xr8sYLD6aDKIEzsF1RFw1gtkNYAua65_kt43b40F-aKvnz7qagi5ET8rKNZdvUnnfqk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduhedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekffevjeffffejffetffejhffhtedugfejvdeiudfftedv
    udelhedtjeffgeffkeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:17uEZfovbZw7oktEs-T-41hPO-Q6_tdt7m4vescoLjJPV2Rkafij0Q>
    <xmx:17uEZcrNU_YumQyMsSxmc7kod10T7Uimk-Km_rhYQD-74XnEi2qtjw>
    <xmx:17uEZVS3sI8axrqdgucivL6mvz-aa_scdGI1YKJTbgvQBOQ2wcUvBQ>
    <xmx:2LuEZYchQPEzr_areAYHbz5WJz-8WHI4ATdtrKSgqxhTVPO1DB_tdQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Dec 2023 17:27:34 -0500 (EST)
Message-ID: <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
Date: Thu, 21 Dec 2023 22:27:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, mpe@ellerman.id.au, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, Conor Dooley
 <conor@kernel.org>, hch@lst.de
References: <20231221185152.327231-1-fido_max@inbox.ru>
 <20231221-discount-decade-e306e5878c46@spud>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20231221-discount-decade-e306e5878c46@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_142742_596760_2F526D5C 
X-CRM114-Status: GOOD (  20.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy8xMi8yMSAyMDoyOSwgQ29ub3IgRG9vbGV5IOWGmemBkzoKPiArIENocmlzdG9w
aAo+Cj4gSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlzIGNvcnJlY3QuIFJlZ2FyZGxlc3Mgb2Yg
d2hldGhlciB3ZSBzdXBwb3J0Cj4gY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRpb25zLCBETUEgaXMg
YXNzdW1lZCB0byBiZSBjb2hlcmVudCB1bmxlc3MKPiBwZXJpcGhlcmFscyBldGMgYXJlIHNwZWNp
ZmllZCB0byBvdGhlcndpc2UgaW4gRFQgKG9yIGhvd2V2ZXIgQUNQSSBkZWFscwo+IHdpdGggdGhh
dCBraW5kIG9mIHRoaW5nKS4KPgo+IFdoYXQgcHJvYmxlbSBhcmUgeW91IHRyeWluZyB0byBzb2x2
ZSBoZXJlPwo+Cj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMDk6NTE6NTJQTSArMDMwMCwgTWF4
aW0gS29jaGV0a292IHdyb3RlOgo+PiBOb3QgYWxsIHRoZSBSSVNDViBhcmUgRE1BIGNvaGVyZW50
IGJ5IGRlZmF1bHQuCgpTb3JyeSBmb3IgY2hpbWUgaW4gaGVyZS4KSU1PIGlmIHlvdXIgcGxhdGZv
cm0gaXMgbm90IGNvaGVyZW50IGJ5IGRlZmF1bHQsIGp1c3QgaW5zZXJ0IAoiZG1hLW5vbmNvaGVy
ZW50IgphdCBkZXZpY2V0cmVlIHJvb3Qgbm9kZS4KClRoYW5rcwotIEppYXh1bgoKPiBXaGF0IGlz
IGEgIlJJU0NWIj8gSSBiZWxpZXZlIHRoaXMgc2VudGVuY2Ugc2hvdWxkIGJlICJub3QgYWxsIFJJ
U0MtVgo+IHN5c3RlbXMgYXJlIERNQSBjb2hlcmVudC4iIGJ1dCB0aGF0IGlzIHByb3ZpZGVkIGZv
ciBieSB0aGUKPiAiZG1hLW5vbmNvaGVyZW50IiBwcm9wZXJ0eSwgc2V0IGZvciBwZXJpcGhlcmFs
cyAob3IgYnVzZXMpIHRoYXQgYXJlIG5vdAo+IERNQSBjb2hlcmVudC4KPgo+PiBNb3Jlb3ZlciB3
ZSBoYXZlCj4+IFJJU0NWX0RNQV9OT05DT0hFUkVOVCBvcHRpb24uCj4+IFNvIHNldCBBUkNIX0RN
QV9ERUZBVUxUX0NPSEVSRU5UIG9ubHkgd2hlbiBSSVNDVl9ETUFfTk9OQ09IRVJFTlQgaXMgbm90
IHNldAo+Pgo+PiBGaXhlczogYzAwYTYwZDZmNGExICgib2Y6IGFkZHJlc3M6IGFsd2F5cyB1c2Ug
ZG1hX2RlZmF1bHRfY29oZXJlbnQgZm9yIGRlZmF1bHQgY29oZXJlbmN5IikKPj4gU2lnbmVkLW9m
Zi1ieTogTWF4aW0gS29jaGV0a292IDxmaWRvX21heEBpbmJveC5ydT4KPj4gLS0tCj4+ICAgYXJj
aC9yaXNjdi9LY29uZmlnIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4+IGluZGV4IGQ2ODI0YmVjMmMwMC4uMTExYzVkOTJkNTAzIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCj4+IEBAIC0xNCw3ICsxNCw3IEBAIGNvbmZpZyBSSVNDVgo+PiAgIAlkZWZfYm9vbCB5Cj4+
ICAgCXNlbGVjdCBBQ1BJX0dFTkVSSUNfR1NJIGlmIEFDUEkKPj4gICAJc2VsZWN0IEFDUElfUkVE
VUNFRF9IQVJEV0FSRV9PTkxZIGlmIEFDUEkKPj4gLQlzZWxlY3QgQVJDSF9ETUFfREVGQVVMVF9D
T0hFUkVOVAo+PiArCXNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UIGlmICFSSVNDVl9E
TUFfTk9OQ09IRVJFTlQKPiBJIHRoaW5rIHRoaXMgaXMgYWN0dWFsbHkgYnVnZ3ksIGZvciB0aGlu
Z3MgbGlrZSBkaXN0cm8ga2VybmVscwo+IFJJU0NWX0RNQV9DT0hFUkVOVCB3aWxsIGFsd2F5cyBi
ZSBzZXQsIGJ1dCB0aG9zZSBrZXJuZWxzIGFyZSBleHBlY3RlZAo+IHRvIGJlIHVzZWQgb24gc3lz
dGVtcyB0aGF0IGFyZSBjYWNoZSBjb2hlcmVudCBhbHNvLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgo+
Cj4+ICAgCXNlbGVjdCBBUkNIX0VOQUJMRV9IVUdFUEFHRV9NSUdSQVRJT04gaWYgSFVHRVRMQl9Q
QUdFICYmIE1JR1JBVElPTgo+PiAgIAlzZWxlY3QgQVJDSF9FTkFCTEVfU1BMSVRfUE1EX1BUTE9D
SyBpZiBQR1RBQkxFX0xFVkVMUyA+IDIKPj4gICAJc2VsZWN0IEFSQ0hfRU5BQkxFX1RIUF9NSUdS
QVRJT04gaWYgVFJBTlNQQVJFTlRfSFVHRVBBR0UKPj4gLS0gCj4+IDIuNDAuMQo+Pgo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
