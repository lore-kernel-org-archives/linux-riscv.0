Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6BBC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0t6yYvdgy6W7BSgkjM8X1unm1IoT8v7iDaOOFBuRkQg=; b=rAfxZA7CakG8it
	R0j3K7s7ptwoXOu86l0Ri/quaDooAZ6oAwN5YwnSXFJGKiYMEMLuTkh0IAzgO0YaczNA9ePex+0fX
	BbKLXeFw6QJS4OJUXGi94UvwEZcDQakJ2HDelBa03QkTdnwTNnUOmWHsTh6E+A9mE51hlxaArSZol
	ifbSWMXI6WIXbUS0fvA0glaESORLByWY6MHPhQgJtYSCq2tuXlaRIfUpN3O+TKwiNIGyY/f/+aJ6u
	rEWN72l21Em0RGSixlG/1ALOQax41VijD10zj3T93HFT3vmlpBtX6AZqNjar21X8KtKa+voudx0Tq
	9IEQPwXPkJPabEkjMmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngP1Q-00GNdy-HB; Mon, 18 Apr 2022 10:54:20 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngP1O-00GNax-0d
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 10:54:19 +0000
Received: by mail-pg1-x52e.google.com with SMTP id k29so18200614pgm.12
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 03:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sX9W0jJI3V+TTQxrILZfbGus1iz/Yao2DvXh0KaNAVk=;
 b=dfq5nxRHRr6Vx5qEgX57IF65zgE2vVmhCiwB5zffgAqsMWTu6wr1CGxCNlu8DTUa0t
 DTvlRdOymlFXFt06/SzX29Vm8lZvm8Pyu8QrvBgX56wA4ds/WDOAaihVGK5qGPG2dxvb
 nGv2r6YjuIsulVRF2Q6Og5Ftk5FeuGQOMDjWH08IexikHcBNlJ1gdPuUMuJnka7VRbek
 mmYv5dNZCLa0qClq4I3MTTY/MOP2gRYD6vVe7Or1sjkxeOGGw3bMtD1mH6Pj5F+EDtwG
 mVFSMv/wt7jILCuDfg/yqBLjcL8UTqcNejXS4SbEFzmMni5ubNGpfLvQVDXVxjNaq1AI
 QjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sX9W0jJI3V+TTQxrILZfbGus1iz/Yao2DvXh0KaNAVk=;
 b=slfi1SFvOXpwy6bxDUfOVF2p885KPw9ZyKeUz4FvTCKD9D+GTQyN65mBUzqZETRebz
 WOGr1P1MWmxF9Tj3mWRKh4wa1BMpIX/WJvZwKMS7AmRGTXmHULQJDoJ3InwZXnNRFozq
 3vyNh0h5P2vE06zx+n5e84UflBSz154xHJm09UAN215eOIJ6VcEH1yxLeIfK1RAKGe0u
 jCTUmX6lrctgFpAu9lrbdktPlNXky3JYd9BdwgY5S0nUOnFD8EuP/HEViWir3sUCYAHU
 mYOtwU/gRe0rSEPAR/VcEv2nP3ivNYn9qVHRMvgV8nRoXZ1lQypuroyrZ68aiEYjHL+w
 DgqQ==
X-Gm-Message-State: AOAM5339za9bTMTvD10HadHUPKrenOcd7oru6mIhtUDDOIcoXH/FrEZO
 Y1nlMLXJ/gTDTRQ2fGuOT/ZNFw==
X-Google-Smtp-Source: ABdhPJwLL+wp8GjQBIxTmwnulmQuTS6sDMH8dVFmsKsJdWwsnXB7OAisEOQpLEWJBpXDRZiR9Rbvgw==
X-Received: by 2002:a05:6a00:1ad2:b0:50a:8181:fed4 with SMTP id
 f18-20020a056a001ad200b0050a8181fed4mr1628046pfv.16.1650279255667; 
 Mon, 18 Apr 2022 03:54:15 -0700 (PDT)
Received: from localhost.localdomain ([122.172.241.223])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm12986278pfu.202.2022.04.18.03.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:54:15 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Mon, 18 Apr 2022 16:23:05 +0530
Message-Id: <20220418105305.1196665-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418105305.1196665-1-apatel@ventanamicro.com>
References: <20220418105305.1196665-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_035418_083270_BEBC8989 
X-CRM114-Status: GOOD (  11.72  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c7e44aaf791 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -18,7 +18,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -66,7 +66,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
