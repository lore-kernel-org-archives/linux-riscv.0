Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FF0C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 21:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXLvwuKRL8kWNKbztOhZ/+ri8gPaiiLr8qHenN/gxQE=; b=p68b9WXDxTucEe
	aSiBn8M0LlzahZA1ugLunK42RcwvcbBrTSVa3hKv+BU3i1AE8KFWYykRJL1WZA6GpvBTUeqqj/utq
	NBxugb/fl1K4XkB37RRMi6xi2BMsLukD64UwX/RdGhUsHyCyKM/JxELNrsU4gFv27hVmssMiWA3kR
	GdF0gL1WgeEPii8Irksw9aq/4juTHtcFxSpiexnqQtDMrSdI2KfodXRQMbYgBV8IibGSNfEHNiUlD
	C/4yXIfGG28ZHUzL5P6XnM+XWo1X4fX5P2zcvx27maNMBcy/GFA9sKVXtMwtEw0u/XB0rvcKZE1gu
	cUAausDDDWu2sE/uYzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouKQW-00E1Rg-N4; Sun, 13 Nov 2022 21:22:04 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouKQT-00E1IR-MG
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 21:22:03 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 29A165C0040;
	Sun, 13 Nov 2022 16:21:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 13 Nov 2022 16:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1668374513; x=
	1668460913; bh=41XsqqrtZaCPmz3R0QiN55X2zsU649LxW6CyggTOBgQ=; b=e
	Omn3Suo8Oc0kU4YHCSixyFeJEYm38Y78b24Fn/V9G4kw0RT7/u04fFk1jcHOJ/ol
	vKv55VmLH2JQyfvGY2VE2bhgmpK6V7LypV+nCoupRD7yxHai+a8InmwLl2Iv/vz7
	6ej8jPu98jOFovYs0N+Sf1Lq6L0/1jDwzYWF9YQ/CYs9Gd1EkLXaqb4OkVjgL76p
	eVm6bzPL/KPOwd49ykUjAz5mK1DB8RpB57yZSIvw65DlI+LUkDKrXyi8T4+rQr9/
	OtWqOLrv8+UqzAuml6CMIKvHIOCilKvihoYloqcUrWm5goMdZBuLEuuVrwJYNHCi
	9p1KLirsqBkN0A94FLRBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668374513; x=
	1668460913; bh=41XsqqrtZaCPmz3R0QiN55X2zsU649LxW6CyggTOBgQ=; b=u
	B3NqL3I2749BLXJ+Til1k7oa1Efk1kp63RGOoCmuhhATtjjbFOlKKimX/Va3Scfn
	fPVvZJISiFkO/rZK7h5gaXSVv1Vdmz3mlvveaGgBhytTeWeZRj44ZDzzeG1PKQlM
	Q2VRCTMrgJ+PfDAEIlXH6JftTEZHgHhCsMZ0EPMPqcBOT0V9E6o/j5D/UyHLj+Y3
	i3gyG81bBfinYtvP7FrdvaHrnpgUoFBA9hPNo5YZmYys/20Xt6lv0MEJ6hWf+0Q+
	MEE7boFJTj/kN7uu0ckyheep1/aKqfgPZk+tpPVTNseOu/+QZt45evQo68n32X8G
	v/0W+4YtNVd9M3XOQyD4Q==
X-ME-Sender: <xms:8F9xY4oU_T0ldh0R8d9Tuz7e7tj_0DY2NNQr9C8TQAtm-Gi9kV43jw>
    <xme:8F9xY-rWY6iBMzFOfRp03ziiqkGhQZIB-xW4NiHxaFy0B8UhcqlQrxvVLDGVf2ELM
    SXFSlLuNGm_xfXlTg>
X-ME-Received: <xmr:8F9xY9MVsWhYxhLOuGK2MbEa2pRHp7YaHwur4kj-0DNKDBwQovJ4GDjuYB0m5dnw-ocO91wLo8VUOA0B0z_RzAJYErAuJZ_cLJmEqoF0yb62keajCjp-EWrthQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedtgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefgtdfgleffkeevledvueetteefgfellefhjeetieeuhfehteeu
    feefgfehfeevfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8F9xY_5IaQpIdgm6G1R1y28qH7A8_BvAxjKKCHZAk13vn6bypLvQmA>
    <xmx:8F9xY34M1NAa55Dx27DpjmtsEU0UiB63VSskjIhcjpy3AkYtvFEV1Q>
    <xmx:8F9xY_ghkbbiHJv5sYkykeD3Pt9Y6uUdWROJoxDrKGRGbRWDpVJXcw>
    <xmx:8V9xY0uwYHFr7XGwuCnBFOQFYodVp2-yLTPaCbej-yVAdR9UpTMgJw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 16:21:51 -0500 (EST)
Message-ID: <d28c69b9-0b78-aa96-1e73-6ef81539fa8b@sholland.org>
Date: Sun, 13 Nov 2022 15:21:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] riscv: mm: Proper page permissions after initmem free
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>
References: <20221112113543.3165646-1-bjorn@kernel.org>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221112113543.3165646-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_132202_227033_130DEDF7 
X-CRM114-Status: GOOD (  15.91  )
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

T24gMTEvMTIvMjIgMDU6MzUsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IDY0LWJpdCBSSVNDLVYga2VybmVscyBoYXZl
IHRoZSBrZXJuZWwgaW1hZ2UgbWFwcGVkIHNlcGFyYXRlbHksIGFuZCBpbgo+IGFkZGl0aW9uIHRv
IHRoZSBsaW5lYXIgbWFwLiBXaGVuIHRoZSBrZXJuZWwgaXMgbG9hZGVkLCB0aGUgbGluZWFyIG1h
cAo+IG9mIGtlcm5lbCBpbWFnZSBpcyBzZXQgdG8gUEFHRV9SRUFEIHBlcm1pc3Npb24sIGFuZCB0
aGUga2VybmVsIG1hcCBpcwo+IHNldCB0byBQQUdFX1JFQUQgYW5kIFBBR0VfRVhFQy4KPiAKPiBX
aGVuIHRoZSBpbml0bWVtIGlzIGZyZWVkLCB0aGUgY29ycmVzcG9uZGluZyBwYWdlcyBpbiB0aGUg
bGluZWFyIG1hcAo+IHNob3VsZCBiZSByZXN0b3JlZCB0byBQQUdFX1JFQUQgYW5kIFBBR0VfV1JJ
VEUuIFRoZSBjb3JyZXNwb25kaW5nCj4gcGFnZXMgaW4gdGhlIGtlcm5lbCBtYXAgc2hvdWxkIGFs
c28gYmUgcmVzdG9yZWQgdG8gUEFHRV9SRUFEIGFuZAo+IFBBR0VfV1JJVEUsIGJ5IHJlbW92aW5n
IHRoZSBQQUdFX0VYRUMgcGVybWlzc2lvbiwgYW5kIGFkZGluZwo+IFBBR0VfV1JJVEUuCj4gCj4g
VGhpcyBpcyBub3QgdGhlIGNhc2UuIEZvciA2NC1iaXQga2VybmVscywgb25seSB0aGUgbGluZWFy
IG1hcCBpcwo+IHJlc3RvcmVkIHRvIGl0cyBwcm9wZXIgcGFnZSBwZXJtaXNzaW9ucyBhdCBpbml0
bWVtIGZyZWUsIGFuZCBub3QgdGhlCj4ga2VybmVsbWFwLgo+IAo+IEluIHByYWN0aXNlIHRoaXMg
cmVzdWx0cyBpbiB0aGF0IHRoZSBrZXJuZWwgY2FuIHBvdGVudGlhbGx5IGp1bXAgdG8KPiBkZWFk
IF9faW5pdCBjb2RlLCBhbmQgc3RhcnQgZXhlY3V0aW5nIGludmFsaWQgMHhjYyBpbnN0cnVjdGlv
bnMsCj4gd2l0aG91dCBnZXR0aW5nIGFuIGV4Y2VwdGlvbi4KPiAKPiBSZXN0b3JlIHRoZSBmcmVl
ZCBpbml0bWVtIHByb3Blcmx5LCBieSBzZXR0aW5nIGJvdGggdGhlIGFsaWFzIChrZXJuZWwKPiBt
YXApIGFuZCB0aGUgbGluZWFyIG1hcCB0byB0aGUgY29ycmVjdCBwZXJtaXNzaW9ucy4KPiAKPiBG
aXhlczogZTVjMzVmYTA0MDE5ICgicmlzY3Y6IE1hcCB0aGUga2VybmVsIHdpdGggY29ycmVjdCBw
ZXJtaXNzaW9ucyB0aGUgZmlyc3QgdGltZSIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5j
IHwgMTAgKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQu
b3JnPgpUZXN0ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPiAjIG9u
IEQxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
