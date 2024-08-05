Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19CFC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 02:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHj+t3SEPXQblMDOEFlgNCHIiNh9LFPtPV+462aN9Mc=; b=XG6dFFai0WFRvS
	z1CUXKlQocs4wlVityoMZxICw1R8jslu2QTlXIUw5ucWEmcpIO5+svsiOP0UapcWXcj65AJx0N4cr
	rKQJYYaM9qurmvaLc1Hw7YdsamLAwV4k/CANfW6eEIGwLtKSjM5j/ocyqjpMNzDN6+M7F2ePBwtbB
	M9grCFG/b/au2jcR9WvH4sANN51eX9empzvJiK3qJok1vtoyWndD2j75Jsoj7Gbf5XRtX+me3obBw
	9D3rgVDe2wCngSMy577bUDv6mdItTXeKEsl0WVjJHHDFSl+MtHEkA+7nn/WjZuFtnDb9tM/tERh2x
	SO7DJVRggc/Gg/1KQGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sanh3-0000000EPJx-0qT4;
	Mon, 05 Aug 2024 02:43:29 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sanh0-0000000EPJH-0EuQ
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 02:43:27 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4ef33a09a3aso2820961e0c.2
        for <linux-riscv@lists.infradead.org>; Sun, 04 Aug 2024 19:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722825804; x=1723430604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RUbuXruRNtWApv98U15wtspxV+T0FPx34KxK0+1UN0=;
        b=jSoHiHuOdsi2u4cZvJVjrss8v6ZGvMukg2+COa3Q8iug7UAKZd12ytNlVBA7J+cXvJ
         Ipos8OAQJUeoFTAEoc3jrBSwF0z+Z8B5AQ26yEZ7gR25jnphPaQDqJdi+Ntc3J5+Xnuv
         Vec+j5wwk8PGCBeFFIzMABIRzCap8ty8JbXH3U2IEj1Pin8i7CkGs1ruHGS7wXOWkAJK
         ItPJwU2piL3EuRYOkVThbU6KDyc59ncH7aRkYcVXZgT/FDUk3khxI5Ama0DlYz6NdLkL
         9ZbOkDe+I3VYKDRN1hIqxmuurM2xIXb8mPd1sGzKwl+AZs5tVs4aD99NjdiaHQ3VgJq/
         ObAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722825804; x=1723430604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RUbuXruRNtWApv98U15wtspxV+T0FPx34KxK0+1UN0=;
        b=eImA2M5t3rGVnaI9Fo3hz5yH9SGXJ2y0Y2wQQSAVFttrGRQFHi+NZnMjV9zc204Le3
         P55F8mFOxM6PNBB3ErW18dYFoCxL53hJ/bs4JfER3o7OjpxBWz8SBehXh0Gccr/MzAOA
         r/C2c4KJ3zXwb3HghnRc0qRfl3yT54j0CRCYnx7x48ZxBXHqPESAm1H1fg6RVl/o5/Tb
         Bv2Sji1cBiW1GmvJNkxn8XdzGeWV0zE2+dQGqJJ9ZJn6LUnIYfv656daVA7o9QW74sp6
         oMCapwT3ODGymxwVmF73EFow7bbpJXZfyIvfUzzPXvvqyRAKOPvzRvCDuoAIXFGK8xFX
         fhAw==
X-Forwarded-Encrypted: i=1; AJvYcCVkovfPlHpPqGY6VnRqF8TaB+roKNha/ztd4xLJnAURQ9W6F2vRsc4JlgVTRCEO3b8JMJX0rZ4pPzKlsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8pY7yTnkcYM33zOCsMx+hicEei5LgWyFVxoM1uzRYJLihHAOO
	sSHnL/VD0tA0ADmKWq606wNeYW6Kkq1gy9y7Auo+QjyOaEbbP4UmaWr+U+5O4o7OfjS+toQ1eKj
	VPrwdjMXFzdiNM9FkN2q6bPIlOsa/Jp2SEuRlGdDO3A/CghyYbYQ=
X-Google-Smtp-Source: AGHT+IFatLCWN4zrFNBHE1t5jL8w0qqILbkTgFOCDN0JsQgmZ98A50+LWII2Fcw05mlKNHwYXyzA3S7DZAKol9OE0rk=
X-Received: by 2002:a05:6122:4692:b0:4ec:f6f2:f1cd with SMTP id
 71dfb90a1353d-4f8a00189b6mr8055589e0c.9.1722825803776; Sun, 04 Aug 2024
 19:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240802075741.316968-1-vincent.chen@sifive.com> <CAAhSdy3yx=mm3M6U_Q+_WdMs12SGCypPgNkBAVc9Kwn9jgev6g@mail.gmail.com>
In-Reply-To: <CAAhSdy3yx=mm3M6U_Q+_WdMs12SGCypPgNkBAVc9Kwn9jgev6g@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 5 Aug 2024 10:43:12 +0800
Message-ID: <CABvJ_xgcbyQKa1+U1MC7cLEB-SUzzNaWqKdXFp+13mni0YSvNw@mail.gmail.com>
Subject: Re: [PATCH] irqchip: let the probe of APLIC be earlier than IMSIC
To: Anup Patel <anup@brainfault.org>
Cc: tglx@linutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_194326_129612_7831AE54 
X-CRM114-Status: GOOD (  28.34  )
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCA3OjAz4oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAyLCAyMDI0IGF0IDE6MjfigK9QTSBWaW5j
ZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBXaGVuIHRo
ZSBkZWJ1ZyBtZXNzYWdlIG9mIGRyaXZlci9iYXNlL2RkLmMgaXMgZW5hYmxlZCwgdGhlIGZvbGxv
d2luZwo+ID4gZXJyb3IgbWVzc2FnZXMgYXJlIHByZXNlbnQgaW4gdGhlIGJvb3QgbG9nOgo+ID4K
PiA+IFsgICAgMC4yMDc5NDFdIHBsYXRmb3JtIGQwMDAwMDAuYXBsaWM6IGVycm9yIC1FUFJPQkVf
REVGRVI6IHN1cHBsaWVyCj4gPiAyODAwMDAwMC5pbXNpY3Mgbm90IHJlYWR5Cj4gPiBbICAgIDAu
MjA4MTE1XSBwbGF0Zm9ybSBkMDAwMDAwLmFwbGljOiBBZGRlZCB0byBkZWZlcnJlZCBsaXN0Cj4K
PiBXZSBhcmUgcmVseWluZyBvbiBmd19kZXZsaW5rIGltcGxlbWVudGVkIGJ5IExpbnV4IEREIGNv
cmUgdG8gZG8gdGhlCj4gcHJvYmUgb3JkZXJpbmcuIFRoZSBhYm92ZSBwcm9iZXIgZGVmZXIgbWVz
c2FnZSBpbXBsaWVzIHRoYXQgdGhlCj4gTGludXggREQgY29yZSBpcyBkb2luZyBpdHMgam9iIGNv
cnJlY3RseS4KPgo+ID4KPiA+IFRoZSByZWFzb24gZm9yIHRoaXMgZXJyb3IgbWVzc2FnZSBpcyB0
aGF0IHRoZSBwcm9iZSBvZiBBUExJQyBpcyBleGVjdXRlZAo+ID4gZWFybGllciB0aGFuIElNU0lD
LiBUaGlzIGVycm9yIGFsc28gY2F1c2VzIGFsbCB0aGUgcGxhdGZvcm0gZGV2aWNlcwo+ID4gY29u
bmVjdGVkIHRvIHRoZSBBUExJQyB0byBiZSBhZGRlZCB0byB0aGUgZGVmZXJyZWQgbGlzdC4gQmVj
YXVzZSBib3RoCj4gPiBBUExJQyBhbmQgSU1TSUMgYXJlIHJlZ2lzdGVyZWQgYnkgZGV2aWNlX2lu
aXRjYWxsLCB0aGlzIHBhdGNoIGFkanVzdHMgdGhlCj4gPiBjb21waWxlIG9yZGVyIG9mIEFQTElD
IGFuZCBJTVNJQyB0byBlbnN1cmUgdGhhdCB0aGUgcHJvYmUgb2YgSU1TSUMgaXMKPiA+IGV4ZWN1
dGVkIGVhcmxpZXIgdGhhbiB0aGUgcHJvYmUgb2YgQVBMSUMuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvaXJxY2hpcC9NYWtlZmlsZSB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFj
aGlwL01ha2VmaWxlIGIvZHJpdmVycy9pcnFjaGlwL01ha2VmaWxlCj4gPiBpbmRleCAxNTYzNTgx
MmIyZDYuLjNjMDk2NjY1NjlkNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9NYWtl
ZmlsZQo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL01ha2VmaWxlCj4gPiBAQCAtOTYsOSArOTYs
OSBAQCBvYmotJChDT05GSUdfUUNPTV9NUE0pICAgICAgICAgICAgICAgICAgICAgICAgKz0gaXJx
LXFjb20tbXBtLm8KPiA+ICBvYmotJChDT05GSUdfQ1NLWV9NUElOVEMpICAgICAgICAgICAgICAr
PSBpcnEtY3NreS1tcGludGMubwo+ID4gIG9iai0kKENPTkZJR19DU0tZX0FQQl9JTlRDKSAgICAg
ICAgICAgICs9IGlycS1jc2t5LWFwYi1pbnRjLm8KPiA+ICBvYmotJChDT05GSUdfUklTQ1ZfSU5U
QykgICAgICAgICAgICAgICArPSBpcnEtcmlzY3YtaW50Yy5vCj4gPiArb2JqLSQoQ09ORklHX1JJ
U0NWX0lNU0lDKSAgICAgICAgICAgICAgKz0gaXJxLXJpc2N2LWltc2ljLXN0YXRlLm8gaXJxLXJp
c2N2LWltc2ljLWVhcmx5Lm8gaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLm8KPiA+ICBvYmotJChD
T05GSUdfUklTQ1ZfQVBMSUMpICAgICAgICAgICAgICArPSBpcnEtcmlzY3YtYXBsaWMtbWFpbi5v
IGlycS1yaXNjdi1hcGxpYy1kaXJlY3Qubwo+ID4gIG9iai0kKENPTkZJR19SSVNDVl9BUExJQ19N
U0kpICAgICAgICAgICs9IGlycS1yaXNjdi1hcGxpYy1tc2kubwo+ID4gLW9iai0kKENPTkZJR19S
SVNDVl9JTVNJQykgICAgICAgICAgICAgICs9IGlycS1yaXNjdi1pbXNpYy1zdGF0ZS5vIGlycS1y
aXNjdi1pbXNpYy1lYXJseS5vIGlycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5vCj4KPiBGaXJzdCBv
ZiBhbGwgdGhlcmUgaXMgbm8gaXNzdWUgaGVyZS4KPgoKSGkgQW51cCwKSSB1bmRlcnN0b29kIHRo
YXQgdGhlIGRlZmVyIG1lc3NhZ2UgaW1wbGllcyB0aGF0IHRoZSBMaW51eCBERCBjb3JlIGlzCmRv
aW5nIGl0cyBqb2IgY29ycmVjdGx5LiBJIGFsc28gYWdyZWUgd2l0aCB5b3UgdGhhdCB0aGVyZSBp
cyBubyBpc3N1ZQpoZXJlIGJlY2F1c2UgSSBzdGlsbCBjYW4gYm9vdCBrZXJuZWwgc3VjY2Vzc2Z1
bGx5LiBJIGp1c3QgaG9wZSB0aGlzCnByb2Nlc3MgYmVjb21lcyBzbW9vdGhlciBieSBhZGp1c3Rp
bmcgdGhlIHByb2JlIG9yZGVyIGJlY2F1c2UgdGhlCkFQTElDIHdpbGwgZGVwZW5kIG9uIElNU0lD
IHdoZW4gaXQgaXMgcHJlc2VudC4KCj4gU2Vjb25kbHksIGNoYW5naW5nIGNvbXBpbGF0aW9uIG9y
ZGVyIGluIE1ha2VmaWxlIHRvIGluZmx1ZW5jZQo+IHRoZSBwcm9iZSBvcmRlciB3aWxsIG5vdCBo
ZWxwIGluIGFueSB3YXkuCj4KSSB3YXMgY29uZnVzZWQgaGVyZS4gSWYgcG9zc2libGUsIGhvcGUg
eW91IGNhbiBoZWxwIG1lIGNsYXJpZnkgaXQuClRoZSBmb2xsb3dpbmcgaXMgdGhlIGJhY2t0cmFj
ZSBvZiByZWFsbHlfcG9yYmUoKSBkdW1wZWQgYnkgR0RCLgojMCAgMHhmZmZmZmZmZjgwOTIzMThh
IGluIHJlYWxseV9wcm9iZSAoKQojMSAgMHhmZmZmZmZmZjgwOTIzNTE2IGluIF9fZHJpdmVyX3By
b2JlX2RldmljZS5wYXJ0LjAgKCkKIzIgIDB4ZmZmZmZmZmY4MDU3Yzg1NiBpbiBkcml2ZXJfcHJv
YmVfZGV2aWNlICgpCiMzICAweGZmZmZmZmZmODA1N2M5YmEgaW4gX19kcml2ZXJfYXR0YWNoICgp
CiM0ICAweGZmZmZmZmZmODA1N2FhYTQgaW4gYnVzX2Zvcl9lYWNoX2RldiAoKQojNSAgMHhmZmZm
ZmZmZjgwNTdjM2VhIGluIGRyaXZlcl9hdHRhY2ggKCkKIzYgIDB4ZmZmZmZmZmY4MDU3YmM0YSBp
biBidXNfYWRkX2RyaXZlciAoKQojNyAgMHhmZmZmZmZmZjgwNTdkNzVhIGluIGRyaXZlcl9yZWdp
c3RlciAoKQojOCAgMHhmZmZmZmZmZjgwNTdlODNjIGluIF9fcGxhdGZvcm1fZHJpdmVyX3JlZ2lz
dGVyICgpCiM5ICAweGZmZmZmZmZmODBhMjQ1NWUgaW4gaW1zaWNfcGxhdGZvcm1fZHJpdmVyX2lu
aXQgKCkKIzEwIDB4ZmZmZmZmZmY4MDAwMjEyYyBpbiBkb19vbmVfaW5pdGNhbGwgKCkKIzExIDB4
ZmZmZmZmZmY4MGEwMTE4OCBpbiBrZXJuZWxfaW5pdF9mcmVlYWJsZSAoKQojMTIgMHhmZmZmZmZm
ZjgwOTI4ZDgwIGluIGtlcm5lbF9pbml0ICgpCgpBY2NvcmRpbmcgdG8gdGhpcyByZXN1bHQsIHRo
ZSBzb3VyY2UgdG8gY2FsbCByZWFsbHlfcHJvYmUgaXMKZG9fb25lX2luaXRjYWxsKCksIHJlZ2Fy
ZGxlc3Mgb2Ygd2hldGhlciBpdCBpcyBBUExJQyBvciBJTVNJQy4gVGhlCmRvX29uZV9pbml0Y2Fs
bCgpIGZ1bmN0aW9uIGZvbGxvd3MgdGhlIHBsYWNlZCBvcmRlciBvZiB0aGUKaW5pdGlhbGl6YXRp
b24gZnVuY3Rpb25zIGluIHRoZSBfX2luaXRjYWxsNiBzZWN0aW9uIHRvIGludm9rZSB0aGVtLgpU
aGUgY29tcGlsZSBvcmRlciBkZXRlcm1pbmVzIHRoZSBvcmRlciBvZiB0aGUgX19pbml0Y2FsbDYg
c2VjdGlvbi4KVGhlcmVmb3JlLCBJIHRyeSB0byBhZGp1c3QgdGhlIGNvbXBpbGUgb3JkZXIgdG8g
aW5mbHVlbmNlIHRoZSBwcm9iZQpvcmRlciBiZXR3ZWVuIElNU0lDIGFuZCBBUExJQy4gRG8gSSBt
aXN1bmRlcnN0YW5kIHNvbWV0aGluZz8KCgo+ID4gIG9iai0kKENPTkZJR19TSUZJVkVfUExJQykg
ICAgICAgICAgICAgICs9IGlycS1zaWZpdmUtcGxpYy5vCj4gPiAgb2JqLSQoQ09ORklHX1NUQVJG
SVZFX0pIODEwMF9JTlRDKSAgICAgKz0gaXJxLXN0YXJmaXZlLWpoODEwMC1pbnRjLm8KPiA+ICBv
YmotJChDT05GSUdfSU1YX0lSUVNURUVSKSAgICAgICAgICAgICArPSBpcnEtaW14LWlycXN0ZWVy
Lm8KPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4KPiBSZWdhcmRzLAo+IEFudXAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
