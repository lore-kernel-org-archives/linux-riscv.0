Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A255FEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 06:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqr0vPetncP05U/A9o9VCVPCcC67Bpy2WROczuMcKvQ=; b=WUMRofVlODsKoX
	rnp5O0jKOcOtHW12VGEbCw8bXaCO9Ss8hIlEJDGFQ6lFSZDIpbfGuhoZIwc0XEHzAWDqX8GHms1UF
	zVLe/886vuE8McZ3iqREX0zVPBEABWFMN5NK7NXmYYE4pBC0Fmn9hxzAs0St1Z5h0E18jw1wT+ORY
	yR70pude3HBA5DK526/vgDRKk0LQBm7uoaQTzaa+rtdJ7UM17aY7KOLzgNm8g1y+YbDroamkeFKKO
	IKXO2SWXvf2m8TZYasYi0hFF38S/ZHALEKDKqUIMne2NiCOzv6y0+cjL3w5FpMfxxGycLyjjUdAlb
	zCn84McLAbV3ukMXlVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDfZY-009UDo-2b;
	Mon, 26 Jun 2023 06:19:36 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDfZV-009UDJ-1U
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 06:19:35 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9896216338cso217638666b.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 23:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687760370; x=1690352370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pmC8wZXtYNTW6/LxLrgQoLPpYTxup5SGOO3PUWoNQs=;
        b=rlW+Zt77COA20cJdXuNuF7ggNubDMstIwA5vm5NECHqd3WDi7xRuzeHwzUmy4YLa2S
         TxPFb7pd2Nl/KKPBzP68mwqCxu9wMUmN8jnGdc2sCy+1Pak9GqU0ClHlZ7DBJ6/gPd0w
         OacU+K+OM7ksc0tUIu7YpXQwNqD+SfZETIYoQ5JGBmMC8S2pFbQQ0PiMpTuTRRDbyJQj
         3wzmgokWicYOrTNQ7wzQY2RXCbL/ed20OsC5Lw8moQRlQN0M2+wXaDMBKMF81RZi09PG
         5Ja6YA+ClqLl2DWFQncTY3Z9tz7pJYsCKFr2fos2SEpvQqt5pipxXFlD3xNJbTcBdIV0
         Evjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687760370; x=1690352370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pmC8wZXtYNTW6/LxLrgQoLPpYTxup5SGOO3PUWoNQs=;
        b=KKgu5qDPpRsxfwfbwvcu7N7sFnctq2n2uqeKPyxFuW4uCzemOIiT4GNA4W3ryiJOex
         iJ5u4F1Kmu7uTamLnDmCf3zDIwm+6kix8C8+ZafobppHdHXzfRnWwoMX2HuIh5zmeGHH
         3c93qErz9NwNiauG1yhaoTzO+2FROLTV0EbWmgfmdWGlj04UDcFlHnbHUFgqkU8RYTDx
         HSsVnxQEeGaOTBUeWUYm4X2CqxjTFJIvLPGkv9vHQPVuJoMun0L2pgPbcGfynLFb3XFj
         r32XhcKBJdkkwH0mubaKSWJZEodca9tnS1Kc36gythLrSFTFv6LjDPBMAL9bI8EwuI5u
         FvSg==
X-Gm-Message-State: AC+VfDzhayM690x+la1+yT7I1zDG29Kzso7P2eslGRccIJmXsWlYx5TQ
	9+A03GhBQm4xUMRDzdfxukKYng==
X-Google-Smtp-Source: ACHHUZ5jHs+wHRLwWTuvwMW7A1RL8o9mhMMeuhCDIHHhXY4HsUgGPXw2ay6r63vnJ66x2hVyymzlyg==
X-Received: by 2002:a17:907:9305:b0:96f:8666:5fc4 with SMTP id bu5-20020a170907930500b0096f86665fc4mr25221452ejc.50.1687760370474;
        Sun, 25 Jun 2023 23:19:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i4-20020a170906a28400b00991e849dbd1sm104735ejz.63.2023.06.25.23.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 23:19:29 -0700 (PDT)
Message-ID: <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org>
Date: Mon, 26 Jun 2023 08:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-US
To: Eric Lin <eric.lin@sifive.com>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 maz@kernel.org, chenhuacai@kernel.org, baolu.lu@linux.intel.com,
 will@kernel.org, kan.liang@linux.intel.com, nnac123@linux.ibm.com,
 pierre.gondois@arm.com, jgross@suse.com, chao.gao@intel.com,
 maobibo@loongson.cn, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dslin1010@gmail.com, Zong Li <zong.li@sifive.com>,
 Nick Hu <nick.hu@sifive.com>, Greentime Hu <greentime.hu@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
 <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_231933_523106_79CB8543 
X-CRM114-Status: GOOD (  18.43  )
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

T24gMjYvMDYvMjAyMyAwNToyNiwgRXJpYyBMaW4gd3JvdGU6Cj4gSGkgS3J6eXN6dG9mLAo+IAo+
IE9uIEZyaSwgSnVuIDE2LCAyMDIzIGF0IDY6NDXigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCj4g
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDE2LzA2LzIw
MjMgMDg6MzIsIEVyaWMgTGluIHdyb3RlOgo+Pj4gVGhpcyBhZGQgWUFNTCBEVCBiaW5kaW5nIGRv
Y3VtZW50YXRpb24gZm9yIFNpRml2ZSBQcml2YXRlIEwyCj4+PiBjYWNoZSBjb250cm9sbGVyCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4+PiBS
ZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6
IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPj4+IC0tLQo+Pj4gIC4uLi9iaW5kaW5ncy9y
aXNjdi9zaWZpdmUscEwyQ2FjaGUwLnlhbWwgICAgICB8IDgxICsrKysrKysrKysrKysrKysrKysK
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKQo+Pj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLHBMMkNh
Y2hlMC55YW1sCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9zaWZpdmUscEwyQ2FjaGUwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLHBMMkNhY2hlMC55YW1sCj4+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iNWQ4ZDRhMzlkZGUKPj4+IC0tLSAv
ZGV2L251bGwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9zaWZpdmUscEwyQ2FjaGUwLnlhbWwKPj4+IEBAIC0wLDAgKzEsODEgQEAKPj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4+PiArIyBDb3B5
cmlnaHQgKEMpIDIwMjMgU2lGaXZlLCBJbmMuCj4+PiArJVlBTUwgMS4yCj4+PiArLS0tCj4+PiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9yaXNjdi9zaWZpdmUscEwyQ2FjaGUw
LnlhbWwjCj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCj4+PiArCj4+PiArdGl0bGU6IFNpRml2ZSBQcml2YXRlIEwyIENhY2hlIENvbnRy
b2xsZXIKPj4+ICsKPj4+ICttYWludGFpbmVyczoKPj4+ICsgIC0gR3JlZW50aW1lIEh1ICA8Z3Jl
ZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4+PiArICAtIEVyaWMgTGluICAgICAgPGVyaWMubGluQHNp
Zml2ZS5jb20+Cj4+PiArCj4+PiArZGVzY3JpcHRpb246Cj4+PiArICBUaGUgU2lGaXZlIFByaXZh
dGUgTDIgQ2FjaGUgQ29udHJvbGxlciBpcyBwZXIgaGFydCBhbmQgY29tbXVuaWNhdGVzIHdpdGgg
Ym90aCB0aGUgdXBzdHJlYW0KPj4+ICsgIEwxIGNhY2hlcyBhbmQgZG93bnN0cmVhbSBMMyBjYWNo
ZSBvciBtZW1vcnksIGVuYWJsaW5nIGEgaGlnaC1wZXJmb3JtYW5jZSBjYWNoZSBzdWJzeXN0ZW0u
Cj4+PiArICBBbGwgdGhlIHByb3BlcnRpZXMgaW4gZVBBUFIvRGV2aWNlVHJlZSBzcGVjaWZpY2F0
aW9uIGFwcGxpZXMgZm9yIHRoaXMgcGxhdGZvcm0uCj4+Cj4+IERyb3AgdGhlIGxhc3Qgc2VudGVu
Y2UuIFdoeSBzcGVjaWZpY2F0aW9uIHdvdWxkIG5vdCBhcHBseT8KPj4KPiBPSywgSSdsbCBkcm9w
IGl0IGluIHYyLgo+IAo+Pj4gKwo+Pj4gK2FsbE9mOgo+Pj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9j
YWNoZS1jb250cm9sbGVyLnlhbWwjCj4+PiArCj4+PiArc2VsZWN0Ogo+Pj4gKyAgcHJvcGVydGll
czoKPj4+ICsgICAgY29tcGF0aWJsZToKPj4+ICsgICAgICBjb250YWluczoKPj4+ICsgICAgICAg
IGVudW06Cj4+PiArICAgICAgICAgIC0gc2lmaXZlLHBMMkNhY2hlMAo+Pj4gKyAgICAgICAgICAt
IHNpZml2ZSxwTDJDYWNoZQo+Pj4gKwo+Pj4gKyAgcmVxdWlyZWQ6Cj4+PiArICAgIC0gY29tcGF0
aWJsZQo+Pj4gKwo+Pj4gK3Byb3BlcnRpZXM6Cj4+PiArICBjb21wYXRpYmxlOgo+Pj4gKyAgICBp
dGVtczoKPj4KPj4KPj4gWW91IGhhdmUgb25seSBvbmUgaXRlbSwgc28gbm8gbmVlZCBmb3IgaXRl
bXMuLi4gdW5sZXNzIHlvdSBqdXN0IG1pc3NlZAo+PiBwcm9wZXIgZmFsbGJhY2suCj4gCj4gT0ss
IEknbGwgZml4IGl0IGluIHYyLgo+IAo+Pgo+Pj4gKyAgICAgIC0gZW51bToKPj4+ICsgICAgICAg
ICAgLSBzaWZpdmUscEwyQ2FjaGUwCj4+PiArICAgICAgICAgIC0gc2lmaXZlLHBMMkNhY2hlMQo+
Pgo+PiBXaGF0IGlzICIwIiBhbmQgIjEiIGhlcmU/IFdoYXQgZG8gdGhlc2UgY29tcGF0aWJsZXMg
cmVwcmVzZW50PyBXaHkgdGhleQo+PiBkbyBub3QgaGF2ZSBhbnkgU29DIHJlbGF0ZWQgcGFydD8K
PiAKPiBUaGUgcEwyQ2FjaGUxIGhhcyBtaW5vciBjaGFuZ2VzIGluIGhhcmR3YXJlLCBidXQgaXQg
Y2FuIHVzZSB0aGUgc2FtZQo+IHBsMiBjYWNoZSBkcml2ZXIuCgpUaGVuIHdoeSBhcmVuJ3QgdGhl
eSBjb21wYXRpYmxlPwoKPiBNYXkgSSBhc2ssIHdoYXQgZG8geW91IG1lYW4gYWJvdXQgdGhlIFNv
Qy1yZWxhdGVkIHBhcnQ/IFRoYW5rcy4KClRoaXMgaXMgcGFydCBvZiBhIFNvQywgcmlnaHQ/IFdl
IGV4cGVjdCBTb0MgYmxvY2tzIHRvIGhhdmUgY29tcGF0aWJsZQpiYXNlZCBvbiB0aGUgU29DLgoK
CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
