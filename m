Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81F3C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8124B60F02
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8124B60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsRU+Gh0lMB8qbpLIzPRQMgxiujJyiYJZ/fs+go+r3o=; b=PqF2GZ9+47b/Lm
	CSdLnRfL6nMm8orhFysPC4wNxAyaeJL0roNfuaOmd1OUcRcGrvnVcB2kMisnvvpzD058v2VzGAoA2
	UEG6hrhWrvxy9OTDFuKSHZht3KLH8eINsud+OciLZI0W9UHf8azJ9EqlunxUaVT2F5wQa46bQxJnT
	G5EoSIi3SxCanLisxA6t361bNTelwOpaV/DzCqyzIt39z9RxekyXK4hcWLE3AHs95JeurWdMOTuCm
	/9ZvGTNJ55ASQ3kwk3zrU9b4qTRq/AfDEyYvxNiEFhdP9vklPlH1nWx7vNhyJINx8wsf6crU6dMso
	4eUPyM+ODhkI49XZJptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgerp-00Cg0m-1o; Sat, 30 Oct 2021 03:17:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgerf-00CfvM-Fz; Sat, 30 Oct 2021 03:17:05 +0000
Received: from dggeme706-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hh48k51ctzbcxG;
 Sat, 30 Oct 2021 11:12:06 +0800 (CST)
Received: from huawei.com (10.67.174.53) by dggeme706-chm.china.huawei.com
 (10.1.199.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Sat, 30
 Oct 2021 11:16:47 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <ebiederm@xmission.com>, <mick@ics.forth.gr>, <jszhang@kernel.org>,
 <guoren@linux.alibaba.com>, <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>, <changbin.du@intel.com>, <alex@ghiti.fr>
CC: <liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>
Subject: [PATCH 2/3] RISC-V: use memcpy for kexec_file mode
Date: Sat, 30 Oct 2021 11:18:31 +0800
Message-ID: <20211030031832.165457-3-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211030031832.165457-1-liaochang1@huawei.com>
References: <20211030031832.165457-1-liaochang1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme706-chm.china.huawei.com (10.1.199.102)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_201703_838960_161A8B07 
X-CRM114-Status: GOOD (  11.13  )
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

The pointer to buffer loading kernel binaries is in kernel space for
kexec_fil mode, When copy_from_user copies data from pointer to a block
of memory, it checkes that the pointer is in the user space range, on
RISCV-V that is:

static inline bool __access_ok(unsigned long addr, unsigned long size)
{
	return size <= TASK_SIZE && addr <= TASK_SIZE - size;
}

and TASK_SIZE is 0x4000000000 for 64-bits, which now causes
copy_from_user to reject the access of the field 'buf' of struct
kexec_segment that is in range [CONFIG_PAGE_OFFSET - VMALLOC_SIZE,
CONFIG_PAGE_OFFSET), is invalid user space pointer.

This patch fixes this issue by skipping access_ok(), use mempcy() instead.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/kernel/machine_kexec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index e6eca271a4d6..4a5db856919b 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -65,7 +65,9 @@ machine_kexec_prepare(struct kimage *image)
 		if (image->segment[i].memsz <= sizeof(fdt))
 			continue;
 
-		if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
+		if (image->file_mode)
+			memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
+		else if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
 			continue;
 
 		if (fdt_check_header(&fdt))
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
