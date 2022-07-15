Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB6DC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KUO/V7Tui9ZxbBvNSyWtsKKz22p+juP9DbEj/ac0ENs=; b=IJFdqW6AGUKvIE
	3RxAIFZMsgg5s6ngWH7Epll6xy4e8BqKRW9fv+Z//PT68zayd8uF+XNpSzS2YrVA8uOoZYqt4RMdR
	oH8Q4QhYoBmo217/969Xv/Rlji1sXUeMUpXLj8Q2H7rQtVIL3+lyRyAYg/6dTj53a46wqSBUa9426
	KWw1JrrVrhF80gGVz1htP9npZ0JJutgbsQK9LoqJbJCQR5Cg5i9F8hISWkdRZfghQmzRwj0wUVpof
	Jbh4q/0hQ22amtdsmtOfo/jnJEq7RPcEkHbPxJXAigB3En5MXgUTsVPbTIstXtXiEVrDAyyxcrxi4
	33SdztBBcex9I/ch/Hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKzK-0079AR-Am; Fri, 15 Jul 2022 13:04:10 +0000
Received: from m15114.mail.126.com ([220.181.15.114])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKzG-00799Z-Sc
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 13:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=b4ulK
	tkQ3AUm9ryEsB/eDOROCHPs+Q9LLFfD7GPr7jE=; b=lY9BG1vPUtlS9crdyIYPF
	PmST+sm+53xWeOvVGW9eOX+O6vrRwXk17tuUVUyy4qlw2vsata51IoBD4siSCOT0
	7GN7feHy7FmgjPzIMtm99VFRV59CY19UAKwr/csIA87ztZTMM3hi0BTAPVjOmISF
	/2mCUHjMa0QFzyeKVmmaO0=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowAAn0vuiZdFi2v75Ew--.61029S2;
	Fri, 15 Jul 2022 21:03:31 +0800 (CST)
From: Liang He <windhl@126.com>
To: atishp@atishpatra.org,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org,
	windhl@126.com
Subject: [PATCH] perf: RISC-V: Add of_node_put() when breaking out of for_each_of_cpu_node()
Date: Fri, 15 Jul 2022 21:03:30 +0800
Message-Id: <20220715130330.443363-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DsmowAAn0vuiZdFi2v75Ew--.61029S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1rZw48Jw13AF43JFW7XFb_yoWDKrX_u3
	s7Wr4IgrZ8tFs0q3WDXr4fZ3s2qryFgr9rWa92v3WSvw1UZ3s8Jwn8Xry3XayUZrWUGa4x
	Xrn5GrW3CrWS9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_b4S7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgQ-F18RPf9o7gAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_060407_264574_544734C0 
X-CRM114-Status: UNSURE (   8.54  )
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

In pmu_sbi_setup_irqs(), we should call of_node_put() for the 'cpu'
when breaking out of for_each_of_cput_node() as its refcount will
be automatically increased and decreased during the iteration.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/perf/riscv_pmu_sbi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dca3537a8dcc..705d249a1b53 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -666,12 +666,15 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		child = of_get_compatible_child(cpu, "riscv,cpu-intc");
 		if (!child) {
 			pr_err("Failed to find INTC node\n");
+			of_node_put(cpu);
 			return -ENODEV;
 		}
 		domain = irq_find_host(child);
 		of_node_put(child);
-		if (domain)
+		if (domain) {
+			of_node_put(cpu);
 			break;
+		}
 	}
 	if (!domain) {
 		pr_err("Failed to find INTC IRQ root domain\n");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
