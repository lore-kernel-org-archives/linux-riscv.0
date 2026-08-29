Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A994C61DD7
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5px4v4UonH98neBByarkYi1KRnX/2uykdbcE/ZhnSk=; b=RefVSGk1VB9ArJ
	DJxzcuDnV/uhtJQl57U9jqFgyuhxBux9TxDf8dp+4LkgY60/DXANAUFtgqvV1q2uJwyZ5ldmCMqxS
	aQmix3jGH8Yv21eLmnfHmtx/mrTpARkXUAcEvfaYVK9aw2sPATz3gfa/cY6h9+hVoAXFVQ4/evMzn
	QO4CkLPaSs2a2c+Cvmxb1mijksVaXwUxesfCO0GxH3RX6NiQoQvHkq9+Ml+g9QmtpZ90GCG66MPmK
	8JEBvh0F6D4sjIZ03a6J2ja4RKan/61+ENGaBgfZ24uGbfJciUXh7upR6jheay2TfxG93btauIw+L
	J48YnClI94Ac/kmqZ+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DX8-00000006pSA-3muG;
	Sat, 29 Aug 2026 07:31:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DX7-00000006pS0-1POQ
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 07:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12D1560055;
	Sat, 29 Aug 2026 07:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36AB1F000E9;
	Sat, 29 Aug 2026 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787988679;
	bh=NfubPM6UMo/IG6FaMOOEgle+rUB5+JQcFLVJFPtH9ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iBV3YhXOUrioxddD2+5BsxZ85uor5LFZs2irnpSTbtMOJ2PD615qO2QtpacVozRo3
	 q0KLtI0q3NINJOiWyqecCJCL+P/k9vKLNEqUi+zU/pbedcyj4h8PSbx+ttg9amiz2P
	 aSnog2NI3YOJNwQa+sgz/+Lsq5/CcF/povHf1nQNq+FP70K/2BK/nYrG4e1bi0C8zw
	 UnQW/JYI2WIUGQq5rW3ziNE7lQNltyl5tc8AUe5gYHcMQ4sWlnnrm3J7oo0CQiZpUm
	 9VlL7h64x7D37+VvmSWDFirmN89v+yCWiQZTalcOsqZI8Wi/nIYlQKTnl1urHFXIfd
	 zYZC6txPx61og==
Message-ID: <bd23268f-dee6-43a0-9f8a-51ae8a272082@kernel.org>
Date: Sat, 29 Aug 2026 09:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll>
 <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
 <20260817134715.GA18207-robh@kernel.org>
 <ZQ4PR01MB1202CB0BB258ED52179F3DF4F2AB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
In-Reply-To: <ZQ4PR01MB1202CB0BB258ED52179F3DF4F2AB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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

T24gMjkvMDgvMjAyNiAwNTowOCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToKPiBIaSwgUm9iLCBL
cnp5c3p0b2YsIENvbm9yCj4gCj4+IE9uIE1vbiwgQXVnIDE3LCAyMDI2IGF0IDAyOjQ1OjIyUE0g
KzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4+PiBPbiBGcmksIEF1ZyAxNCwgMjAyNiBhdCAx
OjIy4oCvUE0gQ2hhbmdodWFuZyBMaWFuZwo+Pj4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0
ZWNoLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+PiBZb3Ugc3RpbGwgZGlkIG5vdCBleHBsYWluIHRoZSBj
ZWxscyAtIG5laXRoZXIgaW4gcmVwbHkgbm9yIGluCj4+Pj4+IGNvbW1pdCAtIHRodXMgc3RhcnQg
d2l0aCB0aGF0LiBXaHkgZG8geW91IG5lZWQgaXQ/IE11bHRpcGxlCj4+Pj4+IGNvbnRyb2xsZXJz
IGhhdmUgZ3JvdXBwZWQgcGlucyBvciBHUElPcyBpbiByZWdpc3RlcnMsIHNvIGV4cGxhbmF0aW9u
Cj4+ICJldmVyeSAzMiBHUElPcyBjb3JyZXNwb25kIHRvIG9uZSByZWdpc3RlciIKPj4+Pj4gdGVs
bHMgbWUgbm90aGluZy4gV2h5IHdvdWxkIHRoYXQgbWF0dGVyIGhvdyBtYW55IEdQSU9zIGlzIGlu
IG9uZQo+PiByZWdpc3Rlcj8KPj4+Pgo+Pj4+IFNpbmNlIGV2ZXJ5IDMyIEdQSU9zIGNvcnJlc3Bv
bmQgdG8gb25lIHJlZ2lzdGVyLCBMaW51cyBzdWdnZXN0ZWQgYXQgdGhlCj4+IHRpbWUgdGhhdCBJ
IGNvdWxkIHRyeSB1c2luZzoKPj4+PiBncGlvcyA9IDwmZ3BpbyBbaW5zdGFuY2VdIG9mZnNldCBm
bGFncz47IGdwaW8tcmFuZ2VzID0gPCZwaW5jdHJsCj4+Pj4gW2dwaW9faW5zdGFuY2VdIGdwaW9f
b2Zmc2V0IHBpbl9vZmZzZXQgY291bnQ+Owo+Pj4+Cj4+Pj4gVGhlIGFkdmFudGFnZSBvZiB1c2lu
ZyB0aGlzIGlzIHRoYXQgaW4gYSBHUElPIGNvbnRyb2xsZXIgd2l0aCBtb3JlCj4+Pj4gdGhhbiAz
MiBHUElPcywgZXZlcnkgMzIgR1BJT3MgY2FuIGJlIHRyZWF0ZWQgYXMgb25lIEdQSU8gYmFuay4g
VGhpcwo+Pj4+IHdheSwgaW4gdGhlIGRyaXZlciwgY29udmVydGluZyBwaW5fb2Zmc2V0IHRvIGdw
aW9fb2Zmc2V0IGRvZXMgbm90IHJlcXVpcmUgYQo+PiBsYXJnZSBudW1iZXIgb2YgLzMyIGFuZCAl
MzIgb3BlcmF0aW9ucy4KPj4+Pgo+Pj4+IHRoZSBmb2xsb3dpbmcgaXMgTGludXMncyBvcmlnaW5h
bCBzdWdnZXN0aW9uIGF0IHRoZSB0aW1lCj4+Pj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL0NBRCsrakw9dHZEQldKSFJHR0p3NG5ub3hfa2NKS241aHd2d3o5engKPj4+PiBhZE1SZWR5
dlJod0BtYWlsLmdtYWlsLmNvbS8KPj4+Cj4+PiBKdXN0IGNvcHkgdGhpcyBleHBsYW5hdGlvbiBp
bnRvIHRoZSBjb21taXQgc28gaXQgaXMgY2xlYXIgd2h5IHlvdSBuZWVkCj4+PiB0aHJlZSBjZWxs
cyBmb3IgdGhpcy4KPj4KPj4gIkNhbiB1c2UgZ3Bpb2xpYiIgaXMgbm90IHJlYWxseSBqdXN0aWZp
Y2F0aW9uLiBOZWl0aGVyIGlzIGF2b2lkaW5nIGEgc2hpZnQgYW5kL29yCj4+IG1hc2suIEkgc3Vw
cG9zZSB0aGVyZSdzIHNvbWUgaC93IGF0dHJpYnV0ZSBoZXJlIHRvIGp1c3RpZnkgaXQ/Cj4gCj4g
SSdsbCBnbyBhaGVhZCBhbmQgc2VuZCBvdXQgYSBuZXcgdmVyc2lvbiBwZXIgTGludXMncyBzdWdn
ZXN0aW9uLiBJbiB0aGUgbWVhbnRpbWUsIAo+IGlmIGFueW9uZSBoYXMgYW55IGFkZGl0aW9uYWwg
dGhvdWdodHMgb3IgZnVydGhlciBmZWVkYmFjaywgSSdkIGJlIG1vcmUgdGhhbiBoYXBweSAKPiB0
byBpbmNvcnBvcmF0ZSB0aGVtLiBQbGVhc2UgZG9uJ3QgaGVzaXRhdGUgdG8gbGV0IG1lIGtub3ch
CgpZb3UgZ290IGZlZWRiYWNrLi4uIGhhdmluZyB0aGluZ3Mgb3JnYW5pemVkIHBlciByZWdpc3Rl
cnMgZG9lcyBub3QgbWFrZQp0aGVtIGEgYmFuay4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
