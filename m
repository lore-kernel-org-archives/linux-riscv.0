Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B855C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fp7uubshvSslnTQpp8/148MTf8ROQqwsl6/u+jMCNc=; b=1J7LsmYpj1oeyL
	PURsDCjT+cGFn1CUDvixZNrEaVGS7YsM6h8l0c2ms6AUKKqpEyyyeuaO42bFeWDj1YGdzqTJ4XVlk
	UrzZrbzaeZLBDZlSGhuwynut36VL1jDZon9KPUAFroucUj1F8vRjWLzICxsGxoAgwaSEA/lscyyyn
	s0XjJAylxQ3yAHB6drOBRbW/lw/dT2xNzuLt7pir9+WEf58q3TLI/iuTjbInlpoUcwpVA1+uuWHcW
	SWTXudkCKFLdtWHu6Lvcy2Oojk8/us2t+hIbq5f1Yo8QWjmj/ydu9FaHuAM+tosCBZesCVixKUh8U
	hMM67rlsCGEx7xYqxGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdRv-00HRgk-1p; Tue, 05 Apr 2022 07:17:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdOP-00HPJA-16; Tue, 05 Apr 2022 07:14:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B55A2B818F6;
 Tue,  5 Apr 2022 07:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6E4C34112;
 Tue,  5 Apr 2022 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649142858;
 bh=i7PzdXl6Dn+FdofUFi023qh/x+M4yzmCIkQuIb/yw0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJCIg9dymp/i3aYY8UDGKP6XwUMI28CDXVTTuITqtu219zO0Lxn23mDuhegiJzT9o
 6VoKVF8iGni6jpWF9GRDjJb6aoZw7Gc/Jzm7gD+EMaiYqASXVyeql+u4JQJGgPbkVQ
 m7RkMxlBkVTY071Sdi1zkDXSUPfpbycxNWKkl6WEqcwIXzGXqsdeelojFAlyNKiEtz
 KTL5O27JfICsO8FoUskCgR/ON5gA0/y/3OdDj2cV9WGlC2p6ME2xqLYnFS8tNl1NvT
 Ghp1FSuIuHRSTQmgQJLxPrkjcZZIOacuzpf592EwBhj7o7JasfnhZ0w2Y4fo75Fa8X
 muA3+K2dMOUhQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de, nathan@kernel.org,
 naresh.kamboju@linaro.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, heiko@sntech.de,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 08/20] riscv: Fixup difference with defconfig
Date: Tue,  5 Apr 2022 15:13:02 +0800
Message-Id: <20220405071314.3225832-9-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405071314.3225832-1-guoren@kernel.org>
References: <20220405071314.3225832-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_001421_316763_5D16A336 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Let's follow the origin patch's spirit:

The only difference between rv32_defconfig and defconfig is that
rv32_defconfig has  CONFIG_ARCH_RV32I=y.

This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.

Fixes: 1b937e8faa87ccfb ("RISC-V: Add separate defconfig for 32bit systems")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..c6ca1b9cbf71 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -154,3 +154,7 @@ PHONY += rv64_randconfig
 rv64_randconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
 		-f $(srctree)/Makefile randconfig
+
+PHONY += rv32_defconfig
+rv32_defconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 32-bit.config
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
