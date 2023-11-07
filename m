Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E5C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cv8Zri68E+Bj1ISf0Ip8ipGyP7roZro6sRw4UUm0q4U=; b=Dp8G7ZWM8Aixqq
	Jvks3M13C3D6EwreZYbuMNApO9M+G+pgD6c6BLvBwjIy8a2EXV1Kx2JrhdL12aZdxg0EGqxeDjrrK
	iDQsI/uS+FpY1mDxxcl0TMgJUUH6ykt5iU57QJhYDz/hp172O9j+Mdjyoy7RM0owK5I75GMJbOBfp
	JSX95YGRdoB4xRVb9TwJlor+Pv7FL+UQk5lGI8uC6+QEG9Wu20s3L4atBQelvFbJLC4fEpqYsYo6x
	0ZcqKQ9Y6fuj/pX5RQbgH7KsbmsTVZkOr0MWhA87ZAE65D9laS6lOZvXMmXjGE12OzTUfwtF5ksmD
	eBGVmXlBUGneu1AGNKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JOB-0015cK-1f;
	Tue, 07 Nov 2023 10:32:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JO8-0015ZH-17;
	Tue, 07 Nov 2023 10:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=B2mYLeaTLi2RKWi068dxPknxY80IYTqbrhnkvkRDiuE=; b=StuWzkV+OftH34tM4tK4DwyjXS
	7Q524DIazsLJH7tW9qybQ+z+SAs/S1I1AWXti5Yun6uBzHAHy/VKjOPZgIVFrTXjaanenLF4/w9mv
	s4W1JztTlXEh/wAhQtbaX5+AO8Yb7YcKHu4X+0l234BusDgTleqPhJXEcLxGiTl/m2+na0c/I3uAv
	6cfWQ+7akonXI/qomQ5whFDPcYU7vpZVJMWHrQlKK/Jd7lJk0IiK23NZxVF5V2b/RiM5y3OsP9fvE
	Q53mJcV0lYjCJoEERAXz9dRkDCvMcnzDt2qjmT07pGa53MY4cv7D/V76IRpWFPVb3XYnuLc+pRaUr
	38O+2TIg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JNy-00BvXl-0s;
	Tue, 07 Nov 2023 10:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B2mYLeaTLi2RKWi068dxPknxY80IYTqbrhnkvkRDiuE=; b=dqcnH4JHbhq+YyuErnnwbDz8AN
	0aZHSKx0GUxYcKgXYu+ufg2cb8kYEmwx+9kFA1w4O4SyrvG+1OUdeuxsMHh2eLeLdkByAWX4X3oAz
	2NO1ccm9fwHvFF2bXexmTLIQFvhf3Qz/DmRmQrmP+rcr76RnT2KsoSlxcfXP+7GCe+AP8as7RQRsh
	PmNfmj8Cg3tcxdNxPxdJVtZXPcRFD/Kr+zcnE867HVQbpMciT0HRPaxiHcaaDbAvZ36cCRU1uznTv
	t2z4hpxFimnFtmEAgZQioZfNIPtAqdcKWzGgkyzsh3sSohV2F7UJLYN38lWTMr+ZWxB3YwUcNX/qc
	768F37qQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42208 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JLd-0000Gy-1D;
	Tue, 07 Nov 2023 10:30:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JLa-00CTxY-Uv; Tue, 07 Nov 2023 10:30:15 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH RFC 11/22] drivers: base: remove unnecessary call to
 register_cpu_under_node()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JLa-00CTxY-Uv@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103242_503418_ABC3942A 
X-CRM114-Status: UNSURE (   8.77  )
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

Since "drivers: base: Move cpu_dev_init() after node_dev_init()", we
can remove some redundant code.

node_dev_init() will walk through the nodes calling register_one_node()
on each. This will trickle down to __register_one_node() which walks
all present CPUs, calling register_cpu_under_node() on each.

register_cpu_under_node() will call get_cpu_device(cpu) for each, which
will return NULL until the CPU is registered using register_cpu(). This
now happens _after_ node_dev_init().

Therefore, calling register_cpu_under_node() from __register_one_node()
becomes a no-op, and can be removed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/base/node.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 493d533f8375..4d5ac7cf8757 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -867,7 +867,6 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 int __register_one_node(int nid)
 {
 	int error;
-	int cpu;
 
 	node_devices[nid] = kzalloc(sizeof(struct node), GFP_KERNEL);
 	if (!node_devices[nid])
@@ -875,12 +874,6 @@ int __register_one_node(int nid)
 
 	error = register_node(node_devices[nid], nid);
 
-	/* link cpu under this node */
-	for_each_present_cpu(cpu) {
-		if (cpu_to_node(cpu) == nid)
-			register_cpu_under_node(cpu, nid);
-	}
-
 	INIT_LIST_HEAD(&node_devices[nid]->access_list);
 	node_init_caches(nid);
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
