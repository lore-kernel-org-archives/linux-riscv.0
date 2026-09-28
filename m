Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5F7C98328
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcQ7xq8dgXFc0mhaUj12S94RdXIaYXYe9p9cmLOCEnM=; b=p8OzUoK/OP765C
	tF/8amztheYkVO/h57P8+ay/BxBCxXgKgoGXvsZ0yLf3l1QgRLrgZc8m9neaCaMV4ZkFHnAL14lvL
	yKdi1p3jqgtF93GlU253GT7Rds5AURLRE85p1qrTCefWY30Y52G59NoCWAC9Wyu9NrPZ15W48BnA8
	UFOceC9brb8OwPrEcT7isFf6frsgTFv7g06n6I6Rm1sNLCcAdDTIm0EI5HQF3bSCMbi+sUSWiC8qS
	l9zOQM6AADGB+04Qig9jtP1DLQuxIQKmciG4U2bbcgw9EYByW17bItkOXYk8ahtTuAGNnoV4/Cfw1
	jxHpWtdS2PHw4n8galTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3oG-0000000HMCq-3Lvt;
	Mon, 28 Sep 2026 05:21:52 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3oE-0000000HMCT-1nd4
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 05:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=NSgjgIxlZWIP91WRA68CtWz6iKTotqGWktSzB7+lfPw=; b=h6tzgx8qZTPckLfOqRI7EEubF3
	6GL77s+pNOiJtc1K+lkLJjnRUrqM9D5UB39t3RF+kAwbWL9LszJF7J3BCsjmJm6xTkDWKMsxH4x2t
	9gH9fZ/CFfvqz2RlefvY8WEKlOiwee/2i/di5odjviFVDyVd1y4tF1bo6Kz1gaqkPSSOqyd7FaLc6
	jv6eCwwAsZGiewidIA5/C6EvIG4yqY/ITE3GtoB37xYS87SJdACpXzK307NDLcNq0CiKl1aDK/HGk
	bqe3RuRjc5kWsh39ej+UJKI9H6DTg/yuRUGStpxX5RVhCuAVD7jdUuuWe3cp/wWLwtvcqit8QjDGh
	j+5fpVoQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1xB3o9-007Ocz-0K
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 05:21:45 +0000
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so341491b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Sep 2026 22:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzMgaQrZk2IyYt9PwfVmH/w9L2KoLLfHuBFMdMxJP/xfbNSFQ4OTe9gtYxk0ZHbv33AIJ1JoOHMGCcwEQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mfDINC1WhgIk+2dDubkFZg+QfHrOroI8y11DNU+9s/mS43Zg4d
	ChnUC/iTslHcfdZT2vVK+mxIiWVeWMV6CvGZq473eXG96lzEBY4erRJMBLS30gPhiSH0yKN6LqL
	8oHSm8T5I9jdkOf7eAwPxXHhMJ0yv3yM=
X-Received: by 2002:a05:6a00:7096:b0:880:dfaa:a6d5 with SMTP id
 d2e1a72fcca58-880dfaaa996mr4280850b3a.33.1790572901657; Sun, 27 Sep 2026
 22:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260505042631.1916555-1-domibel@debian.org> <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
In-Reply-To: <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
From: Dominique Belhachemi <domibel@debian.org>
Date: Mon, 28 Sep 2026 01:21:30 -0400
X-Gmail-Original-Message-ID: <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
X-Gm-Features: AclHuK_UWybYUev4CCs0rM775Ij7Xct5Xij80ErUW_bz9ilg74HVWT_ebZnQGS8
Message-ID: <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
Subject: Re: [PATCH] drm: verisilicon: support non-coherent DMA framebuffers
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Simona Vetter <simona@ffwll.ch>, 
	Paul Cercueil <paul@crapouillou.net>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, ganboing@gmail.com
X-Debian-User: domibel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_222150_475715_EDEFDDBC 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMTE6MzPigK9BTSBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hp
bmdkYUBpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPiBJIGFtIHN0aWxsIHRoaW5raW5nIGhvdyB0byBk
ZWNpZGUgd2hldGhlciB0byB1c2UgZGlydHktdHJhY2tpbmctYmFzZWQKPiBjYWNoZSBjb2hlcmVu
dCBtYWludGVuYW5jZSBvciB3cml0ZWNvbWJpbmUvdW5jYWNoZWQgbWFwcGluZy4KPgpIaSBJY2Vu
b3d5LAoKSSBsb29rZWQgaW50byB0aGlzIGFnYWluIGFuZCB3cml0ZWNvbWJpbmUvdW5jYWNoZWQg
bWFwcGluZyBpcyB0aGUgd2F5IHRvIGdvLgpJIHVzZWQgQm8gR2FuJ3MgWFBibXRVQyBzZXJpZXMg
YW5kIE1pY2hhbCBXaWxjenluc2tpJ3Mgamg3MTEwIGRpc3BsYXkKc2VyaWVzIGFuZCBmaW5hbGx5
IGdvdCB0aGUgaW50ZWdyYXRlZCBCWEUtNC0zMiBHUFUgdG8gd29yay4KCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI2MDMxNjA2MDMyOC4xMTczNjM0LTEtZ2FuYm9pbmdAZ21haWwuY29t
LwpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MTUtamg3MTEwLWNsZWFuLXNlbmQt
djQtMC1mMGU0ZmQ2ZjJjYzhAc2Ftc3VuZy5jb20vCmh0dHBzOi8vZ2l0aHViLmNvbS9kb21pYmVs
L3Zpc2lvbmZpdmUyX2dwdV9icmluZ3VwCgpCZXN0Ci1Eb21pbmlxdWUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
