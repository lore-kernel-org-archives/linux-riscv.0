Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3DACA0EE3
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsH5912SdzYKcP12rF/Px830xDl3L2yGIwn93sEVT5M=; b=i0+UPwj6OvCFhk
	aG4Ok7kWj5MUGKMlCJYtwZdT92KHIhLZS7Gddw6UqixY2kqZeDZ4MiLbp3kkq+XR5MQX+dJKqS6S/
	ijGqxICnmWEbbR6I9tMVrrU0sJhyKiay5AW3uwUsrRvhZGfYWaBZCc+NCLBsNxfOM/RkA71+z+x2F
	60ayrYYQbEMsY3Lc8EEN+iMXejwqP0KTqKidoYRdho2kYrhjiFajrV2KkpTYCmfMfLHb+Lp31mO5a
	WsN5i1oKbYZuMao4iVbd864ahlg1ImEPMH5u+7tAMwuqK8JKaqd4AsasCiGmiyLOI/kM5OwD/5tfj
	PfO9mdfSrXo41RQg7Shg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTAh-0000000GDjJ-3BhC;
	Thu, 14 Aug 2025 08:18:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSij-0000000G99r-00et
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6491F5C6F1A;
	Thu, 14 Aug 2025 07:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585FDC4CEEF;
	Thu, 14 Aug 2025 07:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755157796;
	bh=f35AnSEo6H6Mj8LPGStUWaOusqBiWbWyTlU3soOSje4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AblpmqcXAN4ysoqlSXpI2+ce7BroJRKBqENO6jOU8nbQ1sWveX0r75s4ALXlEDAAR
	 8mR61mUCUsjNonJRaMp6ttbamG8Pp9VfNXBjVbeItoBFdRWbEvvVidFXOPHV6+om96
	 Xa7Ik0Aj6APGF4HuTd56kHnDxFfcR2JoHI4O49I2kvCIOEhs9wyylg2fpM4YQ1ZGT7
	 3F1xigHsaH2t6HzqRYPVxKIPC0sgD8U6GuA5T3MKBnqgpEc1Z1uzIz6gqpyNe27esM
	 MUZXs96VAjJtRnW33VuXnzT0WubpZQbG9Vet2r635PaqVC1miOxC1YmUQC36pWAQpt
	 cjI7rgK2HoKHA==
Message-ID: <026419bc-c0f8-4891-a348-311f51cb999f@kernel.org>
Date: Thu, 14 Aug 2025 09:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] dt-bindings: firmware: thead,th1520-aon: add a
 mailbox name for SBI
To: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250814070757.2267325-1-uwu@icenowy.me>
 <20250814070757.2267325-3-uwu@icenowy.me>
 <d0d4c9e7-c350-4996-a53b-09b13bdb9409@kernel.org>
 <1b63d1872f5b2c89f2fafdf717bda5ec29589b69.camel@icenowy.me>
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
In-Reply-To: <1b63d1872f5b2c89f2fafdf717bda5ec29589b69.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_004957_116104_9F7AD047 
X-CRM114-Status: GOOD (  10.80  )
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

T24gMTQvMDgvMjAyNSAwOTozMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0wOC0x
NOaYn+acn+Wbm+eahCAwOToxOCArMDIwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMTQvMDgvMjAyNSAwOTowNywgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IFRoZSBTQkkg
ZmlybXdhcmUgbWlnaHQgd2FudCB0byBjb21tdW5pY2F0ZSB0byB0aGUgQU9OIGZpcm13YXJlIHRv
by4KPj4+Cj4+PiBBZGQgYSBtYm94LW5hbWUgaXRlbSB0byBhbGxvdyB0byBhbGxvY2F0ZSBhIG1h
aWxib3ggZm9yIFNCSS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VA
aWNlbm93eS5tZT4KPj4+IC0tLQo+Pj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2Fy
ZS90aGVhZCx0aDE1MjAtYW9uLnlhbWzCoMKgwqDCoCB8IDcKPj4+ICsrKystLS0KPj4+IMKgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0Cj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS90
aGVhZCx0aDE1MjAtYW9uLnlhbWwKPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1hb24ueWFtbAo+Pj4gaW5kZXggMzM2NTEyNGM3ZmQ0
Ny4uNTU1NDY1ZjRhYWI0ZSAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtCj4+PiBhb24ueWFtbAo+Pj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC0K
Pj4+IGFvbi55YW1sCj4+PiBAQCAtMjYsMTEgKzI2LDEyIEBAIHByb3BlcnRpZXM6Cj4+PiDCoMKg
wqDCoCBjb25zdDogdGhlYWQsdGgxNTIwLWFvbgo+Pj4gwqAKPj4+IMKgwqAgbWJveGVzOgo+Pj4g
LcKgwqDCoCBtYXhJdGVtczogMQo+Pj4gK8KgwqDCoCBtYXhJdGVtczogMgo+Pgo+Pgo+PiBBQkkg
YnJlYWsgd2l0aG91dCBleHBsYW5hdGlvbiB3aHkgKCJhbGxvdyIgaXMgbm90IGEgcmVhc29uIHRv
IGFmZmVjdAo+PiBBQkkpIGFuZCBpdHMgaW1wYWN0Lgo+IAo+IElzIGFkZGluZyBpdGVtcyBhbiBB
QkkgYnJlYWs/CgpBZGRpbmcgcmVxdWlyZWQgaXRlbXMgaXMgQUJJIGJyZWFrLiBZb3UgY2FuIGVh
c2lseSB0ZXN0IGl0LiBBcHBseSBwYXRjaAojMSBhbmQgdGVzdCB5b3VyIERUUy4gQXBwbHkgcGF0
Y2ggIzIgYW5kIHRlc3QgeW91ciBEVFMuIE5ldyB3YXJuaW5ncwphcHBlYXIsIHNvIHRoYXQncyBh
IHByb29mIG9mIEFCSSBpbXBhY3QuCgoKPiAKPiBPciBzaG91bGQgSSBleHBsaWNpdGx5IHNheSAi
bWluSXRlbXM6IDEiIGhlcmU/CgpZZXMsIGJ1dCB5b3Ugc2hvdWxkIGNsZWFybHkgZXhwbGFpbiB0
aGUgaW1wYWN0LiBJcyBpdCB3b3JraW5nPyBOb3QKd29ya2luZz8gQXJlIHlvdSBmaXhpbmcgc29t
ZXRoaW5nPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
