Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE275C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W40tXwBb/IHTOhUfEvR1aMXU7QRaUyhQIV3Viue5JM=; b=iL0owV4dUTbNGz
	RCPzg2gAFxTUOKndA7V7PJCIW6rY55yl9Vlxmdynb5o9pdcEsqSuk5v5eOxtjLtr84vxRHMqu+ZXV
	8/eh3pGxYNSxTrC+oJ3+5b1vyHk7dUQMWGGY95657tagAnXNcCGxnIsyn9ZFaapWvupuaI1b/NUzM
	i94sO8N1DB3EIv3Pqg8BHkEFnDEqK0nUZsz30aDE7c6qOVrnJgMeanOageA3kYQWJhe6x5oP7E3Fo
	HZOPHenuj58a4r5aeP6UdD53o3K8qlxKto7Vh9eNveGl7fT5kActmUdxIhIIBtqidJ0TJMxsuBJIX
	DT7TkgEhExI4ykwmH/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqp-00A2EE-17;
	Fri, 14 Apr 2023 16:00:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqm-00A2BH-34
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id la3so18553661plb.11
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488034; x=1684080034;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=KmNeQFGssjzK0xQ018T4SlGSmqFwJkBPec76ZOBY4rleHRUhzy2MMot645T/KeOxTy
         oCUzwlMXTlgUhoQ2v/rnI/1nwPbARVDCBxETuqvmwYWIRGAEKZrfCo/iztYx6JyMhV5g
         O+uRyS2XqxLUA9A2EqVkmDcKftggvVg/dsNE+MsWdowrLBiDFI9/WYMvk5bD4fSOT/xC
         FXhbKspwDSOieEFexzugK5oDC5yGNjFwNTmfgG/PP2YFGoMJGq3iCMX/8OPkOd/KD9h8
         85Ymzshlsn6z0qRvDtlK0U7vbXaDnK3OjPzWfGqXH1wh0EWCZW+8yhpIAOLa670BS84k
         KT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488034; x=1684080034;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=aRvOqvihwNfcM5SgzWa3xeuJN9H6vS5QAcl3a15XvXxQ3xZQOtjwfXMwI0DTcm/P6c
         /+OtwQ/kLdZ34rFf9vIlKDrzzjLalMk2y7R4b32Y0aJM+jcMz26D6uSLh+Wl5nLSb+B/
         3xeJ61KX6HbJp+4WSYSzSOIdZYuAxtqXApJV8wxSpYofH8wjj74tdkm9dyVCibOhWsbW
         jMHLcYHjmlb15WHgpPt9LyTJ+MXGF2hHOIWdSY4+1Mg/23jfnLhADGtwPR12Lax6c0kT
         koPmApdt6Z4g9PC0bHB2v+coVBc8UqUwSVILdhbbcrCoHbZnQB7jupnyrbSc6Hk1MF4W
         OZew==
X-Gm-Message-State: AAQBX9fihNtEdiHHT47zvPX4Foc/om7c4bMjCrDzhoWVNMQINgq/B2a9
	kE6NmFn54wO/TMXLNNr4DlwuaK9s3rAmMgs7t3t0SpQJUO6MnzXynnxvU2OZc934tnwJbF/i1ii
	cz2YWN4EAO+XzrdOzzxWv3Dcj2DNcCVDIVjxZRC3uSZJBB6G4Wr3pVV/B0VKZGVx+2Ef61w1Qga
	QLDHvKsLYEYhOw
X-Google-Smtp-Source: AKy350bLWel/6yEV1JmbLZwHUbnX6eF24BdOzl+/i67z9xt7yAYwzmd+UIUx2N8+rcDKw8RpGj4wSg==
X-Received: by 2002:a17:90a:be08:b0:233:f786:35ca with SMTP id a8-20020a17090abe0800b00233f78635camr5818524pjs.35.1681488033705;
        Fri, 14 Apr 2023 09:00:33 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:32 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v18 16/20] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Fri, 14 Apr 2023 15:58:39 +0000
Message-Id: <20230414155843.12963-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_090036_988694_4F4EC1B0 
X-CRM114-Status: UNSURE (   9.29  )
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
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
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
