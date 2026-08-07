Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBBCC5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mp4GG5ilKTjFgcaYnhgMZGxP6OIW4NuBXViUhPzdE5w=; b=cBRPWtR/XnnW9/
	TDmICRbFm53TRgvWY1x9kjF39/XKQNO/77Hf1ZRQZeSiRdXQ5P7kMCZSKwBmWyjzT1As4FpUTaqXG
	lFpzM9Kr/Fe5OoQGJfOPcriCZ0hwO7TLh63u06+NEtZ9W1ejeJsY2OWsrJHMAJjD7M7LInQQEMb8/
	sr17vGrnmR5KF+QvB7dkmd+gUvj04e0IOtmWbWcbe+qpincxUafV/0BcL/ix3JuoYASv3mQLEabxR
	39kpUWGMrFunji71yvCwpGPZXs6Slp0cSZX58hX1nMJeSPuIaK3tHCkHBRq8Jfkgz3Tz/HlrlES8v
	otv959oxdv4j4QVqceUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFN3-00000007IuU-3pl5;
	Fri, 07 Aug 2026 07:52:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFN3-00000007ItY-0I9C;
	Fri, 07 Aug 2026 07:52:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE183419E8;
	Fri,  7 Aug 2026 07:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927871F000E9;
	Fri,  7 Aug 2026 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786089120;
	bh=ui/dJztSjklpZgdgdTpBoQ/4RYKD0Hs+Yl/44j6P7IM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iphmv/dtqzAEEkp2drdJnJNRmvsei4fRFyNo+qjT9hVWxZzpjf9cDBJ2X0lPWTyq3
	 Bg3BXuyiZ1ul4ufTneP8oZW/hA1HnqIK060ZQyyQ1t8OkSalxMFrLElP/XM8O5NtKp
	 EWpVgfsdGcntOcc2lu7XiV/Zw/+akY797trWzpWcCMQQTbZHtQtrCheLPIEPBZ//Ey
	 U0ddh9qGwunV49FZ9JM6XhW3y1dzO+vIJN4KzLdFKLrANZ55r6p/+edKThZOAfO8F3
	 iHOl27+qvI4QWXkLECZRcTwaatqFR7wvMcx75DcQwzRhtSCaxBSuhkJTrkEhaiCDnB
	 56E/NTYkQKGmA==
Message-ID: <d28fc845-9614-43c6-9c38-face930184e9@kernel.org>
Date: Fri, 7 Aug 2026 09:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
To: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>,
 joaopeixoto@osyx.tech, linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-4-joaopeixoto@osyx.tech>
 <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
 <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
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
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
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

T24gMDcvMDgvMjAyNiAwOTo0MywgSm/Do28gUGVpeG90byB3cm90ZToKPiAKPiBPbiAxLzcvMjYg
MTY6NDcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDA3LzAxLzIwMjYgMTc6Mjgs
am9hb3BlaXhvdG9Ab3N5eC50ZWNoIHdyb3RlOgo+Pj4gRnJvbTogSm/Do28gUGVpeG90bzxqb2Fv
cGVpeG90b0Bvc3l4LnRlY2g+Cj4+Pgo+Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgZGV2aWNl
IHRyZWUgYmluZGluZyBmb3IgdGhlIEJhbyBJL08gRGlzcGF0Y2hlciwKPj4+IGEgZGV2aWNlIHVz
ZWQgaW4gYmFja2VuZCBWTXMgcnVubmluZyB2aXJ0dWFsaXplZCBkZXZpY2VzIChlLmcuLCBWaXJ0
SU8pLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEpvw6NvIFBlaXhvdG88am9hb3BlaXhvdG9Ab3N5
eC50ZWNoPgo+Pj4gLS0tCj4+PiAgIC4uLi9iaW5kaW5ncy9iYW8vYmFvLGlvLWRpc3BhdGNoZXIu
eWFtbCAgICAgICB8IDc1ICsrKysrKysrKysrKysrKysrKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDc1IGluc2VydGlvbnMoKykKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vYmFvLGlvLWRpc3BhdGNoZXIueWFtbAo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2Jhbyxpby1k
aXNwYXRjaGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2Jh
byxpby1kaXNwYXRjaGVyLnlhbWwKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAw
MDAwMDAwMDAwMDAuLjhjYTQ1MGU0YjlkNQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jhby9iYW8saW8tZGlzcGF0Y2hlci55YW1s
Cj4+PiBAQCAtMCwwICsxLDc1IEBACj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+Pj4gKyVZQU1MIDEuMgo+Pj4gKy0tLQo+Pj4gKyRp
ZDpodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9iYW8vYmFvLGlvLWRpc3BhdGNoZXIueWFt
bCMKPj4+ICskc2NoZW1hOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIwo+Pj4gKwo+Pj4gK3RpdGxlOiBCYW8gSS9PIERpc3BhdGNoZXIgRGV2aWNlCj4+IE5vLCB5
b3UgZG9uJ3QgZ2V0IG11bHRpcGxlIGRldmljZXMgcGVyIGV2ZXJ5IGRyaXZlci4KPj4KPj4gTG9v
ayBhdCBndW55YWggb3IgTWVkaWF0ZWsgR2VuaW8uIENvbWUgYmFjayB3aGVuIHlvdSBzb2x2ZSBF
TlRJUkUKPj4gRkVFREJBQ0sgZ2l2ZW4gdG8gdGhlbSBmaXJzdC4gQW5kIHRoZW4gc2F5IGhvdyB5
b3Ugc29sdmVkIHRoYXQgZmVlZGJhY2sKPj4gYmVjYXVzZSBzbyBmYXIgSSBzZWUgeW91IG9ubHkg
aWdub3JpbmcgcmV2aWV3IG9mIHlvdXIgTExNIHNsb3Agb3Igb3RoZXIKPj4gTWljcm9zbG9wIHBy
b2R1Y3QuCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4gVGhhbmtzIGZvciB0aGUg
cG9pbnRlcnMsIGFuZCBzb3JyeSBmb3IgdGhlIGVhcmxpZXIgY2h1cm4uIEkgbG9va2VkIGF0IGhv
dwo+IGd1bnlhaCBhbmQgdGhlIE1lZGlhdGVrIEdlbmlvIGJpbmRpbmdzIG1vZGVsIHRoaXMgYW5k
IHJld29ya2VkIHRoZSAKPiBkaXNwYXRjaGVyCj4gdGhlIHNhbWUgd2F5OiB0aGVyZSBpcyBubyBs
b25nZXIgYSBzaW5nbGUgbm9kZSBkZXNjcmliaW5nIE4gZGV2aWNlcy4gRWFjaAo+IGJhY2tlbmQg
ZGV2aWNlIGlzIGl0cyBvd24gbm9kZSB3aXRoIG9uZSByZWcgcmVnaW9uIGFuZCBvbmUgaW50ZXJy
dXB0Ogo+IAo+ICDCoCBzaG1lbUA1MDAwMDAwMCB7Cj4gIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAi
YmFvLGlvLWRpc3BhdGNoZXIiOwo+ICDCoCDCoCDCoCByZWcgPSA8MHg1MDAwMDAwMCAweDAxMDAw
MDAwPjsKPiAgwqAgwqAgwqAgaW50ZXJydXB0cyA9IDwweDAgMHgwOCAweDE+Owo+ICDCoCDCoCDC
oCBiYW8saWQgPSA8MD47Cj4gIMKgIH07Cj4gCj4gQSBiYWNrZW5kIGd1ZXN0IHRoYXQgc2Vydmlj
ZXMgc2V2ZXJhbCBmcm9udGVuZHMgaW5zdGFudGlhdGVzIHNldmVyYWwgc3VjaAo+IG5vZGVzLiBy
ZWcgYW5kIGludGVycnVwdHMgdGhlcmVmb3JlIGhhdmUgbWF4SXRlbXM6IDEuIFRoZSBkcml2ZXIg
d2FzCj4gcmV3cml0dGVuIHRvIG1hdGNoIChvbmUgcGxhdGZvcm0gZGV2aWNlIC0+IG9uZSBkZXZp
Y2UgbW9kZWwgLT4gb25lCj4gL2Rldi9iYW8tZG1YKSBkcm9wcGluZyB0aGUgaW50ZXJuYWwgTi1k
ZXZpY2UgYXJyYXksIHRoZSBnbG9iYWwgRE0gbGlzdCBhbmQKPiB0aGUgaW5kaXJlY3Rpb24gaW9j
dGwuCj4gCj4gSSBoYXZlIGFsc28gZ29uZSB0aHJvdWdoIHRoZSByZXN0IG9mIHRoZSBmZWVkYmFj
ayBvbiB0aGUgc2VyaWVzICh0aGUgCj4gaXBjc2htZW0KPiBiaW5kaW5nLCB0aGUgbWlzYy1kZXZp
Y2UgY29udmVyc2lvbiwgY29tbWl0IG1lc3NhZ2VzLCBjaGFuZ2Vsb2csIHRocmVhZGluZykKPiBh
bmQgYWRkcmVzc2VkIGVhY2ggaXRlbTsgdGhlIGNvdmVyIGxldHRlciBlbnVtZXJhdGVzIHRoZW0u
IFRoZSBiaW5kaW5nIAo+IHBhc3Nlcwo+IGBtYWtlIGR0X2JpbmRpbmdfY2hlY2tgLgoKV2hlcmUg
aXMgYW55IHVwc3RyZWFtIERUUyB1c2luZyB0aGlzPyBXaHkgZG8gd2Ugd2FudCBhbm90aGVyIHNv
ZnR3YXJlCm5vZGVzIGluIERUPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
