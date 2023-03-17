Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29097C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ui7e3HCRNV10ebnnln3cPmmumebIYc8A1hUZVqgXibc=; b=mXDBDHC8I4d/DW
	czToaOCd722puP0eL8FRSVZABQFHM5wTo9vUo5262nPf2tDsRahRWhnmXD3LBUCpk5nIbS8v9DGtQ
	sso8njuOKHuxh90dCDHngDyhjRgP/6zEBBzMxs+zfCjVg0dGvz3w7MrkcexZOTDPbrKLNynOo/zdr
	u66jHDuvm/Y7f/OAB1EBBsfni5eGOjZg/mIjowzN5pfoqrc0619ZNS/xlmz0rqVJvoA9iAG5r1y2s
	SGs/bi0FqbugQye4J0op9mnIaMUV2w3moeSbl4p0dTD34v+R0dAavF/o9p3iHYaOCwfYOmVTIFa/4
	fdIEV7xZsTXC5zJ08HXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdDlR-002ruV-2c;
	Fri, 17 Mar 2023 17:21:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdDlN-002rso-36;
	Fri, 17 Mar 2023 17:21:11 +0000
Received: from [192.168.1.90] (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4974566030B7;
	Fri, 17 Mar 2023 17:21:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679073667;
	bh=I+Gvi5bzAnoJMxokQ84k9j+H+aFc/IN+XvqBbP6wpvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=durtctia6ys5ahpIvt7urL9eaWQyHgUoJkCI/3sUZz+Cz60FX1D6+GjNICq2duwN1
	 xZRgyxlKfz+V1Amu3xsfbnZ5TCoifrJHIDWxHV55eBpfNc61nV9yFIsxGnDnFbZfL2
	 jYOSnI0gYZwIc/w9qHpoBRNEA7zjzTWC1zI2/mjj65/yNAfIgtvCRFU9Wo67hfWk66
	 K5R+RDs/sD9q/OPpiZpz1oJqo3LYu/m3v3JqXR6K5O9UJsURGl8aes3t5ZRZ5kNCs8
	 ZHUrK6VT9Euy6HTz+SS0RdaMhV37DWSBfmRncbIsjROD8ggD8T5h1hwSW1Cpv2v9d4
	 UdRzr7Qu4U2iA==
Message-ID: <793d6c43-d71e-3ffc-17c2-26062e40b4bc@collabora.com>
Date: Fri, 17 Mar 2023 19:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 01/11] dt-bindings: firmware: arm,scmi: Document
 assigned-clocks and assigned-clock-rates
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Stephen Boyd <sboyd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki
 <katsuhiro@katsuster.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-2-cristian.ciocaltea@collabora.com>
 <20230316203417.GA3833267-robh@kernel.org>
 <20230316222619.r4jzk3lzdxzamr2s@bogus>
 <d5881d9f-90cc-f7a2-72a3-0701348a03fe@collabora.com>
 <CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_102110_206330_6FA2807A 
X-CRM114-Status: GOOD (  17.11  )
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

T24gMy8xNy8yMyAxNjoyNywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBNYXIgMTcsIDIw
MjMgYXQgNDo1OeKAr0FNIENyaXN0aWFuIENpb2NhbHRlYQo+IDxjcmlzdGlhbi5jaW9jYWx0ZWFA
Y29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDMvMTcvMjMgMDA6MjYsIFN1ZGVlcCBIb2xs
YSB3cm90ZToKPj4+IE9uIFRodSwgTWFyIDE2LCAyMDIzIGF0IDAzOjM0OjE3UE0gLTA1MDAsIFJv
YiBIZXJyaW5nIHdyb3RlOgo+Pj4+ICtTdGVwaGVuCj4+Pj4KPj4+PiBPbiBXZWQsIE1hciAxNSwg
MjAyMyBhdCAwMTo0Nzo1NlBNICswMjAwLCBDcmlzdGlhbiBDaW9jYWx0ZWEgd3JvdGU6Cj4+Pj4+
IFNpbmNlIGNvbW1pdCBkZjRmZGQwZGI0NzUgKCJkdC1iaW5kaW5nczogZmlybXdhcmU6IGFybSxz
Y21pOiBSZXN0cmljdAo+Pj4+PiBwcm90b2NvbCBjaGlsZCBub2RlIHByb3BlcnRpZXMiKSB0aGUg
Zm9sbG93aW5nIGR0YnNfY2hlY2sgd2FybmluZyBpcwo+Pj4+PiBzaG93bjoKPj4+Pj4KPj4+Pj4g
ICAgIHJrMzU4OC1yb2NrLTViLmR0Yjogc2NtaTogcHJvdG9jb2xAMTQ6IFVuZXZhbHVhdGVkIHBy
b3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnYXNzaWduZWQtY2xvY2stcmF0ZXMnLCAnYXNzaWdu
ZWQtY2xvY2tzJyB3ZXJlIHVuZXhwZWN0ZWQpCj4+Pj4KPj4+PiBJIHRoaW5rIHRoYXQncyBhIHNv
bWV3aGF0IHF1ZXN0aW9uYWJsZSB1c2Ugb2YgYXNzaWduZWQtY2xvY2stcmF0ZXMuIEl0Cj4+Pj4g
c2hvdWxkIGJlIGxvY2F0ZWQgd2l0aCB0aGUgY29uc3VtZXIgcmF0aGVyIHRoYW4gdGhlIHByb3Zp
ZGVyIElNTy4gVGhlCj4+Pj4gY29uc3VtZXJzIG9mIHRob3NlIDIgY2xvY2tzIGFyZSB0aGUgQ1BV
IG5vZGVzLgo+Pj4+Cj4+Pgo+Pj4gQWdyZWVkLiBXZSBkZWZpbml0ZWx5IGRvbid0IHVzZSB0aG9z
ZSBpbiB0aGUgc2NtaSBjbGsgcHJvdmlkZXIgZHJpdmVyLgo+Pj4gU28gTkFDSyBmb3IgdGhlIGdl
bmVyaWMgU0NNSSBiaW5kaW5nIGNoYW5nZS4KPj4KPj4gQWNjb3JkaW5nIHRvIFsxXSwgImNvbmZp
Z3VyYXRpb24gb2YgY29tbW9uIGNsb2Nrcywgd2hpY2ggYWZmZWN0IG11bHRpcGxlCj4+IGNvbnN1
bWVyIGRldmljZXMgY2FuIGJlIHNpbWlsYXJseSBzcGVjaWZpZWQgaW4gdGhlIGNsb2NrIHByb3Zp
ZGVyIG5vZGUiLgo+IAo+IFRydWUsIGJ1dCBpbiB0aGlzIGNhc2UgaXQncyByZWFsbHkgYSBzaW5n
bGUgY29uc3VtZXIgYmVjYXVzZSBpdCdzIGFsbAo+IENQVSBub2RlcyB3aGljaCBhcmUgbWFuYWdl
ZCB0b2dldGhlci4KPiAKPj4gVGhhdCB3b3VsZCBhdm9pZCBkdXBsaWNhdGluZyBhc3NpZ25lZC1j
bG9jay1yYXRlcyBpbiB0aGUgQ1BVIG5vZGVzLgo+IAo+IFdvdWxkbid0IG9uZSBub2RlIGJlIHN1
ZmZpY2llbnQ/CgpZZWFoLCB0aGF0IHNob3VsZCBiZSBmaW5lLgoKPiBUaGlua2luZyBtb3JlIGFi
b3V0IHRoaXMsIHdoeSBhcmVuJ3QgeW91IHVzaW5nIE9QUCB0YWJsZXMgdG8gZGVmaW5lCj4gQ1BV
IGZyZXF1ZW5jaWVzLiBBc3NpZ25lZC1jbG9ja3MgbG9va3MgbGlrZSBhIHRlbXBvcmFyeSBoYWNr
IGJlY2F1c2UKPiB5b3UgaGF2ZW4ndCBkb25lIHByb3BlciBPUFAgdGFibGVzLgoKUmlnaHQsIHRo
aXMgaXMgY3VycmVudGx5IG5vdCBwb3NzaWJsZSBzaW5jZSBpdCBkZXBlbmRzIG9uIHNvbWUgd29y
ayBpbiAKcHJvZ3Jlc3MuCgpUaGFua3MsCkNyaXN0aWFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
