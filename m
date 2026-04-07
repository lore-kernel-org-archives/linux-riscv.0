Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D866CEDB7C8
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32dHKw/8B2PnJSYbiTh55hH1/erKu7PKV5gDOHmBHNc=; b=q9LIkqjPzW+Vwi
	ZSORJ1sZd9iZyW0TulF229sh+rSUVJQUWym/x2ceKK8t+K5M5X0yoHujw3rjl+LptbO/KfafxR542
	4IBzTDe+seggxS2D4L9fidzTijl0DiFzzMAMGPtL1HTkfvKaQ03fpPHchzK0RrDDX4yuNo4qs0hox
	ZhvXG44PX3iF9ym4A6BgK915DXZpRDJYyQo+yRjffrmp9FAoJTyIjSs/UsQcmEJNJ/JwztywRJygi
	aCinTbs8SqW7oHX2RYkWfM51SDZ5caidExauJbnvb88/wf5Dj6XujCxfo5e1WYiDSc5aFGffgiM6u
	JmcmgwEMg+XZNYUDNBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA109-000000065Ho-1ZeW;
	Tue, 07 Apr 2026 07:37:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA106-000000065Gh-1mku
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 07:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C88A243B17;
	Tue,  7 Apr 2026 07:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BECC116C6;
	Tue,  7 Apr 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775547449;
	bh=BFFsI3LeN7f2LzSaom7luMGiKHZgnhrFdc4/ppxffj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fdS4v3Kx90ZiW1zfPnNzjMVvSi2ExUDPHP4ccdjpazBkUmlr3Luso1vA0xZDeqGGL
	 VwIj2PC+2MPQeJs2aaxAcrk12QcFE+Fh/i0hNE6MrQHrIyobd0vbcU6batS1/dccI/
	 UrULAUUVd61OZr9svWmE4R3lYxcnF32EUUnaXRiYlxuOV+aqe2YZEtScKWD4kcnZ8F
	 aJZscF0dJqH8mSyipLMrWNKkTFN1VsQUleM1Prk1ZeAoyKZ2AEpYV/TR9hOZ46Mkv6
	 7+ENnniFLo7LifiM52eEv2Hl4f97OgkFoQjmEomNX1hP385tKdtTEfiSY5Zs4/7pvI
	 i48vzIc5INIPw==
Message-ID: <db8e3d41-bd17-424c-8b04-7b51a0726420@kernel.org>
Date: Tue, 7 Apr 2026 09:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/13] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-2-changhuang.liang@starfivetech.com>
 <20260405-nocturnal-mighty-pegasus-eff399@quoll>
 <ZQ4PR01MB1202F9AC0B854D3341EB2CAFF25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <ZQ4PR01MB1202F9AC0B854D3341EB2CAFF25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_003730_556430_BBA690FA 
X-CRM114-Status: GOOD (  15.55  )
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

T24gMDcvMDQvMjAyNiAwOTozNCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToKPiBIaSwgS3J6eXN6
dG9mCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+PiBPbiBUaHUsIEFwciAwMiwgMjAy
NiBhdCAxMDo0OTozM1BNIC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3RlOgo+Pj4gQWRkIGRv
Y3VtZW50YXRpb24gdG8gZGVzY3JpYmUgU3RhckZpdmUgSkhCMTAwIFNvQyBTeXN0ZW0gQ29udHJv
bGxlcgo+Pj4gUmVnaXN0ZXJzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlh
bmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4+IC0tLQo+Pj4gIC4uLi9z
b2Mvc3RhcmZpdmUvc3RhcmZpdmUsamhiMTAwLXN5c2Nvbi55YW1sICB8IDE0MAo+PiArKysrKysr
KysrKysrKysrKysKPj4+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDUgKwo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKykKPj4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQKPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2Mvc3RhcmZpdmUvc3RhcmZpdmUsamhiMTAwLXN5c2Nvbi4KPj4+IHlhbWwKPj4+Cj4+PiBk
aWZmIC0tZ2l0Cj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvc3Rh
cmZpdmUvc3RhcmZpdmUsamhiMTAwLXN5c2NvCj4+PiBuLnlhbWwKPj4+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9zdGFyZml2ZS9zdGFyZml2ZSxqaGIxMDAtc3lzY28K
Pj4+IG4ueWFtbAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uYzBlMWY2ZjY4ZmEyCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3N0YXJmaXZlL3N0YXJmaXZlLGpoYjEwMC1zCj4+PiAr
KysgeXNjb24ueWFtbAo+Pj4gQEAgLTAsMCArMSwxNDAgQEAKPj4+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMgo+Pj4gKy0tLQo+
Pj4gKyRpZDoKPj4+ICtodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb2Mvc3RhcmZpdmUv
c3RhcmZpdmUsamhiMTAwLXN5c2Nvbi55YW0KPj4+ICtsIwo+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4gKwo+Pj4gK3RpdGxlOiBT
dGFyRml2ZSBKSEIxMDAgU29DIHN5c3RlbSBjb250cm9sbGVyCj4+PiArCj4+PiArbWFpbnRhaW5l
cnM6Cj4+PiArICAtIEtldmluIFhpZSA8a2V2aW4ueGllQHN0YXJmaXZldGVjaC5jb20+Cj4+PiAr
ICAtIENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4K
Pj4+ICsKPj4+ICtkZXNjcmlwdGlvbjoKPj4+ICsgIFRoZSBTdGFyRml2ZSBKSEIxMDAgU29DIHN5
c3RlbSBjb250cm9sbGVyIHByb3ZpZGVzIHJlZ2lzdGVyCj4+PiAraW5mb3JtYXRpb24gc3VjaAo+
Pj4gKyAgYXMgb2Zmc2V0LCBtYXNrIGFuZCBzaGlmdCB0byBjb25maWd1cmUgcmVsYXRlZCBtb2R1
bGVzIHN1Y2ggYXMgUExMIGFuZAo+PiBQQ0llLgo+Pgo+PiBIb3cgYSBNTUlPIGJhc2VkIGRldmlj
ZSBjYW4gcHJvdmlkZSBhIE1NSU8gaW5mb3JtYXRpb24/IFdoYXQgZXhhY3RseQo+PiBkb2VzIGl0
IHByb3ZpZGU/IFJlZ2lzdGVyIHdoZXJlIHRoZSB2YWx1ZSBpcyB0aGUgb2Zmc2V0IG9mIG90aGVy
IHJlZ2lzdGVyPwo+IAo+IEZvciBleGFtcGxlOgo+IGluIHBlcjEgc3lzY29uOgo+IG9mZnNldCAw
eDQgaXMgdGhlIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24gZm9yIGltcGxlbWVudGluZyBlTU1DIGV4
dGVuZGVkIGZ1bmN0aW9ucywgCj4gYW5kIG9mZnNldHMgMHg0MOKAkzB4NGMgYXJlIHVzZWQgZm9y
IFBMTDcgcmVnaXN0ZXIgY29uZmlndXJhdGlvbi4KPiAKPiBJbiBzeXMwIHN5c2NvbjoKPiBvZmZz
ZXRzIDB4MOKAkzB4MmMgYXJlIHVzZWQgZm9yIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24gb2YgUExM
MiB0byBQTEw1LCAKPiBhbmQgb2Zmc2V0IDB4MzggaXMgdXNlZCBmb3IgcmVnaXN0ZXIgY29uZmln
dXJhdGlvbiB0byBwcm92aWRlIHRoZSBwcm9kdWN0IElELgoKVGhhdCdzIG5vdCB3aGF0IHRoZSB0
ZXh0IHNhaWQuIFlvdSB3cm90ZSB0aGUgZGV2aWNlLCBpbiBNTUlPIHJlZ2lzdGVycywKcHJvdmlk
ZXMgaW5mb3JtYXRpb246IG9mZnNldCwgbWFzayBhbmQgc2hpZnQuCgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
