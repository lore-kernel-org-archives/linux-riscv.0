Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928BDC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wDgp2sWezASFdRVfbQdjgr4QynIJccW+JxkBanesOjk=; b=wcYh9RFu0N/fWy
	y4UWU4h9CZddmQDZaKTiSWKUk0+afkrfR2xeStxe29pjQnhQAhQgaEz0S6o1UhTTTVejkX90ryvTP
	i+X5nkUcUhYIsFzRTVKlHakq7ZNEWUsRVEXKuRHi7/ALEevjpx7bydz7NnDgdvCxbV+1Pgyej0xpI
	H1aAPd1q74paG537aPzN9uY7284xjK2dVyjmC4Rc0sniAGXrcoARkyneGJGgk02wPbOROmk6gqfmz
	Q7Z4/vDbDi9h9dxFfMStgIZmCBoD+f1/r4Ta+93SDdkopnDiuKNtfcrtQfcKfGtLW4a8Nt5vRSgby
	F1Yw9u0/RBjfwX6A2GgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaS-00000008LYl-3ejk;
	Tue, 22 Apr 2025 19:47:20 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GOx-00000007tH6-08H9
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745338985; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l7RBL5dVb8HBMLUxUZAfdwWNOiWIZFX6hxH7K+OpqGMU0ojfrp7QxthO5bFZHCzQtMGK4wemVQ1Q1kHpNr35FTF47HDPXJHZKkpxld5ubD9+O/Max0H8/qeTIegSHkmWmFCrcu+/uNGZsvM1viGELSdmgzDteIeEWRJDjWu9m/g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745338985; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oxHShFZoB1co/k8aRZUUY8gMBqcVpylC9Atz3SqUKJ0=; 
	b=TrUOMio45VqTWvjXV18oMc74ZcPvEP4KHQj/zRYp6lcZT2MtRess8KgL+6HiKmZ1tYEoJPMgfJWEN5z02cljGO2AdCKQQLPcI1woVwH8jY+nJubvjsXB4m5wQS0bHixzeRq8egXoN8lkX4E7C44fJZk0NyZOChM3hqsvajQhmfQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745338985;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oxHShFZoB1co/k8aRZUUY8gMBqcVpylC9Atz3SqUKJ0=;
	b=FsGf9IXdc8jVnzaCziUCBh6ZO0qPA+dq8oUagX/4L+UJumOk/3YG7bT+NlARsqo8
	WGbnRbxtxl09nQcKxdjPR2X4kdbmesNYzT0gJP8OvlF7wQpp9CRwjJSaIHvz0kqQLKD
	WeB5rHiuZIxE1rXDDAh3h+Miq81Ss2aqnx2GwYzyVL0cKytt3oueyvySg24tODET+Y9
	hFnpwHt2ZUu4tQkRZmxY5ajPWDbG8eM65Tt0wgLcTozS6YqkBnAwWhzB/2iZM2LbxTO
	s6lyEnGTa+jHXjOR7uXh63bXPTPm6qGaK6CQs52wLKdGloznxSYzOoGzLINtEY2TkNt
	OjzxlKxFjg==
Received: by mx.zohomail.com with SMTPS id 1745338982905319.5056985029113;
	Tue, 22 Apr 2025 09:23:02 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 0/3] pinctrl: starfive: jh7110: support force inputs
Date: Wed, 23 Apr 2025 00:22:47 +0800
Message-ID: <20250422162250.436169-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092315_140768_9E0A9C0D 
X-CRM114-Status: UNSURE (   9.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The input signals inside the JH7110 SoC (to be routed by the pin
controller) could be routed to GPIOs and internal fixed low/high levels.
As the total GPIO count of JH7110 is not very high, it's sometime
feasible to omit some hardwiring outside the SoC and do them in the pin
controller. One such example is the USB overcurrent_n signal, which
defaults to low at SoC reset, needs to be high for the USB controller to
correctly work (the _n means low indicates overcurrent situation) and
gets omitted on the Pine64 Star64 board.

Add the support for hardwiring GPI signals inside the JH7110 pin
controllers, via two new DT properties. The patchset is tagged RFC
because I personally feel the DT binding a little dirty and not
scalable, but the currently specially-encoded pinmux property makes me
feeling dirty too, and especially dirty if adding virtual pins to mean
internal low/high (and these virtual pins should be sharable among
multiple signals, which seems to be not so desirable for pinconfs).

Icenowy Zheng (3):
  dt-bindings: pinctrl: jh7110-sys: add force inputs
  pinctrl: starfive: jh7110: support forcing inputs to low/high
  riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent

 .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 10 +++++
 .../dts/starfive/jh7110-pine64-star64.dts     |  2 +
 .../starfive/pinctrl-starfive-jh7110.c        | 43 +++++++++++++++++++
 3 files changed, 55 insertions(+)

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
