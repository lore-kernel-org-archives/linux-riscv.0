Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369FEC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LchlMXszrOn+0lRMnt5ZErPW8qCdmBdKNLBkCiAwqLo=; b=sPp6vs52lP1Dp3
	DvQArO77FZo+U2hZfUzgnkuCtvoMm/1h5ejXGZT4jAho7JW7T9PnU9ij6eTRilKZUgrNYC4wcZKrp
	Dad+SrZMowJuoFLYzvUHQCpvZZlO39diP9NSmGY+E84sUUCTRHttO/bmn2mDfkkICp3X01285IStv
	fNPinW26KopGWu6I3vGgh2/z8r+jmF11si8FYqSoWPKe/S4nz4xafzogYYJRt6YopKGXXCcRTXP1Z
	DcZnv18Oq9rkmINiU+0eobqg5RYakawwqxtTATJrZzBWR5sE8GYGpWRrxTNEi+UbNOOBXqANLsOAw
	86Ib+WSKbIxj6HHRBjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpOC-00AzSs-15;
	Mon, 22 Jan 2024 08:10:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpO6-00AzS4-2w
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:10:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40e775695c6so28843855e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705911033; x=1706515833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbaUIqrMbMzTbi1xbIh7iOYXgE0LxrEe6wcimnzPid8=;
        b=xDP7V8o/5WajKR6uN8ZPuXYeRlMKXpkbZ/dNBleL5h5GXKN68PGZd0ehpuW8TVqgtW
         Co6xrO0OQGSRoXZxFocCInZnPbIaWUPw2+/JOyXmvtNP2dUjtwA8TICcDyiOwhH2O+Pq
         zYPGmRnk+O5NpbRvUGAdTnOhd3pjc9Pr6uiwT/mDXXAYY46cxy09JlrG5odFJXvEAAGL
         vhvlD+6BzmBNTVew+9E86ULi0s8rL+rjl1QP/2r6NLvJBcIXE1izw4Uesk4ZuRDWCc2q
         iQ6kNQPVPUDtErkN5yj1O6j/GcVT7Rzy5vzK6jCHokyKkD3WWozSRathYQsUa2x4m2+F
         2BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705911033; x=1706515833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbaUIqrMbMzTbi1xbIh7iOYXgE0LxrEe6wcimnzPid8=;
        b=KWvb0tFzxX9zeRba0tZ/PINM52d4fcwkI6SQxQ2iadEJFI1mdD4Q7evQYFTvZ8zIoS
         H9QK5X4+fifa+MMQ7gDC34Cxgmtu06ZFE2T/efUqZ91ebGGZp36J7VeYPFKAjaEet8T0
         gAHdoWSsT5nlMQ4Mps36ZRaQeKBbILMqGhBEr/IcKdsUysbepGUlTJyEKMuwZqPJ5Zsg
         ZuVjo+36y85+0dC6jC6OXjgqvDwziri7xrXsy9LGbMqF+JAj+oUz2RaV2bbLNKRQyVKd
         BO7N06P9xpghS0FO4OcDRMI4aJXsLblauoMDRXPIeFXwWYs4RolfJNgYE8HUSlgm8ivI
         0v/A==
X-Gm-Message-State: AOJu0YwEY7azxqflsyyyABhkpqTDJAFYEJhMVc/8zSNBgVnSgmhur7Yo
	R3iU7bybHYFpmgHdgh9uDTv04RYn4CeW5CB9RgC/Un2Ws0AaA9ge0mhO6N6GV/A=
X-Google-Smtp-Source: AGHT+IF4zVESZieddWNU7+k8H1J80F/kOzh4atr1ez8O2h+FXPc5tEeCGo/qorFc5eG8W9X+yLPltg==
X-Received: by 2002:a05:600c:2108:b0:40e:40fc:6d43 with SMTP id u8-20020a05600c210800b0040e40fc6d43mr2407442wml.98.1705911033033;
        Mon, 22 Jan 2024 00:10:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b0040eabc7cfacsm3912080wmb.16.2024.01.22.00.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 00:10:32 -0800 (PST)
Message-ID: <c9feb32f-1efb-4613-94c9-9d6bb0f45366@linaro.org>
Date: Mon, 22 Jan 2024 09:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] dt-bindings: soc: sophgo: Add Sophgo system
 control module
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1705388518.git.unicorn_wang@outlook.com>
 <598b1026fdf9989bc48e5e10d1034b37947d3b80.1705388518.git.unicorn_wang@outlook.com>
 <f4a46311-2e12-458b-98a8-d3caa2c95517@linaro.org>
 <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2822FBA18674540BA85035BDFE712@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB2822FBA18674540BA85035BDFE712@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_001034_953609_18CA2C29 
X-CRM114-Status: GOOD (  14.25  )
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

T24gMTgvMDEvMjAyNCAwNjoyOSwgQ2hlbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjQvMS8xNiAx
OTozNywgQ2hlbiBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDI0LzEvMTYgMTg6MDYsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBPbiAxNi8wMS8yMDI0IDA4OjIxLCBDaGVuIFdhbmcgd3Jv
dGU6Cj4+Pj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Pj4K
Pj4+PiBBZGQgZG9jdW1lbnRhdGlvbiB0byBkZXNjcmliZSBTb3BoZ28gU3lzdGVtIENvbnRyb2wg
Zm9yIFNHMjA0Mi4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93
YW5nQG91dGxvb2suY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIC4uLi9zb2Mvc29waGdvL3NvcGhnbyxz
ZzIwNDItc3lzY3RybC55YW1swqDCoMKgwqAgfCA0NiAKPj4+PiArKysrKysrKysrKysrKysrKysr
Cj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKPj4+PiDCoCBjcmVhdGUg
bW9kZSAxMDA2NDQgCj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9z
b3BoZ28vc29waGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgCj4+
Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28s
c2cyMDQyLXN5c2N0cmwueWFtbCAKPj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb2Mvc29waGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55YW1sIAo+Pj4+Cj4+Pj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjdiNTBiYjU2YjRjZgo+
Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgCj4+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbAo+Pj4+IEBA
IC0wLDAgKzEsNDYgQEAKPj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAg
T1IgQlNELTItQ2xhdXNlKQo+Pj4+ICslWUFNTCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogCj4+
Pj4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQy
LXN5c2N0cmwueWFtbCMKPj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4gKwo+Pj4+ICt0aXRsZTogU29waGdvIFNHMjA0MiBTb0Mg
c3lzdGVtIGNvbnRyb2wKPj4+PiArCj4+Pj4gK21haW50YWluZXJzOgo+Pj4+ICvCoCAtIENoZW4g
V2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Pj4+ICsKPj4+PiArZGVzY3JpcHRpb246
Cj4+Pj4gK8KgIFRoZSBTb3BoZ28gc3lzdGVtIGNvbnRyb2wgaXMgYSByZWdpc3RlcnMgYmxvY2sg
KFNZU19DVFJMKSwgCj4+Pj4gcHJvdmlkaW5nIG11bHRpcGxlCj4+Pj4gK8KgIGxvdyBsZXZlbCBw
bGF0Zm9ybSBmdW5jdGlvbnMgbGlrZSBjaGlwIGNvbmZpZ3VyYXRpb24sIGNsb2NrIAo+Pj4+IGNv
bnRyb2wsIGV0Yy4KPj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4gK8KgIGNvbXBhdGlibGU6
Cj4+Pj4gK8KgwqDCoCBjb25zdDogc29waGdvLHNnMjA0Mi1zeXNjdHJsCj4+Pj4gKwo+Pj4+ICvC
oCByZWc6Cj4+Pj4gK8KgwqDCoCBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArwqAgY2xvY2stY29u
dHJvbGxlcjoKPj4+PiArwqDCoMKgICMgQ2hpbGQgbm9kZQo+Pj4gRHJvcCB0aGUgY29tbWVudCwg
aXQgaXMgb2J2aW91cy4gSXQgY2Fubm90IGJlIGFueXRoaW5nIGVsc2UuCj4+Pgo+Pj4+ICvCoMKg
wqAgJHJlZjogL3NjaGVtYXMvY2xvY2svc29waGdvLHNnMjA0Mi1zeXNjbGsueWFtbCMKPj4+PiAr
wqDCoMKgIHR5cGU6IG9iamVjdAo+Pj4gV2h5IGlzbid0IHRoaXMgbWVyZ2VkIGhlcmU/IFlvdSBk
byBub3QgbmVlZCB0aGUgY2hpbGQgbm9kZSByZWFsbHkuLi4KPj4+IHVubGVzcyB0aGUgY2xvY2sg
aW5wdXRzIGFyZSBzcGVjaWZpYyB0byB0aGF0IGNsb2NrIGNvbnRyb2xsZXIgYW5kIHlvdQo+Pj4g
d2lsbCBoYXZlIGhlcmUgbW9yZSBkZXZpY2VzPyBCdXQgd2hlcmUgYXJlIHRoZXkgaW4gc3VjaCBj
YXNlPwo+PiBJIGRvbid0IHNlZSBtb3JlIGRldmljZXMgd2lsbCBiZSBpbmNsdWRlZCBsYXRlci4g
SXQgc2hvdWxkIGJlIG9rIHRvIAo+PiBtZXJnZSB0aGVtIGludG8gb25lLgo+IAo+IGhpLCBLcnp5
c3p0b2YsCj4gCj4gQWZ0ZXIgc29tZSBkb3VibGUgY2hlY2ssIEkgZmluZCB3ZSB3aWxsIGhhdmUg
bW9yZSBkZXZpY2VzIGluIAo+IHN5c3RlbS1jb250cm9sLiBGb3IgZXhhbXBsZSwgaW4gdGhlIFNZ
U19DVFJMIGFyZWEsIHRoZXJlIGlzIGFsc28gYSAKPiBzZWN0aW9uIG9mIHJlZ2lzdGVycyB1c2Vk
IHRvIGNvbnRyb2wgdGhlICJHZW5lcmFsIFB1cnBvc2UgSW50ZXJydXB0Ii4gCj4gVGhlIHBjaWUg
Y29udHJvbGxlciBvZiBzZzIwNDIgd2lsbCB1c2UgdGhpcyBpbnRlcnJ1cHQgY29udHJvbGxlciB3
aGljaCAKPiBpcyBkZWZpbmVkIGluIFNZU19DVFJMLCB3ZSB3aWxsIGFkZCBpdCBpbiBsYXRlciB3
b3JrLgo+IAoKSSBleHBlY3QgdGhlbiBhbGwgZGV2aWNlcyB0byBiZSBkb2N1bWVudGVkLgoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
