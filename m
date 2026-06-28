Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5DDC43638
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HipfYlAxvhcnFboLFEND9JfbYCa1pnsglLIrbw4hFkI=; b=dMiEYFiMmJB+dN
	MggVMfz3pemyaScPHC82MS8jUlcuhX764pJaD32pE5vuHLiINbh/6/C389BInFbxHRFZtByNiED/5
	r5lUFGH6Ja3NKJmtXQe4RAutdVZAo+Z2TjgEPDUAsUyBmi07B/zwMI7eHJu3JEiwogfTwyzT3JT7Q
	MIsZ/lPy9NzMGcFp8EdqoP8JBEWsHu/+C5w8V2AnjnogN0zqYMJgXBoMzhKeV3g6fhYaeYHO0NL6c
	DHXOQ6taeqLvkjB/+PUwPgh7BjN1Fi+HQzJmv6LlhfcNDcyU0ZAGRC3VhQfpx0+oRc3OCMvNbkgBv
	JOGTdIRAlP2jJWaU29Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwtw-0000000DOkL-26Tr;
	Sun, 28 Jun 2026 21:18:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwtt-0000000DOi1-1aAA
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 21:18:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F9D260137;
	Sun, 28 Jun 2026 21:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F5E1F00ADB;
	Sun, 28 Jun 2026 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782681528;
	bh=+tvwm90MVOaOiG5wcpHdQz/SS/6LBEj1aYW9iza5lLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hA6ftf0jcJ3EAIVXQ14i2lM/eIrMinPZtx1uZVursU7JGubnsp3fIQ0a0EYKr3fg1
	 MVgZQebrJQuPaVNkRKiNfBLjYzwhTrUkbn6XUpiaTrOQWfX6C7AKy4NFjO4RlGQP8p
	 /f/ZZ4laQlVnVrWeEBYMs/RkEmF+cQfkWXCOohIK3OCSLFEuX56skZ7jh+En6HHDF8
	 +RLlDI+ti3yDZavt7CAqepbJvptY5Z/ifzSf3Rg/VqEgsFVaZ6bXGXb9UTbYvR2dyS
	 26+cndilFRjBP0OWrvC6q0orVVOsZA0xn2I78LpuhH+v7AGeitwFzA6PZu70g9eNMC
	 2WfagiF0NmfrA==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 28 Jun 2026 14:18:17 -0700
Subject: [PATCH v3 6/8] riscv: Enable resctrl filesystem for Ssqosid
MIME-Version: 1.0
Message-Id: <20260628-dfustini-atl-sc-cbqri-dt-v3-6-c9c1342fe3cf@kernel.org>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
In-Reply-To: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
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
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=fustini@kernel.org;
 h=from:subject:message-id; bh=gXhxU2VkYK59yFf9zOY6NFxDAzyh840CJktrIQQQrQU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQ59m/eeKJETWrxFr11z9c+UE2anzJH9bfca4Z5Jzf9N
 XhRIJFV0VHKwiDGxSArpsiy6UPehSVeoV8XzH+xDWYOKxPIEAYuTgGYyISjjAx9rocY3hxNdBN9
 cKd55YODQaG2aWt9GD89Y+wPnL/LeYkuI0PXBF2/oqL7ju2F0bZH6tafzv2fYTr/wRaV76ExJ7d
 l1HMCAA==
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

RISCV_ISA_SSQOSID selects ARCH_HAS_CPU_RESCTRL and RISCV_CBQRI
unconditionally. ARCH_HAS_CPU_RESCTRL makes RESCTRL_FS available on
RISC-V, and RISCV_CBQRI builds the CBQRI core that backs it.

The resctrl filesystem integration is gated separately by
RISCV_CBQRI_RESCTRL_FS, a silent option that defaults to y when both
RISCV_CBQRI and RESCTRL_FS are enabled. Enabling the resctrl filesystem
itself stays a user choice via the standard fs/Kconfig MISC_FILESYSTEMS
menu.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ee586925f972..9c28bcbc29dc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -594,6 +594,8 @@ config RISCV_ISA_SSQOSID
 	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
 	depends on 64BIT
 	default n
+	select ARCH_HAS_CPU_RESCTRL
+	select RISCV_CBQRI
 	help
 	  Adds support for the Ssqosid ISA extension (Supervisor-mode
 	  Quality of Service ID).

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
