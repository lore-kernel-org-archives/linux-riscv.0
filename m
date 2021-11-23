Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1FDC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 01:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3Uz7JXcnAEj39p+itgVp7fXSGavDTfxQaVh6YzkRyI=; b=sTdEZJdfSvMTNm
	6XN3Cee8RVihrLGXYUVC8OJRnLffN/YVxk1cepi3L3uPf2viTqYe85ZD9Yk8r+XHQu0qEKF7c4EGa
	KrZcRAIF4Wf3SedKv+FQq5KbQ4A6Fii2iXauGY9lDxTBM7U6VNnnk5apGZq3+0MuezK/7Tl57rSbx
	L/GI2bkYtFR6Y69GWyLYXNDaxdvuHZjn22GK0PZm8c/FnZa/tdNYbTCrROslMP0wnxCmczFp2TVBA
	6kNy3Kmgs/Paj440S64UQBsPj8VeN0oIGVA+D9yv01JEOtG2yXMpQyeWl4uLnsovHmV0fDB2mkb3E
	rlzk18cXyWKtHmIMnVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpL42-000c0Q-SM; Tue, 23 Nov 2021 01:57:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpL3z-000byk-Np
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 01:57:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CCBD6109E;
 Tue, 23 Nov 2021 01:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637632659;
 bh=ZoaCHZIddZMnMBytdCkniWndd2x5DKoT53jTEzEace0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d2DWSzhFTZ/nRNq1/+ZNXmqr0Adm3HfxWsPsndo6EMq+kaS32yxy1SH/bIHVNy3fO
 aOdNG4Av9Z1hevUg5sx1zfWfSxYSQm0r+NPyL/jr7aadcoJ0DxeD++YhuwR7keegdf
 CE5BjmFz+i3q63wObnTfVSy1WqRH6ZfHxTq9HYRkw7sNFnY0QKPPw9cVKbSA/Odf9l
 O2F/dh2j6u2g1BHcwBajzqQ7cMpB4Qy3lSJ4+69EiY/qJ87skU8OUTHulVhP9ZxvhU
 d8PyoznPtKyMPTjU2gSbVTJgqUO2nq2jqRf64Vlb4kVkeMmkwIsLyYqoWtJLJF5BGs
 iYCAxkvNH0zoQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, palmer@dabbelt.com,
 atishp@rivosinc.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH 2/3] riscv: Add early_param to decrease firmware region
Date: Tue, 23 Nov 2021 09:57:16 +0800
Message-Id: <20211123015717.542631-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123015717.542631-1-guoren@kernel.org>
References: <20211123015717.542631-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_175739_834729_9D42813C 
X-CRM114-Status: GOOD (  11.14  )
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

Using riscv.fw_size in cmdline to tell the kernel what the
firmware (opensbi) size is. Then reserve the proper size of
firmware to save memory instead of the whole 2MB. It's helpful
to satisfy a small memory system (D1s/F133 from Allwinner).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/init.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 920e78f8c3e4..f7db6d40213d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -159,6 +159,15 @@ static int __init early_mem(char *p)
 }
 early_param("mem", early_mem);
 
+static phys_addr_t firmware_size __initdata;
+static int __init early_get_firmware_size(char *arg)
+{
+	firmware_size = memparse(arg, &arg);
+
+	return 0;
+}
+early_param("riscv.fwsz", early_get_firmware_size);
+
 static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
@@ -224,7 +233,10 @@ static void __init setup_bootmem(void)
 	/*
 	 * Reserve OpenSBI region and depends on PMP to deny accesses.
 	 */
-	memblock_reserve(__pa(PAGE_OFFSET), LOAD_OFFSET);
+	if (firmware_size > PAGE_SIZE)
+		memblock_reserve(__pa(PAGE_OFFSET), firmware_size);
+	else
+		memblock_reserve(__pa(PAGE_OFFSET), LOAD_OFFSET);
 
 	early_init_fdt_scan_reserved_mem();
 	dma_contiguous_reserve(dma32_phys_limit);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
