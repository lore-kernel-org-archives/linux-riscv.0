Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5FDC5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Date:Subject:From:
	References:Mime-Version:Cc:Message-Id:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GPHi3P/kfRb7xx/yMlGXWr9FI5DNQtTYJVnH3nyDvzo=; b=q6aRLul10c+EgfGuZ6Yhz6QHjP
	ah1wlKfXDNP/9MlJ1MfIOqES7cqzj1dqeQxNgNHQNKT+Kk5VrHXyx0S0zMXaA765LkPG6K7V1Bas1
	OZyxWEmgMrYHsNGkEWW6fCuwM+8uoA2yJfxfJvEKuN2LbvEiuE7YMDlIRU2W3VlriVToGml98gz2d
	EhlNRE+nLFz4auTAxHv2z21esda23BhuvptLk6yFQyPFxp0G+CGC68q2F199lJQL2tVxv0tnyrSqv
	JUKvINofGmR4t0es5PhfGM4SqUNa/cYZc06nyo1j9r8XFQhKOVJ3SIOZOQnXKLEMk0bo9qlzSYisb
	1gaZdT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV6j-00000000hU0-1Igv;
	Thu, 13 Aug 2026 13:04:29 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV6h-00000000hTG-2FYe
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 13:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1786626263; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=REzDDvgcolRGWcU+mrb7PUOYaUqrGGQBSl0cuWRGrqg=;
 b=UmZ7ZrExZ615q9czAXYQyygQS/Y1yyCrd1XRsOb08YhtSOG+SMCp7nJYSsW/aW7HLeyA6h
 bS70QEoZ6TepWKUyQ7K3MPLHATL8B67M68jvwTiCGL2kBk4cMtMDmSZa1DBnkTchVRfWau
 W1V2Zxa3hnnh6sxc7ieyt1KmD+FU7qwPDGV6tE0lUEnRYhsIeIuy0TKBySERFf2fBu9/P/
 R/+3NtctagA71cACYYfSQ6wLXfwR6Xpjro1yOEPFckyMy/pFBrvClNv9qGIy3Z2JQEWQOE
 ea802XjcmnYjMqxZu4dI2jHz65AuZRJLrv7oLdBEh9E6UKBxERuZ1PMFEPdT5Q==
To: <palmer@dabbelt.com>
Message-Id: <20260813130357.1144775-2-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Lms-Return-Path: <lba+26a7dc0d5+f91099+lists.infradead.org+qirui.001@bytedance.com>
Cc: <pjw@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
Mime-Version: 1.0
References: <20260813130357.1144775-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH 1/2] riscv: Fix spurious warning when cpu_is_stopped callback is absent
Date: Thu, 13 Aug 2026 21:03:56 +0800
In-Reply-To: <20260813130357.1144775-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_060427_649071_B5F3371E 
X-CRM114-Status: UNSURE (   9.88  )
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

Commit 2b2b207e1162 ("riscv: cpu_ops: Change return value type of
cpu_is_stopped() to bool") inverted the warning condition from
if (ret) to if (!ret) to match the new bool semantics where false
means "not stopped". However, ret is initialized to 0, so when the
cpu_is_stopped callback is NULL (the callback is optional), ret
remains 0 and if (!ret) evaluates to true, causing a spurious
"CPU%u may not have stopped" warning on every CPU offlining.

Move the warning inside the callback existence check so that the
firmware verification only happens when the backend actually
provides the callback. This also eliminates the now-unneeded ret
variable.

Fixes: 2b2b207e1162 ("riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/cpu-hotplug.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 0bc56d8381b6..4c3dfc0efbee 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -49,15 +49,11 @@ int __cpu_disable(void)
  */
 void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
-	int ret = 0;
-
 	pr_notice("CPU%u: off\n", cpu);
 
 	clear_tasks_mm_cpumask(cpu);
 	/* Verify from the firmware if the cpu is really stopped*/
-	if (cpu_ops->cpu_is_stopped)
-		ret = cpu_ops->cpu_is_stopped(cpu);
-	if (!ret)
+	if (cpu_ops->cpu_is_stopped && !cpu_ops->cpu_is_stopped(cpu))
 		pr_warn("CPU%u may not have stopped\n", cpu);
 }
 
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
