Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC81C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OADF9ZQh3/VqNGDk369L0CmXA2andov75W1qgMLiDc=; b=V/VO6CajlCRqD1
	0DQM/1g5Ts2z8LSt23HuHZyXl4kWULPxbsYxF5JZI5I2zE3ilndyYux+r8WiC7wjirMNwf0vM0mEs
	dDJTx0gZ04qOxp8ScMkD+1/wcP5MrPcrBxXh6qjVtfzNLU+E25QiODdZVpb3pdtt7UIGnp0MextJ9
	RFLc7uK6PxjhX0FfmelIkmyTZlzFxX1G4Ar2rfr0VKM8w1l0KEIvcAeU6lUDoPs/87MaJigVfb8ZV
	vhWky+7nPpm15zEZL/CI/SS5BD/RF+Py8y443hA4TwDPAVCLJpqblnVV9CXFNbXXlwQTJzNN9W86n
	C2jIKCPuI2qAHjVViY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9E7-00000003eav-2e64;
	Thu, 07 Mar 2024 08:35:43 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9E4-00000003eYW-02e4
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 08:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709800540; x=1741336540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5KryanhO2TCSYIQImaXR38V4BObe+z/AOy3oiI3D08M=;
  b=FME5uagGse1FoU9KB81NMzNceBtS+ulTxukyKYbhyECd1gFtcwLQDmtm
   6xybdezP1yE90zDNBo3xAj8KDTTyS6KIg73CNi7P3PjntTK6aNsZxH3wK
   O9kPKGxA7F7KbDpuYLrFSIVevpv3Q3y+OnK1MySQdzR8T0qPvssWolzSz
   k5Xm8Evv2pdSdK7u7n+EyiPsMrPCh/N0I6jXAQXXV5SU4r1qiq1bTh3Cx
   FMTNUryDzhz+sBK9xZUgRtFOdsSZv/Up5fpwX8o3bNBpsyvZ+8PUTa8vk
   yrnUheDVACIJWmdXVNCdgr6imW8SqvtpvUyQz8jUNWKfBiv83QLqc8iW3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4600494"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4600494"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="14699744"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2024 00:35:30 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Subject: [PATCH v2 4/6] ACPI: NUMA: Make some NUMA related parse functions common
Date: Thu,  7 Mar 2024 16:47:56 +0800
Message-Id: <c8b86184d9e6d078e9b9949d4837bc6e392c3f52.1709780590.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709780590.git.haibo1.xu@intel.com>
References: <cover.1709780590.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_003540_427747_1D3C7D3B 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Zong Li <zong.li@sifive.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Dan Williams <dan.j.williams@intel.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The acpi_numa_slit_init(), acpi_numa_memory_affinity_init()
and acpi_parse_cfmws() functions are common enough to be used
on platforms that support ACPI_NUMA(x86/arm64/loongarch).
Remove the condition to avoid long defined(CONFIG_ARCH) check
when new platform(riscv) support was enabled.

Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 drivers/acpi/numa/srat.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 1946431c0eef..938c4adb7ec4 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -219,7 +219,6 @@ int __init srat_disabled(void)
 	return acpi_numa < 0;
 }
 
-#if defined(CONFIG_X86) || defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH)
 /*
  * Callback for SLIT parsing.  pxm_to_node() returns NUMA_NO_NODE for
  * I/O localities since SRAT does not list them.  I/O localities are
@@ -351,13 +350,6 @@ static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
 	(*fake_pxm)++;
 	return 0;
 }
-#else
-static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
-				   void *arg, const unsigned long table_end)
-{
-	return 0;
-}
-#endif /* defined(CONFIG_X86) || defined (CONFIG_ARM64) */
 
 static int __init acpi_parse_slit(struct acpi_table_header *table)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
