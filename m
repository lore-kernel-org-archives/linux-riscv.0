Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB3CD7308A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 04:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c+Vrmgcrc4u5xsERNd9+b1snyCvLGJkS6SNR8K6rbRQ=; b=Od694rNIiZZcW1
	oxHFR/wzEdYu1n8DPukqjryGEazDDSJd4ncBHaeV/UXk52g8PtPNDV90ft3Pypiz6Ds4KUlixyV8J
	ohd5thd6i9tDuTR8xnq3c2tfJNE90AvSWovnsRVHMeGI9gjD8peloN3lan28GAToLKwVFFq3xPP+f
	sElBfRtDOAlc7iuXv3hajj03jSIHza4HUinpSvKweaXpbMuM5fxNdYddha63vcRKlKHAb55rT+20K
	Sfcw36z0BlAv8rgom9xWvtYYTX/PCF6CUtD379k4o7KdP2FYCQWL0TAzf/ZX66tMA7uSEdIOD3IPQ
	89m/e22kzwMxbHYVs75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VoT-00000001AuY-2emv;
	Fri, 03 Apr 2026 04:07:17 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VoR-00000001Atu-0OWR
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 04:07:16 +0000
Received: from 0003-riscv-pi.eml (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAAnfhHtPM9pGU1XDA--.12440S2;
	Fri, 03 Apr 2026 12:07:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 11:55:50 +0800
Message-ID: <20260403143003.3-riscv-pi-bootargs-pengpeng@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] riscv: pi: validate early bootargs before string use
X-CM-TRANSID: zQCowAAnfhHtPM9pGU1XDA--.12440S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW8trWUCFyktF4rGF1rJFb_yoW8WF1xpr
	s8GFnavr4rZFyUt34YqanY9w48uwsxtwnFyas5uryrGa13Jry3Jw4FgrWUur1aqF48ZrW5
	KF4a9a4rAFy5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjMqcUUUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_210715_523456_BF167843 
X-CRM114-Status: UNSURE (   8.13  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

get_early_cmdline() fetches bootargs directly from the FDT and
immediately passes the raw property pointer to strlen() before copying
it into the early command-line buffer. Flat DT properties are external
boot input, and this path does not prove that bootargs is
NUL-terminated within its declared bounds.

Use fdt_stringlist_get() so malformed unterminated bootargs are
rejected before any C-string helpers walk them.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/riscv/kernel/pi/cmdline_early.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
index 389d086a0718..ac55f1c7ca70 100644
--- a/arch/riscv/kernel/pi/cmdline_early.c
+++ b/arch/riscv/kernel/pi/cmdline_early.c
@@ -13,16 +13,17 @@ static char early_cmdline[COMMAND_LINE_SIZE];
 static char *get_early_cmdline(uintptr_t dtb_pa)
 {
 	const char *fdt_cmdline = NULL;
-	unsigned int fdt_cmdline_size = 0;
+	int fdt_cmdline_size = 0;
 	int chosen_node;
 
 	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
 		chosen_node = fdt_path_offset((void *)dtb_pa, "/chosen");
 		if (chosen_node >= 0) {
-			fdt_cmdline = fdt_getprop((void *)dtb_pa, chosen_node,
-						  "bootargs", NULL);
-			if (fdt_cmdline) {
-				fdt_cmdline_size = strlen(fdt_cmdline);
+			fdt_cmdline = fdt_stringlist_get((void *)dtb_pa,
+							 chosen_node,
+							 "bootargs", 0,
+							 &fdt_cmdline_size);
+			if (fdt_cmdline && fdt_cmdline_size > 0) {
 				strscpy(early_cmdline, fdt_cmdline,
 					COMMAND_LINE_SIZE);
 			}
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
