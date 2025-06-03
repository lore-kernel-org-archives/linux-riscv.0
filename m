Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C738C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knuwqgfuo67i5WnXU6mll4doiOcy4EE516Az3cBWk5w=; b=yIZTE0LXFRLeeq
	wq3HJYc90c8BVkZkF00FuYFVwyODhZwd4nzmOhzBAmrPDSO6BWdOG8QGIhYHFxXeweLIbgKMaPfVv
	k3XbGbl8ciru280rCNUjAW+1piHgBVq2ym1GgemafutYt0vVK/yUT4D4C1alITillIaeXNeCucKQt
	u/JR5scbAbaOsUGWl/ZXpYkSBB8GdKHGA1ZYv14DeFjF96s5N1aDbGxED5ShK3mqmuGmmiWd24+bI
	GpvHiFri/rXToodphjoB1fHds6b4mKATMWlcssFhOaM0dGcwyWumh3Pv4P6hHxXAe3joxm8n027DU
	fd13tkJh6U0AxerNpAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMT1L-0000000BD7P-471f;
	Tue, 03 Jun 2025 14:53:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSxH-0000000BCcX-42of
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 14:49:33 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7318736e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748962170; x=1749566970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex3LHxHEHJ4BZQ38M7qwegLl2zSlvRBxwaOVQhyHde4=;
        b=2gpM1dZVmUe5jD/jCm1lh+K15UxCw7YbhxIatJ6nDQEyjn3yg1Yk5MSH/st6qBirwQ
         1lnXRUG1BaL/BQABgVWZ2OUxszP2M888ZPun2z5B4DAd6N+fGvDcIzidFRwS+yAhUZEm
         wTajDwvfA0q3DKByQoOebdUb5dKq1EUEU/0+sovPsaemjPFKNKw3TZXnoUNt+nhYqduJ
         vKqHSN6lqq4lo8z8itIs2ERNHzsYTyo48GS47ND8mfI86s6e/PMd0rKWphFJdabDsHv/
         i6aa5d6bnJWS9Gz/tV4UNbsbsM6+p4Wj6rkPQilzABKa556wcAQrxJTPrm9WpIWEC3i7
         OoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962170; x=1749566970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex3LHxHEHJ4BZQ38M7qwegLl2zSlvRBxwaOVQhyHde4=;
        b=WlJHICbDFgJV9E1jsMGobE/qo85ZnhvJxhmQY4qB2S+GUZP5xKC5wTD7oDvNGpTz5o
         KrnUbnY/7k1mz59MTuWTiSjcMOBnOSW28/Esay5Angt6GWJtMRrJZ4RuQS2zrcaT86D/
         l+nwKCf5hG0H28gblYD8BvzmTk2EMirtyVdUKejltVKW6X75lwrgOJ6ZyGgvjQT8jXIh
         3N0fwjLmuls+GmD2LzLf+7uk3H1npUWj4oLcnmR/X3A5+ESdoTZdLw7+LIofyAaTY3Mk
         G3EvJKuB46vJoyX8zfFOE6DFiSNC0uGGe12Skl5jIihPiSJzcBAlxFq3Rwrw0hhO/ipN
         dXBA==
X-Forwarded-Encrypted: i=1; AJvYcCUAmilpAVmPOwVt83bgzKICz/Df7JfY6axjXmnYds7L8O7JOsQlTHFL0u3MynWijt16PQuZr1Ptkxrbqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRAQb8ngf4KxLEZJZCS5+PfSnPLcP+th4Or1v04GuLfDuQglUG
	aYnpMDe3VHlb9rkv5l/VSwmzFrNvD+iIBleYMwQd4YdxRpngHmxBobQ5Qws6JZvVRiQV4sVSTx9
	JjOX60RCx+RXeZxO0hXOVA+dG/KEo1bUSOt6AzAlYRQ==
X-Gm-Gg: ASbGncvo5B4W9lTcs2uhQ+6lxnKoe6yZs6FDsHzp+4JcR2I5l5jb8+4Rv8Jis3iWqG6
	wdQ2FC+9SUCX4mHovJuPRz8w4I2P8j12iqsi3v0Xeuw08ixyF9AUvzTaIFRw3IuevZClfL90HaK
	uYk2TNWD7TEL9CdUe20o7xx9PD/S3lmmAeYCWSbT5R0bjwI3GBkCm/ULJvjwLu1v3OlffHO7Mge
	Q==
X-Google-Smtp-Source: AGHT+IHc0KihO6QMjKjy0pMBkN2tQA80vRJ1vg3x2S+UcGNd55YVBv2aTqZA0Vmu7gFOqc5cx2vs3hmS2lLX+V2bUMY=
X-Received: by 2002:a05:6512:318d:b0:553:23c4:6822 with SMTP id
 2adb3069b0e04-5533b8f6183mr5171073e87.13.1748962170032; Tue, 03 Jun 2025
 07:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com> <20250603-cuddly-certain-mussel-4fbe96@kuoka>
 <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
In-Reply-To: <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Jun 2025 16:49:18 +0200
X-Gm-Features: AX0GCFs2qeMG4HtPzgixdlaSw6fJIrCjF4lFG8AFOQDBjIfm0hhKZz_Zk6uhWO0
Message-ID: <CAMRc=Mc-jjULmc=3fS0qZgXbq9Sgfg8JBoH7peWML1PdyyyH+A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250603_074932_069486_6349B229 
X-CRM114-Status: GOOD (  12.82  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCAzOjM14oCvUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoZSBjb21wYXRpYmxlIHN0cmluZyBjb3Vs
ZCBiZSB1cGRhdGVkIGxpa2Ugc286Cj4gPiA+ICJ0aGVhZCx0aDE1MjAtYW9uLXB3cnNlcSIKPiA+
Cj4gPiBTaG91bGQgbm90IGJlIHNlcGFyYXRlIG5vZGUsIHlvdSBhbHJlYWR5IGhhdmUgb25lIGZv
ciBBT04uCj4gPgo+Cj4gQWdyZWVkLiBBbmQgYXMgZmFyIGFzIGltcGxlbWVudGF0aW9uIGdvZXMs
IHlvdSBjYW4gaGF2ZSB0aGUgc2FtZQo+IGRyaXZlciBiZSBhIFBNIGRvbWFpbiBBTkQgcHdyc2Vx
IHByb3ZpZGVyLiBJdCBqdXN0IGhhcyB0byBiaW5kIHRvIHRoZQo+IGRldmljZSBub2RlIHRoYXQg
cmVwcmVzZW50cyBhbiBhY3R1YWwgY29tcG9uZW50LCBub3QgYSBtYWRlLXVwCj4gImNvbnZlbmll
bmNlIiBub2RlLgo+CgpJJ20gc2VlaW5nIHRoYXQgdGhlcmUncyBhbHJlYWR5IGEgbWFpbiBkcml2
ZXIgdW5kZXIKZHJpdmVycy9wbWRvbWFpbi90aGVhZC90aDE1MjAtcG0tZG9tYWlucy5jIGFuZCBh
ICJsb2dpY2FsIHN1Yi1kcml2ZXIiCnVuZGVyIGRyaXZlcnMvZmlybXdhcmUvdGhlYWQsdGgxNTIw
LWFvbi5jIHdoaWNoIGV4cG9zZXMKdGgxNTIwX2Fvbl9pbml0KCkgY2FsbGVkIGJ5IHRoZSBmb3Jt
ZXIuIE1heWJlIGp1c3QgZm9sbG93IHRoYXQKcGF0dGVybiwgYWRkIGEgbW9kdWxlIHVuZGVyIGRy
aXZlcnMvcG93ZXIvc2VxdWVuY2luZy8gY2FsbGVkCnB3cnNlcS10aDE1MjAtcHdyc2VxLmMgYW5k
IGNhbGwgaXRzIGluaXQgZnVuY3Rpb24gZnJvbSB0aGUgcG0tZG9tYWlucwptb2R1bGU/CgpCYXJ0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
