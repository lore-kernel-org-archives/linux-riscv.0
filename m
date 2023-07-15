Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062A5C001DE
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+sCJBWEzBtXND/M3Xz2a2JA9cZqc/v1ZKqPFmdzhrk=; b=4IpoFREPtGspVr
	awhV6omWLqxO3KkkoFkltpvWKRalj+BGG4eUk/W/xtniFE61gLWtsVHMQOXOJnP4cP4m0/Ift28Nl
	W+VyRRGdsNebqHxTJm2EwUW+gg1FeoKhn7vzAgP13DDVUmMOa3XXO/MVzhOKMOTQqBuaZrd8i2KU+
	aKFxewGgzJF80YgyRIwjwIegeVuhRw9DML0iAhQSsG32s7XzYuxgYfIkGsYP2nPA+DkB4iEs6C6si
	H71m1USl2/tFkGf+MKqRnoz0a6tSDEJ5INttBeP2K2f41JVLN11Km17rhpasa5fsArBcpxH5cVzm7
	KvBHTHZVu/yvj7KpU7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKfb8-008s6y-2c;
	Sat, 15 Jul 2023 13:46:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKfb6-008s5b-0V
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 13:46:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26E1460B92;
	Sat, 15 Jul 2023 13:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599C9C433C8;
	Sat, 15 Jul 2023 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689428766;
	bh=5Cj0j9UWyUaETtgL5LyQbqXPc4UA8/eObpiQ76X05+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fm0oc6lWCT5MelpphlfjhdZRrCN5+d4LlZp1oQisAglJQ/GOzE3y3raTn0CObGvUv
	 PM3P+w8GGiGg+RJjCdzEOAaeIdBFTgVBt0Q2lZHq4PRBZcujhOrs1Kviq+oj28H0Bm
	 9V3uKgTVL4HLQCzsw+gqYCrWuzcGBZkDwiFDT/KzBQ/xF+v8KHgY5kPA0IRqmsY2r0
	 VSzTS9t3ov/D1UxzyinJKA0sXCkzilbu78Y1f8Jzsu+9LEvwblOHzIOh/n59pkZkv0
	 EpvGrThNK/ZRus8wqr5XBY+XfSm6vH87T90iWmP6wYi28RFqP6UUmpGc7RNxaqN53D
	 LMYS+cM6p6hUQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	falcon@tinylab.org,
	bjorn@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/2] riscv: stack: Fixup independent softirq stack for CONFIG_FRAME_POINTER=n
Date: Sat, 15 Jul 2023 09:45:52 -0400
Message-Id: <20230715134552.3437933-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230715134552.3437933-1-guoren@kernel.org>
References: <20230715134552.3437933-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_064608_242459_02543135 
X-CRM114-Status: GOOD (  10.55  )
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

The independent softirq stack uses s0 to save & restore sp, but s0 would
be corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber list
to fix the problem.

Fixes: dd69d07a5a6c ("riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK")
Reported-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index d0577cc6a081..0b58720109db 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -83,7 +83,7 @@ void do_softirq_own_stack(void)
 		:
 		: [sp] "r" (sp)
 		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
+		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "s0",
 		  "memory");
 	} else
 #endif
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
