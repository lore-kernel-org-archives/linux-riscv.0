Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABBDC5B552
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 06:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGwItWcsoEqnlfVX80mAaCofdl1LDa3DkC8VZORK2o8=; b=fX2AD8pRWwXq8J
	o5ZXGCgABYERZk8BxDmfyBy1XsbpDQQqg9cPc7gNa/P23fuu3avt48Jc6gML6ksbt6Q+wKxKF8ST1
	UAxIW4WQYji+rw9IQvdkPs+UkSyj5CxgzkfRhtKZ/Vubulccgdir0YTnSOrHGIPBaBgNU26lxGt33
	McZ5GMKIGKG5OEi1atHt/2p6p2qcR+mw10Laca8r4rShBy5OK4IvOXhQiLR0L40wyrlTlpQkQqJeH
	0rlQJZCKGbtln6fPgrnaB4xgVMRUWguHsWAS1zVuays4fsEVBSLdYiEHzhhzr+DG6HMZeRCkn1sby
	H6Y5AaQtFTq+U3cdin4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMhjs-0000000Cgfq-0VY6;
	Wed, 04 Jun 2025 06:36:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMhjn-0000000Cgcn-1MXi
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 06:36:38 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7557090e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 23:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749018991; x=1749623791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9K32ZU1XZ7DXPyePnHI+L2d3Xh8pDC7EJ8l3Ins/TM=;
        b=IvLRLRO4/PpJdI+UWn3pk91buNDdlKNnmSTPIDLAddX3yq02VkUc6BonuiHMoqlE++
         9xbas23heyyV64hI8/dRgwKBLB+05Fw0mp+nZf9ZGDmu6EW93/10bTSW+DKPlRkMXKvU
         i4kFyFxajmJqDkTlSvurKOXnx0z94vWrskpdLYSmxRBllqlyPeX6Etj64VCfcfxn7QNL
         TdatPC4RT5K5EY063u1UNcVdnWtwDWhsNwt5vLgrYWDRFxwSGD6IX2QQ50aP75Dlqh/I
         JT/adKlPlMMt/w5QcL0IsvKUF6EDMkOQ+GHzcWTKOONFtPjAQqDTGJIQYWUw1hczJzWT
         UUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018991; x=1749623791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9K32ZU1XZ7DXPyePnHI+L2d3Xh8pDC7EJ8l3Ins/TM=;
        b=CcFqhJWePqHfMcTmkZ4GYe36PYvmSLz46I+6nhqhrPRYI89RCpRozVOnB78ZCA4cpo
         j1Ty2GnLhDF6/ajwMxttYrqMK8USFK2XGOiLtiPp7ONr0t2JDYsPOit8+UI+xd8aKGR5
         xJ6N7eBh4BwDXW+7Ayj3TQf6RoEpI0aXT8PPg8F9/fmovLOG3jxHYUv0YxhmlK8+nk+i
         CIj2JQydpIjiXSvJHWncDFAD/4r9rM0YBverEMOv4liYvj0oiznR05JixjLWd3XGFp44
         IiLOFXUyh0+93VpEqApzCPt7oM388CWvD8YEAlRGiX/cu85WVtRUMCF43tpaYNWYfQhX
         FHRw==
X-Forwarded-Encrypted: i=1; AJvYcCWBxS7Vbmu5vhfty5ugx0eUwnLTebo5o7VDlCBvffYvNSEaDHxNO+pt2f+iSgw+/ky1qEK+LzzqZO2Xqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/qOeJSLlrZYm8wlv/vSAhwwR3bicL9rcxU+3JTQc56o2S6AwE
	CfyLAuZYpfcPBXv5+Z3eFC08xDDRdZPns5Ai6aeMZhH1dmvIOtzggaXhsQOznBD6I5CtyDwPGRN
	jNHFc2MzfmgwQiErQEORQoKZj31YbFTMyA9NVW7/Oag==
X-Gm-Gg: ASbGncupQrgMGW5Nu6LLUepbDtwpc420xAc3CPJTd4REo05+4ynA4EEjXI0CPyMzfwg
	GB0MXN43qrrez3VX4/usFkEVigjMEbzqbieZLh9HbB6LrOwU8dhwodGKx5/XUszVlXDTC0dFT/v
	PkNbXS43cJud4Go/J/Jpar7XO3tU+CQFX9qkylkdqSBkbOovpZ5Eqgq63Z0EodTTNq21IQxNqRg
	6E=
X-Google-Smtp-Source: AGHT+IGNn5KBz1XRTjIkzj6b6e6ObvNtG1QhrXiTlXPwZa2NH6Gn7Xw0y4y87hgGMzhfMTB1WYM8NYUps+Cmt6+hJMs=
X-Received: by 2002:a05:6512:1192:b0:553:2ed2:15b5 with SMTP id
 2adb3069b0e04-55356df2fe7mr504394e87.57.1749018991176; Tue, 03 Jun 2025
 23:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com> <20250603-cuddly-certain-mussel-4fbe96@kuoka>
 <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com> <05aa1fad-acf6-4cea-9a20-e54a2a4669b7@samsung.com>
In-Reply-To: <05aa1fad-acf6-4cea-9a20-e54a2a4669b7@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Jun 2025 08:36:20 +0200
X-Gm-Features: AX0GCFusZW-oAOcE0lriS1jLbCdqE2F5QAmjvVg87YP8T3XsEwEGxH56sPN1Z7A
Message-ID: <CAMRc=McDb13ZOM5v5gYBAT40Z6eNd8am6gy=FysWU72cG1172w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_233635_849129_ADFBBBD3 
X-CRM114-Status: GOOD (  20.83  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCA4OjI04oCvUE0gTWljaGFsIFdpbGN6eW5za2kKPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWdyZWVkLiBBbmQgYXMgZmFyIGFz
IGltcGxlbWVudGF0aW9uIGdvZXMsIHlvdSBjYW4gaGF2ZSB0aGUgc2FtZQo+ID4gZHJpdmVyIGJl
IGEgUE0gZG9tYWluIEFORCBwd3JzZXEgcHJvdmlkZXIuIEl0IGp1c3QgaGFzIHRvIGJpbmQgdG8g
dGhlCj4gPiBkZXZpY2Ugbm9kZSB0aGF0IHJlcHJlc2VudHMgYW4gYWN0dWFsIGNvbXBvbmVudCwg
bm90IGEgbWFkZS11cAo+ID4gImNvbnZlbmllbmNlIiBub2RlLgo+Cj4gU3VyZSAtIHRoaXMgY2Fu
IGJlIGRvbmUgdXNpbmcgZXhpc3RpbmcgQU9OIG5vZGUuCj4KPiBUbyBrZWVwIHRoZSBwd3JzZXEg
Y29kZSBvcmdhbml6ZWQgaW4gZHJpdmVycy9wb3dlci9zZXF1ZW5jaW5nLywgYQo+IHNpbWlsYXIg
YXBwcm9hY2ggdG8gb3VyIHRoMTUyMC1wZCBkcml2ZXIgaW50ZXJmYWNpbmcgd2l0aCB0aGUgQU9O
Cj4gZmlybXdhcmUgbGlicmFyeSAoZHJpdmVycy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLmMp
IGNvdWxkIHdvcmsuCj4KPiBUaGUgaWRlYSB3b3VsZCBiZSB0byB0cmVhdCBjb2RlIGxpa2UgcHdy
c2VxLXRoZWFkLWFvbi5jIChjaGFuZ2VkIGZyb20gYQo+IGN1cnJlbnQgcHdyc2VxLXRoZWFkLWdw
dS5jKSBhcyBhIGxpYnJhcnkuIEl0IHdvdWxkIGV4cG9ydCBpdHMgbmVjZXNzYXJ5Cj4gZnVuY3Rp
b25zIChlLmcuLCBmb3Igc3BlY2lmaWMgc2VxdWVuY2UgaW5pdC9kZWluaXQgc3RlcHMpIHVzaW5n
Cj4gRVhQT1JUX1NZTUJPTF9HUEwuIFRoZSBtYWluIEFPTiBkcml2ZXIgd291bGQgdGhlbiBjYWxs
IHRoZXNlIHRvIHByb3ZpZGUKPiB0aGUgcHdyc2VxIGZ1bmN0aW9uYWxpdHkuCj4KPiBUaGlzIHdp
bGwgaW50cm9kdWNlIGEgY29tcGlsZS10aW1lIGRlcGVuZGVuY3ksIGFzIGV4cGVjdGVkLgo+Cj4g
QW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8ga2VlcCB0aGUgZHJpdmVyIGluIGRyaXZlcnMvcG93
ZXIvc2VxdWVuY2luZy8KPiBhcyBhIHBsYXRmb3JtIGRyaXZlciBhbmQgc3RhcnQgaXQgdXAgdXNp
bmcsIGZvciBleGFtcGxlLCBhbiBhdXhpbGlhcnkKPiBidXMuIFRoaXMgaXMgc2ltaWxhciB0byB3
aGF0IHRoZSBKSDcxMTAgY2xvY2sgZHJpdmVyCj4gKGRyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1z
dGFyZml2ZS1qaDcxMTAtc3lzLmMpIGlzIGRvaW5nIHdpdGggYSByZXNldAo+IGRyaXZlci4gVGhp
cyBjb3VsZCBvZmZlciBhIGNsZWFuZXIgc2VwYXJhdGlvbiBvZiByb2xlcyBpZiB0aGF0J3MKPiBw
cmVmZXJyZWQuCj4KPiBQbGVhc2UgbGV0IG1lIGtub3cgd2hpY2ggd2F5IHdvdWxkIGJlIHByZWZl
cnJlZC4KCkkgZm9yZ290IHRoZSBhdXhpbGlhcnkgYnVzIGlzIGEgdGhpbmcuIFllYWgsIGRlZmlu
aXRlbHkgdXNlIHRoYXQsIGl0J3MKbW9yZSBlbGVnYW50IHRoYW4gYSBsaWJyYXJ5IGZ1bmN0aW9u
IElNTy4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
