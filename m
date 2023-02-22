Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7253C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gwl9QRSDR7wpL8jIHdqtZ1sf+oT6rs4xgUzQR7ZxVqY=; b=acvIieJSFBdoRU
	Zuh1SM2Uj0hmHIwSzehV4obQCGf6D1+fD61q51r5RwyqyVnOa9SXRXhYMyLs3NoFLp3UI1/FQkVWd
	Uaaw1anmLjyzteEm75GWPjRdUv9O3OwSck6Cl+PJSFn9lYfHcIM7veREsj7aSGXI9CJp4uFErbSdy
	8UkIIqsct08QMxpunpPKV5DGVX2PwajyATsQ6dt94Ku0eOpId7f9TirPd+chGQYvytnv4r6E0bD22
	hlYC9hF8OVGi8vPJ/wSsv0WR723teTZwW9xgT635XlQrvVtwKZ6snxmM3XPUK9zJTb9pEUj6tiRIr
	8/H7UFZ4zD30J1VU8osg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrr9-00D0Td-5B; Wed, 22 Feb 2023 16:20:35 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrr6-00D0So-JK
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 16:20:34 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2AF9A5C018E;
	Wed, 22 Feb 2023 11:20:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 22 Feb 2023 11:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1677082830; x=
	1677169230; bh=kzskNhpptCNQhEyW8N0s/Y2SBLiuAR1hHYf0f9/K3zg=; b=T
	AyHXSKkHwSjilQaew4qRTwWHwt2jz4tbwRAl3CIfWklG/QDTOkG8OK2mamrvW479
	ww6s0xYyLbvryi3gvyI09pvLQxaiM+SZzKKUHB0rt611d58oYVHf3XzjimPmdOZS
	Ic5L3RKAGe7gPNrGBOqzS2/eVwxZTBjs3P4vZRvkx9UxW+KiE7i/bs2Vn7RleK2l
	mYHJ2a9VK1njwo7UVoHx5iRqEBMx5OmxKypLp92XIcZcRQ+vGYTwho2LzbXYqJOG
	xnaCQI3zp/AxJsf+rLr9YfTyhnq3knCQqcXvxBq67kKSCz0DshZnbVNyS0WOZy08
	nYPE2vc2wKGBwasLaFsfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677082830; x=
	1677169230; bh=kzskNhpptCNQhEyW8N0s/Y2SBLiuAR1hHYf0f9/K3zg=; b=l
	vadaZEYKHdwFf4NpbvEl6NPn5bHG9hBtNUAFCTpMIGKlZSQHbhoibHR0g9yw8NGj
	dQWpJo1Gh3a/40e0zgglspofSCbjrG1eRyyh1XPaxxlZpwEuXDY6nZE0i2Yww4pG
	hfAhXBDlfdtx1UXMSTwks1W38HqldA9FBwiiOgvq5SAw4s3RfArRwr3zviYowUUv
	zQy0i8GyuB8ji/jZL1VdeIABvMGmIihTGHw/BHKC3XSfSlsxs+KedR/ox7zGfmN1
	8LBxCq1MNVgC2Q1dlVpljhkDc0ijAZG/8GyL/BmdSmuaMmanRXKCf2jyLaJpLs6o
	Or/JqyWqcwMcAbeML4xhg==
X-ME-Sender: <xms:zUD2Yw55UP5cnyvs-u4LNCbZtuKDqYULRkSoekcS-kGnKZD94tXEag>
    <xme:zUD2Yx475JkcJHYXeFGIwFY1vcuW_syVe2q4SoVm3RI1MjZfzJWEz8LnqFG3gT7oJ
    09f8nEGihpITRrcPb4>
X-ME-Received: <xmr:zUD2Y_d3Ug5NuAJf_OC_rajz4KCYYxvCsGUZNID4Nly92bvvQ9Bk-ix5W9xYGyRJQW3p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:zUD2Y1JqfD_L-pRclDZ_TM5zhrl9hHs3YRAOLIXCKNQXLd7N2ksShw>
    <xmx:zUD2Y0K1WivTuu2FgVIR-aorE2W80V9Cr49LXcvy43mk_XeLZawPWg>
    <xmx:zUD2Y2wVN8pbmUZh5rbdxcENcsjLYdcmfu1GOSIh1pq3Vb_28Bq4vQ>
    <xmx:zkD2YyxbrTl97kGiZUHbSKXgSrqn3I1neBxGLffeQblnnguUc45NPA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 11:20:27 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 2/3] riscv: Set dma_default_coherent to true
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <Y/Y8lEndecMfD+Ur@spud>
Date: Wed, 22 Feb 2023 16:20:16 +0000
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 mpe@ellerman.id.au,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 Rob Herring <robh+dt@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 m.szyprowski@samsung.com,
 robin.murphy@arm.com,
 linux-riscv@lists.infradead.org
Message-Id: <E46E0161-24E3-4185-B408-9357C49F1B51@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-3-jiaxun.yang@flygoat.com> <Y/YrvDBJcYUQt4WC@spud>
 <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com> <Y/Y8lEndecMfD+Ur@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_082032_737325_D8EAC327 
X-CRM114-Status: GOOD (  18.81  )
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

Cgo+IDIwMjPlubQy5pyIMjLml6UgMTY6MDLvvIxDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+IOWGmemBk++8mgo+IAo+IE9uIFdlZCwgRmViIDIyLCAyMDIzIGF0IDAzOjU1OjE5UE0gKzAw
MDAsIEppYXh1biBZYW5nIHdyb3RlOgo+PiAKPj4gCj4+PiAyMDIz5bm0MuaciDIy5pelIDE0OjUw
77yMQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiDlhpnpgZPvvJoKPj4+IAo+Pj4gT24g
V2VkLCBGZWIgMjIsIDIwMjMgYXQgMDE6Mzc6MTFQTSArMDAwMCwgSmlheHVuIFlhbmcgd3JvdGU6
Cj4+Pj4gRm9yIHJpc2N2IG91ciBhc3N1bXB0aW9uIGlzIHVubGVzcyBhIGRldmljZSBzdGF0ZXMg
aXQgaXMgbm9uLWNvaGVyZW50LAo+Pj4+IHdlIHRha2UgaXQgdG8gYmUgRE1BIGNvaGVyZW50Lgo+
Pj4+IAo+Pj4+IEZvciBkZXZpY2V0cmVlIHByb2JlZCBkZXZpY2VzIHRoYXQgaGF2ZSBiZWVuIHRy
dWUgc2luY2UgdmVyeSBiZWdpbmluZwo+Pj4+IHdpdGggT0ZfRE1BX0RFRkFVTFRfQ09IRVJFTlQg
c2VsZWN0ZWQuCj4+Pj4gCj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlheHVuIFlhbmcgPGppYXh1bi55
YW5nQGZseWdvYXQuY29tPgo+Pj4+IC0tLQo+Pj4+IGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMg
fCAzICsrKwo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+PiAKPj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMKPj4+PiBpbmRleCAzNzZkMjgyN2U3MzYuLjM0YjM3MTE4MDk3NiAxMDA2NDQKPj4+
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc2V0dXAuYwo+Pj4+IEBAIC0zMDAsNiArMzAwLDkgQEAgdm9pZCBfX2luaXQgc2V0dXBf
YXJjaChjaGFyICoqY21kbGluZV9wKQo+Pj4+IHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUoKTsK
Pj4+PiByaXNjdl9maWxsX2h3Y2FwKCk7Cj4+Pj4gYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMoKTsK
Pj4+PiArI2lmZGVmIENPTkZJR19SSVNDVl9ETUFfTk9OQ09IRVJFTlQKPj4+PiArIGRtYV9kZWZh
dWx0X2NvaGVyZW50ID0gdHJ1ZTsKPj4+PiArI2VuZGlmCj4+PiAKPj4+IERvIHdlIHJlYWxseSBu
ZWVkIHRvIGFkZCBpZmRlZmZlcnkgZm9yIHRoaXMgaGVyZT8KPj4+IEl0J3MgYWx3YXlzIGNvaGVy
ZW50IGJ5IGRlZmF1bHQsIHNvIHdoeSBkbyB3ZSBuZWVkIHRvIHNheSBzZXQgaXQgaW4KPj4+IHNl
dHVwX2FyY2goKSB3aGVuIHdlIGtub3cgdGhhdCwgcmVnYXJkbGVzcyBvZiBvcHRpb25zLCBpdCBp
cyB0cnVlPwo+PiAKPj4gQmVjYXVzZSB0aGlzIHN5bWJvbCBpcyBvbmx5IGEgdmFyaWFibGUgd2hl
bjoKPj4gCj4+IGRlZmluZWQoQ09ORklHX0FSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UpIHx8
IFwKPj4gZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVSkgfHwgXAo+PiBk
ZWZpbmVkKENPTkZJR19BUkNIX0hBU19TWU5DX0RNQV9GT1JfQ1BVX0FMTCkKPj4gCj4+IFdoaWNo
IGlzIG9ubHkgdHJ1ZSBpZiAgQ09ORklHX1JJU0NWX0RNQV9OT05DT0hFUkVOVCBpcyBzZWxlY3Rl
ZC4KPj4gCj4+IE90aGVyd2lzZSB0aGlzIHN5bWJvbCBpcyBkZWZpbmVkIHRvIHRydWUgYW5kIHdl
IGNhbuKAmXQgbWFrZSBhIGFzc2lnbm1lbnQgdG8gaXQuCj4gCj4gTWF5YmUgSSBhbSBqdXN0IHNs
b3cgdG9kYXksIGJ1dCBJIGRvbid0IGdldCB3aHkgeW91IG5lZWQgdG8gYWRkCj4gaWZkZWZmZXJ5
IHRvIHNldHVwX2FyY2goKSB0byBkbyBzb21ldGhpbmcgdGhhdCBpcyBhbHdheXMgdHJ1ZS4KPiBX
aHkgY2FuJ3QgeW91IGp1c3Qgc2V0IHRoaXMgaW4gcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmM/
IFdoYXQgYW0gSQo+IG1pc3Npbmc/CgpIbW0gdGhhdCBzb3VuZHMgbGlrZSBhIGdvb2QgaWRlYSBi
dXQgSSB3YXMgdW5hYmxlIHRvIGZpbmQgYSBwbGFjZSBmb3IgdGhpcy4KCnJpc2N2L21tL2RtYS1u
b25jb2hlcmVudC5jIGFyZSBqdXN0IGEgYnVuY2ggb2YgY2FsbGJhY2tzLCB0aGVyZSBpcyBubyBp
bml0aWFsaXNhdGlvbgpmdW5jdGlvbiB0aGF0IHdpbGwgYWx3YXlzIHJ1biBvbiBldmVyeSBib290
LiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQgaXMgb25seQpjYWxsZWQgY29uZGl0aW9uYWxs
eS4KClBlcmhhcHMgSSBjYW4gYWRkIGEgaW5pdGNhbGwgaW4gZG1hLW5vbmNvaGVyZW50LmMgYnV0
IGl0IHNlZW1zIHRvIGJlIGEgbGl0dGxlIGJpdApvdmVya2lsbGluZy4KCkFjdHVhbGx5IEnigJlk
IHByZWZlciB0byBoYXZlIGEgY29uZmlnIG9wdGlvbiBmb3IgdGhlIGRlZmF1bHQgdmFsdWUgYnV0
IGl0IHNlZW1zIGxpa2UKaXTigJlzIG5vdCBpbiBDaHJpc3RvcGjigJlzIGZsYXZvdXIuCgpUaGFu
a3MKLSBKaWF4dW4KCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
