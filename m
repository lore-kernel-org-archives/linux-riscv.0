Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C70C433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 14:27:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95ED20723
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 14:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ccvn971+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GELuecAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95ED20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xaG8c2+vHrQ3Xrw3z7uhUzsXWwXsYfX/1/HNCu/Crzo=; b=Ccvn971+LL823wbSHvOfer/nIu
	JdN45JM25684PCevBOFTX3pG5T9QUDVvaZiJMqURao5Ywt10/xnExhcNFmLzZoDh3kuzDjYO35i2Z
	Gmm9Z6c5AtthDsfNFAlcgCqaD6yyIhIvW3k2nJ8M2yd5qmcoZUzktxRDh0QQJAgS0m45lhsmQ1oBi
	8ufNNzjM8bpu9blcq1+roeaE+uNDIEg5jkdJ+T0G40g+sIk6thqImr91F7KL1dmTkDDYLqt5Dk9W3
	innixvoWHawwRgCk9Ovf8jLE/bjQv5u0djowRLXD4laP+4UP6/6S5ok4oFBzWVhhcLnugOBk/M2kQ
	/GYMF1+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js5by-00088b-8p; Sun, 05 Jul 2020 14:27:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js5bw-000883-AF
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 14:27:17 +0000
Received: by mail-wm1-x343.google.com with SMTP id 22so36454599wmg.1
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NgB2eSTAqdRX75nBNxEds+kdXqzkUfVjQLuWu0AnjeE=;
 b=GELuecAz7S5QEjy0rZFEwTx7MHkZsMd7wHJpNxUF3FecIr10whimj94UPL6PduIsms
 1XUa+hrcvh7kEhKLvdSzWvhMq56YfORBNU60ZjTCi/h7OEUjsp9s6i1iUgOU+xYWTZiR
 nzgktFfdDxGZekNP8v+9EW1drOe4iAa6vfIiFFdpG9uYYN7lEuxIswBA7mJXrX0czGLp
 0lJ1zTXSI+X9dHv26EKIU4iRWtLxHWgWNAhbfOXQ1EFLB0mQjGsJSllxYKrQkyTraaJZ
 iSR2Tx3q7KgA2bjTyVx9VTgFOyGaLL3C8wJyFw1lS2pqckPC1ogN95H2+uiaEOU+Dhkm
 O+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NgB2eSTAqdRX75nBNxEds+kdXqzkUfVjQLuWu0AnjeE=;
 b=cu+0JN/Eo+TEt65FZF9BajRP+wqa17A1zSAiECTNqqCIWN5RR3x/FeHcnTYzDb/812
 ImXcyLL7RL2P2kVa0rvEc7t97yXsNuiHbtYvgEEBkJ57HiNxxsbHrsue2X4MjF5SHDtj
 3lCC3P8F/eT/eUIE4K1Lq9bhF4j/FCSnl0cZs3ScBUMLrGwEVC0iucnv3wXZvNR5g8Us
 YhBQJntbcES+bn4sNCRme3rOQ+lvKcWz9KHqYXvmWHbh/xNjJlkF19PlFEqwkBPzAnQN
 AXgw1U7tjjQlNLcMsnpWhhErLfPYV8lhSndSbMQBfnM5+xwW8ACu9mcQ5t4ptmjUeA9j
 JjZQ==
X-Gm-Message-State: AOAM531l8uTJJ+B/l0BHMNRuUvzGbSRL6kxnT4lTOqHBnlXqQC8PDCc1
 y+G1RaGU1VZ9IONUjS2RYMp6+wm4qPYY8w==
X-Google-Smtp-Source: ABdhPJxZ61Zb/ZBtckCYkvvOO4vwUJVlb99H7oXKFfB+zyFAAiM7k+2OtFrfnaJ/R7DBNTvLD4pCSg==
X-Received: by 2002:a05:600c:2907:: with SMTP id
 i7mr40744911wmd.40.1593959233823; 
 Sun, 05 Jul 2020 07:27:13 -0700 (PDT)
Received: from localhost.localdomain ([80.71.140.73])
 by smtp.gmail.com with ESMTPSA id x1sm20242247wrp.10.2020.07.05.07.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 07:27:13 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
Date: Sun,  5 Jul 2020 16:26:40 +0200
Message-Id: <20200705142640.279439-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_102716_384835_E1481C49 
X-CRM114-Status: GOOD (  10.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Without this enabling CONFIG_PREEMPT and CONFIG_DEBUG_PREEMPT
results in many errors like this on the HiFive Unleashed
RISC-V board:

BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
caller is regmap_mmio_write32le+0x1c/0x46
CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-hfu+ #1
Call Trace:
[<ffffffe000201f6e>] walk_stackframe+0x0/0x7a
[<ffffffe0005b290e>] dump_stack+0x6e/0x88
[<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
[<ffffffe0005c4c26>] check_preemption_disabled+0xa4/0xaa
[<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
[<ffffffe0004737c8>] regmap_mmio_write+0x26/0x44
[<ffffffe0004715c4>] regmap_write+0x28/0x48
[<ffffffe00043dccc>] sifive_gpio_probe+0xc0/0x1da
[<ffffffe00000113e>] rdinit_setup+0x22/0x26
[<ffffffe000469054>] platform_drv_probe+0x24/0x52
[<ffffffe000467e16>] really_probe+0x92/0x21a
[<ffffffe0004683a8>] device_driver_attach+0x42/0x4a
[<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
[<ffffffe0004683f0>] __driver_attach+0x40/0xac
[<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
[<ffffffe000466a3e>] bus_for_each_dev+0x3c/0x64
[<ffffffe000467118>] bus_add_driver+0x11e/0x184
[<ffffffe00046889a>] driver_register+0x32/0xc6
[<ffffffe00000e5ac>] gpiolib_sysfs_init+0xaa/0xae
[<ffffffe0000019ec>] do_one_initcall+0x50/0xfc
[<ffffffe00000113e>] rdinit_setup+0x22/0x26
[<ffffffe000001bea>] kernel_init_freeable+0x152/0x1da
[<ffffffe0005c4d28>] rest_init+0xde/0xe2
[<ffffffe0005c4d36>] kernel_init+0xa/0x11a
[<ffffffe0005c4d28>] rest_init+0xde/0xe2
[<ffffffe000200ff6>] ret_from_syscall_rejected+0x8/0xc

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
This patch fixes it, but my guess is that it's not the right
fix. Do anyone have a better idea?

 include/asm-generic/mmiowb.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
index 9439ff037b2d..31a21cdfbbcf 100644
--- a/include/asm-generic/mmiowb.h
+++ b/include/asm-generic/mmiowb.h
@@ -34,8 +34,12 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
 
 static inline void mmiowb_set_pending(void)
 {
-	struct mmiowb_state *ms = __mmiowb_state();
+	struct mmiowb_state *ms;
+
+	get_cpu();
+	ms = __mmiowb_state();
 	ms->mmiowb_pending = ms->nesting_count;
+	put_cpu();
 }
 
 static inline void mmiowb_spin_lock(void)
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
