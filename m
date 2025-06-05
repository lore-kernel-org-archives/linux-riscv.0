Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F8DC5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STOUNOh9ciVo4CFyKKwmHzheKr8YGcreCH4i8OASlaY=; b=TgQNN4qb8MyK1R
	0VD8i6HCAJ3989eHxDB4k5Y2tUwSbNxHUsW7EuZ2tkTJhpIxoX9l5McyYPyw/sfsddEwaih0zBn+M
	4fQ6hm9MiFWzy+vI97MRRAWI2VA5/3yOYnnKG9xeEA8EDTPTqOLV9cgYuVBJz3goFPOmcpT4ArqwO
	ydxh+o+XKK45uIlQIMpeft41SAqmB9YhdeR3kMjGG42Livk8HZYkRFy7RjF5DbPHsOD9hepza7STe
	TFkGr8bdtM9pL5rnLOcBtKS8B295YcFMUiCoDs8yKgoStweRsvyJu2+00wgKBs4gIA8y1+hBxH+MJ
	UvxmvdX7CL3WEnonZqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5gE-0000000F2Dh-19Yj;
	Thu, 05 Jun 2025 08:10:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5gB-0000000F2DG-1M0V
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 08:10:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-551ed563740so839328e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749111025; x=1749715825; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EnW/yxpvBpxax3gx1shRrGfyOQX14oH8W/BcrsAWl4=;
        b=w0Cukl8QgRFk118+4DmYD7QKNEYfL/w4tcXoCUwg6FgsMBj4KCmxQ75YjGykIT1GYY
         G3IMZGe/EB/UF8TsdKU1bNsbkj3TWfF9OUjOO6iibDwfCG035thTos5yiK2T+QhEBWPv
         t7SLIkMGygELKvU4HrTkY2l44l5yq0fVHXB5iuTlaspeV68s7d2aP52yBmQ6xBHNdnOw
         MZ0PIZd6/y8JLGUE7dqCG79I7ibOTfZN/Eso0HeVToU24rSSa/8eLYHsnSjvhwpfywVV
         orGofvNOmE9J83yazNaq2lpiW/YIqRef29GSGkCrkmuqMOoRlFWsmtKUcW2Zuw2KrUh1
         33wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111025; x=1749715825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EnW/yxpvBpxax3gx1shRrGfyOQX14oH8W/BcrsAWl4=;
        b=lp0N9AM09b+vK01YCsLQdnl+7psDX0dFtSBqXR+0cAmjt2DCfbymfjYyoSOCratDDh
         6IAw6nn3yLji6AxcZdBE2QDrL95lP45alcWHrivWp3ZLYDZ0aKRwdgGgoudeiWHQQsi7
         Zo4QNjA0/ByGDbwHmaAnr5Vb/w224YFUWtbuq5Gxtxg84jvxX9qXrqcz7jhqTbKG3F7x
         ik8bKv3WOr8BKuSfEZ+JutW/9BS8vRTS9U89vjTHL9G67+WwLSyYahlMh9NLU+LvUmsu
         a5V7qq2Cu0tO5A1EVnqtm8ZlT3nzZto3V3sY1Ir2ljJkj4xkdIHecJGdWl8YmZO1zFW8
         CV4A==
X-Forwarded-Encrypted: i=1; AJvYcCVfiVpdUuOgjCn9XVs4W5tpJdThuaCeAlHkhRhBvQr2Rs6Ba/76e0IQHnRHKQfChuANy50nNvLlk+Vt+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb46MPWwRFfJJZvw/xd8VqN6+UxpcFk+29+9frjc3pYWx8MU+M
	Y1gj3vMMe/gtTf8oA68Uf0Gyscfkvt1mxLliTC03UdJLofPgvroJyIOsZB/tzQLRq8kQFSjuBTE
	+7QDwGUJQkW1LUSlQy4Zp75OTjPLVx8Ll6r1oLV/z8A==
X-Gm-Gg: ASbGncuWLVTS6Sfl5TxaUwug2OC5A52lzO36ssFYd5SXTyFEBfTn9ELt8S2f2fvvE4I
	WC25d3xipTy/vKWdhDNpUn2gGvm5Rk5/h1L/4YXA9UMx6PpM10nM/DMeXWGo/5Lb/YM2mhl5oqp
	fsPR+H5IWs4d7s/DzZ0PeUc1UDevtjm749hkw5ejaY3Kwr2k+Oz5JO2AKO6ZYnP9E=
X-Google-Smtp-Source: AGHT+IFmvaUxKM2YmSDzUPFoymenSB08cxuJBJYeqTxsL+DsKne2xe1WD05RHO30V66uoOomO/WhoKlJDKAjJemViv0=
X-Received: by 2002:a05:6512:1101:b0:553:24b7:2f61 with SMTP id
 2adb3069b0e04-55356df2b3cmr1838173e87.57.1749111024615; Thu, 05 Jun 2025
 01:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
 <20250603-whispering-jaybird-of-thunder-f87867@kuoka> <d42a8c49-7ad2-49ef-bd9c-1e3d9981b58e@samsung.com>
 <e5a0bee2-ff74-47cf-ad2c-0c78b57ae6cf@kernel.org> <a6a29e58-8613-47f0-9e5c-d125da7ddb49@samsung.com>
 <cc4dbf7c-e023-403c-88be-4691f97a0ff0@kernel.org> <c7774790-07c3-469d-a994-9e84108ad21d@samsung.com>
In-Reply-To: <c7774790-07c3-469d-a994-9e84108ad21d@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Jun 2025 10:10:12 +0200
X-Gm-Features: AX0GCFvEjcOAzs8GqTAWhoTL8unWEk1FSQC7E_ts2kCxQpL9-TEmMcPX7FYfnJE
Message-ID: <CAMRc=Mexq9ThfG6jZUbs3wYDA9UZN-+pHnX_Y-7WO4ubXvEuCw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250605_011027_605457_A0327F95 
X-CRM114-Status: GOOD (  35.63  )
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCA5OjQ34oCvQU0gTWljaGFsIFdpbGN6eW5za2kKPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gNi80LzI1IDE0OjA3LCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gMDQvMDYvMjAyNSAxMzo1MywgTWljaGFsIFdp
bGN6eW5za2kgd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gVGhlIEdQVSBub2RlIHdpbGwgZGVwZW5kIG9u
IHRoZSBBT04gbm9kZSwgd2hpY2ggd2lsbCBiZSB0aGUgc29sZQo+ID4+Pj4gcHJvdmlkZXIgZm9y
IHRoZSAnZ3B1LXBvd2VyJyBzZXF1ZW5jZXIgKGJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIGluIHBh
dGNoCj4gPj4+PiAxKS4KPiA+Pj4+Cj4gPj4+PiBUaGVyZWZvcmUsIGlmIHRoZSBBT04vcHdyc2Vx
IGRyaXZlciBoYXMgYWxyZWFkeSBjb21wbGV0ZWQgaXRzIHByb2JlLCBhbmQKPiA+Pj4+IGRldm1f
cHdyc2VxX2dldCgpIGluIHRoZSBHUFUgZHJpdmVyIHN1YnNlcXVlbnRseSByZXR1cm5zIC1FUFJP
QkVfREVGRVIKPiA+Pj4+IChiZWNhdXNlIHB3cnNlcV9nZXQgZm91bmQgJ25vIG1hdGNoJyBvbiB0
aGUgYnVzIGZvciAnZ3B1LXBvd2VyJyksIHRoZQo+ID4+Pj4gaW50ZXJwcmV0YXRpb24gaXMgdGhh
dCB0aGUgQU9OIGRyaXZlciBkaWQgbm90IHJlZ2lzdGVyIHRoaXMgb3B0aW9uYWwKPiA+Pj4+IHNl
cXVlbmNlci4gU2luY2UgQU9OIGlzIHRoZSBvbmx5IGFudGljaXBhdGVkIHNvdXJjZSwgaXQgaW1w
bGllcyB0aGUKPiA+Pj4+IHNlcXVlbmNlciB3b24ndCBiZWNvbWUgYXZhaWxhYmxlIGxhdGVyIGZy
b20gaXRzIGRlc2lnbmF0ZWQgcHJvdmlkZXIuCj4gPj4+Cj4gPj4+IEkgZG9uJ3QgdW5kZXJzdGFu
ZCB3aHkgeW91IG1hZGUgdGhpcyBhc3N1bXB0aW9uLiBBT04gY291bGQgYmUgYSBtb2R1bGUKPiA+
Pj4gYW5kIHRoaXMgZHJpdmVyIGJ1aWx0LWluLiBBT04gd2lsbCBsaWtlbHkgcHJvYmUgbGF0ZXIu
Cj4gPj4KPiA+PiBZb3UncmUgYWJzb2x1dGVseSByaWdodCB0aGF0IEFPTiBjb3VsZCBiZSBhIG1v
ZHVsZSBhbmQgd291bGQgZ2VuZXJhbGx5Cj4gPj4gcHJvYmUgbGF0ZXIgaW4gdGhhdCBzY2VuYXJp
by4gSG93ZXZlciwgdGhlIEdQVSBkZXZpY2UgYWxzbyBoYXMgYQo+ID4+ICdwb3dlci1kb21haW5z
ID0gPCZhb24gVEgxNTIwX0dQVV9QRD4nIGRlcGVuZGVuY3kuIElmIHRoZSBBT04gZHJpdmVyIChh
cwo+ID4+IHRoZSBQTSBkb21haW4gcHJvdmlkZXIpIHdlcmUgYSBsYXRlIHByb2JpbmcgbW9kdWxl
LCB0aGUgR1BVIGRyaXZlcidzCj4gPj4gcHJvYmUgd291bGQgaGl0IC1FUFJPQkVfREVGRVIgd2hl
biBpdHMgcG93ZXIgZG9tYWluIGlzIHJlcXVlc3RlZAo+ID4+IHdoaWNoIGhhcHBlbnMgYmVmb3Jl
IGF0dGVtcHRpbmcgdG8gZ2V0IG90aGVyIHJlc291cmNlcyBsaWtlIGEgcG93ZXIKPiA+PiBzZXF1
ZW5jZXIuCj4gPgo+ID4gSHVoLCBzbyBiYXNpY2FsbHkgeW91IGltcGx5IGNlcnRhaW4gaGFyZHdh
cmUgZGVzaWduIGFuZCBjZXJ0YWluIERUUwo+ID4gZGVzY3JpcHRpb24gaW4geW91ciBkcml2ZXIg
Y29kZS4gV2VsbCwgdGhhdCdzIGNsZWFybHkgZnJhZ2lsZSBkZXNpZ24gdG8KPiA+IG1lLCBiZWNh
dXNlIHlvdSBzaG91bGQgbm90IHJlbHkgaG93IGhhcmR3YXJlIHByb3BlcnRpZXMgYXJlIHByZXNl
bnRlZCBpbgo+ID4gRFRTLiBXaWxsIHdvcmsgaGVyZSBvbiB0aDE1MjAgd2l0aCB0aGlzIERUUywg
d29uJ3Qgd29yayB3aXRoIHNvbWV0aGluZyBlbHNlLgo+ID4KPiA+IEVzcGVjaWFsbHkgdGhhdCB0
aGlzIGxvb2tzIGxpa2UgZ2VuZXJpYyBJbWFnaW5hdGlvbiBHUFUgY29kZSwgY29tbW9uIHRvCj4g
PiBtdWx0aXBsZSBkZXZpY2VzLCBub3QgVEgxNTIwIG9ubHkgc3BlY2lmaWMuCj4gPgo+ID4+Cj4g
Pj4gU28sIGlmIHRoZSBHUFUgZHJpdmVyJ3MgY29kZSBkb2VzIHJlYWNoIHRoZSBkZXZtX3B3cnNl
cV9nZXQoZGV2LAo+ID4+ICJncHUtcG93ZXIiKSBjYWxsLCBpdCBzdHJvbmdseSBpbXBsaWVzIHRo
ZSBBT04gZHJpdmVyIGhhcyBhbHJlYWR5Cj4gPj4gc3VjY2Vzc2Z1bGx5IHByb2JlZC4KPiA+Pgo+
ID4+IFRoaXMgbGVhZHMgdG8gdGhlIGNvcmUgY2hhbGxlbmdlIHdpdGggdGhlIG9wdGlvbmFsICdn
cHUtcG93ZXInCj4gPj4gc2VxdWVuY2VyOiBFdmVuIGlmIHRoZSBBT04gZHJpdmVyIGhhcyBhbHJl
YWR5IHByb2JlZCwgaWYgaXQgdGhlbiBjaG9vc2VzCj4gPj4gbm90IHRvIHJlZ2lzdGVyIHRoZSAi
Z3B1LXBvd2VyIiBzZXF1ZW5jZSAoYmVjYXVzZSBpdCdzIGFuIG9wdGlvbmFsCj4gPj4gZmVhdHVy
ZSksIHB3cnNlcV9nZXQoKSB3aWxsIHN0aWxsIGZpbmQgIm5vIGRldmljZSBtYXRjaGVkIiBvbiB0
aGUKPiA+PiBwd3JzZXFfYnVzIGFuZCByZXR1cm4gRVBST0JFX0RFRkVSLgo+ID4+Cj4gPj4gSWYg
dGhlIEdQVSBkcml2ZXIgZGVmZXJzIGhlcmUsIGFzIGl0IG5vcm1hbGx5IHNob3VsZCBmb3IgLUVQ
Uk9CRV9ERUZFUiwKPiA+PiBpdCBjb3VsZCB3YWl0IGluZGVmaW5pdGVseSBmb3IgYW4gb3B0aW9u
YWwgc2VxdWVuY2UgdGhhdCBpdHMKPiA+PiBhbHJlYWR5IHByb2JlZCBBT04gcHJvdmlkZXIgd2ls
bCBub3Qgc3VwcGx5Lgo+ID4+Cj4gPj4gQW55d2F5IEkgdGhpbmsgeW91J3JlIHJpZ2h0LCB0aGF0
IHRoaXMgaXMgcHJvYmFibHkgY29uZnVzaW5nIGFuZCB3ZQo+ID4+IHNob3VsZG4ndCByZWx5IG9u
IHRoaXMgYmVoYXZpb3IuCj4gPj4KPiA+PiBUbyBzb2x2ZSB0aGlzLCBhbmQgdG8gYWxsb3cgdGhl
IEdQVSBkcml2ZXIgdG8gY29ycmVjdGx5IGhhbmRsZQo+ID4+IC1FUFJPQkVfREVGRVIgd2hlbiBh
IHNlcXVlbmNlciBpcyBnZW51aW5lbHkgZXhwZWN0ZWQsIEkgcHJvcG9zZSB1c2luZyBhCj4gPj4g
Ym9vbGVhbiBwcm9wZXJ0eSBvbiB0aGUgR1BVJ3MgRFQgbm9kZSwgZS5nLgo+ID4+IGltZyxncHUt
ZXhwZWN0cy1wb3dlci1zZXF1ZW5jZXIuIElmIHRoZSBHUFUgbm9kZSBwcm92aWRlcyB0aGlzIHBy
b3BlcnR5Cj4gPj4gaXQgbWVhbnMgdGhlIHB3cnNlcSAnZ3B1LXBvd2VyJyBpcyByZXF1aXJlZC4K
PiA+Cj4gPiBObywgdGhhdCB3b3VsZCBiZSBkcml2ZXIgZGVzaWduIGluIERUUy4KPiA+Cj4gPiBJ
IHRoaW5rIHRoZSBtYWluIHByb2JsZW0gaXMgdGhlIHB3cnNlcSBBUEk6IHlvdSBzaG91bGQgZ2V0
IHZpYSBwaGFuZGxlLAo+ID4gbm90IG5hbWUgb2YgdGhlIHB3cnNlcSBjb250cm9sbGVyLiBUaGF0
J3MgaG93IGFsbCBwcm9kdWNlci1jb25zdW1lcgo+ID4gcmVsYXRpb25zaGlwcyBhcmUgZG9uZSBp
biBPRiBwbGF0Zm9ybXMuCj4KPiBCYXJ0LAo+IEdpdmVuIEtyenlzenRvZidzIHZhbGlkIGNvbmNl
cm5zIGFib3V0IHRoZSBjdXJyZW50IG5hbWUgYmFzZWQKPiBsb29rdXAgaW4gcHdyc2VxX2dldCgp
IGFuZCB0aGUgYmVuZWZpdHMgb2YgcGhhbmRsZSBiYXNlZCByZXNvdXJjZQo+IGxpbmtpbmcgaW4g
T0YgcGxhdGZvcm1zOiBXb3VsZCB5b3UgYmUgb3BlbiB0byBhIHByb3Bvc2FsIGZvciBleHRlbmRp
bmcKPiB0aGUgcHdyc2VxIEFQSSB0byBhbGxvdyBjb25zdW1lcnMgdG8gb2J0YWluIGEgc2VxdWVu
Y2VyIChvciBhIHNwZWNpZmljCj4gdGFyZ2V0IHNlcXVlbmNlKSB2aWEgYSBwaGFuZGxlIGRlZmlu
ZWQgaW4gdGhlaXIgRGV2aWNlIFRyZWUgbm9kZT8gRm9yCj4gaW5zdGFuY2UsIGEgY29uc3VtZXIg
ZGV2aWNlIGNvdWxkIHNwZWNpZnkgcG93ZXItc2VxdWVuY2VyID0KPiA8JmFvbj4gYW5kIGEgbmV3
IEFQSSB2YXJpYW50IGNvdWxkIHJlc29sdmUgdGhpcy4KPgoKSSBjYW4gYmUgb3BlbiB0byBpdCBh
bGwgSSB3YW50LCBidXQgSSBiZXQgS3J6eXN6dG9mIHdvbid0IGJlIG9wZW4gdG8KaW50cm9kdWNp
bmcgYW55dGhpbmcgbGlrZSBhIHBvd2VyLXNlcXVlbmNlciBkZXZpY2UgcHJvcGVydHkgaW4gRFQK
YmluZGluZ3MuIFNpbXBseSBiZWNhdXNlIHRoZXJlJ3Mgbm8gc3VjaCB0aGluZyBpbiB0aGUgcGh5
c2ljYWwgd29ybGQuClRoZSBjb25jZXB0IGJlaGluZCB0aGUgcG93ZXIgc2VxdWVuY2luZyBmcmFt
ZXdvcmsgd2FzIHRvIGJpbmQKcHJvdmlkZXJzIHRvIGNvbnN1bWVycyBiYXNlZCBvbiBleGlzdGlu
ZyBsaW5rcyBtb2RlbGxpbmcgcmVhbCBkZXZpY2UKcHJvcGVydGllcyAod2hpY2ggYSAicG93ZXIt
c2VxdWVuY2VyIiBpcyBub3QpLiBJIGNvbW1lbnRlZCBvbiBpdCB1bmRlcgphbm90aGVyIGVtYWls
IHNheWluZyB0aGF0IHlvdSBhbHJlYWR5IGhhdmUgYSBsaW5rIGhlcmUgLSB0aGUKcG93ZXItZG9t
YWlucyBwcm9wZXJ0eSB0YWtpbmcgdGhlIGFvbiBwaGFuZGxlLiBJbiB5b3VyIHB3cnNlcQpwcm92
aWRlcidzIG1hdGNoKCkgY2FsbGJhY2sgeW91IGNhbiBwYXJzZSBhbmQgcmVzb2x2ZSBpdCBiYWNr
IHRvIHRoZQphb24gbm9kZSB0aHVzIG1ha2luZyBzdXJlIHlvdSdyZSBtYXRjaGluZyB0aGUgY29u
c3VtZXIgd2l0aCB0aGUKY29ycmVjdCBwcm92aWRlci4KClBsZWFzZSB0YWtlIGEgbG9vayBhdCB0
aGUgZXhpc3Rpbmcgd2NuIHB3cnNlcSBkcml2ZXIgd2hpY2ggZG9lcyBhCnNpbWlsYXIgdGhpbmcg
YnV0IHBhcnNlcyB0aGUgcmVndWxhdG9yIHByb3BlcnRpZXMgb2YgdGhlIHBvd2VyCm1hbmFnZW1l
bnQgdW5pdCAoaW4gdGhlIHB3cnNlcV9xY29tX3djbl9tYXRjaCgpIGZ1bmN0aW9uKS4KCldlJ3Zl
IHRyaWVkIHRvIGRvIHNvbWV0aGluZyBsaWtlIHdoYXQgeW91J3JlIHByb3Bvc2luZyBmb3IgeWVh
cnMgYW5kCml0IGFsd2F5cyBnb3Qgc3R1Y2sgb24gdGhlIGZhY3QgdGhhdCBEVCBtdXN0IG5vdCBt
YWtlIHVwIGJvZ3VzCnByb3BlcnRpZXMgb25seSB0byBzYXRpc2Z5IHRoZSBkcml2ZXIgaW1wbGVt
ZW50YXRpb24uIFdlJ3ZlIGRvbmUgaXQgaW4KdGhlIHBhc3QsIHRoYXQncyB0cnVlLCBidXQganVz
dCBiZWNhdXNlIHdlIGRpZG4ndCBrbm93IGFueSBiZXR0ZXIgYW5kCkRUIG1haW50YWluZXJzIGFy
ZSBjdXJyZW50bHkgbXVjaCBzdHJpY3RlciBhcyB0byB3aGF0IGtpbmQgb2YKcHJvcGVydGllcyB0
byBhbGxvdy4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
