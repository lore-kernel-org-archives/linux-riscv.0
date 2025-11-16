Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74FCCD4F3E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 14:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Olxwuy+GZw3fEIAAX5wg5UNgsEbFoJZYe1Nd6nH+uAU=; b=FCBqX/g2Kxod3T
	TvFCuVABX4n/oGhNcLs+OKZeYPZDqOmZFeYBMuHExItJAtZeHbWlsTALCvY8ygILsSOQqmrBgTQp7
	jEOG8WgPQZYMV3ow0RyUtZtaG0PfanjU9UCit/oNdgGEDdpZl3Dz4PJNRXge4t0UHHraXd2sMSbRB
	aSDYmG2EYSZ99N6b7i5q4F0/TT+Z2cy6DZQgkxhrjCWEUmDeBLLWS4RR1dNFNBfrAIKl4qd2zr+3L
	K1VzXZu4y7lI+X9/x5RZVz6yIM2V4V7h3GKrU5VlD8KgTk44v39eKwOI35iS7kySX7CymRKo38qqn
	BDUfY/dzWZeRAL4dLmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdSt-0000000EjIP-45MT;
	Sun, 16 Nov 2025 14:10:52 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdSr-0000000EjI1-0M5b
	for linux-riscv@lists.infradead.org;
	Sun, 16 Nov 2025 14:10:50 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59581e32163so3131671e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Nov 2025 06:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763302247; x=1763907047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1P5GUNQOH0XPCOyCgZr+gwsMYMYyLhVYsxtxGdPiZx4=;
        b=NnkEvC9OTQD5ZkzshlFf66FlePi0JkNm5oVDl/lmfPCSbyfirQ0x5i/KTE5+CyRQJ6
         1g34paOxoHMKIvpwdFJQVYorfQDneO7iSllt5OfVWAPiRulbEDNy36CUtRIuSflmzH8r
         Wz7q4SDF7QRjlqbCJ4WpkjOtYIoT5LIqACWbP1rGRYGLtOiV6OUQL06GFYkh0yXe2/sj
         PB5o1UnLq9iWoDtsNsUQZWgPO4NFcemnjzcb1LjEn1PfSERn7+o1EZUWHQhahcBstz7z
         rQLdZN1L2YVGtHJKAOn88aoVwvFu75ymJlJ2udtauJ1CghLYbhmO6nPR0eblZzktc49E
         FiIw==
X-Forwarded-Encrypted: i=1; AJvYcCXducFnXxZHfnzA2PCCd80G0lg7+Mmp6WkmWwrfULkiO2WGIC9tyxTDchJny50cpbHnYcOOnpEerb0vEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxprdM4vtkTM4Y+EzyXjNO9xQCTewwLtxAK1dv7l2IJePkhaGLX
	BLN+PWEmc7ngqpVj3U7ecxVF82EJgBFnEpezHwtUU3cw+Wu1tyIWZ9xzW2qVTfLjYfg=
X-Gm-Gg: ASbGncsLDi7tFunvsjCLlh0/rAc9c+hedUZlj1X97scNfCOfA2+w3xe8fNhHICwvqo7
	k+DIcza0KiYusSHG3WJ0oxNeyy+IPu+Kxnq7Pa1BBdcNIxaOi3JseHPvpN1OWBjtKhnnX6OsIaZ
	QXugsXJEcOk9IgXym0P//3M6VZ/iYaajG/gX9VOBtXvqsyeG0ZyebbJwmqiz2fPjUdNPHw9IKKg
	MTQtFy9/H3NRI3i3IPBbYeeV1QtvstIePqiXSrFjKJlJZQsQxwYJJ6ZTfkY4eLqRom50uRV8Z4A
	lkGvkAhHMzWRkdTAAoSlitLnsVfCrZvKEdbJwoM1ElWWng9XW5R3w91oF8dJwfPOZB8WVO8wDFC
	HtN7/fknGI5nffoi74aLArRBzbzpiCBGjqdGCb6QK24YWBDwJH/EHtXGK9s8VzPGhBJOwsUWmHa
	pYRueRsIvICSnH7zddfuYGo+TePAWe2o46U4X4C8AqdNSk7agpNy6zQw==
X-Google-Smtp-Source: AGHT+IGlR+e/W82fzm8/P8wZQAoczKMd1Y2f4nL4L+vnmrsUd5lQA5TBdaZPJbtLP6tEioaThZBm0w==
X-Received: by 2002:a05:6512:ac4:b0:594:4ebf:e6bd with SMTP id 2adb3069b0e04-595841aa132mr3566448e87.14.1763302246216;
        Sun, 16 Nov 2025 06:10:46 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804001fasm2450320e87.57.2025.11.16.06.10.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:10:46 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a34702a20so28333501fa.3
        for <linux-riscv@lists.infradead.org>; Sun, 16 Nov 2025 06:10:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWENhDwhPQHNAe6hOysKAOCBESYWG2isbP6Nr9FZkpVjCXpqVKZQJeiuvewMs/4wUNfRZVUXt/NTaUcgg==@lists.infradead.org
X-Received: by 2002:a05:651c:440f:10b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-37babd73323mr19895421fa.37.1763301811739; Sun, 16 Nov 2025
 06:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl> <20251116134609.447043-1-kuba@szczodrzynski.pl>
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 22:03:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
X-Gm-Features: AWmQ_bnVpj5bkGX3ksszDMr19xhbiJNyazuPC_F2JRblaiVwkcXftIdoMcMBl8Q
Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_061049_696644_6588A197 
X-CRM114-Status: GOOD (  18.77  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBOb3YgMTYsIDIwMjUgYXQgOTo0NuKAr1BNIEt1YmEgU3pjem9kcnp5xYRza2kKPGt1
YmFAc3pjem9kcnp5bnNraS5wbD4gd3JvdGU6Cj4KPiBbcmVwbHlpbmcgdG8gdjEgdG8ga2VlcCB0
aGUgc2FtZSBzZXJpZXMgb24gUGF0Y2h3b3JrXQoKVGhhdCBpcyBub3QgdGhlIHJpZ2h0IHdheSB0
byBkbyBpdC4KCklmIHlvdSByZXBseSB0byBhbiBvbGQgc2VyaWVzLCB0aGUgdG9vbGluZyBkb2Vz
IG5vdCBwaWNrdXAgdGhlIG5ldyB2ZXJzaW9uCmFzIGEgc2VwYXJhdGUgc2VyaWVzLgoKQ2hlbll1
Cgo+IFNvbWUgQWxsd2lubmVyIGNoaXBzIChub3RhYmx5IHRoZSBEMXMvVDExMyBhbmQgdGhlIEEx
MDApIGhhdmUgYSAiY29tYm8KPiBNSVBJIERTSSBELVBIWSIgd2hpY2ggaXMgcmVxdWlyZWQgd2hl
biB1c2luZyBzaW5nbGUtbGluayBMVkRTMC4gVGhlIHNhbWUKPiBQRDAuLlBEOSBwaW5zIGFyZSB1
c2VkIGZvciBlaXRoZXIgRFNJIG9yIExWRFMuCj4KPiBPdGhlciB0aGFuIGhhdmluZyB0byB1c2Ug
dGhlIGNvbWJvIEQtUEhZLCBMVkRTIG91dHB1dCBpcyBjb25maWd1cmVkIGluCj4gdGhlIHNhbWUg
d2F5IGFzIG9uIG9sZGVyIGNoaXBzLgo+Cj4gVGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgc3VuNmkg
TUlQSSBELVBIWSB0byBhbHNvIHdvcmsgaW4gTFZEUyBtb2RlLiBJdAo+IGlzIHRoZW4gY29uZmln
dXJlZCBieSB0aGUgTENEIFRDT04sIHdoaWNoIGFsbG93cyBjb25uZWN0aW5nIGEKPiBzaW5nbGUt
bGluayBMVkRTIGRpc3BsYXkgcGFuZWwuCj4KPiBDaGFuZ2VzIGluIHYyL3YzOgo+IC0gQXBwbGll
ZCBjb2RlIGZvcm1hdHRpbmcgY2hhbmdlcyBmcm9tIHJldmlldyBjb21tZW50cwo+IC0gQ2hhbmdl
ZCAiZHBoeSIgdG8gImNvbWJvLXBoeSIKPiAtIE1hZGUgdGhlIExWRFMgc2V0dXAvdGVhcmRvd24g
ZnVuY3Rpb25zIGFib3J0IGVhcmx5IGluIGNhc2Ugb2YgZXJyb3IKPiAgIChhZGRpbmcgYSBwcm9w
ZXIgcmV0dXJuIHZhbHVlIHdvdWxkIHJlcXVpcmUgY2hhbmdlcyBpbiBzZXZlcmFsIGxldmVscwo+
ICAgIG9mIGNhbGxlciBmdW5jdGlvbnM7IHBlcmhhcHMgY291bGQgYmUgZG9uZSBpbiBhIHNlcGFy
YXRlIHBhdGNoKQo+IC0gQWRkZWQgdGhlIFBIWSBwcm9wZXJ0aWVzIHRvIERUIGJpbmRpbmdzCj4g
LSBSZW5hbWVkIGx2ZHMwX3BpbnMgdG8gbGNkX2x2ZHMwX3BpbnMKPiAtIFJlYmFzZWQgb24gdG9w
IG9mIGRybS9taXNjL2tlcm5lbC9mb3ItbGludXgtbmV4dAo+IC0gSG9wZWZ1bGx5IGNvcnJlY3Rl
ZCB0aGUgaW5jb21wbGV0ZSBwYXRjaCBsaXN0IG9mIHYyLCB3aGljaCBoYXBwZW5lZAo+ICAgZHVl
IHRvIGFuIFNNVFAgZXJyb3IKPgo+IEt1YmEgU3pjem9kcnp5xYRza2kgKDYpOgo+ICAgcGh5OiBh
bGx3aW5uZXI6IHBoeS1zdW42aS1taXBpLWRwaHk6IFN1cHBvcnQgTFZEUyBpbiBjb21ibyBELVBI
WQo+ICAgZHJtL3N1bjRpOiBTdXBwb3J0IExWRFMgdXNpbmcgTUlQSSBEU0kgY29tYm8gRC1QSFkK
PiAgIGRybS9zdW40aTogRW5hYmxlIExWRFMgb3V0cHV0IG9uIHN1bjIwaSBEMXMvVDExMwo+ICAg
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN1bjRpOiBBZGQgRDFzL1QxMTMgY29tYm8gRC1QSFkgYmlu
ZGluZ3MKPiAgIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjogZDFzLXQxMTM6IEFkZCBELVBIWSB0byBU
Q09OIExDRDAKPiAgIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjogZDFzLXQxMTM6IEFkZCBMVkRTMCBw
aW5zCj4KPiAgLi4uL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjRpLWExMC10Y29uLnlhbWwgICAgIHwg
IDYgKysKPiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpICAgIHwg
MTEgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMgICAgICAgICAgICB8
IDUwICsrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCAg
ICAgICAgICAgIHwgIDYgKysKPiAgZHJpdmVycy9waHkvYWxsd2lubmVyL3BoeS1zdW42aS1taXBp
LWRwaHkuYyAgIHwgNzAgKysrKysrKysrKysrKysrKysrLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDE0
MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
