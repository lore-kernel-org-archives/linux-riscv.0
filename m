Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98434D2ED13
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnUyx/2H2B4Y3558ETHQAcBO5KoK9240hUAVd6qsqDc=; b=t+9hcAKaUjte0U
	pCZ5aLUwtI4tgh1YNGkGbvKXOsBLl7EeGeWz28s9LOzgPqibq6NEkbLtXwDK7Jh1jvB4XoQKEsbXN
	aeCAYHdgCLANaByXV26CRYaO5oA2gVOE4Khlzq39LzONuqaGC18fdZr1AjBKazZJC0K9BZwHd0SAh
	Q0fvaK8wr6QCQUUh/icHqvp9JWv07xJC716EFaSSKbIsyS/eK/Nou8p9LYWKNgtvfOTYq8cLPQp2K
	IoArh71vwLZBDIjjUfqy3UhQdrbmWHf0QoBnF/fWOJ2i7cEK0YwgIzlIPhwvEy/KY/78GoMWIzO0h
	JoH23Tq1knQMWgl3bp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3B2-000000039rK-3yLA;
	Tue, 20 Jan 2026 04:17:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39c-000000039OU-1Dnp
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B70844548;
	Tue, 20 Jan 2026 04:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC85C2BCB0;
	Tue, 20 Jan 2026 04:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882524;
	bh=uFVTMJOPvCbobzJzlLLOywkmk/8YKf9YQOLxRrQYfB8=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=EjlSLzA7PLfg5Brd4VelzPqUk2McwqgKEHr9LXbNSZS1+tB4h3R6KaBUUFgXrV3Pq
	 NeRpnqofz2UV8XK4Muf+zWbpA0QXbXhZkcP/uKyzYuYhPJWyHrzvjL1SsOxEfTTsvO
	 HXoDxTUh3eXXCg3X3F0nl/OBW3pE6FeK2JZDQH1ej1Xv/tm2CCPicpgkwwWl1zoynm
	 +54/6E4DgDxiSdAgXcW9mGIg0ZX3VAqLhCuSkFZvbCMB84n0UQWlaMVAknhbyJmBuv
	 IV9YxR1gpH3Zo8EZbJ88jv6A3QlFy8WZ3S91sbl/tpFrL1ZxQlOqCJbklLdbNzgDfF
	 b3p/Co+to5Ddw==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:49 -0800
Subject: [PATCH RFC 12/19] RISC-V: QoS: make CONFIG_RISCV_ISA_SSQOSID
 select resctrl
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-12-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
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
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=fustini@kernel.org;
 h=from:subject:message-id; bh=uFVTMJOPvCbobzJzlLLOywkmk/8YKf9YQOLxRrQYfB8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwb3zA5w3fvmloVYg6G7fU/96pqPs/8adhgHbkh+x
 mGT1XO7o5SFQYyLQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjCRnkiG/2FrmKxCF/OkvLi5
 21L3RcairRvZVMwv8r5v1n5XuNa3/AbDH76jCXrvFvms41hTJSsSMf2x4m2JNqVCL5Wq0j1yCtN
 n8gIA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201544_409615_52B8E633 
X-CRM114-Status: UNSURE (   7.82  )
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
