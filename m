Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB53CF9C69
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 18:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UEw/5uPri3XnQFqSRM3a/Hez69WuuBkbihagnk9IyA=; b=sLOig4++9baoaU
	U5AnEHxL86n+j2fEgmJfljRzvyUVolMS2Y47fJXlMk57JY4bPqzleGSIBKR+a19j3ZyhNIu+u4m2h
	yLlV7Iirb5YWc1QaQHiE60r7AfvOO4HPW69jznzTam9YaPxemliiyrtrCEXInMn6AlkiLaf5gdkT/
	3ToV4yyq2B1byrzfYEnaLrPQCDklPnlGUoOMDd9s8q8UIKbHN9tCrqUmKKvEiUGsNjqU6y4eBf4tZ
	K9nSq7++Wv2Z5Fni8CTEpvSm5lB7wGEbiCtbaT18+S5XQCV9cksxNq8AvKsFhFqWeLkwhMyHRO34M
	lqF3YJ56ChoMcesDQs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stASr-000000034cK-08k4;
	Tue, 24 Sep 2024 18:40:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stASo-000000034bM-1KGw
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 18:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BECBD5C5CC5;
	Tue, 24 Sep 2024 18:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9861BC4CEC4;
	Tue, 24 Sep 2024 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727203241;
	bh=2F2V13UnE1xlQc+PHBTB36hG+E3sC+XhLSCiNOaBPpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SvXpO0HLdXBJGdO4ssDnGvf27zq+pMt1Mx+RucyvANVr81Cuv03rdZ7ylXlDlDABO
	 06GDFM8I381tSSDq+Aw/CIOP3vBECbxlP9DQCpgTgFs5pwTxYklg6ZV8mcwYYB6LoH
	 5RzcC5OLVkjO3+U0MhbK77yjVY2kewNMA/KivQifoS9RdqJwxW/n3/bivOWpAuFk1n
	 Fj2fJhEyDrdnIpoQ450K9DXR2Q3SNWNfMDQVPi1vRoJud7hULzAWrwtLcLsQy9CccW
	 dbXXNybiUK2G/GUDThzWz2sqZkXyjRd5dpgOqGnzV7OyHoVgoJ1ickJ3EDDdATj9ao
	 1mZNSp9r3yDsw==
Message-ID: <ce90574a-6be8-4415-9943-b559d274cf04@kernel.org>
Date: Tue, 24 Sep 2024 20:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch v2 3/3] riscv: dts: starfive: add framework dts
To: =?UTF-8?B?5pu554+K54+K?= <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, rafal@milecki.pl,
 Linus Walleij <linus.walleij@linaro.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dhs@frame.work,
 ams@frame.work, gregkh@linuxfoundation.org, yuning.liang@deepcomputing.io,
 huiming.qiu@deepcomputing.io
References: <20240924080650.1345485-4-sandie.cao@deepcomputing.io>
 <edfbcf43-60ae-438f-8348-f6a2e6fa31cf@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5065befe.6789.4275.a840.52c113c23eb9@feishu.cn>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5065befe.6789.4275.a840.52c113c23eb9@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_114042_463080_0E8CA828 
X-CRM114-Status: GOOD (  15.08  )
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

T24gMjQvMDkvMjAyNCAxMDo1Miwg5pu554+K54+KIHdyb3RlOgo+IEhpIEtyenlzenRvZiwKPiAK
PiBUaGFua3MgZm9yIHlvdXIgdGltZS4KPiAKPiBBOiBqaDcxMTAtY29tbW9uLmR0c2kgaXMgYWxz
byB1c2VkIGJ5IG90aGVyIGJvYXJkcy4gTGlrZXM6IG1pbGt2LW1hcnMswqAKPiBwaW5lNjQtc3Rh
cjY0LiBTbyBJIGNhbiBvbmx5IGRpc2FibGUgdGhlbSBpbiBqaDcxMTAtZnJhbWV3b3JrLmR0cy7C
oAo+IE9yIEkgbmVlZCB0byBjcmVhdGUgYSBuZXcgY29tbW9uLmR0c2kuwqAKPiAKPiBROiBXaHkg
UENJRTAgaXMgZW5hYmxlZCBpbiB0aGUgRFRTSSBpbiB0aGUgZmlyc3QgcGxhY2U/IFRoZSBzYW1l
IHF1ZXN0aW9ucwo+IGFib3V0IE1BQ3MuCj4gCj4gUmVnYXJkcywKPiBTYW5kaWUKPiAKPiBPbiAy
NC8wOS8yMDI0IDEwOjA2LCBTYW5kaWUgQ2FvIHdyb3RlOgo+PiBBZGQgZnJhbWV3b3JrIGR0cyB0
byBzdXBwb3J0IFJJU0MtViBGcmFtZXdvcmsgTGFwdG9wIDEzIE1haW5ib2FyZC4KPj4gwqAKPj4g
U2lnbmVkLW9mZi1ieTogU2FuZGllIENhbyA8c2FuZGllLmNhb0BkZWVwY29tcHV0aW5nLmlvPgo+
PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZSDCoCDCoCDC
oCDCoCB8wqAgMSArCj4+IMKgIC4uLi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtZnJhbWV3b3Jr
LmR0cyDCoMKgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQs
IDM1IGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLWZyYW1ld29yay5kdHMKPiAKPiBZb3VyIHRocmVhZGluZyBp
cyBlbnRpcmVseSBicm9rZW7CoG1ha2luZ8KgYXBwbHlpbmcgcHJvY2VzcyBtb3JlIGRpZmZpY3Vs
dC4KClNvIEkgYW0gdGFsa2luZyB3aXRoIG15c2VsZj8KCi4uLgoKPj4gKyDCoCDCoCDCoMKgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICt9Owo+PiArCj4+ICsmcGNpZTAgewo+PiArIMKgIMKgIMKg
wqAgc3RhdHVzID0gImRpc2FibGVkIjsKPiAKPiBXaHkgUENJRTAgaXMgZW5hYmxlZCBpbiB0aGUg
RFRTSSBpbiB0aGUgZmlyc3QgcGxhY2U/IFRoZSBzYW1lIHF1ZXN0aW9ucwo+IGFib3V0IE1BQ3Mu
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKQW5kIHNlbmRpbmcgbXlzZWxmIHJlZ2Fy
ZHM/CgpTb3JyeSwgbm8gY2x1ZSB3aGF0J3MgZ29pbmcgb24gaGVyZS4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
