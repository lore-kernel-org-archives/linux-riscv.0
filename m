Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07754CCA473
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 07:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQ5feKB23wpdSUXoMruX/swLhvtZOslpYzRK18chhYc=; b=OpFxh0+XprauCp
	6fx2YMzIjTYmKv2r4iH97G9NpHoQBMfGzWbOQuQRaORjIjTSBN6o+rMQe9cDT23WMdafNjN6sNKeY
	98NinnISn96/Rjz9NDaUaEyV0FcmRQiizWrjBHOzjgRj4JyiSRqN3Nby8NKtAjzG5Tj5VzcYaVICL
	Gbg61hOhMcjhRaTEakBjNyNl92XW+SWMiWBpZaYHv6CPUxXxmm6xrVXc+kvr2ifzrpbbDAZa22mZS
	M5dudG+XcP4q2GgXM3/lcd+7Ik0aAbi958AIwop3PpuIeT4/49E1HF5J2ZtV2JdQ3zp3WyvrDc1sx
	Iul9ti7fJQTT/DcaULFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUl-00HLVl-8E; Thu, 09 Jun 2022 07:22:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUQ-00HLGH-ST
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 07:22:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id i15so2828810plr.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=flMLH60JN0xJtM2DRltXxdqwFWqCi+d4R4wY1pFKPBM=;
        b=b8NXq6ddr8cTRyuUm1xzLVeE43JpeOmq70u/+XvSSLdgzeFDJdrdO9XY4J9bo/OpND
         cu1Lm+o0jcvj50RvdKvd8ONPg1nLTOcgF5zpZEAyUOrYoc+BCO0+k+KNpR67srBd+rzG
         A8CA5d6r0QZyweplvbm1C/6rwSeNMmwyBQNV63E2NkOY25zG12RSgyw/OUcMxWEH0PT2
         G56UY3cXY7oSQ00gVDwpngU0rfj/nB7MZNS72aqiyEi5WXxmMcfYDvAeauNGtD/BCS/m
         PLek8XBrDGKCXpgMJd5UM6veudtwF8Sp9p8u8YortSMME4CDm4nTm9Po5SR9090CWsEb
         9W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=flMLH60JN0xJtM2DRltXxdqwFWqCi+d4R4wY1pFKPBM=;
        b=6bA/6F+LjrSWkS5tYilzkNeGJpbqGhNFffuvHZxLSrNC+g8BKWWZZX/+3hAsXrTinX
         0Faj6lAQVduwXhxW7DBaHk3xK9u1e6/3CPQHX6UoULLbde47pIOECdfn/3NoJvqLClET
         c/igSaVNZVcMDATIDArSou3ewGZNLdS/RR+5bW9Yj6jEq8hOw8AxDZYK9G922Yd76VJ8
         bqJqk7YtJM5vlML1YsRgK60tpYbaGKqcS7AfpHprjc/Qu07XU3RQoyyi23/brT9vtVob
         R65+uEbTgP7NxjdhaRnS67Onl7iRLp2ZN/Dhl6Y6C/VUySh2Ox/FJ1Bc8jhCAfVswXft
         IMAg==
X-Gm-Message-State: AOAM5301uRfMzCiWn6SUEiC99amyYtvRu5yEo/MPBqpa2/677Dxx3wyw
	ZolNM8m98eiykwycBbNlCAgkpQ==
X-Google-Smtp-Source: ABdhPJz35W+R+LDULUe2kGMO1R1/d2hE7i4OpB37D7T61Y/oqqd9+jiHT3NGqXELxvAgaLDjP18Ukw==
X-Received: by 2002:a17:90b:4d05:b0:1e2:bf91:8af2 with SMTP id mw5-20020a17090b4d0500b001e2bf918af2mr2047211pjb.210.1654759315019;
        Thu, 09 Jun 2022 00:21:55 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id r2-20020a056a00216200b0051bd9981cacsm12952572pff.123.2022.06.09.00.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 00:21:54 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rostedt@goodmis.org,
	mingo@redhat.com,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	zong.li@sifive.com
Subject: [PATCH riscv/for-next 4/4] riscv: ftrace: do not use stop_machine to update code
Date: Thu,  9 Jun 2022 15:18:33 +0800
Message-Id: <20220609071833.1051941-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220609071833.1051941-1-andy.chiu@sifive.com>
References: <20220609071833.1051941-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_002158_955877_5C8AA591 
X-CRM114-Status: UNSURE (   7.84  )
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

Now it is safe to remove dependency from stop_machine() to patch code in
ftrace.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/riscv/kernel/ftrace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index a6eb1b1ac093..a00326b41795 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -12,6 +12,11 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+void arch_ftrace_update_code(int command)
+{
+	ftrace_modify_all_code(command);
+}
+
 void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
