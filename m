Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6871CA5FE8
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6ZMJytiawtVmFldwbZLt45p2X2AZJE3kar6Fc1RfWQ=; b=GzBfumR+2lhy0V
	KKGlrRXhagRv3G9o61xwUYyft2Qb4n8UOr9IGaRtNGhPrc0746s+gknkmyTxw0F+THS7vRrP/KVXQ
	hiZjuKscvjXlFvzmaPEHoqWKxN4k/E3hMqg0ps6ATKcrkEwocpvaf8NSdGP913duGsXKFHQRkzGsb
	ceODGIfhP/h82JmFCRW90Qb5MivdEpl8cjc0IKWfR4jB0lg3+HGgBObxjqS/44EQMdV2GfwXRuExY
	/45PnffuuECDI0qnKCkz0JqIWSOwtXN5c8/Zz0RqiSVyGCyZxt/Lq/Sp88Xb9H4yJHQo9QmGWtxVN
	BbepvzUG7de50qAZeYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtx5-0000000D6v6-476m;
	Sat, 03 Oct 2026 07:14:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtx4-0000000D6ub-0JaC
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 07:14:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A15D843AE3;
	Sat,  3 Oct 2026 07:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172F51F008A5;
	Sat,  3 Oct 2026 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791011673;
	bh=VwFWqOZ4pOlB2wwYmiolP3Sp+mnMbUJd9qfFhnZEqBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dxjihH8YhmXndBsHa6WSbRAOzLewMtMBx1Xzaab+9kNBnqpfpa8BrgAL5BTczKs8c
	 1dD0V8rny1BGivt+v8X1H9/Dyv6pKjHyCD9A4+/6Ce55r+4PXoy9Zn1++MgOQm28gJ
	 qPxxj4Hu5TwfMY0AkO46xVhXYAIoTBi9wmQo0GXxRTgFWEolepLY7ECM61PDHtNXxo
	 xX5/GV+dvnurJiZGBGYGKa6YpNrs4gu+ZPTnXQ/IccZ1tDwTGEdRkcrUvE6cX/jHNS
	 UoHflf5tpIpcz7MuyIGE9SSZsZzozb4yr4V212/v0Mu9lTeqOdD2HyRJW22T2Mxbye
	 XcQmoy9HF3oLw==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 03 Oct 2026 00:12:28 -0700
Subject: [PATCH v9 3/5] riscv_cbqri: Make RESCTRL_FS available on RISC-V
MIME-Version: 1.0
Message-Id: <20261003-dfustini-atl-sc-cbqri-dt-v9-3-52fd8be98dcf@kernel.org>
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
In-Reply-To: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=fustini@kernel.org;
 h=from:subject:message-id; bh=8So6ccZldy4L/KcTgwkLAjT7RYXgfaYjoD+/1AtBKIE=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQdWB1m/+xdX4Fpjfi/8iOygeb+Am8F3b6pT+/0CqsXy
 0/9483SUcrCIMbFICumyLLpQ96FJV6hXxfMf7ENZg4rE8gQBi5OAZgIvwHDP6P1AkpcFYeafJh7
 eRSnMqusK3hfxN/COr3ablVc4jGfKEaG7YnfjqsFzmL/ciOa87TaURmmpb4x3tJJJjuPLUrxZL3
 NAgA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

Enough CBQRI support is now present to enable ARCH_HAS_CPU_RESCTRL.
Have RISCV_CBQRI select it so that RESCTRL_FS can be enabled on
RISC-V, and default RISCV_CBQRI to y. RISCV_ISA_SSQOSID is default n,
so this only affects kernels where the user has already opted into
Ssqosid, and on those the CBQRI support is what makes the extension
useful.

This is a separate patch so that no commit makes RESCTRL_FS selectable
before the resctrl glue it depends on exists. Enabling the resctrl
filesystem itself stays a user choice under MISC_FILESYSTEMS.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index cac23d20124b..617b813b9808 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -33,6 +33,8 @@ config ARM64_MPAM_RESCTRL_FS
 menuconfig RISCV_CBQRI
 	bool "RISC-V CBQRI support"
 	depends on RISCV && RISCV_ISA_SSQOSID
+	select ARCH_HAS_CPU_RESCTRL
+	default y
 	help
 	  Capacity and Bandwidth QoS Register Interface (CBQRI) support for
 	  RISC-V cache QoS resources. CBQRI exposes cache capacity

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
