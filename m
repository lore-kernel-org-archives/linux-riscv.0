Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EB1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 06:53:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9982147C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 06:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+5rSV9l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lLDMEqBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B9982147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXSWcMgLVBJHdX7FIn/z+5DD1Xj5mqXtixX4I0nxyKA=; b=P+5rSV9lQCOLFp
	tZcUNj3+jQXg7oMv9/Cujm7GfktAPU4DkXHGYm6m7IKQCjWd4pUiNG/7cQlDibOU8bxjFdoO0lFRv
	FwNl+ptDzblfYwEQ6Rs5WOzksMcRTEhItkTeGsyO8UfnZ4oqQhIUsgGHiRSp0Uhqe+ICfHZNQ3y+4
	FxacslgvV1sY5llIddJidJ275Jm07ffmkxF1YVDQgd74AY3jP+EzRZzcD+tPbszrvnnXMGAlgyFwS
	VR/JYPprHKoMXNTM1dB9EUpwJWrzX54AGTYP3Fz5OPytzxGGgICBnfQHFdu8ImG+fN/sdCwXIDjR1
	fQZlv0jkheRSWkjxdxiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3bHt-0006XB-1e; Tue, 12 Mar 2019 06:53:21 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3bHp-0006WQ-Dt
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 06:53:19 +0000
Received: by mail-lf1-x132.google.com with SMTP id k136so1182297lfg.5
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 23:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6xisYs80ssI8KWvqpJCloMNnHCixE15ZiurfRfZv50w=;
 b=lLDMEqBsXVftMfldjou+NzRmWFT4xHrEMy8EPknp+fpKYBvyQUrydO+M2qDhb6xlPl
 FzP4vNOubB3X4MW+Ao3L6cMWBK+EKIPlKN0YNoAKCb8leKU4U/B9DqabU4ssrMsh7xxi
 ZjGoeiy7W/0on3Ez+2wQIBWCdJyArlZwve15FOnFvWxGwYZjpg6ME2Q3s9AGRJc7LgLV
 dWGyCAXbzhAuoV0aX2hFHYYChLtnsyCT/45emAgdIzfgNuqvV2ThOus9dDA/JVWeSF2Z
 Xq8UbDTKcmcxoGgtvI50ypvEGIhSjvHo4SYGgCe7FbcF20I/31X1Nl7sVhpsiyrSt7Ft
 Mh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6xisYs80ssI8KWvqpJCloMNnHCixE15ZiurfRfZv50w=;
 b=bjkJinDR7Ro8cUF+rVPoA/laaNSX5efLh8nR1/prfGONVlb+Y3vV32x0Gl/xZw1t0w
 aF0DqrI7b3H5fgdnRGtiPGpoyIgJpJcgLbGTgkNttEixiTOFDzB7hohriFd9jwqIt1yX
 0iYedxUHmX4UObNsauyQdsIAtVMTCoGPC/W/YHj33qDj2AFxehXNjZQQPpmhQjHGAEFI
 UuT1VkEMsyqLczaR3H+DEhcnuYx3Nv5O7uV7lT0D1m2qSOpubR+6m4mZu/Cqk+UU8/Hs
 eFVqRlpf7qwqgJ0rGZtov2qA9r6flls8iaaxc9os37Jzh4I2jNhvBwCcTXS6HLtdVBBS
 ggkQ==
X-Gm-Message-State: APjAAAWJUjwkY9jdNnUm/qvSbLIYlPPAygimtu5Eg2mVYvNUI80fsev+
 Vlz9wjlzhFzkDDoLcqiEZNln6JH8QhneDB5wi0zMOg==
X-Google-Smtp-Source: APXvYqwQh2JUQlYoy7Gy4hY12G7htGVabNcJO2SwXA0sRyuMTEQQwtoyM6ztR4X2r+XHbB1GEIa0EiyKMCRE+zcZJ30=
X-Received: by 2002:a19:9e8b:: with SMTP id
 h133mr13321038lfe.167.1552373595165; 
 Mon, 11 Mar 2019 23:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
 <1551437599-29509-3-git-send-email-yash.shah@sifive.com>
 <20190307152745.kaiv6q4ygf2apmuv@pengutronix.de>
 <CAJ2_jOFvr=sw7mWR53JbzMJa1jxwjhJSTibCsKYsxrht+PLPWw@mail.gmail.com>
 <20190308115726.smgooacsr37fmxwg@pengutronix.de>
 <CAJ2_jOFtg2_MAUYkTQM-=6KE2RN+FMxfEhLjZZfzM0k3A5RQiA@mail.gmail.com>
 <20190311132922.iowselp7qvmroiaa@pengutronix.de>
In-Reply-To: <20190311132922.iowselp7qvmroiaa@pengutronix.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 12 Mar 2019 12:22:38 +0530
Message-ID: <CAJ2_jOG50Bh0Zu64-htwy+VFy5Bce1Wj5dnMKVEE35C3MEbLPA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_235317_506951_1FD706F6 
X-CRM114-Status: GOOD (  18.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgNjo1OSBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gTW9uLCBN
YXIgMTEsIDIwMTkgYXQgMDU6MTA6MTdQTSArMDUzMCwgWWFzaCBTaGFoIHdyb3RlOgo+ID4gT24g
RnJpLCBNYXIgOCwgMjAxOSBhdCA1OjI3IFBNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPiA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXIgMDgsIDIw
MTkgYXQgMDQ6NTk6MzZQTSArMDUzMCwgWWFzaCBTaGFoIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwg
TWFyIDcsIDIwMTkgYXQgODo1NyBQTSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4gPiA+IDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gPiA+ID4gPiArICAgICBpZiAoc3Rh
dGUtPnBlcmlvZCAhPSBjdXJfc3RhdGUucGVyaW9kKSB7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRGlk
IHlvdSB0ZXN0IHRoaXMgd2l0aCBtb3JlIHRoYW4gb25lIGNvbnN1bWVyPyBGb3Igc3VyZSB0aGUg
Zm9sbG93aW5nCj4gPiA+ID4gPiBzaG91bGQgd29yazoKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAg
ICAgIHB3bTEgPSBwd21fZ2V0KC4uIHRoZSBmaXJzdCAuLik7Cj4gPiA+ID4gPiAgICAgICAgIHB3
bV9hcHBseV9zdGF0ZShwd20xLCB7IC5lbmFibGVkID0gdHJ1ZSwgLnBlcmlvZCA9IDEwMDAwMDAw
LCAuLi4uIH0pOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgcHdtMiA9IHB3bV9nZXQoLi4g
dGhlIHNlY29uZCAuLik7Cj4gPiA+ID4gPiAgICAgICAgIHB3bV9hcHBseV9zdGF0ZShwd20yLCB7
IC5lbmFibGVkID0gdHJ1ZSwgLnBlcmlvZCA9IDEwMDAwMDAwLCAuLi4uIH0pOwo+ID4gPiA+ID4K
PiA+ID4gPiA+IGJ1dCBmb3IgdGhlIHNlY29uZCBwd21fYXBwbHlfc3RhdGUoKSBydW4gc3RhdGUt
PnBlcmlvZCBpcyBsaWtlbHkgbm90Cj4gPiA+ID4gPiBleGFjdGx5IDEwMDAwMDAwLgo+ID4gPiA+
Cj4gPiA+ID4gWWVzLCBJIGhhdmUgdGVzdGVkIG11bHRpcGxlIGNvbnN1bWVycyB1c2luZyBzeXNm
cyBpbnRlcmZhY2UuIEl0IGlzIHdvcmtpbmcuCj4gPiA+Cj4gPiA+IENhbiB5b3UgcHJvdmlkZSBk
ZXRhaWxzIGFib3V0IHlvdXIgdGVzdGluZyBoZXJlPyBXaGF0IGlzIHRoZSBwYXJlbnQgY2xrCj4g
PiA+IHJhdGU/IFdoaWNoIHNldHRpbmdzIGRpZCB5b3UgdGVzdD8gQ2FuIHlvdSBjb25maXJtIG15
IGNsYWltIHRoYXQgdGhlCj4gPiA+IGFib3ZlIHNlcXVlbmNlIHdvdWxkIGZhaWwgb3IgcG9pbnQg
b3V0IG15IGVycm9yIGluIHJlYXNvbmluZz8KPiA+ID4KPiA+Cj4gPiBJIGhhdmUgdGVzdGVkIG9u
IEhpRml2ZSBVbmxlYXNoZWQgYm9hcmQgdXNpbmcgc3lzZnMgaW50ZXJmYWNlLgo+ID4gUGFyZW50
IGNsayByYXRlIGlzIGFyb3VuZCA1MTIgTWh6Lgo+ID4gSSBoYXZlIHRlc3RlZCBzY2VuYXJpb3Mg
YXMgeW91IG1lbnRpb25lZCBhYm92ZSB3aXRoIHZhcmlvdXMgcGVyaW9kIGFuZAo+ID4gZHV0eV9j
eWNsZSB2YWx1ZXMuCj4gPgo+ID4gQWZ0ZXIgY29uc2lkZXJpbmcgeW91ciBiZWxvdyBzdWdnZXN0
aW9uLAo+ID4gIHwgVG8gZ2V0IHRoZSByZXN1bHQgaW5kZXBlbmRlbnQgb2YgdGhlIHByaW9yIGNv
bmZpZ3VyYXRpb24geW91IGJldHRlciB1c2UKPiA+ICB8IHRoZSByZWFsIHRhcmdldGVkIHBlcmlv
ZCBsZW5ndGggYXMgaW5wdXQgaW5zdGVhZCBvZiB0aGUgbGFzdCBjb25maWd1cmVkCj4gPiAgfCBh
cHByb3hpbWF0aW9uCj4gPiBJIHdpbGwgaW50cm9kdWNlIGFwcHJveF9wZXJpb2QgZmVpbGQsIHdo
aWNoIHdpbGwgYmUgdXNlZCBhcyB0aGUKPiA+IHRhcmdldGVkIHBlcmlvZCBsZW5ndGguCj4gPiBB
bHNvLCBpbiBwd21fc2lmaXZlX2dldF9zdGF0ZSwgSSB3aWxsIG1ha2UgYmVsb3cgY2hhbmdlCj4g
PiAtIHN0YXRlLT5wZXJpb2QgPSBwd20tPnJlYWxfcGVyaW9kOwo+ID4gKyBzdGF0ZS0+cGVyaW9k
ID0gcHdtLT5hcHByb3hfcGVyaW9kLgo+ID4gU28gd2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFjZSwg
SSBiZWxpZXZlIHRoZSBjdXJfc3RhdGUucGVyaW9kIGZvciB0aGUKPiA+IHNlY29uZCBwd21fYXBw
bHlfc3RhdGUoKSBhYm92ZSAocHdtMikgd2lsbCBiZSBleGFjdGx5IDEwMDAwMDAwCj4KPiBJIGRv
bid0IHVuZGVyc3RhbmQgeW91ciBpbnRlbnRpb24gY29tcGxldGVseS4gSnVzdCBzZW5kIGEgbmV3
IHBhdGNoCj4gcm91bmQsIHRoZW4gSSB3aWxsIGdsYWRseSB0YWtlIGFub3RoZXIgbG9vay4KCkkg
d2FzIHBsYW5uaW5nIHRvIGdvIHdpdGggYWJvdmUtbWVudGlvbmVkIGNoYW5nZSBidXQgdGhlbiBJ
IHJlYWxpemVkCnRoYXQgcHdtIHN0YXRlIHNob3VsZCBhbHdheXMgcmVmbGVjdCB0aGUgY3VycmVu
dCBoYXJkd2FyZSBzdGF0ZSwgc28gSQpoYXZlIGRyb3BwZWQgdGhlIGFib3ZlIGlkZWEuCkNvbWlu
ZyBiYWNrIHRvIHlvdXIgY29uY2VybiBvbgoKIHwgICAgIGlmIChzdGF0ZS0+cGVyaW9kICE9IGN1
cl9zdGF0ZS5wZXJpb2QpIHsKCkl0IGlzIG5vdCBmYWlsaW5nIGZvciB0aGUgc2NlbmFyaW8geW91
IG1lbnRpb25lZCBidXQgZmFpbGluZyBmb3IKYW5vdGhlciB3YXkgYXJvdW5kLgoKICAgICAgICAg
cHdtMSA9IHB3bV9nZXQoLi4gdGhlIGZpcnN0IC4uKTsKICAgICAgICAgcHdtX2FwcGx5X3N0YXRl
KHB3bTEsIHsgLmVuYWJsZWQgPSB0cnVlLCAucGVyaW9kID0gMTAwMDAwMDAsIC4uLi4gfSk7Cgog
ICAgICAgICBwd20yID0gcHdtX2dldCguLiB0aGUgc2Vjb25kIC4uKTsKICAgICAgICAgcHdtX2Fw
cGx5X3N0YXRlKHB3bTIsIHsgLmVuYWJsZWQgPSB0cnVlLCAucGVyaW9kID0gMjAwMDAwMDAsIC4u
Li4gfSk7CgpUaGUgcHdtMiBzaG91bGQgZ2V0IGFuIGVycm9yIGZvciBwZXJpb2QgbWlzbWF0Y2gg
YnV0IHdpdGggdjggcGF0Y2gsIGl0CmlzIG5vdCBnZXR0aW5nIGFueSBlcnJvci4KCkkgYW0gc2Vu
ZGluZyBhIHY5IHBhdGNoIHdoaWNoIGhhcyB0aGUgZml4IGZvciB0aGlzLgpXaXRoIHY5IGNoYW5n
ZXMsIEkgaGF2ZSB0ZXN0ZWQgYWxsIHNjZW5hcmlvcyBhbmQgaXQgaXMgd29ya2luZyBmaW5lLgoK
Pgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+Cj4gLS0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1
c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1
dHJvbml4LmRlLyAgfAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
