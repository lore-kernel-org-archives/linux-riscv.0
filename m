Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DDEEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tDE3E5cF5pQDsYTlEyu/yI0w8NsXGQrDVHX4e5XtfZg=; b=j5MWmPf4a+l10y
	OR9HRxW/xOQK7Kh+N2KwkhFRl17hm4xSWYR0mouV0m12cHHgMwgt4Yv90UFG83FV3TFXGOdah/Sd2
	4vhO6LXENolbvgrlYDca4YJbm0Y1HwYqPKl/Qx5/30ki1JFYSHJ2n17bZysvOOLL9S1P8rXYrXJ1Z
	zz2xI6U5aN9gQ1DO1pRDi1aQU8S2uEOG275Cfvk/Zhdbwd19DX0KJ4F7wllFM67x2ghBAmYobyLM/
	6YyjBiAeTctPDkVWlXb7z9buW1ET8qktrWqVVZaIwydVsM7HJ/dwS3ktq2SdlfyPTGSuWVdp64Wx8
	No14wXBJBCgBuM4UKB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmtX-000MFh-0l;
	Thu, 29 Jun 2023 08:20:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmtU-000MF3-2r
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:20:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5EB5F614F4;
	Thu, 29 Jun 2023 08:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53985C433C0;
	Thu, 29 Jun 2023 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688026847;
	bh=eix3asqgstSKaRDosqnGq1xt2TLM2YGz1j/+D6LUbUw=;
	h=From:To:Cc:Subject:Date:From;
	b=Li0ft4GpCx4QdjFx8Bu0MQQmbfINFOTqPW1UsMc2jx6iV2r5mI+jgoR1BT03Ekiv/
	 rNAh00T4LGxnPFaYaFYEJUeYMpjSkM5eX2vu5W5RYeqDDNG1/Nwsmts9edq2mbUxik
	 2uGZJVbqK6FnUezh+J1lnsFy8p8nF1VXy67qHcTGIT5vX6x04UmwLVNE5klSIvdTgS
	 Jh+kWdtbvGhEfTkZeUOBpuAJkliug8/4V1T5aYfNC4MlsAPttJU9rx5yNjIfFO/6K0
	 FPky9KXaVEq7VJgeg0KfUuKVP77C0qgeTgSoy67ARCVZPu84Qz8U3d4utxOdoV9n2t
	 nWYqdv2ygrGxg==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.co,
	zong.li@sifive.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	jszhang@kernel.org,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: pageattr: Fixup synchronization problem between init_mm and active_mm
Date: Thu, 29 Jun 2023 04:20:32 -0400
Message-Id: <20230629082032.3481237-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_012049_008545_4443B28A 
X-CRM114-Status: GOOD (  12.09  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The machine_kexec() uses set_memory_x to add the executable attribute to the
page table entry of control_code_buffer. It only modifies the init_mm but not
the current->active_mm. The current kexec process won't use init_mm directly,
and it depends on minor_pagefault, which is removed by commit 7d3332be011e4
("riscv: mm: Pre-allocate PGD entries for vmalloc/modules area") of 64BIT. So,
when it met pud mapping on an MMU_SV39 machine, it caused the following:

 kexec_core: Starting new kernel
 Will call new kernel at 00300000 from hart id 0
 FDT image at 747c7000
 Bye...
 Unable to handle kernel paging request at virtual address ffffffda23b0d000
 Oops [#1]
 Modules linked in:
 CPU: 0 PID: 53 Comm: uinit Not tainted 6.4.0-rc6 #15
 Hardware name: Sophgo Mango (DT)
 epc : 0xffffffda23b0d000
  ra : machine_kexec+0xa6/0xb0
 epc : ffffffda23b0d000 ra : ffffffff80008272 sp : ffffffc80c173d10
  gp : ffffffff8150e1e0 tp : ffffffd9073d2c40 t0 : 0000000000000000
  t1 : 0000000000000042 t2 : 6567616d69205444 s0 : ffffffc80c173d50
  s1 : ffffffd9076c4800 a0 : ffffffd9076c4800 a1 : 0000000000300000
  a2 : 00000000747c7000 a3 : 0000000000000000 a4 : ffffffd800000000
  a5 : 0000000000000000 a6 : ffffffd903619c40 a7 : ffffffffffffffff
  s2 : ffffffda23b0d000 s3 : 0000000000300000 s4 : 00000000747c7000
  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
  s11: 0000003f940001a0 t3 : ffffffff815351af t4 : ffffffff815351af
  t5 : ffffffff815351b0 t6 : ffffffc80c173b50
 status: 0000000200000100 badaddr: ffffffda23b0d000 cause: 000000000000000c

Yes, Using set_memory_x API after boot has the limitation, and at least we
should synchronize the current->active_mm to fix the problem.

Fixes: d3ab332a5021 ("riscv: add ARCH_HAS_SET_MEMORY support")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/mm/pageattr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index ea3d61de065b..23d169c4ee81 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -123,6 +123,13 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 				     &masks);
 	mmap_write_unlock(&init_mm);
 
+	if (current->active_mm != &init_mm) {
+		mmap_write_lock(current->active_mm);
+		ret =  walk_page_range_novma(current->active_mm, start, end,
+					     &pageattr_ops, NULL, &masks);
+		mmap_write_unlock(current->active_mm);
+	}
+
 	flush_tlb_kernel_range(start, end);
 
 	return ret;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
