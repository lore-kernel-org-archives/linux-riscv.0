Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4576C63705
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2177iFyEiN8RqI/dEpnKZKf5ZiUpYQGAOTw5zaqpVvI=; b=VXHgLhXoBU8YIs
	X7/5Mw0HYa5uLdwufV29LxhgQqh3U22uLl387Z77NQ7Eit12mi36Rz6qfqAFZqX57gqPXNf2enG0O
	X0SL+w/GcfW9J4drtF9AS+su0ZdGuuJoeSm9iDQcSWY+l8IfDNhwLETjykKailz5qUSshkZIXmW1u
	WPi+bUbrgimLoGn1aOpiBD8mO7zuNXcCPLYgLnKVzg6YWCLCgXJQtJ7aSrPn/uT9DO0SMQlEqBDcs
	RpMmYmG0B0txBAnB6lRtcVWQAKVP6cBV8aUcjtLw9h5xApp7PXPu62iGuO0KJxYM8bHSNynvqHlKW
	LYrJP8s+7rC7m8F3YAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p32Sm-00DZ70-48; Wed, 07 Dec 2022 22:00:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p32Si-00DYxf-3U
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 22:00:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so2144023wms.4
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 14:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Knh157SEwZHSJgqbSLnipfI1qSnM1oLHBJAHlDZgZuM=;
        b=QTOyccM9SEEMIH/x4FFVjCdaskgD5FC2roPGqPLr4/V6BH/6PBnWMgUXXAF3rdhsIh
         nERhL8kYfMiYYudKlTRtGQ8hEr/BpWl+9Aco5YPeBlBBYIQs0mQSYOgiWmCFm5Is9wyI
         HYCIDVN4JTrfjrcY0oX00GBQUWQCs8sXDy1H1lhrpdAaONKwPcXpj3ornfhfB5MSZSpI
         HY81z0zFdqAeSF/5dhJAs95UB2xs7DWBvyXgLzj/QOwPZiV857m1SYQdfNn0cGEseaSe
         Q+Aoz8Jhbjsp5sFjI4UbVT7736sU+hQwmKcE6dhAHBPBAVHfKRi7RYcjZIxKDcC1twic
         FxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Knh157SEwZHSJgqbSLnipfI1qSnM1oLHBJAHlDZgZuM=;
        b=2v1KZGzBPv2mcR4C+iLp5F96IhVU9+/6pvE7tyLAglD38IRfqE2UT3lkaWtGLqNI1v
         EP4f9jPUS4awjaJN5Jpma6mNwM9ChQtVKqdK1UXNecNm1XNgIOFcM7SUQRDQm7mi0sd5
         3zD86H9oxkHL+Rc90vg0NRhHf92cNJuDzazC/ZhvGv7jHqxul2Du4mw466491jr8Xvsg
         L1YMYrfC+ccGpZSaMyiu0+ItAOFJxRqMXrJqyqdX7F/bNFRLfJ5I92TEY9UpEL/dufAa
         Lk1Q7v6As6j0uxGEW7l1eMW7z+Sp8kZE3RChxyRYJMrl+wVPEiY0suzA+R2bmSkMN2CM
         +Q5Q==
X-Gm-Message-State: ANoB5plCcr5VoHizzuLylWsxScqMnOuCzgieKnhJfGnyYGh6RYkQ6xS9
	F3g3f40+xrj6xSQtN1GeglnQ6A==
X-Google-Smtp-Source: AA0mqf40mORNjB5ryt+j8vs4PNEzRQai2Oq/d4ISnrVnHkgrd7aqjv+goUsWZL64OTq0HxXJXlcTIQ==
X-Received: by 2002:a05:600c:4e41:b0:3cf:8261:8de1 with SMTP id e1-20020a05600c4e4100b003cf82618de1mr1049089wmq.8.1670450416272;
        Wed, 07 Dec 2022 14:00:16 -0800 (PST)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c359100b003c6f8d30e40sm2950623wmq.31.2022.12.07.14.00.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Dec 2022 14:00:14 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched
 alternatives
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y5D8CHkJZGmQKxdh@spud>
Date: Wed, 7 Dec 2022 22:00:13 +0000
Cc: Heiko Stuebner <heiko@sntech.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>,
 emil.renner.berthing@canonical.com,
 Jisheng Zhang <jszhang@kernel.org>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <F5E250D9-29DD-40C5-AF34-82B59DD4BD11@jrtc27.com>
References: <20221207180821.2479987-1-heiko@sntech.de>
 <20221207180821.2479987-13-heiko@sntech.de> <Y5D8CHkJZGmQKxdh@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_140020_213682_FD9662A2 
X-CRM114-Status: GOOD (  37.44  )
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

T24gNyBEZWMgMjAyMiwgYXQgMjA6NDgsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gCj4gT24gV2VkLCBEZWMgMDcsIDIwMjIgYXQgMDc6MDg6MjFQTSArMDEwMCwgSGVp
a28gU3R1ZWJuZXIgd3JvdGU6Cj4+IEZyb206IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5l
ckB2cnVsbC5ldT4KPj4gCj4+IEFsdGVybmF0aXZlcyBsaXZlIGluIGEgZGlmZmVyZW50IHNlY3Rp
b24sIHNvIGFkZHJlc3NlcyB1c2VkIGJ5IGNhbGwKPj4gZnVuY3Rpb25zIHdpbGwgcG9pbnQgdG8g
d3JvbmcgbG9jYXRpb25zIGFmdGVyIHRoZSBwYXRjaCBnb3QgYXBwbGllZC4KPj4gCj4+IFNpbWls
YXIgdG8gYXJtNjQsIGFkanVzdCB0aGUgbG9jYXRpb24gdG8gY29uc2lkZXIgdGhhdCBvZmZzZXQu
Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1
bGwuZXU+Cj4+IC0tLQo+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmggfCAg
MyArKwo+PiBhcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jICAgICAgfCA1NiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+IGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAg
ICAgICB8ICA1ICsrLQo+PiAzIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVy
bmF0aXZlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmgKPj4gaW5kZXgg
NjUxMWRkNzNlODEyLi4xYmQ0MDI3ZDM0Y2EgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYWx0ZXJuYXRpdmUuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fs
dGVybmF0aXZlLmgKPj4gQEAgLTI3LDYgKzI3LDkgQEAgdm9pZCBfX2luaXQgYXBwbHlfYm9vdF9h
bHRlcm5hdGl2ZXModm9pZCk7Cj4+IHZvaWQgX19pbml0IGFwcGx5X2Vhcmx5X2Jvb3RfYWx0ZXJu
YXRpdmVzKHZvaWQpOwo+PiB2b2lkIGFwcGx5X21vZHVsZV9hbHRlcm5hdGl2ZXModm9pZCAqc3Rh
cnQsIHNpemVfdCBsZW5ndGgpOwo+PiAKPj4gK3ZvaWQgcmlzY3ZfYWx0ZXJuYXRpdmVfZml4X29m
ZnNldHModm9pZCAqYWx0X3B0ciwgdW5zaWduZWQgaW50IGxlbiwKPj4gKwkJCQkgICBpbnQgcGF0
Y2hfb2Zmc2V0KTsKPj4gKwo+PiBzdHJ1Y3QgYWx0X2VudHJ5IHsKPj4gCXZvaWQgKm9sZF9wdHI7
CQkgLyogYWRkcmVzcyBvZiBvcmlnaW5hbCBpbnN0cnVjaXRvbiBvciBkYXRhICAqLwo+PiAJdm9p
ZCAqYWx0X3B0cjsJCSAvKiBhZGRyZXNzIG9mIHJlcGxhY2VtZW50IGluc3RydWN0aW9uIG9yIGRh
dGEgKi8KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCj4+IGluZGV4IGE3ZDI2YTAwYmVlYS4uYzI5
ZTE5OGVkOWRmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5j
Cj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMKPj4gQEAgLTE1LDYgKzE1
LDggQEAKPj4gI2luY2x1ZGUgPGFzbS92ZW5kb3JpZF9saXN0Lmg+Cj4+ICNpbmNsdWRlIDxhc20v
c2JpLmg+Cj4+ICNpbmNsdWRlIDxhc20vY3NyLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2luc24uaD4K
Pj4gKyNpbmNsdWRlIDxhc20vcGF0Y2guaD4KPj4gCj4+IHN0cnVjdCBjcHVfbWFudWZhY3R1cmVy
X2luZm9fdCB7Cj4+IAl1bnNpZ25lZCBsb25nIHZlbmRvcl9pZDsKPj4gQEAgLTUzLDYgKzU1LDYw
IEBAIHN0YXRpYyB2b2lkIF9faW5pdF9vcl9tb2R1bGUgcmlzY3ZfZmlsbF9jcHVfbWZyX2luZm8o
c3RydWN0IGNwdV9tYW51ZmFjdHVyZXJfaW5mCj4+IAl9Cj4+IH0KPj4gCj4+ICtzdGF0aWMgdTMy
IHJpc2N2X2luc3RydWN0aW9uX2F0KHZvaWQgKnApCj4+ICt7Cj4+ICsJdTE2ICpwYXJjZWwgPSBw
Owo+PiArCj4+ICsJcmV0dXJuICh1bnNpZ25lZCBpbnQpcGFyY2VsWzBdIHwgKHVuc2lnbmVkIGlu
dClwYXJjZWxbMV0gPDwgMTY7Cj4gCj4gSSBmZWVsIGJhZCBmb3Igbm90IG1lbnRpb25pbmcgdGhp
cyBiZWZvcmUgLSBjYW4gd2UgcmVwbGFjZSB0aGlzIG1hZ2ljIDE2Cj4gd2l0aCBzb21ldGhpbmcg
c2VsZiBkb2N1bWVudGluZz8KCkkgbWVhbiwgaXTigJlzIGEgdTE2ICogdHdvIGxpbmVzIGFib3Zl
LCB0aGF0IHNlZW1zIGEgYml0IHVubmVjZXNzYXJ5Li4uIEknZAphcmd1ZSBnaXZpbmcgaXQgYSBu
YW1lIHdvdWxkIGJlIHdvcnNlIHRoYW4gbm90LgoKVGhvdWdoIHRoZXNlIHVuc2lnbmVkIGludHMg
c2hvdWxkIGJlIHUzMiB0byBtYXRjaCB0aGUgcmV0dXJuIHR5cGUuCgpKZXNzCgo+PiArfQo+PiAr
Cj4+ICtzdGF0aWMgdm9pZCByaXNjdl9hbHRlcm5hdGl2ZV9maXhfYXVpcGNfamFscih2b2lkICpw
dHIsIHUzMiBpbnNuMSwgdTMyIGluc24yLCBpbnQgcGF0Y2hfb2Zmc2V0KQo+PiArewo+PiArCS8q
IHBpY2sgdGhlIG9yaWdpbmFsIGF1aXBjICsgamFsciAqLwo+PiArCXUzMiBjYWxsWzJdID0geyBp
bnNuMSwgaW5zbjIgfTsKPj4gKwlzMzIgaW1tOwo+PiArCj4+ICsJLyogZ2V0IGFuZCBhZGp1c3Qg
bmV3IHRhcmdldCBhZGRyZXNzICovCj4+ICsJaW1tID0gcmlzY3ZfaW5zbl9leHRyYWN0X3V0eXBl
X2l0eXBlX2ltbShpbnNuMSwgaW5zbjIpOwo+PiArCWltbSAtPSBwYXRjaF9vZmZzZXQ7Cj4+ICsK
Pj4gKwkvKiB1cGRhdGUgaW5zdHJ1Y3Rpb25zICovCj4+ICsJcmlzY3ZfaW5zbl9pbnNlcnRfdXR5
cGVfaXR5cGVfaW1tKGNhbGwsIGltbSk7Cj4+ICsKPj4gKwkvKiBwYXRjaCB0aGUgY2FsbCBwbGFj
ZSBhZ2FpbiAqLwo+PiArCXBhdGNoX3RleHRfbm9zeW5jKHB0ciwgY2FsbCwgc2l6ZW9mKHUzMikg
KiAyKTsKPj4gK30KPiAKPiBPYnYuIEkgaGF2ZSBub3QgbGVmdCBSLWIgdGFncyBvbiBzdHVmZiB3
aXRob3V0IHRyeWluZyB0byB1bmRlcnN0YW5kCj4gd2hhdCdzIGdvaW5nIG9uLCBidXQgZnJvbSBh
IGxheS1vYnNlcnZlciBwb2ludCBvZiB2aWV3LCBJIHRoaW5rIHRoZXNlCj4gZnVuY3Rpb24gbmFt
ZXMgJiBmbG93IGRvZXMgYSBnb29kIGpvYiBvZiBleHBsYWluaW5nIHNvbWUgb2YgdGhlIGJsYWNr
Cj4gbWFnaWMgaW4gdGhpcyBuZWNrIG9mIHRoZSB3b29kcy4KPiAKPj4gKwo+PiArdm9pZCByaXNj
dl9hbHRlcm5hdGl2ZV9maXhfb2Zmc2V0cyh2b2lkICphbHRfcHRyLCB1bnNpZ25lZCBpbnQgbGVu
LAo+PiArCQkJCSAgICAgIGludCBwYXRjaF9vZmZzZXQpCj4+ICt7Cj4+ICsJaW50IG51bV9pbnN0
ciA9IGxlbiAvIHNpemVvZih1MzIpOwo+IAo+IGluc3RyLi4uCj4gCj4+ICsJaW50IGk7Cj4+ICsK
Pj4gKwkvKgo+PiArCSAqIHN0b3Agb25lIGluc3RydWN0aW9uIGJlZm9yZSB0aGUgZW5kLCBhcyB3
ZSdyZSBjaGVja2luZwo+PiArCSAqIGZvciBhdWlwYyArIGphbHIKPj4gKwkgKi8KPj4gKwlmb3Ig
KGkgPSAwOyBpIDwgbnVtX2luc3RyOyBpKyspIHsKPj4gKwkJdTMyIGluc3QgPSByaXNjdl9pbnN0
cnVjdGlvbl9hdChhbHRfcHRyICsgaSAqIHNpemVvZih1MzIpKTsKPiAKPiAuLi5pbnN0Li4uCj4g
Cj4+ICsKPj4gKwkJLyogbWF5IGJlIHRoZSBzdGFydCBvZiBhbiBhdWlwYyArIGphbHIgcGFpciAq
Lwo+PiArCQlpZiAocmlzY3ZfaW5zbl9pc19hdWlwYyhpbnN0KSAmJiBpIDwgbnVtX2luc3RyIC0g
MSkgewo+IAo+IC4uLmluc24uCj4gCj4gSXMgdGhlcmUgYSByZWFzb24gZm9yIHRoYXQ/Cj4gCj4g
QWxzbywgSSd2ZSBnb3R0ZW4gbXlzZWxmIHNsaWdodGx5IGNvbmZ1c2VkIGFib3V0IHRoZSBsb29w
LiBZb3UgInN0b3Agb25lCj4gaW5zdHJ1Y3Rpb24gYmVmb3JlIHRoZSBlbmQiIGJ1dCB0aGUgbWFp
biBsb29wIGdvZXMgZnJvbSAwIC0+IG51bV9pbnN0ci4KPiBUaGUgaW5uZXIgbG9vcCB0aGVuIGNo
ZWNrcyBmb3IgaSA8IG51bV9pbnN0ciAtIDEuIFdoYXQgYW0gSSBtaXNzaW5nIHRoYXQKPiBwcmV2
ZW50cyB0aGUgb3V0ZXIgbG9vcCBmcm9tIHN0b3BwaW5nIGF0IG51bV9pbnN0ciAtIDEgaW5zdGVh
ZD8KPj4gKwkJCXUzMiBpbnN0MiA9IHJpc2N2X2luc3RydWN0aW9uX2F0KGFsdF9wdHIgKyAoaSAr
IDEpICogc2l6ZW9mKHUzMikpOwo+PiArCj4+ICsJCQlpZiAoIXJpc2N2X2luc25faXNfamFscihp
bnN0MikpCj4+ICsJCQkJY29udGludWU7Cj4+ICsKPj4gKwkJCS8qIGNhbGwgd2lsbCB1c2UgcmEg
cmVnaXN0ZXIgKi8KPiAKPiBTdXBlciBtaW5vciwgYnV0ICJjYWxsIHdpbGwgdXNlIHJhIHJlZ2lz
dGVyIiBpcyBhIGxpdHRsZSB1bmNsZWFyLiBBcwo+IHdyaXR0ZW4sIGl0IG1ha2VzIHBlcmZlY3Qg
c2Vuc2Ugd2hlbiB5b3UndmUgYmVlbiBzdGFyaW5nIGF0IHRoaXMgY29kZSwKPiBidXQgbm90IHNv
IG11Y2ggaWYgeW91J3JlIHBhc3NpbmcgdGhyb3VnaC4uIEhvdyBhYm91dDoKPiAvKiBpZiB0aGlz
IGluc3RydWN0aW9uIHBhaXIgaXMgYSBjYWxsLCBpdCB3aWxsIHVzZSB0aGUgcmEgcmVnaXN0ZXIg
Ki8KPiAKPj4gKwkJCWlmIChSVl9FWFRSQUNUX1JEX1JFRyhpbnN0KSAhPSAxKQo+PiArCQkJCWNv
bnRpbnVlOwo+PiAKPiAKPiBBbGwgbWlub3Igc3R1ZmYgdGhvdWdoLCBzbyB5b3UgY2FuIHJlLWFk
ZCBteSBSLWIgZWl0aGVyIHdheToKPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBUaGFua3MsCj4gQ29ub3IuCj4gCj4+ICsJCQlyaXNj
dl9hbHRlcm5hdGl2ZV9maXhfYXVpcGNfamFscihhbHRfcHRyICsgaSAqIHNpemVvZih1MzIpLAo+
PiArCQkJCQkJCSBpbnN0LCBpbnN0MiwgcGF0Y2hfb2Zmc2V0KTsKPj4gKwkJfQo+PiArCX0KPj4g
K30KPj4gKwo+PiAvKgo+PiAgKiBUaGlzIGlzIGNhbGxlZCB2ZXJ5IGVhcmx5IGluIHRoZSBib290
IHByb2Nlc3MgKGRpcmVjdGx5IGFmdGVyIHdlIHJ1bgo+PiAgKiBhIGZlYXR1cmUgZGV0ZWN0IG9u
IHRoZSBib290IENQVSkuIE5vIG5lZWQgdG8gd29ycnkgYWJvdXQgb3RoZXIgQ1BVcwo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCj4+IGluZGV4IDY5NDI2N2QxZmU4MS4uZTkxZWMzZDhlMjQwIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+IEBAIC0zMTYsOCArMzE2LDExIEBAIHZvaWQgX19p
bml0X29yX21vZHVsZSByaXNjdl9jcHVmZWF0dXJlX3BhdGNoX2Z1bmMoc3RydWN0IGFsdF9lbnRy
eSAqYmVnaW4sCj4+IAkJfQo+PiAKPj4gCQl0bXAgPSAoMVUgPDwgYWx0LT5lcnJhdGFfaWQpOwo+
PiAtCQlpZiAoY3B1X3JlcV9mZWF0dXJlICYgdG1wKQo+PiArCQlpZiAoY3B1X3JlcV9mZWF0dXJl
ICYgdG1wKSB7Cj4+IAkJCXBhdGNoX3RleHRfbm9zeW5jKGFsdC0+b2xkX3B0ciwgYWx0LT5hbHRf
cHRyLCBhbHQtPmFsdF9sZW4pOwo+PiArCQkJcmlzY3ZfYWx0ZXJuYXRpdmVfZml4X29mZnNldHMo
YWx0LT5vbGRfcHRyLCBhbHQtPmFsdF9sZW4sCj4+ICsJCQkJCQkgICAgICBhbHQtPm9sZF9wdHIg
LSBhbHQtPmFsdF9wdHIpOwo+PiArCQl9Cj4+IAl9Cj4+IH0KPj4gI2VuZGlmCj4+IC0tIAo+PiAy
LjM1LjEKPj4gCj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
