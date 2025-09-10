Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5FCCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQdPEQ2+Zt6MARJZNzilIkq2n2P3YBb5Wk0C/X7DreU=; b=0RFNcPJiyaGUzO
	7Xj2xOZJdogo8iTAtpNA429/4RdQ8OdZdm99H64TO+ZxaFfYzWK8AuQUxIAjlOsSdaKe++uqh4dNT
	sA0zi32Op4gfcP/eB2Tcut3TCaUB6mpY0knEeHeDDZEsK1JkyZJAW8ZTcwkqdEvhcvu+nnahHlp5o
	kif+B5t+Ln5cQfdCXnZV7YjKvCDEegUwn0AaaTKJVlgp8r6xGl0ZK797xPJQeA1ZkpiayM51BypLx
	ERqLgW3cdF34MozoHIdbNFYtJSIKGIx4xR+eT8iLqaqYyox117lKxidU/I2YMhv60MitMXYDCj/XI
	LjBnThV4R60a54z4aSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDK-0000000DEzZ-1MMI;
	Wed, 10 Sep 2025 09:34:06 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDF-0000000DEw1-2u3J
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 09:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757496837; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=CkbLKay4KW6gGBpr5vlMMMrvH8ODs320iGf0xAuSytA=;
	b=bS4ZskhUIoMWdABONmhGdNOClVMn4KKWzS0XzjgIFrcerC+M7s/CZO6vSXvVysq9W4fZYKJXGUPFMw+3JJ4elRAXZqENBoVbQ7u2V1i/1lw+XdRVC+MiF7bouVFmP4j4qfd978bf0iOP1pa96dM6iRYIkADqu0GmbyEjCYy/0Rw=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WnhhBo9_1757496834 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 17:33:56 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: xueshuai@linux.alibaba.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: james.morse@arm.com,
	tony.luck@intel.com,
	cleger@rivosinc.com,
	hchauhan@ventanamicro.com,
	tianruidong@linux.alibaba.com
Subject: [RFC PATCH 1/5] riscv: Define ioremap_cache for RISC-V
Date: Wed, 10 Sep 2025 17:33:43 +0800
Message-Id: <20250910093347.75822-2-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
References: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_023402_174018_509B118C 
X-CRM114-Status: UNSURE (   7.34  )
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

From: Himanshu Chauhan <hchauhan@ventanamicro.com>

bert and einj drivers use ioremap_cache for mapping entries
but ioremap_cache is not defined for RISC-V.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/io.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index a0e51840b9db..56eca6b3031f 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -30,6 +30,9 @@
 #define PCI_IOBASE		((void __iomem *)PCI_IO_START)
 #endif /* CONFIG_MMU */
 
+#define ioremap_cache(addr, size)					\
+	((__force void *)ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL)))
+
 /*
  * Emulation routines for the port-mapped IO space used by some PCI drivers.
  * These are defined as being "fully synchronous", but also "not guaranteed to
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
