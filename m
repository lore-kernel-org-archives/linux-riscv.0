Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D9606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qHKko9no;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nWQGHyd3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jgJg9fO+CzOwLlAUCbL0819EbMzLHQWNpMvpT9PVoi4=; b=qHKko9no6ydeNEWSESmbjPC5hJ
	t/e9D+wrHvI2WJeSc/v48Mlv7K81BQPd0LoioYVXuV/CIfe2Ch81MqZHzcL/MbazNqsjlBaL1QYYG
	OPE1LFRnr7I1II/JCBWuf8Y5BSspID2BiScFSJeKiPMiYRgS7/qnTmXjtIlaA0qmSuiBSuDgwKJ7K
	b32cDIikY7lTR49HFNY+4DjwVHrARIPV0JNqcgE2l/VporGCvzzUwfw4mAe3scoszH+qc1BcQcylG
	Y1G1qTtTsRxrt+js/61n/niXHz/QYxt/Ftv590sbOThI2/VugooLmR+rZ2Cv4zWvEnqhsbz/w3IKN
	h68JuoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLewd-00000004Nin-15wd;
	Tue, 27 Oct 2026 11:02:19 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLewY-00000004NhQ-2iaj;
	Tue, 27 Oct 2026 11:02:17 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261027110211euoutp02cbe365840510890b9fa3fbb50e26a3cf~iXfpITuJq1916619166euoutp02O;
	Tue, 27 Oct 2026 11:02:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261027110211euoutp02cbe365840510890b9fa3fbb50e26a3cf~iXfpITuJq1916619166euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793098931;
	bh=jgpI6S0BaFwhfvc2kywHp6Ib11nXJqnK3KboerxnZkI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nWQGHyd3uZO8npHAsI3x3z0bNTOciXEMk5qhW0TGGp6BSguiBE0ZHfqmHLqbvDF0H
	 jAsgFMaUbTRuJ/IN+QVwxm1C8lUaP1wIQPSboyhdv4t1SqODkP1rSY8nYzjAcyepN4
	 5vIolx8QDptEdhqq8Oq8lgHHH5v1igum0Z1fTOLc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261027110210eucas1p200692a459e47eae4b88f5f8620738cfd~iXfokDezE2283022830eucas1p2N;
	Tue, 27 Oct 2026 11:02:10 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261027110208eusmtip1bba8e474a6d53be6ac9f0bd553f1da2d~iXfm8DZVs2613526135eusmtip1G;
	Tue, 27 Oct 2026 11:02:08 +0000 (GMT)
Message-ID: <b9380a0a-49f1-4bb9-a6b7-ca233319b8ad@samsung.com>
Date: Tue, 27 Oct 2026 12:02:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/21] phy: rockchip: inno-hdmi: Use the common
 Innosilicon PHY helpers
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Vinod Koul
	<vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <7069377.kQq0lBPeGt@diego>
X-CMS-MailID: 20261027110210eucas1p200692a459e47eae4b88f5f8620738cfd
X-Msg-Generator: CA
X-RootMTR: 20260929103243eucas1p25abf97a357cfae14640092e35fe479fc
X-EPHeader: CA
X-CMS-RootMailID: 20260929103243eucas1p25abf97a357cfae14640092e35fe479fc
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103243eucas1p25abf97a357cfae14640092e35fe479fc@eucas1p2.samsung.com>
	<20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
	<7069377.kQq0lBPeGt@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_040215_284608_8CCDF42D 
X-CRM114-Status: GOOD (  15.16  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiA5LzMwLzI2IDEyOjE0LCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiBBbSBEaWVuc3RhZywg
MjkuIFNlcHRlbWJlciAyMDI2LCAxMjozMToxNSBNaXR0ZWxldXJvcMOkaXNjaGUgU29tbWVyemVp
dCBzY2hyaWViIE1pY2hhbCBXaWxjenluc2tpOgo+PiBUaGUgUkszMzI4IHByZS1QTEwgcHJvZ3Jh
bW1pbmcsIGl0cyB0YWJsZSBsb29rdXAgYW5kIGl0cyByZWNhbGNfcmF0ZSBhbmQKPj4gZGV0ZXJt
aW5lX3JhdGUgaW1wbGVtZW50YXRpb25zIGFyZSB0aGUgZ2VuZXJpYyBJbm5vc2lsaWNvbiBvbmVz
LCBzbyBkcm9wCj4+IHRoZSBsb2NhbCBjb3BpZXMgYW5kIHVzZSB0aGUgc2hhcmVkIGhlbHBlcnMg
aW5zdGVhZC4KPj4KPj4gVGhlIFJLMzIyOCBwcmUtUExMIHNpdHMgYXQgZGlmZmVyZW50IHJlZ2lz
dGVyIGFkZHJlc3Nlcywgc28gaXQga2VlcHMgaXRzCj4+IG93biByZWdpc3RlciBsZXZlbCBjb2Rl
IGFuZCBvbmx5IHNoYXJlcyB0aGUgdGFibGUgbG9va3VwLgo+Pgo+PiBUaGUgbm93IHVudXNlZCBS
SzMzMjggcHJlLVBMTCByZWdpc3RlciBtYWNyb3MgZ28gd2l0aCBpdCwgYXMgZG9lcyB0aGUKPj4g
bG9jYWwgcHJlLVBMTCBjb25maWcgbG9va3VwIHdyYXBwZXI7IGJvdGggY2FsbCBzaXRlcyBhbHJl
YWR5IGhhdmUgdGhlCj4+IFRNRFMgY2xvY2sgdG8gaGFuZCBhbmQgY2FsbCBpbm5vX2hkbWlfcGh5
X3ByZV9wbGxfbG9va3VwKCkgZGlyZWN0bHkuCj4+Cj4+IFRoZSBSSzMzMjggcmVjYWxjX3JhdGUg
dXNlZCB0byBsb2cgdGhlIHByZS1QTEwgb3V0cHV0IGFzICJ2Y28iLiBUaGUKPj4gc2hhcmVkIGhl
bHBlciBsb2dzIGl0IHRvbywgYW5kIHJlcG9ydHMgdGhlIGFjdHVhbCBWQ08gZnJlcXVlbmN5Cj4+
IGFsb25nc2lkZSB0aGUgcmF0ZSwgd2hpY2ggaXMgdGhlIHZhbHVlIHdpdGggdGhlIDEuNC0zLjIg
R0h6IGNvbnN0cmFpbnQuCj4+Cj4+IFRoZSByZWdpc3RlciB3cml0ZXMsIHRoZWlyIG9yZGVyIGFu
ZCB0aGUgdmFsdWVzIHdyaXR0ZW4gYXJlIHVuY2hhbmdlZC4KPj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UgaW50ZW5kZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+IFJldmlld2VkLWJ5OiBDaGFveWkgQ2hlbiA8Y2hhb3lp
LmNoZW5Acm9jay1jaGlwcy5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+Cj4gCj4gT25seSB0aGluZyBJIGNhbm5vdCByZWFsbHkgbWFrZSB1cCBt
eSBtaW5kIGFib3V0LCBpcyBpZiB0aGlzIGFuZCB0aGUKPiBwcmV2aW91cyBwYXRjaCBzaG91bGQg
YmUgbWVyZ2VkICgibW92ZSBjb21tb24gY29kZSBmcm9tIHJvY2tjaGlwCj4gdmFyaWFudCB0byBz
aGFyZWQgaGVscGVyIikuCj4gCj4gQXMgSSBzYWlkLCBjYW4ndCByZWFsbHkgZGVjaWRlIHdoYXQg
d291bGQgYmUgdGhlIGJldHRlciBzb2x1dGlvbiA7LSkgLgoKSSBzcGxpdCB0aGVtIGRlbGliZXJh
dGVseSBhcyBJIGRvbid0IGhhdmUgUm9ja2NoaXAgaGFyZHdhcmUuIEl0J3MgZWFzaWVyCnRvIHZl
cmlmeSB0aGlzIGNvbW1pdCdzIGNvcnJlY3RuZXNzIGFuZCB0aGUgY2xhaW1zICdubyBmdW5jdGlv
bmFsIGNoYW5nZQppbnRlbmRlZCcgYW5kICd0aGUgcmVnaXN0ZXIgd3JpdGVzLCB0aGVpciBvcmRl
ciBhbmQgdGhlIHZhbHVlcyB3cml0dGVuCmFyZSB1bmNoYW5nZWQnIHdoZW4gc3BsaXQsIGFzIHRo
ZSBwcmV2aW91cyBjb21taXQgb25seSBhZGRzIHRoZSBsaWJyYXJ5CmFuZCB0aGlzIG9uZSBvbmx5
IGRlbGV0ZXMgdGhlIFJLMzMyOCBjb3B5IGFuZCBjYWxscyBpbnRvIGl0LgoKPiAKPiAKPiBIZWlr
bwo+IAo+IAo+IAoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5
bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
