Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D661B606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YrbLrqBY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eBQUs/9s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=21hmNDie+i6zL1M72ZEQrnJ10TJ5iQ/qwKpw4362lEE=; b=YrbLrqBYISsP0m8rsyZ9oa1h0+
	2ho1MVZHwLMCcDyoQsUQJnqtiO3iXQE5TYaL9EL5np1CvVqlbwSHH9+uMf+Dqx7MBPHhLVwMyKdHi
	+Ne3/Ctc2mioxOLkNxnSahHIVpNZyZTcbX7sEg1g941mLO+yDrcfefkUSWByQAVVCAAIbJ5dttfiT
	yxVtKKOP52EaCM9GiKhQryKZmNmW3/B1WGdGEHRfXS0NS/XqdyDHycVEiPo8zFtpfDBRUjlEicB9N
	Amo1g1yfD5KDDBxIsLKPwc5YIaljecFs5pbrVU9hyfBnPvYIgTMH3KZcZZEWkI9Gexp62CXLLjimk
	MA0TaBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh9l-0000000Enkm-3Xxg;
	Sat, 07 Nov 2026 14:12:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh9k-0000000Enkg-1Yw8
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 14:12:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0795243A41;
	Sat,  7 Nov 2026 14:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9282E1F008A1;
	Sat,  7 Nov 2026 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060751;
	bh=IyxiWgY/OresKPmRcZQ5FzYMHN44S+1AZllFk55N12c=;
	h=From:To:Cc:Subject:Date;
	b=eBQUs/9ssxB8volhnNWXcZzALvhPxvdslLhJjU5/UbRe05DZ2jGyoeY2p33unU7yV
	 7uf25YzrTOL7e2slPIV2Uy9rOdk/fTVqq6txBYq0CxPm9ZZ7k+KOh9pW/k8lpnG8Pm
	 phV+LvG1+aO3qc55Oe/X/aerRPPOquPPXI0Pvsw0f2suh+Z1rPMxAbqfViIZpb7A8B
	 qGGD3qf0nVqlg7YDJDmEACu4b3Ukuu8WXyVVJ7FxKgeGjsUFo5NYzDDajhA4DzAMn7
	 6O8iUno0y1cG0Ux1AVGzlO6gVpcNcNf83tMvwsPdok9XOGU884ZZS5jzVZFJyOvsJM
	 uZzz0gbnKfUgQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] riscv: make thread_info smaller for RV64
Date: Sat,  7 Nov 2026 21:52:21 +0800
Message-ID: <20261107135221.17904-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On RV64 platforms, the thread_info structure is non-necessary bigger
due to padding. Move the "cpu" member to "preempt_count" to remove
the padding.

when !SHADOW_CALL_STACK and !RISCV_USER_CFI
Before the patch, sizeof(struct thread_info) == 72
After the patch, sizeof(struct thread_info) == 64

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9ec..9f358c3ddeb0 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -53,6 +53,7 @@
 struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	int                     preempt_count;  /* 0=>preemptible, <0=>BUG */
+	int			cpu;
 	/*
 	 * These stack pointers are overwritten on every system call or
 	 * exception.  SP is also saved to the stack it can be recovered when
@@ -60,7 +61,6 @@ struct thread_info {
 	 */
 	long			kernel_sp;	/* Kernel stack pointer */
 	long			user_sp;	/* User stack pointer */
-	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
