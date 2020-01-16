Return-Path: <SRS0=0i+E=3F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18035C33CB1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2020 14:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF5172176D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2020 14:31:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J/X6tOLl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qjn8wqBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF5172176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVB9wp0UsR/hToLLxaFe0nIAOjgq0lqH4GB7GYZ4uas=; b=J/X6tOLl98heNF
	Jv53rWmFenFs+uaPyn8zkE+/2rmZc6NQJMq4oQB/sjYgCVzPRjRYTMCU1tl1PFs4HgZTEFbbOE/6K
	pGQNVk3mKXyPh2oDW2aLrCIQ2Gg2ZXGjhrvHg6F5zLaDDNlCsDwLQe01iCnsQ4P3/KvGcBQwpmYv2
	7R5B+4wcKNvzSFfX+/0+pLTNhmFi956qgRxOjFxXKm6Yt3ZSxQoTUbOTQKbNXQPakfIcw0KOsdAdI
	CrPvvLHVOxVgTRM3oDa5hi5DvWZIo5kvgmrSFlLT2jFTSU0vDvoGhfCjzHPp83NXJlKc4CB8GOXUk
	AwXEpTaIuzrLzePksHbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is6Aw-000480-VF; Thu, 16 Jan 2020 14:31:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is6As-00045n-L0
 for linux-riscv@lists.infradead.org; Thu, 16 Jan 2020 14:31:09 +0000
Received: from localhost.localdomain (unknown [223.93.147.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4158F214AF;
 Thu, 16 Jan 2020 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579185066;
 bh=RjL5HdLG7civsy73fTv4k4f+R0TSQwtrPFMWF4g32q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qjn8wqBWj2L6b2sJheZhnC5CIgvBnl8BKi3UBDtiDWXt1ZfPJq/gsR7DeCyZ41tZ1
 qEqyZ5PuGI/IESC/3866525qRDmmGtmlCHjc8WaEs66TO48o3kqgACx93evEYrRcOG
 o4UhLhz0YM/1cx77nxX25GSN3PoAOgYyidbM0oMA=
From: guoren@kernel.org
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 Anup.Patel@wdc.com, vincent.chen@sifive.com, zong.li@sifive.com,
 greentime.hu@sifive.com, bmeng.cn@gmail.com, atish.patra@wdc.com,
 schwab@linux-m68k.org
Subject: [PATCH V2 2/4] riscv: Rename __switch_to_aux -> fpu
Date: Thu, 16 Jan 2020 22:30:27 +0800
Message-Id: <20200116143029.31441-2-guoren@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200116143029.31441-1-guoren@kernel.org>
References: <20200116143029.31441-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_063106_711180_E06A9B54 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

The name of __switch_to_aux is not clear and rename it with the
determine function: __switch_to_fpu. Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Anup Patel <Anup.Patel@wdc.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 407bcc96a710..b9234e7178d0 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -44,7 +44,7 @@ static inline void fstate_restore(struct task_struct *task,
 	}
 }
 
-static inline void __switch_to_aux(struct task_struct *prev,
+static inline void __switch_to_fpu(struct task_struct *prev,
 				   struct task_struct *next)
 {
 	struct pt_regs *regs;
@@ -60,7 +60,7 @@ extern bool has_fpu;
 #define has_fpu false
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -71,7 +71,7 @@ do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
 	if (has_fpu)					\
-		__switch_to_aux(__prev, __next);	\
+		__switch_to_fpu(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
-- 
2.17.0


