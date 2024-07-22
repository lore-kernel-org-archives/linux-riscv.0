Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A2BC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 03:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBDUkUDGrIl/1GQtWniYOkUmSTlJZs6zT0eH+VM1jP0=; b=aC0gvMymuGEDEv
	i5lHkEdfKTLAYdF222SV4RA5HaAMGqQaq4H1r1s1UYA+0b0vijOCTFywPtaA/UHNHfNRmPoAhDfEp
	TEiQNbW/PLUh7ZXZH0loCbVMX50bzqj9mTd1QaNudOMgtMiwR/JoDl4plcpdwa0ty1RINuZi02Hkb
	LP0DMJjSgBMTC3nL2hUw1dkRqAc0Nsp4+bqLFsrAcpVDVW/z7i0Z7oEb2sQmKV1zC4PLqkweaPZyw
	fkDvPZM6ug33bves3dt6E34+/XEF/1VFYkFV4Inkl87sszn8ahJzEVtjtmpgiHkg+zyzqSJAh972W
	l6SDEA/DZjGRnj5loWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVk6w-00000008FDs-1ZNp;
	Mon, 22 Jul 2024 03:53:18 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVk5u-00000008EnU-0dyV;
	Mon, 22 Jul 2024 03:52:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WS5pS4cxPz20krZ;
	Mon, 22 Jul 2024 11:48:00 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id DD5BE1A016C;
	Mon, 22 Jul 2024 11:52:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 22 Jul
 2024 11:52:07 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <deller@gmx.de>,
	<javierm@redhat.com>, <bhe@redhat.com>, <robh@kernel.org>,
	<alexghiti@rivosinc.com>, <bjorn@rivosinc.com>, <akpm@linux-foundation.org>,
	<namcao@linutronix.de>, <dawei.li@shingroup.cn>, <chenjiahao16@huawei.com>,
	<rppt@kernel.org>, <julian.stecklina@cyberus-technology.de>,
	<rafael.j.wysocki@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 2/3] ARM: Fix crash memory reserve exceed system memory bug
Date: Mon, 22 Jul 2024 11:57:00 +0800
Message-ID: <20240722035701.696874-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722035701.696874-1-ruanjinjie@huawei.com>
References: <20240722035701.696874-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_205214_375363_2E27E897 
X-CRM114-Status: GOOD (  12.97  )
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

Similar with x86_32, on Qemu vexpress-a9 with 1GB memory, the crash kernel
"crashkernel=4G" is ok as below:
	Reserving 4096MB of memory at 2432MB for crashkernel (System RAM: 1024MB)

The cause is that the crash_size is parsed and printed with "unsigned long
long" data type which is 8 bytes but allocated used with "phys_addr_t"
which is 4 bytes in memblock_phys_alloc_range().

Fix it by checking if the crash_size is greater than system RAM size and
warn out as parse_crashkernel_mem() do it if so as Baoquan suggested.

After this patch, it fails and there is no above confusing reserve
success info.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Baoquan He <bhe@redhat.com>
---
v4:
- Update the warn info to align with parse_crashkernel_mem().
- Rebased on the "ARM: Use generic interface to simplify crashkernel
  reservation" patch.
- Update the commit message.
v3:
- Handle the check in reserve_crashkernel() Baoquan suggested.
- Split x86_32 and arm32.
- Add Suggested-by.
- Drop the wrong fix tag.
v2:
- Also fix for x86_32.
- Update the fix method.
- Peel off the other two patches.
- Update the commit message.
---
 arch/arm/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index fc0ada003f6d..aea320dcac41 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1005,6 +1005,11 @@ static void __init arch_reserve_crashkernel(void)
 	if (ret || !crash_size)
 		return;
 
+	if (crash_size >= total_mem) {
+		pr_warn("Crashkernel: invalid size.");
+		return;
+	}
+
 	reserve_crashkernel_generic(boot_command_line, crash_size, crash_base, low_size, high);
 
 	if (arm_has_idmap_alias()) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
