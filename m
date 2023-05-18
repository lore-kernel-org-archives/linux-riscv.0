Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFCCC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W40tXwBb/IHTOhUfEvR1aMXU7QRaUyhQIV3Viue5JM=; b=ina1sp+k0fGVjX
	KvoRctcUfhFll4r8qSvPnE/iYrqNbuwXyx7wLxyNvzRVQH/alni/OcUPbBVNm0IjIsJN50wA3cTYG
	crRPfkGBeexfEovyOzLNBl04pXXOR/AlMUMvjW+gjUln4FaFBIb2lEuGZwtWer9DZZAS6E0OiZb4i
	IGYnrKu4mEFaI2MBUWQoCbjke2ul459aQZgQL9TkoKohGH/qcZNbz1O9GnpHajDjmBIaC0aJ75ZDp
	fBagJprOYNqmfnj8MzaWwZ1mpt4sCmSeTVLY7TVCoCXiVDmz/HOZ5JYuh8mcOw4AP7Hza7+bCbBqj
	KeyAByhxSKXz5YnRxaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzggF-00DVA3-2C;
	Thu, 18 May 2023 16:40:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzggC-00DV6M-0E
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=; b=DkX9OC8+dTbwIyj+O6faUNwoVv
	+JuVX3P/brHS1KMNcoRcPxoJ8VHL/wK9wiug+RlrpoXyUzoQPpH1CMNdJgKpbVV/bg7v2zwaJ4H4T
	pJFvDWhv4zo7XQ4f17DPD9/rFv3wwMSYh5hmnI+UnEWCCgN+ViCdBV1Y/GlN/rsT40bg4y+I2yEt/
	0BoWGgrCXr+G6Le2f3ERUmkhI1ktkm7WW2kg0P1dc6yJ8M4ZBHp4uu1bOghGyKqPo0oXnZC4UGk/z
	pBIlSgNJ553XH1TCiINBjmR7bNrEDhlPDoUAI7GjFHIcOiPdzMta17VnQV6G7nkcqvV01ih6u3127
	dTAnh0HQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgO7-00ErNo-1L
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:22:01 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6434e65d808so2219345b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426918; x=1687018918;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=FGv5VC8qd8ZaQHUAio11tWcVOAJTKDCLg3ky/g5iw3BFCvNjeka0E7pQM453bzoCKP
         wIxdZ5sP4PNjcALeoHIQWRy7mvKcBilJMow0FYi+Sz/KKNVPQVkWqtUNvCSlPka2E35d
         ysRCCyw5nlr/j+xavMp8+mW/BTJpm+6Dk+MrHTjWeMKfKuHWa2fPfoHdJezy5vH2Lka6
         DcvQ/QCttbC9mzeOGRrl1q0iLM2uuUgLRluzeecoD8qOkGr49tUbE0owx5FGYmUkfZXf
         htSbdS/C3MBoF6QegQH4RlgfbsSVTOsKv7As2f6/WCIW+zs9XdTfhkxPwBVxJAXHLdft
         +17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426918; x=1687018918;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=glO0D3mQ8FUbqUaW6zbvP3mypEiycNFRCToUyDnAIE9wB/1pfMiSs5Z/Nlam+9O4p+
         nM747cZQNev2G3BLA18kI/o3Aw0i+VcRx0L/wwL7fdcHCbrqqwi5uG8W24K/t6jaaMX5
         Y2VTIdHUeCFSd7tMOpAecbtYQpFtvqdnn68fr1SQ9vC4qQYBYDjUJ2IJDDosHUycq9zG
         zsZNN70MJmhfuR0J4U5IZAnBM8MR7Bqem+zzaximO8sLeZmOJ4Z32BxEU588ERp/vsdy
         wXIlbgvGB34UVvWolPUloYOKLbIp+R/7VEH5Zh0oCzZOryY22MTLA3kE41bqW3SzMIJn
         0VVA==
X-Gm-Message-State: AC+VfDzf6ubOGAdjTJe0ULBK3J6+0YAO0DSly2Wrdo3d5gI+yubr1wQV
	gOoLhQfekp1HLgj214lOYmQMyeHNE6F7Dp6KdZh7CwOXquRXxogpz0EpR2pFCNph2j5uJKRUYgf
	GK1ONlKmqioDbalimjx3NCrO2+d15zfGon5aj9BoYpmlwYR+6/OVz4/OFy8GrszwDIQ5js59dum
	x1Kfv+GucQWKPFS1k=
X-Google-Smtp-Source: ACHHUZ7DzGc8mbcm6gyG1FaCHM1UkX6ZTTMNq1vqBYdrEFA512Vhot+N0Bt1uC5VXAF+cM6Xb4Xpjw==
X-Received: by 2002:a05:6a20:7489:b0:102:3f67:dbe1 with SMTP id p9-20020a056a20748900b001023f67dbe1mr422644pzd.4.1684426917627;
        Thu, 18 May 2023 09:21:57 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:21:57 -0700 (PDT)
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v20 17/26] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Thu, 18 May 2023 16:19:40 +0000
Message-Id: <20230518161949.11203-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172159_530581_D5662647 
X-CRM114-Status: UNSURE (   9.51  )
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
