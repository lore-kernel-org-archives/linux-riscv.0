Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E8BC54E49
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhpyFCSimh37BNz0B3gCynUkYs16oNzlJ0TNBDmJVow=; b=YXCPw7jU9XM+JV
	Gz7QJ+E3gyU/atk3QyY4rZHV8AjX3XJT2CK8HhKUEl9FVNtQryyPRIN+04ekLjyoHcwTTuq3K62CY
	TN/wnfoe+s20ld1O5C05nHklvfJ3Ojzu5IBH3A9wMwzvn8V9HMnxnFiji7RUB3R9X7pQ9AUD/lRT7
	5UcAl6WiKRETiQvGAaDF6HtLAhTb6nkZpTH6FUV8OKqW/t3nu9vjifgJ0ngOAB+iAUso6rLEaBLka
	XCi8GZG4iwLAg8+ztT99BnHAH36xLm/Za7ixInJ8dJBAp3i/ZMQmB2TCyfOaDtSbCX10J7pd07NfF
	bDgkLfBHMoocBV4cLtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9Ei-00000003ez5-2HZF;
	Thu, 07 Mar 2024 08:36:20 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9Ee-00000003ewD-2d2u
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 08:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709800577; x=1741336577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u6KLTZtmTIu5DykU16R/5uPB7IyWMKQDWEnAzeiRdU8=;
  b=Jk4CwirGcOrTGxwCRxOnHVewOY48k+K1y/9LtKipoS8R9+6L1Ph0btlm
   RySYvV43aIptACLYTmLrfbhbfYXlkhUsk75anJD/PtQQSYv6LJfE9wFPD
   xZjFi1FfDGiuD5qMC1YnntjN+hkWQB5NXjV43EDlT+p5EzmtFzXGAq0ny
   eH4+Z66j7nM0XfFimD9mLCnQAC/5lmJpsKFSGXUFA2Ksmh3z52JC1sFJ8
   aMfd+kacuwL1znBijGWPqZ7TIWlaooseJWLRjyZM7aIyuHbDVAr4IcGvN
   IRwdYJ1KgVeymAiMu2EPM3H4r2oJFIwthYmn1WCrN5fDCftmAs8IOtZqR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4600559"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4600559"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="14699817"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2024 00:36:06 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Subject: [PATCH v2 6/6] ACPI: RISCV: Enable ACPI based NUMA
Date: Thu,  7 Mar 2024 16:47:58 +0800
Message-Id: <01cb5780041565784d459cd94a5c4f55eaa87739.1709780590.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709780590.git.haibo1.xu@intel.com>
References: <cover.1709780590.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_003616_829394_3324D9F0 
X-CRM114-Status: UNSURE (   7.53  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Jisheng Zhang <jszhang@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable ACPI based NUMA for RISCV in Kconfig.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0bfcfec67ed5..0fb55f166701 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -447,6 +447,7 @@ config NUMA
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select ACPI_NUMA if ACPI
 	select OF_NUMA
 	select USE_PERCPU_NUMA_NODE_ID
 	help
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
