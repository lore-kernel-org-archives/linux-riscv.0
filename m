Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10EDC54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RX7xyj5nfiqHLCCjBbX03ALrxd+OiKrL4RrJeUUBCU=; b=M7qdRC2k3rLXkH
	hEW+cEn+0CC3T54puHS0UYH9cUOLw9oQxFOJ7uNET8h/Hxmdw3HOHEszAxHCxoVlfZSUmT6v2ds35
	s1jmuj3FvF9qWfgOJGYKDiwi1QLpwSxp8Dr5b0BEsqOGighD8jyLMKDEeZhKJTzAXuRPDBnStwigQ
	8VuI8sch3wpk8du+tAALoI24BckqHUvMQUY99NQ5KZ/sJoYBarOUGo1HnFrRn32b49V+Y9QF22+fX
	5dEpqLbG+OzBMHi+fQ5rFpw7Vv5KEaCFiPKfbPSOgxW9fTCLOW5ZcHyCiG5BKGKsoQekXxIH8F7Qg
	wdf3uOybbJ055vEGnDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhVS1-0000000Dwop-3Og4;
	Tue, 05 Mar 2024 14:07:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhVRy-0000000Dwmx-1a8D
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 14:07:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-51320ca689aso6894010e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 06:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709647639; x=1710252439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQZ1KwugUIsv31guuZMgo+Gr8p+7fO4HrOSEdoTVaKw=;
        b=Z51D8H87SRhobU4ImgrKuiIac53lv2xhyjEUlmfjV335WmX6UJN6M4TpAwHEt97YaG
         MiuZGTbhZI3pFnShTXXZjVR+KW7NGTCejESiDSkGqNjte3eMeevmJBtrrX3S+eTQOKWx
         yh9Qc78AijtYGRF2+W2rQNZSs20Cn6UmoC/4Rk0pzg9sEGkizsLyVWcrTGEZT+1U3KSu
         Gd78PqYgPuAKnTO/ybJp2HPAQsDeEFH1VUlignVCzkMSZ4ANBqblQhTrlPiZa/thEs3y
         mUaB2/0i7o79fscDLlukwuhPnfxahq4UX4pHyuols3slNdXcuURKpfx4uanvBvhAmL30
         m4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709647639; x=1710252439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQZ1KwugUIsv31guuZMgo+Gr8p+7fO4HrOSEdoTVaKw=;
        b=R2L+lpUsQcdpPkArRu5LdxmfQ69tJSbzrAC+bfNRLEqJiGa+cvaobsMkFg+g0Sc2RA
         MK635RzSPtVaU/8ez5n4NKmMH3jHSxeIbk+4r8evbrqk7Vukt2TpXOuyj4s+ajyYE95G
         y1MSpWP3p+sDBYsxDppvI+rfYO2lSq337BcHipH7ysCBiDL6AVkpEXBYHS95Z8Ktpsvh
         RsZXtKulJKaiD8RuJk96RaGrQSVg2PsEEJYlOZCTQbYJrZop5+dnVPnneFw12LJiknCW
         npv1JBEYJkSYpx5uhlVkCRooPIfBPFQSLMTLAgAlK0K9qkbDQ2ADRDPignRUWQw9X78L
         z5mA==
X-Forwarded-Encrypted: i=1; AJvYcCXngwZ0Otx3vVB2UZIsEfkR1DCnAMoJiVcPs0fnbydxMOjfho7GPPcZmy4gIwObeKtYOwnSehvAE29/lbuoXcmTbgpCfm68ek3pk5aGGV6K
X-Gm-Message-State: AOJu0Ywl6IDl3W1BJCCsrcMQx0914EuVVp4kStl7kcV2wUf3Xk6tH/af
	14pR1QG/0F0h9KVn0CG1y/qeQoc7UpjdNFfGeI/y8nmKlQRAa8en07gujjQuUvQ=
X-Google-Smtp-Source: AGHT+IFvilm/A6uPSq1BSTUUbgdyFwbFGl+2O7ZvO96QaEmcmVY8EsU5EK1HAAChcrJjRk7UgMKlBg==
X-Received: by 2002:ac2:5629:0:b0:513:2027:27db with SMTP id b9-20020ac25629000000b00513202727dbmr1342797lff.17.1709647639500;
        Tue, 05 Mar 2024 06:07:19 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id d12-20020a1709067f0c00b00a4495c51f4esm4857730ejr.39.2024.03.05.06.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 06:07:19 -0800 (PST)
Message-ID: <58a62c7b-3348-4252-91be-ec30d5b723b6@linaro.org>
Date: Tue, 5 Mar 2024 15:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] dt-bindings: pinctrl: starfive: add JH8100
 pinctrl bindings
To: Yuklin Soo <yuklin.soo@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Hal Feng <hal.feng@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com>
 <20231221083622.3445726-2-yuklin.soo@starfivetech.com>
 <3b9201e0-e1d9-463c-aa1a-cbbedd1f8907@linaro.org>
 <ZQ0PR01MB1302FD75082E80DFDDF81E82F645A@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <2236948f-bd68-4476-bc2a-814c46c99334@linaro.org>
 <ZQ0PR01MB130288F0EC3C17147A46E4CDF622A@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZQ0PR01MB130288F0EC3C17147A46E4CDF622A@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_060722_576501_EED7C92C 
X-CRM114-Status: GOOD (  13.71  )
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

T24gMDUvMDMvMjAyNCAxMzowMCwgWXVrbGluIFNvbyB3cm90ZToKPiAKPiAKPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPgo+PiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyMCwgMjAy
NCA0OjEwIFBNCj4+IFRvOiBZdWtsaW4gU29vIDx5dWtsaW4uc29vQHN0YXJmaXZldGVjaC5jb20+
OyBMaW51cyBXYWxsZWlqCj4+IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBCYXJ0b3N6IEdv
bGFzemV3c2tpCj4+IDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+OyBIYWwgRmVuZyA8
aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT47Cj4+IExleWZvb24gVGFuIDxsZXlmb29uLnRhbkBz
dGFyZml2ZXRlY2guY29tPjsgSmlhbmxvbmcgSHVhbmcKPj4gPGppYW5sb25nLmh1YW5nQHN0YXJm
aXZldGVjaC5jb20+OyBFbWlsIFJlbm5lciBCZXJ0aGluZwo+PiA8a2VybmVsQGVzbWlsLmRrPjsg
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kKPj4gPGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRA
a2VybmVsLm9yZz47Cj4+IERyZXcgRnVzdGluaSA8ZHJld0BiZWFnbGVib2FyZC5vcmc+Cj4+IENj
OiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsKPj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmc7IFBhdWwgV2FsbXNsZXkKPj4gPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT47IFBh
bG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Owo+PiBBbGJlcnQgT3UgPGFvdUBlZWNz
LmJlcmtlbGV5LmVkdT4KPj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMS82XSBkdC1iaW5kaW5n
czogcGluY3RybDogc3RhcmZpdmU6IGFkZCBKSDgxMDAgcGluY3RybAo+PiBiaW5kaW5ncwo+Pgo+
PiBPbiAwNy8wMi8yMDI0IDAzOjQyLCBZdWtsaW4gU29vIHdyb3RlOgo+Pj4+Cj4+Pj4+ICsgICAg
dHlwZTogb2JqZWN0Cj4+Pj4+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+Pj4+
ICsgICAgcGF0dGVyblByb3BlcnRpZXM6Cj4+Pj4+ICsgICAgICAnLXBpbnMkJzoKPj4+Pj4gKyAg
ICAgICAgdHlwZTogb2JqZWN0Cj4+Pj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+Pj4+ICsg
ICAgICAgICAgQSBwaW5jdHJsIG5vZGUgc2hvdWxkIGNvbnRhaW4gYXQgbGVhc3Qgb25lIHN1Ym5v
ZGUgcmVwcmVzZW50aW5nCj4+IHRoZQo+Pj4+PiArICAgICAgICAgIHBpbmN0cmwgZ3JvdXBzIGF2
YWlsYWJsZSBpbiB0aGUgZG9tYWluLiBFYWNoIHN1Ym5vZGUgd2lsbCBsaXN0IHRoZQo+Pj4+PiAr
ICAgICAgICAgIHBpbnMgaXQgbmVlZHMsIGFuZCBob3cgdGhleSBzaG91bGQgYmUgY29uZmlndXJl
ZCwgd2l0aCByZWdhcmQgdG8KPj4+Pj4gKyAgICAgICAgICBtdXhlciBjb25maWd1cmF0aW9uLCBi
aWFzLCBpbnB1dCBlbmFibGUvZGlzYWJsZSwgaW5wdXQgc2NobWl0dAo+Pj4+PiArICAgICAgICAg
IHRyaWdnZXIgZW5hYmxlL2Rpc2FibGUsIHNsZXctcmF0ZSBhbmQgZHJpdmUgc3RyZW5ndGguCj4+
Pj4+ICsgICAgICAgIGFsbE9mOgo+Pj4+PiArICAgICAgICAgIC0gJHJlZjogL3NjaGVtYXMvcGlu
Y3RybC9waW5jZmctbm9kZS55YW1sCj4+Pj4+ICsgICAgICAgICAgLSAkcmVmOiAvc2NoZW1hcy9w
aW5jdHJsL3Bpbm11eC1ub2RlLnlhbWwKPj4+Pj4gKyAgICAgICAgYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCj4+Pj4KPj4+PiBXaHkgdGhlIHJlc3Qgb2YgdGhlIHByb3BlcnRpZXMgaXMgbm90
IGFwcGxpY2FibGU/Cj4+Pgo+Pj4gVGhlIHJlZ2V4IOKAnC1waW5zJOKAnSBtYWtlIHN1cmUgYWxs
IGNsaWVudCBzdWJub2RlIG5hbWVzIGVuZCB3aXRoIHN1ZmZpeAo+Pj4g4oCcLXBpbnPigJ0gKGUu
ZywgaTJjMC1zY2wtcGlucywgaTJjLXNkYS1waW5zKQo+Pgo+PiBJIGRpZCBub3QgdGFsayBhYm91
dCBzdWJub2Rlcy4KPj4KPj4gSSBhc2tlZCB3aHkgdGhlIHJlc3Qgb2YgcGluY2ZnIGFuZCBwaW5t
dXggc2NoZW1hIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkLgo+IAo+IEluaXRpYWxseSwgSSB3
YW50ZWQgdG8gYWxsb3cgYWxsIHByb3BlcnRpZXMgaW4gdGhlIHBpbmNmZyBhbmQgcGlubXV4IHNj
aGVtYS4gSSBtaXN1bmRlcnN0b29kIHRoZSBtZWFuaW5nIG9mIOKAnGFkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZeKAnQo+IGFuZCBJIHRob3VnaHQgaXQgbWVhbnMgYWxsIGFkZGl0aW9uYWwgcHJv
cGVydGllcyBvdXRzaWRlIHRoZSBwaW5jZmcgYW5kIHBpbm11eCBzY2hlbWEgYXJlIGV4Y2x1ZGVk
LiBUaGUg4oCcYWRkaXRpb25hbFByb3BlcnRpZXPigJ0gd2lsbCBiZQo+IHNldCB0byDigJx0cnVl
4oCdIHRvIGluY2x1ZGUgdGhlIHJlc3Qgb2YgdGhlIHByb3BlcnRpZXMgaW4gcGluY2ZnIGFuZCBw
aW5tdXggc2NoZW1hIGFuZCBub3QgdG8gYmUgcmVzdHJpY3RlZCB0byBvbmx5IHRoZSBwcm9wZXJ0
aWVzIGRlZmluZWQgaW4KCkluIHRoYXQgY2FzZSBkcm9wIGFsbCB0aGUgcHJvcGVydGllcyBhbmQg
dXNlIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UuCgpGaXggeW91ciBlbWFpbCBzZXR1cCwg
dG8gd3JhcCBlbWFpbHMgcHJvcGVybHkuIFRoaXMgaXMgdW5yZWFkYWJsZS4KCj4gCj4+Cj4+IEJl
c3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4gCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
