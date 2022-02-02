Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453ADC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KU46ACoxBXtX5rNeydwj41jV3v6toRKKdewh1PhTiNo=; b=RN84mFtBiP7Pfo
	YpmU398JgClejE0U/ZWAQEQIm/CJajx198XOnJSjkf86LFI+Fz+CwI25OC5wPVTQroNNNlEdjXYaW
	qP7VBbenLg3sFN46d/do4nGgF7+yuPvkDpHwAg/YWqcLmzU0A+WK/RAQLfSCMAQeHHyqEDux5nbp8
	/Re5LtS3ONfBdC0BroIRNJ0alJMjz0g2Q5jL7wgCnPmXhcbrI2UWn8ExsDS2mIwLJ3e58blurb74b
	Gto1ZzkCLqT4+Jtsb8jYTQDeXm1dJoQipql7M9HoFPSiaR/5zaOSh+p0EPxcPVg3ZmdnZ2JFemPNj
	9G9a2ynxqOw7btF0DXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGXX-00FeeN-IK; Wed, 02 Feb 2022 14:23:19 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGDB-00FVg0-OT
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 14:02:19 +0000
Received: by mail-ua1-f42.google.com with SMTP id e17so19259127uad.9
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 06:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W397sX4ZIPE6GurWc9LBauNlzgQqsNKvK7n7V8hBvHg=;
 b=Q8WOK1LjT00mk9DK7UBc9thYUXOeH1QVTGh+W1F3lIs/c2thXpmSjgTQk2QoalWzaW
 meXaUsYs5mVDfLwAKCC5vfpWAs5RCjwydBc8Q9FMe04ppkgDdhrZ28HZ48Bl15psifHJ
 yQefcbpVv49Q6vsRkwjPPPIoX6nQJgktVgWoStTrBuCCqI7eRSfWnnvwlaxbuRlzcgnH
 +paQhN3YrlJIWqQwlYIG5q4T64EDL1dFp9OwddGbgeaj+Cy1z+yHfYOlUM+OxxQoW1Ay
 9hBpkBv6FcM+9iO+pH/nyH/xCDQUuSlxLH5DNCljH8Xdd/RjNRIh8mYH0OJLtyQ7Zczg
 s9zw==
X-Gm-Message-State: AOAM532/25+FGUwi2jWKliFH6EXMMmUq7JLCAMlHjrsVZbDNg2GiUm+9
 9WECbk6u8473q21kfh1jo423onuvjprv9A==
X-Google-Smtp-Source: ABdhPJz9VLSZU26pttDVwB90e0cd+FAf6nlkBOYmjNWwKErzVhv65xHZnCWrY4LqZup12wGx7q6GxA==
X-Received: by 2002:a05:6102:c8d:: with SMTP id
 f13mr12098050vst.33.1643810535746; 
 Wed, 02 Feb 2022 06:02:15 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id g22sm5711555vkm.3.2022.02.02.06.02.14
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:02:15 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id b16so19299529uaq.4
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 06:02:14 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr12258207vsj.5.1643810534765; 
 Wed, 02 Feb 2022 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
 <20220202123542.3721512-1-conor.dooley@microchip.com>
 <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
 <3862e358-901c-e848-71af-01eceed26f74@microchip.com>
In-Reply-To: <3862e358-901c-e848-71af-01eceed26f74@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 15:02:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvw9cNNzBhp-sSMTXxP2eALhB=fD78Wgx-kks7wr6oiQ@mail.gmail.com>
Message-ID: <CAMuHMdXvw9cNNzBhp-sSMTXxP2eALhB=fD78Wgx-kks7wr6oiQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
 Bin Meng <bin.meng@windriver.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daire.McNamara@microchip.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Ivan.Griffin@microchip.com, Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Lewis Hanly <Lewis.Hanly@microchip.com>,
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
X-CRM114-CacheID: sfid-20220202_060217_836169_46092C38 
X-CRM114-Status: GOOD (  39.72  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIEZlYiAyLCAyMDIyIGF0IDI6NDYgUE0gPENvbm9yLkRvb2xleUBt
aWNyb2NoaXAuY29tPiB3cm90ZToKPiBPbiAwMi8wMi8yMDIyIDEzOjI4LCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAyLCAyMDIyIGF0IDE6MzMgUE0gPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+Pj4gT24gMDEvMDIvMjAyMiAwNzo1OCwgVXdl
IEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUKPiA+Pj4+IE9uIE1vbiwgSmFuIDMxLCAyMDIyIGF0IDExOjQ3OjIxQU0gKzAwMDAsIGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4+Pj4gRnJvbTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+Pj4+Cj4gPj4+PiBBZGQgZGV2aWNlIHRy
ZWUgYmluZGluZ3MgZm9yIHRoZSBNaWNyb2NoaXAgZnBnYSBmYWJyaWMgYmFzZWQgImNvcmUiIFBX
TQo+ID4+Pj4gY29udHJvbGxlci4KPiA+Pj4+Cj4gPj4+PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiAuLi4v
YmluZGluZ3MvcHdtL21pY3JvY2hpcCxjb3JlcHdtLnlhbWwgICAgICAgfCA3NSArKysrKysrKysr
KysrKysrKysrCj4gPgo+ID4+Pj4gKyAgbWljcm9jaGlwLHN5bmMtdXBkYXRlOgo+ID4+Pj4gKyAg
ICBkZXNjcmlwdGlvbjogfAo+ID4+Pj4gKyAgICAgIEluIHN5bmNocm9ub3VzIG1vZGUsIGFsbCBj
aGFubmVscyBhcmUgdXBkYXRlZCBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBQV00gcGVyaW9kLgo+
ID4+Pj4gKyAgICAgIEFzeW5jaHJvbm91cyBtb2RlIGlzIHJlbGV2YW50IHRvIGFwcGxpY2F0aW9u
cyBzdWNoIGFzIExFRCBjb250cm9sLCB3aGVyZQo+ID4+Pj4gKyAgICAgIHN5bmNocm9ub3VzIHVw
ZGF0ZXMgYXJlIG5vdCByZXF1aXJlZC4gQXN5bmNocm9ub3VzIG1vZGUgbG93ZXJzIHRoZSBhcmVh
IHNpemUsCj4gPj4+PiArICAgICAgcmVkdWNpbmcgc2hhZG93IHJlZ2lzdGVyIHJlcXVpcmVtZW50
cy4gVGhpcyBjYW4gYmUgc2V0IGF0IHJ1biB0aW1lLCBwcm92aWRlZAo+ID4+Pj4gKyAgICAgIFNI
QURPV19SRUdfRU4gaXMgYXNzZXJ0ZWQuIFNIQURPV19SRUdfRU4gaXMgc2V0IGJ5IHRoZSBGUEdB
IGJpdHN0cmVhbSBwcm9ncmFtbWVkCj4gPj4+PiArICAgICAgdG8gdGhlIGRldmljZS4KPiA+Pj4+
ICsgICAgICBFYWNoIGJpdCBjb3JyZXNwb25kcyB0byBhIFBXTSBjaGFubmVsICYgcmVwcmVzZW50
cyB3aGV0aGVyIHN5bmNocm9ub3VzIG1vZGUgaXMKPiA+Pj4+ICsgICAgICBwb3NzaWJsZSBmb3Ig
dGhlIFBXTSBjaGFubmVsLgo+ID4+Pj4gKwo+ID4+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy91aW50MTYKPiA+Pj4+ICsgICAgZGVmYXVsdDogMAo+ID4+Pgo+
ID4+PiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LiBUaGlzIGlzIGEg
c29mdC1jb3JlIGFuZCB5b3UKPiA+Pj4gY2FuIHN5bnRoZXNpemUgaXQgZWl0aGVyIHdpdGggb3Ig
d2l0aG91dCB0aGUgYWJpbGl0eSB0byBkbyBzeW5jaHJvbm91cwo+ID4+PiB1cGRhdGVzIG9yIG5v
dCwgcmlnaHQ/IEFsbCAxNiBjaGFubmVscyBzaGFyZSB0aGUgc2FtZSBwZXJpb2QgbGVuZ3RoIGFu
ZAo+ID4+PiBpbiB0aGUgc2ltcGxlIGltcGxlbWVudGF0aW9uIGNoYW5naW5nIHRoZSBkdXR5IGN5
Y2xlIGlzIGRvbmUgYXQgb25jZQo+ID4+PiAobWF5YmUgaW50cm9kdWNpbmcgYSBnbGl0Y2gpIGFu
ZCBpbiB0aGUgbW9yZSBleHBlbnNpdmUgaW1wbGVtZW50YXRpb24KPiA+Pj4gdGhlcmUgaXMgYSBy
ZWdpc3RlciB0byBpbXBsZW1lbnQgYm90aCB2YXJpYW50cz8KPiA+Pgo+ID4+IENvcnJlY3QuIElm
IHRoZSBJUCBpcyBpbnN0YW50aWF0ZWQgd2l0aCBTSEFET1dfUkVHX0VOeD0xLCBib3RoCj4gPj4g
cmVnaXN0ZXJzIHRoYXQgY29udHJvbCB0aGUgZHV0eSBjeWNsZSBmb3IgY2hhbm5lbCB4IGhhdmUg
YSBzZWNvbmQKPiA+PiAic2hhZG93IHJlZyIgc3ludGhlc2lzZWQuIEF0IHJ1bnRpbWUgYSBiaXQg
d2lkZSByZWdpc3RlciBleHBvc2VkIHRvCj4gPj4gQVBCIGNhbiBiZSB1c2VkIHRvIHRvZ2dsZSBv
bi9vZmYgc3luY2hyb25pc2VkIG1vZGUgZm9yIGFsbCBjaGFubmVscwo+ID4+IGl0IGhhcyBiZWVu
IHN5bnRoZXNpc2VkIGZvci4KPiA+Pgo+ID4+IEkgd2lsbCByZXdvcmQgdGhpcyBkZXNjcmlwdGlv
biBzaW5jZSBpdCBpcyBub3QgY2xlYXIuCj4gPgo+ID4gU2hvdWxkbid0IGl0IHVzZSBhIGRpZmZl
cmVudCBjb21wYXRpYmxlIHZhbHVlIGluc3RlYWQ/Cj4gPiBEaWZmZXJlbnRpYXRpb24gYnkgcHJv
cGVydGllcyBpcyBub3QgcmVjb21tZW5kZWQsIGFzIGl0J3MgZWFzeSB0bwo+ID4gbWlzcyBhIGRp
ZmZlcmVuY2UuCj4KPiBFaXRoZXIgeW91IGhhdmUgc29tZXRoaW5nIGluIG1pbmQgdGhhdCBJJ3Zl
IG5vdCB0aG91Z2h0IG9mLCBvciBJJ3ZlIGRvbmUKPiBhIGJhZCBqb2Igb2YgZXhwbGFpbmluZyBh
Z2Fpbi4gVGhlIGJ1ZmZlci8ic2hhZG93IiByZWdpc3RlcnMgYXJlCj4gc3ludGhlc2lzZWQgb24g
YSBwZXIgY2hhbm5lbCBiYXNpcywgc28gYW55IGNvbWJpbmF0aW9uIG9mIHRoZSAxNgo+IGNoYW5u
ZWxzIG1heSBoYXZlIHRoaXMgY2FwYWJpbGl0eS4gVGhlIHNhbWUgYXBwbGllcyB0byB0aGUgREFD
IG1vZGUsIHBlcgo+IGNoYW5uZWwgdGhlcmUgdG9vLgoKT29wcywgaGFkbid0IG5vdGljZWQgdGhp
cyBpcyBwZXIgY2hhbm5lbC4gSW5kZWVkLCB0aGVuIGEgZGlmZmVyZW50CmNvbXBhdGlibGUgdmFs
dWUgaXMgZnV0aWxlLgpTbyBzaW5jZSAibWljcm9jaGlwLHN5bmMtdXBkYXRlIiBpcyBhIGJpdG1h
c2ssIHBlcmhhcHMgaXQgc2hvdWxkIGJlCmNhbGxlZCAibWljcm9jaGlwLHN5bmMtdXBkYXRlLW1h
c2siPwpTYW1lIGZvciAibWljcm9jaGlwLGRhYy1tb2RlIiAtPiAibWljcm9jaGlwLGRhYy1tb2Rl
LW1hc2siPwoKQWxzbywgdXNpbmcgZGlmZmVyZW50IGludGVnZXIgc2l6ZXMgdGhhbiB1aW50MzIg
aXMgZnJvd25lZCB1cG9uLCB1bmxlc3MKdGhlcmUgaXMgYSB2ZXJ5IGdvb2QgcmVhc29uIHRvIGRv
IHNvLiBJIGNhbiBpbWFnaW5lIGEgZnV0dXJlIHZlcnNpb24Kd291bGQgc3VwcG9ydCBtb3JlIGNo
YW5uZWxzLCBhbmQgdGhlbiB1aW50MTYgYmVjb21lcyBhIGxpbWl0YXRpb24uCgpGb3IgYm90aDog
Um9iPwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoK
LS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
