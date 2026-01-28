Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49539D46BFC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnUyx/2H2B4Y3558ETHQAcBO5KoK9240hUAVd6qsqDc=; b=rEHj8oyKbqhQRI
	vfZ+/GA5ALv0k2trKvze0qp0y7wVVbPVniN/LYFRrZMoHnmJ6N0sVBA56xEqGYsLp/Ngo9iMRmy/9
	Vl1MKzee52oN8pWFIkIVIFJmvBqG4tQjHUKZF0qn4ht+O3H1ktSQ9F8mOQ9wh8yAnNRKi4H+y9Gg9
	DNt2A7o5bH60Y7U9KHCysw0Ro4hTm59vFLTs/Ge9mewEQpSy8o0YePv0lNwm87wzsW5FsOpltHMqU
	nng8M0iHZZnadleZkqaLfif/A4Fpwly+TrT55ywWnsNb5VxcYcfCi97drbewOnMUZbYdcshVtST9V
	YW42IGNwDbU9t5odLY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9M-0000000GkHS-2S4J;
	Wed, 28 Jan 2026 20:28:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC94-0000000Gk0f-1ZKT
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D3EC44518;
	Wed, 28 Jan 2026 20:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CBDC4CEF7;
	Wed, 28 Jan 2026 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632089;
	bh=uFVTMJOPvCbobzJzlLLOywkmk/8YKf9YQOLxRrQYfB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SPPkuaDgcf/BvE0ZirdITV/+1qku/YWxWJrcZ7ODvLUS+ziSK4eRpeoN86oXxrxuv
	 hUvJXiPJxwfGoTMU0NrA9PBme53oM2P2Sj6j1PaiS6oswVMgqPaM7ar14rupJk7RS+
	 y7dy/w7147MJX6/d/q2MSnxv6lbmHrxq2CrY+z0HD4qqVimIX0qfXJPLrGkWF/tFFf
	 8eS0as/v5sXvgIbi7yvdz8ZCsjgEE9UaG0p1/X1UPeG9R+rfaRfRBmq6CNH2pEMOSr
	 D9B6nWgJcxjT1Y/KR3UEctH0ei3I6OlLCsQ1wjBC+x7S0dkJmjko4uI2ZRKXEvb3l3
	 pasmzSX/29q9A==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:33 -0800
Subject: [PATCH RFC v2 12/17] RISC-V: QoS: make CONFIG_RISCV_ISA_SSQOSID
 select resctrl
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-12-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=fustini@kernel.org;
 h=from:subject:message-id; bh=uFVTMJOPvCbobzJzlLLOywkmk/8YKf9YQOLxRrQYfB8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQa2ul2WMDnBtvGQZY1t1YQ7obmFv5+eiOHI/h1rK
 8Wc0xvWUcrCIMbFICumyLLpQ96FJV6hXxfMf7ENZg4rE8gQBi5OAZjI93kM/+N8ns6Zv2thVmVO
 yi7r27o1X99LPIiWES0WtvNoy9xWEMjwV+yvzak3rAYW8vzctWWPJRSmX6g4l/X6hLDfNpV5+h5
 izAA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122810_454772_1A57C753 
X-CRM114-Status: UNSURE (   7.24  )
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

Make CONFIG_RISCV_ISA_SSQOSID select the config options for resctrl:
ARCH_HAS_CPU_RESCTRL, RESCTRL_FS and MISC_FILESYSTEMS.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 35a6238b02c5..8ff6d962b6b2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -598,6 +598,9 @@ config RISCV_ISA_SVNAPOT
 config RISCV_ISA_SSQOSID
 	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
 	default y
+	select ARCH_HAS_CPU_RESCTRL
+	select RESCTRL_FS
+	select MISC_FILESYSTEMS
 	help
 	  Adds support for the Ssqosid ISA extension (Supervisor-mode
 	  Quality of Service ID).

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
