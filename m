Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40438CD37B7
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 05:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzPkkMP8h03Np2mdGKrwiJEex4f6wCjE49M5hUtn4KE=; b=4pK5FS+kKyo+pV
	IAanDNRBkuY2HyY6jVRLRgtkoAX5sUgJ8bQ796q6JDwkWXVZ4uAeOsllvWL1ZWcw/Z7LidWEAiJZa
	vPB65UewjVhiNmQYjAeOfy2Xu7qKJ9aFGyZp6uL7iRTlbcdWpbDchQqGNoZBIRD00FARtsL4tJ+JG
	pExer48iJlkQB/dUWrStPzL4HoQGYUVVbGdi52hdAf0C5RBG2tAWo/QuCxEnd8GbE5tcwICLe1CvI
	nVFHust8Xd7X54Qf0ljWK7moBnS16EEIC56AJAjOzUO/XtH+LJHI9kWcIaaIHEhw725iM8jIOjPgP
	MJb7Bk4gn9eAqJdX3/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvM-0000000CLA5-0LWb;
	Mon, 11 May 2026 05:11:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvK-0000000CL8i-12EF
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 05:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD9C860129;
	Mon, 11 May 2026 05:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7E1C2BCF5;
	Mon, 11 May 2026 05:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476281;
	bh=IfK90oL89PLZ77zZUqMTiT6Ew+f2/fOrCwuhT7VtBQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NO5H17MoG/pw6yzuPDowtnsunSDQIo679yk1cZvTcR8hnDUSQQhjA/0uI6E+t97Gf
	 tzdPuyigKDPkEANJxOlSponqMMUkAqnMrx+TqlwPsaSb/NVelm1X90Rd4iDaSlPCg3
	 WJ/rTsx+X/h1WJni3NVoVMjtl5k99+cPHWPcOyz2zd+lNXidaLj5MaPsAG5hrMHF9P
	 PkgjQqdPLRleCLTgumxOqkL8/M4qElXssAG22cRWIWnIzMGbClZsLIhzqAwGegTDe4
	 pDokNii24iXjMhDJH6DT9SqqCEtNsujHEW562hPDS0V3hq7pPSMn/bDDSFF3iWGcRF
	 D3gLonk8WA0UQ==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 10 May 2026 22:11:14 -0700
Subject: [PATCH RFC v4 18/18] riscv: enable resctrl filesystem for Ssqosid
MIME-Version: 1.0
Message-Id: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-18-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=fustini@kernel.org;
 h=from:subject:message-id; bh=IfK90oL89PLZ77zZUqMTiT6Ew+f2/fOrCwuhT7VtBQ0=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQxprxZ2yOz0U5U4FPV5R8Ry+qPTpdcertH7Katwh6N+
 M+PWdpXdZSyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmsqubkWFGeN+b36eXx8WY
 9nqx/rB26E1dau6n1u1gmqRulS4dXsLI8OSMZOeaibGdr4NX7876/iTnk4bTVflTFtlPkvQFq2b
 rsQIA
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

RISCV_ISA_SSQOSID selects RISCV_CBQRI_DRIVER, which in turn depends
on RESCTRL_FS. Enabling the resctrl filesystem itself stays a user
choice via the standard fs/Kconfig MISC_FILESYSTEMS menu.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a0c73edbe734..ea430b4a3aab 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -596,6 +596,7 @@ config RISCV_ISA_SSQOSID
 	depends on 64BIT
 	default n
 	select ARCH_HAS_CPU_RESCTRL
+	select RISCV_CBQRI_DRIVER if RESCTRL_FS
 	help
 	  Adds support for the Ssqosid ISA extension (Supervisor-mode
 	  Quality of Service ID).

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
