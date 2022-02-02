Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD4DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8GCuof7SnIPpV/gH0+xGTdy7NRSvHFUfVyS6BcPMVY=; b=3vh7c+p2chNJzU
	rHrvRMPOcxSZZkMtAu644RU29NGjQafPl5/l+IYNr5i9hkMD+3NTTQNcnvtqN+h2Pz+IaqCjBJc79
	yR+HqVcELbMvEq8gCAi0l64dBKG48qZvn1Kvc2DD8/1OShfjGUvYE4V/6P417PxpC81U7LdLByOod
	vPI4HkXG75jX56HedMMfLBs3syr3MUclJrlBeejM6NYSSwHmvhsC/icyUwQvcieSYLsN9CoXd6hbz
	hseAAh3jMTTXKgkrEGIw4fm1hYWYaO9bTT+K9DMmBj9qh21Piqlo7xhUAAxW4FljkOftmGzu91uTZ
	R80vB7jA0ex0gVQt4CLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFFh9-00FMCb-9f; Wed, 02 Feb 2022 13:29:11 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFFh2-00FM9G-VH
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 13:29:06 +0000
Received: by mail-ua1-f48.google.com with SMTP id p7so19091723uao.6
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 05:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=trhdKZIi8I2pglvejnlK+EON8M6pVXEzurOEfFekmwA=;
 b=tBFmRMOxEgR7lpU+3gNmkrCr4bKpeMjZHKbTLuoJeC00czNR/Ci3rSk/G8ui+r1LEA
 EVm76Ss9MWtzsynOiwNpAj2kI7CZCx+7NFq4s5uhcQ5t+csavhjHpUQh6dgCpReXB52e
 FCmDAgHS+VC9X46rpmsxlEzbfsZZ16jZCi08Kxowdas5IZP0CcVyWUBi0qAYhEViJ/FC
 3A6JTO8Okqg1bdo2IgfB4Z5OB5O41LE+XPsypfEU9fP7YPKvZwQgVTmywri/TbBk7CgR
 DMEeOoc5W1V+9qZDMkdJgCjZWrYbb+0+FNDPDOxo7HGrIUrwQgLFIgi0vmP2cFmGnMt3
 eIwg==
X-Gm-Message-State: AOAM5317tn22/IO8LMwW4PAnF2UcFtp5JB+lFhoY4DbyNq4T/gpQvEOB
 ZdfEp1IEDDOQsweqZ8AI3iWx40h7ZcHQgQ==
X-Google-Smtp-Source: ABdhPJxk+owNTLUG8DFtpkyBoStLLUKOWq1d1bW6mBaIzwa8jloO6OQp4Uet5Vr5Hqi72+Ck6kglqA==
X-Received: by 2002:ab0:6e90:: with SMTP id b16mr11280759uav.16.1643808541124; 
 Wed, 02 Feb 2022 05:29:01 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id p2sm5935286uao.1.2022.02.02.05.28.59
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 05:29:00 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id c36so19022450uae.13
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 05:28:59 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr11229610vsb.68.1643808539621; 
 Wed, 02 Feb 2022 05:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
 <20220202123542.3721512-1-conor.dooley@microchip.com>
In-Reply-To: <20220202123542.3721512-1-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 14:28:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
Message-ID: <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
To: Conor Dooley <conor.dooley@microchip.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
 Bin Meng <bin.meng@windriver.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 daire.mcnamara@microchip.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 ivan.griffin@microchip.com, Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Lewis Hanly <lewis.hanly@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_052905_039303_F990A2B4 
X-CRM114-Status: GOOD (  34.88  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIEZlYiAyLCAyMDIyIGF0IDE6MzMgUE0gPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPiB3cm90ZToKPiA+T24gMDEvMDIvMjAyMiAwNzo1OCwgVXdlIEtsZWluZS1L
w7ZuaWcgd3JvdGU6Cj4gPj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPj4g
T24gTW9uLCBKYW4gMzEsIDIwMjIgYXQgMTE6NDc6MjFBTSArMDAwMCwgY29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4KPiA+Pgo+ID4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhl
IE1pY3JvY2hpcCBmcGdhIGZhYnJpYyBiYXNlZCAiY29yZSIgUFdNCj4gPj4gY29udHJvbGxlci4K
PiA+Pgo+ID4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4+
Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KPiA+PiAtLS0KPiA+PiAuLi4vYmluZGluZ3MvcHdtL21pY3JvY2hpcCxjb3JlcHdtLnlh
bWwgICAgICAgfCA3NSArKysrKysrKysrKysrKysrKysrCgo+ID4+ICsgIG1pY3JvY2hpcCxzeW5j
LXVwZGF0ZToKPiA+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gPj4gKyAgICAgIEluIHN5bmNocm9u
b3VzIG1vZGUsIGFsbCBjaGFubmVscyBhcmUgdXBkYXRlZCBhdCB0aGUgYmVnaW5uaW5nIG9mIHRo
ZSBQV00gcGVyaW9kLgo+ID4+ICsgICAgICBBc3luY2hyb25vdXMgbW9kZSBpcyByZWxldmFudCB0
byBhcHBsaWNhdGlvbnMgc3VjaCBhcyBMRUQgY29udHJvbCwgd2hlcmUKPiA+PiArICAgICAgc3lu
Y2hyb25vdXMgdXBkYXRlcyBhcmUgbm90IHJlcXVpcmVkLiBBc3luY2hyb25vdXMgbW9kZSBsb3dl
cnMgdGhlIGFyZWEgc2l6ZSwKPiA+PiArICAgICAgcmVkdWNpbmcgc2hhZG93IHJlZ2lzdGVyIHJl
cXVpcmVtZW50cy4gVGhpcyBjYW4gYmUgc2V0IGF0IHJ1biB0aW1lLCBwcm92aWRlZAo+ID4+ICsg
ICAgICBTSEFET1dfUkVHX0VOIGlzIGFzc2VydGVkLiBTSEFET1dfUkVHX0VOIGlzIHNldCBieSB0
aGUgRlBHQSBiaXRzdHJlYW0gcHJvZ3JhbW1lZAo+ID4+ICsgICAgICB0byB0aGUgZGV2aWNlLgo+
ID4+ICsgICAgICBFYWNoIGJpdCBjb3JyZXNwb25kcyB0byBhIFBXTSBjaGFubmVsICYgcmVwcmVz
ZW50cyB3aGV0aGVyIHN5bmNocm9ub3VzIG1vZGUgaXMKPiA+PiArICAgICAgcG9zc2libGUgZm9y
IHRoZSBQV00gY2hhbm5lbC4KPiA+PiArCj4gPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MTYKPiA+PiArICAgIGRlZmF1bHQ6IDAKPiA+Cj4gPkknbSBu
b3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0bHkuIFRoaXMgaXMgYSBzb2Z0LWNvcmUg
YW5kIHlvdQo+ID5jYW4gc3ludGhlc2l6ZSBpdCBlaXRoZXIgd2l0aCBvciB3aXRob3V0IHRoZSBh
YmlsaXR5IHRvIGRvIHN5bmNocm9ub3VzCj4gPnVwZGF0ZXMgb3Igbm90LCByaWdodD8gQWxsIDE2
IGNoYW5uZWxzIHNoYXJlIHRoZSBzYW1lIHBlcmlvZCBsZW5ndGggYW5kCj4gPmluIHRoZSBzaW1w
bGUgaW1wbGVtZW50YXRpb24gY2hhbmdpbmcgdGhlIGR1dHkgY3ljbGUgaXMgZG9uZSBhdCBvbmNl
Cj4gPihtYXliZSBpbnRyb2R1Y2luZyBhIGdsaXRjaCkgYW5kIGluIHRoZSBtb3JlIGV4cGVuc2l2
ZSBpbXBsZW1lbnRhdGlvbgo+ID50aGVyZSBpcyBhIHJlZ2lzdGVyIHRvIGltcGxlbWVudCBib3Ro
IHZhcmlhbnRzPwo+Cj4gQ29ycmVjdC4gSWYgdGhlIElQIGlzIGluc3RhbnRpYXRlZCB3aXRoIFNI
QURPV19SRUdfRU54PTEsIGJvdGgKPiByZWdpc3RlcnMgdGhhdCBjb250cm9sIHRoZSBkdXR5IGN5
Y2xlIGZvciBjaGFubmVsIHggaGF2ZSBhIHNlY29uZAo+ICJzaGFkb3cgcmVnIiBzeW50aGVzaXNl
ZC4gQXQgcnVudGltZSBhIGJpdCB3aWRlIHJlZ2lzdGVyIGV4cG9zZWQgdG8KPiBBUEIgY2FuIGJl
IHVzZWQgdG8gdG9nZ2xlIG9uL29mZiBzeW5jaHJvbmlzZWQgbW9kZSBmb3IgYWxsIGNoYW5uZWxz
Cj4gaXQgaGFzIGJlZW4gc3ludGhlc2lzZWQgZm9yLgo+Cj4gSSB3aWxsIHJld29yZCB0aGlzIGRl
c2NyaXB0aW9uIHNpbmNlIGl0IGlzIG5vdCBjbGVhci4KClNob3VsZG4ndCBpdCB1c2UgYSBkaWZm
ZXJlbnQgY29tcGF0aWJsZSB2YWx1ZSBpbnN0ZWFkPwpEaWZmZXJlbnRpYXRpb24gYnkgcHJvcGVy
dGllcyBpcyBub3QgcmVjb21tZW5kZWQsIGFzIGl0J3MgZWFzeSB0bwptaXNzIGEgZGlmZmVyZW5j
ZS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
