Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D2C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPzd4NoHVIYASjJW9evuxmjiOGLCqMMXOta+U/HRp74=; b=C3i6RNNbmzSF+F
	GuOK8E/z2nxheuEyxWHDxt/uUVhqiJolfbTyHyk49VIK56nsdbAWO2SDl9ishOaldK4Z4Wq5OTXKA
	39ijYkJn6hUFfJkbdH6UKmNfC+/dqdFqsck4ktJYXGSnvKerLxoknXHt4cNTm3MAoDTgInsPoD1eM
	wRYbBISMdguPJgFgO4o+g918Uke5aOFGSSuNBoDxX7cJg8sK0dJG/y/uNqA1b+1l5e5oXbdYblCMG
	qeb4gAU5C6Rt2jY8FWgHkl3dZCMss0YUZq4l5vfrK2qmevfNi75ad8w+5w5JIS114jIWfuI2v1IYU
	Z1XwcB3zZLD3YGIoMglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRr9-0000000B41m-0AAn;
	Tue, 03 Jun 2025 13:39:07 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRne-0000000B3IT-3naH
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:35:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553331c3dc7so5804915e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748957728; x=1749562528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIOXxCHtKeBYGzNsgywd50i1FC81LtsnP0F3u2yP/Ow=;
        b=Sb5abTa9VFnuE9FJxIWb782DNpTlBONW6fGUvdpeeYivtZavlIactpcOzX2dDlIA1Z
         dWVonxxlUZ6UQV1rLLvOfHVhbgz7oYGdOSdQK5Y4jiTp6mGtvHw9LCvktBmSYDhOeMFg
         GmH14jEVcuuutgOUrwVu2QKr8C/iXGhcPhDWcnXfon7MA+xQ17JY2wC9Y/KoejmyNV0u
         JNOHP1Qf5n/Z7NaAYUvFTfp8q8mOnK3aYTBLk2sCXzg8zc+WqjigIOxbD8a3JXa9a3zo
         TAfd+/7/gN7BuzAqqFXah3FbiY5PJgLfUvgH50XD4e6sy4ArAUfeZ2sxcMM3OKgHI73Y
         Qxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957728; x=1749562528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIOXxCHtKeBYGzNsgywd50i1FC81LtsnP0F3u2yP/Ow=;
        b=WUnQ9ucKE7vuscD8bxpRwGnPQPnTjikcFL3i0ePsVeHWEmiDhvKoD/DtCNsMbPjgf5
         cdRgbwbn41eJsp6Xe/ZpVpfea30hfH98j5sT/UidK0BC0KO8Wludmz2AYnOvdw035zj4
         PaFMh08hSizqdBy3HydpryP2w572f6EQn2H5eCtVUopNZB2h4hBb8td39Yh7/1yEarM/
         r3QQgtVLx4IQvpyLy6OXgJnXaHq6AAVhEbq+k0IsZ2c2Ux/yl8ttNtUlAE5qAVgbstDw
         /2QPC4ee7uTIk/5Sb5M5lqBWFMC5/+H9NgC5G6216K337qI2pm1NUNRJupgFboFcmH0o
         ExeA==
X-Forwarded-Encrypted: i=1; AJvYcCUUCmDGWWOlVhF/643BNoiRwj4gZMFmCs47iT9v3OHbAI2L4qWv72VtBFWSuukYtzcR2QtE3vyoVXneag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfo2iDJrOqvZAE6w3RV5Ba6ZiMM9KDTO2gVZd9FLPLlVN5bynP
	7vHZ/a9AQ8Rz0dIs/gyRbY6GUImCwyLee1egPV8/yv/MLbwnMfVBEfcXjSiUnKVdrBaMi9p6Lmk
	BXVNYZAk7soSiibpDg4vJNcI3YVr1qZULsf9ha1h+7A==
X-Gm-Gg: ASbGncvjS3Vy7ws5bTT18+Nu55n+OJy0rJSRllwyKFI3CzsllBAJlSvhrmG/z+Vvl6d
	dFLEym2T+ja2ZYzIXgd/TVh/menSfIzF5QStqyLwaHt0wlzIPOjI5O/vuc6uXkbORVGMXbnjyt0
	SMF1p3KRxi6+xuK1Q57JivDFAB6vMZ9jjUh93tFZy5VlZiIeCZCfNm8NcxVRcNqYc=
X-Google-Smtp-Source: AGHT+IG+4ruICaQP9WjnJtvSTT9EmK06oaor1STRsfEcgxfGLSMohUV22g53UcbTlMgO8PAYrxi/zYRyt6cxM4CKTj0=
X-Received: by 2002:a05:6512:3a89:b0:553:2ce6:c749 with SMTP id
 2adb3069b0e04-55342f5f525mr4032820e87.24.1748957728189; Tue, 03 Jun 2025
 06:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com> <20250603-cuddly-certain-mussel-4fbe96@kuoka>
In-Reply-To: <20250603-cuddly-certain-mussel-4fbe96@kuoka>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Jun 2025 15:35:16 +0200
X-Gm-Features: AX0GCFuDYKD0oEvnMgBkM50gIAPDgZLFL7Iyce01c_hFdppjyHLpA9k0Aap5-Uk
Message-ID: <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063531_051694_50AD62D7 
X-CRM114-Status: GOOD (  24.25  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCAzOjE54oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDAyLCAyMDI1IGF0IDEwOjI5OjEz
UE0gR01ULCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPiA+ID4+ICtkZXNjcmlwdGlvbjogfAo+
ID4gPj4gKyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJlcyB0aGUgcG93ZXIgc2VxdWVuY2VyIGZvciB0
aGUgVC1IRUFEIFRIMTUyMCBHUFUuCj4gPiA+PiArICBUaGlzIHNlcXVlbmNlciBoYW5kbGVzIHRo
ZSBzcGVjaWZpYyBwb3dlci11cCBhbmQgcG93ZXItZG93biBzZXF1ZW5jZXMKPiA+ID4+ICsgIHJl
cXVpcmVkIGJ5IHRoZSBHUFUsIGluY2x1ZGluZyBtYW5hZ2luZyBjbG9ja3MgYW5kIHJlc2V0cyBm
cm9tIGJvdGggdGhlCj4gPiA+PiArICBzZXF1ZW5jZXIgYW5kIHRoZSBHUFUgZGV2aWNlIGl0c2Vs
Zi4KPiA+ID4+ICsKPiA+ID4+ICtwcm9wZXJ0aWVzOgo+ID4gPj4gKyAgY29tcGF0aWJsZToKPiA+
ID4+ICsgICAgY29uc3Q6IHRoZWFkLHRoMTUyMC1ncHUtcHdyc2VxCj4gPiA+PiArCj4gPiA+Cj4g
PiA+IEJlZm9yZSBJIHJldmlldyB0aGUgcmVzdDogaXMgdGhpcyBhY3R1YWxseSBhIHBoeXNpY2Fs
IGRldmljZSB0aGF0Cj4gPiA+IHRha2VzIGNhcmUgb2YgdGhlIHBvd2VyIHNlcXVlbmNpbmc/IFNv
bWUga2luZCBvZiBhIHBvd2VyIG1hbmFnZW1lbnQKPiA+ID4gdW5pdCBmb3IgdGhlIEdQVT8gSWYg
c28sIEkgYmV0IGl0J3Mgbm90IGNhbGxlZCAicG93ZXIgc2VxdWVuY2VyIiBzbwo+ID4gPiBsZXQn
cyB1c2UgaXRzIGFjdHVhbCBuYW1lIGFzIHBlciB0aGUgZGF0YXNoZWV0Pwo+ID4KPiA+IEhpIEJh
cnQsCj4gPiBUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suCj4gPgo+ID4gVGhlIGhhcmR3YXJlIGJs
b2NrIHJlc3BvbnNpYmxlIGZvciBwb3dlcmluZyB1cCB0aGUgY29tcG9uZW50cyBpbiB0aGUKPiA+
IFRIMTUyMCBTb0MgZGF0YXNoZWV0IGlzIGNhbGxlZCBBT04gKEFsd2F5cyBPbikuIEhvd2V2ZXIs
IHdlIGFscmVhZHkgaGF2ZQo+ID4gYSBEVCBub2RlIG5hbWVkIGFvbiB0aGF0IHNlcnZlcyBhcyBh
IHBvd2VyIGRvbWFpbiBwcm92aWRlcgo+ID4gKERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLnlhbWwpLgo+Cj4gU28gbm8uIE9uZSBkZXZp
Y2UsIG9uZSBkZXZpY2Ugbm9kZSAoc29tZXRpbWVzIHdpdGggY2lsZHJlbiBub2RlcykuIFlvdQo+
IGRvIG5vdCBnZXQgYW5vdGhlciBkZXZpY2Ugbm9kZSBqdXN0IGJlY2F1c2Ugc29tZW9uZSB3cm90
ZSBpbmNvbXBsZXRlCj4gYmluZGluZyBvciBiZWNhdXNlIGRyaXZlciBsb29rcyBkaWZmZXJlbnRs
eS4KPgo+ID4KPiA+IEZvbGxvd2luZyB0aGUgZGlzY3Vzc2lvbiBbMV0gYWJvdXQgbmVlZGluZyBh
IHNlcGFyYXRlIERUIG5vZGUgZm9yIHRoZQo+ID4gcG93ZXIgc2VxdWVuY2luZyBjYXBhYmlsaXRp
ZXMgb2YgdGhpcyBBT04gYmxvY2ssIGFuZCB0aGlua2luZyBmdXJ0aGVyCj4gPiBhYm91dCBpdCwg
SSB0aGluayB0aGUgYmluZGluZyBzaG91bGQgYmUgbW9yZSBnZW5lcmljLiBUaGUgQU9OIGJsb2Nr
IGNhbgo+ID4gbWFuYWdlIHBvd2VyIHNlcXVlbmNlcyBmb3IgbW9yZSB0aGFuIGp1c3QgdGhlIEdQ
VSAoZS5nLiBOUFUsIEFVRElPLAo+ID4gRFNQKS4KPiA+Cj4gPiBUaGUgY29tcGF0aWJsZSBzdHJp
bmcgY291bGQgYmUgdXBkYXRlZCBsaWtlIHNvOgo+ID4gInRoZWFkLHRoMTUyMC1hb24tcHdyc2Vx
Igo+Cj4gU2hvdWxkIG5vdCBiZSBzZXBhcmF0ZSBub2RlLCB5b3UgYWxyZWFkeSBoYXZlIG9uZSBm
b3IgQU9OLgo+CgpBZ3JlZWQuIEFuZCBhcyBmYXIgYXMgaW1wbGVtZW50YXRpb24gZ29lcywgeW91
IGNhbiBoYXZlIHRoZSBzYW1lCmRyaXZlciBiZSBhIFBNIGRvbWFpbiBBTkQgcHdyc2VxIHByb3Zp
ZGVyLiBJdCBqdXN0IGhhcyB0byBiaW5kIHRvIHRoZQpkZXZpY2Ugbm9kZSB0aGF0IHJlcHJlc2Vu
dHMgYW4gYWN0dWFsIGNvbXBvbmVudCwgbm90IGEgbWFkZS11cAoiY29udmVuaWVuY2UiIG5vZGUu
CgpCYXJ0b3N6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
