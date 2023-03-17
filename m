Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A430CC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TB6FxQQEC+5cFnAijbyIjBOW3veR4+3OU8Yx5nzt8Ok=; b=zvaRM1sXeEQBBU
	/YAwRd3C4yncbrzo38VOWrCJxEZD3RoSZHPYTf+tqHU+yfhgylJ5RNggXAfHj7H6AiFeSECwR/wHG
	YAmOrbnfPOfAIhOTS4k9KPMpux/a4/qoWSYEXayiUxLH51VehP1cECmJfXTWIMKXp64D7uESRh/Hm
	SQE/ofNvmxKPXhxMx3xtqSnJhoGoUg82UNX5MRbxEfVlnXkDTE/NXxoIiaHaGw3zOxSzAKoreQVTA
	YasjJmmXjlwKlfCuTlqP+lTxI6/Fw7QmaCzXFl2/IBxdnZngLC70QmhwSSFHUUzTHOYzaFZJmFgHO
	GiqudV+vast/2L9eLkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PI-0025kd-0v;
	Fri, 17 Mar 2023 11:38:00 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PG-0025PP-0d
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:37:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso4882695pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053077;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/srIeqtOeL8WlVYBrDSAnb/WyWsrKaiEJtMn58iONk=;
        b=JTsUG/K5QtL0DcwnamfsJrMzXDQ7zOkJtx0wegxPmA18XsJ4/5yCCu6YfqY0KmiSpe
         l+kvxhhrIt/CfokY+rUkAy/f7XFtL3ZpP61hyC3y87rLTamoQEN6XPFHCgWAnuhnmVm4
         6nctYI1xK5eC/YCCg6k70XgE4+QACVApaoizHMjKDOc/UmEk0RJt3OnGtsTPtysVdANL
         +J9hQdU0YZgYFcDtrkRDyz8Kh1dv4Wf5GqHG1QxfH9+ML5NsIlyAieagxROEUTkbtrig
         jY+ZcQOfkxfEBF/DahZxkKABEyC5RKjYpiQwh5f9xthiFP+sfdMFhdkExxhpnm2voInl
         LI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053077;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/srIeqtOeL8WlVYBrDSAnb/WyWsrKaiEJtMn58iONk=;
        b=8C8RcAPXIcl0KDH5GC6rrbKqAgTR/4R6feGW/6+sA72uUTAXxvZoILlDKrvnw0Qx80
         kR1XKvjdCKhZm0hYHHe15pMM/zTS4jmSdtnv1P/rGzuXKGDtupUMv9LqBxYk5prqRkgm
         2FbYqR1c6MaJPuedp0bbgCxIZpkhLzPpVYSAYL/X0jleoVRRaEnKGJl2DAEvgm0vwKoL
         HMCvBzydgf0/wbp4uV7Y68syNxMoelybGnNg4KSjUbZcsIsgo/8C+XTp5J7t+z9vipiW
         pLuL0q2ui1M1JZxqW89Uq3nfmT7+duCTbbIRrbfiKhqis4BlwFYWRyC0MeMavNWluW3I
         aihg==
X-Gm-Message-State: AO0yUKVKL8CGwSAaljRshKA7h3JBT9YPHpc0IkBaXyuRsmhQvSG7XUKq
	tCTPg/PdPnXK4MQOAslilC5/wcwdymBF46voNQcwn2vR7/ZGKGY9lTPux48RdZDpe4pQ1oX2tNU
	MOyKU8EurLOQJnbVYh7WQoj80WqPrHrIySqUAX5ow7Zd3V2+WTYu1Ij5hYOUimZHUJj19AcBTBa
	YAk3QM6FWpMzBK
X-Google-Smtp-Source: AK7set+SvLkgLD55k9exmeaGWXbyv8B92DP3AAq3POzq7CvetackAp4FKOja4aWavUybfyNLCQhgMA==
X-Received: by 2002:a17:90a:51:b0:23d:4b01:b27 with SMTP id 17-20020a17090a005100b0023d4b010b27mr8210678pjb.10.1679053077169;
        Fri, 17 Mar 2023 04:37:57 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:37:56 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	ShihPo Hung <shihpo.hung@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v15 16/19] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Fri, 17 Mar 2023 11:35:35 +0000
Message-Id: <20230317113538.10878-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043758_239910_77945A64 
X-CRM114-Status: UNSURE (   8.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Early function calls, such as setup_vm(), relocate_enable_mmu(),
soc_early_init() etc, are free to operate on stack. However,
PT_SIZE_ON_STACK bytes at the head of the kernel stack are purposedly
reserved for the placement of per-task register context pointed by
task_pt_regs(p). Those functions may corrupt task_pt_regs if we overlap
the $sp with it. In fact, we had accidentally corrupted sstatus.VS in some
tests, treating the kernel to save V context before V was actually
allocated, resulting in a kernel panic.

Thus, we should skip PT_SIZE_ON_STACK for $sp before making C function
calls from the top-level assembly.

Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index e16bb2185d55..11c3b94c4534 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -301,6 +301,7 @@ clear_bss_done:
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
+	addi sp, sp, -PT_SIZE_ON_STACK
 #ifdef CONFIG_BUILTIN_DTB
 	la a0, __dtb_start
 	XIP_FIXUP_OFFSET a0
@@ -318,6 +319,7 @@ clear_bss_done:
 	/* Restore C environment */
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
+	addi sp, sp, -PT_SIZE_ON_STACK
 
 #ifdef CONFIG_KASAN
 	call kasan_early_init
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
