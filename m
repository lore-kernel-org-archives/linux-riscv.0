Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4ECC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 02:38:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 983A360FF0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 02:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 983A360FF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nPnYPbs6l94EdG1xoxY47j+OucFa/NxSvTASAQIJrf4=; b=NIJMUB9JcYNJL+PV8IYByUFKc
	E9+f+8F4k7JCkGIH0QbtZGcrxZU6wRSarXgYmHnHr1j5ZGDVr/sJSTv0Ad1KHmv/LazOwC1jA1KQL
	+kDAhCAtPt59xq5pRNjfA5hmWRx8Z8GLrjIQ7e+DKQjyxNyx2TrNh/67/iH3t0+TAeaxt8358nVrf
	fYEyW0/Aqx/U+80IQxPzA7RA2Y4jShE71w5dnjPfQo8W3Lx445M01eIVTmaPasen4C5MewxyNn0L9
	W9la1qAI4dnx04asJM257nBCjAqOG1Wf2FSIc9bOvGqNKwtulPJDmFSEji/0IzXA+dMnutKrCeUEn
	CaZ7BD8OQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVmSo-005XHM-5O; Mon, 12 Apr 2021 02:38:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVmSm-005XHG-Cs
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 02:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=TmSSElCK4cYcHvK5QFQubtH5iynsu2VpzHMHEgHy8BA=; b=Jhf6EYB9BAow7w2o3XOxlEpUx8
 LOZ8Qz19N72TcS2KS7HAS0UrR16h0JH+YuKIuh8xuFC6KHfzPZ2f7Xcy53UkFIb28xZy+JXGk8deO
 ZxCYS7qvIyuVVJJoLcxmnJpAtkbLIy829WuGjtSIqmrVx4oly2O5yp3PKcg1nMu34dCVwqYOCsnvC
 F+SARmfjYZRqdlL3dlBZmYgyq1GcJHlGyHSha/uVV/cIn7CS4NqzlowSAM47BYAjLqjSUBF6SlP8X
 jHfJzxdwY/oCLb+/f7rO1HO4x5tyVSZcb8V94XebNoaI4bi7BGa5gEWp96hW1RXmp8mOINfXyhHW8
 tye5RliA==;
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVmSj-005qWG-Gr
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 02:38:07 +0000
Received: by mail-qk1-x72f.google.com with SMTP id o5so11989793qkb.0
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TmSSElCK4cYcHvK5QFQubtH5iynsu2VpzHMHEgHy8BA=;
 b=mbWzSh1p+trrWvmtrxYTsTS6r7o6U7fHTEwOt2citEUHclf1uB5FPBJiH6Uq16l2JV
 7WuM8/9cc+Q9XA+OT8dgVf3al8k3AXpsDyC+v53R4+AnBjGFPwhPBmMep7dSG9qWwiPn
 y2lOHpMaMhzoaGwBKLgF+AXBg5myeg5sNVvR2DhVPVJ4Y4d/nMyhUal2MZ4RnV0f35y9
 O2ZdG6+rWoMod5Bi2v9MraiB0Ky4PpWQYtFh5Uhau9HcJmkvZROGHW6sCvLRbRmgS5im
 07TfdfkFA6AVfyhc/SPPmM2Ee2RgKBFftH43pPgOwx8c+uyoIclHVSsQuVVlAXdF9IQg
 6OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TmSSElCK4cYcHvK5QFQubtH5iynsu2VpzHMHEgHy8BA=;
 b=De0stUTgP4NffN4HMrQlQcEOe/gu4fcOBUFxymcDDjXSD6+S8g4fFTjSKt0AQ2BFqy
 ZvoyU6n+eoDmvgP+yk6Ad9kt6bjmTyOPzO1DJA0Ix2GDy6pO4ASwR0U3cwm14Q4YQ/BC
 WTJrIG2cY1QZ0deZuF+eoCZd2iRLKdNnPzgC+LAAEzBXONw2ioqFvvQ0l8ZH8uFEOBP/
 gEek2iOy3Z4EdhuvDfQsH8kxv+P7xOXWXkNC68Ky2+T44tPFVzOvK19ooz8QBztO6spU
 4a72OWSX+wAHKA/CTZt/8h8NB+ryuSr4b8ElY9EUZdCH9H7/JPGmVNYONiFxZH+NwW14
 orrQ==
X-Gm-Message-State: AOAM533qL4G8eQ0OPk2+2M7WfZwZcfTbKUVLs7X+HV69VUyyUTWMsb+D
 TDqoBa7/yaA02BH4TSm2AAQbf/VdGcuZKoAcq+aDZQ==
X-Google-Smtp-Source: ABdhPJwOWzULd337c8NuXMd1ABRPnJWVXcSMZ167cl2J0oTgGU5gvgRC+qgOHXrTrA96Yon0OE2bEBoQct1g2/W01Fo=
X-Received: by 2002:a05:620a:1497:: with SMTP id
 w23mr24922931qkj.260.1618195083134; 
 Sun, 11 Apr 2021 19:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <161795835843.16967.18210803147557738620.b4-ty@arm.com>
In-Reply-To: <161795835843.16967.18210803147557738620.b4-ty@arm.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Mon, 12 Apr 2021 10:37:50 +0800
Message-ID: <CAHCEehJajVGWnAwvX+Jg3_U=WNxaNq89Xq3uvcfcHzt04qNfMQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: jh80.chung@samsung.com, Zong Li <zong.li@sifive.com>, robh+dt@kernel.org, 
 vidyas@nvidia.com, alex.dewar90@gmail.com,
 Erik Danie <erik.danie@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Turquette <mturquette@baylibre.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stephen Boyd <sboyd@kernel.org>, hayashi.kunihiko@socionext.com, hes@sifive.com,
 khilman@baylibre.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>,
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_193805_579739_AC6E6C02 
X-CRM114-Status: GOOD (  12.37  )
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

TG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+IOaWvCAyMDIx5bm0
NOaciDnml6Ug6YCx5LqUIOS4i+WNiDQ6NTTlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgNiBBcHIgMjAy
MSAxNzoyNjoyOCArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gVGhpcyBwYXRjaHNldCBp
bmNsdWRlcyBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyLiBXZSBhbHNv
Cj4gPiBhZGQgcGNpZV9hdXggY2xvY2sgYW5kIHBjaWVfcG93ZXJfb25fcmVzZXQgY29udHJvbGxl
ciB0byBwcmNpIGRyaXZlciBmb3IKPiA+IFBDSWUgZHJpdmVyIHRvIHVzZSBpdC4KPiA+Cj4gPiBU
aGlzIGlzIHRlc3RlZCB3aXRoIGUxMDAwZTogSW50ZWwoUikgUFJPLzEwMDAgTmV0d29yayBDYXJk
LCBBTUQgUmFkZW9uIFI1Cj4gPiAyMzAgZ3JhcGhpY3MgY2FyZCBhbmQgU1AgTS4yIFBDSWUgR2Vu
IDMgU1NEIGluIFNpRml2ZSBVbm1hdGNoZWQgYmFzZWQgb24KPiA+IHY1LjExIExpbnV4IGtlcm5l
bC4KPiA+Cj4gPiBbLi4uXQo+Cj4gQXBwbGllZCB0byBwY2kvZHdjIFtkcm9wcGVkIHBhdGNoIDZd
LCB0aGFua3MhCj4KPiBbMS82XSBjbGs6IHNpZml2ZTogQWRkIHBjaWVfYXV4IGNsb2NrIGluIHBy
Y2kgZHJpdmVyIGZvciBQQ0llIGRyaXZlcgo+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
bHBpZXJhbGlzaS9wY2kvYy9mM2NlNTkzYjFhCj4gWzIvNl0gY2xrOiBzaWZpdmU6IFVzZSByZXNl
dC1zaW1wbGUgaW4gcHJjaSBkcml2ZXIgZm9yIFBDSWUgZHJpdmVyCj4gICAgICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jLzBhNzhmY2ZkM2QKPiBbMy82XSBNQUlOVEFJ
TkVSUzogQWRkIG1haW50YWluZXJzIGZvciBTaUZpdmUgRlU3NDAgUENJZSBkcml2ZXIKPiAgICAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL2xwaWVyYWxpc2kvcGNpL2MvOGJiMWM2NmE5MAo+IFs0
LzZdIGR0LWJpbmRpbmdzOiBQQ0k6IEFkZCBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xs
ZXIKPiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2xwaWVyYWxpc2kvcGNpL2MvYjg2ZDU1
YzEwNwo+IFs1LzZdIFBDSTogZnU3NDA6IEFkZCBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRy
b2xsZXIgZHJpdmVyCj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3Bj
aS9jLzMyN2MzMzNhNzkKPgo+IFRoYW5rcywKPiBMb3JlbnpvCgpIaSBQYWxtZXIsCgpTaW5jZSB0
aGUgUENJRSBkcml2ZXIgaGFzIGJlZW4gYXBwbGllZCwgd291bGQgeW91IHBsZWFzZSBwaWNrIHBh
dGNoIDYKdG8gUklTQy1WIGZvci1uZXh0IHRyZWU/ClRoYW5rIHlvdS4gOikKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
