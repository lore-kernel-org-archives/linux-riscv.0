Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0E1C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TB6FxQQEC+5cFnAijbyIjBOW3veR4+3OU8Yx5nzt8Ok=; b=v32gTO6CrvBDXn
	2CaJxnfNB8r/Duw+6jiEGs9sPDhmsvjx5YQAhZaajLbmnOBbDFvX8YOcZw+On9us82nNjLldwZHZc
	1e1e9LQUbS21fSSSxBeZrBwkl4PKaWywoclb4LHuP2U3l93BSQtqauexATn/1IhMwR4Snd47kxYZW
	4ZBXegwp6MLKZY5jrTealalwEsYLN/CcG670C+gSwsF5CYUhLaNhxxyljXyOA9/8uhdj52+4oXfSv
	YRsXHH4GwYDx7le7+9M/0Vu1Cf0fvrLuTdt+F7sEDhLWHNDm0I5E/Kjd5iTSGV0toPM2NFWI7Cv90
	tKLNwsZb/zssxtxrT+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq4C-00Bm0T-18;
	Mon, 27 Mar 2023 16:51:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq49-00Blvy-1b
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:51:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso9547156pjb.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935886;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/srIeqtOeL8WlVYBrDSAnb/WyWsrKaiEJtMn58iONk=;
        b=S+G5hxMa8FHZQrhqGijYCKM1PpoYhvafBo0pzksNyKA+t6YemdQur99OZV3pOYk4t9
         TQEmxHqKFD4uaUhEZfgpn01wEJKZOOxVzyYiwnSJNkoOEOAwDPHYxytOOoz01L2RTfJt
         y7RxDDofYQIkmOhKctmZm0rV+XcZGvFcGp69FwZcHwJfVVyaAlV/UnF+g0gOPQkpNK/z
         AmxjQ9jnGhLn2G2CdZT01UAJsbZ1ay+clF+ffSyNkZwtL0usANVzVNS7HXSi7oaqSPIp
         FH7BsAQ2ag+dJ1wcxgg2AS65TTDDOqER0T+Azh9QyCAjNBMRMubeMyCtA+87dF0Lq7+w
         cbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935886;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/srIeqtOeL8WlVYBrDSAnb/WyWsrKaiEJtMn58iONk=;
        b=QBtUR+jDzOhtbKIPUnuPg+9hNKqhbTCfqHi03srF11EOk/JA+EiSxrqTkZiHo447LR
         tGQ3tzwHdXZepTFZz/3unIX/JqnKANpEDBNl/6AjkHFEFv2ywKb1fjRzVX9HxgGPJbn6
         pJ4nyBETQrHIUEJCclxKcGs9L8/OwVeF+BA5ddcuv0wl+OYmLTGEDADTfSkjPYVcATya
         z6m1FAYhZA1Xk5j55IdjwQ+UtYwYjC1tOTCLF5bw2tK8aBQqJ6rsB9CEFsbfD4ZF8wbP
         j/6R7DChn4UtP55eJQTLTOyeM14I/Fse2BFfO/VuvQKTf9DM2nkbAAULzxY4PQ/GPOeg
         SFHA==
X-Gm-Message-State: AO0yUKV6NIVnUg1EAVDKyTIhaDnxfTuFrzfeCf0MnsPztYvnsLGxIxKj
	gfULNx0EyEOOdvnYf8FihMVzIW+4ZhWnraFeog0oG/MauqTZ7AGsM0BbN6V1wZLFJDfa6pqj7JF
	fFWBZWFnT4OkWrUIAM0qvYoiNAhr27wCB3kw3v2AAO00W1eQx0s6hVJilpPC7alpki0B9MxNToS
	bkJsVlB5rCU5Yu
X-Google-Smtp-Source: AK7set8rHNPlr4/8uNjyfhGHjyZcDtmPKfd69HF5oEKXIuGh5URqxNlGnm/bBodnJdQD3PzNYK1FZg==
X-Received: by 2002:a05:6a20:b806:b0:cc:f7ad:eb79 with SMTP id fi6-20020a056a20b80600b000ccf7adeb79mr10767038pzb.52.1679935886062;
        Mon, 27 Mar 2023 09:51:26 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:51:25 -0700 (PDT)
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v17 16/20] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Mon, 27 Mar 2023 16:49:36 +0000
Message-Id: <20230327164941.20491-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095129_556075_7A53B93E 
X-CRM114-Status: UNSURE (   9.34  )
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
