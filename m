Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6D0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r/mbIhm7EAqTHV5mlEIdgpoPJYWbaRts806AsPJl8Lo=; b=C+iJRg6DpENG66
	Ojzv7sB2s72C+1BevPYE7NYvzGNmPjrYUj22l6m/yO91KLl90Ai3fP46I57Gm1eMOKhRItawMeecT
	A1pmv3pB7gmq2guZ7jFlx9KbzcwygY/oVxVCULheIGPXLQ2BJ9qQWAd4KqRk71uhvskDxETftjhWr
	E1holR6aw2NTB67bZWebtjFmsNXW63A0jxctiiN9gCbz2jActk1qZ1NAQXqSzmz4s42p5yEVSikXn
	VYt98WJkRILbr0xpa/jH83UAXJgTUsTacg31z3kITqKnboPTJb8Zk/hr3VkA5HC0szC+KUHhUvb7p
	uWzULSnJK6qEHd1DNhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4mZ-009TG4-AB; Fri, 04 Mar 2022 10:03:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4mW-009TEP-05
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 10:03:29 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 195so7109853pgc.6
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 02:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y54ktKd4wc7WsH7lw6nZsgyvKLTv134GmA+zY8xdjj4=;
 b=SGZDKXJePqBrV0sAxLu6XG0/dxI/VUB1sBhx4bWpguzOlmVucZuK0rU+0cKa9NS2nf
 n0sxUh4eQaRX+dqRtbhOrpQ/QA6FqjiEVrcfZfsR1pOvX9RZkuoWwkNWZ/xgta1WZJrC
 oDSL2R8LL9Bj8aHcuzxidIZbjYixL/+j6+RO/5Tko/G4gi4k8EmJAizUZr02yXFwW7E0
 K8nk4bqEMywWkdPm2XEQUKSZTRIQkzsEOxeJUAUZsTylV4ccum9INs3WPCtgTKZBsUUP
 GbFzmTbpr8Yn/UpFMp+DacXIE2/oFxZ4BPsAhKJJO4VpgDT+okw5+w9eJsKno9Oc0x0l
 MUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y54ktKd4wc7WsH7lw6nZsgyvKLTv134GmA+zY8xdjj4=;
 b=gmOE1Ih/F41Vf0fuVFpGzvw9DTShvdJE41eBeqz369jBqvHixAD9U1+H9bdVBy4FCM
 ZfvhKNWTpcSvVP9T4HLc7c68M1MaFDdQEc2iB/sT8EjUZ1KhDYEZ9mPmJwNxNw6dNSeZ
 Mdh6+UnTIhUoCHQv/5QFcpiGr5RmW2lmLBwx6J6d2ua0Nh4cu6Et7caEQ7+sN+jmJFM2
 tp7jpQdkDpZJGJKjRunAqDxCozHJnvzcRiHGbRLrEcV1J/1TrcXEuscLeVJc2RlDMaOd
 wSaHsbDvQ2YLZQaz/RT6QVqcDH7uP0vGfYhbXJ9IuHwBNhdKeEMDrRqBj3oNDsRupS+6
 UxAw==
X-Gm-Message-State: AOAM533KuanWjfO+1mAHFWyAzUTU+L8fGOg7YUca8hJjDn6ZZwhtQ5O8
 SEBrclYR31HcNHuReyg5JRxfEA==
X-Google-Smtp-Source: ABdhPJwbdj2tEKA67YJ7rF/2kNeOsmHdJCZ/olVb/rnSSwnSH/sL0zqFgLqTs1dIeVm8a7KlmHDaww==
X-Received: by 2002:a05:6a00:887:b0:4f2:6d3f:5b53 with SMTP id
 q7-20020a056a00088700b004f26d3f5b53mr43055145pfj.21.1646388206921; 
 Fri, 04 Mar 2022 02:03:26 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a056a00174800b004f26d3f5b03sm5461605pfc.39.2022.03.04.02.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:03:26 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/5] Refactor the PRCI driver to reduce the complexity
Date: Fri,  4 Mar 2022 18:03:16 +0800
Message-Id: <cover.1646388139.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_020328_143582_E89FAF39 
X-CRM114-Status: GOOD (  12.82  )
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

This patch set tries to improve the PRCI driver to reduce the
complexity, we remove the SoCs C files by putting putting all stuff in
each SoCs header file, and include these SoCs-specific header files in
core of PRCI. It can also avoid the W=1 kernel build warnings about
variable defined but not used [-Wunused-const-variable=], like 'commit
487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
'prci_clk_fu540' where it's used")' does.

This patch set also contains the dt-bindings and dts change, because
we change the macro name for fu540 and fu740 by adding the prefix
respectively.

Thanks all for your review and suggestions.

Changed in v2:
 - Rebase on v5.17-rc6
 - Add a temporary patch for avoiding breaking git bisect

Zong Li (5):
  clk: sifive: duplicate the macro definitions for the time being
  dt-bindings: change the macro name of prci in header files and example
  riscv: dts: Change the macro name of prci in each device node
  clk: sifive: Add SoCs prefix in each SoCs-dependent data
  clk: sifive: Move all stuff into SoCs header files from C files

 .../devicetree/bindings/gpio/sifive,gpio.yaml |   2 +-
 .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
 .../bindings/serial/sifive-serial.yaml        |   2 +-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  22 +--
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  26 ++--
 drivers/clk/sifive/Makefile                   |   2 +-
 drivers/clk/sifive/fu540-prci.c               |  89 ------------
 drivers/clk/sifive/fu540-prci.h               |  91 +++++++++++-
 drivers/clk/sifive/fu740-prci.c               | 134 ------------------
 drivers/clk/sifive/fu740-prci.h               | 130 ++++++++++++++++-
 drivers/clk/sifive/sifive-prci.c              |   5 -
 include/dt-bindings/clock/sifive-fu540-prci.h |   8 +-
 include/dt-bindings/clock/sifive-fu740-prci.h |  18 +--
 13 files changed, 254 insertions(+), 277 deletions(-)
 delete mode 100644 drivers/clk/sifive/fu540-prci.c
 delete mode 100644 drivers/clk/sifive/fu740-prci.c

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
