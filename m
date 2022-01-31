Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBDFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMZ7h36MW8g1vGWTGHnTiMqW+WafteAn9Y7IseOGuw8=; b=lN+9nznDntT9nW
	7G/uDxugZwpUH7ZzePoP0MXGM+TqTB4BT4lXIL9bfuUVJ9i1J5HroCzKDLaYx0O1+YCgPLmURExdj
	1S69YsNgvQARyKCujxBfy118OiwhX6azDkDfjp1Ekaa+mh5v6R0GUB2tTEVfmmYMqfy3RZ9hoUrC2
	5U1g1w62Fc3KBs2DPyXkoI29caHYXncjca0bAeDU9J9wPmvVITDg11aJ4h/Ls8bvC/3chtiEYuI0h
	oBQws+drkSZRus7CVx16bQlJRl6CV/U8l3Dq6Yi78oOLFEqO7urrGc98ytUGJNCKmW1amIJfmSEmJ
	OgEly7qrMqZ3PxveIdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWhZ-009TpH-BT; Mon, 31 Jan 2022 13:26:37 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWhW-009TnR-Ev
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:26:36 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:58b3:216b:d287:833])
 by albert.telenet-ops.be with bizsmtp
 id pRSU2600d2lsq0X06RSVqN; Mon, 31 Jan 2022 14:26:29 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nEWhQ-00CaW9-NV; Mon, 31 Jan 2022 14:26:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nEWhQ-00H7Ge-1C; Mon, 31 Jan 2022 14:26:28 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] RISC-V: Fix handling of empty cpu masks
Date: Mon, 31 Jan 2022 14:26:21 +0100
Message-Id: <35936f19a9727b14e4fdb7f5fadfabfa29d53d96.1643635156.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643635156.git.geert@linux-m68k.org>
References: <cover.1643635156.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_052634_685505_5F8A1832 
X-CRM114-Status: GOOD (  10.91  )
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

The cpumask rework slightly changed the behavior of the code.  Fix this
by treating an empty cpumask as meaning all online CPUs.

Extracted from a patch by Atish Patra <atishp@rivosinc.com>.

Reported-by: Jessica Clarke <jrtc27@jrtc27.com>
Fixes: 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid bitmap")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/kernel/sbi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f93bc75f2bc43c8e..22444cfcd56cc646 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -161,7 +161,7 @@ static int __sbi_send_ipi_v01(const struct cpumask *cpu_mask)
 {
 	unsigned long hart_mask;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 	hart_mask = __sbi_v01_cpumask_to_hartmask(cpu_mask);
 
@@ -177,7 +177,7 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
 	int result = 0;
 	unsigned long hart_mask;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 	hart_mask = __sbi_v01_cpumask_to_hartmask(cpu_mask);
 
@@ -254,7 +254,7 @@ static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
 	struct sbiret ret = {0};
 	int result;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 
 	for_each_cpu(cpuid, cpu_mask) {
@@ -348,7 +348,7 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	unsigned long hartid, cpuid, hmask = 0, hbase = 0;
 	int result;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 
 	for_each_cpu(cpuid, cpu_mask) {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
