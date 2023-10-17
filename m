Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1EECDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 10:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xUWT3ymjN3cQo5AmueU1gtrxGGA30UysM5LGXYsIfIw=; b=sdYhNSUdqRqfRq
	SBQg9T8/h0tqp2udA/ELoPJgMiBSBeHNB2ihHHDTx9H43MdPtwx+AMx67kM77OyOXk8yn70mwLRR9
	NJo+XXM2ME6mFlKxPEP4d/q3praESFIO3DsdN94kOJYfmijP6J46Nqv7pagG79H2xVKM8aPFBq+EX
	jly2YOksyQ59r0rsyReNqy1LlAkYidKTq43BxSVHa8FC5ztIsih1vhcgK9qT0sBgNSsNj2X/YgQnX
	VenyB7rC7C8EpL9UISp9uoyj6DKx1NcUCl7UvRy+0/T6AYBkfqFrHcTjtOJCYv0Gu/xzDiCgJxDHX
	rPrk11qy8mElhahJkoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qshc9-00C7QF-0n;
	Tue, 17 Oct 2023 10:47:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qshc6-00C7PC-25
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 10:47:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4079ed65471so3681885e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697539666; x=1698144466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DngmYhquuUYsmqR6CkC7bFKb939k4yPlXBwM4OfGx8w=;
        b=IoiM6ChxEzrez9NUNU278XQNr9I3OoWdAxN8j/04kvXKB2Hr5T9J5pfyZf7iPvOnHU
         XMF/8DevWVxFGo3rKwdhjHpk5QpwE5qyzHGxlYnsq8t/Yl87uUDQ35/5QUdAbUc1AauL
         XBpf49WvCFFKZclfYi5vgf3lz4P7BZIb5W+k7DFgaIIYK8/Sdup629K80ADEtouC1SBq
         gftgURiEYTf+HgZzkjyCni7ikFXNerBGmNtAWQYRW/+uoTmq1g7W1fkWRItNz8gKJCFO
         mBaevQwNaGmPlBi/Zt+jDWWMHOyze31tfzAWZy2OxY1n5y2JR1bMm24yWM14jKHcbYuS
         FoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697539666; x=1698144466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DngmYhquuUYsmqR6CkC7bFKb939k4yPlXBwM4OfGx8w=;
        b=GnIB5ABh6/lsO0dHRzVUUta0mMN8kxjeNjmk75A5UsyJ4Q/NijCfyWlyBQZOW4K+OS
         FSFJ8pJ1aZpvHhA3bacgMLHoclDOXGiVSOwNt9G40iALT+StzeB0JRR8+BE5Jyb1EkY+
         b9hhDVN7nrll1k+iEdtfMTde8czyp526SrO7knGT2at+BVyeW7WOV+tX7Qoh3fY75Geq
         q5UY18zJdMAWsAwUfOc6ksxROe92b4TxUoYVH87uwKBAcoSGqARJkAKn6HxkzmUC3+eQ
         PzDvGfv+kv6kTh0JdaT+doGVPR8MqynrgsDcPePGCu8vlOueJyiYLz95oJ+ojW4ajaT9
         9sKA==
X-Gm-Message-State: AOJu0YxTcBinjF1nutpZG5g+rKM+OkkK3CrKaR5RLrNkeBLCS2iLPr5W
	VjjwZ3SYgKQ0xgIiVNsyeAM=
X-Google-Smtp-Source: AGHT+IHdE/vTp1u3u+UEAzAp8nMSLvbdXoZx/WxT6B2rUO1tDVu3mSXH6yQaUgMhYEP9dUoXoGrdqQ==
X-Received: by 2002:a05:600c:a01:b0:405:3f19:fc49 with SMTP id z1-20020a05600c0a0100b004053f19fc49mr1343875wmp.34.1697539665699;
        Tue, 17 Oct 2023 03:47:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e26d:77db:3f90:862b])
        by smtp.gmail.com with ESMTPSA id a6-20020a05600c348600b0040652e8ca13sm9582037wmq.43.2023.10.17.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 03:47:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] Add missing port pins for RZ/Five SoC
Date: Tue, 17 Oct 2023 11:46:35 +0100
Message-Id: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_034750_688459_38F3E8BD 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Geert,

This patch series intends to incorporate the absent port pins P19 to P28,
which are exclusively available on the RZ/Five SoC.

Cheers,
Prabhakar

RFC -> v2:
* Fixed review comments pointed by Geert & Biju

RFC: https://lore.kernel.org/lkml/20230630120433.49529-3-prabhakar.mahadev-lad.rj@bp.renesas.com/T/

Lad Prabhakar (3):
  pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK()
    macro
  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
  riscv: dts: renesas: r9a07g043f: Update gpio-ranges property

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 263 ++++++++++++++++++--
 2 files changed, 242 insertions(+), 25 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
