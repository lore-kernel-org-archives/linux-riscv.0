Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3637E7AD41
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOlHeeJ1MsHscNUdmMTxXx0flcz0A7HKxx+yGIQZxU4=; b=JRHEVbo5p0kjFf
	mGIZa6BncCqJ9v9V3vX106r73OG5tA+0fFfThjWgcFR5u4c1ccUjGtw6BXeiE9FbURC9HD2B0LL7r
	ebZDDLWOMEwCBINNFhkhTMMwiLlHNV2Z+hBrfowhwLqs9sDYxGp6gPGLDJKEFb54rcpCkPO1hGO0P
	41V1ToFYkkZ4+tUKytiKRHB06SZl40wK8o6IrlT56BfDXW/HOZo1OZtwlvB7Bd3wEfFF3MpqMIbdl
	XlKrDEKxYFJaj0bGTEwtWmE9xXpAZI1T/+zBEKOmE0/pDNMlscgRKeSnEw2onhYZzKcEzlLVJbBK9
	dsq5X7yhChxaCXyv8TXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYh4e-00000000Eq1-0zMl;
	Thu, 25 Dec 2025 08:51:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYh4b-00000000EpP-0XWP;
	Thu, 25 Dec 2025 08:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85030405FD;
	Thu, 25 Dec 2025 08:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AF0C4CEF1;
	Thu, 25 Dec 2025 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766652712;
	bh=D9mysTcv+Jgh35PRk6Sd3Rn3Bu9gIl/Jg7Ezf6E68ag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gN1gv9OVCSNgOkGlHboJ16lonZxFU2Tp7IU07L5a3//qsgtDy3MeYkXZR/q0yGJWA
	 KwdmyrmwuhruBE6FAdTDKKVhKgah1xZ9p4BuB5nbPQPNr+uQa2jm+2FxjA08Deqw9G
	 94itPTsGuBVPmomvGaXrseALwpI6yDVCIaH2lZM6RlNwMfSoiY9mdNF96DO6FKa68o
	 Kh9s0gornhY5u9V/4Q97VSpeCAW6suYslJkHrRLUFZfSRi7VyrqaFAroiGjNYH2Xr+
	 EY5rCYO2A33Y1DL1tQoFwKb3uPrFACfhIL2ViSTLefsc37GxopRByhr83OpgbAo/WL
	 dG1UUWIpS+Zlw==
Message-ID: <3538f671-8a16-4b71-b15f-3ef5cfeacd40@kernel.org>
Date: Thu, 25 Dec 2025 09:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] virt: Add Bao hypervisor IPC and I/O dispatcher
 drivers
To: joaopeixoto@osyx.tech, linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org,
 neil.armstrong@linaro.org, palmer@dabbelt.com, pjw@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
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
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_005153_209049_A9EF9C5A 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

T24gMjQvMTIvMjAyNSAxNDo1Miwgam9hb3BlaXhvdG9Ab3N5eC50ZWNoIHdyb3RlOgo+IEZyb206
IEpvw6NvIFBlaXhvdG8gPGpvYW9wZWl4b3RvQG9zeXgudGVjaD4KPiAKPiBUaGlzIHNlcmllcyBp
bnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBCYW8gaHlwZXJ2aXNvciBndWVzdC1zaWRlIGRyaXZl
cnMKPiB1bmRlciBkcml2ZXJzL3ZpcnQvYmFvIGFuZCB0aGUgYXNzb2NpYXRlZCBEZXZpY2UgVHJl
ZSBiaW5kaW5ncywgVUFQSSwKPiBhbmQgTUFJTlRBSU5FUlMgZW50cmllcy4KPiAKPiBCYW8gaXMg
YSBsaWdodHdlaWdodCBzdGF0aWMtcGFydGl0aW9uaW5nIGh5cGVydmlzb3IgZm9yIGVtYmVkZGVk
IGFuZAo+IHNhZmV0eS1jcml0aWNhbCBzeXN0ZW1zLiBUaGlzIHNlcmllcyBhZGRzOgo+IC0gVGhl
IEJhbyBJUEMgc2hhcmVkIG1lbW9yeSBkcml2ZXIsIHdoaWNoIGVuYWJsZXMgTGludXggZ3Vlc3Rz
IHRvCj4gICBjb21tdW5pY2F0ZSB3aXRoIGVhY2ggb3RoZXIgdGhyb3VnaCBzaGFyZWQgbWVtb3J5
IHJlZ2lvbnMuCj4gLSBUaGUgQmFvIEkvTyBEaXNwYXRjaGVyIGRyaXZlciwgd2hpY2ggYWxsb3dz
IEJhbydzIFZNcyB0byBzaGFyZSBJL08KPiAgIGRldmljZXMgdXNpbmcgZGV2aWNlIHBhcmF2aXJ0
dWFsaXphdGlvbiAoVmlydElPKS4KPiAKCgpOb25lIG9mIHRoZXNlIHBhdGNoZXMsIGV4Y2VwdCBN
QUlOVEFJTkVSUyByZWFjaGVkIG15IG1haWxib3guIEZpeCB5b3VyCnN1Ym1pc3Npb24gcHJvY2Vz
cywgc28gaXQgd2lsbCBub3QgYmUgbWFya2VkIGJ5IHNwYW0gYW5kIGJvdW5jZWQuCgpCZXN0IHJl
Z2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
