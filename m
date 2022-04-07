Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA493C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71lRKSoHUJwM9174ebI2tiTKF8oFBbmDjSIPXIg2wRU=; b=4sqdhethFlnFJE
	XJq/W0vYigJAiDu/jnB8qpad/2QeFV2QigNkbzX6EEWG9Ow+WAn7vDPl+Ln21deX7vcsHfoax2RWq
	iRWBEt+epNGVTvHSPpZUImdnd09ZkTwDkIufXsV5ft31L/6liGwvyp+fIvvkYjfJEimI85UJIbQsq
	rp12pp9g2srEZYe6Vat+lama0O/PoHsdp4MFeYJajOVNMebQtdGYVMnfnA1uRTHPRzdXUkqZ7hNl/
	mxgtNKwUDM91jXTr84LSBI0XZ3ebIniG216texK21ZwPCmv+0iCpZ9dxkZ/ImpkbHsq1TqRdjIPU9
	PS8pYMcOU9JYA7qX67wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMf5-00A0Tp-N1; Thu, 07 Apr 2022 07:34:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMeV-00A0Er-Re; Thu, 07 Apr 2022 07:34:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B62561BE7;
 Thu,  7 Apr 2022 07:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CB7C385A4;
 Thu,  7 Apr 2022 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649316838;
 bh=4wIhTQJZp3+FhQY+sjwWCoJ1fY2jda3dTtRoplMPuzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qT2zXYE3CQHTLuX5QZZPQHikYbHh7VPe0bAHwwvmUvmMUnWQIyfU+k7F3AfDIvyRi
 DbQJ6qiQIryUX2TPGaCeCLRIsJKYDUtVi2eW9wk/oS4lUJw8TeMVaDawYhr+g7X8U3
 BD/tIW0R3G5pA+cnnSBuTCL9yC6b2NqcdjvEtbeyIEFds6kbkFoaEJ60l1CqnYGp5C
 wuxNx22nM3sMr0zTrDhJ0Z36oEmgAqj8rk2NkpqWkUNRDlvhwyx3zToIQurA2FvotF
 fTUpZW/MoL2A1cwRv4njUeB8q1emqKBkULf3pSwP3zJi7/NivB+2LX/3X/WfQDDEH9
 88qBx7bdrkZLg==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, stable@vger.kernel.org
Subject: [PATCH V4 1/4] arm64: patch_text: Fixup last cpu should be master
Date: Thu,  7 Apr 2022 15:33:20 +0800
Message-Id: <20220407073323.743224-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407073323.743224-1-guoren@kernel.org>
References: <20220407073323.743224-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_003359_975629_39139766 
X-CRM114-Status: GOOD (  14.76  )
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

These patch_text implementations are using stop_machine_cpuslocked
infrastructure with atomic cpu_count. The original idea: When the
master CPU patch_text, the others should wait for it. But current
implementation is using the first CPU as master, which couldn't
guarantee the remaining CPUs are waiting. This patch changes the
last CPU as the master to solve the potential risk.

Fixes: ae16480785de ("arm64: introduce interfaces to hotpatch kernel and module code")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: <stable@vger.kernel.org>
---
 arch/arm64/kernel/patching.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 771f543464e0..33e0fabc0b79 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -117,8 +117,8 @@ static int __kprobes aarch64_insn_patch_text_cb(void *arg)
 	int i, ret = 0;
 	struct aarch64_insn_patch *pp = arg;
 
-	/* The first CPU becomes master */
-	if (atomic_inc_return(&pp->cpu_count) == 1) {
+	/* The last CPU becomes master */
+	if (atomic_inc_return(&pp->cpu_count) == num_online_cpus()) {
 		for (i = 0; ret == 0 && i < pp->insn_cnt; i++)
 			ret = aarch64_insn_patch_text_nosync(pp->text_addrs[i],
 							     pp->new_insns[i]);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
