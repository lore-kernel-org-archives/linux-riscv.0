Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C874D64083
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 07:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SryzVs2jIQ5AghEymZvPIyU3alQMDtORgWzPHR0rEtg=; b=ANPkACO1UqYhAn
	3/zgqWdA2946RtDWBjwwJtfodr9yIpmVDfi9KqoxfYShVTrfxuK7rBCHegqdpu85vO+dNDNFzGpyf
	M0ZVa9ZP3sMsdC0uiKwEEfBDPEXDEXRbooboFBce7iLV3BQv0y9i9aeuXuyU/+5JcaUoLrraAbD2k
	8cyColTVwUBZuARwriBSpt0lnIVwxvcp8WtBHfHiaXYE3Z/afkiglq8wf8aKmNcWtenaA6zTHH07b
	K/wdNANoMQouG/GVAofSv2QFM3yrMn+wFyniQdujsHeGMi6NPaiOg/jDGfYzoapT/drTEBIICVPIj
	/RpJSKxmoVvMAT8SJukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVljZ-00000006HPl-0lsg;
	Wed, 17 Dec 2025 07:14:05 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVljW-00000006HPN-2rSY
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 07:14:03 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-78e7cfd782aso30278127b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 23:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765955641; x=1766560441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDfl8qAKqI9K5fPdr90NV1qLIsNLvTVsSytePWp/iv8=;
        b=Sr7hCj/LBXkLIb1WJXz3axYCJlb0px6Z5CmHRlZG/AMf3nE1L1Ah5kBYProcpHuMan
         sI3YyYqxf7M76RcNwF5Sf4+l2brfU/gPymUl5VnwE8hBou+U/28rnTKJ20TCC6Tz0Pz2
         e18vm5x4fRsYnXj4dCndxOdtnECnnVsUK73XrOp/Xtt9eZqcrxzxrWifnllaz2zJSapt
         jwpJlXGeeAzV3LZuBILmOROx0WVSQNvvWwXpEeGFJn6IxqD1fMoWtkWg3DNfTaRCJDkZ
         g2/v6mvQ7wWYh5Au9ZbTdeYjfTJ80f2uwXKS5WSd2aQ3IpFlQkeWroomy+uSUCYvZ6qJ
         OQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765955641; x=1766560441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HDfl8qAKqI9K5fPdr90NV1qLIsNLvTVsSytePWp/iv8=;
        b=wyYb8mCb12ix8R54QdOk4bAcrhpPM/EfWTeAkMZB4JiFVrBN1xgUJT1EYaAwBjfOiI
         BW398FL0QRChh5Nq7U0By6/HY9bzbxaKidXT6s8VRu8dsms/DhLwVq8co98ebJmMwFl8
         U55uNva4IYsQrDNy2NYAHcGU4ACxQxI1wkMsYr+uCpnChVl4585HzdPSdNL6vvZ5QLQ1
         M4N1ePGoQIzpSL01flfpbF3Iq4bAlhDY168NlF3wlvgKjX3O1Zo/aTt4Jjl4IFPqIllw
         3KwA5HWUsKU4Q/9LkNoGDVcWHvkeQZIiPhD8fajck2YLsZASwXjAmXqHDE5GGa/DMdSm
         Tbuw==
X-Forwarded-Encrypted: i=1; AJvYcCVhxvIsZJHZGj/Xo00VV2kQiQKjiXan/JX6UjXtOwX/Vsr3AvRqhtKd155Dfr3Qv7DW5NEN+1656vVvOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsOgMLI+lWdW+BYhyXc4CQ4qNt92hfRKvZA5BOta4jOlY7LPhn
	oDtu4RbM5et97qcOSP6XbnbbZ+Vg3HflSrVAg8nFuAqUHCGZV9GrN5liK+FR/+vn4O3WM/AfR4+
	d17Znav93LIDftVh25NqhTLMf7Bn1Is8XllyEq/9NYg==
X-Gm-Gg: AY/fxX56UhzJyiKFINe/mQNGaldUvj0gfXScvWCZ9ZEbt/8y8QltGNnauuNLI42XsIp
	m9LKy4vL/i9B1MZWNFUb5Nt7meLR8nCHLLX872Hq7J8/xQaRN/1bvgim1wI4yqrvtkhvwOqdkpF
	KdTMOh13k43QwlmigaXXu5k8WgEfcAcV2MxefOEds+J2L8u1acms30JTfqGQhnLzzdv0nls/w2D
	OYTuYeP3RGG9oQ4FjTqwRPhcSxe2ZXW33kLjk0i1IhBmEUt4EDqtXnkg6YM2i4C88bUqHv9a64y
	z078e/X61hgDUeJ4tCcU8P2L2gcqyRPdz4IsY/H3Z0xlLz8Q2LcWwSk=
X-Google-Smtp-Source: AGHT+IH0USc98adq68YuNkR6BO6s7ouNVB7SxQasWdlzVDiV6ZxglCL/bAho39AyjZN16MBGjdgmEImzF7UM0hhyf0g=
X-Received: by 2002:a05:690c:6a0e:b0:78a:7a68:e4fe with SMTP id
 00721157ae682-78e6831c4dbmr123317137b3.25.1765955641406; Tue, 16 Dec 2025
 23:14:01 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com> <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
In-Reply-To: <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 15:13:50 +0800
X-Gm-Features: AQt7F2qt3rSNkF23w_AVCZL60KRRfHKfFoZFSmyzaNBRd3Kb1iOnGUyhNAVCUBk
Message-ID: <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_231402_729988_E172CD71 
X-CRM114-Status: GOOD (  20.76  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTA6MzPigK9QTSBIZWlucmljaCBTY2h1Y2hhcmR0Cjxo
ZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMTYvMjUg
MTQ6MzIsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBLMyBQaWNvLUlUWCBpcyBhIDIuNS1pbmNoIHNp
bmdsZS1ib2FyZCBjb21wdXRlciBlcXVpcHRlZCB3aXRoIGEgU3BhY2VtaVQKPiA+IEszIFNvQy4K
PiA+Cj4gPiBUaGlzIG1pbmltYWwgZGV2aWNlIHRyZWUgZW5hYmxlcyBib290aW5nIGludG8gYSBz
ZXJpYWwgY29uc29sZSB3aXRoIFVBUlQKPiA+IG91dHB1dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlICAgICAgICB8ICAxICsKPiA+ICAgYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1waWNvLWl0eC5kdHMgfCAyNSArKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZQo+ID4gaW5kZXggOTU4ODllNzI2
OWQxYmFlNjc5YjI4Y2QwNTNlMWIwYTIzYWU2ZGU2OC4uN2UyYjg3NzAyNTcxODExM2EwZTMxOTE3
ZWFkZjc1NjJmNDg4ZDgyNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFr
ZWZpbGUKPiA+IEBAIC00LDMgKzQsNCBAQCBkdGItJChDT05GSUdfQVJDSF9TUEFDRU1JVCkgKz0g
azEtbWlsa3YtanVwaXRlci5kdGIKPiA+ICAgZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9
IGsxLW11c2VwaS1wcm8uZHRiCj4gPiAgIGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSArPSBr
MS1vcmFuZ2VwaS1yMnMuZHRiCj4gPiAgIGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSArPSBr
MS1vcmFuZ2VwaS1ydjIuZHRiCj4gPiArZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGsz
LXBpY28taXR4LmR0Ygo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazMtcGljby1pdHguZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1waWNv
LWl0eC5kdHMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi4wZjlkMDRkZDM1MmY1MzMxZTgyNTk5Mjg1MTEz
Yjg2YWY1YjA5ZWJlCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2szLXBpY28taXR4LmR0cwo+ID4gQEAgLTAsMCArMSwyNSBAQAo+ID4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4gPiArLyoKPiA+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjUgU3BhY2VtaVQgKEhhbmd6aG91KSBUZWNobm9sb2d5IENvLiBM
dGQKPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUgR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rh
ci5jb20+Cj4gPiArICovCj4gPiArCj4gPiArI2luY2x1ZGUgImszLmR0c2kiCj4gPiArCj4gPiAr
LyB7Cj4gPiArICAgICBtb2RlbCA9ICJTcGFjZW1pVCBLMyBQaWNvLUlUWCI7Cj4gPiArICAgICBj
b21wYXRpYmxlID0gInNwYWNlbWl0LGszLXBpY28taXR4IiwgInNwYWNlbWl0LGszIjsKPiA+ICsK
PiA+ICsgICAgIGNob3NlbiB7Cj4gPiArICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlh
bDAiOwo+ID4gKyAgICAgfTsKPiA+ICsKPiA+ICsgICAgIG1lbW9yeUAxMDAyMDAwMDAgewo+ID4g
KyAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ID4gKyAgICAgICAgICAgICBy
ZWcgPSA8MHgxIDB4MDAyMDAwMDAgMHgzIDB4ZmZlMDAwMDA+Owo+Cj4gU2hvdWxkbid0IHRoZSBy
ZXNlcnZlZCBtZW1vcnkgYmUgZGVzY3JpYmVkIGFzIG5vLW1hcCAvcmVzZXJ2ZWQtbWVtb3J5Cj4g
bm9kZXMgaW5zdGVhZD8KCkhpIEhlaW5yaWNoLAoKWWVzLCB5b3UgYXJlIHJpZ2h0LiBVc2luZyBh
IHJlc2VydmVkLW1lbW9yeSBub2RlIHdpdGggdGhlIG5vLW1hcCBwcm9wZXJ0eSBpcwp0aGUgY29y
cmVjdCBhcHByb2FjaC4gSSB3aWxsIHVwZGF0ZSB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24gdG8g
ZXhwbGljaXRseQpyZXNlcnZlIHRoZSBmaXJzdCAyTUIuCgo+Cj4gSSB3b3VsZCBhc3N1bWUgdGhh
dCAweDEsMDAwMCwwMDAwIGlzIHRoZSBsb2NhdGlvbiBvZiBPcGVuU0JJLgo+IFdoYXQgaXMgYXQg
MHgzLGZmZTAsMDAwMD8KClllcywgY29uZmlybWVkLCAweDEwMDAwMDAwMCBpcyB0aGUgc3RhcnQg
b2YgT3BlblNCSS4gVGhlIHNpemUgMHgzZmZlMDAwMDAgaW4KbXkgb3JpZ2luYWwgcGF0Y2ggd2Fz
IHRoZSByZXN1bHQgb2YgbWFudWFsbHkgc3VidHJhY3RpbmcgdGhlIDJNQiBPcGVuU0JJCm9mZnNl
dCBmcm9tIHRoZSB0b3RhbCAxNkdCIG1lbW9yeS4KCkkgd2lsbCBjb3JyZWN0IHRoaXMgaW4gdjIg
dG8gc2hvdyB0aGUgYWN0dWFsIG1lbW9yeSBhbmQgcHV0IHRoZSBmaXJzdCAyTUIgaW4KcmVzZXJ2
ZWQtbWVtb3J5IHt9IGZvciBvcGVuc2JpLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKQlIsCkd1
b2RvbmcgWHUKCgo+Cj4gQmVzdCByZWdhcmRzCj4KPiBIZWlucmljaAo+Cj4gPiArICAgICB9Owo+
ID4gK307Cj4gPiArCj4gPiArJnVhcnQwIHsKPiA+ICsgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+
ICt9Owo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
