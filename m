Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD18EC27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7pYJek+veCgfl6wsDDN4pcuLAswDECjuOjHBqXASZg=; b=RNGS9LR+rA5drW
	Cbz+2EQ9CZtaxZ3BovKV0xnCObeUK/1PFWHgxXNcLTB7MpX4rhnN1zEaTaAjQ26bpvLXmHUCoELh9
	3wPs6GDRCUYYbvncILAjGvKG//zKDIdzlFK9S9EzKBm9ADn+RgqCCphC5SQGIr0Byt/FMoEmqdKnZ
	zCja3Ez+HOsA1Fwn7pgDwXPwYzLdgFDPe5R6U29MsOra+VRJq/ClwQxRyZSPDU3Jsv05TP6GyAMkQ
	J7QKBo5RcST8lv1gqQ5PCeLaYohW7NTUGv4Nd+SHmlvuox9xVGNsNcysA6zQ6+kfb4Wwtm7iUH19q
	4b7zkvof5LNKAunofWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpAp-000Svt-Hw; Sat, 28 Jan 2023 17:39:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpAl-000SuG-3D; Sat, 28 Jan 2023 17:39:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFADC60C3B;
	Sat, 28 Jan 2023 17:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EF2C433EF;
	Sat, 28 Jan 2023 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927566;
	bh=DagLxOVAD8dZ5XZJ5KAelN3Ssg2fs0hrrowAksRXbDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oT0zfWs0nmmmMMj/V7Yp77YZBYwmb+jzveUOU35SYj7UHoo97UB+PNzvdWdemBupl
	 RPZyoZkye6qMuTem5VFY5Js3fmeaj+oFDqd165GJgdBe71iQWR7j3c+zWosc33lJMB
	 Wlc43mqAIAeuBMMq4UocIFmsJ7K10MdfVFiQCFxiS/AyzyrCMBRDvkyABpxoH6q2QM
	 XrYAQmFSFDnX2hZKP0vzqooc5aGD0qPzSvHnH92ivfZUXdWdL7RQXZ0msaRX4/qlnI
	 3rei05KJyw9oIPsNv/NdqV6jtROmdwyj9cf8DZbSgvhGZq32Oaz40nuBRftt6q3SzY
	 fgGnPFoHbNTLQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 01/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
Date: Sun, 29 Jan 2023 01:28:44 +0800
Message-Id: <20230128172856.3814-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_093927_191383_323145F5 
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

It's a bit weird to call riscv_noncoherent_supported() each time when
insmoding a module. Move the calling out of feature patch func.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 1 -
 arch/riscv/kernel/setup.c      | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dde0e91d7668..62443fd32fa7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -298,7 +298,6 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
 	if (!riscv_isa_extension_available(NULL, ZICBOM))
 		return false;
 
-	riscv_noncoherent_supported();
 	return true;
 }
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 86acd690d529..376d2827e736 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
+	    riscv_isa_extension_available(NULL, ZICBOM))
+		riscv_noncoherent_supported();
 }
 
 static int __init topology_init(void)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
