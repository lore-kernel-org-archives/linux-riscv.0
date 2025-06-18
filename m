Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95DEC7115F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+Tohqff3EBpnfR7j9tUHWXhvcNnooqD30irIss0Ct0=; b=EpSPT9etL67phQ
	WMBu2qB/u6NYsvD2jpatt1ErbCGb1YizwmSf5Y4RVnwDvvs/ERzEZZadwM05i260nNcEZz5jEHRNw
	sxNzStxgarbh6xoT8/BdePjnO8Ig9r5+w1WI4+KI5GgXbCyKoZBB2Zn0QjkuMAIlfJK82YyRaXtsi
	0jkn65UpsJMP90MZPkJpgRi9Qwxp2bNhTcDruZ54YBOR5VT1Vb0wdecBrq68epTWjzdoiGGdAHV2P
	5FQPjhxLGdhlMvVUWYlK74mAE0H3zTwuLrXfgz859YjSQ91Q4KA0lJP/BSoGMuFw6oTkfRsZC80E0
	E86dYdRVw4V/KSXX0x5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRugy-0000000AaqR-3ccn;
	Wed, 18 Jun 2025 15:27:12 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt2F-0000000AKnt-02TY
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:41:04 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so887764e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254061; x=1750858861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrPSIGFdDvH/sqDpr0dCl/uxSDMMDHtGVw2V0lw2wqI=;
        b=BE66OD7Og2PG72UkUdb1ht/ZOoi/rAQDc6udyQQ6ANf0DHd7qBbP0FFA1rrOeRwFHJ
         x2Rnh06x3xrMMlvXEP46WIH0iFOEgr3xyIjRf6F7i0vkpc/FkyFr41euc9K7jkg+lNTl
         K3Fuhkj21/UThL5xhhh1u4gAC6e+8O8XB685XaTgisNVKUCl/3xe/Up57Rh4bFsfFgeH
         8hle24Zy8FDRfb1WAGqfajX62WQPJCpoIyHWQ3z8yWsVu41ILHus4KqSxNefrET925cF
         iYj/OGZDcDXPZEnxLhv9OyM18JzOU67+e4tGUuZCPT4P5jBmlDJkiFtcBAxhVnz+XuCY
         42LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254061; x=1750858861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrPSIGFdDvH/sqDpr0dCl/uxSDMMDHtGVw2V0lw2wqI=;
        b=oR6AZFznNKeQeUWKXZTrnAJ0uJSALTz4oaO3inZGm+/0Q8ZzYnys2030ZwRwSamAe4
         lkHAzi+GX1gYMAwl2EO8bLc+malTZDVQxYIUre3sG7r5+WjwvqKqaMhbZBassDBsSdWu
         CF4V6yj9g4gZ84HejiTxK5h2HIEhHD5y8Ws6sVDa3t0e1H15u3KeEnBUGsPmURp2zznp
         le27qjDnz8x5dxvDXRrCBNRAr7AfKaUBbMJblFUH/DP21u2Y9JUPZgZZgWy5ralvpsfx
         F0ykHF+4yaFE9j8zt+qK3biDQ/DSllRRxNrFDRo2ogzsrCgE3kIDQWbZbf0r2ZVPhOJw
         ozUA==
X-Forwarded-Encrypted: i=1; AJvYcCVU2uJkFXxPc4AO2HXAlv80Gxv9k89QXvCvJROMPlc0KKzwQujof6OjRTmqruJKqivHmMth/Gpapr+Jxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ/CxpUIesn49714HmNc+HH46Qplo0lnfFiNsJi+EiiFOVkkNb
	AhjQNa5YiMno7a3GcTOKVPMUlbJ/DCMYqowNn4wtbDDaiBXhGDiObBH2SXCjn4AWvH+KZRNuVeF
	eIgxqOSPgUnboKHHc0wmw792WqSYNZ9wsOWIBRI0/7g==
X-Gm-Gg: ASbGncvADBZkE8AQM/m/12n2KRAjPSkAfV5cy92y/Yls7ZmLCZQ3Fq2+oMzS0zFTIHN
	TCItGjch7T+YU3JzU5Bo9rkOBXgDm5BkCH8Ft4xKIYkgSX5Q+PGQlwYUZkOPf0A4zqUf/7FCWpZ
	M82Ls+q2tdqb6SEGDXtW2/eYvkg1yuWSoPmTviMWBBWbIVTXtJETFpBH92l58OM+xSBmYMGuk3+
	g==
X-Google-Smtp-Source: AGHT+IFaBv4NoyscEiYMrPy3nG50l45WGg0pb5gyw3nSvWsy9OTHWeanUensQSBBIwLRpHNCc71NZbTtG782jD+L4SY=
X-Received: by 2002:a05:6512:150b:10b0:553:d884:7933 with SMTP id
 2adb3069b0e04-553d8847a54mr20662e87.6.1750254061265; Wed, 18 Jun 2025
 06:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102227eucas1p26e8968805092c3ce0ecbe84e9724a6e2@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:40:50 +0200
X-Gm-Features: AX0GCFv9aAVOTlnyOx9_bS0PZ0O5sUFY83rUOThbfDgpmQkEdj-PgI3MnYHtNsE
Message-ID: <CAMRc=Mdv24kKJRKMyp2zpNtumZLV5QN=KvvENr8GXfORAC9Cpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
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
X-CRM114-CacheID: sfid-20250618_064103_047891_B920EDDD 
X-CRM114-Status: GOOD (  16.69  )
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
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEV4dGVuZCB0aGUgVEgxNTIwIEFPTiB0
byBkZXNjcmliZSB0aGUgR1BVIGNsa2dlbiByZXNldCBsaW5lLCByZXF1aXJlZAo+IGZvciBwcm9w
ZXIgR1BVIGNsb2NrIGFuZCByZXNldCBzZXF1ZW5jaW5nLgo+Cj4gVGhlIFQtSEVBRCBUSDE1MjAg
R1BVIHJlcXVpcmVzIGNvb3JkaW5hdGVkIG1hbmFnZW1lbnQgb2YgdHdvIGNsb2Nrcwo+IChjb3Jl
IGFuZCBzeXMpIGFuZCB0d28gcmVzZXRzIChHUFUgY29yZSByZXNldCBhbmQgR1BVIGNsa2dlbiBy
ZXNldCkuCj4gT25seSB0aGUgY2xrZ2VuIHJlc2V0IGlzIGV4cG9zZWQgYXQgdGhlIEFPTiBsZXZl
bCwgdG8gc3VwcG9ydCBTb0MKPiBzcGVjaWZpYyBpbml0aWFsaXphdGlvbiBoYW5kbGVkIHRocm91
Z2ggYSBkZWRpY2F0ZWQgYXV4aWxpYXJ5IHBvd2VyCj4gc2VxdWVuY2luZyBkcml2ZXIuIFRoZSBH
UFUgY29yZSByZXNldCByZW1haW5zIGRlc2NyaWJlZCBpbiB0aGUgR1BVCj4gZGV2aWNlIG5vZGUs
IGFzIGZyb20gdGhlIEdQVSBkcml2ZXIncyBwZXJzcGVjdGl2ZSwgdGhlcmUgaXMgb25seSBhCj4g
c2luZ2xlIHJlc2V0IGxpbmUgWzFdLgo+Cj4gVGhpcyBmb2xsb3dzIHVwc3RyZWFtIG1haW50YWlu
ZXJzJyByZWNvbW1lbmRhdGlvbnMgWzJdIHRvIGFic3RyYWN0IFNvQwo+IHNwZWNpZmljIGRldGFp
bHMgaW50byB0aGUgUE0gZG9tYWluIGxheWVyIHJhdGhlciB0aGFuIGV4cG9zaW5nIHRoZW0gdG8K
PiBkcml2ZXJzIGRpcmVjdGx5Lgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzgxNmRiOTlkLTcwODgtNGMxYS1hZjAzLWI5YTgyNWFjMDlkY0BpbWd0ZWMuY29tLyAtIFsxXQo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8zOGQ5NjUwZmMxMWE2NzRjOGI2ODlk
NmJhYjkzN2FjZkBrZXJuZWwub3JnLyAtIFsyXQo+Cj4gUmV2aWV3ZWQtYnk6IFVsZiBIYW5zc29u
IDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenlu
c2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLnlhbWwgfCA3ICsrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9u
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvdGhlYWQs
dGgxNTIwLWFvbi55YW1sCj4gaW5kZXggYmJjMTgzMjAwNDAwZGU3YWFkYmIyMWZlYTIxOTExZjZm
NDIyN2IwOS4uMzM2NTEyNGM3ZmQ0NzM2OTIyNzE3YmQzMWNhYTEzMjcyZjRhNGVhNiAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvdGhlYWQs
dGgxNTIwLWFvbi55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1hb24ueWFtbAo+IEBAIC0zMiw2ICszMiwxMyBAQCBwcm9w
ZXJ0aWVzOgo+ICAgICAgaXRlbXM6Cj4gICAgICAgIC0gY29uc3Q6IGFvbgo+Cj4gKyAgcmVzZXRz
Ogo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgcmVzZXQtbmFtZXM6Cj4gKyAgICBpdGVtczoK
PiArICAgICAgLSBjb25zdDogZ3B1LWNsa2dlbgo+ICsKPiAgICAiI3Bvd2VyLWRvbWFpbi1jZWxs
cyI6Cj4gICAgICBjb25zdDogMQo+Cj4KPiAtLQo+IDIuMzQuMQo+CgpSZXZpZXdlZC1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
