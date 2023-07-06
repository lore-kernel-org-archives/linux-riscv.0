Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC938EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xd62n8wCqz5MGcVtki/h7XTy8mq5POKr9tCM3tjshLs=; b=b8/s6vi+YwYN9W
	f3sY5lgU6zOJorGkMwRIVkOjHfVrXUXcfCYEQp8Zc6EMj3tFNbpAC7LD8TqGP4kXdBuVRiupAP2RO
	vYuEyDkxhbaz/0Ji+GTHxCa5yTWIbPUYBztv9NYol1ngZuxje1tckOA0ZnaRfxpjXgS9G+kC3yqho
	JqedckzGc9DECA6E8FnA1IbM4Q5Fle4JZ53/TO/i83prCiyfYg4oehW+NZHjnTPc3B3dhOjqZ+PL3
	KYQ4PDiIj1Fc8ijbCjRi3rqw82xJAQqpWmrOrgmEfX1HF3ldwQWelVTPPldVw3Xep0xUzig064ev5
	pxy+8ILOGfqg+J+09vTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIfv-000fpJ-0t;
	Thu, 06 Jul 2023 06:41:11 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIfs-000foe-0r
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 06:41:09 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so531969a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688625666; x=1691217666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U84wbfrFvukSkpFpAQ72YzvXPcoC4HG//efb9ypi4vY=;
        b=FpVYqGF1XYTT/KAyacWSxk+i9pccD/FbD7y1brzTGwaLWI3Ciyw2T7Qii88QEHheZp
         BV4nAkn2mLDQl2R2hU8JYUqPt0x3bundqk3zAE7y9HNgAIhsOUcMoJecaS9y22XLWMXK
         phg68tYmFdkTiwPjTKqDUj9Jsrbm6Qk95mIzzeZHmHSAdpAcn8S9m7SSpU43VteqQJ+7
         NEoaoB0jRjNzHfX1kWnFCnfYij4XWZ72QPaFiMThF1Dh3UIADMQfvt+YjunZW3KJBd9Z
         G8RsmTFaMrQVXjUx9rcL2SH/rl+jPhRQr5kDFMXWuZzLPEznDLHl8IchNOspMMqrLK8m
         mXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688625666; x=1691217666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U84wbfrFvukSkpFpAQ72YzvXPcoC4HG//efb9ypi4vY=;
        b=RytmlY0PARt2dg9xYkD4lNNsvmIZPzqEpOc8l1DTYiyqH+3SuW8kr7sEdv2X28GeQI
         2VnhqgMv8Vkkkq+Ydxz5oXf4afcIxV6rLaKf/v3LLvMM3i1eGBpJAbXf098iRTsxzT/R
         /nlAaAv0WndvEmFKHSN9dDdBqveFhbBGT6Fp+QJgaveXeKqjwp5LaSi8aJ46+OhTn2I1
         7kcuGBRNZuIexVTR4FIhMdtJjb7F5w2Ugck2yQa3YpCc+mUlmQ3JMxkZoIqOhp5E6nqo
         Mg8VMOunHSI1JtamsO8MUs9zM1mE0tK+YvTNTiDVm0AkQ6jTqk6FwBaTQOnUUb6wbGsT
         4KFA==
X-Gm-Message-State: ABy/qLZYEWOz9YVgGkkDy985aadzOk/n/xRpy4O9y6o0MI+0xWR5LZi0
	h49oQWucafNH8jtiVjtk15nodw==
X-Google-Smtp-Source: APBJJlGAra4B4N5W2yCWqVSgPSOS1FW5fd9tCfP5Cfaf2uSNLqrJHV9eQ5pbf0hv2OsdJjoh+ZQlXg==
X-Received: by 2002:a05:6402:184e:b0:514:9929:1b01 with SMTP id v14-20020a056402184e00b0051499291b01mr774186edy.8.1688625666179;
        Wed, 05 Jul 2023 23:41:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l26-20020aa7c3da000000b0051df6c2bb7asm376111edr.38.2023.07.05.23.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 23:41:05 -0700 (PDT)
Message-ID: <df87a707-ed17-0629-308a-d9435ebd3227@linaro.org>
Date: Thu, 6 Jul 2023 08:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
Content-Language: en-US
To: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
 <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230705-oblivious-unstuffed-8e028a5b243c@spud>
 <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
 <07f88065-b9ca-5233-4048-5e61e1cdbe0c@linaro.org>
 <CAEEQ3wmY3YrdBEZ_V0+rC-3zbMLRgnL3xt-RtwzPxev5P2h48g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAEEQ3wmY3YrdBEZ_V0+rC-3zbMLRgnL3xt-RtwzPxev5P2h48g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_234108_331365_D2520B4F 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: mark.rutland@arm.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, ardb@kernel.org, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org, paul.walmsley@sifive.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, palmer@dabbelt.com, yc.hung@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDYvMDcvMjAyMyAwODoyNCwg6L+Q6L6J5bSUIHdyb3RlOgo+IEhpIEtyenlzenRvZiwKPiAK
PiBPbiBUaHUsIEp1bCA2LCAyMDIzIGF0IDI6MDHigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCj4g
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDA2LzA3LzIw
MjMgMDU6NDMsIOi/kOi+ieW0lCB3cm90ZToKPj4+IEhpIENvbm9yLAo+Pj4KPj4+IEFkZGVkIGR0
cyBNYWludGFpbmVycywKPj4+Cj4+PiBPbiBXZWQsIEp1bCA1LCAyMDIzIGF0IDExOjA34oCvUE0g
Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+Pj4+IEhleSwKPj4+
Pgo+Pj4+IE9uIFdlZCwgSnVsIDA1LCAyMDIzIGF0IDA3OjQyOjUxUE0gKzA4MDAsIFl1bmh1aSBD
dWkgd3JvdGU6Cj4+Pj4+IEFkZCB0aGUgZGVzY3JpcHRpb24gZm9yIGZmaXRibCBzdWJub2RlLgo+
Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9m
Zml0YmwudHh0ICAgfCAyNyArKysrKysrKysrKysrKysrKysrCj4+Pj4+ICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+Pj4+ICAyIGZpbGVzIGNo
YW5nZWQsIDI4IGluc2VydGlvbnMoKykKPj4+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4dAo+Pj4+Pgo+Pj4+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJl
L2ZmaXRibC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUv
ZmZpdGJsLnR4dAo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLmM0MjM2ODYyNjE5OQo+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0Cj4+Pj4KPj4+
PiBGaXJzdGx5LCBuZXcgZHQtYmluZGluZ3MgbmVlZCB0byBiZSBkb25lIGluIHlhbWwsIG5vdCBp
biB0ZXh0IGZvcm0uCj4+Pj4gU2Vjb25kbHksIHlvdSBkaWRuJ3QgcmUtcnVuIGdldF9tYWludGFp
bmVyLnBsIGFmdGVyIGFkZGluZyB0aGlzIGJpbmRpbmcsCj4+Pj4gc28geW91IGhhdmUgbm90IEND
ZWQgYW55IG9mIHRoZSBvdGhlciBkdC1iaW5kaW5nIG1haW50YWluZXJzIG5vciB0aGUKPj4+PiBk
ZXZpY2V0cmVlIG1haWxpbmcgbGlzdC4KPj4+Cj4+PiBSZS1ydW4gZ2V0X21haW50YWluZXIucGwg
YW5kIGFkZGVkIG1haW50YWluZXJzIGludG8gdGhlIG1haWxsaXN0Lgo+Pgo+Pgo+PiBUaGlzIGRv
ZXMgbm90IHdvcmsgbGlrZSB0aGlzLgo+Pgo+PiBQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50
YWluZXJzLnBsIHRvIGdldCBhIGxpc3Qgb2YgbmVjZXNzYXJ5IHBlb3BsZQo+PiBhbmQgbGlzdHMg
dG8gQ0MuICBJdCBtaWdodCBoYXBwZW4sIHRoYXQgY29tbWFuZCB3aGVuIHJ1biBvbiBhbiBvbGRl
cgo+PiBrZXJuZWwsIGdpdmVzIHlvdSBvdXRkYXRlZCBlbnRyaWVzLiAgVGhlcmVmb3JlIHBsZWFz
ZSBiZSBzdXJlIHlvdSBiYXNlCj4+IHlvdXIgcGF0Y2hlcyBvbiByZWNlbnQgTGludXgga2VybmVs
Lgo+Pgo+PiBZb3UgbWlzc2VkIGF0IGxlYXN0IERUIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlz
IHdvbid0IGJlIHRlc3RlZCBieSBvdXIKPj4gdG9vbHMuIFBlcmZvcm1pbmcgcmV2aWV3IG9uIHVu
dGVzdGVkIGNvZGUgbWlnaHQgYmUgYSB3YXN0ZSBvZiB0aW1lLCB0aHVzCj4+IEkgd2lsbCBza2lw
IHRoaXMgcGF0Y2ggZW50aXJlbHkgdGlsbCB5b3UgZm9sbG93IHRoZSBwcm9jZXNzIGFsbG93aW5n
IHRoZQo+PiBwYXRjaCB0byBiZSB0ZXN0ZWQuCj4+Cj4+IFBsZWFzZSBraW5kbHkgcmVzZW5kIGFu
ZCBpbmNsdWRlIGFsbCBuZWNlc3NhcnkgVG8vQ2MgZW50cmllcy4KPiAKPiBUaGlzIHNldCBvZiBw
YXRjaGVzIGlzIGFwcGxpZWQgb24gdGhlIHRhZyBuZXh0LTIwMjMwNzA2LCBhbmQgdG8KPiBnZW5l
cmF0ZSB0aGUgbWFpbCBsaXN0IGJ5IHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIG9uIHRoZSB0
YWcKPiAKPiAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKPiAuLi9yaXNjdi9saW51eC92My0w
MDA0LWR0LWJpbmRpbmdzLWZpcm13YXJlLURvY3VtZW50LWZmaXRibC1iaW5kaW5nLnBhdGNoCj4g
WXVuaHVpIEN1aSBjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbSAobWFpbnRhaW5lcjpGRFQgRklSTVdB
UkUgSU5URVJGQUNFIChGRkkpKQo+IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+ICht
YWludGFpbmVyOk9QRU4gRklSTVdBUkUgQU5ECj4gRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJ
TkdTKQo+IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJv
Lm9yZz4KPiAobWFpbnRhaW5lcjpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVWSUNFIFRS
RUUgQklORElOR1MpCj4gQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPiAobWFpbnRh
aW5lcjpPUEVOIEZJUk1XQVJFIEFORAo+IEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUykK
PiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyAob3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5E
IEZMQVRURU5FRAo+IERFVklDRSBUUkVFIEJJTkRJTkdTKQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcgKG9wZW4gbGlzdCkKPiAKPiBXaGF0IGFtIEkgbWlzc2luZyA/CgpJIGRpZCBub3Qg
cmVjZWl2ZSB0aGUgb3JpZ2luYWwgcGF0Y2guIE5laXRoZXIgZGlkIFBhdGNod29yay4gWW91IGNh
bm5vdApqdXN0IHJlcGx5IHRvIHNvbWUgY29tbWVudCBhbmQgaG9wZSBpdCB3aWxsIGZpeCBzb21l
dGhpbmcuIFdlIGRvbid0IGhhdmUKdGhpcyBwYXRjaCBzaW1wbHkuCgoKCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
