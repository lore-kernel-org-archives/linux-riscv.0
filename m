Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69122CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9QYjGUfGEcF4RWW9bHB1wI/aqNPHYv/rG+KckG8DS0=; b=wWQ0oL4lZexCGU
	AbnezvNPT9gctIdjNQAxAbLr3ZFfY4D73cUPGS3GhL0s12hYi6+WjPhg3yHuCt/DfPEzu76Pa4kh0
	q9tGuoD9OezPu1Yrt5obPnXuVqUvJD/dVvPs86Pp0SuN6SNW5U1r2P9Vzf8HPfXscBEC/3E9XTlD/
	OTTTRhMLCW5RDmcaKcD2yug8aGrmAPqkV6+NJyoSSiFoXs1F70KX+TistuCzlXMICTmbNq5lzme0C
	DDnnpal8SCtbWuCCTDqsqI9hUyew0Enz0H1Ud49x+L/yLZLfEnPDvQXilJU+gLC07vVijLiDAgF6R
	un9z2Ol4hm+tNe88fSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCHN-00000008But-00wu;
	Thu, 01 Oct 2026 08:36:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCHM-00000008Bun-0s9G
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 08:36:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F8E460A54
	for <linux-riscv@lists.infradead.org>; Thu,  1 Oct 2026 08:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E01F008A6
	for <linux-riscv@lists.infradead.org>; Thu,  1 Oct 2026 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843795;
	bh=xIb+an1vjbuhlFxsNo5cH4KHq1BGxzWRB6J9q5forqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WSUnn4C576WwjexJaHRwUxGh8Fp5D0r7vLLA8JX2e7oPvfdXcpc8L9MWTdKCFViYr
	 VPD1EbqogJd0yWKw1TekckoZlJya2LgA6b9mAMj7DqTY3qhyAY2HdZt+ZpRky11qtw
	 gMJS15NG6v9GulxFIga4nFs2sXP7GeSvnBzEOhJmvVDMFgF3jqa+nojr38+AoSZ1Us
	 /gGdsHOZmw8RY+20LoQ6N00hVFWJSVljG5UsbvTzEwOMAZmp7Gszz5lje9RJg+qbPw
	 JCSqwVIcia8sF3mYdRjN7Vz/BxBmCRc1iEq0Oq8SXC2ICoWFOGtq+q57Yzz3vukq7e
	 tdcEbl7tqpoPg==
Received: by mail-oa2-f14.google.com with SMTP id 586e51a60fabf-4693691fde7so3937197fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 01:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlVsSH8nMcuNJnrS4qqo4MkQeEw8gB4eAlghjvpslHort0/tOCv9gcPKp8NrdZb4cAumkY6l/oQeXrHA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKW+EuGeiWB/iKyjubooVcCc+K9Y+FGssHI3fqZeTBtmE5pGJ14
	RNiHWHt9yu37+aq7DnyIuMgDtLSquMBsnXpLiUNk9X1KQzJR/Q/cCAP4jwrDF9JT/Kk+sG97fYt
	7iMLztHzs90538w7UHpyefmC2fQSadxE=
X-Received: by 2002:a05:6871:cfca:20b0:49d:c40c:4994 with SMTP id
 586e51a60fabf-49df467f903mr1116516fac.9.1790843794327; Thu, 01 Oct 2026
 01:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com> <20260930-frantic-enviable-55c1a78fe7d4@spud>
In-Reply-To: <20260930-frantic-enviable-55c1a78fe7d4@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:36:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL==9BjfyHuJMT3sg9rkLDEHKaryHLtxxVwySmLUNjaW3g@mail.gmail.com>
X-Gm-Features: AclHuK9u4NJU-Y9jPHB9lynNieX4ueu3y9pQqGkmbWAAjJAu4pGPhtuSSWpMAZk
Message-ID: <CAD++jL==9BjfyHuJMT3sg9rkLDEHKaryHLtxxVwySmLUNjaW3g@mail.gmail.com>
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxMjozNOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IGJ0dywgYXJlIHlvdSBnb2luZyB0byBiZSBhdCBMUEMgb3IgT1NT
IExpbnVzPyBJJ2xsIGhhdmUgdG8gbWFrZSBzdXJlIHRvCj4gc2F5IGhpIGlmIHNvLgoKU2FkbHkg
bm8sIG5vdCBtdWNoIGNvbmZlcmVuY2luZyBmb3IgbWUgZm9yIHRoZSBtb21lbnQuCgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
