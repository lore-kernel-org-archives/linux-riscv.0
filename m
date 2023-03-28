Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500FEC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdTudJCnFuU80do102W6ihz6vVKJLXNjo7C6TJko9BA=; b=DIhcxwaEow4yZW
	nzpf0a3EQrcqpcoc5GfoXoUCROw6C1gZDcqVh1pQp4Wr9uK7tP6ysNqP+kZlUmv8eWzNiNsp8lKe7
	c15pss8ITMbokHV4tRk0+3Yb01iu64/QYfflHaq4Rur/rPggO/gi6ZkglthcYOpyHXU9rMGdth1BB
	jwtuhZXHgY1+NXlfV7TUQDyzmWPFpLdAXyaQRXWRZV6ZL5km3PZmtdQ0KsoeaD8VY9E8y48XAa8Zb
	0WOoTXHKJr1sDVSkSY7ZZLVpFDFkguZhrwXFzQKibDHY3GrkW4ZU03oPmHRO5VY5gTs5n38yJrb5I
	c2UMUv5Ke0lefJb/kpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8yE-00EU2x-2s;
	Tue, 28 Mar 2023 13:02:38 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8y9-00EU1b-1C
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 13:02:37 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2497E5C0068;
	Tue, 28 Mar 2023 09:02:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 28 Mar 2023 09:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1680008547; x=1680094947; bh=RgfOcRz7Y9eemhhj/K9vB90mPZhFUINw5BF
	WLJTEWvg=; b=XT1bkKRGOh2E/x5JAYAuMLyNiDnIUuvpodvt5driju1aWi80oeN
	mPc0FqqTR2bqYsXBLvTzWR/01JPImuxllDpvWUHmHHbK6ccdBe4cs1pCTptd/4C6
	Cai74nhcYmf7d1MGKvueVSauZ1D5LyaEREBsyJy5pKdN0Mv5h1LHjHc3JZKMyOs/
	1OpH4tfi2KLvjPWyOjiTrRyGnabyS1zzk1qo/3H8c9l6Yc8QNYdFbHLxP/JIH0Xg
	fjAB+m3OG1Cy4jAsWMBQ3j/3LpGA2tH7LYxwDPG1Pw1E9S54FBLwr+VN/qhb1QzY
	43YM4j4NrQTCpmO+XA4Ho2pHKstjkg9QQgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680008547; x=1680094947; bh=RgfOcRz7Y9eemhhj/K9vB90mPZhFUINw5BF
	WLJTEWvg=; b=Ng4ehF7ju2al1N83yAu1TPFPrqY8x8L44K+/SjGec6oyQfK57hp
	BAOLQ0pPp1sE0oealjiVsj/Gou+YqDkaT9UZJ0SJGpnQgfQ52iI5RmKL4CRneZL1
	KTyarNnWIpXVVAJAGXpQNJSmXJUCcQcc9JCfKpzU5YrBxqFR2fA0lMCzDxUuDSyb
	yMjn2VwXBQDc9MZGRqLd+eFg/8cWcSRjr5aTECiN1I58+CT4zNKyFfwecDrrcu5k
	L+WZ4ejxgDmPFJyqtcbqQ45pQxwzAlUUwZw9gbdGcpX952vig83kp8ddce4W0/Z0
	c9EnQ7uUQOH2mRigkfDEIr1RrR9M0Ghg4Pg==
X-ME-Sender: <xms:YeUiZDu9OG480fT8HAXyiUJiwyAATFHVvxjH3VB-CAFjpZ5PMUZpHA>
    <xme:YeUiZEewhcybDReytqiXw6s8ezwnOSY7ApkZ9Edsx7gI-RH7AsBnrVtohaavhR7oP
    E_iA20oDhTblJazl-k>
X-ME-Received: <xmr:YeUiZGwwIDzGdySRBP3SKo_ItGOA5wjfWoYSHxwydHxCBqvOupm3j-ybPCDBmS-YbuLO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:YeUiZCMSqRV3eaooG1vh72OUOb3OZZBs1PGMZo9g9r4L0XtLzOst5w>
    <xmx:YeUiZD_vz22qEpX_9pGKYk4PlQSqSh6Tt5h8OlIYeOoF7aFlfvvDvg>
    <xmx:YeUiZCUUdkNhGjeBz3hWAHzJA5R__gsxJcWyeg1v1L7QnBsYIekjdw>
    <xmx:Y-UiZGXDEOYvSE_eKUnGgZOtc9OvLtb-xcYXbTgnhv2pd44pm-_4lw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 09:02:23 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230328074511.GA6188@alpha.franken.de>
Date: Tue, 28 Mar 2023 14:02:12 +0100
Cc: Christoph Hellwig <hch@lst.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 Rob Herring <robh+dt@kernel.org>,
 m.szyprowski@samsung.com,
 Robin Murphy <robin.murphy@arm.com>,
 linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 frowand.list@gmail.com
Message-Id: <9CCE7638-91FE-4B1F-9EAC-17362C041CE9@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230323072944.GA18524@lst.de>
 <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
 <20230323213930.GA7730@lst.de>
 <CB41D3AF-20F6-42F3-9168-C0D6E716431A@flygoat.com>
 <20230328011812.GA21977@lst.de> <20230328074511.GA6188@alpha.franken.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_060233_611958_4346042F 
X-CRM114-Status: GOOD (  13.01  )
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

Cgo+IDIwMjPlubQz5pyIMjjml6UgMDg6NDXvvIxUaG9tYXMgQm9nZW5kb2VyZmVyIDx0c2JvZ2Vu
ZEBhbHBoYS5mcmFua2VuLmRlPiDlhpnpgZPvvJoKPiAKPiBPbiBUdWUsIE1hciAyOCwgMjAyMyBh
dCAwMzoxODoxMkFNICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4gT24gRnJpLCBN
YXIgMjQsIDIwMjMgYXQgMDk6MTc6MzhBTSArMDAwMCwgSmlheHVuIFlhbmcgd3JvdGU6Cj4+Pj4g
Cj4+Pj4gSXMgcGF0Y2ggYSA2LjMgY2FuZGlkYXRlIG9yIHNob3VsZCBhbGwgb2YgaXQgZ28gaW50
byA2LjQ/Cj4+PiAKPj4+IFBsZWFzZSBsZWF2ZSBpdCBmb3IgNi40LCBhcyBjb3JyZXNwb25kaW5n
IE1JUFMgYXJjaCBwYXJ0IHdpbGwgYmUgYSBwYXJ0IG9mIDYuNC4KPj4gCj4+IE9rLiAgSSdsbCBy
ZWFsbHkgbmVlZCByZXZpZXcgZnJvbSB0aGUgTUlQUyBhbmQgZHJpdmVycy9vZi8gbWFpbnRhaW5l
cnMsCj4+IHRocm91Z2guCgorY2MgZGV2aWNldHJlZSBmb2tzLgoKPiAKPiBJIGRvbid0IHNlZSBh
bnkgTUlQUyBjaGFuZ2VzIGluIHRoZSBzZXJpZXMgYmVzaWRlcyB0aGUgaWZkZWYgQ09ORklHX01J
UFMKPiBwYXJ0IGluIHBhdGNoIDEsIHdoaWNoIGdldHMgcmVtb3ZlZCBhZ2FpbiBpbiBwYXRjaCA0
IChjaGFuY2UgdG8gZHJvcAo+IHRoYXQgY29tcGxldGVseSA/KS4KCkl0IHdhcyBzdWdnZXN0ZWQg
YnkgRE1BIGZvbGtzIHRvIGhhdmUgdGhhdCBwYXRjaC4KCj4gSSd2ZSBtZXJnZWQgdGhlIGNvcnJl
c3BvbmRpbmcgTUlQUyBwYXRjaGVzIGludG8gbWlwcy1uZXh0IGxhc3Qgd2Vlay4KClRoYW5rcwot
IEppYXh1bgoKPiAKPiBUaG9tYXMuCj4gCj4gLS0gCj4gQ3JhcCBjYW4gd29yay4gR2l2ZW4gZW5v
dWdoIHRocnVzdCBwaWdzIHdpbGwgZmx5LCBidXQgaXQncyBub3QgbmVjZXNzYXJpbHkgYQo+IGdv
b2QgaWRlYS4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBb
IFJGQzE5MjUsIDIuMyBdCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
