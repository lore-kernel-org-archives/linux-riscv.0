Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E21AEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynlTmYslJ/aM5QfHxR01KIY8q2xbkq5XEOk+OEwJBgw=; b=ZfDfnfCxbSteDg
	PrfAOylXVGgUmnG3ZdWge2X3gD7maMD5u+NBxJsimWhgs2U6brmFdRN8Cn9K3A31AdFC4+HWwWfGd
	0M4/7t5/raBKO/5ySsMbSfz5SjI3k7vJVFK0wpUg+kulbrl4VEk/p/yWi8Av/60TfMI/L0qhhokkt
	amSYNYzcP+37OIgRKzmTgnoH2Cv0cVyWs7t4r+4SO/ENhZAFf8LV7e4DPWwvx0q6pc5kc7Nomvt3w
	ZvHH0hLj39W6qrOrbzEL9Scdz0o4Ina/5Z7bQNAOEih0/zC00O1UP45Cac9Oj7olcaPGRAFDLAMW7
	dPD63VdHE2IeBTpiP1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhA4-00CC2Z-0p;
	Tue, 20 Jun 2023 19:37:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhA1-00CC1V-1e
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:37:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b5018cb4dcso24415895ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687289823; x=1689881823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w6ZvEIvPRbw9YNSa9BHGX9FrNyDby/XoggIiNhXPl28=;
        b=SdApUZ2IPk+Z6mxD9bFN0GFN1iJ7suUDIehCiJCdXHL8ldfd46S6J1UZsAE7iR7ZJU
         izpY2GNrrEI44t9EM/b20YnXDICrn/D8moO/8NEpzGwCAY1agUTJl+UdfJ5+8QpelNv+
         9K/j1tdea6Hu4niHWHT+P8KJGXmymypUFKnvQArKlpy2ea/+WMjZj3Ctz0BTjm2jg1va
         4gY93UCcuTq5K+M+NtQze22SfMEpp5TbyWWC0mQWc2knBTZqQ+3Ee2rqVJ4UXLO7/jNO
         04A2GOWTyfq0DDKKxvkII7dNF0kzyLukffby9J16G3VyQBOmXNpHq+pUsgDuRm2dqE6G
         Gv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289823; x=1689881823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6ZvEIvPRbw9YNSa9BHGX9FrNyDby/XoggIiNhXPl28=;
        b=RRkAKCA9idaxWVmD5sUkjCeaRGud8A+7os3TaG6HrgT/Zu0hTfZBSwZiPVdBJIv9Vl
         teYJorvihYaTNlhYTCOlKB10WMYUR+bIU1458mlgO79XorXqc9QF2lczwtSjxCUnQH63
         XR/53OAF7KxX0nWLZ9ZfDXCDhLd1ku+LicmaAuuew4cXwUY6zbvRxb5xE5f0CntsRE4T
         dBmGQsaO1+EjLcftr/XNsuj14Q7Sj1oKp7oIS1NElPaPfCO8fFyIulF4QbK47NoOEZ+4
         a0cB12WX877V1CFcycgE/44H/Im8syLeecaPgbjUN/2vvhDPQQeJAzRQHIcE1fiHmpAi
         1g/Q==
X-Gm-Message-State: AC+VfDwBUBjjSDB9vT3zSLKNJp2S0ayeMhe3hBER21Ud5UMxmw82TR4J
	JJYN3S/i+5zzEmFtX96044Ypbw==
X-Google-Smtp-Source: ACHHUZ4CTI6udmmYo/7mpA0VeK/ywfX4bUnFBYVGoDxs8EypawA8sKHygWNb2fbGKEDNZGXmOY1Gqw==
X-Received: by 2002:a17:902:f7d2:b0:1b5:450a:4b5e with SMTP id h18-20020a170902f7d200b001b5450a4b5emr3161005plw.17.1687289823442;
        Tue, 20 Jun 2023 12:37:03 -0700 (PDT)
Received: from [172.31.0.109] ([136.36.130.248])
        by smtp.gmail.com with ESMTPSA id i14-20020a170902c94e00b001ae2b94701fsm1996816pla.21.2023.06.20.12.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 12:37:03 -0700 (PDT)
Message-ID: <75cf8335-af1f-e06c-c770-b2b540e812ed@ventanamicro.com>
Date: Tue, 20 Jun 2023 13:37:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/4] RISC-V: add Zbc extension detection
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
Cc: heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, herbert@gondor.apana.org.au, davem@davemloft.net,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu, heiko.stuebner@vrull.eu
References: <mhng-919a6ed5-c8b0-4311-9a8f-8c204b81a8e0@palmer-ri-x1c9a>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <mhng-919a6ed5-c8b0-4311-9a8f-8c204b81a8e0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_123705_577225_D09C5A8A 
X-CRM114-Status: GOOD (  12.75  )
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

CgpPbiA2LzIwLzIzIDEzOjA5LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBNb24sIDEyIEp1
biAyMDIzIDE0OjMxOjE0IFBEVCAoLTA3MDApLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IEhleSBI
ZWlrbywKPj4KPj4gT24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTE6MDQ6MzlQTSArMDIwMCwgSGVp
a28gU3R1ZWJuZXIgd3JvdGU6Cj4+PiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJu
ZXJAdnJ1bGwuZXU+Cj4+Pgo+Pj4gQWRkIGhhbmRsaW5nIGZvciBaYmMgZXh0ZW5zaW9uLgo+Pj4K
Pj4+IFpiYyBwcm92aWRlcyBpbnN0cnVjdGlvbiBmb3IgY2FycnktbGVzcyBtdWx0aXBsaWNhdGlv
bi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJA
dnJ1bGwuZXU+Cj4+PiAtLS0KPj4+IMKgYXJjaC9yaXNjdi9LY29uZmlnwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmggfMKgIDEgKwo+Pj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuY8Kg
wqDCoMKgwqDCoMKgIHzCoCAxICsKPj4+IMKgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
IHzCoCAxICsKPj4+IMKgNCBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4+Cj4+IFBs
dW1iaW5nIGludG8gdGhlIGh3cHJvYmUgc3R1ZmYgd291bGQgYmUgbmljZSwgYnV0IHRoYXQncyBu
b3QgYQo+PiByZXF1aXJlbWVudCBmb3IgZ2V0dGluZyBzdHVmZiBtZXJnZWQgOikKPiAKPiBJSVJD
IHdlIHRhbGtlZCBhYm91dCB0aGlzIG9uIElSQywgYnV0IElNTyB3ZSBzaG91bGRuJ3QgcmVxdWly
ZSBzb21ldGhpbmcgCj4gYmUgdXNlciB2aXNpYmxlIGZvciBpdCB0byBiZSBtZXJnZWQgaW4gdGhl
IGtlcm5lbC4KTm90ZSB0aGF0IGV4cG9zaW5nIFpiYyBpcyBwb3RlbnRpYWxseSB1c2VmdWwuICBX
ZSd2ZSBnb3QgR0NDIGFuZCBMTFZNIApjb2RlIHRoYXQgY2FuIGRldGVjdCBhbmQgcmV3cml0ZSBh
IGJpdHdpc2UgQ1JDIGludG8gY2xtdWwuCgpKZWZmCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
