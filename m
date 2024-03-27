Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7587C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2b6vBsuDzHX+NPE1jOaG5kkUE8+7ptv9mDjfMUfR74w=; b=Lv0SxT/hImyG3R
	ixgmTcmIr/JySUddGgj8J8ZLJNUgGj+7U5MPo8GI/Xeo6087OEDvo47Zq5UIV9+QJE4XQ9bpPyap9
	I1CJySebt2xIdg/TxALO/4cTUpY9IWmgmWJpCzc7rdMSZZ9MjbF/HPHV1jWshY2C8vhgWB/9y4ItI
	O2L7znTQtr1P0xKORxkDzu7EkXrouzHwDMiOgfWS7OUknwXt/3HPMtAa7wRGPPg9MR58j1EEkGni+
	6NqSVSaLK8NeBiJzFtFdFDLCYlCGkEJAwpvbndHLLt7SKnxTHyUcfYKjTSsWC+0n8s8+r5ZIWCZtc
	xabbBUtVRjoYKv5JAXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMY2-00000007dFT-04j3;
	Wed, 27 Mar 2024 06:14:06 +0000
Received: from fhigh8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMXw-00000007dEZ-47yy
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 06:14:03 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C98CF11400EC;
	Wed, 27 Mar 2024 02:13:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 27 Mar 2024 02:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1711520037; x=1711606437; bh=L8pGfRNbp7RCkrkxlFARY
	zS97IZ7JZRhum3Xf3Y6QJk=; b=fxABGrYah/lfTugzx6Z0ngEyOKWRtWYzw2pW/
	oDhWOX9QSMk2VfcidduJHKIyV01zJ73f1uRLCql5WsrJwSSkQFWm7drJk3tIngiL
	0mfL8EuvOafXILend5O0FzOnhhFBFo/r1nIwroaV4MtTS5lGPzaUi22mPFmrOpq4
	w9ICMO9Ey00G91i2LJW2sAJOQobTVAnlbaULScXaO1XsmhfgUXf7PVtDHnLZFX0/
	SraxSI+JgiiE0ZrX1dSpCjkG8AFtmcEv+u6GbFo/uGcB+maFKO91mbirP+67xBTr
	7nYSgrRJ47+ONmUUPnQ18Tz9RcmmNjFV/F/6uVMpqrLinfFNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711520037; x=1711606437; bh=L8pGfRNbp7RCkrkxlFARYzS97IZ7
	JZRhum3Xf3Y6QJk=; b=x8VgCAB2jgsbdijfdu2/B8BeuIbsrgzrgafUkHpBWgGa
	sXNVQ8vwBNYs9It0J8tAytS2ywlAkPO2Nvzz4ke5U3x+5KZtSDyXsHaemLZPkoNB
	uETABOwVA8CUCQoeAmwMM2/TB1Sy5kO/gRS4A0IPhgeNf4+uCCgUGeC14XrLz55T
	DRRP1xbL1jcIwwO7MvTbLR+uA2wDr3sjAyzbNYTLlrEs+rufyxA64rWGx2cfhXFn
	d82QmU0htYWo2whOIF9KvS85/mtNxVjPE3ECREBK9XPhB7C5CIPxja7yQuOvbN68
	xpCLhRlkrqncv7TveFY5mWD0dlH0XUczsEkkBQF3/w==
X-ME-Sender: <xms:JbkDZkBfzVTCzSz-lWnTM4Itqz6xcaKQ3to1oXWe7GdqBHA4y7W-pg>
    <xme:JbkDZmgq-zUCZK2qa-GpsCUEwEMowO2lseSBGJdaSvIgf5jbiUbMEcwyNyOeKegVk
    ReZyI5tY9TuyK1ZEg>
X-ME-Received: <xmr:JbkDZnnWSuM6nXKX4dZ0EdL5WiLliAApS1jIiHM456CdigZQZCksd5NbMSgEOHJt6xzKvcQ8GQsm73jCJeoBSdicU2HkKYA1alh7Y_Zn2-CVRZpOwt6boISQncbqK4RcPMYqUlJADxqZP15bprHGR9e9GrJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghfrghn
    ucfqkdftvggrrhcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeeugfejveekgffhgfegvdetgfegvdekieffvefhiedugeefuedvieekieev
    heeuheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:JbkDZqxz_e3wCKes9-l1u4PG3Vx2RquD0rfWhIXZ62qBKZ-4ENtDCg>
    <xmx:JbkDZpSMqhFc16QHy-_nvwkTJ7xb_zNfQztKdUh8y5p2fj47FUaDdQ>
    <xmx:JbkDZlZvQTFE8y2OrdIlfWloQl1N1IQ0_kt5pb00JIgDPDlYobfIDQ>
    <xmx:JbkDZiQ9yWyacMXn2Q6znyG0gYQL8IUdmHdwwOm4HmQD8TtK8g1exA>
    <xmx:JbkDZqQepNRMyDqizcPVXFSTwJCPeQvf9lETa9XS9MGKbf6cZXLCAw>
Feedback-ID: i84414492:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Mar 2024 02:13:57 -0400 (EDT)
From: Stefan O'Rear <sorear@fastmail.com>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Cc: Stefan O'Rear <sorear@fastmail.com>
Subject: [PATCH] riscv: process: Fix kernel gp leakage
Date: Wed, 27 Mar 2024 02:12:58 -0400
Message-Id: <20240327061258.2370291-1-sorear@fastmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_231401_346476_75A6550F 
X-CRM114-Status: UNSURE (   9.40  )
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

childregs represents the registers which are active for the new thread
in user context. For a kernel thread, childregs->gp is never used since
the kernel gp is not touched by switch_to. For a user mode helper, the
gp value can be observed in user space after execve or possibly by other
means.

Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
Signed-off-by: Stefan O'Rear <sorear@fastmail.com>
---
 arch/riscv/kernel/process.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..51042f48da17 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -27,8 +27,6 @@
 #include <asm/vector.h>
 #include <asm/cpufeature.h>
 
-register unsigned long gp_in_global __asm__("gp");
-
 #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_STACKPROTECTOR_PER_TASK)
 #include <linux/stackprotector.h>
 unsigned long __stack_chk_guard __read_mostly;
@@ -207,7 +205,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	if (unlikely(args->fn)) {
 		/* Kernel thread */
 		memset(childregs, 0, sizeof(struct pt_regs));
-		childregs->gp = gp_in_global;
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
