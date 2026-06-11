Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49747CD98CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z6ytBIXxnvOj2YjTaE+PL2qzf2ewhLRbAEXuZlioRMA=; b=IN4QRKA7adGXeo
	sI45+kVvws5BPkfTCV40ixzsjddxZB76lnSliK0Pc5bAXjTX2DFIA2+CkmUG2cWkzia6cX2/zz2Ck
	2Ovm6zasm1ozuYxsMI/dZwkQn78yWwEs2qJgIOzSseH/YiJTRe/qwcnPT6ddOP27GLBLr41tlbbQY
	n74OSaCbKCzPJMUA0xQknR6rnICannbv8y25ImtH6j/jx0daybWpvCc1/Dl75MD8q5xi9olw9yPJy
	CeAbBs/Pbn7ppOYYxkZGIDA2DEpoznpHHOJ/iwfmRG3ocuLRSsJHy2FdSx+4TsESiaDgniC9DWjLs
	D2LUA4zAQqacBGZ3a8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXon2-0000000AAY2-4A9f;
	Thu, 11 Jun 2026 23:26:25 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXon0-0000000AAXj-2HGt
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 23:26:24 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781220377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Yd28g4SiRg2xPsC8zN5lDlc0ahw7nl+2+Gb1R8bsEY=;
	b=SGV6ycUJGWxlQ7WXiHMyt0RYzpVe2+PH/wrtXcUnZc38UQl6L1dMPnpHuLIOfsNMtg/jP8
	CrSUBiA1ipaQuRkyuhrVSGHcDLIVG5gACaqKeFQCACrQCLOgwuEMdqhbhPFHUuUpmRbWce
	vkSpOQAm6t6JYcJJz12Hlzg8rccZbY0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: smp: use secs_to_jiffies in __cpu_up
Date: Fri, 12 Jun 2026 01:25:38 +0200
Message-ID: <20260611232537.467398-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=thorsten.blum@linux.dev; h=from:subject; bh=gO78kdY4oleCRCBxKsBnxCt2/CamXdZinh+7pvRDRZ8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnazh/PXVFTeMJx/XBNyR9J9aXyaz3E9T4KSnUoT0vuf 7Lq33X2jlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIyHaGP/y/32+z6kpq2ae4 U3D+zu/Zd1R3iOvLBpX7XGgLDdgqqc3I0PBCetbaBo8qmwTNrQVNOZwenx8wvNf7nHfHpODJ3Oo lDAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_162622_816726_BB92F317 
X-CRM114-Status: UNSURE (   7.49  )
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

Use secs_to_jiffies() to simplify the code. Drop the redundant zero
initialization while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/kernel/smpboot.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 8b628580fe11..f6ef57930b50 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -189,13 +189,12 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
 #else
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
-	int ret = 0;
+	int ret;
 	tidle->thread_info.cpu = cpu;
 
 	ret = start_secondary_cpu(cpu, tidle);
 	if (!ret) {
-		wait_for_completion_timeout(&cpu_running,
-					    msecs_to_jiffies(1000));
+		wait_for_completion_timeout(&cpu_running, secs_to_jiffies(1));
 
 		if (!cpu_online(cpu)) {
 			pr_crit("CPU%u: failed to come online\n", cpu);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
