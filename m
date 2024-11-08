Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B10D64063
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nXH2MsJ8pGv5ef/tyiTliqEOnHNpuTsLl95C0MalJkM=; b=kirFMnaK8e5Ak5
	8aCvAucCqnNRvdVaKVeDrPVOb6VzgJuwEbb8QH1PNxdLlCRUumoQf6vGFpQ/IVRKiDGevnUnpldN7
	rKgnC/sQCMxMNh6HtC2GVG/ihl0jlgdE7e7XRuYXiyyr0wMcgQ9RboqmelO8aGCH06gJwt5h4civZ
	tOToKzZsPyhiperz0qQ+LvY+3hXfnhmfz/EHSTSgBfX1jcY7rOHzjgv4SiXlKCslGoDKnisNg1stx
	0z8P1gw6iXqc9obumjo0/Hj5bixOdsCn2VcooEvjhma5vBVvyN3jUtnJDDWexOAAe8QA7JkDj/+13
	hqW10EHvjpFa0bw4boww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RwB-0000000BF4V-0zBi;
	Fri, 08 Nov 2024 16:34:19 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RnV-0000000BCT2-3ciB
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 16:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dUGTF
	+Sr/jmIL6b2aWpcEFyrM7xIuftjowU0OHO/q/s=; b=oOmFTAhf576eIsDEKrKm+
	GpG4sA0QHJY2e5qL05U4im1P7F+f4pY/0xzsSu5CnC/qy2Und2byEl6IbPD6l98x
	56Yg7/u3V43LyPu95+qSo0i9gTumDIB4r8aVly3NzKG/lc9L5ARbM1XVS/biWql2
	2kDoX29fRHJHSn8irvCwHI=
Received: from localhost.localdomain (unknown [111.35.191.191])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAX7U9hOy5nFlO5BQ--.37910S4;
	Sat, 09 Nov 2024 00:25:11 +0800 (CST)
From: David Wang <00107082@163.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	David Wang <00107082@163.com>
Subject: [PATCH 12/13] riscv/irq: use seq_put_decimal_ull_width() for decimal values
Date: Sat,  9 Nov 2024 00:25:03 +0800
Message-Id: <20241108162503.9914-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: _____wAX7U9hOy5nFlO5BQ--.37910S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr1DKr15tryUKF1UAr4rAFb_yoW3WFg_Kr
	Z2ya45Way3tFW2vFyDuw1SqryDA34FqF93G3Z29rW2yr1YgrsIyas0yF45J395XrnIqrZ7
	Jryftrs2vr1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_ZqXDUUUUU==
X-Originating-IP: [111.35.191.191]
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMw+RqmcuOswJMQAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_082522_428907_0F646CA5 
X-CRM114-Status: UNSURE (   7.72  )
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

Performance improvement for reading /proc/interrupts on arch riscv

Signed-off-by: David Wang <00107082@163.com>
---
 arch/riscv/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index c180a647a30e..f1e9c3db094c 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -226,7 +226,8 @@ void show_ipi_stats(struct seq_file *p, int prec)
 		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
 			   prec >= 4 ? " " : "");
 		for_each_online_cpu(cpu)
-			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
+			seq_put_decimal_ull_width(p, " ",
+						  irq_desc_kstat_cpu(ipi_desc[i], cpu), 10);
 		seq_printf(p, " %s\n", ipi_names[i]);
 	}
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
