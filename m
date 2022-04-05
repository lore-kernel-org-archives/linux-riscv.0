Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA3DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 00:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vqRuXtSU56iTdV4u/NKBL0vtZJ3OEohccdL9Rkzs/bc=; b=Mf1iMyvUERM2FufvfpufqkyagC
	bg0LaraK8/50QiBB9o74RRwL3J5cmVT3NWyeCx2IEnM4HATN84Jqb/QEevw1v2PIHI6QCMobfZaBm
	CXfwA1V+jHaecBnKd9ioOcCfuZBTWJPfvCJWVdqleDvhsrzifLsx1cCa3IJgpaUECsZSPzZg1pUUy
	9yOBLdMUhFzlPKNXA0XTCKzsyJw6/y7EJjCBPx8dXLJm0GljyfHtO/tzNRWCyhEF+KKglqLEMekjY
	cdG7vFDWTZjVLOAcN19rqX0SsJjlR/DAm1QYP/A6bfT/CIAH6IdpG9DNaRVRpAvucnivRcBpbQ2NE
	+/6fTQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbXHz-00GlIt-Us; Tue, 05 Apr 2022 00:43:19 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbXHw-00GlHz-5X
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 00:43:18 +0000
Received: by mail-pj1-x102a.google.com with SMTP id fu5so4605241pjb.1
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 17:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IYK3K9Qzm8D7qoFu9FVNO7TkU85kFi6QdHt/GErFbBQ=;
 b=IQD+x35fF25Pz8QsjrzaiGqr+OrPtU2AEXaT+5jVjPtiyLsJYfHE07knAkxhy0OkK5
 SSBbSCqNCoRFSZ0ox+W10cBtf5dmrX4rwZdYnEEOw/N/4sNbJEa9qrgwGRwhxbIco8GY
 IKK8KtkHlZR+0DjZ25Vvm+vF4wedAP1E0rs0EQKlBriCV7zuNT0wZJjszp5yq5AFv2co
 nJpZc7HAovnqs4v1+UA791eiDoHZkKqYndP6gy88IwUUoPo9+8esFVmVrXrx4i1Vm6XY
 OwJyg41wJJeYytAwrW1ajYcZvDUE3TR2PX+w+ihYayWZy3xNote9eGFH4GHAIfewCcYR
 Mp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IYK3K9Qzm8D7qoFu9FVNO7TkU85kFi6QdHt/GErFbBQ=;
 b=Am5YU2s6cnbkn50ITia9Rbq9xmxXTwu569SW6mNFYYi2anGC7OR5JLI3X/1cZxrXHB
 wagktD2G+dAlN0zwnvD/G3EntaO6sakc1XaV/kLjCyh4JnMidkjisEjIk3N+Y4lHf1y9
 vUGw2yTtdx+D2u05CWGu0EyKhHB8fyg0Y/QNgpfQB0LhRwANUgxXmcQ+Fw0pk1V1zx+P
 +zMe7bL7oNnVwBoISy2LxziaDQkk1cKX5kBe3ubAiGtEKz4N+ZewoyFYeRlGxt50BaYZ
 NEo/MDknD4Z4hGuEKPMLMAmKlLIMmJ+XOLaoHcUKXEKGoL8W9kxNUcZKWbZsQh4a2TIy
 KAeg==
X-Gm-Message-State: AOAM530Fv9DSbZktTENO5uEpxjbLvJ2r0HBY+jUH8c3TZ/wf8wV2mg7q
 ngbDxdBTROfcD4krx21AYTjrtA==
X-Google-Smtp-Source: ABdhPJzml31dkYouSC4L26dpRKz7DxXfFMkmyars/Rma+Ccuzdev21G3/VPOlitgjCa7LjCLFR5vsg==
X-Received: by 2002:a17:90a:7d10:b0:1c9:7939:c70 with SMTP id
 g16-20020a17090a7d1000b001c979390c70mr1051208pjl.203.1649119389101; 
 Mon, 04 Apr 2022 17:43:09 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 a17-20020a62e211000000b004faa5233213sm12619660pfi.101.2022.04.04.17.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 17:43:08 -0700 (PDT)
Date: Mon, 04 Apr 2022 17:43:08 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Apr 2022 17:43:07 PDT (-0700)
Subject: Re: [PATCH] habanalabs: Elide a warning on 32-bit targets
In-Reply-To: <YksIkY0l8k7mmnzJ@kroah.com>
CC: ogabbay@kernel.org, linux-riscv@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, osharabi@habana.ai
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-2927288f-0f89-4f03-b3a2-35b92fd9d51e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_174316_476500_7B26041D 
X-CRM114-Status: GOOD (  32.92  )
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

T24gTW9uLCAwNCBBcHIgMjAyMiAwODowMjo0MSBQRFQgKC0wNzAwKSwgR3JlZyBLSCB3cm90ZToK
PiBPbiBGcmksIEFwciAwMSwgMjAyMiBhdCAxMTozNjo1M0FNIC0wNzAwLCBQYWxtZXIgRGFiYmVs
dCB3cm90ZToKPj4gT24gRnJpLCAwMSBBcHIgMjAyMiAxMToxMzo0OCBQRFQgKC0wNzAwKSwgb2dh
YmJheUBrZXJuZWwub3JnIHdyb3RlOgo+PiA+IE9uIEZyaSwgQXByIDEsIDIwMjIgYXQgNzo0MSBQ
TSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+ID4gPgo+PiA+
ID4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+ID4gPgo+PiA+
ID4gVGhpcyBkb3VibGUtY2FzdCBwYXR0ZXJuIGxvb2tzIGEgYml0IGF3a3dhcmQsIGJ1dCBpdCBh
bHJlYWR5IGV4aXN0cwo+PiA+ID4gZWxzZXdoZXJlIGluIHRoZSBkcml2ZXIuICBXaXRob3V0IHRo
aXMgcGF0Y2ggSSBnZXQKPj4gPiA+Cj4+ID4gPiBkcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21t
b24vbWVtb3J5LmM6IEluIGZ1bmN0aW9uIOKAmGFsbG9jX2RldmljZV9tZW1vcnnigJk6Cj4+ID4g
PiBkcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmM6MTUzOjQ5OiB3YXJuaW5n
OiBjYXN0IGZyb20gcG9pbnRlciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFstV3BvaW50
ZXItdG8taW50LWNhc3RdCj4+ID4gPiAgIDE1MyB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICh1NjQpIGdlbl9wb29sX2RtYV9hbGxvY19hbGlnbih2bS0+
ZHJhbV9wZ19wb29sLAo+PiA+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4+ID4gPgo+PiA+ID4gd2hpY2ggZW5kcyB1cCBwcm9tb3Rl
ZCB0byBhIGJ1aWxkIGVycm9yIGluIG15IHRlc3Qgc2V0dXAuCj4+ID4gPgo+PiA+ID4gU2lnbmVk
LW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+ID4gPgo+PiA+
ID4gLS0tCj4+ID4gPgo+PiA+ID4gSSBkb24ndCBrbm93IGFueXRoaW5nIGFib3V0IHRoaXMgZHJp
dmVyLCBJJ20ganVzdCBwYXR0ZXJuLW1hdGNoaW5nIHRoZQo+PiA+ID4gd2FybmluZyBhd2F5Lgo+
PiA+ID4gLS0tCj4+ID4gPiAgZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5j
IHwgMTAgKysrKystLS0tLQo+PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4+ID4gPgo+PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9o
YWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYyBiL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1v
bi9tZW1vcnkuYwo+PiA+ID4gaW5kZXggZTAwOGQ4MmU0YmEzLi5mMWZjNzljMWZjMTAgMTAwNjQ0
Cj4+ID4gPiAtLS0gYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKPj4g
PiA+ICsrKyBiL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYwo+PiA+ID4g
QEAgLTE1MCwxMiArMTUwLDEyIEBAIHN0YXRpYyBpbnQgYWxsb2NfZGV2aWNlX21lbW9yeShzdHJ1
Y3QgaGxfY3R4ICpjdHgsIHN0cnVjdCBobF9tZW1faW4gKmFyZ3MsCj4+ID4gPiAgICAgICAgICAg
ICAgICAgZm9yIChpID0gMCA7IGkgPCBudW1fcGdzIDsgaSsrKSB7Cj4+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoaXNfcG93ZXJfb2ZfMihwYWdlX3NpemUpKQo+PiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzX3BnX3BhY2stPnBhZ2VzW2ldID0KPj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1NjQpIGdl
bl9wb29sX2RtYV9hbGxvY19hbGlnbih2bS0+ZHJhbV9wZ19wb29sLAo+PiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYWdlX3NpemUsIE5VTEwsCj4+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhZ2Vfc2l6ZSk7Cj4+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAodTY0KSAodWludHB0cl90KSBnZW5fcG9vbF9kbWFfYWxsb2NfYWxpZ24o
dm0tPmRyYW1fcGdfcG9vbCwKPj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYWdlX3NpemUsIE5VTEwsCj4+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFnZV9zaXplKTsKPj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UKPj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19wZ19wYWNrLT5wYWdlc1tpXSA9
ICh1NjQpIGdlbl9wb29sX2FsbG9jKHZtLT5kcmFtX3BnX3Bvb2wsCj4+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhZ2Vfc2l6ZSk7Cj4+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBoeXNfcGdfcGFjay0+cGFnZXNbaV0gPSAodTY0KSAodWludHB0cl90KSBnZW5fcG9v
bF9hbGxvYyh2bS0+ZHJhbV9wZ19wb29sLAo+PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFnZV9zaXplKTsKPj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
cGh5c19wZ19wYWNrLT5wYWdlc1tpXSkgewo+PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXZfZXJyKGhkZXYtPmRldiwKPj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGFsbG9jYXRlIGRldmljZSBtZW1vcnkgKG91dCBv
ZiBtZW1vcnkpXG4iKTsKPj4gPiA+IC0tCj4+ID4gPiAyLjM0LjEKPj4gPiA+Cj4+ID4KPj4gPiBU
aGlzIHBhdGNoIGlzOgo+PiA+IFJldmlld2VkLWJ5OiBPZGVkIEdhYmJheSA8b2dhYmJheUBrZXJu
ZWwub3JnPgo+PiA+Cj4+ID4gR3JlZywKPj4gPiBDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHRoaXMg
ZGlyZWN0bHkgdG8geW91ciBtaXNjIHRyZWUgYW5kIHNlbmQgaXQgdG8KPj4gPiBMaW51cyBhdCB5
b3VyIG5leHQgcHVsbCByZXF1ZXN0ID8KPj4gPiBJIGRvbid0IGhhdmUgYW55IG90aGVyIGZpeGVz
IHBlbmRpbmcgZm9yIDUuMTguCj4+ID4KPj4gPiBGb3IgNS4xOSB3ZSB3aWxsIGRvIGEgbW9yZSBl
bGVnYW50IHNvbHV0aW9uIHRoYXQgQXJuZCBoYXMgcmVjb21tZW5kZWQuCj4+Cj4+IFRoYW5rcy4K
Pj4KPj4gQXNzdW1pbmcgdGhpcyBpcyB0b28gbGF0ZSBmb3IgcmMxLCB3b3VsZCBpdCBiZSBwb3Nz
aWJlIHRvIGhhdmUgaXQgaW4KPj4gc29tZXRoaW5nIEkgY2FuIHRha2UgaW50byBteSBmaXhlcy9m
b3ItbmV4dCB3aXRob3V0IHRvbyBtdWNoIGRpZmY/ICBJIHB1dAo+PiB0aGlzIG9uIHRvcCBvZiB0
aGUgb2ZmZW5kaW5nIGNvbW1pdCB3aXRoIGEKPj4KPj4gRml4ZXM6IGU4NDU4ZTIwZTBhMyAoImhh
YmFuYWxhYnM6IG1ha2Ugc3VyZSBkZXZpY2UgbWVtIGFsbG9jIGlzIHBhZ2UgYWxpZ25lZCIpCj4+
Cj4+IGF0IGtlcm5lbC5vcmcvcGFsbWVyL2hhYmFuYSAsIGlmIHRoYXQgaGVscHMgYW55LiAgTm8g
YmlnIGRlYWwgaWYgaXQgZ29lcyBpbgo+PiBhbm90aGVyIHdheSwgaXQncyBqdXN0IG5pY2UgdG8g
a2VlcCBhbGx5ZXNjb25maWcgYnVpbGRpbmcgb24gbXkgYnJhbmNoZXMKPj4gZGlyZWN0bHkuCj4K
PiBMb29rcyBsaWtlIEd1ZW50ZXIgc2VudCBpbiBhICJtb3JlIGNvbXBsZXRlIiB2ZXJzaW9uIG9m
IHRoaXMuICBJJ2xsCj4gcXVldWUgaXQgdXAgdG8gbXkgdHJlZSBhbmQgZ2V0IGl0IHRvIExpbnVz
IGZvciAtcmMyLgoKSSdtIGZpbmUgd2l0aCBhbnl0aGluZyBoZXJlLCBhcyBsb25nIGFzIGl0IGZp
eGVzIG15IGJ1aWxkIGVycm9ycyA7KS4KCkRvIHlvdSBtaW5kIGdpdmluZyBtZSBhIHBvaW50ZXI/
ICBUaGF0IHdheSBJIGNhbiB1c2UgZXhhY3RseSB3aGF0J3MgCmdvaW5nIHVwc3RyZWFtLCByYXRo
ZXIgdGhhdCBrZWVwaW5nIGFyb3VuZCB0aGlzIG5vdy1kZWFkLWVuZCBkaWZmIChJIApwb2tlZCBh
cm91bmQgeW91ciBrZXJuZWwub3JnIHRyZWVzIGFuZCBjb3VsZG4ndCBmaW5kIGFueXRoaW5nLCBi
dXQgSSd2ZSAKbm90IGRvbmUgdGhhdCBiZWZvcmUpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
