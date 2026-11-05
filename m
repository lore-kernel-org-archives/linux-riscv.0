Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6731606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mwAciX+6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbG3gRvn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SWVHdkS6kc675ct4Ccw4CXxv9KPAktT7nlyT53ggpBE=; b=mwAciX+65UauToKw0UgPAGJ05m
	bp6Jva4Xp+RhD8WYfBuqM8vT5s4v2G/lsiHZOqiW1D4W+nXcAoaH0tUoqoGqvkoWvNPDRuqNUXbSQ
	BioM/yLJyRmQ/J19JOpzaQR+rsFpl9LlhaiV9NOJlZXSsL19GkYOuZNf5gR/oi0zJJBslf9rOhnOD
	i0NLHrc+YmBORprJ+UVpuWRkZhnmHfRjdkynI/a4Xi1LEnPMX5tqIr4WXpB5AHeTutuiCIE/OOQN3
	8iXAwptMXQFX9AV1Np+APCd1tr2h2tZ24j/Q52v6YBdSSZdSjqzVpFrcKkShURjnKgxEWMSYN4hbP
	8VS8gitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtjh-00000008Is9-3gWD;
	Thu, 05 Nov 2026 09:26:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtjd-00000008Iqd-41Ym
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 09:26:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69E5760F40
	for <linux-riscv@lists.infradead.org>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C791F00A02
	for <linux-riscv@lists.infradead.org>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870777;
	bh=5weTVNfU4RUIXGu4AdbAlzA0cfDEQJq11kojXW+pkrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZbG3gRvnER6mcmNZ78al8p9Yy2sUU9nAr67z7Iu0pOZ0CbD6QzrYO0YAVZOxtEz6U
	 OBYxMo4sEj9zh33od6kOmsZvuLCSVgR7j2oIdAXZNw0JkJ1Y66Dxlnuho5lLA0wGns
	 ilLArm0Npn8kEe2gSbElNRJ6zx6U/KEW0orbBvOkXKjU5ru6yfZ36aYFrNCInS1uOw
	 sOgA4lAfSpDqGbD2F+YIS32RslRYwvYzaQjaYyqEK37TkcIwUh1jZRw6zKyln2zhvC
	 4QsYlRIiukxWDgmNxXpTfYbOnnqR+r7uK1pDgFAF9pAZjPLd/7ho2jD3SrFRqrYJav
	 CvKGREnllCpkA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4d648aacso1379150e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 01:26:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy455OCpiXFU0q+H65LRuYGuo+HwY4Bz3musNeqSPAml8svRM5MODx2ZS0vl5kvByf4XDK1glSUyCwCyg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+sRtK7jLfJZJoUYGsuZiuMqVM0ctn7wx+558KLwyoK6fcLBgc8
	M80mmocyvARDfTC1Mv8pgcjs5opPhzCwegHYxMvr03pRSpRY8jLgj426otr99+b0i4M67Vcl/g+
	6ZkCFUKZUIbH54X/y7F+HIwZJevMlW1I=
X-Received: by 2002:a05:6512:3da6:b0:5bc:f29b:1a5c with SMTP id
 2adb3069b0e04-5bfd956517bmr6620245e87.23.1793870775961; Thu, 05 Nov 2026
 01:26:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
In-Reply-To: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:26:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
X-Gm-Features: AclHuK8CorVO8MUeqTFvv7Et7OujtWjRgY906_d19hm5pp_OhIMEqRRrkZlLLfw
Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
To: Marc Taylor <marctaylor700@gmail.com>
Cc: bigunclemax@gmail.com, p.zabel@pengutronix.de, brgl@kernel.org, 
	krzk@kernel.org, andre.przywara@arm.com, martin.botka@somainline.org, 
	dlan@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgNCwgMjAyNiBhdCA0OjU34oCvQU0gTWFyYyBUYXlsb3IgPG1hcmN0YXlsb3I3
MDBAZ21haWwuY29tPiB3cm90ZToKCj4gU29ycnksIG15IG1haWwgY2xpZW50IG1hbmdsZWQgdGhl
IGlubGluZSBkaWZmIGluIG15IHByZXZpb3VzIHJlcGx5Cj4gKGluZGVudGF0aW9uIHN0cmlwcGVk
LCBhbmQgaXQgdHVybmVkICJodHRwczovL3d3dy5nb29nbGUuY29tL3VybD9xPWh0dHA6Ly9zcGVj
Lm5wJnNvdXJjZT1nbWFpbCZ1c3Q9MTc5Mzg1MDkyOTMxNzAwMCZzYT1FIiBpbnRvIGEgbGluayku
IFRoZQo+IGF0dGFjaGVkIHJlc2V0LWdwaW8tM2NlbGwtdjcuMi4xNS5wYXRjaCBpcyB0aGUgY29y
cmVjdCB2ZXJzaW9uOyBpdCBpcwo+IHJlLWF0dGFjaGVkIGhlcmUgc28gdGhpcyBtZXNzYWdlIHN0
YW5kcyBvbiBpdHMgb3duLgoKRG9uJ3Qgc2VuZCBhdHRhY2htZW50cywgaW5saW5lIHBhdGNoZXMg
b25seS4KCkNoZWNrOgpodHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNzL2VtYWlsLWNsaWVu
dHMuaHRtbAoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
