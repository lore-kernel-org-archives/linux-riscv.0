Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949C0D3F098
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ou4NSJQx0vza4tDGhrIphTHykfCePotiA9Y76ZTLL84=; b=NqCxtB8FUmW2Dh
	tz2Km0uwehV2cewK0MiNmsSFA9Gs9IaGcDjecWvvZmIksooUA0f9mAXK7Pw19m28wW4aOKtchiuNt
	BkxecmrLa0ER+l8S7dErbjioDtJ0xRzDheze9u/lUm/EeTGANdgLzzYJEdMeFlIzp0za7DyneFd0V
	PLWo7T1l+4CMYA9OG2Fm4/ip9PZri+T0LwRpGSAScz8MGCW0rmf5L9FpmDfTtYXkiXXKdbhrdQ0h/
	WNxdJgMbrMzs6D+setwsbkFrGW+4hiGzlE8fpX3pEY57HAnuEwlGR8kyG4udG9IwTP9erUH5UdZ6Z
	cdfmddGZbupSkr9tHI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8mc-0000000GQai-3aBg;
	Wed, 28 Jan 2026 16:52:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8mZ-0000000GQZw-1M9O
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 16:52:45 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29f102b013fso64546865ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 08:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769619162; cv=none;
        d=google.com; s=arc-20240605;
        b=OC3SEMuUBVNcHF01ZQra9DHecTHhytkKObhPQ8hrf5zXl2vdjZhjLh8shswXkYdwRp
         fFmVz2+QnPVjnVxmVW0Af1tPHxfucdfGrVBo2tSj7+3YLkOciNW29xN3JAxEdHkRo8Sz
         2doquyVazAMUrndmbUBshVgMbvqo42O0uk0R9D77XhERUjmFGPOLv3HAiuKwEUsHAGty
         qjLpnQ9dv1BryobSgChgo5SLC/PLo5einE39rwWpC35wU4h0xVVeJfu1MUa6OGzfzSP+
         OQ+DszO67bmoMvfPCDD5fXselfKb2gcBWOZ48W9+JarGSVwiirGvDay+WsLsUDzeIybh
         iLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        fh=/e5TsBGmkNTMdzr42TOjgw3YH2KNfVS8jK3IP136pbk=;
        b=N+z4w+hG9IlwhqOY4/AyuT1yoPgRdvq+KGZZdZqTGBhIlH39+KwdR6cS9lsotqOtXZ
         3+JEvxXX6yr+mkAyyucvVIcHcxTgRT+QhZzYlFwL0vZFj1hQ9wvqk0m83NQWxGh8fTSw
         iroDz4JiyASdDa7DhtuUNjKB77jPNDE++hhYZi/pWKcM58u8Jz/e+cWsYFItBWPUd/hu
         tgz5lg6+GifyROWHL+gG4aX/h4o9icwTF25ikBGGo0rCw1YUyRd8ojwTTihA8cI3RN9q
         XnDVjBmBupiFNG4myjNkyYmrH+afwonSSUY1Npjvye9f7baio2hw4NVV20zwvyGrRNUD
         YXlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769619162; x=1770223962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        b=I4pgcGmNdhOPl+RRkBJamW79e9+yy5ATKznN5EETEbpihjTDh7jVpjvfh/CBYunZOo
         e/C3dMQguGpoV2162BfILzCOtosmHb8H2EDwkQKV9iEE6bmMrxFREVBs2a66F7zCFfnL
         /xYuINOgb5/guekOqrkW7NOMxXgvX1IFUHSRyq4rlak5fYTUZJw63LJtlLycVxAQtVe2
         a4O+9FSuCy7IpmNydyZHzDIPXE58MtEgxfYIMaJslqswnw71gglkYY2y/EqAVM4HAmCm
         obu0Q4KuKm0G9AF80GWZ7CgZ0dpmZkHV85/iOVYEebG6yP/S4/JxyTFgpjADvUt+X2eu
         UqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769619162; x=1770223962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        b=N0oZXsoBoFVuC5sOUD/xcIdp+lviSYk3fTElUZCj8Uug38TyNO7xR0bAa15e0guaAB
         AuEK+b5RI9NkQbKHrIkWZ3C4Bis6N80OszEq9Wr76WycBBT9T+cx1o/OSIt2LtOrzOrj
         CZk5DHVPEAmS/KuGoH2/yv+9dkAKu/0FYxSmB2lcpjCHSJvp23DmtL79+ALkgROzYKNk
         bZJPLCxv2mF0RvbY+ivSFie2SXQEyZOT6mBPWt9YTPvijDan2oegYm0uY8XE9NoeYSq2
         8LzQWqn07OSb/uhlqbvaeQtAD99dxeU40qTeJA9yu5YPZ64sBxVUbYwbmuwdd332cPiM
         O8cg==
X-Forwarded-Encrypted: i=1; AJvYcCWJnVqRN8j7QldciGbMaiA9ULOcp4QEr/rWCVtu7j3n38Zpl/9HnDaS5A1vaD8ZSsR4bOI9s4sLxA3Irg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwdpSOSIywxQ/g6SHjRUjSOn5LbDzKvlxYJ7ymUTL47Eqxhk9b
	O5Hp10SxlqixcKKoRsLuwT8RBsQ1hXLSl2HZpZ/AA4Bkfvi2/x2D96GMPRqs/SIkpxBeG29GRSS
	G+n3qT6TQhqvIiQM1ZLlHdEY7N1lr2w==
X-Gm-Gg: AZuq6aIwJJXMaQkUnbBUVhD2qau4gKKUajmGo5x/LdzKC850NfQFfRG5dg09CTRTyxf
	AjRQyxUdv/mvE9q2mbqUUY0gGPCo43T1f2cIm4piTdzQaTCoQO0lhx+VcJvI5TJkNSFfzW11nSO
	5ZyeKxxZJvFsYRtWkyeAX1UQHT8nrbE2yVVGTEQlVGM2Ze3wAaoghaH/AacVyHynGv/UppNAzll
	s+q4gXi5HqG2E4wm5ouG8S8/pYJj6rYufdesZGjjPkUdVh8dSLRkja8wul5BCX2pctly+0n
X-Received: by 2002:a17:903:249:b0:2a5:99e9:569d with SMTP id
 d9443c01a7336-2a870d6483fmr54239625ad.18.1769619161524; Wed, 28 Jan 2026
 08:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20250427142500.151925-1-privatesub2@gmail.com> <aXJTqzZaBrCMnTvv@shepard>
In-Reply-To: <aXJTqzZaBrCMnTvv@shepard>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Wed, 28 Jan 2026 19:52:29 +0300
X-Gm-Features: AZwV_QjtfqpOuCyYtNE1xKe0593NpcMxJ89wFPIBopBcRc0tp-flqstJbbXGRk0
Message-ID: <CAF4idN=h9u2LX8Oa9_LcyM9ANUNtLbPTMyn_pHbZVBCXc5Orvg@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_085243_368722_2C312FF1 
X-CRM114-Status: GOOD (  27.46  )
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

SGkgUGF1bCwKClRoYW5rcyBhIGxvdCBmb3IgdGhlIGRldGFpbGVkIHJldmlldyBhbmQgZm9yIHRl
c3Rpbmcgb24gQTEzMyAtIGdyZWF0CnRvIGhlYXIgaXQgd29ya3MgdGhlcmUgYXMgd2VsbC4KCkdv
b2QgcG9pbnQgYWJvdXQgdGhlIG5hbWluZy4gSSBjYW4gcmVuYW1lIHRoZSBkcml2ZXIgdG8gc3Vu
OGktcHdtIGFuZApzZW5kIGEgbmV3IHBhdGNoIHNlcmllcy4KClRoYW5rcyBhZ2FpbiBmb3IgdGhl
IHBvaW50ZXJzIGFuZCB0aGUgY29udGV4dC4KClRoYW5rcyBhZ2FpbiwKQWxla3NhbmRyCgrRh9GC
LCAyMiDRj9C90LIuIDIwMjbigK/Qsy4g0LIgMTk6NDMsIFBhdWwgS29jaWFsa293c2tpIDxwYXVs
a0BzeXMtYmFzZS5pbz46Cj4KPiBIaSBBbGVrc2FuZHIsCj4KPiBPbiBTdW4gMjcgQXByIDI1LCAx
NzoyNCwgQWxla3NhbmRyIFNodWJpbiB3cm90ZToKPiA+IEFsZWtzYW5kciBTaHViaW4gKDMpOgo+
ID4gICBkdC1iaW5kaW5nczogcHdtOiBBZGQgYmluZGluZyBmb3IgQWxsd2lubmVyIEQxL1QxMTMt
UzMvUjMyOSBQV00KPiA+ICAgICBjb250cm9sbGVyCj4gPiAgIHB3bTogQWRkIEFsbHdpbm5lcidz
IEQxL1QxMTMtUzMvUjMyOSBTb0NzIFBXTSBzdXBwb3J0Cj4gPiAgIHJpc2N2OiBkdHM6IGFsbHdp
bm5lcjogZDE6IEFkZCBwd20gbm9kZQo+ID4KPiA+ICAuLi4vYmluZGluZ3MvcHdtL2FsbHdpbm5l
cixzdW4yMGktcHdtLnlhbWwgICAgfCAgODQgKysrKwo+ID4gIC4uLi9ib290L2R0cy9hbGx3aW5u
ZXIvc3VueGktZDFzLXQxMTMuZHRzaSAgICB8ICAxMiArCj4gPiAgZHJpdmVycy9wd20vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKPiA+ICBkcml2ZXJzL3B3bS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvcHdtL3B3
bS1zdW4yMGkuYyAgICAgICAgICAgICAgICAgICAgICB8IDM3OSArKysrKysrKysrKysrKysrKysK
PiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQ4NiBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYWxsd2lubmVyLHN1
bjIwaS1wd20ueWFtbAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3B3bS9wd20tc3Vu
MjBpLmMKPgo+IFRoYW5rcyBmb3IgeW91ciB3b3JrIG9uIHRoaXMgZHJpdmVyIQo+Cj4gRm9yIGNv
bnRleHQsIHRoaXMgUFdNIGNvbnRyb2xsZXIgc2VlbXMgdG8gYmUgYSBzZWNvbmQtZ2VuZXJhdGlv
biBkZXNpZ24gZnJvbQo+IEFsbHdpbm5lciwgd2hpY2ggaXMgZm91bmQgaW4gdGhlIGZvbGxvd2lu
ZyBjaGlwczogVjUsIEE1MCwgSDYxNiwgVjUzNiwgVDcsIEExMzMsCj4gVjgzMywgUjMyOSwgRDEv
VDExMywgUjEyOCwgVjg1MSwgQTUyMyBhbmQgQTczMy4KPgo+IEkndmUgdGVzdGVkIHlvdXIgZHJp
dmVyIG9uIEExMzMsIHdoaWNoIHdvcmtzIGZpbmUgdG9vLiBJdCBzZWVtcyB0aGF0IEg2MTYgdXNl
cwo+IGEgc2ltaWxhciAoYnV0IHNsaWdodGx5IGRpZmZlcmVudCkgcmVnaXN0ZXIgbGF5b3V0Lgo+
Cj4gSW4gY2FzZSB5b3UndmUgbWlzc2VkIGl0LCB0aGVyZSdzIGEgZm9sbG93LXVwIHNlcmllcyBh
ZGRpbmcgSDYxNiBzdXBwb3J0IGF0Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9saW51eC1wd20vbGlzdC8/c2VyaWVzPTQwOTAzNiZhcmNoaXZlPWJvdGgmc3RhdGU9Kgo+
Cj4gQW5kIHRoZXJlJ3MgYWxzbyBhIHN0YW5kYWxvbmUgZWZmb3J0ICh3aGljaCBJJ3ZlIHJlZGly
ZWN0ZWQgdG8geW91ciBzZXJpZXMpIGF0Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eC1wd20vbGlzdC8/c2VyaWVzPTQ4NTY0NCZhcmNoaXZlPWJvdGgmc3RhdGU9
Kgo+Cj4gTm93IGdpdmVuIHRoYXQgdGhlIG5ldyBjb250cm9sbGVyIHdhcyBpbnRyb2R1Y2VkIHdp
dGggdGhlIFY1IChzdW44aXcxMikgZnJvbQo+IDIwMTgsIEkgdGhpbmsgaXQgd291bGQgYmUgYSBi
aXQgY29uZnVzaW5nIHRvIGtlZXAgdGhlIHN1bjIwaS1wd20gbmFtZS4KPgo+IEhvdyBhYm91dCBy
ZW5hbWluZyB0aGUgZHJpdmVyIHRvIHN1bjhpLXB3bSBpbnN0ZWFkPyBUaGF0IHdvdWxkIGJlIG1v
cmUKPiBjb25zaXN0ZW50IHdpdGggaG93IG90aGVyIHNlY29uZCBnZW5lcmF0aW9uIGRlc2lnbnMg
ZnJvbSBBbGx3aW5uZXIgYXJlIHVzdWFsbHkKPiBjYWxsZWQgaW4gTGludXggYW5kIG1ha2VzIGl0
IG1vcmUgY2xlYXIgdGhhdCBpdCBhbHNvIHRhcmdldHMgc3VuOGkgYW5kIHN1bjUwaQo+IGNoaXBz
LCBpbiBhZGRpdGlvbiB0byBzdW4yMGkuCj4KPiBBbGwgdGhlIGJlc3QsCj4KPiBQYXVsCj4KPiAt
LQo+IFBhdWwgS29jaWFsa293c2tpLAo+Cj4gSW5kZXBlbmRlbnQgY29udHJhY3RvciAtIHN5cy1i
YXNlIC0gaHR0cHM6Ly93d3cuc3lzLWJhc2UuaW8vCj4gRnJlZSBzb2Z0d2FyZSBkZXZlbG9wZXIg
LSBodHRwczovL3d3dy5wYXVsay5mci8KPgo+IEV4cGVydCBpbiBtdWx0aW1lZGlhLCBncmFwaGlj
cyBhbmQgZW1iZWRkZWQgaGFyZHdhcmUgc3VwcG9ydCB3aXRoIExpbnV4LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
