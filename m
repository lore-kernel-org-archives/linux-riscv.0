Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB129C6FD19
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVOwLUuVwU1bUAXMFk8YtpOdj7InwhXrev+ohNwyOoc=; b=IKuh/ZOaKnAUNc
	0/5lwM1SDXrJN7OH0WPeg/RP0tIponUCiXRTSdPDu589nTmZ/1eivKf2nHE72DAFyuTmeCnLgKDfm
	OpgueeYpe7LqLnK+byOM7ZGHVDy31+Xc5d/+TlQ7tPFC0Bp5z81xVIYDpp1SkOI7Svo7F13njYSny
	4u+ZTvBMPpk0z16I/FF9A4YuxAMRbAlRN3UgmQ+KvSfrsknR6bgXWMfyJseSY9pTCiKaOC5DPyb/T
	pnpnP6tRV6VrFUAVwTIfbg1sh11KgQBk6FEqzMPLlCdC77guJ4f25j8L6gwEojYSnjK8ZWz2ZIoYg
	sTRrAxRP3gz4UXeT+EXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciae-00FaUE-1t;
	Thu, 16 Mar 2023 08:04:00 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pciab-00FaSZ-18
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 08:03:59 +0000
Received: by mail-ed1-x52d.google.com with SMTP id ek18so4142254edb.6
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 01:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678953834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+cZwh2hI/bgGeKTrAQebGxqZCqqNNagfDg/OgVtVDg=;
        b=cLqpe5KxXJEEEdU7lSOKM8wQALxgGMFJ7k3H3uZCLHZcwJt7RArA6ZlrxFXuc5L0PA
         VY1qvxAs/j/HrGwfjHNXU5zEw8BerQ079NdnCkbydxb7QLjUT8xtYEDNP5IVymC+rT9X
         2xZ/ztafdHhNtxpn4EHuLsL8d4CZ8uDrH5NzHLoNTcFQ4q5yYyGXOPjW6U0WQB/7aRsO
         19asYfeQm60/lND7aq+D/a3VEyGqxStBfZobn3bbP0KKlrBr006iUZZ+ynG/7DGSn0F5
         KQrmsmYhVMMt84ps4528f2AwuljVQiuVNQ38eb+zuaB4ri/W4XSpn9Wh9HUvf96tbb66
         XXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678953834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+cZwh2hI/bgGeKTrAQebGxqZCqqNNagfDg/OgVtVDg=;
        b=QIUe20797t/WOMho98Gyb0zjAVRUXsUTc53n+BFFmkRJvhFwxG9+BiLH1Pxt3XZ7ds
         XjGEOO/OaJ3R8rmlWOzhT9oPj7IVhFJnwMq+Qp7X1TrHkzGMAQk57fd4z/9BuRXWVRjV
         pYkOVEET3jIh5N9kBmNDS156nRSsfEI6zsQwl874i5xNEH7xjvKc7b0nBvKsOcxhdJT0
         PKXe5v3OxEKFf/0bPWMl2p1/oas++mJWAt2AfpYSHoBmV5kdh7WCSjNTC3bn+j/po7na
         c51mWRWrslM/DSHEYRSaQbyJvE2AFQ2ylrTKVm0nBqTVGN/H569gYUjilbH6JphZVHoW
         L5ew==
X-Gm-Message-State: AO0yUKUgPzeBnb8qZvsero8Usmqyenrn5x4MVGTeqMa+aJHkJzqiZNDL
	gl47qIrkeWb2aVTud2O/lECKFg==
X-Google-Smtp-Source: AK7set++cHuluKT9KRDqdqU7M4iRO64R+sbBtAPAQnOnNLB7bIOQ5c0wLOiKR0IEg24HPnbLTZ1r2w==
X-Received: by 2002:a17:906:7687:b0:8a6:e075:e364 with SMTP id o7-20020a170906768700b008a6e075e364mr8804524ejm.26.1678953833948;
        Thu, 16 Mar 2023 01:03:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id md21-20020a170906ae9500b0092b546b57casm3475456ejb.195.2023.03.16.01.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 01:03:53 -0700 (PDT)
Message-ID: <9038dba0-6f72-44a1-9f57-1c08b03b9c31@linaro.org>
Date: Thu, 16 Mar 2023 09:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Guo Samin <samin.guo@starfivetech.com>, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-5-samin.guo@starfivetech.com>
 <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
 <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_010357_388936_0338F2C3 
X-CRM114-Status: GOOD (  16.68  )
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

T24gMTYvMDMvMjAyMyAwOTowMiwgR3VvIFNhbWluIHdyb3RlOgo+IAo+IAo+IC0tLS0tLS0tIOWO
n+Wni+S/oeaBryAtLS0tLS0tLQo+IOS4u+mimDogUmU6IFtQQVRDSCB2NyA0LzZdIGR0LWJpbmRp
bmdzOiBuZXQ6IEFkZCBzdXBwb3J0IFN0YXJGaXZlIGR3bWFjCj4gRnJvbTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IOaUtuS7tuS6ujogU2Ft
aW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4sIGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g5pel5pyfOiAyMDIzLzMvMTYK
PiAKPj4gT24gMTYvMDMvMjAyMyAwNTozNywgU2FtaW4gR3VvIHdyb3RlOgo+Pj4gRnJvbTogWWFu
aG9uZyBXYW5nIDx5YW5ob25nLndhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4+Cj4+PiBBZGQgZG9j
dW1lbnRhdGlvbiB0byBkZXNjcmliZSBTdGFyRml2ZSBkd21hYyBkcml2ZXIoR01BQykuCj4+Pgo+
PiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIHNvbWV0aGluZyB0byBkaXNjdXNz
L2ltcHJvdmUuCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5ob25nIFdhbmcgPHlhbmhvbmcud2Fu
Z0BzdGFyZml2ZXRlY2guY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogU2FtaW4gR3VvIDxzYW1pbi5n
dW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPj4+IFRlc3RlZC1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21t
Lm1lcmNpYWlAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L3NucHMsZHdtYWMueWFtbCAgIHwgICAxICsKPj4+ICAuLi4vYmluZGluZ3MvbmV0L3N0YXJm
aXZlLGpoNzExMC1kd21hYy55YW1sICAgfCAxMzAgKysrKysrKysrKysrKysrKysrCj4+PiAgTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKPj4+ICAz
IGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3
bWFjLnlhbWwKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+Pj4gaW5kZXggZTQ1MTljZjcyMmFiLi4yNDVmN2Q3
MTMyNjEgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L3NucHMsZHdtYWMueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPj4+IEBAIC05MSw2ICs5MSw3IEBAIHByb3BlcnRp
ZXM6Cj4+PiAgICAgICAgICAtIHNucHMsZHdtYWMtNS4yMAo+Pj4gICAgICAgICAgLSBzbnBzLGR3
eGdtYWMKPj4+ICAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIuMTAKPj4+ICsgICAgICAgIC0gc3Rh
cmZpdmUsamg3MTEwLWR3bWFjCj4+PiAgCj4+PiAgICByZWc6Cj4+PiAgICAgIG1pbkl0ZW1zOiAx
Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9z
dGFyZml2ZSxqaDcxMTAtZHdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwKPj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmI1OWU2YmQ4MjAxZgo+Pj4gLS0tIC9kZXYvbnVs
bAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdGFyZml2
ZSxqaDcxMTAtZHdtYWMueWFtbAo+Pj4gQEAgLTAsMCArMSwxMzAgQEAKPj4+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+ICsjIENv
cHlyaWdodCAoQykgMjAyMiBTdGFyRml2ZSBUZWNobm9sb2d5IENvLiwgTHRkLgo+Pj4gKyVZQU1M
IDEuMgo+Pj4gKy0tLQo+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0
L3N0YXJmaXZlLGpoNzExMC1kd21hYy55YW1sIwo+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4gKwo+Pj4gK3RpdGxlOiBTdGFyRml2
ZSBKSDcxMTAgRFdNQUMgZ2x1ZSBsYXllcgo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+Pj4gKyAg
LSBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+Pj4gKyAgLSBTYW1pbiBH
dW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+Pj4gKwo+Pj4gK3NlbGVjdDoKPj4+ICsg
IHByb3BlcnRpZXM6Cj4+PiArICAgIGNvbXBhdGlibGU6Cj4+PiArICAgICAgY29udGFpbnM6Cj4+
PiArICAgICAgICBlbnVtOgo+Pj4gKyAgICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1kd21hYwo+
Pj4gKyAgcmVxdWlyZWQ6Cj4+PiArICAgIC0gY29tcGF0aWJsZQo+Pj4gKwo+Pj4gK3Byb3BlcnRp
ZXM6Cj4+PiArICBjb21wYXRpYmxlOgo+Pj4gKyAgICBpdGVtczoKPj4+ICsgICAgICAtIGVudW06
Cj4+PiArICAgICAgICAgIC0gc3RhcmZpdmUsamg3MTEwLWR3bWFjCj4+PiArICAgICAgLSBjb25z
dDogc25wcyxkd21hYy01LjIwCj4+PiArCj4+Cj4+IHJlZzoKPj4gICBtYXhJdGVtczogMQo+IAo+
Pgo+Pj4gKyAgY2xvY2tzOgo+Pj4gKyAgICBpdGVtczoKPj4+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBHTUFDIG1haW4gY2xvY2sKPj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHTUFDIEFIQiBjbG9j
awo+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFBUUCBjbG9jawo+Pj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IFRYIGNsb2NrCj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogR1RYIGNsb2NrCj4+PiAr
Cj4+PiArICBjbG9jay1uYW1lczoKPj4+ICsgICAgaXRlbXM6Cj4+PiArICAgICAgLSBjb25zdDog
c3RtbWFjZXRoCj4+PiArICAgICAgLSBjb25zdDogcGNsawo+Pj4gKyAgICAgIC0gY29uc3Q6IHB0
cF9yZWYKPj4+ICsgICAgICAtIGNvbnN0OiB0eAo+Pj4gKyAgICAgIC0gY29uc3Q6IGd0eAo+Pj4g
Kwo+Pgo+PiBpbnRlcnJ1cHRzOiA/Pz8KPj4KPiAKPiBIaSBLcnp5c3p0b2YsIAo+IAo+IHNucHMs
ZHdtYWMueWFtbCBoYXMgZGVmaW5lZCB0aGUgcmVnL2ludGVycnVwdC9pbnRlcnJ1cHQtbmFtZXMg
bm9kZXMsCj4gYW5kIHRoZSBKSDcxMTAgU29DIGlzIGFsc28gYXBwbGljYWJsZS4KPiBNYXliZSBq
dXN0IGFkZCByZWcvaW50ZXJydXB0L2ludGVycnVwdC1uYW1lcyB0byB0aGUgcmVxdWlyZWQgPwoK
WW91IG5lZWQgdG8gY29uc3RyYWluIHRoZW0uCgo+IAo+IAo+ICAgcmVxdWlyZWQ6Cj4gICAgIC0g
Y29tcGF0aWJsZQo+ICsgICAtIHJlZwo+ICAgICAtIGNsb2Nrcwo+ICAgICAtIGNsb2NrLW5hbWVz
Cj4gKyAgIC0gaW50ZXJydXB0cwo+ICsgICAtIGludGVycnVwdC1uYW1lcwo+ICAgICAtIHJlc2V0
cwo+ICAgICAtIHJlc2V0LW5hbWVzCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
