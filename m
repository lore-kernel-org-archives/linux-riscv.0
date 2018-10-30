Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94685C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:17:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B2920657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oB1yDdio";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ogsNzlSY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64B2920657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=uxUeJ/8vrreDn37LowFMfjrsJoI1//0zBKgvyYxBZ+Y=; b=oB1
	yDdio0DAmnWZ0o3KH7FUHXGLTCWEjauV+65Q5/NbAbA5SefnLacVcU5dc6d+bkW3Vigc/SweMcmIY
	qE6NvNtYVgyxizU9/o7LmJewa15qJuCh1cqmXFllmvFSmZ8JBHlE38c55nVJbsOTuTsjPuKuzjPts
	nPeeuPk7KM5uLK+16aju2V908FQuZomsD4IP+mJweIqc8SDwBZNd3T1grIdngoqfNAOd8ei/UHENR
	AgdEo6gtR6yjNS5YxPRN6k352AGiOeQo7YWDslLA4nTtWud6MzLx7VtggeZoCvrU4vkI5/B9+gYBA
	ORVL1AVArXSkgEaXrHOACg7Hn6x2u2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHWhS-0003El-2g; Tue, 30 Oct 2018 16:17:02 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHWAU-0000Er-Qj
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 15:43:10 +0000
Received: by mail-pf1-x442.google.com with SMTP id b11-v6so6039683pfi.5
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=yVaQod+fi2xINGG2j9rDMMFEZAk6lbYu2uDKW0xsB5M=;
 b=ogsNzlSYarf8GOyoaCSXAzEmdU9SP+rm4tTlJfdZk8seWSFOoN848gYG8rX/bQv8f+
 djgp3OEfoNrtKc+bY79vXofXnmNi7hjeg7bjM0Yn409WDP1gcCLsfo1bz4M39rs5faIr
 g1vXWEeAIAs2mKY3+F2xgDC8mWcbdtdG/ay44sGBjJqxmXnXKGB4IHJyy8O0OAmKTu70
 ksIYFaJ1OV2U+9BdmVjlSRT/xGCKws/rQ8Y3PdGFhuoRKywqGDaZlxTg7uVhOXRvyjC8
 rf8GpQMQwua+zuMplEcYoOPEeJ/RSlPyWGO8P6XZKYSZuOEOuoP0opL4s7Z0vIDyBOke
 MyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yVaQod+fi2xINGG2j9rDMMFEZAk6lbYu2uDKW0xsB5M=;
 b=aW/OsfRuv+X4zc1MNqgRVtACMwuGUhpYVKLGpXICI3OQawhGFAU6vh4XK739/Po+p1
 HNMWUZWvUKIqs9y4Yq9yWV/6YNcDrib1kfhhz9o1LJgVMglvy0OhIKQvUqv3ZdDOUrJK
 m6XQqF8y3APSQU5MADzyngYQMM6hTmCwEzYRFmYg5+EjV0mcK++cjXFX2j3j+e+QmY+6
 aaJT/V+jL2azKHPOFlLKKjxjjvjt8DDm104acdokx9WsLwpKY/Htirj7eBPR8ETTcMyW
 npaxLjslKUPU2e0OjZta9B9voQn43/VfyhDNh7ww9Y35d1bUZyKJzghX9RWOSceRH4E1
 UNPQ==
X-Gm-Message-State: AGRZ1gJ+9eEdfcYfbOly9xc7WXy2JcnsVnhIsYKsISwpzOG83uA7/Nf4
 xp9s3T2k64Stc0pyZl2o0SCvlNmnkcM=
X-Google-Smtp-Source: AJdET5cmuSn0QKBHKAKDZdLdcyyWKmai7cMssQnjrCVPiiVUxVt8X9aTRdJWuUeQoB/cn2CLW7PiWQ==
X-Received: by 2002:a63:b04f:: with SMTP id
 z15-v6mr17927913pgo.442.1540903056507; 
 Tue, 30 Oct 2018 05:37:36 -0700 (PDT)
Received: from anup-ubuntu64.qualcomm.com ([106.51.30.16])
 by smtp.googlemail.com with ESMTPSA id
 l16-v6sm34819958pfb.75.2018.10.30.05.37.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Oct 2018 05:37:35 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] RISC-V: defconfig: Enable printk timestamps
Date: Tue, 30 Oct 2018 18:07:20 +0530
Message-Id: <20181030123720.3273-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_084258_882955_7876FE60 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030123720.yUxVzOPb-cRXxpQVTD1rbtMIyI5l7rjDttR9KsUbYms@z>

The printk timestamps are very useful information to visually see
where kernel is spending time during boot. It also helps us see
the timing of hotplug events at runtime.

This patch enables printk timestamps in RISC-V defconfig so that
we have it enabled by default (similar to other architectures
such as x86_64, arm64, etc).

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/configs/defconfig | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 36473d7dbaac..ef4f15df9adf 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -1,6 +1,3 @@
-CONFIG_SMP=y
-CONFIG_PCI=y
-CONFIG_PCIE_XILINX=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_IKCONFIG=y
@@ -11,10 +8,15 @@ CONFIG_CFS_BANDWIDTH=y
 CONFIG_CGROUP_BPF=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BPF_SYSCALL=y
+CONFIG_SMP=y
+CONFIG_PCI=y
+CONFIG_PCIE_XILINX=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -59,6 +61,7 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_SIFIVE_PLIC=y
 CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
@@ -72,8 +75,6 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RCU_TRACE is not set
 CONFIG_CRYPTO_USER_API_HASH=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_SIFIVE_PLIC=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_RCU_TRACE is not set
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
