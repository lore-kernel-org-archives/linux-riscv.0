Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E81E7D0C2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 03:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2gGHNriVFqSiPlah6cfWvrV6CI/Mz0JKo3oByEYPN8M=; b=KS1V5WhAAKxlrV
	uep37OE+6tlyNLCCKygSKRdeFvK+Vv0uLvIH/xtciVR5/CwoopUI2VRv+O8y55TsQeTv0dol2XURC
	/tdbVatUYydbQyrPyM30Wy8g1aO4kcN5WrDW+/q2Z4LgcEX91cHjNC1Zsc3Y9rr5mKcDZlGT69hTo
	xVvs3JovY8kGJK8lo+6Melwkplr7eIv5FvUU1IjfTH/M3coecTd5YgZ10K00HDdIErxPcQkqZepmS
	9DXkqcWxbmGNO6kwYK7tfROtWfAXiBAGD0nYkFllLKEJB0mkiaEF6fdLvrCBilgDvnMyOxCmMuInJ
	e7XR4zQvEdPdYtlwOXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjWWI-007hIU-1A;
	Fri, 22 Sep 2023 03:07:54 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjWWE-007hGv-1D
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 03:07:52 +0000
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RsHFc2lDXzrT16;
	Fri, 22 Sep 2023 11:05:24 +0800 (CST)
Received: from huawei.com (10.67.174.58) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 22 Sep
 2023 11:07:32 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <bhe@redhat.com>, <thunder.leizhen@huawei.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<conor.dooley@microchip.com>, <alexghiti@rivosinc.com>,
	<ajones@ventanamicro.com>, <jszhang@kernel.org>, <sunilvl@ventanamicro.com>,
	<robh@kernel.org>, <bjorn@rivosinc.com>, <zephray@outlook.com>,
	<akpm@linux-foundation.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <chenjiahao16@huawei.com>
Subject: [PATCH -next] riscv: kdump: fix crashkernel reserving problem on RISC-V
Date: Fri, 22 Sep 2023 11:07:22 +0800
Message-ID: <20230922030722.708267-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_200750_756205_F709AA26 
X-CRM114-Status: GOOD (  12.24  )
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

When testing on risc-v QEMU environment with "crashkernel="
parameter enabled, a problem occurred with the following
message:

[    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000 (128 MB)
[    0.000000] crashkernel reserved: 0x0000000177e00000 - 0x0000000277e00000 (4096 MB)
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:779 __insert_resource+0x8e/0xd0
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc2-next-20230920 #1
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : __insert_resource+0x8e/0xd0
[    0.000000]  ra : insert_resource+0x28/0x4e
[    0.000000] epc : ffffffff80017344 ra : ffffffff8001742e sp : ffffffff81203db0
[    0.000000]  gp : ffffffff812ece98 tp : ffffffff8120dac0 t0 : ff600001f7ff2b00
[    0.000000]  t1 : 0000000000000000 t2 : 3428203030303030 s0 : ffffffff81203dc0
[    0.000000]  s1 : ffffffff81211e18 a0 : ffffffff81211e18 a1 : ffffffff81289380
[    0.000000]  a2 : 0000000277dfffff a3 : 0000000177e00000 a4 : 0000000177e00000
[    0.000000]  a5 : ffffffff81289380 a6 : 0000000277dfffff a7 : 0000000000000078
[    0.000000]  s2 : ffffffff81289380 s3 : ffffffff80a0bac8 s4 : ff600001f7ff2880
[    0.000000]  s5 : 0000000000000280 s6 : 8000000a00006800 s7 : 000000000000007f
[    0.000000]  s8 : 0000000080017038 s9 : 0000000080038ea0 s10: 0000000000000000
[    0.000000]  s11: 0000000000000000 t3 : ffffffff80a0bc00 t4 : ffffffff80a0bc00
[    0.000000]  t5 : ffffffff80a0bbd0 t6 : ffffffff80a0bc00
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[    0.000000] [<ffffffff80017344>] __insert_resource+0x8e/0xd0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Failed to add a Crash kernel resource at 177e00000

The crashkernel memory has been allocated successfully, whereas
it failed to insert into iomem_resource. This is due to the
unique reserving logic in risc-v arch specific code, i.e.
crashk_res/crashk_low_res will be added into iomem_resource
later in init_resources(), which is not aligned with current
unified reserving logic in reserve_crashkernel_generic()/
reserve_crashkernel_low().

Removing the arch specific code within #ifdef CONFIG_KEXEC_CORE
in init_resources() to fix above problem.

Fixes: 31549153088e ("riscv: kdump: use generic interface to simplify crashkernel reservation")
Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 arch/riscv/kernel/setup.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index e600aab116a4..aac853ae4eb7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -173,19 +173,6 @@ static void __init init_resources(void)
 	if (ret < 0)
 		goto error;
 
-#ifdef CONFIG_KEXEC_CORE
-	if (crashk_res.start != crashk_res.end) {
-		ret = add_resource(&iomem_resource, &crashk_res);
-		if (ret < 0)
-			goto error;
-	}
-	if (crashk_low_res.start != crashk_low_res.end) {
-		ret = add_resource(&iomem_resource, &crashk_low_res);
-		if (ret < 0)
-			goto error;
-	}
-#endif
-
 #ifdef CONFIG_CRASH_DUMP
 	if (elfcorehdr_size > 0) {
 		elfcorehdr_res.start = elfcorehdr_addr;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
