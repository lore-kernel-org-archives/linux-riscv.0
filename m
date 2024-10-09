Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EC7CEDDA3
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 22:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6vsZkeq46s4j+xbTOZsWQMwJJ3/0cvMlwXVa6Gtcqc=; b=MTyANas7G6g4Zb
	DoyFwB7CkIvcRKsgP4viqSH84ai/wNSG4ZSg6O82pF6l2jOZzAjdeabj/bf6Qxo0HiYWE+PDYZC4p
	8wWQ7BnkH/C4HMqpJ8vjj9rpjUGxUtcusn24UgxwmM77iBtuy4CbUS74R1d/Zrc0oIsWJIIT3/7ga
	RndjoL0uuzFDO0h3+t6Ivn9LrcEz6T601s6WAs24g92Wbrr3uvAOwj7qWrVkaDAPrFJpm4b+Wna1R
	DFyqi91WFpuEIg/xroKOjLDlcn0RKggm86yR8ovzO+Hjtet/oXbkzNWoyFwtXzp4w3JsoUH5iD/Qh
	AWTh7uN+gA/Nv22pZF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syfSB-0000000Axvm-0FQc;
	Wed, 09 Oct 2024 22:46:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syfQA-0000000AxKD-3vcf
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 22:44:44 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71df67c67fcso239914b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 15:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728513882; x=1729118682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=Bf4o+QXLOFGrdDbaijDHykv2NglopIlKJknarvznLGx4GajqT3CSMEUDsucyKYemos
         ET8a5MjLCbsjCC65ZGBhMK2QQ8J8O92bWDMIifnhqUstlEvzLFd3N5OlH6e1nQj8C2b2
         GyaP4t/hzsE5a7ruwPBOh9DLilmZi+cxqWzy56qfTA91yjA/njxsS76v+ZRryH1lUBfv
         i0L9oCXRgeESIzjBWVENoH46E9Eem4SW+/sxUFC/0zI0Y/DKOi2xxwPM54K15YAhnCJ0
         NxP1oeFiNfiR3dCWjhJzOiyAxgXUYfAhYBj9E2z2MKOEmIvmhRgCKK9lCa978WEITfTz
         uoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728513882; x=1729118682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=YIWtkFrU+u/UL0cdwLR9i7Gpdw/0WNfzBSM5Hj0UKq4ZkllTIvk5zWwzJj6mRxmYkj
         +LcHMxY0ZuF3vq/W5c+sB0xwX4ERvfnV+cMN3w83VjYZsCO6tmxZgabrqhVK6SOysYhi
         GMI1/M90y5VMdWxHJCVqMpaKfGmQldgjrpYlYeqkaqDnq5TP72hXUO7ysptGiu6ZokoC
         jM835k6HM3PJUoUlvCPvWaS1B7ma5+S2yizPKjv6EtnScwD2hut4Tg7rx5pLHjSlBvi/
         iriOY3JrxBGbj9zf4ZMaUEcWX0+e2NNJPPwyfzD1CSzSMMTuQuG5zMDSy/H+3eZ6qhk7
         jJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+InAzvvUpfr6O/Zx1BnAqzgQtqeiuc/dUaFqjQR/InLM1lJBMmU2I9yA8lweTJnaFVrr8ZvXyZQQNcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh+Muuvxca9fGqI/nN0wUMte76kwfvjs9qA6CLTdSNWpnmF1Bl
	TpOwKXFNbLl1ozqPz8k14J0ADxTctHBbr+WH7FX5ZOxUO5WStNy1
X-Google-Smtp-Source: AGHT+IEsegox6FAk/S37zA/g3uQmNQ5/YPSSLpXd7JDYIf6OoXCPh+Lo3bP5Hwajxkcu1U6ZdNlXrQ==
X-Received: by 2002:a05:6a00:1396:b0:71e:233:9537 with SMTP id d2e1a72fcca58-71e1dbc98eamr6521856b3a.28.1728513882195;
        Wed, 09 Oct 2024 15:44:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccdb93sm8265778b3a.55.2024.10.09.15.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 15:44:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers
Date: Thu, 10 Oct 2024 06:44:09 +0800
Message-ID: <20241009224410.53188-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241009224410.53188-1-inochiama@gmail.com>
References: <20241009224410.53188-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_154443_053749_6B6EEB49 
X-CRM114-Status: UNSURE (   9.01  )
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

Add support for T-HEAD C900 ACLINT SSWI irqchip.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2341393cfac1..5b1d6325df85 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -256,6 +256,7 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
