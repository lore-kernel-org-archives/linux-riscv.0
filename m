Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB562C44520
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55G2qxhbMw+USV0J8xbjDW/lFmSZbRvH0TPQ03z7NvQ=; b=KPrq8zPHu895g1
	lm2qhSp+UuD+tXX+m/NQnjuwynQODZi3NaRan9zGl1vBheWMtjyKHMdsfMhMl/P8cTYqJM99Ilfo8
	B6FtWCF5zbEMLJcbZHZ6fa0Hr9/Q1gjn6GihmjhEZzbitsvSVSDETPgoJYKTtsf6HdhVI6A1u6Coe
	/gvGVuDVjGD0u5FOTvriRtMKfKRNAxyfNg/iSGFoBzGzZxTS4pVtUePEiTfgprTV01Et8fGUhyujQ
	gg/bubg0SH8M67icNhl3lv7XAB68hZMuAUc495vdwzJcP/YgNFYZXdVfiBEbxo+udTKExmnokkrX5
	lA/m/UP8LyFofzJZ+Ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMci-00000004piX-2VTB;
	Sun, 19 Jul 2026 08:11:44 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMce-00000004pfJ-048t
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 08:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dE
	5y8/chxuftOxl2mAuIsNVLsUFquCP12nX3RgkQUfU=; b=B0Z4FQPHcDeOHyqIRC
	mQ0/ffgZxj1HU+BBbhjE9gUrmGjxWL0ZzydkB0mclBEQLdgCjzojqHl30p1Mu9Qb
	IUF5U/CNKTg+PikvfdBfW6/QhCNBozwWusVzo7Lq1kf7Cs2Ezq1FdeXcIEOfTXlQ
	LazmMpH5KnhO34ZQtLeOcNzak=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC3z6F9hlxq+TAUKA--.58193S3;
	Sun, 19 Jul 2026 16:10:38 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	namcao@linutronix.de,
	alex@ghiti.fr,
	broonie@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH v2 1/2] riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE_RWX
Date: Sun, 19 Jul 2026 08:10:35 +0000
Message-ID: <20260719081037.5749-2-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719081037.5749-1-xiaofengmian@163.com>
References: <20260719081037.5749-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wC3z6F9hlxq+TAUKA--.58193S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF17AFyfZr4DtF4xuw15Arb_yoW3Xrc_Gw
	1xWrWIgFW5Ga9Fgan3Kr4rG3W2yayvyF95trnrXryUWrnrWwn8J343JFs8Xr1rur1S9rWf
	Aa4fXFWIvrn2vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_a0PDUUUUU==
X-Originating-IP: [39.187.244.72]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5R5ydWpchn6eRAAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_011140_871947_0D549C7D 
X-CRM114-Status: UNSURE (   7.90  )
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

...

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
v2: use CONFIG_STRICT_MODULE_RWX instead of CONFIG_ARCH_HAS_EXECMEM_ROX (per Nam Cao's review)

 arch/riscv/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4..7951d72a12 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1457,7 +1457,9 @@ struct execmem_info __init *execmem_arch_setup(void)
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
