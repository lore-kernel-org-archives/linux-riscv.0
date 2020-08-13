Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD52C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 03:40:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C461C204FD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 03:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQlfEpeV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C461C204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ga2MGQoDclb5HUr7VdmYrq4FYeOuiY9P0E8jSHC3Ec8=; b=IQlfEpeVFMcvpypmi+POQoLDxE
	mUPQbJGpn/vY0qeUVDs+YoBdQNIkuFq3D8BH6NXHL4Yl7xXH/0GEK8L+rz+kj6awtoOw/0VvXdf6t
	QJuHKd1HZE73uL8xlND0/ItTGphd2qJa9Cybw5V/nrGfB+zcl4QMDzziTmOcT5p1wwrxdWP5m0oRi
	6ojzeO8cQiIT9zFZYJWaSqP0tlnI8ggg5HNTcax7vjiyL9sICGzbBWOUiQRt3g+Vdo8CoE8NDWcqR
	NOnv0vL6lA2ztB2uTEjyR2xWwKjNB8wb5L9Fa7hUH/wPNXDbsz/TzNwOEAa2DQ8F+TZI5MIzrzZ4w
	FwRzFOKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k646R-0001hX-5f; Thu, 13 Aug 2020 03:40:31 +0000
Received: from lonlinode-sdnproxy-1.icoremail.net ([139.162.193.133])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k646O-0001fr-BD
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 03:40:29 +0000
Received: from localhost.localdomain (unknown [175.0.107.229])
 by c1app11 (Coremail) with SMTP id CwINCgBHjHwUtjRffJ0gAw--.51036S2;
 Thu, 13 Aug 2020 11:40:06 +0800 (CST)
From: Qiu Wenbo <qiuwenbo@phytium.com.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: Setup exception vector for nommu platform
Date: Thu, 13 Aug 2020 11:38:04 +0800
Message-Id: <20200813033807.19556-1-qiuwenbo@phytium.com.cn>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CM-TRANSID: CwINCgBHjHwUtjRffJ0gAw--.51036S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww15XFWDKr13CF17GrWrGrg_yoW8Aw1rp3
 y7Cw1YyrW8Ka1xZr9xtwnY9rW3ArZ7Gw13Gr4kJayrGr95Kr98Xrn2q3srXFWUWF4Syr48
 Zw4IvryF9w1UA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JU-miiUUUUU=
X-Originating-IP: [175.0.107.229]
X-CM-SenderInfo: 5tlx4vhqerq15k1wx33pof0zgofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_234028_571839_1189F4B8 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@phytium.com.cn>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Atish Patra <atishp@atishpatra.org>,
 Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Exception vector is missing on nommu platform and that is an issue.
This patch is tested in Sipeed Maix Bit Dev Board.

Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
Suggested-by: Anup Patel <anup@brainfault.org>
Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
---
 arch/riscv/kernel/head.S | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index d0c5c316e9bb..0a4e81b8dc79 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -77,16 +77,10 @@ relocate:
 	csrw CSR_SATP, a0
 .align 2
 1:
-	/* Set trap vector to exception handler */
-	la a0, handle_exception
+	/* Set trap vector to spin forever to help debug */
+	la a0, .Lsecondary_park
 	csrw CSR_TVEC, a0
 
-	/*
-	 * Set sup0 scratch register to 0, indicating to exception vector that
-	 * we are presently executing in kernel.
-	 */
-	csrw CSR_SCRATCH, zero
-
 	/* Reload the global pointer */
 .option push
 .option norelax
@@ -144,9 +138,23 @@ secondary_start_common:
 	la a0, swapper_pg_dir
 	call relocate
 #endif
+	call setup_trap_vector
 	tail smp_callin
 #endif /* CONFIG_SMP */
 
+.align 2
+setup_trap_vector:
+	/* Set trap vector to exception handler */
+	la a0, handle_exception
+	csrw CSR_TVEC, a0
+
+	/*
+	 * Set sup0 scratch register to 0, indicating to exception vector that
+	 * we are presently executing in kernel.
+	 */
+	csrw CSR_SCRATCH, zero
+	ret
+
 .Lsecondary_park:
 	/* We lack SMP support or have too many harts, so park this hart */
 	wfi
@@ -240,6 +248,7 @@ clear_bss_done:
 	call relocate
 #endif /* CONFIG_MMU */
 
+	call setup_trap_vector
 	/* Restore C environment */
 	la tp, init_task
 	sw zero, TASK_TI_CPU(tp)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
