Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E30CD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMHj+X3uQbLSr9XwHdDF3nSwM+3oW9X7pahi6TrA1d0=; b=SmVo5dgG1hgXO9
	fq7Rx9R2nzlAShFDbQdfiklGNyaPixMMjlwo/sGwyExH5a71NKvmGL/GyD7wz/20fapc9H+mWY/Wb
	HLiEBYso3VE1b37B6mZW7fEmgn05TKxsc8CGED44sb7HcDyLaTLbabkE9G9it7Ew154buhmtacgr+
	C8NdTfmYpa+ym3NJdWF2jILHAajiMoRhJM84L26/oUQOnO6vn4xvBH/M3oWxdbRnZQITN/H70QAII
	Rn7x07hh3XaTeRCve8Ok2wcZZ5UNMOo2Aa7d6DRKNu+gWQ1qWmhWHlEwA/Nz1C/VZFncEIcsDa4CG
	yTzLjnjiIm/RKlWDa2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpxIS-0000000Fm0F-1W8Z;
	Thu, 28 Mar 2024 21:28:28 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpxIM-0000000Flz7-2toB
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 21:28:25 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 35B353FB79
	for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1711661297;
	bh=5ko95O3gC1sLJn6IH23zULppCGnOBuRUTKkxrCf7TS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=pcWtuIDaQUv5XW/NB3YB6ANX511yskKICJiFeLCcyukLTZUW8iih2qaLQYKuCyF7u
	 rvN0nfb9yxwFOCMWZXwNo5sGubB7VU5vHJ2SV2JOs/bFQzq3WHcjdRaa2UYxhD3gWe
	 3i1PjykFImlhZn7dtNrVvpNI3jRJOc8uY7FgcpFz1crhq1vYONBtewpw5xUWaohhaX
	 E+AEvyXoFHUMsyA45OcWaudYLwEpoPWAHnY78g5xsfUzrFB2EyJp+LgMwG+aWrjDpY
	 NkKMvoNafz9b7m2xjq9QobtnK9XFUokv4u4mmqKNqIlXKzfAmiTZnuHJ7+i+HoC2jD
	 8Ch7O22XyuhdQ==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33ec0700091so764424f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 14:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711661297; x=1712266097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ko95O3gC1sLJn6IH23zULppCGnOBuRUTKkxrCf7TS4=;
        b=ci7C8vqE4oeDiWHxCxMN+vtz9GSG3gCUmgN8ulBkymY8e/p7VG02IgSjiaE4/yentS
         20cVjVjRPNFRzKaS+AqzbUtxzTqWVY5IO3YM3fnv/ZU/4dkYXQGOJajnQU/uKjWsppbc
         q5OevAsAFiAlxNkVYw4dSKUR+RFSEOlLkRHGHpTXkBZnM/r3neMFEtA+rqaWlZyQfWiR
         yLxWNzheL3EntDbgpa7traitUbCgVuXb+NC3y1iu9TgDUvAA+WYYRtrY1SHYuuUzO0i2
         NLbphnSA4YaGy5AyCm5BFWs9PzdLifB4Yh71oi3M3X8ukPZE2wJFm2Lv9aye6aAyyJE/
         rpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVePQcz2TjTpfCQS2l6J+u6x10wk4dos4rE2RHwgfXjMHbz7QkTMmgnAJuNYPLVmuGPJVCPwNfIuUKZi2vMhrojufO8Pimog4yWJvt3qU57
X-Gm-Message-State: AOJu0YzCgyFjvL4FWxaHnjYIULNeLpTDeSO1gYE1GAQ3KNx6aXiWoB3G
	WWUbpqPpbkrSHiozq0Bn4BTtSl0Jm03Ba7slT009VdNVjQOTRcxPCPkUZuIcfrfCEkXfGzcAKsY
	P8OFfiU2RrZ9h4l+4suFxBOitVyacjUyR0cXggOuWXSYUeSkUMmc/sz3iAiNliD1TTscxNc/Jsu
	owSSz0y+PFCU8dDg==
X-Received: by 2002:adf:f28a:0:b0:341:ddd9:c034 with SMTP id k10-20020adff28a000000b00341ddd9c034mr147976wro.65.1711661296800;
        Thu, 28 Mar 2024 14:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3aWLpJ7UToopXtObbatmYTPGekahPHltbJUAha1+RnYVQUR9NuugKZrIExJ3M4EMn+YHwyw==
X-Received: by 2002:adf:f28a:0:b0:341:ddd9:c034 with SMTP id k10-20020adff28a000000b00341ddd9c034mr147960wro.65.1711661296382;
        Thu, 28 Mar 2024 14:28:16 -0700 (PDT)
Received: from [192.168.123.161] (ip-062-143-245-032.um16.pools.vodafone-ip.de. [62.143.245.32])
        by smtp.gmail.com with ESMTPSA id gb17-20020a056000459100b003432db356easm2622729wrb.98.2024.03.28.14.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 14:28:15 -0700 (PDT)
Message-ID: <43918921-0d05-41d3-a19b-f137314e868d@canonical.com>
Date: Thu, 28 Mar 2024 22:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device
 tree
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
References: <20240131132600.4067-1-jszhang@kernel.org>
 <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240206-magma-deem-2c88e45a545a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_142823_453210_7D8808C0 
X-CRM114-Status: GOOD (  22.78  )
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

T24gMi82LzI0IDIwOjEzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMzEsIDIw
MjQgYXQgMDk6MjY6MDBQTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPj4gVGhlIE1pbGt2
IE1hcnMgaXMgYSBkZXZlbG9wbWVudCBib2FyZCBiYXNlZCBvbiB0aGUgU3RhcmZpdmUgSkg3MTEw
IFNvQy4KPj4gVGhlIGJvYXJkIGZlYXR1cmVzOgo+Pgo+PiAtIEpINzExMCBTb0MKPj4gLSAxLzIv
NC84IEdpQiBMUEREUjQgRFJBTQo+PiAtIEFYUDE1MDYwIFBNSUMKPj4gLSA0MCBwaW4gR1BJTyBo
ZWFkZXIKPj4gLSAzeCBVU0IgMy4wIGhvc3QgcG9ydAo+PiAtIDF4IFVTQiAyLjAgaG9zdCBwb3J0
Cj4+IC0gMXggTS4yIEUtS2V5Cj4+IC0gMXggZU1NQyBzbG90Cj4+IC0gMXggTWljcm9TRCBzbG90
Cj4+IC0gMXggUVNQSSBGbGFzaAo+PiAtIDF4IDFHYnBzIEV0aGVybmV0IHBvcnQKPj4gLSAxeCBI
RE1JIHBvcnQKPj4gLSAxeCAyLWxhbmUgRFNJIGFuZCAxeCA0LWxhbmUgRFNJCj4+IC0gMXggMi1s
YW5lIENTSQo+Pgo+PiBBZGQgdGhlIGRldmljZXRyZWUgZmlsZSBkZXNjcmliaW5nIHRoZSBjdXJy
ZW50bHkgc3VwcG9ydGVkIGZlYXR1cmVzLAo+PiBuYW1lbHkgUE1JQywgVUFSVCwgSTJDLCBHUElP
LCBTRCBjYXJkLCBRU1BJIEZsYXNoLCBlTU1DIGFuZCBFdGhlcm5ldC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IAo+IEdvdCBhIGR0YnNf
Y2hlY2sgaXNzdWUgaW4gdGhlIHBhdGNod29yayBDSToKPiAKPiAgICArYXJjaC9yaXNjdi9ib290
L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdGI6IGdtYWMxLXJnbWlpLXJ4aW4tY2xv
Y2s6ICdjbG9jay1mcmVxdWVuY3knIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgICArCWZyb20g
c2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xvY2svZml4ZWQtY2xv
Y2sueWFtbCMKPiAgICArYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3Yt
bWFycy5kdGI6IGdtYWMxLXJtaWktcmVmaW4tY2xvY2s6ICdjbG9jay1mcmVxdWVuY3knIGlzIGEg
cmVxdWlyZWQgcHJvcGVydHkKPiAgICArCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvY2xvY2svZml4ZWQtY2xvY2sueWFtbCMKPiAKPiBDYW4geW91IGZpeCB0
aGF0IHBsZWFzZT8gQWxzbywgSSBhcHBsaWVkIHNvbWUgcGF0Y2hlcyB0aGUgb3RoZXIgZGF5IHRo
YXQKPiBzZWVtIHRvIGNvbmZsaWN0IHF1aXRlIGEgYml0IHdpdGggdGhlIGNvbW1vbiBib2FyZCBk
dHMgcGF0Y2guIFdvdWxkIHlvdQo+IHBsZWFzZSBkbyBhIHJlYmFzZSBvbiB0b3Agb2YgdGhhdCBw
bGVhc2U/Cj4gCj4gQ2hlZXJzLAo+IENvbm9yLgo+IAo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlICAgICAgICAgfCAgMSArCj4+ICAgLi4uL2Jvb3QvZHRz
L3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cyAgIHwgMzUgKysrKysrKysrKysrKysrKysr
Kwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0
cwo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmls
ZSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvTWFrZWZpbGUKPj4gaW5kZXggMDE0MTUw
NGMwZjVjLi4yZmEwY2Q3ZjMxYzMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9N
YWtlZmlsZQo+PiBAQCAtOCw1ICs4LDYgQEAgRFRDX0ZMQUdTX2poNzExMC1zdGFyZml2ZS12aXNp
b25maXZlLTItdjEuM2IgOj0gLUAKPj4gICBkdGItJChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0g
amg3MTAwLWJlYWdsZXYtc3RhcmxpZ2h0LmR0Ygo+PiAgIGR0Yi0kKENPTkZJR19BUkNIX1NUQVJG
SVZFKSArPSBqaDcxMDAtc3RhcmZpdmUtdmlzaW9uZml2ZS12MS5kdGIKPj4gICAKPj4gK2R0Yi0k
KENPTkZJR19BUkNIX1NUQVJGSVZFKSArPSBqaDcxMTAtbWlsa3YtbWFycy5kdGIKPj4gICBkdGIt
JChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0gamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi12
MS4yYS5kdGIKPj4gICBkdGItJChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0gamg3MTEwLXN0YXJm
aXZlLXZpc2lvbmZpdmUtMi12MS4zYi5kdGIKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kZTYwMGU3OTllN2QKPj4gLS0tIC9kZXYvbnVsbAo+PiAr
KysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cwo+
PiBAQCAtMCwwICsxLDM1IEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MCBPUiBNSVQKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSmlzaGVuZyBaaGFuZyA8
anN6aGFuZ0BrZXJuZWwub3JnPgo+PiArICovCj4+ICsKPj4gKy9kdHMtdjEvOwo+PiArI2luY2x1
ZGUgImpoNzExMC12aXNpb25maXZlMi1tYXJzLWNvbW1vbi5kdHNpIgo+PiArCj4+ICsvIHsKPj4g
Kwltb2RlbCA9ICJNaWxrLVYgTWFycyI7Cj4+ICsJY29tcGF0aWJsZSA9ICJtaWxrdixtYXJzIiwg
InN0YXJmaXZlLGpoNzExMCI7Cj4+ICt9Owo+PiArCj4+ICsmZ21hYzAgewo+PiArCXN0YXJmaXZl
LHR4LXVzZS1yZ21paS1jbGs7Cj4+ICsJYXNzaWduZWQtY2xvY2tzID0gPCZhb25jcmcgSkg3MTEw
X0FPTkNMS19HTUFDMF9UWD47Cj4+ICsJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmYW9uY3Jn
IEpINzExMF9BT05DTEtfR01BQzBfUk1JSV9SVFg+Owo+PiArfTsKPj4gKwo+PiArCj4+ICsmcGh5
MCB7Cj4+ICsJbW90b3Jjb21tLHR4LWNsay1hZGotZW5hYmxlZDsKPj4gKwltb3RvcmNvbW0sdHgt
Y2xrLTEwLWludmVydGVkOwo+PiArCW1vdG9yY29tbSx0eC1jbGstMTAwLWludmVydGVkOwo+PiAr
CW1vdG9yY29tbSx0eC1jbGstMTAwMC1pbnZlcnRlZDsKPj4gKwltb3RvcmNvbW0scngtY2xrLWRy
di1taWNyb2FtcCA9IDwzOTcwPjsKPj4gKwltb3RvcmNvbW0scngtZGF0YS1kcnYtbWljcm9hbXAg
PSA8MjkxMD47Cj4+ICsJcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8MTUwMD47Cj4+ICsJdHgtaW50
ZXJuYWwtZGVsYXktcHMgPSA8MTUwMD47Cj4+ICt9Owo+PiArCj4+ICsmbW1jMSB7Cj4+ICsJZGlz
YWJsZS13cDsKCkR1ZSB0byB3aGljaCBkaWZmZXJlbmNlIGlzICdkaXNhYmxlLXdwJyBuZWNlc3Nh
cnkgZm9yIHRoZSBNYXJzIGJvYXJkIGFuZCAKbm90IG5lY2Vzc2FyeSBmb3IgdGhlIFZpc2lvbkZp
dmUgMiBib2FyZD8KCj4+ICsJY2QtZ3Bpb3MgPSA8JnN5c2dwaW8gNDEgR1BJT19BQ1RJVkVfTE9X
PjsKCk9uIG15IFZpc2lvbkZpdmUgMiAxLjJCLCBhbmQgMS4zQSBib2FyZHMgR1BJTyA0MSByZWZs
ZWN0cyBpZiBhbiBTRC1jYXJkIAppcyBpbnNlcnRlZCAoYXMgc2hvd24gaW4gVS1Cb290IGJ5IGdw
aW8gc3RhdHVzIC1hKS4gU28gc2hvdWxkbid0IHRoaXMgCnZhbHVlIGJlIG1vdmVkIHRvIHRoZSBj
b21tb24gaW5jbHVkZSAKImpoNzExMC12aXNpb25maXZlMi1tYXJzLWNvbW1vbi5kdHNpIiBhbmQg
YnJva2VuLWNkIHJlbW92ZWQgZnJvbSB0aGUgClZpc2lvbkZpdmUyIGJvYXJkPwoKaHR0cHM6Ly9k
b2MtZW4ucnZzcGFjZS5vcmcvVmlzaW9uRml2ZTIvUERGL1NDSF9SVjAwMl9WMS4yQV8yMDIyMTIx
Ni5wZGYKaGFzIGEgbGluZQoKICAgICBHUElPNDEgfCBTRF9TRElPMF9DRF9HUElPNDEgfCBNaWNy
byBTRO+8mkoxMAoKQmVzdCByZWdhcmRzCgpIZWlucmljaAoKPj4gK307Cj4+IC0tIAo+PiAyLjQz
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
