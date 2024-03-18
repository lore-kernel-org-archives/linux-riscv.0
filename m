Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBB4C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8S9Z1+xSrIXH82jnoJhOpm2KzVfCCOUjwu74bszZ00=; b=tww8SM1+9NsHuP
	Unz/gmP3Hk4c7IO8ZUABFCnTDSEKgM2/832GsEkouOxakf9bTheGTaF0oFPxSk9qhB03oE8+eYLS+
	76XYt22MAmNDJtjfIZH8yr0/NyamF9m/UDDicvnyIBacljaLWZk3aUAovq4DQC0LAZCGU4OM28DM/
	t7GKhzIl8aCsven4oHFK+BVapUTDqBda41ovrjiVRDOdYRhymVno1FwkWNpoeHEeJlsGrl+9lESfU
	mE8XGG63ecLKfQfqVZjbJwVNcmyKIOTMws8bm29VnP9p803XiJ+ONS6I8JZyfDoe48s3N6GJS/iey
	a1XXWpBluXWlv9YHsxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8fY-00000007nqO-1D8q;
	Mon, 18 Mar 2024 08:48:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8fU-00000007nmR-1m23
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 08:48:30 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-513e6778112so859446e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710751705; x=1711356505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpf6P/mv1nh+G+2opKvaPHFGchVDvvH/+dJJvdzBkJE=;
        b=INRG9DEQUB2OtMnGjHVqYkfrDXevyQpusroJnJRfijxHG7ozzRCQYPC/Y25zQ1KWYi
         hJ0mxfQHxJpgIdBElvN29gdLUDO7AQ16cwsUgomxB3B91DbrG5unjbbrXq1J0D1oI0Y7
         7kmP7Xx5e4/KV7zPsp/313y4zCFm+3x5G031meXPvMEEAbQLQ0hlhB2ZUQ31eYfDTmQ7
         beTAMhOQOTPN6v66epl8pbRHDCR0wBnS6woGNzcKeypf85VmDm/erGgtyiamtYBzhii5
         L4MUowYNzRCfE94scAbMspHLbrij5j+Nrel788MIYF1urPupoh+m1aCgSzWEBxPogIIq
         EA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751705; x=1711356505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpf6P/mv1nh+G+2opKvaPHFGchVDvvH/+dJJvdzBkJE=;
        b=t/rpHdmgm5N54W+8MqRaBWjSr3EgYsS4acFqwzNHLQCxkr1106AcOWLhI/eaKo9xX5
         XeJnbyrMqU5lhYsD1u2y/P85m+vQcLlk2ggo0iiXBPBEH/iY0pFASkWoZlewaFnc/upi
         i1+gmOG1Ra+fxQPepiTgwstk/+aZ/x6TcPB9ybro0hp+E7IlVDs3tQXCVFrJfldGjegk
         CcDMyeu9iKg1CNc4FAabAMfwTqb5rAuLv9oq+Dw4lGpKJSH/u/z20JQEY1faObdmMdXR
         cM97RAjvF2F4PQgM71AA6XdEfZtBLW0+spOP3qBROO9lLuWDx6PnCziXk719GJ60McTu
         9mrw==
X-Gm-Message-State: AOJu0YybPnFTR+OaSLuW2HUZ5MhI4x7OcFnAbUtJfOssm8vOgjMiIYra
	jEobsXx+9ZGVgVAJOS+j5jHC/yBQvWERyawJSaGv3r5QQ91hE0/kk3UEZIZOTZ8+1DQqiViJwXx
	2Gy7Z9DCO9sUsvdgb46iAdBoV1mo=
X-Google-Smtp-Source: AGHT+IEEoUIOrSsbRaM8/GVH+vQ+AoLpoQTnF53ccg6k+RNlmOEAGacCjS10S9CMBS6f02FWdVOZf0kD8acLyTH3OD4=
X-Received: by 2002:a19:ca10:0:b0:513:e049:3e1a with SMTP id
 a16-20020a19ca10000000b00513e0493e1amr1779164lfg.17.1710751704969; Mon, 18
 Mar 2024 01:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240317222718.3e03edb1@namcao>
In-Reply-To: <20240317222718.3e03edb1@namcao>
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Mon, 18 Mar 2024 10:48:13 +0200
Message-ID: <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev, 
	linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com, 
	dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_014828_590605_B6EE8F94 
X-CRM114-Status: GOOD (  35.59  )
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

T24gU3VuLCBNYXIgMTcsIDIwMjQgYXQgMTE6MjfigK9QTSBOYW0gQ2FvIDxuYW1jYW9AbGludXRy
b25peC5kZT4gd3JvdGU6Cj4KPiBDYzogSElEIGZvbGtzCj4KPiBPbiAxNC9NYXIvMjAyNCBFdmEg
S3VyY2hhdG92YSB3cm90ZToKPiA+IElmIGFuIEkyQy1ISUQgY29udHJvbGxlciBsZXZlbC10cmln
Z2VyZWQgSVJRIGxpbmUgaXMgcm91dGVkIGRpcmVjdGx5IGFzCj4gPiBhIFBMSUMgSVJRLCBhbmQg
d2Ugc3BhbSBpbnB1dCBlYXJseSBlbm91Z2ggaW4ga2VybmVsIGJvb3QgcHJvY2Vzcwo+ID4gKFNv
bWV3aGVyZSBiZXR3ZWVuIGluaXRpYWxpemluZyBORVQsIEFMU0Egc3Vic3lzdGVtcyBhbmQgYmVm
b3JlCj4gPiBpMmMtaGlkIGRyaXZlciBpbml0KSwgdGhlbiB0aGVyZSBpcyBhIGNoYW5jZSBvZiBr
ZXJuZWwgbG9ja2luZyB1cAo+ID4gY29tcGxldGVseSBhbmQgbm90IGdvaW5nIGFueSBmdXJ0aGVy
Lgo+ID4KPiA+IFRoZXJlIGFyZSBubyBrZXJuZWwgbWVzc2FnZXMgcHJpbnRlZCB3aXRoIGFsbCB0
aGUgSVJRLCB0YXNrIGhhbmcKPiA+IGRlYnVnZ2luZyBlbmFibGVkIC0gb3RoZXIgdGhhbiAoc29t
ZXRpbWVzKSBpdCByZXBvcnRzIHNjaGVkIFJUCj4gPiB0aHJvdHRsaW5nIGFmdGVyIGEgZmV3IHNl
Y29uZHMuIEJhc2ljIHRpbWVyIGludGVycnVwdCBoYW5kbGluZyBpcwo+ID4gaW50YWN0IC0gZmJk
ZXYgdHR5IGN1cnNvciBpcyBzdGlsbCBibGlua2luZy4KPiA+Cj4gPiBJdCBhcHBlYXJzIHRoYXQg
aW4gc3VjaCBhIGNhc2UgdGhlIEkyQy1ISUQgSVJRIGxpbmUgaXMgcmFpc2VkOyBQTElDCj4gPiBu
b3RpZmllcyB0aGUgKHNpbmdsZSkgYm9vdCBzeXN0ZW0gaGFydCwga2VybmVsIGNsYWltcyB0aGUg
SVJRIGFuZAo+ID4gaW1tZWRpYXRlbHkgY29tcGxldGVzIGl0IGJ5IHdyaXRpbmcgdG8gQ0xBSU0v
Q09NUExFVEUgcmVnaXN0ZXIuCj4gPiBObyBhY2Nlc3MgdG8gdGhlIEkyQyBjb250cm9sbGVyIChP
cGVuQ29yZXMpIG9yIEkyQy1ISUQgcmVnaXN0ZXJzCj4gPiBpcyBtYWRlLCBzbyB0aGUgSElEIHJl
cG9ydCBpcyBuZXZlciBjb25zdW1lZCBhbmQgSVJRIGxpbmUgc3RheXMKPiA+IHJhaXNlZCBmb3Jl
dmVyLiBUaGUga2VybmVsIGVuZGxlc3NseSBjbGFpbXMgJiBjb21wbGV0ZXMgSVJRcwo+ID4gd2l0
aG91dCBkb2luZyBhbnkgd29yayB3aXRoIHRoZSBkZXZpY2UuIEl0IGRvZXNuJ3QgYWx3YXlzIGVu
ZCB1cCB0aGlzCj4gPiB3YXk7IHNvbWV0aW1lcyBib290IHByb2Nlc3MgY29tcGxldGVzIGFuZCB0
aGVyZSBhcmUgbm8gc2lnbnMgb2YKPiA+IGludGVycnVwdCBzdG9ybSBvciBzdHVjayBJUlEgcHJv
Y2Vzc2luZyBhZnRlcndhcmRzLgo+Cj4gSXQgc2VlbXMgSTJDIEhJRCdzIGludGVycnVwdCBoYW5k
bGVyIChpMmNfaGlkX2lycSkgcmV0dXJucyBpbW1lZGlhdGVseSBpZgo+IEkyQ19ISURfUkVBRF9Q
RU5ESU5HIGlzIHNldC4gVGhpcyBmbGFnIGlzIHN1cHBvc2VkIHRvIGJlIGNsZWFyZWQgaW4KPiBp
MmNfaGlkX3hmZXIoKSwgYnV0IHNpbmNlIHRoZSAodGhyZWFkZWQpIGludGVycnVwdCBoYW5kbGVy
IHJ1bnMgYXQgaGlnaGVyCj4gcHJpb3JpdHksIHRoZSBmbGFnIGlzIG5ldmVyIGNsZWFyZWQuIFNv
IHdlIGhhdmUgYSBsb2NrLXVwOiBpbnRlcnJ1cHQKPiBoYW5kbGVyIHdvbid0IGRvIGFueXRoaW5n
IHVubGVzcyB0aGUgZmxhZyBpcyBjbGVhcmVkLCBidXQgdGhlIGNsZWFyaW5nIG9mCj4gdGhpcyBm
bGFnIGlzIGRvbmUgaW4gYSBsb3dlciBwcmlvcml0eSB0YXNrIHdoaWNoIG5ldmVyIGdldHMgc2No
ZWR1bGVkIHdoaWxlCj4gdGhlIGludGVycnVwdCBoYW5kbGVyIGlzIGFjdGl2ZS4KPgo+IFRoZXJl
IGlzIFJUIHRocm90dGxpbmcgdG8gcHJldmVudCBSVCB0YXNrcyBmcm9tIGxvY2tpbmcgdXAgdGhl
IHN5c3RlbSBsaWtlCj4gdGhpcy4gSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgc2NoZWR1bGluZyBz
dHVmZnMsIHNvIEkgYW0gbm90IHJlYWxseSBzdXJlCj4gd2h5IFJUIHRocm90dGxpbmcgZG9lcyBu
b3Qgd29yay4gSSB0aGluayBiZWNhdXNlIFJUIHRocm90dGxpbmcgdHJpZ2dlcnMKPiB3aGVuIFJU
IHRhc2tzIHRha2UgdG9vIG11Y2ggQ1BVIHRpbWUsIGJ1dCBpbiB0aGlzIGNhc2UgaGFyZCBpbnRl
cnJ1cHQKPiBoYW5kbGVycyB0YWtlIGxvdHMgb2YgQ1BVIHRpbWUgdG9vICh+NTAlIGFjY29yZGlu
ZyB0byBteSBtZWFzdXJlbWVudCksIHNvCj4gUlQgdGhyb3R0bGluZyBkb2Vzbid0IHRyaWdnZXIg
b2Z0ZW4gZW5vdWdoIChpbiB0aGlzIGNhc2UsIGl0IHRyaWdnZXJzIG9uY2UKPiBhbmQgbmV2ZXIg
YWdhaW4pLiBBZ2FpbiwgSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgc2NoZWR1bGVyIHNvIEkgbWF5
IGJlCj4gdGFsa2luZyBub25zZW5zZSBoZXJlLgo+Cj4gVGhlIGZsYWcgSTJDX0hJRF9SRUFEX1BF
TkRJTkcgc2VlbXMgdG8gYmUgdXNlZCB0byBtYWtlIHN1cmUgdGhhdCBvbmx5IDEKPiBJMkMgb3Bl
cmF0aW9uIGNhbiBoYXBwZW4gYXQgYSB0aW1lLiBCdXQgdGhpcyBzZWVtcyBwb2ludGxlc3MsIGJl
Y2F1c2UgSTJDCj4gc3Vic3lzdGVtIGFscmVhZHkgdGFrZXMgY2FyZSBvZiB0aGlzLiBTbyBJIHRo
aW5rIHdlIGNhbiBqdXN0IHJlbW92ZSBpdC4KPgo+IENhbiB5b3UgZ2l2ZSB0aGUgYmVsb3cgcGF0
Y2ggYSB0cnk/Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaTJjLWhpZC9pMmMtaGlkLWNv
cmUuYyBiL2RyaXZlcnMvaGlkL2kyYy1oaWQvaTJjLWhpZC1jb3JlLmMKPiBpbmRleCAyNzM1Y2Q1
ODVhZjAuLjc5OWFkMGVmOWM0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2hpZC9pMmMtaGlkL2ky
Yy1oaWQtY29yZS5jCj4gKysrIGIvZHJpdmVycy9oaWQvaTJjLWhpZC9pMmMtaGlkLWNvcmUuYwo+
IEBAIC02NCw3ICs2NCw2IEBACj4gIC8qIGZsYWdzICovCj4gICNkZWZpbmUgSTJDX0hJRF9TVEFS
VEVEICAgICAgICAgICAgICAgIDAKPiAgI2RlZmluZSBJMkNfSElEX1JFU0VUX1BFTkRJTkcgIDEK
PiAtI2RlZmluZSBJMkNfSElEX1JFQURfUEVORElORyAgIDIKPgo+ICAjZGVmaW5lIEkyQ19ISURf
UFdSX09OICAgICAgICAgMHgwMAo+ICAjZGVmaW5lIEkyQ19ISURfUFdSX1NMRUVQICAgICAgMHgw
MQo+IEBAIC0xOTAsMTUgKzE4OSwxMCBAQCBzdGF0aWMgaW50IGkyY19oaWRfeGZlcihzdHJ1Y3Qg
aTJjX2hpZCAqaWhpZCwKPiAgICAgICAgICAgICAgICAgbXNnc1tuXS5sZW4gPSByZWN2X2xlbjsK
PiAgICAgICAgICAgICAgICAgbXNnc1tuXS5idWYgPSByZWN2X2J1ZjsKPiAgICAgICAgICAgICAg
ICAgbisrOwo+IC0KPiAtICAgICAgICAgICAgICAgc2V0X2JpdChJMkNfSElEX1JFQURfUEVORElO
RywgJmloaWQtPmZsYWdzKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0gaTJjX3RyYW5z
ZmVyKGNsaWVudC0+YWRhcHRlciwgbXNncywgbik7Cj4KPiAtICAgICAgIGlmIChyZWN2X2xlbikK
PiAtICAgICAgICAgICAgICAgY2xlYXJfYml0KEkyQ19ISURfUkVBRF9QRU5ESU5HLCAmaWhpZC0+
ZmxhZ3MpOwo+IC0KPiAgICAgICAgIGlmIChyZXQgIT0gbikKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldCA8IDAgPyByZXQgOiAtRUlPOwo+Cj4gQEAgLTU2Niw5ICs1NjAsNiBAQCBzdGF0aWMg
aXJxcmV0dXJuX3QgaTJjX2hpZF9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ICB7Cj4gICAg
ICAgICBzdHJ1Y3QgaTJjX2hpZCAqaWhpZCA9IGRldl9pZDsKPgo+IC0gICAgICAgaWYgKHRlc3Rf
Yml0KEkyQ19ISURfUkVBRF9QRU5ESU5HLCAmaWhpZC0+ZmxhZ3MpKQo+IC0gICAgICAgICAgICAg
ICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gLQo+ICAgICAgICAgaTJjX2hpZF9nZXRfaW5wdXQoaWhp
ZCk7Cj4KPiAgICAgICAgIHJldHVybiBJUlFfSEFORExFRDsKClBhdGNoIGFwcGxpZWQgY2xlYW5s
eSBvbiB0b3Agb2YgNi43LjksIGJ1aWxkcyBPSyAoTm8gd2FybnMsIGV0YykuCgpUaGlzIGluZGVl
ZCBmaXhlcyB0aGUgaGFuZyBjb21wbGV0ZWx5LgoKSSBtb2RpZmllZCBSVlZNIHRvIHNlbmQgbWls
bGlvbnMgb2Yga2V5c3Ryb2tlIGV2ZW50cyBwZXIgc2Vjb25kLAphbmQgcHV0IGByZWJvb3RgIGFz
IGEgc2VydmljZSBob29rIGluIHRoZSBndWVzdC4gSXQgaGFzIGJlZW4gY29udGludW91c2x5CnJl
Ym9vdGluZyB3aXRob3V0IGEgaGl0Y2ggZm9yIHRoZSBsYXN0IDMwIG1pbnV0ZXMgb3Igc28gKEZ1
bGwgYm9vdCB0YWtlcwphcm91bmQgMiBzZWNvbmRzKSwgd2hlcmVhcyB1bnBhdGNoZWQgNi43Ljkg
aGFuZ3MgYWxtb3N0IGltbWVkaWF0ZWx5CmluIHN1Y2ggY29uZGl0aW9ucyAoUmV2ZXJ0ZWQgeW91
ciBwYXRjaCAmIHJlYnVpbHQgdG8gYmUgc3VyZSkuCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0
aGlzISBIb3BlIHRvIHNlZSBpdCB1cHN0cmVhbWVkIHNvb24KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
