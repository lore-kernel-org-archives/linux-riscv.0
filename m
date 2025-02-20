Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C21C021B3
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGit5kMWr2xvw/1wFGfRsN9tfDyaBYdDm2Fv6NwEptE=; b=AbYx6lTGC6epx9
	lTZUJfLffgAZ3zhvtqxjSKaAT5jesWwl8J60pp+aMdeIIckGo2KrRIqXhatqFWpfdTsP0jhcqvWEn
	nf0JU3yKJaF2U3k5x/HXWWcYpU7MvtsNZ0ehUbW+MrhhNdAQouXXusP2d1F66YcL7i+GESA+9K13Y
	EcJDTvoWMUIq+yeA5qp9ns6nvNYM3PvYSMA7JK31aGdA6IFNfyd+dlQ4JBthXEJ3UqIDMj/sYNn0/
	5H1+P69r72qK7MjEmmw2pu0vJuSyA+NqkJ8ojzx6vnhJaekDigpRco9OWLcedn0BGJtq8bE7jfr5Z
	gYsbwnPuYLVo5dotISPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl93o-00000001kjH-1WIK;
	Thu, 20 Feb 2025 16:06:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl93D-00000001kVM-1Fqd;
	Thu, 20 Feb 2025 16:05:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-439a331d981so9667565e9.3;
        Thu, 20 Feb 2025 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740067521; x=1740672321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeC/y/vh1tkJh+M+/QzTRw0yFeyaFGiu3MMBcm9DXsQ=;
        b=izM7r91f2OAj4j/iNmoYEyIgVSdPb+3l0wCxtwcx/T/vfQ8bHNzm0VUIZNwZ1BIo5Y
         iDurJ/tuxlCor/P1+vaIhelKtvbhnOg+hq2aRt+xvjF3fouVvWM0G8uEP+OniDYyWuxz
         2bFiWSihV5OUdlNrDvZvdjK+RDDjGyu1HjxZ37ZxLZrJh+0E3JItYI9uVjeiEct8HSJL
         fONJvJPLTER3La2+U7HqW6fCkuPlyea/o2P2OXWMxdyocYPdlufQ/58fC8+Ngq9ro7iN
         Fvry6e8idvdoJLSXU/j5XOFKCUtNTt0OObvuGDCccLAFXOwiX72RghW3IrFvNrul/Y6s
         likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067521; x=1740672321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeC/y/vh1tkJh+M+/QzTRw0yFeyaFGiu3MMBcm9DXsQ=;
        b=PXRomut3cuC0lZGrmFoCDHorj6Laqbovb3ac2L/70U7pQtv/gqMO+R+xaWjYDfgPqW
         XeZD7W3EHfESW4yap0asGOOiK8a6qXcyvRzVhXxSZ9hoAt6p9zKTqmrqTFI8Vhx9yMk+
         gGPhZwxiKm4ADPrLnE/iQPjIZn+ya1tcipafgqsITK9p8KJUuTNRavrofuVFxBteJ3l3
         tqCLh13q2773CTntxl+APAx3iXitNa1NjTirzT5yfneb8N5hlEAVohpdOO4enlOPxKvV
         CYoOZBt3gPUE+4tSa3kXZxp1HlaEDrfhp2nv//Toz151wSV9w710/r0cfa11n/qpRqkt
         YjgA==
X-Forwarded-Encrypted: i=1; AJvYcCUh2Sqo7rB6KJCUH8x1S06Zk6hrdk6DSoreU286BG3V49JOII257xqx04X0yVMUUS3CdbIWJxgC6aKtohy9wu2T@lists.infradead.org, AJvYcCXD/Aecy7G//O0PW3NIErBZw6HTiYuUlxYumFsEYw5Nm35SZuybbHoZqg9I7zZTNKpG+QpRMoemDLNOh8s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhbQ8vdVBZ1mRIrW7AQiULtU6/9SyTLcw4Z4t/skSoqcIMGqDx
	Zz6px1z5PjNCPJ3REk+xynDS0tjHQFmjKaFJdq4bZ3Jpow+qrZrE
X-Gm-Gg: ASbGncsPivdqll7Hzr7vBba66o+MinPZyu4aPQHr/ckYDyMg1+hFLNY3urfGxs/VpiF
	A7Djsvglb4uhQhBbHWc9YO2OQ3uDimekomc+XQ4h4e7V9gyVYxq/5Jgqq7hAy6UwcDmSSPkHlk1
	akT0J18YmMNSS7ibGS6ZMaOF6G/tjaUliTnAQ2WP15mh2cQXTRblSZScHZfdaCqa/AW5ANBG5iR
	fP+Ed41SVrsoPHd8BsvMBCCzgrYigV3naOzfEjPZ8UwQq4pOVazvfOHUB80tijHMSZUlCnFw6MK
	ZRdtdd7e6NEHPRWMIcfbTbfWvP7kkCvCXPcUUV5Cd5ip19HmiAmHKnmwCuLVYDO943w=
X-Google-Smtp-Source: AGHT+IH4UynjVIIpSlbvfcPnRuzuDf6FHbdwZq/2+3kemkCHgCd8NUoqXYSrlF9BQGYXBcqlYeePNg==
X-Received: by 2002:a05:600c:3ba6:b0:439:9828:c434 with SMTP id 5b1f17b1804b1-43999dd0fe3mr80636455e9.20.1740067520987;
        Thu, 20 Feb 2025 08:05:20 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399b430912sm54276465e9.0.2025.02.20.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:05:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxim Kiselev <bigunclemax@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 John Watts <contact@jookia.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 John Watts <contact@jookia.org>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add thermal sensor
Date: Thu, 20 Feb 2025 17:05:19 +0100
Message-ID: <4835098.rnE6jSC6OK@jernej-laptop>
In-Reply-To: <20250220-thermal-v1-1-5168ddfc86e8@jookia.org>
References: <20250220-thermal-v1-1-5168ddfc86e8@jookia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_080523_338437_4AA9045E 
X-CRM114-Status: GOOD (  16.90  )
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

RG5lIMSNZXRydGVrLCAyMC4gZmVicnVhciAyMDI1IG9iIDEwOjI1OjEwIFNyZWRuamVldnJvcHNr
aSBzdGFuZGFyZG5pIMSNYXMgamUgSm9obiBXYXR0cyBuYXBpc2FsKGEpOgo+IEZyb206IE1heGlt
IEtpc2VsZXYgPGJpZ3VuY2xlbWF4QGdtYWlsLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSB0
aGVybWFsIHNlbnNvciBjb250cm9sbGVyIG5vZGUgZm9yIHRoZSBEMS9UMTEzcy4KPiBBbHNvIGl0
IGFkZHMgYSBUSFMgY2FsaWJyYXRpb24gZGF0YSBjZWxsIHRvIGVmdXNlIG5vZGUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWF4aW0gS2lzZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPgo+IFJldmll
d2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBKb2huIFdhdHRzIDxjb250YWN0QGpvb2tpYS5vcmc+Cj4gW0pvaG4gV2F0dHM6IFJl
bW92ZSBkaXNhYmxlZCBzdGF0dXNdCgpJIHByZWZlciBvdGhlciBwYXRjaCwgd2hpY2ggd2FzIHBv
c3RlZCBub3QgdG9vIGxvbmcgYWdvIHNpbmNlIGl0IGFsc28gaGFzCnRoZXJtYWwgem9uZXMuCgpC
ZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAtLS0KPiBUaGlzIGlzIGEgcXVpY2sgZml4ZWQgdmVyc2lv
biBvZiBNYXhpbSBLaXNlbGV2J3MgcGF0Y2ggZnJvbSBoZXJlOgo+IAo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIzMTIxNzIxMDYyOS4xMzE0ODYtNC1iaWd1bmNsZW1heEBnbWFpbC5j
b20vCj4gCj4gSXQgcmVtb3ZlcyB0aGUgZGlzYWJsZWQgc3RhdHVzIGFzIHJlcXVlc3RlZC4gSSd2
ZSB0ZXN0ZWQgaXQgYnkgYWRkaW5nIHRoZXJtYWwKPiB6b25lcyB0byBteSBib2FyZCBhbmQgaXQg
d29ya3MgZnJvbSB3aGF0IEkgY2FuIHNlZS4KPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy9h
bGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSB8IDE2ICsrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiBpbmRleCBlNDE3NWFkYjAyOGRh
MmJlNTM5ZTdhYTMxNjIwNmZlYzQ4MTBhZGZjLi5jYzNmOWNjOWI4ZWQyMDEyMTkyNGNjOTMyNDEy
YTZiNjM0MmEyZjg2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bnhpLWQxcy10MTEzLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW54aS1kMXMtdDExMy5kdHNpCj4gQEAgLTE2Niw2ICsxNjYsMTggQEAgZ3BhZGM6IGFkY0Ay
MDA5MDAwIHsKPiAgCQkJI2lvLWNoYW5uZWwtY2VsbHMgPSA8MT47Cj4gIAkJfTsKPiAgCj4gKwkJ
dGhzOiB0aGVybWFsLXNlbnNvckAyMDA5NDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5u
ZXIsc3VuMjBpLWQxLXRocyI7Cj4gKwkJCXJlZyA9IDwweDAyMDA5NDAwIDB4NDAwPjsKPiArCQkJ
aW50ZXJydXB0cyA9IDxTT0NfUEVSSVBIRVJBTF9JUlEoNTgpIElSUV9UWVBFX0xFVkVMX0hJR0g+
Owo+ICsJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVTX1RIUz47Cj4gKwkJCWNsb2NrLW5hbWVzID0g
ImJ1cyI7Cj4gKwkJCXJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfVEhTPjsKPiArCQkJbnZtZW0tY2Vs
bHMgPSA8JnRoc19jYWxpYnJhdGlvbj47Cj4gKwkJCW52bWVtLWNlbGwtbmFtZXMgPSAiY2FsaWJy
YXRpb24iOwo+ICsJCQkjdGhlcm1hbC1zZW5zb3ItY2VsbHMgPSA8MD47Cj4gKwkJfTsKPiArCj4g
IAkJZG1pYzogZG1pY0AyMDMxMDAwIHsKPiAgCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3Vu
MjBpLWQxLWRtaWMiLAo+ICAJCQkJICAgICAiYWxsd2lubmVyLHN1bjUwaS1oNi1kbWljIjsKPiBA
QCAtNDI2LDYgKzQzOCwxMCBAQCBzaWQ6IGVmdXNlQDMwMDYwMDAgewo+ICAJCQlyZWcgPSA8MHgz
MDA2MDAwIDB4MTAwMD47Cj4gIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAJCQkjc2l6ZS1j
ZWxscyA9IDwxPjsKPiArCj4gKwkJCXRoc19jYWxpYnJhdGlvbjogdGhlcm1hbC1zZW5zb3ItY2Fs
aWJyYXRpb25AMTQgewo+ICsJCQkJcmVnID0gPDB4MTQgMHg0PjsKPiArCQkJfTsKPiAgCQl9Owo+
ICAKPiAgCQljcnlwdG86IGNyeXB0b0AzMDQwMDAwIHsKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDog
ZWNhNjMxYjhmZTgwODc0OGQ3NTg1MDU5YzQzMDcwMDVjYTVjNTgyMAo+IGNoYW5nZS1pZDogMjAy
NTAyMjAtdGhlcm1hbC04MDNkZTlkYTBjZTYKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCgoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
