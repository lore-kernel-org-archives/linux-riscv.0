Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD92CE7B1E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YmSf2bXzb2v8lXPTXroAayFoGJYIIaBHYIE/uPl2JLQ=; b=VRnzGc1iIfqvDi
	+AE+k5CnE8k6ORwjo4Eyo188ruX8qcp2Y0bxaxZ3/iBAOq7xCOpOBYLGe84Kgq9yosVCpN40NSbI8
	+TjZKgvvfV0SdTvO0LRUMqW2EQkZniizMKXnhbFnDZb4Yusi4FiYG4t80PLwprgzBrP2a4bSZVj/N
	MwVkGXfXvZEi687H6N/JmO9gMfPLgSAbTHeCcI4JnwijX7VZTKlqq7YgXgnmUQ8JaogHqPQRYtFxB
	V/7hf+rVbb4iy1ui6j9sfG/osnHbEhzfeWJd6shUceXwJ4a8B5VlJBe13wOFPtqFpQfPhUtrBGpx8
	L6qFNejRylgC2K/BwsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaZZ-0000000ChOA-0zVJ;
	Fri, 06 Sep 2024 15:08:29 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaVM-0000000Cf1t-2XLs
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 15:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725635012;
	bh=s2uI9eOAaihPZf+0siC24nn5Pw8SO5uIyZM4H3qVeCc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XHSC+k6hW9V05hp+U32A6H1JwCxX+ErwMI/jE7ZMgdUEQpoG64yZgxHSbBTt8/kgg
	 TvU5pasZnE7+b+eXWWz71APzfmEdUWpNki/+DIMt3cv3vf7TfmtX2jVWbrYhilPyrZ
	 KrXtXjWWdzgNC2vth2Mh05bI6N61W1LVyQGjuq+4=
X-QQ-mid: bizesmtp81t1725634981td6ekkr7
X-QQ-Originating-IP: 0zb2X/6fk/o7ydtwNgl/yjYJt97+zSlagmdJWRi7ITo=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Sep 2024 23:02:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1837138495775610230
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	wangyuli@uniontech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com
Subject: [PATCH] riscv: Use '%u' to format the output of 'cpu'
Date: Fri,  6 Sep 2024 23:02:54 +0800
Message-ID: <BFB9D0C1A76B47D6+20240906150254.508918-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080409_497401_C8A8BD38 
X-CRM114-Status: UNSURE (   8.70  )
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
