Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5194C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 03:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TTpkFMgmqOvHE0stI2ElHicTmXI9O83Bvjd61xBu2Q=; b=HOL+5aAy5rXMYb
	ADEAZbH8DZSmz65uZcpAUGSIN0sXaQ27fWLgfUuln/ex5/lEoGaSM6r8k6SGOKPO1aOlDvDSu6T+0
	mGKNsAUFNWI45b4rCswfPslkS3qW/AIBjy0Vj6bFdnCXCOt6v3zHHm8izNLktYtlgszDOx5Tv8v9j
	jFuzEoKsiS3OwIXZOD0/aDJ1VF1iBppeM0UniUfSgKYsWh9xFqfH0rZLDCg/7RBbzI2btc8atsmMq
	LbRe6hEY8CBFW+P8DfVRwJyRfBCyUT7yf7uCuQP6/C6ZZ9yX+YjStejS40z6KEieFjQc3aumz7VvV
	GELIcdtHz6YTE8eOp1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0E0K-00Cf6j-3z; Wed, 30 Nov 2022 03:43:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0E0G-00Cf2B-HB
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 03:43:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33E43B819FE;
	Wed, 30 Nov 2022 03:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAC2C433C1;
	Wed, 30 Nov 2022 03:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669779797;
	bh=ePRIEbfh2FK+8Vi6mmFkfLNcMAL4qY01TOTMEoLzQek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWMFpLYXnx2IohBBvc5QAK5YgeSWA4QvUTMcQTt/gPgbK8n3EQH7a1s8rqIbT4kcw
	 v52HGV7m8qzj3DfuUxPcpx65YY1Jlw9MSPNC2SVthzzW5b+9P3ywmskQ8mMZM0waQy
	 15s0h6r2W0DaSOWjgLmEMrdWyiyaCmofHrADEc76stfoRB2AdRwexdtqCMsirzUS66
	 AAy/8sjoGIojNo4IH8pOtMsIqVptlLIcU8ElhXt3c0AFsrMGWoUnGWCKEx55DztWD6
	 7LzrghyWvuoZyXtebcglfaI6SkGh2mLPKMig1zQOQLuQVrivvp2bKDQR3fzskiO9o0
	 7ci447DL0T2wg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V9 10/14] riscv: Typo fixup for addi -> andi in comment
Date: Tue, 29 Nov 2022 22:40:55 -0500
Message-Id: <20221130034059.826599-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221130034059.826599-1-guoren@kernel.org>
References: <20221130034059.826599-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_194320_732331_7B84D79A 
X-CRM114-Status: GOOD (  11.23  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Correct typo for addi -> andi in comment, although the immediate[11:0]
are the same.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9864e784d6a6..03655577e26f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -138,7 +138,7 @@ ENTRY(ret_from_exception)
 	REG_L s0, PT_STATUS(sp)
 
 #ifdef CONFIG_RISCV_M_MODE
-	/* the MPP value is too large to be used as an immediate arg for addi */
+	/* the MPP value is too large to be used as an immediate arg for andi */
 	li t0, SR_MPP
 	and s0, s0, t0
 #else
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
