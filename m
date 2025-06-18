Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143CCC7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7TkpNgtE6mCxPKg/AUfFlavOBpYfgTK0j08CxT+FQQ=; b=Em4YRMcmXxOEpN
	oSdlJ3ezsx1auFYHiNaBaXngMW3C2tK9Y0IFx0N0hKqhRxeQhyVB8jWtsOUhRU4xXWTuyiw5glg5Q
	3HsLTQzkAcnWKZkHXE+U6DiaUeWsd9YsmsU75dSabpkGl0QrOq0zP1lm99B0twoeAPOu6mAv1AYqN
	k7H5VWUgXrZQU/s0o8jNTQX++l9Pz8RamMau3HC1grIOaKM95orrBkOIjcDKA98//VRprwLnZr4J9
	+qGqPxR9681NPGVIiuNI+cJw0DyP2IUcBO7ta7aeq7mGFhMPJX5gVKEGLiuGtsVpYg2YvcFVvhBsO
	Mu/M8JadzEfUi/hmhjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRulN-0000000AbgP-1yS6;
	Wed, 18 Jun 2025 15:31:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt5s-0000000ALIc-47DI
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:44:50 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-553b544e7b4so5920574e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254287; x=1750859087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOnqA9glXHMp+wjKPZ26EK/2be4ewo0aSocx50Gz+sQ=;
        b=ogDF61OOgruJnd05yGkvNZt3brk3Ek63Z8bRcq9xhgy1cfvWu6LJOZXSJwVnHfhYrG
         quM8ZEMjTy13u2+Zf45k5YbteGXanORgEQAIz26iLa4sv/y3aobiJc1xRJKcduf/PdyG
         i114Fz4Bxc6zOrebfM6CHO/nXCoAXvHIL8nzO75ZXNVGxM8kqxqe6Hh55AAvWWaoS4MR
         KCDCMPRlobOoB+0dJJaBSqED3sIUU1ArMWiFEgyDnZy93n7AHe3j8wkcOMeXCV5e+BCG
         DDY74DEQVW03hFT4WtU97pGj0IR5P9+hCi77/SVc9BJfrY7ssVLx28IjvSGBGwjNg9Lp
         0+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254287; x=1750859087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOnqA9glXHMp+wjKPZ26EK/2be4ewo0aSocx50Gz+sQ=;
        b=i7/tmuiUXTFyAqgyutqYOQu3ObC7PBYDdhDvNL65oQQPNB/iHgXQuFOTjfag7rUj5N
         aCYpxXEYXMO7jDNmCtY1yazFj6iYL76cyAS+hnWujkuuykCrD6LrhZqmIT6pd+Nhwy0T
         /uINTf/p5+3P01/Af1veiQ6VFXGEJ3eRnyAEVM8Nl7X+ZBT1y7A1XLBqIQqmCyXW9PeO
         jKzQElfiK2hOVtedujr+8fc/9WgLmFzpVUBx4Pge1dPuDu7NON6yBcwc5wldextSBs7T
         l84+wn08NwsTadNWs1EFJDbamL3CSXUaX+tmFLe+ZTSGJKeNBZpVQXxWnfyOA4IFwJfR
         Q0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqBWfTgpyWX7DH+Y7JyPB8fLOG1Vs8za93YhuR7pmcLC/EQA3zMBSztEiHw/oKxMvh2GU4LJK6VbILPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIgWHGmYwCAYnVpWQrMbT5k2qeXVyRZmXb+MiyROtISzOjJ3EB
	LxDpDoxTjAQGnMPTBA5U6jX3D1Wn/+bAxx5OMNUYjV0Sh/26XkV0tiXBsAOo3VZDmPqCsJbBxfV
	3RcUA4t8mHvWnJx2C1GYQDPxriQAluf2T9iz8U9rjmQ==
X-Gm-Gg: ASbGncu/ffjbNqdoMAQ19lEMvdVDi7Y+U7IyVlQIreyXQA2MduVQmLhpDzRtsyMWR+j
	iahk97TS1Pl13/CQkyEpY4VuK9VGmuWgo/5ismPAMA9tPX9heiim3vjMoLzeb3ByVQu5JHPSMMS
	tlnATwYs9o5qNHN/apKa8VFhSzz7CrzuK+PCkseWmPk8CLoZxrlFEQSM05vg2zywsP9fw73ET5h
	g==
X-Google-Smtp-Source: AGHT+IH6Ld+eVfdvk23fMVj2Sr97EjUVBPbCt4xJwvj5ob6oDsk8hpgZs7OsgvSQaNDiPWolo67AHI2eB2C2BKgawwc=
X-Received: by 2002:a05:6512:3ba5:b0:553:25f4:695c with SMTP id
 2adb3069b0e04-553b6f4470cmr4999420e87.50.1750254287228; Wed, 18 Jun 2025
 06:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:44:35 +0200
X-Gm-Features: AX0GCFuxF3RhQHueJgJf3bU829GFZMlCkCu1kP_wz3N4DTe6r8qi2RcA-BS33s4
Message-ID: <CAMRc=MdXmtZ3EbPDSGQeVaH40oZS7yc8MSMO2TbHza+F2HnBng@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250618_064449_020041_C08B71E1 
X-CRM114-Status: GOOD (  18.66  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMTI6MjLigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IFNldmVyYWwgUklTQy1WIGJvYXJkcyBm
ZWF0dXJlIEltYWdpbmF0aW9uIEdQVXMgdGhhdCBhcmUgY29tcGF0aWJsZSB3aXRoCj4gdGhlIFBv
d2VyVlIgZHJpdmVyLiBBbiBleGFtcGxlIGlzIHRoZSBJTUcgQlhNLTQtNjQgR1BVIG9uIHRoZSBM
aWNoZWUgUGkKPiA0QSBib2FyZC4gVGhpcyBjb21taXQgYWRqdXN0cyB0aGUgZHJpdmVyJ3MgS2Nv
bmZpZyBkZXBlbmRlbmNpZXMgdG8gYWxsb3cKPiB0aGUgUG93ZXJWUiBkcml2ZXIgdG8gYmUgY29t
cGlsZWQgb24gdGhlIFJJU0MtViBhcmNoaXRlY3R1cmUuCj4KPiBCeSBlbmFibGluZyBjb21waWxh
dGlvbiBvbiBSSVNDLVYsIHdlIGV4cGFuZCBzdXBwb3J0IGZvciB0aGVzZSBHUFVzLAo+IHByb3Zp
ZGluZyBncmFwaGljcyBhY2NlbGVyYXRpb24gY2FwYWJpbGl0aWVzIGFuZCBlbmhhbmNpbmcgaGFy
ZHdhcmUKPiBjb21wYXRpYmlsaXR5IG9uIFJJU0MtViBwbGF0Zm9ybXMuCj4KPiBBZGQgYSBkZXBl
bmRlbmN5IG9uIE1NVSB0byBmaXggYSBidWlsZCB3YXJuaW5nIG9uIFJJU0MtViBjb25maWd1cmF0
aW9ucwo+IHdpdGhvdXQgYW4gTU1VIGFuZCBlbmFibGUgQ09NUElMRV9URVNUIHRvIGltcHJvdmUg
YnVpbGQgY292ZXJhZ2UuCj4KPiBSZXZpZXdlZC1ieTogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29u
QGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5
bnNraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL0tj
b25maWcgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL0tjb25m
aWcgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vS2NvbmZpZwo+IGluZGV4IDVmOWZmZjQz
ZDZiYWFkYzQyZWJmNDhkOTE3MjliZmJmMjdlMDZjYWEuLjQ4ZmQzMWMwMzE2MjhjNzBiMWUwOTUy
MjcxYmFjY2Y3ZjQ2OTQ4MTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0
aW9uL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vS2NvbmZpZwo+
IEBAIC0zLDkgKzMsMTAgQEAKPgo+ICBjb25maWcgRFJNX1BPV0VSVlIKPiAgICAgICAgIHRyaXN0
YXRlICJJbWFnaW5hdGlvbiBUZWNobm9sb2dpZXMgUG93ZXJWUiAoU2VyaWVzIDYgYW5kIGxhdGVy
KSAmIElNRyBHcmFwaGljcyIKPiAtICAgICAgIGRlcGVuZHMgb24gQVJNNjQKPiArICAgICAgIGRl
cGVuZHMgb24gKEFSTTY0IHx8IFJJU0NWKSB8fCBDT01QSUxFX1RFU1QKClNvbWUgbWFpbnRhaW5l
cnMgY291bGQgc2F5IHRoYXQgdGhlIENPTVBJTEVfVEVTVCBiaXQgc2hvdWxkIGJlIGEKc2VwYXJh
dGUgY29tbWl0IGJ1dCBpdCdzIHR5cGljYWxseSBmaW5lIHdpdGggbWUuCgo+ICAgICAgICAgZGVw
ZW5kcyBvbiBEUk0KPiAgICAgICAgIGRlcGVuZHMgb24gUE0KPiArICAgICAgIGRlcGVuZHMgb24g
TU1VCj4gICAgICAgICBzZWxlY3QgRFJNX0VYRUMKPiAgICAgICAgIHNlbGVjdCBEUk1fR0VNX1NI
TUVNX0hFTFBFUgo+ICAgICAgICAgc2VsZWN0IERSTV9TQ0hFRAo+Cj4gLS0KPiAyLjM0LjEKPgoK
UmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGlu
YXJvLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
