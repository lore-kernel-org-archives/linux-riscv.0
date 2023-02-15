Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339AEC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7fmMVY3euTpDm3nQgb+QhLSJpgn1QtOp2ey+Vf2zsk=; b=qPPTaD5ZutFpMV
	EC10C3hNojLVYz+WSQnHNBkHeQbru+9caGR7LHfauagZSUNN5fCYbxkIVUxgjxo24Mq9DiHMcrk2I
	igQgGhakOizJNzXY211DNHY6TpxwU/HEISiLy6qIISybChhjNejlBq8jaddVH0TRgNMYWLpPcsRyY
	AIxvKqFR2EU9p5IWzNkOuuk7LcjiGbCdRuFdvp/QUpmz4avmym1SgBrmq/p0yxt2N3c3DSds9+Wlh
	eh7rGgFvOg+cYAQznUqhxk0Z8IL/a/54SPB9B8+V4SxWwZn54RJAvJ3HOBODwR2nly+GXyiGcb3Iz
	FszmK+n8y3klggHEXE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5LW-004106-K0; Wed, 15 Feb 2023 00:08:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5LL-0040wE-EB; Wed, 15 Feb 2023 00:08:16 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 890DE660217D;
	Wed, 15 Feb 2023 00:08:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676419686;
	bh=zoW3noIDVP825JbgOO/Z2/ogb3Eb9ppZTgw5s0u1c6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UfvWpf+J3tW+akDw4oW44yeBej/Sq4UK3l7YLde3GTyggOvzrm6Ey9KYOBf0Dch/y
	 1pFHF63nR3TlRsC3Aj0VOX5DvVHeNBKnuyZqRF0tRlnNIrSbCP+hU1ZCnSmvUg3qvX
	 R6vNoD1ZEVdWkz2ZsquvmQtfWOI5VpL2yHXn0oh/AkXfFKK4NVnnZfAbG2SXw1HGbV
	 SX5mfN82oCQaQ0Xa5ehpLghlF/WW4YSASlkw5Wb9F6CFzEzN+Vt8y89a3mdJDd4bdo
	 QbITCjffcDyanACGG60Jp9Yu089C5uEnzns31zBFW5/BwbFb25oYS0BgapW32IKtJK
	 GJD1oSkYLWrcA==
Message-ID: <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
Date: Wed, 15 Feb 2023 02:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 08/12] net: stmmac: Add glue layer for StarFive JH7100 SoC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <Y+e+N/aiqCctIp6e@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+e+N/aiqCctIp6e@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_160815_629147_1C33F8BA 
X-CRM114-Status: GOOD (  15.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8xMS8yMyAxODoxMSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+ICsKPj4gKyNkZWZpbmUgSkg3
MTAwX1NZU01BSU5fUkVHSVNURVIyOCAweDcwCj4+ICsvKiBUaGUgdmFsdWUgYmVsb3cgaXMgbm90
IGEgdHlwbywganVzdCByZWFsbHkgYmFkIG5hbWluZyBieSBTdGFyRml2ZSDCr1xfKOODhClfL8Kv
ICovCj4+ICsjZGVmaW5lIEpINzEwMF9TWVNNQUlOX1JFR0lTVEVSNDkgMHhjOAo+IAo+IFNlZW1z
IGxpa2UgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIG9uZSBsaW5lIGVhcmxpZXI/Cj4gCj4gVGhlcmUg
aXMgdmFsdWUgaW4gYmFzaW5nIHRoZSBuYW1lcyBvbiB0aGUgZGF0YXNoZWV0LCBidXQgeW91IGNv
dWxkCj4gYXBwZW5kIHNvbWV0aGluZyBtZWFuaW5nZnVsIG9uIHRoZSBlbmQ6Cj4gCj4gI2RlZmlu
ZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5X0RMWUNIQUlOIDB4YzgKPiAKPiA/Pz8KClVuZm9y
dHVuYXRlbHkgdGhlIEpINzEwMCBkYXRhc2hlZXQgSSBoYXZlIGFjY2VzcyB0byBkb2Vzbid0IHBy
b3ZpZGUgYW55IAppbmZvcm1hdGlvbiByZWdhcmRpbmcgdGhlIFNZU0NUUkwtTUFJTlNZUyByZWxh
dGVkIHJlZ2lzdGVycy4gTWF5YmUgRW1pbCAKY291bGQgcHJvdmlkZSBzb21lIGRldGFpbHMgaGVy
ZT8KCj4+ICsJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInN0YXJmaXZlLGd0eGNsay1k
bHljaGFpbiIsICZndHhjbGtfZGx5Y2hhaW4pKSB7Cj4+ICsJCXJldCA9IHJlZ21hcF93cml0ZShz
eXNtYWluLCBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5LCBndHhjbGtfZGx5Y2hhaW4pOwo+PiAr
CQlpZiAocmV0KQo+PiArCQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJlcnJvciBz
ZWxlY3RpbmcgZ3R4Y2xrIGRlbGF5IGNoYWluXG4iKTsKPj4gKwl9Cj4gCj4gWW91IHNob3VsZCBw
cm9iYWJseSBkb2N1bWVudCB0aGF0IGlmIHN0YXJmaXZlLGd0eGNsay1kbHljaGFpbiBpcyBub3QK
PiBmb3VuZCBpbiB0aGUgRFQgYmxvYiwgdGhlIHZhbHVlIGZvciB0aGUgZGVsYXkgY2hhaW4gaXMg
dW5kZWZpbmVkLiAgSXQKPiB3b3VsZCBhY3R1YWxseSBiZSBiZXR0ZXIgdG8gZGVmaW5lIGl0LCBz
ZXQgaXQgdG8gMCBmb3IgZXhhbXBsZS4gVGhhdAo+IHdheSwgeW91IGtub3cgeW91IGRvbid0IGhh
dmUgYW55IGRlcGVuZGVuY3kgb24gdGhlIGJvb3Rsb2FkZXIgZm9yCj4gZXhhbXBsZS4KClN1cmUs
IEkgd2lsbCBzZXQgaXQgdG8gMC4KCj4gCj4gCUFuZHJldwoKVGhhbmtzIGZvciByZXZpZXdpbmcs
CkNyaXN0aWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
