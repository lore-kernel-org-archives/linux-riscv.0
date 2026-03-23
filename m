Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D89EC01DC
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 12:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=646xW2JK+Z9kvlB6Da9ZGC3JILaaVFc2LYcaJa/CEe4=; b=RFbSJDIqw3ws4X
	CkIZmMpDcXwezjjwhB/pIb6hpDDsByiA1LO+uDLiECcG7vLzpW6Pq1aknO6EeAZxmZWgxCfHnBGD4
	XrE71YGwxJmb+w4K65ymOTpR2tMVyq4swWHHAE4wWqyGd7VGX1sGSYXX93okanHOsnMepiW7ZPhxV
	Y3SXtQRChPibz04p/mtrV+Eow6jDsSmDhoqKO1dMsG08WnUSk1saG2hiyK9AULFVeQBMUoA1V4um8
	vfZO8BITqUZYmod7PF2ggBrU3a7IUrouYNcBZ1NNFWvnZvOmQ9Uo3e1naeqFD8oqFz8Ix0ow8laP+
	UyMlyzFzotZOU/nQQf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dxp-0000000GfIV-1nWZ;
	Mon, 23 Mar 2026 12:00:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dxn-0000000GfIN-3z12
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Mar 2026 12:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DYDMISaMocMbhkDri+xfVXLFcebV5dbbQ08HxufA/mA=; b=HpnEUks+/46OfWNrHLOmCFTUGf
	T8HiUVQOZScwZ8tCAJxSFDemDqNyz7jFtRMxZoEzMc4Cmbdpj5IBsk+uhZMUwY+ym6cG0ZA8aWpk9
	qZDKbLQ2Yq0V/n6kSr1/a0iDY4dqN+emGnOWCDu5ZRz1s1zqoLBOkAwgRwEUUYdZWtE8XJfMUyuVD
	B5SUJFy/CiLbzbrIkyF17XwM0G4bGuMtgbc+ybgO/ylPxCcQCpJex9otKYWvTrGCpeAWmKbY9Mf8n
	T+OEeoxkAx4q9ZIGKwalU/0oB7nhxRl+1xaIprbEXjHPxP2vaKkK3YFYGem8LtHXIhnQkRw91+Y4P
	MzYOlkXw==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dxj-00000001Qtk-0X0S
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 12:00:54 +0000
Received: from yzs (unknown [115.192.255.131])
	by APP-05 (Coremail) with SMTP id zQCowAD3hAhEK8Fp9qw5Cw--.39901S2;
	Mon, 23 Mar 2026 20:00:04 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: cacheinfo: Fix node reference leak in populate_cache_leaves
Date: Mon, 23 Mar 2026 19:59:57 +0800
Message-ID: <20260323115957.38348-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3hAhEK8Fp9qw5Cw--.39901S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4Duw18XF4rKF4xtw13Jwb_yoW8JFy3pr
	W2krWYyry8Gr4xKa4Iyrs7W3y0qas7WrsxC3Z7CF1UZwsxXry5Xwn5X34YqrnYvFyrZryS
	vr1UKw4Ivwn5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUU
	U==
X-Originating-IP: [115.192.255.131]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsPA2nA5q74rwABs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120052_222659_FCB37755 
X-CRM114-Status: UNSURE (   8.88  )
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

Currently, the while loop drops the reference to prev in each iteration.
If the loop terminates early due to a break, the final of_node_put(np)
correctly drops the reference to the current node.

However, if the loop terminates naturally because np == NULL, calling
of_node_put(np) is a no-op. This leaves the last valid node stored in
prev without its reference dropped, resulting in a node reference leak.

Fix this by changing the final `of_node_put(np)` to `of_node_put(prev)`.

Fixes: 94f9bf118f1e ("RISC-V: Fix of_node_* refcount")
Cc: stable@vger.kernel.org
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
I saw 37233169a6ea ("riscv: Prevent a bad reference count on CPU nodes")
added the stable tag and fixed a similar issue, so I included it here as
well.

 arch/riscv/kernel/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 26b085dbdd07..6c9a1ef2d45a 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -133,7 +133,7 @@ int populate_cache_leaves(unsigned int cpu)
 			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
-	of_node_put(np);
+	of_node_put(prev);
 
 	return 0;
 }
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
