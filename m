Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594DCC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 02:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uynr7sodzqTIp6zoJhK4VcuaoRmEUHE8VFSiHXH7ag0=; b=05NsP8cWLlkQ3kTaeBuC0SPnDd
	2pvc2//kkhBN8FxlStAlH8eSzWNrRcbESPM1TnDEAL+F4NX/U2e2768DGwDMnSUJOkcM99HstZVuu
	i1NOK9ONI4mpc4xVLsdeNr2dhx3ZXZTA5JaO6NZBCXOJ4QSJ4XxxEW3WM/Ts1ma/aRAckGHKoYaCr
	lAmc98jHWWQS0lTmBf72SHhQDWZhRFwRXpC6ZV1oEOMf7KPDCxnsWj/vUfpHuN7Q20YkdvfNulwsa
	VSwKbsz3tKl0Yzpc6NbxAddvO0zcj06sp2b42IPMfj5o7c/co8xbd2FnWbUjcEJ16pU8aid7MXXlo
	GwvmZSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfY6Z-00C38N-7J; Sat, 16 Apr 2022 02:24:07 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfY24-00C0Sw-Fq
 for linux-riscv@lists.infradead.org; Sat, 16 Apr 2022 02:19:31 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4DAE23202175;
 Fri, 15 Apr 2022 22:19:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 15 Apr 2022 22:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1650075565; x=
 1650161965; bh=uR0sd88BLmMrf7MsnBeqOtT78ti+J0aJP6bHQT/zSLE=; b=E
 glxmXf+SI4CDdpXMXB7wN8WI0nFOSI23u7ZE/NmHcY9fcYGe5lROyBIcXGYYigE0
 ThIPTBbNiL8GaKnb58hGC3jCNtT4y8XeKMFhye1oE2meRNObKP9M+tBkCkiD8FMW
 XrjpIEV11wbY5nEL+zBy7noJuVyeIMxnXQGCIvmPQ5wr3G8ynoKqd9tt/x9LTUro
 WaJ7+oSzZWRh4LG6rzB/ngcmEH+wLjsgXd+jmsoTkSSxQ+drzoHjOlL0VikdsGLb
 Krw3Cseicac7j+KqGDTeeqGTj9nydcJ/rSIYGxMmuYdvPAhjUPXo+d3M3fm1JIRT
 zBxC4Sv+n+GInvJEEaUhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650075565; x=1650161965; bh=uR0sd88BLmMrf
 7MsnBeqOtT78ti+J0aJP6bHQT/zSLE=; b=Gt8Zt2lEArqf2/mO0KiViDbQJwwy5
 7c+w+8bceIV1BuacYNqOx9IXV7IqXnZK367s+nyObbpceND2jFQw6TJXgl3/LZAC
 cBKHDkiQ0+WUYDmy1enCRpXDS3c9z89hAlSzeSaJPX/9NY5iKdnhMr0STOPifX/J
 V7tPQ5EeCTJ/fUh731G9K56SdkrzZJyjn4M1SjNLJCgCbB/rw90ZcRdNuXZv28s5
 tRHTdCIWP8HPL8Ld2kBvkzvsCddXaNx8rxxYWC4fNy8DNdbxSN0rPXzv1A64bLHd
 a1gWNHRU23X1+pNkzYEglYUjC7Hr/WjAOPoVYleybNJldiebeVAU5v6UQ==
X-ME-Sender: <xms:rSdaYpQF3FHxxFJdLWe3j1gDZh8kZQoHZ_LkqpAvSV3V4U3n1GRoaw>
 <xme:rSdaYix0F0wSy7kbb5KSp939cAV2wSJ48fKFocqw2E2NxnJMPPGKnIM_mn7dRMiPo
 NcN91x9mmc-l_OquQ>
X-ME-Received: <xmr:rSdaYu1WTLDnreKBpf_s2hxCYV6N16iX-S-zJPg4QbVHzjYvaRiw7lWJ40uKboB3zZK0j2TLAtAwVHRe21bcf4qUCkXSC7uzfHr0IxBrXaggc4IrgkNXkVry5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeliedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepuddvleffkeejhfduieelheejteehleefieeikefgteeugefhtdev
 keefvefgheeinecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
 nhgurdhorhhg
X-ME-Proxy: <xmx:rSdaYhBd-ZNa7gitLBsclKr6QZWZ2V3UbqPAuTNMlYzS0_HdYVoNNg>
 <xmx:rSdaYijEzPHMR23ne-4-5q70_FDxXZgyRtY17ZyG4ziRssMGLNvFkA>
 <xmx:rSdaYloRMvK_8NrirfsYODhuSAHB-uMLHfo7QqHECIZZ2K2r3f0xaA>
 <xmx:rSdaYpouN75HsdXz_4oKjYy2bBVDVZIPbxIqvnxa2fKvNdxEr4e95Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Apr 2022 22:19:24 -0400 (EDT)
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, cmuellner@linux.com,
 philipp.tomsich@vrull.eu
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
Date: Fri, 15 Apr 2022 21:19:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <YllWTN+15CoskNBt@Red>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_191928_624763_E167EA3D 
X-CRM114-Status: GOOD (  14.41  )
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

T24gNC8xNS8yMiA2OjI2IEFNLCBDb3JlbnRpbiBMYWJiZSB3cm90ZToKPiBMZSBNb24sIE1hciAw
NywgMjAyMiBhdCAxMTo0NjoxOFBNICswMTAwLCBIZWlrbyBTdHVlYm5lciBhIMOpY3JpdCA6Cj4+
IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBhbHRlcm5hdGl2ZXMgY2hhbmdlcyBkb25lIGlu
IG15IHN2cGJtdCBzZXJpZXMKPj4gYW5kIHRodXMgYWxzbyBkZXBlbmRzIG9uIEF0aXNoJ3MgaXNh
LWV4dGVuc2lvbiBwYXJzaW5nIHNlcmllcy4KPj4KPj4gSXQgaW1wbGVtZW50cyB1c2luZyB0aGUg
Y2FjaGUtbWFuYWdlbWVudCBpbnN0cnVjdGlvbnMgZnJvbSB0aGUgIFppY2JvbS0KPj4gZXh0ZW5z
aW9uIHRvIGhhbmRsZSBjYWNoZSBmbHVzaCwgZXRjIGFjdGlvbnMgb24gcGxhdGZvcm1zIG5lZWRp
bmcgdGhlbS4KPj4KPj4gU29DcyB1c2luZyBjcHUgY29yZXMgZnJvbSBULUhlYWQgbGlrZSB0aGUg
QWxsd2lubmUgRDEgaW1wbGVtZW50IGEKPj4gZGlmZmVyZW50IHNldCBvZiBjYWNoZSBpbnN0cnVj
dGlvbnMuIEJ1dCB3aGlsZSB0aGV5IGFyZSBkaWZmZXJlbnQsCj4+IGluc3RydWN0aW9ucyB0aGV5
IHByb3ZpZGUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSwgc28gYSB2YXJpYW50IGNhbgo+PiBlYXNs
eSBob29rIGludG8gdGhlIGV4aXN0aW5nIGFsdGVybmF0aXZlcyBtZWNoYW5pc20gb24gdGhvc2Uu
Cj4+Cj4+Cj4gCj4gSGVsbG8KPiAKPiBJIGFtIHRlc3RpbmcgaHR0cHM6Ly9naXRodWIuY29tL3Nt
YWV1bC9saW51eC5naXQgYnJhbmNoOm9yaWdpbi9yaXNjdi9kMS13aXAgd2hpY2ggY29udGFpbiB0
aGlzIHNlcmllLgo+IAo+IEkgYW0gaGl0dGluZyBhIGJ1ZmZlciBjb3JydXB0aW9uIHByb2JsZW0g
d2l0aCBETUEuCj4gVGhlIHN1bjhpLWNlIGNyeXB0byBkcml2ZXIgZmFpbCBzZWxmIHRlc3RzIGR1
ZSB0byAiZGV2aWNlIG92ZXJyYW4gZGVzdGluYXRpb24gYnVmZmVyIi4KPiBJbiBmYWN0IHRoZSBi
dWZmZXIgaXMgbm90IG92ZXJyYW4gYnkgZGV2aWNlIGJ1dCBieSBkbWFfbWFwX3NpbmdsZSgpIG9w
ZXJhdGlvbi4KPiAKPiBUaGUgZm9sbG93aW5nIHNtYWxsIGNvZGUgc2hvdyB0aGUgcHJvYmxlbToK
PiAKPiBkbWFfYWRkcl90IGRtYTsKPiB1OCAqYnVmOwo+ICNkZWZpbmUgQlNJWkUgMjA0OAo+ICNk
ZWZpbmUgRE1BU0laRSAxNgo+IAo+IGJ1ZiA9IGttYWxsb2MoQlNJWkUsIEdGUF9LRVJORUwgfCBH
RlBfRE1BKTsKPiBmb3IgKGkgPSAwOyBpIDwgQlNJWkU7IGkrKykKPiAgICAgYnVmW2ldID0gMHhG
RTsKPiBwcmludF9oZXhfZHVtcChLRVJOX0lORk8sICJETUFURVNUMToiLCBEVU1QX1BSRUZJWF9O
T05FLCAxNiwgNCwgYnVmLCAyNTYsIGZhbHNlKTsKPiBkbWEgPSBkbWFfbWFwX3NpbmdsZShjZS0+
ZGV2LCBidWYsIERNQVNJWkUsIERNQV9GUk9NX0RFVklDRSk7CgpUaGlzIGZ1bmN0aW9uICh0aHJv
dWdoIGRtYV9kaXJlY3RfbWFwX3BhZ2UoKSkgZW5kcyB1cCBjYWxsaW5nCmFyY2hfc3luY19kbWFf
Zm9yX2RldmljZSguLi4sIC4uLiwgRE1BX0ZST01fREVWSUNFKSwgd2hpY2ggaW52YWxpZGF0ZXMg
dGhlIENQVSdzCmNhY2hlLiBUaGlzIGlzIHRoZSBzYW1lIHRoaW5nIG90aGVyIGFyY2hpdGVjdHVy
ZXMgZG8gKGF0IGxlYXN0IGFybSwgYXJtNjQsCm9wZW5yaXNjLCBhbmQgcG93ZXJwYykuIFNvIHRo
aXMgYXBwZWFycyB0byBiZSB3b3JraW5nIGFzIGludGVuZGVkLgoKUmVnYXJkcywKU2FtdWVsCgo+
IGRtYV91bm1hcF9zaW5nbGUoY2UtPmRldiwgZG1hLCBETUFTSVpFLCBETUFfRlJPTV9ERVZJQ0Up
Owo+IHByaW50X2hleF9kdW1wKEtFUk5fSU5GTywgIkRNQVRFU1QzOiIsIERVTVBfUFJFRklYX05P
TkUsIDE2LCA0LCBidWYsIDI1NiwgZmFsc2UpOwo+IAo+IFdpbGwgbGVhZCB0bzoKPiBbICAgIDIu
OTYwMDQwXSBETUFURVNUMTpmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZQo+IFsg
ICAgMi45NjUzNTRdIERNQVRFU1QxOmZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZl
Cj4gWyAgICAyLjk3MDcwOV0gRE1BVEVTVDE6ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUgZmVm
ZWZlZmUKPiBbICAgIDIuOTc2MDY5XSBETUFURVNUMTpmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVm
ZSBmZWZlZmVmZQo+IFsgICAgMi45ODE0NDBdIERNQVRFU1QxOmZlZmVmZWZlIGZlZmVmZWZlIGZl
ZmVmZWZlIGZlZmVmZWZlCj4gWyAgICAyLjk4NjgxNF0gRE1BVEVTVDE6ZmVmZWZlZmUgZmVmZWZl
ZmUgZmVmZWZlZmUgZmVmZWZlZmUKPiBbICAgIDIuOTkyMTg4XSBETUFURVNUMTpmZWZlZmVmZSBm
ZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZQo+IFsgICAgMi45OTc1NjBdIERNQVRFU1QxOmZlZmVm
ZWZlIGZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlCj4gWyAgICAzLjAwMjkzNF0gRE1BVEVTVDE6
ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUKPiBbICAgIDMuMDA4MzA3XSBETUFU
RVNUMTpmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZQo+IFsgICAgMy4wMTM2ODBd
IERNQVRFU1QxOmZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlCj4gWyAgICAzLjAx
OTA1NF0gRE1BVEVTVDE6ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUKPiBbICAg
IDMuMDI0NDI3XSBETUFURVNUMTpmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZQo+
IFsgICAgMy4wMjk4MDJdIERNQVRFU1QxOmZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlIGZlZmVm
ZWZlCj4gWyAgICAzLjAzNTE3NV0gRE1BVEVTVDE6ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUg
ZmVmZWZlZmUKPiBbICAgIDMuMDQwNTQ2XSBETUFURVNUMTpmZWZlZmVmZSBmZWZlZmVmZSBmZWZl
ZmVmZSBmZWZlZmVmZQo+IFsgICAgMy40MDE2NDddIERNQVRFU1QzOmE5YzNhOWMzIGE5YzNhOWMz
IGE5YzNhOWMzIGE5YzNhOWMzCj4gWyAgICAzLjQwNjk4Ml0gRE1BVEVTVDM6YTljM2E5YzMgYTlj
M2E5YzMgYTljM2E5YzMgYTljM2E5YzMKPiBbICAgIDMuNDEyMzUwXSBETUFURVNUMzphOWMzYTlj
MyBhOWMzYTljMyBhOWMzYTljMyBhOWMzYTljMwo+IFsgICAgMy40MTc3MjBdIERNQVRFU1QzOmE5
YzNhOWMzIGE5YzNhOWMzIGE5YzNhOWMzIGE5YzNhOWMzCj4gWyAgICAzLjQyMzA5NF0gRE1BVEVT
VDM6ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUKPiBbICAgIDMuNDI4NDY4XSBE
TUFURVNUMzpmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZQo+IFsgICAgMy40MzM4
NDFdIERNQVRFU1QzOmZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlCj4gWyAgICAz
LjQzOTIxM10gRE1BVEVTVDM6ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUKPiBb
ICAgIDMuNDQ0NTg4XSBETUFURVNUMzpmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVm
ZQo+IFsgICAgMy40NDk5NjJdIERNQVRFU1QzOmZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlIGZl
ZmVmZWZlCj4gWyAgICAzLjQ1NTMzNF0gRE1BVEVTVDM6ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZl
ZmUgZmVmZWZlZmUKPiBbICAgIDMuNDYwNzA3XSBETUFURVNUMzpmZWZlZmVmZSBmZWZlZmVmZSBm
ZWZlZmVmZSBmZWZlZmVmZQo+IFsgICAgMy40NjYwODFdIERNQVRFU1QzOmZlZmVmZWZlIGZlZmVm
ZWZlIGZlZmVmZWZlIGZlZmVmZWZlCj4gWyAgICAzLjQ3MTQ1NF0gRE1BVEVTVDM6ZmVmZWZlZmUg
ZmVmZWZlZmUgZmVmZWZlZmUgZmVmZWZlZmUKPiBbICAgIDMuNDc2ODI4XSBETUFURVNUMzpmZWZl
ZmVmZSBmZWZlZmVmZSBmZWZlZmVmZSBmZWZlZmVmZQo+IFsgICAgMy40ODIyMDBdIERNQVRFU1Qz
OmZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlIGZlZmVmZWZlCj4gCj4gRXZlbiB3aXRoIG5vIERN
QSBhY3Rpb24sIHRoZSBidWZmZXIgaXMgY29ycnVwdGVkLgo+IAo+IFJlZ2FyZHMKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
