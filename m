Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09180E8784C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eZoSAhevj7s0d47ao+rSYCObBbj8Mr0m0bviyuhSuU=; b=bxRGN+ovwNbB48
	DvxQu4SBteKQgSDayTn3XMx6R6OIw0FBat+snzAQ7dY5Pgb8RFMfrRZmkPbyoW1/XnQr6G6P5p/H9
	Xpn2ErrN8X3rzCUBf+P6MxblhToEyQm5dQMZ/2zjd6dbfR5PetLqk6NX07k2pMJvM7zlfNjdmgupF
	dcke0MKhqOm0aYbJvVoGyKUmFOKoh0zOoG95OZwRkuMvqsByBTR0lu/QkDTL+OAraKsfZEGCTGead
	EJ2yQjRv7ZK3Euny//Korme6DVp8EgfaHPmEvYVQ+ymloIY2nHcmv2OltPZK8Hl5E1OnND526orsu
	SJgV4cSJDD2whbHp8F7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL30-000000077zf-1tkd;
	Tue, 03 Feb 2026 18:22:46 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL2x-000000077zI-1lbq
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 18:22:44 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79273a294edso57322937b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 10:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770142962; cv=none;
        d=google.com; s=arc-20240605;
        b=Tjaz4EPSMF1Z8FVBKnehIuG6m/fGSp67SDRZixHSi/5uGYK/hCzhF3OYooAb3GnFrv
         Y3Rh8maMRQwsUHsQ9W8BJQL5KQNzmivmO7yFngkTAms3hVeYb0qktBqqfNxcMj6np353
         vZ0m/Qec2fV7CwuBdrq2hNjUIc9royl02NTVmMxdFRDlktmAsSPWBQN13uCwdXzBYiAQ
         m2bDbGmCGpekjsJDn8tuK7iD1YQOE/nCB6dsKm5h1f9A7fcbI1QS4H6kIGTwWDOSaLqR
         MuD5Ej9oMsrbHCIo3XCPatdHmYoz4OdpyYfQ0Ur+N0ZE55NlOO0XTuDftGl+wIwuUTl2
         lc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=72IAYlfThYiEG2aFjGCNshtysLaZbuOWDG3tEGy1mzE=;
        fh=nTGWDPbII5s0Z8DPjT5DlsIB1294Z+9QYyf6Oq7/wjw=;
        b=CYxx+HrsfsGC6X2cVHqb1/x2VW3KIoGKIXtV87A+WRzoj8Q+6pOTri+SDWkxFhEVMR
         wO9fZuQVEd1oJtQ3hafJq+5Oru49/xdkhvq91ZuLiimPYj9QrBPkXf4PJDyxN9MU1esS
         A/Tf7/m629t/LZof/oo9HfoeG8OSvH6wFWzuzPqExuuG9LEC/t9bY5PDtF7oQygODuBF
         3HfRCitVopCjvMPU4VEfBcQWWXdNPaW3HmOhNFKnCuk3Nd2vz0f6QqHdDsspmKktWaNL
         WtlpfQf39yAzND8cqEitTzpy9GgHdIifHP8OO/2uC68L/Au4bjWHWlkaB+dy50UNTNZe
         YpZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770142962; x=1770747762; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72IAYlfThYiEG2aFjGCNshtysLaZbuOWDG3tEGy1mzE=;
        b=I+lMxF9kLB8z8pshgGsJqznmUtkjfjgwATVitWz1SOQE9ex82S8mba31sY5djm8DpD
         i+XEPee4vq5usXrVQ5XQA/UO0NtQOH3UYB5Kr3Bh6JhvzK0zK/7ln33c4k5hCNBR0gSs
         Ayp9BTTec++SOlczoBAJ1OJYkuep5+lMDencl/M4L0Scd6OFu5OGN7m+r8qLRdYbSdZ3
         BxpTI0UnzcO1RYUZjx/zlnxpRSrpt1R84gREl7bP9jRS9x455YSpVFfL5zeLFYAfgNuO
         S2pA5exR71kS6mqLJ0P0VfKQbKcpi4Kx8U5SVc6M/Yax0kWFcTUvB6+r++3rZke0MJsC
         k52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142962; x=1770747762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=72IAYlfThYiEG2aFjGCNshtysLaZbuOWDG3tEGy1mzE=;
        b=N2cdI9mZpPRch9VIQ1Oaa167FD1nMp+iM0gVA3gNYsr7rLBc/8Sg4mKno8kHm0C80U
         fK0R/lLHw0UxbiMiF34Si7QTu5H0ffjE3XdxA0WFpsTxF12dFJFpWn/qfMnN9LWKptiL
         IN/LCBxY3bXrdn9dYfYvlzv0TUX8pUehD+reapGzu5+ththNwNhUF3BQeOVJj6FMBTu7
         P7mu3E4pe3BoOGEykeTZ5+YB10J90/2KTLcU22BG4T+5EB6/7CQMQh7tX/YHviOWC3YA
         6gMZ/+8Gk2sk4k8KCiz8T5A0V4PcXjXQqlEPRuoz/mZah3GLpKPSEy2CdUcl40kbTebF
         7npw==
X-Forwarded-Encrypted: i=1; AJvYcCWjlCHzTn4yfcHdWxAB9XXaU388MOML7/1g2y72XdkMjw4bj70YSp0q55PRGTRMkYtRzGB2Q6f07iq7vQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTXQUkhqDNax+Nhsovw0UIC46t3+I05udHcrXIsbw4vHUNlPgl
	psEFA3p7TlhRBGSet++fGje3zwh//AAqBtG/57tg7/oRTYEa7bSvMD3hFlRhci6Piz9WeOPehk2
	Fb6q0BxTJGInZeC9H1XFk7ldpLxMC3w==
X-Gm-Gg: AZuq6aKteLVndWsLHMjvcrDnJ+02h7mecSCGOJ4O7V+v78CQjXP7sB8VuNJtq9ufxHV
	KQ0UFTz8OKbN4wTW4xttgcACmMKG3RBCh6ULXbeJbhdkHnrBlJXgewjYbFkwLO3x7vElghe5kH6
	1jqnPWyrtw7OsRNkBqiZRNnQZdA0P5df9L1rQO7AuCRQHhUh5pLI6LRmGbFLApxH+uN5U5ODkl5
	rjjqIlhpJaiuSxmPdxB0PNROoui3lV+mXIgpQy+1fTL0f76Aa6s/gqyjMDjNat6jp+481HUJ4X/
	EA+XjNy66v0n2aRhMODoEQ==
X-Received: by 2002:a05:690c:39b:b0:794:fe8f:ad8b with SMTP id
 00721157ae682-794fe8fae16mr4373667b3.29.1770142961756; Tue, 03 Feb 2026
 10:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20260130102301.477514-1-tmshlvck@gmail.com> <4819ec3b-23b4-447b-b10b-0bd93a40dc5a@kernel.org>
In-Reply-To: <4819ec3b-23b4-447b-b10b-0bd93a40dc5a@kernel.org>
From: Tomas Hlavacek <tmshlvck@gmail.com>
Date: Tue, 3 Feb 2026 19:22:30 +0100
X-Gm-Features: AZwV_QheORJ8ICtVU_dJsf5jOCxuVCH5tMEhwxpjksgwa5Kxeq4aCWYRoHfnm_I
Message-ID: <CAEB7QLBE8OQtvasbDvaeCownALqMcavA2TWOQJG0Sx3Q_-KShw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: spacemit: k1-emac: fix jumbo frame support:
 manual merge
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, dlan@kernel.org, wangruikang@iscas.ac.cn, 
	stable@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_102243_488929_9742AD7E 
X-CRM114-Status: UNSURE (   8.13  )
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

RGVhciBNYXR0aGlldSwKCk9uIFR1ZSwgRmViIDMsIDIwMjYgYXQgMTA6MznigK9BTSBNYXR0aGll
dSBCYWVydHMgPG1hdHR0YmVAa2VybmVsLm9yZz4gd3JvdGU6ClsuLi5dCj4gVGhlIGNvbmZsaWN0
IGhhcyBiZWVuIHJlc29sdmVkIG9uIG91ciBzaWRlIFsxXSBhbmQgdGhlIHJlc29sdXRpb24gd2UK
PiBzdWdnZXN0IGlzIGF0dGFjaGVkIHRvIHRoaXMgZW1haWwuIFBsZWFzZSByZXBvcnQgYW55IGlz
c3VlcyBsaW5rZWQgdG8KPiB0aGlzIGNvbmZsaWN0IHJlc29sdXRpb24gYXMgaXQgbWlnaHQgYmUg
dXNlZCBieSBvdGhlcnMuIElmIHlvdSB3b3JrZWQgb24KPiB0aGUgbWVudGlvbmVkIHBhdGNoZXMs
IGRvbid0IGhlc2l0YXRlIHRvIEFDSyB0aGlzIGNvbmZsaWN0IHJlc29sdXRpb24uCgpJdCBsb29r
cyBnb29kIHRvIG1lLiBUaGFuayB5b3UhCgpUb21hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
