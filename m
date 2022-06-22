Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035E6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 22:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=90R35W4RDHBEWVqObivodfd9JzFSwIdscY3cGO/uFpo=; b=my8n53tqRUN/zb
	NgaDj6vJVmQHNXJBtqzZou9IntW5kQMgoqc7UAtmJZBdAqWaSjrHCxyW8S/0ybVsmVtRPOkN0zcNy
	x4fVRN+8o9tXKIjMG3oMPAPnxtw443PLqsllgLtA/mVC4C7O7VUjfjPoznQPPshQib9/OasJNQ2WC
	0recDEgbYBkR1g+wOuCCkVMzRrbG3DnGVsm5hLE9AJDb2yqaWMVF+B2XvihCBPRUKBOdSwOi0/0FK
	c99EmDlrYYNGqy+9n0I0NVvnCyyuug4z3ue1Yrwu4kb78YGTv4mU7jMGJNt33VMPpAXRTS5sdqtnz
	v1261xhqO+hFKUF5Lbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o49JG-00CUXl-M8; Wed, 22 Jun 2022 22:58:54 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o49JE-00CUWn-0d
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 22:58:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id v14so25434057wra.5
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 15:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jTgx8LlrV7VzfSAHm0aCpzWkqLuJ2p9NbNXPOJETWQA=;
        b=fmpkVEhXK4yJYvB+KQn0wvRcKJMjKVYlKQ9kpZzHQQfz94NXhacdSvniNKSMKYswC8
         jxcWauK1qf8CRwK3LQb+mGMAc6l8M0UBMtbP3Ui69a6WT15FTXL8Z8e4tX1B76XuOG1/
         pmioBquwiCqDixFjGp3qE+fuZFNCO5JJ1izNUtyEZhfqVXCGD57PiZtzgmts5i4z0mYB
         bjfSEVMoYLcZt7xwHIGtkB716T4GLhLGR+SPI8lve5FTjK7BWDZoiuyrqe1a6MeLBw/k
         2uz8BJy/Vtb1N8BjP2A7D9FKefK5gBO5vj6iz0We8LoYzvY4iiIs7D1FPRS8cq5U3U20
         CAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jTgx8LlrV7VzfSAHm0aCpzWkqLuJ2p9NbNXPOJETWQA=;
        b=Ud7yESbrjCMM2WMWM3PHUK+t3xbdd3Ph6nhN3rRdRpl9aRdcOlGHo4egZpkQYbBkl6
         afl+spdIv3+sh5XSaTko7ecmniEAtxsr8l1luxhNSeYha5eLRvX3Zc3wYtyU3Sd4mw2R
         BiIo/i+XFAIYTviO8yufZZ9xz4M0QGySyLrxuRHv3mmfwyedN74l2Mdk5MT7M7GL74fJ
         klCVD+ta+avZlcqYPoniUYJfGtJgJu/Vs/htGd2aWY3F06ly+It2c1HFVOLzdJUI+QZK
         a3AKhjGUHyItPKS/XjJhrP+YgFOi9AEbqDYb4sD02obE5LuoZ1qjBz069Ed+yK/5JYkb
         baLA==
X-Gm-Message-State: AJIora/aGfWrm40MpVv5pHzsHo28O2SJvGJLbxyxrNwEDoLWnXfQoIqZ
	XHYg7/+4QnKplZU4+eCHujg0oQ==
X-Google-Smtp-Source: AGRyM1uGgD1sCP490YQxm47iNCS04Crh/Cbzsildj6s05FTWtiAOE5LFiKCg5wzFGLXZzckLm86mXg==
X-Received: by 2002:a05:6000:2ce:b0:218:544d:432f with SMTP id o14-20020a05600002ce00b00218544d432fmr5334377wry.580.1655938729169;
        Wed, 22 Jun 2022 15:58:49 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id f8-20020a1cc908000000b0039c99f61e5bsm851458wmb.5.2022.06.22.15.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 15:58:48 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: palmer@rivosinc.com,
	palmer@dabbelt.com
Cc: Conor.Dooley@microchip.com,
	Cyril.Jean@microchip.com,
	Daire.McNamara@microchip.com,
	Lewis.Hanly@microchip.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au,
	kw@linux.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lorenzo.pieralisi@arm.com,
	mturquette@baylibre.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RESEND PATCH v4] MAINTAINERS: add polarfire rng, pci and clock drivers
Date: Wed, 22 Jun 2022 23:58:23 +0100
Message-Id: <20220622225822.2166305-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_155852_115477_B21B28DB 
X-CRM114-Status: GOOD (  10.83  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hardware random, PCI and clock drivers for the PolarFire SoC have been
upstreamed but are not covered by the MAINTAINERS entry, so add them.
Daire is the author of the clock & PCI drivers, so add him as a
maintainer in place of Lewis.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..01a7bfa49bdc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17136,12 +17136,15 @@ N:	riscv
 K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
-M:	Lewis Hanly <lewis.hanly@microchip.com>
 M:	Conor Dooley <conor.dooley@microchip.com>
+M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
+F:	drivers/char/hw_random/mpfs-rng.c
+F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
