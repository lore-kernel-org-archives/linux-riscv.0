Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA4C282DE
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Mar 2025 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ES0BGHrPHGnQxQ9N3hOgP3ICtdfy1vA7vPglRH1VxEM=; b=mk8bavmB0My0Jx
	LLUK63CRTAbNgU9Xjcv2tXv0Yl5yFezU7lLmBTzPu024OzokQbDrbjiF9E8+GAsKshdyD1B7zaGv2
	O6+me0LQevnOVCMLwT5xsaTtDb3UIG+/cNmXdCa8KI0LAJW7yku2puXVj5M3dAt9CrIi+kEmdpLtQ
	ImEWgaPpSfH1y3hbCLaH0lnP2cGJQcq/jKb4tIoFUe9lq/xcb+PwhH7Zjt3zoQ4vCAyvE+Sawou+y
	LanjM96spYe0qOyKZRCyFq7vxKfivNmBpoPuGcG7lM7h7quJ3ekztB4OgdVI1JQFMJVRbypYc4/1x
	og7IiejsAwTe3YGVEUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttlPe-000000003zI-2U1v;
	Sun, 16 Mar 2025 10:40:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttlPA-000000003v3-0gbO
	for linux-riscv@lists.infradead.org;
	Sun, 16 Mar 2025 10:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D48545C2725
	for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 10:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530ABC4AF0C
	for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742121578;
	bh=WRJSfItq61nSL1uaK/VCriAnVMB4K0dxbrf6ZjynqHo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fjim71t8HPk5uBOq6wbL6gdL2udv+om6C27EvlLbpKtP/SUm5YQ2AWNeQADbyUMhv
	 GIJogonxHqIg46c2LAUJqDQn9IrKaHALrqqrsreuEJOXmfAAg5gJigXloSN6KxOk+P
	 YW2ce78ZEFlZoRPSbhpfZsxp27ZGBWZOqbpwN8HmzxPeN5Qj7pt1XAPgbEurPpuLnr
	 ykMwIhQPJzgznblvQYNm1Wlz/XmzfZ+HGBaIQnfvroA47vamoVrD3GgPFokcLEBfKZ
	 gSaNMil8kPzwCh0ItLw1nWFFejSBmt+zChDNY0GYAWpcpEQidU268Bmrrf3oMHEmva
	 y5knBqbF8j1GA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf8632052so37692111fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 03:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC+ukXqKwv0sMx6NqxBZNKSH1XkzMxaZF1kPw4X2Z7KPJdSiO55YUoLocSbp3XEXJTCae9t4qbr/BNIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrncKx4cTkj+SfjELeRnYFvAl2dPBMvCabSXOt35M6ImbERqOX
	roTusVIi8D7Tv48ioCy0QKI0sfqd+6FsKyHGGGNpWocC2vG/5JtwUkIxwI66k9pMn+e29WszHaT
	Q/+6zQybNmgTpjRfRN5YkjYgyFgU=
X-Google-Smtp-Source: AGHT+IEB+4diSeexNNNIukQtrloxp6S2TfNrH44RL6u2FM4sGQUkisIda/46HY4MIJsZGhWgkraV5ZpVD2wA2xIY4yE=
X-Received: by 2002:a05:6512:3c9e:b0:545:22ec:8b6c with SMTP id
 2adb3069b0e04-549c3989e0bmr3087455e87.35.1742121576996; Sun, 16 Mar 2025
 03:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241222000836.2578171-1-masahiroy@kernel.org>
In-Reply-To: <20241222000836.2578171-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Mar 2025 19:39:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQMo0R09OcVw77=dyVnUbMv7gxxejHbr=dy4S-SgPT4-g@mail.gmail.com>
X-Gm-Features: AQ5f1JofVnF26SX2Zmz99VV7kl0SZH5Y8b4vOY2llQA5xgYDjVFvk9kRqjew-ig
Message-ID: <CAK7LNAQMo0R09OcVw77=dyVnUbMv7gxxejHbr=dy4S-SgPT4-g@mail.gmail.com>
Subject: Re: [PATCH] riscv: migrate to the generic rule for built-in DTB
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_033940_267099_976B3CC0 
X-CRM114-Status: UNSURE (   7.61  )
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

T24gU3VuLCBEZWMgMjIsIDIwMjQgYXQgOTowOOKAr0FNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhp
cm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQ29tbWl0IDY1NDEwMmRmMmFjMiAoImtidWlsZDog
YWRkIGdlbmVyaWMgc3VwcG9ydCBmb3IgYnVpbHQtaW4gYm9vdAo+IERUQnMiKSBpbnRyb2R1Y2Vk
IGdlbmVyaWMgc3VwcG9ydCBmb3IgYnVpbHQtaW4gRFRCcy4KPgo+IFNlbGVjdCBHRU5FUklDX0JV
SUxUSU5fRFRCIHdoZW4gYnVpbHQtaW4gRFRCIHN1cHBvcnQgaXMgZW5hYmxlZC4KPgo+IFRvIGtl
ZXAgY29uc2lzdGVuY3kgYWNyb3NzIGFyY2hpdGVjdHVyZXMsIHRoaXMgY29tbWl0IGFsc28gcmVu
YW1lcwo+IENPTkZJR19CVUlMVElOX0RUQl9TT1VSQ0UgdG8gQ09ORklHX0JVSUxUSU5fRFRCX05B
TUUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwu
b3JnPgo+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+IC0tLQoKUGluZz8KCgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
