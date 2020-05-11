Return-Path: <SRS0=qmG6=6Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1778C38A2A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 02:23:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DCC206D7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 02:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lEWPW2HS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64DCC206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NpkFR3ZboZJvHN9abGcu2t8nSf6ftBXsP6SnQh7Y/E=; b=lEWPW2HSybm5t3
	qEi1+H5K027Od6AvGccxqRDiFs6aj0Dy815a79SmDVFLD5wjOq1IQUdJF19xKir7QnbPGB1fo9nvW
	dsi8JR+GUbmbtLP9WDJKMWG0toEgYBrJsnrNufcHnHeHLj1l92l0n6/8NUMtArxpqU1Lr0MsiXDAH
	vaFRw+ExPlAu5HFZNpe+/JIacSF4lINIqZpojeWF+MafXlx8WclcgYd1jmc7NDTtfV8yu5Q4I4LL8
	+KvuPONQwzfIvAIEaSAbvoCSnapg4Ij3mKVi2n3UEuvp/Qr50zxdx+UOzx5La+kmS1z8N7ss6ra7S
	yJvOMLn9UlDiYSO0GaoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXy6j-0003u5-L0; Mon, 11 May 2020 02:23:53 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXy6Z-0003iy-Df
 for linux-riscv@lists.infradead.org; Mon, 11 May 2020 02:23:45 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 19131B6D5A615D7DDB22;
 Mon, 11 May 2020 10:17:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 11 May 2020 10:17:08 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 10/10] riscv: mmiowb: Fix implicit declaration of function
 'smp_processor_id'
Date: Mon, 11 May 2020 10:20:01 +0800
Message-ID: <20200511022001.179767-11-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511022001.179767-1-wangkefeng.wang@huawei.com>
References: <20200511022001.179767-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_192343_626297_2D879965 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Hulk Robot <hulkci@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In file included from ./../include/linux/compiler_types.h:68,
                 from <command-line>:
../include/asm-generic/mmiowb.h: In function ‘mmiowb_set_pending’:
../include/asm-generic/percpu.h:34:38: error: implicit declaration of function ‘smp_processor_id’; did you mean ‘raw_smp_processor_id’? [-Werror=implicit-function-declaration]
 #define my_cpu_offset per_cpu_offset(smp_processor_id())
                                      ^~~~~~~~~~~~~~~~
../include/linux/compiler-gcc.h:58:26: note: in definition of macro ‘RELOC_HIDE’
  (typeof(ptr)) (__ptr + (off));     \
                          ^~~
../include/linux/percpu-defs.h:249:2: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  SHIFT_PERCPU_PTR(ptr, my_cpu_offset);    \
  ^~~~~~~~~~~~~~~~
../include/asm-generic/percpu.h:34:23: note: in expansion of macro ‘per_cpu_offset’
 #define my_cpu_offset per_cpu_offset(smp_processor_id())
                       ^~~~~~~~~~~~~~
../include/linux/percpu-defs.h:249:24: note: in expansion of macro ‘my_cpu_offset’
  SHIFT_PERCPU_PTR(ptr, my_cpu_offset);    \
                        ^~~~~~~~~~~~~
../include/asm-generic/mmiowb.h:30:26: note: in expansion of macro ‘this_cpu_ptr’
 #define __mmiowb_state() this_cpu_ptr(&__mmiowb_state)
                          ^~~~~~~~~~~~
../include/asm-generic/mmiowb.h:37:28: note: in expansion of macro ‘__mmiowb_state’
  struct mmiowb_state *ms = __mmiowb_state();
                            ^~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/mmiowb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/mmiowb.h b/arch/riscv/include/asm/mmiowb.h
index bb4091ff4a21..0b2333e71fdc 100644
--- a/arch/riscv/include/asm/mmiowb.h
+++ b/arch/riscv/include/asm/mmiowb.h
@@ -9,6 +9,7 @@
  */
 #define mmiowb()	__asm__ __volatile__ ("fence o,w" : : : "memory");
 
+#include <linux/smp.h>
 #include <asm-generic/mmiowb.h>
 
 #endif	/* _ASM_RISCV_MMIOWB_H */
-- 
2.26.2


