Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C1EC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lU7vQeufl8zMZhH/2flmb/QHrY648vJdfTY2zXQyh7M=; b=h0jaqDx/F8+UDg
	CeQRlpCyM2sJUnvzzYF+YpwPTlaStuEHGRfAWdpCHnRvaboGnFpo3xzjJVL/T7wubNuX8vqVuREoi
	Bq2SfSAsmaQszfdjlhJz95hxFl6zBSfOlVbVuftsU6MHxJ2MTYH83mLkgthA9ZvXOfxUr1mkYGLs7
	gPhUKLk+EH5DaSqN614f8yQ0Dsnuy8bgygM6XWcbQd7ESuACcPZZpA+ADZjwL//bgFqnQ9BjC1oVe
	WwFcth6wVfbg0nLlLaPC5fhNtbWk7LiTzTDKMu8SXGOW8DSAfShEVwuzF5gmIFXmntDoUvc1mDCmf
	YvTe9Ow7nAd0t0axV6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNoy-005epX-35; Tue, 22 Nov 2022 07:35:56 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNov-005ei1-Oo
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 07:35:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id u2so17017869ljl.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 23:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1u0dEaaWhrqQvE4qsk7X1OxJmmJb8lbRjc7uGUVx+S0=;
        b=pHeIeuCN2C4RNRtqL98JitckwDlrmsvuU1QF8rnDOadvaURejGXeZ9OhMuEiuea4NC
         r/d5VzzE3xmSlPRpCGUz3j+7f+jKKMc2Ht/KZoYUetVeL6Pfgk42l1ALsAxG3aeeEngt
         ruaZDQZ70Ptju4mvS/4Vm/nMTZaV8fUPtHC2+ekNh8EnzzcS7yHC5ThYsKE9I8d5JMoo
         V5KlWmFgg4gFy5KrIgEMOUULHhZ4RkHjdvLpYNBtRJYSlXpHfh4x9wjSugR7VJ/eSApY
         4Tg+WDH1fde0Qzsus4p+Jd4LnaYVsjRxJFWAYyX4NTGVrRJMbF12OrhIgjTVdFkU9jn3
         Srbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1u0dEaaWhrqQvE4qsk7X1OxJmmJb8lbRjc7uGUVx+S0=;
        b=0fZlFiFr6NOxmaIsa6N7ayimypCw3WH8s5Uu1sWddIjZFyPpRq9mkWeIkxEV9X7cMV
         zGQ54KtYp55KmzYAkM8dDAUTQTPv8NEDPTQiCoiYCoiMC/XJ5QBMvt5atHbLTIKd2Ql1
         c/1XQHAWpJ0NvkJQ7tjNhp48UUfvO3BPjnRE25G9DRuYJSjaHpkQMlBX8MDDpq3wOYoe
         CcZPuQugmqUc3T4rzDw6uK8LGTBLvUjpKmX8VPtY1gSe+KnvPpJueUpnVS6M9xzYwCyD
         +fXfBCcenYfwnScJymmX6sDOLsuSm0IeSyEsGhT6e3aG8v0gunc6lhWfVfOsQYjqaM+U
         ggzQ==
X-Gm-Message-State: ANoB5pkXNVPSi9gxzV6T6brURfSm6zjqlMYzzHbL322FbajG3FzoA9u+
	4xg8VASNi5vUoKxZJe39TlKwSw==
X-Google-Smtp-Source: AA0mqf6E3yNpVsm4tAzpPODPKj0VPd4PaUzV0wZr7Z970RIAb1aIibK6y+UUpzrh8KT5qG7Kfq+A4A==
X-Received: by 2002:a2e:97cf:0:b0:277:515b:3dae with SMTP id m15-20020a2e97cf000000b00277515b3daemr7150516ljj.487.1669102550603;
        Mon, 21 Nov 2022 23:35:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512348300b004b4b5da5f80sm2354795lfr.219.2022.11.21.23.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:35:49 -0800 (PST)
Message-ID: <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
Date: Tue, 22 Nov 2022 08:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for
 OpenC906
To: Icenowy Zheng <uwu@icenowy.me>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-3-uwu@icenowy.me>
 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_233553_862723_BB903B2B 
X-CRM114-Status: GOOD (  14.65  )
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

T24gMjIvMTEvMjAyMiAwODoxOCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyMi0xMS0y
MeaYn+acn+S4gOeahCAxMTowNiArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjEvMTEvMjAyMiAwNToxNywgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IFQtSGVhZCBP
cGVuQzkwNiBpcyBhIG9wZW4tc291cmNlLWxpY2Vuc2VkIGZpeGVkLWNvbmZpZ3VyYXRpb24gb2YK
Pj4+IEM5MDYsCj4+PiB3aGljaCBpcyBub3cgcHVibGljIGFuZCBhYmxlIHRvIGJlIGludGVncmF0
ZWQuCj4+Pgo+Pj4gQWRkIGEgY29tcGF0aWJsZSBmb3IgdGhlIENMSU5UIHNoaXBwZWQgYXMgcGFy
dCBvZiBPcGVuQzkwNiwgd2hpY2gKPj4+IHNob3VsZAo+Pj4ganVzdCBiZSBvcmRpbmFyeSBDOXh4
IENMSU5ULgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5
Lm1lPgo+Pj4gLS0tCj4+PiDCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1l
ci9zaWZpdmUsY2xpbnQueWFtbCB8IDEgKwo+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPj4+Cj4+PiBkaWZmIC0tZ2l0Cj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+Pj4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPj4+IGluZGV4IGFhZGE2OTU3
MjE2Yy4uODY3MDNlOTk1ZTMxIDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPj4+IEBAIC0z
NSw2ICszNSw3IEBAIHByb3BlcnRpZXM6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0
OiBzaWZpdmUsY2xpbnQwCj4+PiDCoMKgwqDCoMKgwqAgLSBpdGVtczoKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gZW51bToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHRoZWFk
LG9wZW5jOTA2LWNsaW50Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYWxsd2lu
bmVyLHN1bjIwaS1kMS1jbGludAo+Pgo+PiBBZGQgZW50cmllcyBzb3J0ZWQgYWxwaGFiZXRpY2Fs
bHkuIFRoaXMgc2hvdWxkIGJlIHNxdWFzaGVkIHdpdGgKPj4gcHJldmlvdXMKPj4gcGF0Y2guCj4g
Cj4gSSBtYWtlIGl0IGEgc2VwZXJhdGVkIHBhdGNoIGJlY2F1c2UgSSB0aGluayBpdCdzIGEgcXVl
c3Rpb25hYmxlCj4gYXBwcm9hY2guCj4gCj4gSWYgeW91IHRoaW5rIGl0J3Mgb2theSwgSSB3aWxs
IGp1c3Qgc3F1YXNoIGl0IGFuZCBwdXQgaXQgYXMgdGhlIHNlY29uZAo+IHBhdGNoIGluIHRoZSBu
ZXh0IGl0ZXJhdGlvbiwgd2l0aCBhZGRpbmcgb3BlbmM5MDYtcGxpYyBhcyB0aGUgZmlyc3QKPiBv
bmUuCgpXaGF0IGlzIGEgcXVlc3Rpb25hYmxlIGFwcHJvYWNoPyBXaHkgY29tbWl0IG1zZyBpcyBu
b3Qgc2F5aW5nIHRoaXM/CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
