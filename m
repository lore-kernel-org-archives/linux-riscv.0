Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CD4C7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cho+7cSPqQeY+61jC+Ma46sjd2hbMPHYupJF0pXrZz0=; b=nE2c+3f1Htyod3
	Qrzq6+etGLf5FELJjZ1SqOUs315x+i3GejwBbb3zdOyjQ/CoagMzU44e2lXVjCy6Wm44SlDmR7dFX
	PejjyTcFP8HtXgvL6XzgdATbwJfvroBWGCK0OoDSyLPv/4wHdTkvfQbiKJhfBsb213He+xBvRIi8Y
	HoELjS6Kxs/vIAPF/9Sm6zbMWjyc2B/RruIi9yQft+XZ4GY/s4efhPEW1pgAvF03oUzfDZVUhB7x0
	9wgDuy/qqmo26cbN6qIN9Tt4iiMeV6n8zMJdM7rhhS/vqvQtcJi2cMTcfB/xuuAO24RmCa80DUxN1
	rzeXKp6M4kuo7z1jvuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUM-0000000DVyr-2E30;
	Thu, 19 Jun 2025 15:47:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEQj-0000000D3vu-23mP
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 12:31:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-553b82f3767so661534e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 05:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750336304; x=1750941104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMcCgVRWuLovCnQmwobA6BOzc9WI8fy/gQWq8E19Azw=;
        b=n8fm/lk6EYTEk9kU1nmIaonU5b1+q8qjv9YduwlTqnNYkHC3vhxEPWD5cIzNb5G/ID
         wQFaiLLPm53NBYJGnBXeMyyvLCoDhkcb/FPGmKVMQAEuoCK0bzLKpNG0Z1TNHmi4zz0U
         RuMqo/dNtMXDEW/HZesNqVhjPPx0VpklqOjc/aW84JbfAOMfEE7BJvRaOVHUPmppgN4y
         m2xrGYiXRKaxIidqjXgOzBcrUcUBkwf6FhS83BXgQ9KZZxzA6q+6C11PPRYVosFmdzt/
         UZ+Aavq4hfXEt2KT2D2t2RAGEfufHg+a9I7gj+jilsK7sryGv16vddoyK25Ldkpc+C/C
         VZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336304; x=1750941104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMcCgVRWuLovCnQmwobA6BOzc9WI8fy/gQWq8E19Azw=;
        b=XDm7tWHufHNaTJsz6rKd3qKigTn+RC5Ov/jAmcQLJQUlFpYNPS9OkqgJC5BkIC+9n1
         g4v8uv602yQ1V0xr3eWV8CefSwdNFPnr2DxtSbdp34dwr41GVNV+FO7FO4gm1wMWkeZd
         k/46vluBd9aKnzVY2jUJ/5TRLcB5crw9cOTEihXsto39bHs+PNE0BI/uki4Ifdecy/9h
         1BHE4gqHisDZgqENZnG+u0qHTuawKX43+4qC+xNj6EpiY45EBkZ9d40/K3miqURqLN2S
         plk5M46aTqFVcv/Pe/H1fGgB3JscQuGy/48HGHY8O69hT+BDodE2hFux4Q2z/ryibRx3
         lEag==
X-Forwarded-Encrypted: i=1; AJvYcCUTZDrdMnlLVIWqeCp8nVKHbVfeUvuRV1uf9irSoEU6dKk5KsEw6lTW1TUMv/R5NHaqAAtTTQCKoHB25w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3yHQUzZmw5d8YH04Ru5PoKHDEm7FTxzhiwZ+6mmI6KilR8lQU
	/52Pq8GDwe8i4MULCG8kIWPeVfU1q7l1hSgreMXeI0su83QOdDPFwLFufMRjqSwO7ljeKgbC1zJ
	utZ66/A6Xrp1wMLhHYYCIUvUSIh0wC+tB7UqUGMy3wA==
X-Gm-Gg: ASbGncv5D4orwK3mlBIu+ztMGCfE61M6xPf2GJy5xit3Ne6Jieq7jpfEW571KaQyAMb
	HSoGwhNSHtc75MUzKIkksrQuPCkElXnK071PPMsBrJy0l5ilh9i9Kao5bGRlfQIHR3cq2bmq0PE
	xDakuk/VhEu/l8CE8P5wTKTZJeW6YzhASHMq4e2iWKIjwX0GLIdnGSaui4KAfr7dgdi2rstMV6d
	eI=
X-Google-Smtp-Source: AGHT+IHnuVpyxaUGV1/CRhQuo9bKehpcx5lRIL+L/i/s21Xafs+bJVvPVmoWpCvGx60h0BZ9+f65HqFMJzZRubWTK2s=
X-Received: by 2002:a05:6512:3a92:b0:553:26a7:70ec with SMTP id
 2adb3069b0e04-553b6d9eb20mr5867264e87.0.1750336303504; Thu, 19 Jun 2025
 05:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com> <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com>
In-Reply-To: <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 14:31:32 +0200
X-Gm-Features: AX0GCFvVV9T1_PzhkFci_vmPMYmYNx0pAplO5ttJMtFBTyUJUhAUxypAYMCTkw8
Message-ID: <CAMRc=Mf+o524rewPrtZGJhE11Gwp6v8A2V6zjGr3e1PmQq7aJw@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250619_053145_631789_0E6C8DD6 
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

T24gVGh1LCBKdW4gMTksIDIwMjUgYXQgMTI6MjXigK9QTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNz
b25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDE4IEp1biAyMDI1IGF0IDEyOjIyLCBN
aWNoYWwgV2lsY3p5bnNraQo+IDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4K
PiA+IEluIG9yZGVyIHRvIHN1cHBvcnQgdGhlIGNvbXBsZXggcG93ZXIgc2VxdWVuY2luZyByZXF1
aXJlZCBieSB0aGUgVEgxNTIwCj4gPiBHUFUsIHRoZSBBT04gcG93ZXIgZG9tYWluIGRyaXZlciBt
dXN0IGJlIHJlc3BvbnNpYmxlIGZvciBpbml0aWF0aW5nIHRoZQo+ID4gY29ycmVzcG9uZGluZyBz
ZXF1ZW5jZXIgZHJpdmVyLiBUaGlzIGZ1bmN0aW9uYWxpdHkgaXMgc3BlY2lmaWMgdG8KPiA+IHBs
YXRmb3JtcyB3aGVyZSB0aGUgR1BVIHBvd2VyIHNlcXVlbmNpbmcgaGFyZHdhcmUgaXMgY29udHJv
bGxlZCBieSB0aGUKPiA+IEFPTiBibG9jay4KPiA+Cj4gPiBFeHRlbmQgdGhlIEFPTiBwb3dlciBk
b21haW4gZHJpdmVyIHRvIGNoZWNrIGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlCj4gPiAiZ3B1LWNs
a2dlbiIgcmVzZXQgaW4gaXRzIG93biBkZXZpY2UgdHJlZSBub2RlLgo+ID4KPiA+IElmIHRoZSBw
cm9wZXJ0eSBpcyBmb3VuZCwgY3JlYXRlIGFuZCByZWdpc3RlciBhIG5ldyBhdXhpbGlhcnkgZGV2
aWNlLgo+ID4gVGhpcyBkZXZpY2UgYWN0cyBhcyBhIHByb3h5IHRoYXQgYWxsb3dzIHRoZSBkZWRp
Y2F0ZWQgYHB3cnNlcS10aGVhZC1ncHVgCj4gPiBhdXhpbGlhcnkgZHJpdmVyIHRvIGJpbmQgYW5k
IHRha2UgY29udHJvbCBvZiB0aGUgc2VxdWVuY2luZyBsb2dpYy4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgo+Cj4gUmV2
aWV3ZWQtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+Cj4gSXQgbG9v
a3MgbGlrZSB0aGVyZSBpcyBhbm90aGVyIHJlLXNwaW4gbmVlZGVkLCBidXQgdGhpbmtpbmcgb2Yg
dGhlCj4gbWVyZ2Utc3RyYXRlZ3kgSSBjb3VsZCBwb3RlbnRpYWxseSB0YWtlIHBhdGNoMS0+cGF0
Y2gzIHZpYSBteSBwbWRvbWFpbgo+IHRyZWUsIGFzIGl0IHNlZW1zIHJlYXNvbmFibGUgdG8ga2Vl
cCB0aG9zZSBjaGFuZ2VzIHRvZ2V0aGVyLiBVbmxlc3MKPiBCYXJ0b3N6IHNlZXMgYW55IHByb2Js
ZW0gd2l0aCB0aGF0LCBvZiBjb3Vyc2UuCj4KCkkgaGF2ZSBhbm90aGVyIGNoYW5nZSBwbGFubmVk
IGZvciB0aGUgcHdyc2VxIEFQSSBmb3IgdGhpcyBjeWNsZS4KTm90aGluZyBtYWpvciBidXQgaXQg
c3RpbGwgd2lsbCByZXF1aXJlIHBhdGNoIDEvOCB0byBiZSBpbiBteSB0cmVlIHNvCmlmIHlvdSBk
b24ndCBtaW5kLCBJJ2xsIHRha2UgaXQgaHJvdWdoIHRoZSBwd3JzZXEgdHJlZSBhbmQgcHJvdmlk
ZSB5b3UKYW4gaW1tdXRhYmxlIHRhZyB0byBwdWxsIGJlZm9yZSB5b3UgYXBwbHkgdGhlIHJlc3Q/
CgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
