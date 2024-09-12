Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033C1EED609
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YmSf2bXzb2v8lXPTXroAayFoGJYIIaBHYIE/uPl2JLQ=; b=Q1Oo9LDXq6MvDM
	KC6uyDOkibyjH9w+Vq5/S9umpkaS58dmaCCemHeZgXM1aq5W8mFFVYYGV91WS5WxMh1lUiIIeB3Cu
	pJPYAuCDTHTQ32YhhdiS3ow24/W/3yX0/EKmGAlEjQNd4BNXclMKLnqYiYqp8KMF2S5KEjRsMEmNL
	EuT0vgOJvxHfZuqL2OBIJWiwbjSc23I63gt4LmkRk+Lo7PqQW+j1WhqaKwrm3JlKv/1QS5oU/W7u8
	uVgb1hgGdVZcTFm+RgZcIrlmcUbgeW7140Llx/CNGCISCGmiqfAhTcG/fYg0mKJzLOC7LDGPsp4FY
	oQtIsyG265uvwNq4xCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokDy-0000000DGHf-1nFY;
	Thu, 12 Sep 2024 13:51:06 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokDu-0000000DGCT-3ebx
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 13:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726149029;
	bh=s2uI9eOAaihPZf+0siC24nn5Pw8SO5uIyZM4H3qVeCc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IMKHRz/la8K0W2RglkotWbTJMh2XT0L5wUBf5RxTHS3yWOQGbw99nsEbFvvhSwidf
	 aVzpQL5giYl/I4/qh+3guL1v43MK1spwyU8aAg4hGimYKOv3JgmmsCI1q+vLKO8jWH
	 VRw/INB4Q0PRJ8EAkAxbbWqo/8u4CrfwhEtezR2s=
X-QQ-mid: bizesmtp77t1726148996tcph1scv
X-QQ-Originating-IP: S1gtQrf5JsmG/in/LdoJAWcnwzJTBcojHOYNfr9epsg=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Sep 2024 21:49:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18164927246695078520
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	atish.patra@wdc.com,
	anup@brainfault.org,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH] riscv: Use '%u' to format the output of 'cpu'
Date: Thu, 12 Sep 2024 21:49:46 +0800
Message-ID: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_065103_259674_CDF9D394 
X-CRM114-Status: UNSURE (   9.13  )
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

'cpu' is an unsigned integer, so its placeholder should be %u, not %d.

Suggested-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/riscv/kernel/cpu-hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 28b58fc5ad19..a1e38ecfc8be 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -58,7 +58,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 	if (cpu_ops->cpu_is_stopped)
 		ret = cpu_ops->cpu_is_stopped(cpu);
 	if (ret)
-		pr_warn("CPU%d may not have stopped: %d\n", cpu, ret);
+		pr_warn("CPU%u may not have stopped: %d\n", cpu, ret);
 }
 
 /*
-- 
2.43.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
