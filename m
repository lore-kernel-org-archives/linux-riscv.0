Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB45CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OchZTgrF3ck1CmvvNIe/Fo7LxRwk6k/E7wEilfacuQ=; b=AJUYB5OsqmWfUQ
	Zi2U9VSTiB8n0ypI58sUWZUV8G2RLx7rVC6Xql9/DPfbbECH9WwXRL6OM3OX0honPmvKlibSoPuUW
	Cq73I3zr47JbeJTzpzKISRUtykq81pbSwEWRIErPwnZbvQEddHzyV6xRk8XgQ33P8ndFUMUCiymey
	J9gXNp+fFYZJarJ2qTe2bxJjO7YaaMPRYmEGWnOgpHPfE2LstxFZECuAVWxGLbzMc897suO6TYUII
	fvISKmgX67IDY+eGdVUJt03xB2UZdvk41QcEC38UcXHMZh+HpMnnn0Q0X00w/gDsx7hOYVz7TgrOg
	oqVkn3SJcsXAFioCWNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYQZ-00000005xp9-05Fb;
	Thu, 14 May 2026 15:56:47 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYQT-00000005xn7-0REP
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 15:56:43 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7dbcb467f2bso7258897a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 08:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778774200; cv=none;
        d=google.com; s=arc-20240605;
        b=b05DLIO0lXym0YyKOhAqTf0cmi5I6xWDQKZ1mctxer4DRze81xHRi5DFAATInPyYpH
         ixAdaXktwMsbc+544J/f9B12/DgZV9GnUHxR0RPpX82Kh8IjD0IzES08fAZUDIDTJrxR
         sOzXQr1gjU0zbYDdsOoya/V7bmrybYVlNJSx6BQP5v1e3/ZeAMhr2aIwl2Nbo/+Vshcl
         7xhm3H+4JSvBT+wdHmmF62Wp21D2qZVPWdtmMLoB4V5HNtO/4sGaIXoGiIxb0QjUCcDA
         aUKIKFjHlr32hyEr+/q5UrIF/8hXIGbpoPX1F9QFz3JFdBYUFcdnMuutiEiUD+KCTQT4
         ycAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/uCT6HXYhjKb/dFCYEBtj0FV6pBWcX+E/ZnHhtNgfIE=;
        fh=9d2aS2uTIFrWWysh7vGGuvGaLZ1wa5x5QvlBVgfyAn8=;
        b=aSLK9szFCjJ/NK3639qT0GF3kKJOhqrxdFae25n4yWF1HfI885Hn0zr8KPGCcqbMnM
         UsYIPG05ACpi6F47Nrgxcoj/4fv9hLoaXJMIMrPgEJQ4llU665K6We/seAcmlaASWbfz
         +6GwdW3J/qbZF4gj/5d92yyU/F6Jq/NWGd1K8BWtfQ2YSr2eqT/h9mmFefTgo7xvfxC1
         s6Lv1waw9iKf9KhCZT+7zNkyVdWGrdY8Ks1YbHPSI13dNVXOyhM3xkLRDb1NKs41HYpS
         idNhNA1yOijs0dyAfk07bsLPX4c173PbTM77swLwOp16o30LZsqZKXuTuH4BxmcXVGqf
         ZfIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778774200; x=1779379000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uCT6HXYhjKb/dFCYEBtj0FV6pBWcX+E/ZnHhtNgfIE=;
        b=pvbdfxaJRnhj5sbktTLaZsh3RtHsAhbqQFEfcQgzHKudayWF/eTM4/rqlKb2kqHggL
         IR+adoWiEGn/eeATmh+Nw9PxHHAv2vas6ha8lWTsglNGxPgAPmu9aw1S9sb1P9WJUsAB
         VnMS7YY7EygQh7Sypp8fc3afsA25msxqyKgrlEeiwTgZYXxX8R4Qi1fY09G6/W6fheu9
         OE1+Ofhy49iSykSAE1I2xMtqpvDHG092ZY0cr5vqD4O3NkpmUjAoy294dXlOhmSmLE2q
         Kdu7YPItzXW71RuDr4XRABLBvS1kt8d4FFQHfXli8D5nAMiHbnvo1lmQh7mbC7hhRDAy
         st9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778774200; x=1779379000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/uCT6HXYhjKb/dFCYEBtj0FV6pBWcX+E/ZnHhtNgfIE=;
        b=Q6ACGPGmr4uZfHygzXf2okcHWxcfiKkUY8hNLjf0c1oQ5F3QYicKgxkbArvzNZwrhm
         8D26VZ6824wkthNUAt0sOJfOJRsFBv03jGHsZ+ND3pGLBSIQtJDKNhIdqKQfu7ypw4on
         HSF6tRhqNH6mzmCl4KW3pEbGs970RRXZNzKh5j30Gs11cXAgAZbUixb1s8Msk+SJ1fPG
         1KhQ21AoadFbR0uFdYqD/c/RiiR3RvcMqryIMS/ZB6FBFRTJSanyJNLgk+7col6Rar+D
         O/5rcPKTe4BBMVc+e3EUENQwWUNZeCrW2UpVbT46IN4bFY5RRAl+MsxdThH/PptsY++l
         7UfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Gt001z77hPjQj52Sz0rZ8T+5MKkK3Z7bAhnAO7wnjnfKePPjE7E7u8tgCzbxX4QExd4D4aJljgEBVcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnnasQ3WU+JWCIVwqr9lFWyu7XJkeQpcF65okspFKv/Cj+yp6q
	vr0vFFwEN+D8OsUXcC5i0flTuVfCeFxZX4ketazNBusL47GS77Q4qZQJRtQxdSU+WPkuIDuh8cA
	O9VHx2f3kNaOJA1uJJ6wwCRTkadh+/jZ1Tt1wOTTZNQ==
X-Gm-Gg: Acq92OFRFyiZMczQChSG2h1pzKM2YYaem8XbOJ01U+Tzk67Vud+VYUZPtv9ovOA1IhP
	3MHGdLav5rroAd63q/dh6ub5ZYUZA+OsJyMm56kOWSn/NbxbHixoJHLSioHJ5thn5pIaXt/Hz95
	t3iISrqS4jknoxA+ZGB0Xea4kbhbWofNrWBmjLpXWVI/yPvRJvitnWBuA8hLF7ExG+mEpl8b6nk
	PHGUC9bcAXkw8sja1ByO0oFKsdr3DMT6iC69KkHQrp4TY2Djq96hrv/rss64lIiYJaUHcFAfnXh
	UXlzEe0Mv2Ee0oLfcTDiPyCyR9Kda5iSMYIgad93CJxFPdzOQAgdHloOFT/2eqCs9IEP+dX0Vu4
	heS63XVLtsIFJR2QBhqoOrJ+v5Oz6x0a48oUTPQ==
X-Received: by 2002:a05:6820:81cb:b0:696:1cbd:27b2 with SMTP id
 006d021491bc7-69b78e1431cmr4290185eaf.29.1778774200112; Thu, 14 May 2026
 08:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260509114122.1868327-1-vulab@iscas.ac.cn>
In-Reply-To: <20260509114122.1868327-1-vulab@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 May 2026 21:26:27 +0530
X-Gm-Features: AVHnY4KnO5GP15bm8wpvO_qtJw6UtrK8AXTiAujoajkCIeV2BiTUAo8W-MSSrh4
Message-ID: <CAAhSdy0YEe802RXPbL9aAdVYqj7BCcTXBBmLNnWinHTFohjtGg@mail.gmail.com>
Subject: Re: [PATCH] riscv: KVM: Fix missing TLB flush on HENVCFG.PMM updates
To: Zishun Yi <vulab@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_085641_398168_0DD0A1C3 
X-CRM114-Status: GOOD (  19.09  )
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

T24gU2F0LCBNYXkgOSwgMjAyNiBhdCA1OjEx4oCvUE0gWmlzaHVuIFlpIDx2dWxhYkBpc2Nhcy5h
Yy5jbj4gd3JvdGU6Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIFJJU0MtViBQcml2aWxlZ2VkIElTQSBz
cGVjaWZpY2F0aW9uLCBpZiBoZW52Y2ZnLlBNTSBpcwo+IGNoYW5nZWQgZnJvbSBvciB0byBhIHZh
bHVlIHdoZXJlIChYTEVOLVBNTEVOKSBpcyBsZXNzIHRoYW4gdGhlIEdQQSB3aWR0aAo+IHN1cHBv
cnRlZCBieSB0aGUgaGdhdHAgdHJhbnNsYXRpb24gbW9kZSBvZiB0aGF0IGd1ZXN0LCBoeXBlcnZp
c29ycyBtdXN0Cj4gZXhlY3V0ZSBhbiBIRkVOQ0UuR1ZNQSB3aXRoIHJzMT14MC4KClRoZSBjaGFu
Z2UgYmVsb3cgaXMgdW5jb25kaXRpb25hbGx5IGRvaW5nIGxvY2FsIEhGRU5DRSB3aXRob3V0IGNo
ZWNraW5nCmlmIChYTEVOLVBNTEVOKSBpcyBsZXNzIHRoYW4gdGhlIEdQQS4KCj4KPiBDdXJyZW50
bHksIHdoZW4gYSBndWVzdCBkeW5hbWljYWxseSBjaGFuZ2VzIHBvaW50ZXIgbWFza2luZyBtb2Rl
IHZpYSB0aGUKPiBTQkkgRldGVCBleHRlbnNpb24sIGt2bV9zYmlfZndmdF9zZXRfcG9pbnRlcl9t
YXNraW5nX3BtbGVuKCkgZGlyZWN0bHkKPiBtb2RpZmllcyB0aGUgaGFyZHdhcmUgQ1NSX0hFTlZD
RkcgZnJvbSB0aGUgbm9uLW9uZS1yZWctYWNjZXNzIHBhdGgKPiB3aXRob3V0IGlzc3VpbmcgdGhl
IHJlcXVpcmVkIFRMQiBpbnZhbGlkYXRpb24KPgo+IEZpeCB0aGlzIGJ5IGFkZGluZyBhbiB1bmNv
bmRpdGlvbmFsIEhGRU5DRS5HVk1BIGFmdGVyIHRoZSBDU1Igd3JpdGUuCj4KPiBUaGlzIHZ1bG5l
cmFiaWxpdHkgd2FzIGRpc2NvdmVyZWQgYW5kIHJlcG9ydGVkIGJ5IG15IFNwZWNIdW50ZXIsIGFu
Cj4gQUktZHJpdmVuIGFyY2hpdGVjdHVyZSBzcGVjaWZpY2F0aW9uIGFuYWx5c2lzIHRvb2wuCj4K
PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20veWl6aXNodW4vcnYtaXNhLXNlYy9ibG9iL21hc3Rl
ci9vdXRwdXQvcmlzY3YtaXNhLW1hbnVhbC9wci0yNDk0L2xpbnV4LnR4dAo+IEZpeGVzOiA0OGQ2
NzEwNmY0YTcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IE9ORV9SRUcgaW50ZXJmYWNlIGZvciBT
QkkgRldGVCBzdGF0ZSIpCj4gQXNzaXN0ZWQtYnk6IERlZXBTZWVrOkRlZXBTZWVrLVY0LVBybwo+
IFNpZ25lZC1vZmYtYnk6IFppc2h1biBZaSA8dnVsYWJAaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4g
aW5kZXggMmVhYjE1MzM5Njk0Li5jMmJkM2FlNjk5ZmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndm
dC5jCj4gQEAgLTE4Niw4ICsxODYsMTAgQEAgc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9w
b2ludGVyX21hc2tpbmdfcG1sZW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICog
dXBkYXRlIGhlcmUgc28gdGhhdCBWQ1BVIHNlZSdzIHBvaW50ZXIgbWFza2luZyBtb2RlIGNoYW5n
ZQo+ICAgICAgICAgICogaW1tZWRpYXRlbHkuCj4gICAgICAgICAgKi8KPiAtICAgICAgIGlmICgh
b25lX3JlZ19hY2Nlc3MpCj4gKyAgICAgICBpZiAoIW9uZV9yZWdfYWNjZXNzKSB7Cj4gICAgICAg
ICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNGRywgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyk7
Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3ZtYV9hbGwoKTsKPiAr
ICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIFNCSV9TVUNDRVNTOwo+ICB9Cj4gLS0KPiAyLjUx
LjIKPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
