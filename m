Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92533D43FEC
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMHRIkyEipkQLGuNBXfHTJGQRUL97Gre9lsjKw94tUo=; b=oMVuwJgS0AZqg1
	n42GqQzXt2zPtj6/rFPV0muR9arKTAzHcmEq8Va/ERJ4lU2QVfukkLq/bc3PRAfEGgyV1qpdupOgN
	6pWHzwQsGfGHaUnFoo55sAhQA6e/QiVDMeSwhTUBEJSkoF+APh8diTZdMfUVJZXUrukDl5YAnLylO
	VviXgekx5muMvJdEqExqRK57OZAZVyYcMHrUYxl9tAkPNsZ87ahqrPU8fO84yzt3kGBlxQsRAeNTH
	Aixg4iutoa9kUYDSO+/habJIjCQlI7RYIyP3mOoEDhV3P0YSmiyZtgtov3G+/qycDDP2PZsMXRdIn
	Xn3MdNwe5gj24vCjIyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwzA-00000008kUn-11qD;
	Mon, 18 Nov 2024 08:19:52 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwz3-00000008kS1-35cT
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 08:19:49 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ff5d2b8f0eso26732771fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 00:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731917983; x=1732522783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL7DR0MIchN4jc3101S2uCnxiU21n65mb2bnlMUb1eI=;
        b=aWY3dAfAq9Y0Vsl4HeRaM+YKH+B37gwaRs4B2TTLZSIpyJr0hssXPm3cnqTaji83f2
         9YZ1WR0V9DoIet2VjNYmYbzR5La1BAGxSS6V/YixWAcyZR1DkXbe4ZDqRuyouZGw5WGg
         W0IEOiTUxLV0CeGzbo68UYW4wtRCVhoc7skLx5SswxTxhXH3cYsg7XYUYU8miOwyWlc5
         4PWtUJSqC5ByvNa0/QoJ5yenFEnjZMQZY/fefhRohhBbYjxX/niG6kWdAJ65IQYf+ENt
         ICWZtQIxnby0i3ODLqPWki/0Vhahe5KO1f4LZtvUSTB9F2Naxl7geCW0JVodlWHWEvax
         PFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731917983; x=1732522783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL7DR0MIchN4jc3101S2uCnxiU21n65mb2bnlMUb1eI=;
        b=Y0W+hqjboYr/ANK+Q4A6Gu3pXpRjFX0ftxI63oUpLpGyTkk1NYj7+sHKh/p/e5Jxyv
         e6U5Zz/NwNxsITMRPp9PYCGVdG0CudNHQkSAZ082txZKwJequDVV5G65+F0zTyhJCMcw
         QVAH/pmE1y/ln49XWgdP0x9UUX7V3sdYozzWfrLGGHZJ/nDvJ0z1l3DRFMQhtw5ktVAE
         wdvZY7A6DiBZS0A2M3vy9jRsB9ZuV1YtcWFAsBw30nf4OhucaLm9NLHPtPxCuXV3EQbq
         GgGPgz0WzuvFaSpq+NsUtWRdwPnwD9xS8MSgqC6/87WAHfH0xXzEpWYn68391xSq0yVu
         aH7A==
X-Forwarded-Encrypted: i=1; AJvYcCUkqmc74PtbQvpcFWuPiAwYN4v7Qu/zROiImW54hFpopjJ6c4yRoJKOx1WdPcF9xHair11R/C1XA0Puew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP+KHcy5uOGGLDl0AoX8jMmBAYEMaaFsAvbOIW9vy7+AtbOVF3
	Cxn7WtydY/sy/wiUil0UBVnyT2C7crpxBwhgV3w2tZQwbX8gq53d/okfw66umcvxQjutBFFfIz8
	9QUt9ne2Tbq7bHu6g3/tWXeQx/poO54/QHM7T0A==
X-Google-Smtp-Source: AGHT+IFXxdjAQMxTzCz3q+UeUM/d1USw2cxgN6NHZjIuS69HTBTqTrNdF+5KD3y49qtYeM/ku7bbpPeQGQ/qf4pmM7A=
X-Received: by 2002:a2e:a9a9:0:b0:2fb:3ca8:efcd with SMTP id
 38308e7fff4ca-2ff6062afebmr44153871fa.12.1731917982723; Mon, 18 Nov 2024
 00:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20241114200133.3069460-1-samuel.holland@sifive.com>
 <CAK9=C2UyfmHqtYYK-WeSRk3=6bjs5nzDmw9ntudbCnPOYxLtXg@mail.gmail.com> <1bce34c6-c2d0-4b2b-a8f9-7bc8737702b1@sifive.com>
In-Reply-To: <1bce34c6-c2d0-4b2b-a8f9-7bc8737702b1@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Nov 2024 13:49:31 +0530
Message-ID: <CAK9=C2UUq=k9JHrO9zeiPhdmakyzigm9ToQFM2S90bQs31=98w@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: Fix crash when MSI domain is missing
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_001945_776445_9392CC8B 
X-CRM114-Status: GOOD (  32.90  )
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

T24gRnJpLCBOb3YgMTUsIDIwMjQgYXQgOToyN+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDI0LTExLTE1
IDk6NDIgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIE5vdiAxNSwgMjAyNCBhdCAx
OjMx4oCvQU0gU2FtdWVsIEhvbGxhbmQKPiA+IDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3
cm90ZToKPiA+Pgo+ID4+IElmIHRoZSBBUExJQyBkcml2ZXIgaXMgcHJvYmVkIGJlZm9yZSB0aGUg
SU1TSUMgZHJpdmVyLCB0aGUgcGFyZW50IE1TSQo+ID4+IGRvbWFpbiB3aWxsIGJlIG1pc3Npbmcs
IHdoaWNoIGNhdXNlcyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbgo+ID4+IG1zaV9jcmVh
dGVfZGV2aWNlX2lycV9kb21haW4oKS4gQXZvaWQgdGhpcyBieSBkZWZlcnJpbmcgcHJvYmUgdW50
aWwgdGhlCj4gPj4gcGFyZW50IE1TSSBkb21haW4gaXMgYXZhaWxhYmxlLiBVc2UgZGV2X2Vycl9w
cm9iZSgpIHRvIGF2b2lkIHByaW50aW5nIGFuCj4gPj4gZXJyb3IgbWVzc2FnZSB3aGVuIHJldHVy
bmluZyAtRVBST0JFX0RFRkVSLgo+ID4KPiA+IFRoZSAtRVBST0JFX0RFRkVSIGlzIG5vdCBuZWVk
ZWQgYmVjYXVzZSB3ZSBleHBlY3QgdGhhdCBwbGF0Zm9ybXMgdG8KPiA+IHVzZSAibXNpLXBhcmVu
dCIgRFQgcHJvcGVydHkgaW4gQVBMSUMgRFQgbm9kZSB3aGljaCBpbi10dXJuIGFsbG93cyBMaW51
eAo+ID4gREQgZnJhbWV3b3JrIHRvIHJlLW9yZGVyIHByb2JpbmcgYmFzZWQgb24gZndfZGV2bGlu
ayBkZXBlbmRlbmNpZXMuIFRoZQo+ID4gQVBMSUMgRFQgYmluZGluZ3MgbWFuZGF0ZXMgdGhhdCBh
bnkgb2YgImludGVycnVwdC1leHRlbmRlZCIgb3IgIm1zaS1wYXJlbnQiCj4gPiBEVCBwcm9wZXJ0
aWVzIE1VU1QgYmUgcHJlc2VudC4KPiA+Cj4gPiBDYW4geW91IGVsYWJvcmF0ZSBhIGJpdCBtb3Jl
IG9uIGhvdyB5b3UgYXJlIGhpdHRpbmcgdGhpcyBpc3N1ZSA/Cj4KPiBJIGFncmVlIHRoYXQgZndf
ZGV2bGluayBzaG91bGQgaGVscCBhdm9pZCB0aGUgc2l0dWF0aW9uIHdoZXJlIHdlIG5lZWQgdG8g
cmV0dXJuCj4gLUVQUk9CRV9ERUZFUiwgYnV0IHRoZSBrZXJuZWwgbXVzdCBzdGlsbCBub3QgY3Jh
c2ggZXZlbiBpZiBmd19kZXZsaW5rIGlzCj4gZGlzYWJsZWQgKHdoaWNoIGlzIGEgcGVyZmVjdGx5
IHZhbGlkIHRoaW5nIHRvIGRvOiAiZndfZGV2bGluaz1vZmYiIG9uIHRoZSBrZXJuZWwKPiBjb21t
YW5kIGxpbmUpIG9yIGlmIGZ3X2RldmxpbmsgZmFpbHMgdG8gY29tZSB1cCB3aXRoIHRoZSBpZGVh
bCBwcm9iZSBvcmRlci4KPiBmd19kZXZsaW5rIGlzIGFuIG9wdGltaXphdGlvbi4gSXQgc2hvdWxk
IG5vdCBiZSByZWxpZWQgb24gZm9yIGNvcnJlY3RuZXNzLiBJbiBteQo+IHNwZWNpZmljIGNhc2Us
IGZ3X2RldmxpbmsgZ290IHRoZSBvcmRlciB3cm9uZyBkdWUgdG8gc29tZSBmYWxzZSBkZXBlbmRl
bmN5Cj4gY3ljbGVzLCB3aGljaCBJIHNlbnQgYSBwYXRjaCBmb3Igc2VwYXJhdGVseVsxXS4KClRo
ZSBSSVNDLVYga2VybmVsIGlzIGhlYXZpbHkgZGVwZW5kZW50IG9uIGZ3X2RldmxpbmsgYmFzZWQg
cHJvYmUgb3JkZXJpbmcKYW5kIG1vcmUgdXBjb21pbmcgZHJpdmVycyBhcmUgZ29pbmcgdG8gaW5j
cmVhc2UgdGhpcyBkZXBlbmRlbmN5LgpGb3IgZXhhbXBsZSwgd2UgYWxzbyBoYXZlIFJJU0MtViBJ
T01NVSBkcml2ZXIgdGhhdCBuZWVkcyB0byBiZSBwcm9iZWQKYWZ0ZXIgSU1TSUMgc2luY2UgaXQg
Y2FuIHVzZSBNU0lzLgoKSSB0aGluayB3ZSBzaG91bGQgZW5zdXJlIHRoYXQgZndfZGV2bGluayBj
YW4ndCBiZSBkaXNhYmxlZC90dXJuZWQtb2ZmIGZvciB0aGUKUklTQy1WIGtlcm5lbC4gSWYgdGhp
cyBpcyBub3QgcG9zc2libGUgdGhlbiB3ZSBzaG91bGQgaGF2ZSB2ZXJ5IHZlcmJvc2UKYm9vdC10
aW1lIHdhcm5pbmcgd2hlbiBmd19kZXZsaW5rIGlzIGRpc2FibGVkL3R1cm5lZC1vZmYuCgpZb3Vy
IG90aGVyICJpbnRlcnJ1cHQtcGFyZW50IiByZWxhdGVkIGZpeCBbMV0gbG9va3MgZmluZSB0byBt
ZS4KClJlZ2FyZHMsCkFudXAKCj4KPiBSZWdhcmRzLAo+IFNhbXVlbAo+Cj4gWzFdOgo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDExMTQxOTU2NTIuMzA2ODcyNS0xLXNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20vCj4KPiA+PiBGaXhlczogY2E4ZGY5N2ZlNjc5ICgiaXJxY2hpcC9y
aXNjdi1hcGxpYzogQWRkIHN1cHBvcnQgZm9yIE1TSS1tb2RlIikKPiA+PiBTaWduZWQtb2ZmLWJ5
OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiA+PiAtLS0KPiA+
Pgo+ID4+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYyB8IDMgKystCj4g
Pj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMgIHwgMyArKysKPiA+PiAg
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCj4gPj4gaW5kZXggOTAwZTcyNTQx
ZGI5Li45M2U3YzUxZjk0NGEgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1hcGxpYy1tYWluLmMKPiA+PiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFw
bGljLW1haW4uYwo+ID4+IEBAIC0yMDcsNyArMjA3LDggQEAgc3RhdGljIGludCBhcGxpY19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+ICAgICAgICAgZWxzZQo+ID4+ICAg
ICAgICAgICAgICAgICByYyA9IGFwbGljX2RpcmVjdF9zZXR1cChkZXYsIHJlZ3MpOwo+ID4+ICAg
ICAgICAgaWYgKHJjKQo+ID4+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0
byBzZXR1cCBBUExJQyBpbiAlcyBtb2RlXG4iLCBtc2lfbW9kZSA/ICJNU0kiIDogImRpcmVjdCIp
Owo+ID4+ICsgICAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKGRldiwgcmMsICJmYWlsZWQgdG8g
c2V0dXAgQVBMSUMgaW4gJXMgbW9kZVxuIiwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtc2lfbW9kZSA/ICJNU0kiIDogImRpcmVjdCIpOwo+ID4+Cj4gPj4gICNpZmRlZiBDT05G
SUdfQUNQSQo+ID4+ICAgICAgICAgaWYgKCFhY3BpX2Rpc2FibGVkKQo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1hcGxpYy1tc2kuYwo+ID4+IGluZGV4IDk0NWJmZjI4MjY1Yy4uZmI4ZDE4Mzg2
MDlmIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNp
LmMKPiA+PiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gPj4g
QEAgLTI2Niw2ICsyNjYsOSBAQCBpbnQgYXBsaWNfbXNpX3NldHVwKHN0cnVjdCBkZXZpY2UgKmRl
diwgdm9pZCBfX2lvbWVtICpyZWdzKQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICht
c2lfZG9tYWluKQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X3NldF9t
c2lfZG9tYWluKGRldiwgbXNpX2RvbWFpbik7Cj4gPj4gICAgICAgICAgICAgICAgIH0KPiA+PiAr
Cj4gPj4gKyAgICAgICAgICAgICAgIGlmICghZGV2X2dldF9tc2lfZG9tYWluKGRldikpCj4gPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gPj4gICAgICAg
ICB9Cj4gPj4KPiA+PiAgICAgICAgIGlmICghbXNpX2NyZWF0ZV9kZXZpY2VfaXJxX2RvbWFpbihk
ZXYsIE1TSV9ERUZBVUxUX0RPTUFJTiwgJmFwbGljX21zaV90ZW1wbGF0ZSwKPiA+PiAtLQo+ID4+
IDIuNDUuMQo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+IGxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
