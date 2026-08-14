Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2097C5CFC1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KillvBgiiOUXxrcUdbMHpk9aR+iMSVr/qRbLPNKe5l0=; b=L1HFOMCmnRD5TL
	/VcENNd8yoL+IH8ysscYvhW4N7jnDDD8nKTE5bTDUNKMGhcgs1CBqZ5c1uhlsJvHCNT3k/3hrDmIF
	bBLotIN3WbWeLHMFpJuU3qZNGF2oaTwRhN3Qnorgjc0IucVDZeTkteGYdKIHNHuYfXPvqPopsHp36
	KvTf5o2rDphNWRGbqHDd2Q5SsMedXjpZd0Xo13ekogtYVZ8/QnND28io280ngsDdcZgId5vPizFEG
	p4RYPhONm17Ka0jYkJ/greUb2TrDLzed36ko2Nv42cCLzv9zgFTdT2HbismzS21ritDbKF0jt/rWR
	pMBLhUkPiaQNRT20WlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunHX-00000002HNY-22FJ;
	Fri, 14 Aug 2026 08:28:51 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunHS-00000002HKn-3W5z
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 08:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Jg
	6xZqu7dbxREDlYqdaqjxUcNWuSqpTI5jZPGX3Lx8I=; b=SaQx4KCzFknWRUU+My
	qqDlz/PrYEpMsn+nWztHiOH5UBYrr4ltMFp0szrvDGoAiTA/8RqtKSHIiAx61JIT
	SzPs0316P0KV8xugsfGFQonDVzH9tVQj0jov4yCkWj1wdb1QDlKz7AxwXfOXdCKN
	lNuiHmXN1OlSkSb2GyQe9P4zM=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3dIl_0X5qdVL2Pg--.57693S3;
	Fri, 14 Aug 2026 16:27:45 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Klara Modin <klara@kasm.eu>,
	prabhakar.csengg@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v5 1/2] riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE_RWX
Date: Fri, 14 Aug 2026 08:27:41 +0000
Message-ID: <20260814082742.148403-2-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814082742.148403-1-xiaofengmian@163.com>
References: <20260814082742.148403-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3dIl_0X5qdVL2Pg--.57693S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw43Cw1DJF43uF15XrWrZrb_yoWkCrb_G3
	WxWryfuayrW39Fg3WfKr4fC3W2kas7CF1UGrn7XFyqgrnrZ3s8X343XF15Xw45Cr1SgF4f
	Aa9xXayI9rn2vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_rb1UUUUUU==
X-Originating-IP: [39.144.122.80]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5gHO0Wp+0YEYYwAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_012847_266576_502048F5 
X-CRM114-Status: UNSURE (   9.19  )
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

When CONFIG_STRICT_MODULE_RWX is not set, execmem cannot create
temporary writable mappings for read-only executable pages. In this
case, the execmem ranges must already have writable permissions.

Currently EXECMEM_KPROBES unconditionally uses PAGE_KERNEL_READ_EXEC,
which causes kprobe instruction slot writes to trigger page faults
on systems where CONFIG_STRICT_MODULE_RWX is not enabled.

Fix this by using PAGE_KERNEL_EXEC when CONFIG_STRICT_MODULE_RWX
is not available.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
 arch/riscv/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 85bdcce63a..b084a72e5d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1462,7 +1462,9 @@ struct execmem_info __init *execmem_arch_setup(void)
 			[EXECMEM_KPROBES] = {
 				.start	= VMALLOC_START,
 				.end	= VMALLOC_END,
-				.pgprot	= PAGE_KERNEL_READ_EXEC,
+				.pgprot	= IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ?
+					  PAGE_KERNEL_READ_EXEC :
+					  PAGE_KERNEL_EXEC,
 				.alignment = 1,
 			},
 			[EXECMEM_BPF] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
