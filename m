Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752DCC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W40tXwBb/IHTOhUfEvR1aMXU7QRaUyhQIV3Viue5JM=; b=K2RXsSVj0n5pWd
	vdG0hmjEBROWlDCIcSCwArgyQ6ZSUXUzD7uCl8surQjFpgxXbPTfJFFK1k9yOMvbUaq2N5ceJaLnI
	OXSisjwmbFAS0ltskqNVthA13T3RpZ81O6+4cNy3+4EwA010hmXD7M88Quan5rnxORmyBgsVsOETJ
	akO1rPFNAil+BJJYNNrQzTXUwJK3E0IhoQ2n0V5Lm+mgqVvi4tC+5LTZIbpzjeZ+IpInfMHFMO3p9
	8LiKUEbZYzCEf3SVPS0SPNtB/3IrC+lRTD/pvOJo36U48w5LO2uoz22IXpwtWU6jNCmBWMT/skvSR
	CVTrWrDuRl49l/DaIOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DKa-00GB9A-2i;
	Mon, 05 Jun 2023 16:45:20 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKo-00Fzei-1y
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:41:31 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b18474cbb6so27808505ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979688; x=1688571688;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=Esj/ZZTYqJr+m/47wLqn93yxPwilBSQY9DZqScr26rPWrlszyo6YSz16bTtNt8IDQK
         rX0CxTg9bK3R9Qk/VuehmCC5zVee+eLUGkAJF61FKYOnytHvt3SBeemp0CRwVmQK1oQ3
         b9bOhGGn4/41IMJdyrtSQoos5VRkZAQwaRQzBwI5zb/8G1IsDyElvhyqDzw4NtQwMwe6
         aNK3SFueWP1QPs0Fvtk0FJ2lpqeYHk0TkPRGofeGAJw8pPaP4dCx20Yq3dqc3GLBpoK2
         qAkLvljs3175yB6x8x3erHnn3v++fOizgwIEyWSLWgPk4l3lRZthOAl2VhPpxA+z4daQ
         IeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979688; x=1688571688;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=dy3+Hd8iPdTVXjUagUq7kD8rruvEgzlSpKPcsK2CUTRHGcXtRwzAuMQCMnlHRr7PJt
         MSXJFB0/B9XdX2qCS2fhLuISEquXjSVYzLXGc/QI/GsjRcMhmYQeaM+7PG6jX01YlgKW
         EMIi92Cdn5c7BbFQbgIBo1jwhAgH072ShZekJYaVqUPmGzJ0dqCjhf5cUjHppB0zU7wY
         Vi3qZGQF54TIsfwJbxPJWKI/ejATf0Fnh87otw4ZztzJVoEqM663unfFIaAigYPqdCFu
         C997TZA/wjXP+83f+GQwcIljPqqewJ0otMriKVD49FdDg+qCSzzXtP0ls2ondTVzQujg
         UBIg==
X-Gm-Message-State: AC+VfDx69ru4XX1hLa3zo9takcvMRNocYqjxsKcH39R9W2rkb/QmP8JG
	lPztzG8kQ2kCagG6jADXdWOTYajFBPbqajcrL0cmCL9S2cBGe3GyvDig1P86MdqOMxwtGrIa3sn
	rX+2tq9JhCcGam22Nnk8h9VDeOD/oD3fXw19ATbVs0V9Ju1rNo8QIM8zobwOlxebH0oahOBX+Jp
	sAhabGp4NB1fxceM4=
X-Google-Smtp-Source: ACHHUZ6N216FXg2e2/kWGqQVnVobdh9PysHIotin+oygwyrc5QZdbmX55BlhvwNZar0WBJIE4THX9w==
X-Received: by 2002:a17:902:e742:b0:1b2:2305:17a0 with SMTP id p2-20020a170902e74200b001b2230517a0mr1113845plf.32.1685979688000;
        Mon, 05 Jun 2023 08:41:28 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:41:27 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v21 17/27] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Mon,  5 Jun 2023 11:07:14 +0000
Message-Id: <20230605110724.21391-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084130_671863_3CFCE4CB 
X-CRM114-Status: UNSURE (   9.47  )
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
