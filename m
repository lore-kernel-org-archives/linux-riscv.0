Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ACEC46CD8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 12:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x7DNAIhw/pDW6knXKtf7d4J+fwQANiyUgo7nIHKvKM4=; b=fn0QnkG7lMgLoBlpgm8vfq+Z0U
	UPGbpnwivy69OKW41q2SLN0rQSDHfUeWgT/9cZUfORbJQmN7JaQDAoIl/BlTMwsy5J2wGdcZlLjlO
	q4D/YzZduE3wKDEtpJQeuRkZEYx603jDPxjMQaJySzNYom1l2G5YosGkVGGkw9GCfc5x0Z+UwQRS0
	Bn2C05Xd6JlRKEMna4YCm2v4IzTt7/wB2fbDEXqmiIoXAGzVb1WZMd+hLl8BNekAO2Lufl2yUzOqt
	yy5sUx+nzvxhP02VQv3cG9cbKR1ve502QNS9eyU89IQpeuPrAAnmc72AxmFphMHKd+OCKDzRqDnYB
	sN9yoitg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGIAh-002lI1-21;
	Thu, 21 Dec 2023 12:29:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGIAd-002lBt-0N
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 12:29:02 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ED6F13F745
	for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703161732;
	bh=utwwjd3w/GTj0TOYQ7r9hzEA4xysvpOk2/pKVIn6Dd8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=o0Y1qE7SSizOuUdzD+hxBreLvt2cYZ7PqNbEBPcF4koTO8ZcoA0w38NPmaYZ29itI
	 QbSPzglds4NGzdaawgQwbFKBgQBE8srk8hbUkPe+CP4KdnkMXzQ0Sr3l4b6ISSdgdy
	 xPfpD0vZ83Ozl2CF2a0AzjbDciICk4Q1Q0/jq9laaHV/ZJ82+IePs3aJ1nwtKnVRql
	 tGDVCO4G8QPbSulJWobSnAZcojLTmkIHdKulsdLYSR6Bd0Eef/Q4sIf5tkrOBqhqca
	 yGAuVnU0cwIqrJaTTkjzxoUa/giYuxhYVMu6uf2hfcksN+fHVpcwm9N26znjgmC1mO
	 6GRM1/gm/IZ4Q==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77f55466facso118619485a.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 04:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703161727; x=1703766527;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utwwjd3w/GTj0TOYQ7r9hzEA4xysvpOk2/pKVIn6Dd8=;
        b=KFkgM0AJUlZjDikSUliItXWlcR63SlzCFR+YUTgxy176D7XKanjlzbWW2l5IoQGZT3
         nYR0F30bXB9CgBG27JYhH1VN48MXjt/cYIgn51FaNBkkUtnVebknFhk+nL/dTyl+2V3U
         TfFNFSsq2X0X3aJoDV4Cyn8m13XG4oQnaWYs8Xil2CkKfZjwK1GtdHUnHUQPknUzDWHE
         bQG+YGbsxQGfBZYe+wsoJ4FmzVtzrf7U57ZIdNSfvGoQhN/aBQEJRLsK2KiEfPoVKFRG
         5ub9Ijanppm0gJTekW+SZ15kWJXzDC2LbNGriVLJ2FebuRSoU1gwc5dfWSvH7B/dO8nU
         MzcA==
X-Gm-Message-State: AOJu0YzRyFbGN35m/7uXicKuV2YrbN4egZ3vjtOemJp422Wupu7g26qP
	nVtE/9wk28gOqFhhfI8qy/vjh5CnThAujMmOe25gdXSVxvoyf3ttvJLqqYO/V/QOKxYs/C76wFZ
	3Rz+8HIU8kTSXhOAfkGgOx53ZJPp4T0o6dAWPpjA66Ydsz/mOX5//ERcgjFD/xenoN6Iw
X-Received: by 2002:a05:620a:3dc:b0:77e:ffcd:2728 with SMTP id r28-20020a05620a03dc00b0077effcd2728mr897523qkm.53.1703161727446;
        Thu, 21 Dec 2023 04:28:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB2Dun85XQ6cgWOoZpoJaB/RapIEzw1KjVwm/JtqPitqqKxcRJWcJjtxi1b+wBY8zYrCiPA/YZeVrH74MD5jI=
X-Received: by 2002:a05:620a:3dc:b0:77e:ffcd:2728 with SMTP id
 r28-20020a05620a03dc00b0077effcd2728mr897496qkm.53.1703161727167; Thu, 21 Dec
 2023 04:28:47 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Dec 2023 04:28:46 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CACRpkdYT+jf4=dk3Y9cwa_=aYCihVq93N-iT0RUbtT2-+PX69w@mail.gmail.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
 <20231215202137.GA317624-robh@kernel.org> <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
 <CACRpkdYT+jf4=dk3Y9cwa_=aYCihVq93N-iT0RUbtT2-+PX69w@mail.gmail.com>
Mime-Version: 1.0
Date: Thu, 21 Dec 2023 04:28:46 -0800
Message-ID: <CAJM55Z8osSFxKi_7=aRkEr+U3vAq0TS93OggnRzyPpssNuuJ3Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Linus Walleij <linus.walleij@linaro.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_042859_298095_64C57E65 
X-CRM114-Status: GOOD (  17.51  )
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

TGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBTYXQsIERlYyAxNiwgMjAyMyBhdCAyOjU34oCvUE0g
RW1pbCBSZW5uZXIgQmVydGhpbmcKPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNv
bT4gd3JvdGU6Cj4KPiA+ID4gPiArICAgICAgICAgIHRoZWFkLHN0cm9uZy1wdWxsLXVwOgo+ID4g
PiA+ICsgICAgICAgICAgICBvbmVPZjoKPiA+ID4gPiArICAgICAgICAgICAgICAtIHR5cGU6IGJv
b2xlYW4KPiA+ID4gPiArICAgICAgICAgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgZW51bTogWyAwLCAy
MTAwIF0KPiA+ID4gPiArICAgICAgICAgICAgZGVzY3JpcHRpb246IEVuYWJsZSBvciBkaXNhYmxl
IHN0cm9uZyAyLjFrT2htIHB1bGwtdXAuCj4gPiA+Cj4gPiA+IGJpYXMtcHVsbC11cCBjYW4gYWxy
ZWFkeSBzcGVjaWZ5IHRoZSBzdHJlbmd0aCBpbiBPaG1zLgo+ID4KPiA+IFRoZSBzdHJvbmcgcHVs
bCB1cCBpcyBhIHNlcGFyYXRlIGJpdCB0aGF0IGNhbiBiZSBlbmFibGVkIGluZGVwZW5kZW50bHkg
ZnJvbSB0aGUKPiA+IHJlZ3VsYXIgcHVsbC11cC9kb3duLCBzbyBpbiB0aGVvcnkgeW91IGNvdWxk
IGVuYWJsZSBib3RoIHRoZSByZWd1bGFyIHB1bGwtdXAKPiA+IGFuZCB0aGUgc3Ryb25nIHB1bGwt
dXAgYXQgdGhlIHNhbWUgdGltZSwgb3IgZXZlbiB0aGUgcmVndWxhciBwb2xsLWRvd24gYW5kIHRo
ZQo+ID4gc3Ryb25nIHB1bGwtdXAgd2hpY2ggaXMgcHJvYmFibHkgbm90IGFkdmlzZWQuCj4KPiBi
aWFzLXB1bGwtdXA7IDwtIEp1c3QgcmVndWxhciBwdWxsaW5nIHVwIHRoZSBvcmRpbmFyeQo+IGJp
YXMtcHVsbC11cCA9IDwxMDA+OyA8LSBTYW1lIHRoaW5nIGlmIHRoZSBvcmRpbmFyeSBpcyAxMDAg
T2htIChmaWd1cmUgb3V0IHdoYXQKPiAgIHJlc2lzdGFuY2UgaXQgYWN0dWFsbHkgaXMuLi4uKQo+
IGJpYXMtcHVsbC11cCA9IDwyMTAwMDAwMD47IDwtIHN0cm9uZyBwdWxsIHVwCj4gYmlhcy1wdWxs
LXVwID0gPDIxMDAwMTAwPjsgPC0gYm90aCBhdCB0aGUgc2FtZSB0aW1lCgpIbW0uLiB0aGUgdHdv
IHB1bGwtdXBzIGNvbWJpbmVkIHdvdWxkIGJlIGEgc3Ryb25nZXIgcHVsbC11cCwgZWcuIGxvd2Vy
CnJlc2lzdGFuY2UsIHJpZ2h0PyBTbyB5b3UnZCBuZWVkIHRvIGNhbGN1bGF0ZSBpdCB1c2luZwpo
dHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9TZXJpZXNfYW5kX3BhcmFsbGVsX2NpcmN1aXRz
I1Jlc2lzdGFuY2VfdW5pdHNfMgoKVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgZG9jdW1lbnRhdGlv
biBkb2Vzbid0IGFjdHVhbGx5IG1lbnRpb24gd2hhdCB3aWxsIGhhcHBlbgppZiB5b3UgY29tYmlu
ZSB0aGUgc3Ryb25nIHB1bGwtdXAgd2l0aCB0aGUgcmVndWxhciBiaWFzLiBNeSBiZXN0IGd1ZXNz
IGZvciB3aGF0CmhhcHBlbnMgaWYgeW91IGVuYWJsZSB0aGUgc3Ryb25nIHB1bGwtdXAgYW5kIHRo
ZSByZWd1bGFyIHB1bGwtZG93biBpcyB0aGF0IHlvdQpjcmVhdGUgYSBzb3J0IG9mIHZvbHRhZ2Ug
ZGl2aWRlci4gQnV0IGhvdyBkbyB5b3UgcmVwcmVzZW50IHRoYXQgYXMgYW4gT2htIHZhbHVlPwoK
V2Ugd291bGQga2luZCBvZiBoYXZlIHRvLCBvdGhlcndpc2UgdGhlIHBpbmNvbmZfZ2V0IGNhbGxi
YWNrcyBoYXZlIHN0YXRlcyB0aGF0Cml0IGNhbid0IHJlcHJlc2VudC4KCj4gPiBTbyB0aGUgaWRl
YSBoZXJlIHdhcyBqdXN0IHRvIG1ha2Ugc3VyZSB0aGF0IHlvdSBjYW4gZG8gZWcuCj4gPgo+ID4g
ICAgICAgICB0aGVhZCxzdHJvbmctcHVsbC11cCA9IDwwPjsKPiA+Cj4gPiB0byBtYWtlIHN1cmUg
dGhlIGJpdCBpcyBjbGVhcmVkLgo+Cj4gTm8gdXNlIGJpYXMtZGlzYWJsZTsgZm9yIHRoaXMuCj4K
PiBZb3VycywKPiBMaW51cyBXYWxsZWlqCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
