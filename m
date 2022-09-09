Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D8ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 03:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J622ccv/JtDn2c69Yk6VpsY/rzioQvjk/hT66yTgE6c=; b=th5hFFluksPOpyZcbFFz8WKpLL
	7tLr67jesZdITSCKOiOJhvI/VpZVu9oAOjci5rO02ntjadj9tyv07HUgcCifyV+r/ajI8+BH9b6N4
	/6i+rmfI3bmNLIwRVB0EHYO6iaUYZpi/8qyoGoooDhr4PEPB+mOHqyabZsoGcFV1Uh8OlRkBET/xs
	ijvX8m94dVUxMgjTJ2zs3GrDAM1nF2OFGGAavumZ22pBEv7gl05cCXTATOPCYoDj7JHUuQdqDzMhG
	xgjkAGRpATEhQ0EfiiI9o+9sUJpHWRs2KBMv/s1pEEFB0QRx11bbN+UmrZxGufpRou6f//UACXLjg
	8M45aWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWUuC-00BqiU-3A; Fri, 09 Sep 2022 03:42:12 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWUu8-00Bqfm-Tj
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 03:42:10 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id F3A575C0087;
	Thu,  8 Sep 2022 23:42:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 08 Sep 2022 23:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1662694927; x=
	1662781327; bh=hHcRVaJDud/Kkwj96NHPi6sduLW48zHvi95z05DrcZM=; b=R
	yzDn6bSgQ9fyqJoqSbrYu/CpkvLBdEPqdFYHDGTVbGmED49rI51HW9+pJ4J/0C8n
	2AIuXjp4KvGDAEpuAhFEqKJZUrvl2V/iWoaRL6EReOfkmcVaGFZ86fnRjnOMNnsn
	GVYgBwdiOO2yzy6pfKoVlTaghkZ7bWMthnZWahTzmoHitrOEZPF2h2HjFP10HUTa
	zEebWXQArm+TXyOFsWxOa2p121mlrl2lTuwBI3C3nIlmL+/Z1Va8hshgg/im3nwt
	o+DqGuFbXpdT6VOUuHvk/bHJ67zCp0rXPP7SgdSlDE+IEPmzipGWRoZJBM+xbVLP
	+HxYQvxAXCJGgr66gz94w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662694927; x=
	1662781327; bh=hHcRVaJDud/Kkwj96NHPi6sduLW48zHvi95z05DrcZM=; b=f
	rV/SjL4XvIfnU4Dzej6LrZmJJMuw/hFjTcei3tVYxch/RbPsjItXbRFO4y+xNFYz
	Qr4NMxj902kv76XLcvXXo/CBJZbxcc4DoMv+rPP1KZaHcPL4QUVEkLd7V6wvdLSh
	SaVJIoTAVwkDo/VV8/oY7f9b0gg3Y2gsqAd34DzyA0koZDvhmpzeZMgyNWEyWv1N
	lHNtlehWE8uw045FigZCYudf51G3NANIVkg5zDknxsYc1777YYocNBL9OZjOLCm4
	KV8qr9ALacd3xgej3Q3yQnuLPMYt3Di94+pLfMDLCy9TaIOBHgydAlbD1dYjU5fv
	LPQGIO/7QK7NmJWlMo/xg==
X-ME-Sender: <xms:D7YaY9LYwZ3ckTY5KkEq3d2eF7SQOJkzifwqeDRSkXn5msoDRrQIIA>
    <xme:D7YaY5IZ5JmeCsWYe6COcwqhKTSB1ms6gUm59tdBTyJax_LODBa7Q6tQpvyFLWgJK
    PDMEYD7bI3elMMUXg>
X-ME-Received: <xmr:D7YaY1tnEJseTRlxT0hJ4zdX_QDf3UlOgrUSklA5cGXJIXEIngqDn3JPp4pf7harkenpSVl9QTtyI2RkE2Q0yuK1Yaory8Aipmk6wC6ojoKFtzJpwXVyJTJ_GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtgedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedtvefhheehgfdvkeetffeludeuudehudeuvddtveelleekvedv
    uedviefhkeeuheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:D7YaY-Yvnzk6zVR-NXRj6mzK98B9YiRu2pRq7_logQEU-yrIwa__uw>
    <xmx:D7YaY0bNG2buxhBr6ZBqCdIvb3Ta1rnHfoAtq74qoydD2o3v08eV9w>
    <xmx:D7YaYyDnseUnCj0dWMLyBT0z9zNTBxXGwvuD3_6QxepPX6NA5o-0QA>
    <xmx:D7YaY6wdmXnEKB-Zwp3yftpPOhXQUT05jscMzhvCoheKxfZ4xlthuw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 23:42:06 -0400 (EDT)
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
To: Conor Dooley <conor.dooley@microchip.com>, andre.przywara@arm.com
Cc: Jessica Clarke <jrtc27@jrtc27.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jernej.skrabec@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 wens@csie.org, robh+dt@kernel.org, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com>
 <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
 <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
 <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
 <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
 <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
 <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com>
 <C0B4F750-1C99-408A-A2DA-B72BBF7361B4@jrtc27.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b3fdb3cc-a8fc-b980-c8f4-f96d4733ce56@sholland.org>
Date: Thu, 8 Sep 2022 22:42:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <C0B4F750-1C99-408A-A2DA-B72BBF7361B4@jrtc27.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_204209_055468_568B6981 
X-CRM114-Status: GOOD (  17.81  )
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

T24gOC8yMi8yMiAxMDoyOSBBTSwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4gT24gMjIgQXVnIDIw
MjIsIGF0IDE0OjU2LCBjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToKPj4KPj4gT24g
MjIvMDgvMjAyMiAxMzozMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+Pj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Pgo+Pgo+Pgo+Pj4+IERvIHlvdSB0aGluayB0aGlz
IGlzIHdvcnRoIGRvaW5nPyBPciBhcmUgeW91IGp1c3QgcHJvdmlkaW5nIGFuCj4+Pj4gZXhhbXBs
ZSBvZiB3aGF0IGNvdWxkIGJlIGRvbmU/Cj4+Pgo+Pj4gSnVzdCBzb21lIGJyYWluc3Rvcm1pbmcu
Li4KPj4+Cj4+Pj4gV2hlcmUgd291bGQgeW91IGVudmlzYWdlIHB1dHRpbmcgdGhlc2UgbWFjcm9z
PyBJIGZvcmdldCB0aGUgb3JkZXIKPj4+PiBvZiB0aGUgQ1BQIG9wZXJhdGlvbnMgdGhhdCBhcmUg
ZG9uZSwgY2FuIHRoZXkgYmUgcHV0IGluIHRoZSBkdHM/Cj4+Pgo+Pj4gVGhlIFNPQ19QRVJJUEhF
UkFMX0lSUSgpIG1hY3JvIHNob3VsZCBiZSBkZWZpbmVkIGluIHRoZQo+Pj4gQVJNLWJhc2VkIFNv
Qy5kdHNpIGZpbGUgYW5kIHRoZSBSSVNDLVYtYmFzZWQgU29DLmR0c2kgZmlsZS4KPj4KPj4gUmln
aHQsIG9uZSBsZXZlbCB1cCBidXQgfnRoZSBzYW1lIHJlc3VsdC4KPj4KPj4KPj4+Pj4gTmljZSEg
QnV0IGl0J3MgZ29ubmEgYmUgYSB2ZXJ5IGxhcmdlIGludGVycnVwdC1tYXAuCj4+Pj4KPj4+PiBJ
IHF1aXRlIGxpa2UgdGhlIGlkZWEgb2Ygbm90IGR1cGxpY2F0aW5nIGZpbGVzIGFjcm9zcyB0aGUg
YXJjaHMKPj4+PiBpZiBpdCBjYW4gYmUgaGVscGVkLCBidXQgbm90IGF0IHRoZSBleHBlbnNlIG9m
IG1ha2luZyB0aGVtIGhhcmQgdG8KPj4+PiB1bmRlcnN0YW5kICYgSSBmZWVsIGxpa2UgdW5mb3J0
dW5hdGVseSB0aGUgbGFyZ2UgaW50ZXJydXB0IG1hcCBpcwo+Pj4+IGluIHRoYXQgdGVycml0b3J5
Lgo+Pj4KPj4+IEkgZmVlbCB0aGUgc2FtZS4KPj4+IEV2ZW4gbGlzdGluZyBib3RoIGludGVycnVw
dCBudW1iZXJzIGluIFNPQ19QRVJJUEhFUkFMX0lSUShuYSwgbnIpCj4+PiBpcyBhIHJpc2sgZm9y
IG1ha2luZyBtaXN0YWtlcy4KPj4+Cj4+PiBTbyBwZXJzb25hbGx5LCBJJ20gaW4gZmF2b3Igb2Yg
dGVhY2hpbmcgZHRjIGFyaXRobWV0aWMsIHNvIHdlIGNhbgo+Pj4gaGFuZGxlIHRoZSBvZmZzZXQg
aW4gU09DX1BFUklQSEVSQUxfSVJRKCkuCj4+Cj4+IFl1cCwgaW4gdGhlIHNhbWUgYm9hdCBoZXJl
LiBtYXliIEknbGwgZ2V0IGJvcmVkIGVub3VnaCB0byBiaXRlLi4KPiAKPiBOb3RlIHRoYXQgR1BM
4oCZZWQgZHRjIGlzbuKAmXQgdGhlIG9ubHkgaW1wbGVtZW50YXRpb24uIEZyZWVCU0QgdXNlcyBh
Cj4gQlNELWxpY2Vuc2VkIGltcGxlbWVudGF0aW9uWzFdIGFuZCBzbyBhZGRpbmcgbmV3IGZlYXR1
cmVzIGxpa2UgdGhpcyB0bwo+IEdQTCBkdGMgdGhhdCBhY3R1YWxseSBnZXQgdXNlZCB3b3VsZCBy
ZXF1aXJlIHVzIHRvIHJlaW1wbGVtZW50IGl0IHRvby4KPiBJIGRvbuKAmXQga25vdyBob3cgbXVj
aCBlZmZvcnQgaXQgd291bGQgYmUgYnV0IHBsZWFzZSBrZWVwIHRoaXMgaW4gbWluZC4KCkkgcGxh
biB0byBnbyB3aXRoIHRoZSAiU09DX1BFUklQSEVSQUxfSVJRKG5hLCBucikiIGltcGxlbWVudGF0
aW9uIGZvciB2Mi4gSSBsaWtlCnRoYXQgaXQgb25seSBhZmZlY3RzIHRoZSBEVCBzb3VyY2UsIGFu
ZCBkb2VzIG5vdCBsZWFrIGludG8gdGhlIERUQi4gV2Ugc3RpbGwKaGF2ZSB0aGUgZnJlZWRvbSB0
byBzd2l0Y2ggdG8gdXNpbmcgYXJpdGhtZXRpYyBsYXRlciB3aGVuIGFsbCBvZiB0aGUgdG9vbHMK
c3VwcG9ydCBpdC4KCk15IG90aGVyIGNvbmNlcm4gaXMgdGhhdCB0aGUgYmlnIGludGVycnVwdC1t
YXAgcHJvcGVydHkgd291bGQgbWFrZSBEVCBvdmVybGF5cwpldmVuIG1vcmUgcGFpbmZ1bCB0byBk
ZWFsIHdpdGguIEkgZG9uJ3QgdGhpbmsgb3ZlcmxheXMgY2FuIGFwcGVuZCB0byBhIHByb3BlcnR5
LApvbmx5IHJlcGxhY2UgaXQuCgpSZWdhcmRzLApTYW11ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
