Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73745C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1YQGsKKwfkWWW+ILEJ321CtJevd5cMFHbMIwdYKeas=; b=E7EMOA1ajyece3
	QXvGHF5dIrFAwd0gAkW5Ynsy1IB8EgM2YyWMk0zKBKvHgrBukTfKHbLrZaQQsoucBXxycwL1kXFPH
	YqjG21bVTkxhEQgd288kexU66vjv2EAJXqy95I16M0nofCCdWyb9foPp+XMeO60aIrBqaYI9Rgne1
	zOBTkA6Vy5YfI1oKnclX6rNmP4JAki4qP88Kf8Bc5WiX33FWUBzZS3McEDrClPQ4YxiA3CvAPz9ry
	AEd8PvklxIJsf3UKseM9vgOdqLMpNxBbutz4kB3RKWripkpM8ijf5NJMNcrdkCxSgY+tlBmjte9GJ
	4QdRHbWNAoPCT1BPRbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rz6-0000000DYZe-3ZOa;
	Fri, 18 Sep 2026 06:22:08 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rz3-0000000DYYM-0Kra;
	Fri, 18 Sep 2026 06:22:06 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-01 (Coremail) with SMTP id qwCowADnuu5y2KxqkbJICA--.14966S2;
	Fri, 18 Sep 2026 14:21:41 +0800 (CST)
Message-ID: <b8efa0db854929a353c430f78fffd907bd7ccb65.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Joshua Peisach
 <jpeisach@ubuntu.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andrzej Hajda	 <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
 Yan <andy.yan@rock-chips.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng	
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
 Belhachemi	 <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
 Brunet	 <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
 linux-clk@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, 	linux-riscv@lists.infradead.org, Marek
 Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
 <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Chaoyi
 Chen	 <chaoyi.chen@rock-chips.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>
Date: Fri, 18 Sep 2026 14:21:37 +0800
In-Reply-To: <20260918-futuristic-mindful-waxbill-21fa2d@quoll>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	 <CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com>
	 <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
	 <20260917-mutant-chamois-of-competence-46ca77@quoll>
	 <DLI0QTP0NUHS.DAFYGACKWKWO@ubuntu.com>
	 <20260918-futuristic-mindful-waxbill-21fa2d@quoll>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnuu5y2KxqkbJICA--.14966S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4xKF13WFyUCw1UKF1rWFg_yoW5Jr18pF
	WDK3ZIkr4DJr1xAwn293WjgryF9w47A34Yqry5Wryjvr98tF1rtr4xGr45u3WDKr4fWr42
	vF1jk34fu3sYyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjxU9PfHDUUUU
X-Originating-IP: [112.94.103.44]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_232205_496431_B6DB0015 
X-CRM114-Status: GOOD (  34.24  )
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

5ZyoIDIwMjYtMDktMTjkupTnmoQgMDg6MTYgKzAyMDDvvIxLcnp5c3p0b2YgS296bG93c2tp5YaZ
6YGT77yaCj4gT24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMDg6MzQ6MThQTSAtMDQwMCwgSm9zaHVh
IFBlaXNhY2ggd3JvdGU6Cj4gPiBPbiBUaHUgU2VwIDE3LCAyMDI2IGF0IDI6NTEgQU0gRURULCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gPiBPbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCAw
NTozMjowOVBNICswMjAwLCBNaWNoYWwgV2lsY3p5bnNraQo+ID4gPiB3cm90ZToKPiA+ID4gPiBB
ZGQgdGhlIGR0LWJpbmRpbmcgZm9yIHRoZSBTdGFyRml2ZSBKSDcxMTAgSW5ub3NpbGljb24gSERN
SQo+ID4gPiA+IFBIWS4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGRldmljZSBpcyBhIGNoaWxkIG9m
IHRoZSBzdGFyZml2ZSxqaDcxMTAtaGRtaS1zdWJzeXN0ZW0KPiA+ID4gPiBub2RlLiBJdAo+ID4g
PiA+IGZ1bmN0aW9ucyBhcyBib3RoIGEgUEhZIHByb3ZpZGVyIGZvciB0aGUgY29udHJvbGxlciBh
bmQgYXMgYQo+ID4gPiA+IGNsb2NrCj4gPiA+ID4gcHJvdmlkZXIgZm9yIHRoZSB2YXJpYWJsZSBw
aXhlbCBjbG9jayAoaGRtaV9wY2xrKSwgd2hpY2ggaXQKPiA+ID4gPiBnZW5lcmF0ZXMKPiA+ID4g
PiBmcm9tIGl0cyByZWZvY2xrLgo+ID4gPiA+IAo+ID4gPiA+IFJldmlld2VkLWJ5OiBKb3NodWEg
UGVpc2FjaCA8anBlaXNhY2hAdWJ1bnR1LmNvbT4KPiA+ID4gCj4gPiA+IFdoaWxlIEkgYXBwcmVj
aWF0ZSBvdGhlciBwZW9wbGUgbG9va2luZyBhdCB0aGlzLCBJIGRvbid0IHRoaW5rCj4gPiA+IHJl
dmlldwo+ID4gPiBoZXJlIGFwcGxpZXMuIEl0IHdhcyBhIGJsYW5rZXQgdGFnLCBnaXZlbiB0byB0
aGUgZW50aXJlIHNlcmllcywKPiA+ID4gd2l0aAo+ID4gPiBleGNlcHRpb24gdGhhdCBpdCBpcyBm
cm9tIG5ld2JpZSwgdGh1cyBJIHdhbnQgdG8gYXNrOiB3YXMgdGhpcwo+ID4gPiBiaW5kaW5nCj4g
PiA+IFJFQUxMWSByZXZpZXdlZCBieSBKb3NodWE/Cj4gPiA+IAo+ID4gPiBBcmUgdGhlIHJlc3Qg
b2YgdGhlIHBhdGNoZXMgYWN0dWFsbHkgcmV2aWV3ZWQgb3IganVzdCAibG9va3MgZ29vZAo+ID4g
PiB0bwo+ID4gPiBtZSI/IEkgc2VlIG5vIGNvbW1lbnRzIGZyb20gSm9zaHVhIG9uIHYzLCB2MiBh
bmQgdjEsIHdoaWNoIGlzCj4gPiA+IHVzdWFsIHNpZ24KPiA+ID4gb2YgZG9pbmcgcmV2aWV3Lgo+
ID4gPiAKPiA+ID4gCj4gPiBJIGNvbW1lbnRlZCBvbiB2MyBzYXlpbmcgdGhhdCBJIHdvdWxkIHRl
c3QgaWYgSSBjb3VsZC4gSSBkb24ndCBqdXN0Cj4gCj4gVGVzdGluZyBoYXMgbm90aGluZyB0byBk
byB3aXRoIHJldmlld2luZy4KPiAKPiA+IHRocm93ICJSZXZpZXdlZC1ieSIgb24gZXZlcnl0aGlu
ZyBJIGxvb2sgYXQuCj4gPiAKPiA+IElmIGFueXRoaW5nLCBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIGJl
IG1vcmUgaG9uZXN0IGluIHJldmlld3MsIGFuZAo+ID4gb25seQo+ID4gcmV2aWV3IG9uZXMgdGhh
dCBJIGFjdHVhbGx5IGNhcmUgYWJvdXRbMV0uCj4gCj4gWW91IGdhdmUgYmxhbmtldCB0YWcgZm9y
IGVudGlyZSBzZXJpZXMsIHNvIEkgZG8gbm90IGdldCB0aGlzCj4gYXJndW1lbnQuCj4gCj4gPiAK
PiA+IElmIHJldmlld2luZyBwYXRjaGVzIGlzbid0IGEgZ29vZCB3YXkgZm9yIG5ld2JpZXMgdG8g
c3RhcnQgZ2V0dGluZwo+ID4gZmFtaWxpYXIgd2l0aCB0aGUga2VybmVsIGNvZGUgKGVzcGVjaWFs
bHkgYSBORVcgZHJpdmVyKSwgdGhlbiBJCj4gPiBkb24ndAo+ID4ga25vdyB3aGF0IGlzLgo+IAo+
IFdyaXRpbmcgY29kZSBhbmQgcmVjZWl2aW5nIHJldmlldyBpcyBzb21ldGhpbmcgZm9yIG5ld2Jp
ZXMgdG8gc3RhcnQKPiB3aXRoLiBJZiB5b3UgZG8gbm90IGtub3cga2VybmVsIGNvZGUgb3IgYmlu
ZGluZ3MsIHdoeSBkbyB5b3UgdGhpbmsKPiB5b3VyIHJldmlldyBpcyBhcHBsaWNhYmxlPyBJZiBJ
IHRyeSB0byByZXZpZXcgZGVzaWduIG9mIGEgcG9zdC0KPiB0ZW5zaW9uCj4gY29uY3JldGUgYnJp
ZGdlLCBJIHdvdWxkIHByb2JhYmx5IGxlYXJuIHNvbWV0aGluZy4gV291bGQgbXkKPiByZXZpZXcg
YXBwbHk/IE5vLgoKTXkgcGVyc29uYWwgdGhvdWdodHM6IGV2ZXJ5b25lIHNob3VsZCBiZSBhYmxl
IHRvIHNlbmQgUi1iLCBidXQgdGhlCmVmZmVjdCBvZiB0aGUgUi1iIGRlcGVuZHMgb24gd2hvIHNl
bnQgaXQuCgpJbiB0aGlzIGNhc2UsIEkgYW0gb2theSBhYm91dCBhZGRpbmcgSm9zaHVhJ3MgUi1i
LCBidXQgSSBkb24ndApuZWNlc3NhcmlseSB0aGluayB0aGUgcGF0Y2hzZXQgaXMgcmV2aWV3ZWQg
ZW5vdWdoIGJlY2F1c2Ugb2YgdGhpcyBSLWIuCgpUaGFua3MsCkljZW5vd3kKCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEtyenlzenRvZgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
