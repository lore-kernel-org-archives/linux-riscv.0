Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E8FC48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFfn7+B7+7Aap2wJKzhPrf5xXle8ynyx8LiyNUrccdM=; b=KEvs14ZfN7d7tq
	Zc9y+m40XbzNLuO2sO7NZOfp2UHZ/X3Bw54Lgm4BOJ2e49LRoskn3/x/zyvS1AvuTMimKCiPk21/z
	3Oim+/fvyRA2VkgNcy7aTjddEEPidmHRUdCRq4joQJler+h2egG+Wkos1wr0m7Z7xG2Dfehqxba3Z
	YFjZ4uDD+R1eU9awDyTBWwhgTNJKbMQmIpzeMdYW8IUI1XxdsH9ZjCTR0rCAI/Pv3YHw0A7dy1GvX
	JmNPQkEv9tfqad3MhrJ46DwPsVto8AWW7wa0GMccROmYt7qTNe+f/JEyyi60eyqhGYKgbOP0nZOH6
	FpXxkoDd7FSNti+7eNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyrg-00000009XWd-0B9V;
	Mon, 19 Feb 2024 08:19:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyre-00000009XW0-0PvN
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 08:19:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3394bec856fso2830788f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 00:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708330738; x=1708935538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZqE/HHr//PEEUJQYqFVl7Gpsy9IQIC8XGSYX55a1oU=;
        b=Ofc59bwBERwsuayVXK7jUROw4kq0mdnLKavQqiDmO3FjxnrY/5LPP6zc1IbAbmGa/R
         PL04PkS2/HCscgzrEthUa6u8BE6S8T+3HOjzu0wjUc7uqVSERO68T3amFd+RVkIZZrFF
         AlHGzdzQYBZBO2h8o+agf24xRJAMCF8Wxpq6z46ZAlWEdyxra2fw1knukImxKE0k0bj3
         6XQ7VY+QaqHeSgXMD9wsjqfs36NSFej8OCFGXVy7kaXP6is7OakoBCUbqP7B0FN6ghiq
         Vl1Iz6plLnB08Z15vSYyuaSic4AUHlfbqOjnoEAcTTfSiiWI4/3tCbZH2S1kpWz4WerY
         VsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708330738; x=1708935538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZqE/HHr//PEEUJQYqFVl7Gpsy9IQIC8XGSYX55a1oU=;
        b=dC14PMwN3Zi/jYhee/3KlpVZHLXrW22mVGjTsX5sZugC5Hdfts/Ry4vt7f8SNr9R8g
         WXGERF8j6eP5DhzLHqpApbGZX9jVHOXPtwz9+7X2Bwe95keVuO4SH85R8MJlNr3JChv2
         fNWFbBjL8akmQczvFS3KxelDg39gxfze3umHvvb6eLkv8iZ1xhZtEXHFYf+KXzNtBquG
         FDxojK2BvPnN+6XxzvG9V+GCm2QhkPZOyrfLiIT5+jAXwkf+o6ueYiy010my3YlEdApI
         dyVVR/EMjnLklX0t9S5Z2ip+jUnqdA8t0MLwdU1aF32Nmmw8HjTuxWb5iKcUj8G23aZr
         zMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDq+oe03UaG3RSpNI/jTyB2gXpP8fqCxeqEWeAv/KiVxHU0+CCk1te1tSEAwt2Iyfu099oOCmoUZMI+FbYVwrAf7taV73JU1Q69K/aIUAM
X-Gm-Message-State: AOJu0YyjiMwqj+ZeNj/Dp+6hpB+SGGC8d1vamgdTiH121eBNPPPP5yoc
	OHuUwxJ4qokc374JEqLYYarKVt3eXET8FKkaajF6GDFK5BtMoQgTF8+V3W4RCtA=
X-Google-Smtp-Source: AGHT+IEo2sjL3M94rmyLAg41ywsMdua1Wz3r3LifoISXigwzGxyowq3JmstlxxYRObaeFTZ+HdMQAQ==
X-Received: by 2002:adf:e448:0:b0:33c:e728:c88b with SMTP id t8-20020adfe448000000b0033ce728c88bmr9479783wrm.24.1708330738074;
        Mon, 19 Feb 2024 00:18:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c20d500b0041044e130bfsm10433793wmm.33.2024.02.19.00.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:18:57 -0800 (PST)
Message-ID: <b4bc7dc8-3631-4cb5-97b9-d38941c6efb2@tuxon.dev>
Date: Mon, 19 Feb 2024 10:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] dt-bindings: clock: renesas,rzg2l-cpg: Update
 #power-domain-cells = <1>
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW2AsXJk_crdeiMjMHzBKq91UO1d=ukwjW0hkCK4DRvTw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW2AsXJk_crdeiMjMHzBKq91UO1d=ukwjW0hkCK4DRvTw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_001902_173544_9DD64789 
X-CRM114-Status: GOOD (  22.12  )
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

CgpPbiAxNi4wMi4yMDI0IDE2OjA0LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgQ2xh
dWRpdSwKPiAKPiBPbiBUaHUsIEZlYiA4LCAyMDI0IGF0IDE6NDPigK9QTSBDbGF1ZGl1IDxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cj4+Cj4+IFRoZSBkcml2ZXIgd2lsbCBiZSBt
b2RpZmllZCAoaW4gdGhlIG5leHQgY29tbWl0cykgdG8gYmUgYWJsZSB0byBzcGVjaWZ5Cj4+IGlu
ZGl2aWR1YWwgcG93ZXIgZG9tYWluIElEIGZvciBlYWNoIElQLiBVcGRhdGUgdGhlIGRvY3VtZW50
YXRpb24gdG8gY29wZQo+PiB3aXRoIHRoaXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KPiAKPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghCj4gCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jbG9jay9yZW5lc2FzLHJ6ZzJsLWNwZy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHJ6ZzJsLWNwZy55YW1sCj4+IEBAIC01Nyw3
ICs1Nyw3IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICBjYW4gYmUgcG93ZXItbWFuYWdlZCB0aHJv
dWdoIE1vZHVsZSBTdGFuZGJ5IHNob3VsZCByZWZlciB0byB0aGUgQ1BHIGRldmljZQo+PiAgICAg
ICAgbm9kZSBpbiB0aGVpciAicG93ZXItZG9tYWlucyIgcHJvcGVydHksIGFzIGRvY3VtZW50ZWQg
YnkgdGhlIGdlbmVyaWMgUE0KPj4gICAgICAgIERvbWFpbiBiaW5kaW5ncyBpbiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwuCj4+IC0gICAg
Y29uc3Q6IDAKPj4gKyAgICBjb25zdDogMQo+IAo+IFdoaWxlIHRoZSBkcml2ZXIgd2lsbCBzb29u
IHN1cHBvcnQgYm90aCAwIGFuZCAxLCB3ZSBtYXkgbmVlZCB0byBrZWVwIDAKPiBmb3IgUlovVjJN
IGZvciBub3c/ICBSWi9WMk0gZG9lcyBub3QgaGF2ZSBDUEdfQlVTXypfTVNUT1AgcmVnaXN0ZXJz
LAo+IGJ1dCB1c2VzIHRoZSBJbnRlcm5hbCBQb3dlciBEb21haW4gQ29udHJvbGxlciAoUE1DKS4K
Cm9rCgo+IAo+IFBsZWFzZSBhZGQgYSBsaW5rIHRvIHRoZSBwb3dlciBkb21haW4gbnVtYmVycyBp
bgo+IDxkdC1iaW5kaW5ncy9jbG9jay9yOWEwKi1jcGcuaD4sCj4gbGlrZSBpcyBkb25lIGZvciAj
Y2xvY2stY2VsbHMuCgpvawoKPiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydAo+IAo+IAo+IC0tCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+
IAo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
