Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B0606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eA5y9o2e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYIN5SYK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lBZ86DpZxPyFXgtoG7TPtxGLngm3g9XYtap1Fe9Urrc=; b=eA5y9o2e6h2DspdH7sbMVvuDFD
	kbfttGFr8aHLPUo4LBOVCC/6PPAzUyRbjAWg4vcOEtnttzPcgCvFijb8L9Tatu6B7We0ELh5mkmPG
	2KzAWn6Xnfu45P4i7h9BZTAXft6mCxk2HcNLqWqngccnEXiaXXyW84vKzo6l1WbGxXTCHKHLckTGg
	zmLCBnxAWRM9A8x7gOePZYyrcnAei+T8fxjoG+j/6+F9mtTZR5sVsi5RL93JzpwHAk7XzCcioG3E9
	T2yAQQzOjXJVMjF1n2IMwMyNNzpqIFzFQzLssUwZrrhblHF4nlou3W1OiymidyBdUBc4bCrY2Wpv9
	+aBH7nHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXj2-00000004w7o-3rRi;
	Wed, 04 Nov 2026 09:56:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXj1-00000004w7M-3BhE;
	Wed, 04 Nov 2026 09:56:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3634544510;
	Wed,  4 Nov 2026 09:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4211E1F00A18;
	Wed,  4 Nov 2026 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786171;
	bh=lL9qicufT73zVNYG6EGMOjl4Jj5VLL/pZOSn5pB20Ww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LYIN5SYKVnPEy9D9mVufbbtTbT40tA4eH4/wzRigY7RvSrohXXvsJMI3eNg2Rr9kN
	 zfSlzULsmZWY/qV7pHwn21i8C6uIqFRZfiw+CYh2ojuQhrvamykDCWOIHvXMninTt1
	 l14MN3hPpuoBGqjaKn+nKeRMhgNlsqdKyNT+6Hp/arhpwxZgGUN2UsG9rkN7EKNTrR
	 h+dGInSnQGmE8sjrHzim+ZxbuXx0GLRj0GX13mruUXyw/tDv1Oq4MGucD8AVm4Vnet
	 Jcx25sRQhTs5gN7lPlvNEjDwoTDa8eNNz/hOjF6MuZIPQ9+IwaX7MVnN+NCiViqD7e
	 UaOKrlTwztvoA==
Message-ID: <df1d398c-549f-4556-b683-53fefeaf358c@kernel.org>
Date: Wed, 4 Nov 2026 10:56:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wei Fu <wefu@redhat.com>, Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Han Gao <rabenda.cn@gmail.com>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <ee28bd16-11fc-4b78-b1ee-e0e20bb0cfdb@kernel.org>
 <73fd01b87381e2ed33d52edc4f4bb7ee9ba578d1.camel@iscas.ac.cn>
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
In-Reply-To: <73fd01b87381e2ed33d52edc4f4bb7ee9ba578d1.camel@iscas.ac.cn>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDQvMTEvMjAyNiAxMDowMSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNi0xMS0w
NOS4ieeahCAwOToyNiArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoKPj4gT24g
MDMvMTEvMjAyNiAwOToxNCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IFRoaXMgcGF0Y2hzZXQg
aXMgc3BsaXQgZnJvbSB0aGUgIkFkZCBUSDE1MjAgVVNCIHN1cHBvcnQiIHBhdGNoc2V0LAo+Pj4g
d2l0aCBvbmx5IHRoZSBQSFkgYmluZGluZy9kcml2ZXIgcGFydC4KPj4+Cj4+PiBJY2Vub3d5IFpo
ZW5nICgyKToKPj4+IMKgIGR0LWJpbmRpbmdzOiBwaHk6IGFkZCBiaW5kaW5nIGZvciBULUhlYWQg
VEgxNTIwIFVTQiBQSFkKPj4+IMKgIHBoeTogYWRkIGEgZHJpdmVyIGZvciBULUhlYWQgVEgxNTIw
IFVTQiBQSFkKPj4KPj4KPj4gQ29uc2lkZXJpbmcgaG93IHZ1bGFiQGlzY2FzLmFjLmNuwqBpcyBp
Z25vcmluZyByZXZpZXdzL2NvbW1lbnRzIGFuZAo+PiBzcGFtcwo+PiB3aXRoIGEgbG90IG9mIHVu
dGhyZWFkZWQgZW1haWxzLCBjb21wbGV0ZWx5IGRpc3JlZ2FyZGluZyBhbnkgdHJpZXMgb2YKPj4g
Y29udGFjdCBvdmVyIGxhc3QgMS41IG1vbnRocywgc2hhbGwgd2UgaWdub3JlIGFsbCBjb250cmli
dXRpb25zIGZyb20KPj4gQGlzY2FzLmFjLmNuPwo+Pgo+PiBNYXliZSB0aGlzIHdpbGwgYmUgdGhl
IG9ubHkgd2F5IHRvIGFjdHVhbGx5IGJlIGhlYXJkPwo+Pgo+PiBJY2Vub3d5LCBkbyB5b3UgaGF2
ZSBhbnkgcG9zc2liaWxpdHkgdG8gcmVhY2ggdG8gYm90IHNwYW1tZXJzIGZyb20KPj4gdnVsYWI/
Cj4gCj4gVW5mb3J0dW5hdGVseSBhcyBJIGFtIG5vdCBpbiBCZWlqaW5nLCBJIGFtIG5vdCBhYmxl
IHRvIHBoeXNpY2FsbHkgcmVhY2gKPiB0aGUgcGVyc29uczsgSSBoYXZlIHJlcG9ydGVkIHRoaXMg
aW5jaWRlbnQgdG8gbXkgc3VwZXJ2aXNvciBhbmQgSSBhbQo+IGFsc28gZmVlbGluZyBxdWl0ZSBi
YWQgb24gdGhpcy4KPiAKClRoYW5rcyBmb3IgcGFzc2luZyB0aGUgbWVzc2FnZSBmdXJ0aGVyLgoK
QmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
