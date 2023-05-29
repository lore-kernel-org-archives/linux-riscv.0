Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE5C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vBvUqExlU8e2UvxJpvBJTjAs5fbYVyjHVqRyvmrfd50=; b=X2O9i1NyzLWtBK
	kyqO8gogtb/6tWnBkNoJYJDxSTA+zGmJ38bqsG0NbmbMf4dJMUgr+rYQAoqIDz+f3mD0RR4lYmdrc
	hcHv2Vyda03imWXhSCbtfDsgMB43MOyM8NZ4hCbhtunmR5sReCEY3jiMPd4PRNYodq7HyWKMAfw+Q
	BoN90Wuo2WZ27K4uiC2vTIz9lKojhlugv4bMK56S+Q4qghKUYxPvPxJ78sn4B30Ybh3+2HFAHYALf
	8mhV1kINf78WyTs/qeY4OBOnGXA8qcXBDB+m0AHbZBYiyvKtpeDLdCimCFV7ohxkJ8DnMd2f3ydoS
	uHfossi0KG0cM9KHmp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3XT5-009Yv0-0g;
	Mon, 29 May 2023 07:39:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3XT2-009Ytf-0v
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 07:39:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC0B7611DA;
	Mon, 29 May 2023 07:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C88EC433EF;
	Mon, 29 May 2023 07:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685345936;
	bh=2L03bJl1JvE9E9WzzUYTOxEyFHRi8LoxGv46OCU6JGg=;
	h=From:To:Cc:Subject:Date:From;
	b=SKYzK0tcInU/JLYLpz78c3bJNrLK2QLdpzE+WFK9GHt1celhAZScPSLWIFJVgwd1l
	 G9+lOlTghfGaZT9Id0/EC+rUy0XsObm+b/treJk76pes14RNSoQ1QHNYGLIObb8tOd
	 tzQi73cnRHq7djsnYoFzd8ZhhJzW2vBhRbPSfsOQ/GUi3qUQkIoowRTQ8KRTnb5SJF
	 2aRxLsq6sMdOXqE73RvLxDw5RK6IOPaQpwooCc0DkKNMxmVFTR+eAgCjQXU4JnndzG
	 Enve7ntYb4wC6V9aTc0mEtx/9ach7AynwYFY9p/K3i/yMFTt9jm6Izlhc6Xvqk2IK1
	 7PsX/IvKAvMXQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: vector: Fixup modules compile error
Date: Mon, 29 May 2023 03:38:45 -0400
Message-Id: <20230529073845.2859178-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_003900_377379_D8CB30E6 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Some .ko also need the riscv_v_user_allowed symbol.

ERROR: modpost: "riscv_v_user_allowed" [arch/riscv/kvm/kvm.ko]
undefined!
make[3]: ***
[/home/guoren/source/kernel/linux/scripts/Makefile.modpost:136:
Module.symvers] Error 1

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/vector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 1c4ac821e008..3ae08816d608 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -129,6 +129,7 @@ bool riscv_v_user_allowed(void)
 {
 	return riscv_v_get_cur_ctrl(current) == PR_RISCV_V_VSTATE_CTRL_ON;
 }
+EXPORT_SYMBOL(riscv_v_user_allowed);
 
 bool riscv_v_first_use_handler(struct pt_regs *regs)
 {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
