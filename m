Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3050BC7EE30
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gP/1OAZQ/wiVeBSoGnZWEHTYbTsbe5ryfQ9RsTbo0fg=; b=ojjaHIP4D2nsrL
	qLADjNB84h1ppATaDefpfKAS6cK7/9fo03ujRrO5wWcQPmefXM5Li3Mhsnrg9jgjFvtoW+AhP45pJ
	baopvu1eSPi5OuAZ5HHd3CTgEYtZJZUnSaAJYB4uyLtDwQv+2UoWhR+lyIgXf5y+u6+Bag72tU27/
	pzTEdVVTjs5zH2pi1So9pwjcP5e3UFI6OpmlYWPKuMSnaUBSWqaQt95UGBzGFN+1qpC8oB8QXgEmV
	7bbFRtthB1Rdp/E4Id6aWdNWrSqv8GM73gAWXSUfrGmaSowrAvSS2v705pkQdPSVQ7QmiDAScQOLD
	kN9Rrw6gGIA7U+RNsntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNyG-00000008Q6e-48TC;
	Wed, 25 Jun 2025 11:07:16 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUN0K-00000008FTQ-3oGt
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 10:05:22 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e84207a8aa3so3994207276.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845920; x=1751450720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xKfQLYxQrQT0vEeA6XiT41ZdovNWLUZMpAYKaRFfyA=;
        b=cTK4ir++xPFOt0uWlX+lkPvYmaxVIM2gK2ZCgcaqH28/HvsEpMFpleMBDxBAOc+XcX
         Cn/aZMnDJMgkh/3ouT2qqLcGAk60adcR0th4ClgXogq+hql5GWAVqT8BpbWXMxElHA85
         mGXQ+bBpJJ1i/QVa8Y3Bxo+8LDfll4dSwOgkZagE4nRiw8rpe0CrBo05pkX5RPu/6ufO
         FrlRmhBW/9NAZopi+YcRkccamfBkIo3tQcG4hdPlD25aprxw0yhyFffzSdGOPYbeEKaY
         tC/pBN0oUG6glf9Gt4JK+/pX7iAblIx/6w6LTSSHxkXgC54K5c6bOizjueCklMfZOFxd
         vgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845920; x=1751450720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xKfQLYxQrQT0vEeA6XiT41ZdovNWLUZMpAYKaRFfyA=;
        b=DmVo21+yajRBz9EUl91GIO+98ThM5FYZFYL93m6LSA+oUF5hAHGm6HOaeCMlLbCou0
         hBOK7EIf6JBiG+uVC6s/YzM0PRJL7Ck9tZWcTT19zfwcLwR7uem+lDMOKBocBKHEEjNF
         78P557yeDPYwKyFuyodSZtSl+T0Fkssw0GyfH04tuUnDv3KgFIls6xH4yuQP7MDWkLOM
         ejR/T+0ZGfhw9Dmnu2/ThOPweSOzGreFnhGNKANO2Q3P2PDBR831jMHMKJbCOJ/Vcxhj
         03DufHwBFViqsXISVxSRXzMKsUqaNvegnOlcvYieM5Y92fPCYTs3UHH+tdaIwpodd0kF
         +OlA==
X-Forwarded-Encrypted: i=1; AJvYcCUXwkT4ASi3BVWtBbLfnUNH2QOPTcXA0z6cPdTeP+1APYqqpgw4xIIUS8lkUZYdneRwfZ1vzsIL7kvNQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySRGsA1SqNukA0Y/ZCjttAJOkYQcN4OuZit86r9cT8U0TbMhNn
	R0GRhTzLHO1p1GaGC+PzFImNQfAQH8EWQKZLsaWrqtx81FYq7Nbzg8zyzXBZr9Pg3rJeQRXt6Ou
	EVDmuv9723Apa4FAjhPjs+Bf8+z9Aau0mxELzMqxr9Q==
X-Gm-Gg: ASbGncusi68RSbpN3/UyPNuK2Vk9DF2NW0NqJrnartmHyo5xsK8pBnYAvhORUD6xFIs
	+er5/6wDKZmx6vfXX+HfTXum9zNDq04jz5Xsceeu9GkMYRCDJI1eZSEMf6u5vrT/fT4jD2yKE3K
	Fi9cgsGD/Yj1oozc58P4CX8iyjQOMtufGrxKHAAMteLaQ=
X-Google-Smtp-Source: AGHT+IEJrS2tphZ7UMREypIClsxlSmABIBla9pP6cK7b0bEY7VGBFV8Zh4V9DmKzTV5zBXNgMqCqlhwI6mHWvsv490U=
X-Received: by 2002:a05:6902:1703:b0:e81:9aa9:88d0 with SMTP id
 3f1490d57ef6-e86018ef2f7mr2643332276.40.1750845919338; Wed, 25 Jun 2025
 03:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250624141013.81358-1-brgl@bgdev.pl> <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
In-Reply-To: <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 12:04:42 +0200
X-Gm-Features: AX0GCFtiYC7fRWb7mfaCIbLmQje2hb4McQcP0uGJDzj7bHa1BymRJdIDLbPQ_rE
Message-ID: <CAPDyKFq5G1CDL+VJxuzWZahZwUM0mVQJwU_WYYqNuDMDE3H5TA@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_030520_954076_714CB557 
X-CRM114-Status: GOOD (  12.78  )
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

T24gVHVlLCAyNCBKdW4gMjAyNSBhdCAxNjo0MCwgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBi
Z2Rldi5wbD4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNCwgMjAyNSBhdCA0OjEw4oCvUE0gQmFy
dG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+
IEhlcmUncyBhbiBpbW11dGFibGUgdGFnIGNvbnRhaW5pbmcgdGhlIHRoZWFkIDE1MjAgcG93ZXIg
c2VxdWVuY2luZyBkcml2ZXIKPiA+IGZvciB0aGUgZHJtIGFuZCBwbWRvbWFpbiB0cmVlcyB0byBw
dWxsIGZyb20uCj4gPgo+ID4gQmVzdCBSZWdhcmRzLAo+ID4gQmFydG9zeiBHb2xhc3pld3NraQo+
Cj4gSnVzdCBhbiBGWUkgLSB0aGVyZSBkb24ndCBzZWVtIHRvIGJlIGFueSBhY3R1YWwgYnVpbGQt
dGltZQo+IGRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoaXMgZHJpdmVyIGFuZCB0aGUgcmVzdCBvZiB0
aGUgY29kZSB0aGF0IHVzZXMgaXQKPiAodGhhbmtzIHRvIHRoZSBhdXggYnVzIHVzYWdlIGV0Yy4p
IHNvIE1pY2hhbCwgVWxmIGV0IGFsOiB5b3UgY2FuCj4gcHJvYmFibHkgc2tpcCB0aGUgcHVsbCBp
ZiB5b3UgY2FuIHJlbHkgb24gdGhpcyBiZWluZyBhdmFpbGFibGUgaW4KPiBsaW51eC1uZXh0IGZv
ciBydW4tdGltZSB0ZXN0aW5nLgoKR29vZCBwb2ludCwgSSBhbSBub3QgcHVsbGluZyB0aGUgdGFn
IHRoZW4hCgpLaW5kIHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
