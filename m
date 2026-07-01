Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB50C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 10:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxfI8WnlOkIKPTOGKq/h45H4sXu6ERdre6P5S3dyTag=; b=rtN9Fv7Uxbb8mG
	fFer8HMee0KHsy3/cQqd7DemyySTZhzAUsHLqOCciSsFy9zpsgxgcZJj/wR+zNvBVnsO8W/79ynU0
	vxCI2+FQr01UPjCIyrqnRxQH3qY3CbAClTf5ocbzPfli/hN0Ll+VKylOlxhyI3ak1XQI4YLPn9m4c
	UmA3TZ54aB3/PTIogwhEm0xnq04Dg2FsZ9e7opnN1lY2ckc1/QBqVunnPkNYykMGHRhbN47nw2sm/
	+M46QOblHNwK0mbH753vHaqTKUzAMh0+abwOJwE6bQYv4yrNl4071GvJ2Gg760dfFAi1mkVDPAvl6
	frnLUTF+Aye9+JkS9zUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBl-00000001J8M-2ZVv;
	Wed, 01 Jul 2026 10:29:05 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBi-00000001J6H-3iMM
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 10:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Mb
	BT5bjBKldgVz9yhQSA+1XgKNkkTrf1SIHLbVsT2yE=; b=DGg69OoeAThhJ3YHx7
	gERfiA0DTZp7X7off3nM40juq3H2ldXGdCKexYw7vNvjtbfYUV9IYYwxNBsKAIYF
	TmoReM6i+iRvkgi1Ca9BUBBNBqkBBNkh3PhOmaw0+9NekcppOAiM1IxbWdvaX8cT
	DrGo5clslIrZqcGl9uJ/N7O00=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3V0jH60Rq_FlzGw--.4936S3;
	Wed, 01 Jul 2026 18:28:24 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH 1/2] riscv: mm: make EXECMEM_KPROBES writable without ARCH_HAS_EXECMEM_ROX
Date: Wed,  1 Jul 2026 10:28:21 +0000
Message-ID: <20260701102822.95459-2-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701102822.95459-1-xiaofengmian@163.com>
References: <20260701102822.95459-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3V0jH60Rq_FlzGw--.4936S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF48KF1ftryxGF4UtFyDAwb_yoWkCFX_G3
	WxWryfurWrWrZ29F4Sgrs3C3WIkasFkFyDGrn7Wryjgr17W3s8X3y3JF13Xw4rCr1IgF4f
	AayfXFW09rn2vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRK89N5UUUUU==
X-Originating-IP: [39.144.122.22]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5QnY22pE68lXfwAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_032903_322438_6C52DDAD 
X-CRM114-Status: UNSURE (   9.86  )
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

When CONFIG_ARCH_HAS_EXECMEM_ROX is not set, execmem cannot create
temporary writable mappings for read-only executable pages. In this
case, the execmem ranges must already have writable permissions.

Currently EXECMEM_KPROBES unconditionally uses PAGE_KERNEL_READ_EXEC,
which causes kprobe instruction slot writes to trigger page faults
on systems where CONFIG_STRICT_MODULE_RWX is not enabled.

Fix this by using PAGE_KERNEL_EXEC when CONFIG_ARCH_HAS_EXECMEM_ROX
is not available.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
 arch/riscv/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b..21794e7bb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1457,7 +1457,9 @@ struct execmem_info __init *execmem_arch_setup(void)
 			[EXECMEM_KPROBES] = {
 				.start	= VMALLOC_START,
 				.end	= VMALLOC_END,
-				.pgprot	= PAGE_KERNEL_READ_EXEC,
+				.pgprot	= IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) ?
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
