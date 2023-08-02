Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45EAC001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 06:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d3QeS1t1Wt1I5K54rW4u9GayutdxvR2ESilD4ahWWP4=; b=pNfn3F88NKiqaG
	R2SGiseeb7OhSwwolV9exvl0eyDoqc+ovnBHJK2M42uKjP5Jm6EfAoimxuu+gD7kDfYfBv+vLBjo8
	A5MDvx9Q8/Iq1Mx99KDaluHjJl+OSXvcyaWXeNSt8iFtcXldpTkTqqYy46DpnIwjnvx2+k7lp6raU
	wV+TticMUwNb3appDL/676ba48Wrgu41gGmglfczsi4C/K9E9q3kIj/Bae3GxaukiODeD0x8wcUtW
	G7h/mgA3F0GbDPkLF9ZL52blaQVqzVV8brhxgytX/Q7IR/bpwGu4Skd6tAEQKbHFZ+i7TXyp3p6Nh
	XdK0Gy75rGZaMDBkBBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR5Zs-004A8u-1p;
	Wed, 02 Aug 2023 06:43:24 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR5Zp-004A5M-0W
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 06:43:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4745B24E248;
	Wed,  2 Aug 2023 14:42:17 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 14:42:17 +0800
Received: from ubuntu.localdomain (183.27.98.54) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 14:42:16 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Dao Lu <daolu@rivosinc.com>, "Heiko
 Stuebner" <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Minda
 Chen" <minda.chen@starfivetech.com>
Subject: [PATCH v1] riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace zihintpause
Date: Wed, 2 Aug 2023 14:42:15 +0800
Message-ID: <20230802064215.31111-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_234321_363966_699EEAD0 
X-CRM114-Status: GOOD (  10.98  )
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

Actually it is a part of Conor's
commit aae538cd03bc ("riscv: fix detection of toolchain
Zihintpause support").
It is looks like a merge issue. Samuel's
commit 0b1d60d6dd9e ("riscv: Fix build with
CONFIG_CC_OPTIMIZE_FOR_SIZE=y") do not base on Conor's commit and
revert to __riscv_zihintpause. So this patch can fix it.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 arch/riscv/include/asm/vdso/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index 14f5d27783b8..96b65a5396df 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -14,7 +14,7 @@ static inline void cpu_relax(void)
 	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
 #endif
 
-#ifdef __riscv_zihintpause
+#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
 	/*
 	 * Reduce instruction retirement.
 	 * This assumes the PC changes.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
