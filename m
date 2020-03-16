Return-Path: <SRS0=PPu9=5B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6F9C10F29
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2020 02:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2578206BE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2020 02:42:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UnbE5sUO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uF0AIuLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2578206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwjvTXn0n0ZE4x/2Ph/YJi07u/EMuStr4s2jUtRCUbQ=; b=UnbE5sUO4vZQ34
	wKbprhCqh7Lg7JFd4FqrP8nvS/EAjgbMy8Nmfe/keRRz4EewNkrijCvkeAu6wgOwsw/ktIgiZt9Fo
	mKQuqoPCAHRZDDfAUP92/v3+G9tynwzffeoAhn/pzfFalWJ1a8NxkKFBLkKpk+E8ab8s55g4hraUp
	3wi3AIORpNmejy/ni0y/rqTKIvxcotmqesvXyZMutMyaTHqp93cAuckYVIria/6CiCfvk1G5cu+B5
	LCvjWI4rOHm+tHLpKTnCFNdQKUcXTdvAGvD4gzj2S2c/yWgvZ2eRsQr1V+ZMbQ5Zct5tikZxUAVzm
	tS6ePNPRa4PxSmbuDwvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDfhc-0004DF-4L; Mon, 16 Mar 2020 02:42:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDfaV-00039p-AM
 for linux-riscv@lists.infradead.org; Mon, 16 Mar 2020 02:34:44 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34A082073C;
 Mon, 16 Mar 2020 02:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326082;
 bh=7oo6LZ5BRUCyl3femyA+j4OKOF1/fABSYqHgCYpP7nI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uF0AIuLZ/GORviA/2v+Avj/Iseh9eyElHYL1r/cWR7EljHTg2441nLoPOW1ZWneDl
 7rj2m0l2Z1HnlQmdj6Zl8lq0QXdbpxiA8j9Z8pdLnxd00NeMIpAsYNBkWyMjqekPAI
 o5vaHYx3LF3s8oPvH6/9RIHxWcg2BJFqYk3ckD3A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 27/35] riscv: Force flat memory model with no-mmu
Date: Sun, 15 Mar 2020 22:34:03 -0400
Message-Id: <20200316023411.1263-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023411.1263-1-sashal@kernel.org>
References: <20200316023411.1263-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_193443_483198_29A485AE 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Damien Le Moal <damien.lemoal@wdc.com>

[ Upstream commit aa2734202acc506d09c8e641db4da161f902df27 ]

Compilation errors trigger if ARCH_SPARSEMEM_ENABLE is enabled for
a nommu kernel. Since the sparsemem model does not make sense anyway
for the nommu case, do not allow selecting this option to always use
the flatmem model.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ade9699aa0dd6..a0fa4be94a68e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -101,6 +101,7 @@ config ARCH_FLATMEM_ENABLE
 
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
+	depends on MMU
 	select SPARSEMEM_VMEMMAP_ENABLE
 
 config ARCH_SELECT_MEMORY_MODEL
-- 
2.20.1


