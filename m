Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A1C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdXZ5+zte1XpAiQJQMa52XSjn0CEX4m8cL1wov7+8og=; b=j5HgaaiGhOyeiH
	pGtryH9jDmRTx89Ae/8od9wU9tRXUmVzqbj9fwknYO+dGCisMvv7vVvVEL56jOZLCwSdBimzWj0fx
	KDY/Ik6c/ZfnINygJvhzHQ9w4mNMQll3/ZeY8k6UHUvHHiFnMAOWwENmO+51QRoQHDSRIYm8gPXDq
	mDrDCyNY35nXIR6t03soZfh0Hj0pxbmu2vUM6b0RJabVDX5lRLG3jbqYEpg7V4Bjw6SCooHWJhQTo
	8VvMnGS8VJHJV1zUoMHpKjQmSoldj+fCE8MNOT1qhFqIrMo0USFtSU0zIhKMhBJ9mdRiE6Sbf79mN
	l/Mp/KSpaBd7GHnaG1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgN0-00DR7b-12;
	Thu, 18 May 2023 16:20:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMx-00DR52-37
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:20:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d293746e0so429838b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426844; x=1687018844;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FRXZE7cUr4vJpRYfnGIy+KdEpJQsKyQubDyjJds5WmA=;
        b=K0sq07ep0xgW47SiAQZ3mrkYd3ihUXW1o5X2dmqk+KHaUmfcKz7iDdZbdlGDrN2YTp
         5DeGUsMaYYBoNo7OPUrnB1o1Aduw2SsRWM4a4jUKNvE7hnIYIdFSEZfMIqChaZplAtkn
         VaGio+9asUumTMS4/QJbogfBlyh/ynUvshblsUweW1qZ1wrYI97TOIuwXgaQlBlO97Mt
         ZdnsUeMXWkIpdDHxMNdj1cUTf4lmv6Tgd8b0dMHDDbJe7XKCfQb5bLiyeQuJ8lfutKH6
         uVJWnniozsnYEgHJhkcF8L0OIw9sYYEN63jl+nKGMnkPaVbrz/a/jQbWk+w8RRlPxY7D
         jZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426844; x=1687018844;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRXZE7cUr4vJpRYfnGIy+KdEpJQsKyQubDyjJds5WmA=;
        b=ZuGanQiRRdbqkYhRqeHMsygVn7jRT+HGUySmZh9Y/KlOC7L5mzYm/w5zy0OWcVv2uX
         7a/vM7jX13+UKV6aWuNGZjHRX89bSjWoq5T7VTT8N0eQ/QnCx98dq0GIVO3dtq6HOjIN
         2FUqkZ+yanxlPRmYXe14aEDZIQS9ugbsMXyIxduHxlXJrRNWE5+IhlvAd70uCz1uZpfM
         BqeuljoR8PpVc3TxesC/UzY6mTX0J4jCbSmWU3Joc/LRQcApDSsndq3HxexBU6MrH32q
         I8pYgAiNUf4Za89YJLwCqlOhvJFZlqyMmujI2sCkfoRH01UDCNOxxjmo6y1hiBM79JUx
         JT5A==
X-Gm-Message-State: AC+VfDzmZbmIfqikuB33DCIqg/41Flu814VtxlxvESPOn1jyb/qnDR3n
	eZ+z2EvRfg/PEvNGjEi+N23RGyCtgPwgTLOaJfojUH/tzAxqZUKCjMu+8ImZLWDfWdtYfJRMiA1
	q9a2xXPxfNv89WxK6ppOlvlVJgwdITB9exPwOMWWsyPvlOhGK3aaoF9qA0XltNoy/JOopg1Xwh3
	JZVJiXfcVnG4Owe90=
X-Google-Smtp-Source: ACHHUZ5FXgh1BaQAiszAq3zIK5JJX/Mc9ezgyx9aawTK/ZyCwI2FrNTtaURsYq3P2rJD9AlJKANUsw==
X-Received: by 2002:a05:6a20:4321:b0:104:3c82:38c0 with SMTP id h33-20020a056a20432100b001043c8238c0mr206284pzk.41.1684426844233;
        Thu, 18 May 2023 09:20:44 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:43 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH -next v20 06/26] riscv: Disable Vector Instructions for kernel itself
Date: Thu, 18 May 2023 16:19:29 +0000
Message-Id: <20230518161949.11203-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092048_008215_15734F38 
X-CRM114-Status: GOOD (  11.79  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Disable vector instructions execution for kernel mode at its entrances.
This helps find illegal uses of vector in the kernel space, which is
similar to the fpu.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changelog V19:
 - Add description in commit msg (Heiko's suggestion on v17)
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3fbb100bc9e4..e9ae284a55c1 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -48,10 +48,10 @@ _save_context:
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU to detect illegal usage of floating point in kernel
-	 * space.
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS
+	li t0, SR_SUM | SR_FS_VS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3fd6a4bd9c3e..e16bb2185d55 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -140,10 +140,10 @@ secondary_start_sbi:
 	.option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 	/* Set trap vector to spin forever to help debug */
@@ -234,10 +234,10 @@ pmp_done:
 .option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 #ifdef CONFIG_RISCV_BOOT_SPINWAIT
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
