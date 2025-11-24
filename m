Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B550CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qa1OanoVTJE9RSb4I5OnFCqV4s5aXTIvK+SHHpFQpKU=; b=xGx4oecgT1PovU
	EuKxR/7oJHGDjtYCKBIuYKKFwJTsVxs9xb7cIE0i0Z7MaCRXNUCD1MTuuvcGF9grwjcGUUMqKB9iN
	NvFowagLsFkPV73WYpQxgON+9nMKP9LltNmZCMWMA9Gjv+R+042JJaVEdI02m5i2Ypag5+fGf4Dzu
	BxIqnFdBfR5rB6yfZ0Fkl26ltWlYOChXHGQLGb8pMRp8KXOw4Pm7Bp+VaJBTLPfv1JH3Az49NHOUT
	0kyYwB2CMm1F3dT4qb9r2iQQlD5KMN9l78AndQZ/Q7bxkqPG2s12JeRiqnJzP8sA9rDhZTkVC2SCf
	I1Bg47zNog4O7rUJpkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUj3-0000000BYVo-34n2;
	Mon, 24 Nov 2025 11:27:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUj1-0000000BYVP-0HVM
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 11:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A25FC601CE;
	Mon, 24 Nov 2025 11:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B437AC4CEFB;
	Mon, 24 Nov 2025 11:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763983637;
	bh=1JEFzMHLZ+LdUNBaFXPJzk4rpLUaWj6ad4he7Tqi0nk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lJkFZB65k1HGnd6RFqN4M7p0Q1zNHNK3K2O4RP15zqMR6EqH847aLgXWjJCA1FCy5
	 X8JkIaOK1afTBHT1Ofs7vHIhIwXVriOlrq+W5MZkf23lgetrOQt4106wx3EqM0FPf5
	 zgOpbvSMzFEEQdZzA6X/dLtG0p4ZC1jtFB3NtUdQlZ7wWfJBfLRV3DVgWJ/o0juhp0
	 MMmCufEyNCTKCeyhUgZan6O7UF/Fu+fqPexTw/BUo2lYmJtUhrjQy7U89XU6MsRQEa
	 yFQ9df1Kga/4la2QORlXsaxtsyLRGZS6uDNPidLrpqJN2A5Z2dxETAUp6zkWT4EJnC
	 1jEPxFI/6Hx+Q==
Message-ID: <6ceb41bc-0597-4ea5-84be-51f53e3bc2d8@kernel.org>
Date: Mon, 24 Nov 2025 12:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
 <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
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
In-Reply-To: <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
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

T24gMjQvMTEvMjAyNSAxMjoxMywgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NOaYn+acn+S4gOeahCAxMjowOSArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjQvMTEvMjAyNSAxMjowNCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IOWcqCAyMDI1
LTExLTI05pif5pyf5LiA55qEIDEyOjAxICswMTAw77yMS3J6eXN6dG9mIEtvemxvd3NraeWGmemB
k++8mgo+Pj4+IE9uIDI0LzExLzIwMjUgMTE6NTIsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+Pj4+
IFZlcmlzaWxpY29uIGhhcyBhIHNlcmllcyBvZiBkaXNwbGF5IGNvbnRyb2xsZXJzIHByZWZpeGVk
IHdpdGgKPj4+Pj4gREMKPj4+Pj4gYW5kCj4+Pj4+IHdpdGggc2VsZi1pZGVudGlmaWNhdGlvbiBm
YWNpbGl0eSBsaWtlIHRoZWlyIEdDIHNlcmllcyBHUFVzLgo+Pj4+Pgo+Pj4+PiBBZGQgYSBkZXZp
Y2UgdHJlZSBiaW5kaW5nIGZvciBpdC4KPj4+Pj4KPj4+Pj4gRGVwZW5kcyBvbiB0aGUgc3BlY2lm
aWMgREMgbW9kZWwsIGl0IGNhbiBoYXZlIGVpdGhlciBvbmUgb3IgdHdvCj4+Pj4+IGRpc3BsYXkK
Pj4+Pj4gb3V0cHV0cywgYW5kIGVhY2ggZGlzcGxheSBvdXRwdXQgY291bGQgYmUgc2V0IHRvIERQ
SSBzaWduYWwgb3IKPj4+Pj4gIkRQIgo+Pj4+PiBzaWduYWwgKHdoaWNoIHNlZW1zIHRvIGJlIHNv
bWUgcGxhaW4gcGFyYWxsZWwgYnVzIHRvIEhETUkKPj4+Pj4gY29udHJvbGxlcnMpLgo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+Pj4+Cj4+
Pj4gV3JvbmcgRENPIGNoYWluIG9yZGVyLiBZb3Ugc2VuZCBpdCBhcyBpY2Vub3d5Lm1lLCBzbyB0
aGlzIG11c3QgYmUKPj4+PiBsYXN0Cj4+Pj4gU29CLiBUaGlzIGlkZW50aXR5IGlzIHRoZSBsYXN0
IG9uZSBjZXJ0aWZ5aW5nIERDTy4gUGxlYXNlIGtpbmRseQo+Pj4+IHJlYWQKPj4+PiBzdWJtaXR0
aW5nIHBhdGNoZXMsIHNvIHlvdSBrbm93IHdoYXQgeW91IGFyZSBjZXJ0aWZ5aW5nIGhlcmUuCj4+
Pgo+Pj4gV2VsbCBJIG1hcHBlZCB0aGUgQGlzY2FzLmFjLmNuIG1haWwgdG8gdGhlIEBpY2Vub3d5
Lm1lIG9uZSBpbiB0aGUKPj4+IGxhc3QKPj4+IHBhdGNoLgo+Pj4KPj4+IE9yIG1heWJlIEkgc2hv
dWxkIG1ha2UgaXQgdGhlIGZpcnN0IHBhdGNoPwo+Pgo+PiAubWFpbG1hcCBoYXMgZWZmZWN0IG9u
IGI0IGFuZCBnaXQgc2VuZC1lbWFpbCwgc28gbWF5YmUgdGhhdCdzIHRoZQo+PiBhbnN3ZXIuIFRo
ZSBwcm9ibGVtIGlzIHRoYXQ6Cj4+IDEuIFRoaXMgZW1haWwgaGFzIHNlbmRlciBhZGRyZXNzIEBp
Y2Vub3d5Lm1lCj4+IDIuIEl0J3MgU29CIGlzIG5vdCB0aGUgbGFzdCBvbmUuCj4gCj4gV2VsbCwg
SSB0aGluayBhIHBhdGNoIHRoYXQgaXMgYWxyZWFkeSBzZW50IHNob3VsZG4ndCBoYXZlIHRoZSBG
cm9tCj4gZmllbGQgY2hhbmdpbmcgd2hlbiBidW1waW5nIHJldmlzaW9uLCBhbmQgYSBwYXRjaCBt
b2RpZmllZCBieSBvbmUKPiBpZGVudGl0eSBzaG91bGQgaGF2ZSB0aGUgbW9kaWZ5aW5nIG9uZSdz
IFNvQiBhZGRlZC4KPiAKPiBTbyBoZXJlIEkgYW0gdXNpbmcgdGhlIEBpY2Vub3d5Lm1lIG1haWwg
KHdoaWNoIGNhbiByZXByZXNlbnQgdGhlCj4gQGlzY2FzLmFjLmNuIG1haWwgYWNjb3JkaW5nIHRv
IHRoZSBtYWlsbWFwKSB0byBzZW5kIHRoZSBwYXRjaCB0aGF0IGlzCj4gcHJvY2Vzc2VkIGJ5IEBp
c2Nhcy5hYy5jbiBtYWlsLgo+IAo+IFNlbmRpbmcgdGhlIHBhdGNoIHdpdGggQGlzY2FzLmFjLmNu
IG1haWwgbmVlZHMgc29tZSBleHRyYSBzZXR1cAo+IChiZWNhdXNlIG9mIHNvbWUgd2VpcmQgc2Vj
dXJpdHkgcmVxdWlyZW1lbnQpLgoKSSBkaWQgbm90IGFzayB5b3UgdG8gY2hhbmdlIGZyb20uIFBs
ZWFzZSByZWFkIGNhcmVmdWxseSAiWW91IHNlbmQgaXQgYXMKaWNlbm93eS5tZSwgc28gdGhpcyBt
dXN0IGJlIGxhc3Qgc29iIgoKYW5kIGxhdGVyIEkgcmUtaXRlcmF0ZWQuCgpJZiB5b3UgaW5zaXN0
IG9uIG5vdCBmaXhpbmcgdGhlIGNoYWluLCB0aGF0J3MgYSBOQUsgZnJvbSBtZSBiZWNhdXNlIHlv
dQptdXN0IGZvbGxvdyB0aGUgRENPIHByb2Nlc3MuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
