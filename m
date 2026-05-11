Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC00FCD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 05:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpNFmTzmTksl/tJuzTaAniDFEVgUyVeib6DRY9dBI54=; b=wN5qN+wyiqW9c4
	yw7GzXsoyhwx6t3pzG3WRE1Hxg3WLVwdqY4068kPmiTFKyF0EYGWDPTTX9cM1NVvvgoR/qyKtLqHT
	RSDblhzhUJmC0CI/lWuphJTiMirlQCNBm2hlb/lUlch7kh2wX89ik0yZE/1R0TDhyCa9PhtIjF2lG
	8rYFaNKYW1Tjh8G/FOPh2iGZdJD86hszt+tgSs98Qk+1d+aWtEhU4SO5D1dGf+nMacdgQDWY196v2
	V5qfc99+yFxsepzXNw3dHCZWwv5AiaYPu1wjRIiIOiEm9xsBNEjNY+WFVsbPMhF8yb1bNa5y0ajbF
	sAU8Ux108xAiEPLA0IVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvE-0000000CL8L-3Wue;
	Mon, 11 May 2026 05:11:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvB-0000000CL7R-2zFP
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 05:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A521860125;
	Mon, 11 May 2026 05:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0005C4AF0F;
	Mon, 11 May 2026 05:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476272;
	bh=ewfeCcD9Ot0T200VQaUyxNc64vTwsILDn7MzeFMv3kU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sqCIBMN49l1N2T9zn6Ziz342oa3q83ofxOhOrs2KvJatbuDmWneGCSHgS4bUuokGE
	 SuFdpcKQgs9mC5GSvIJTJP0voIlqjdJOndOD93ZvmkRB0bd26KiBpi4Q2sUsODvHdz
	 uagxE5urHDSLUE9H05j9XDbniA+nrkIPHRpZ7psfitZ5IeQKfBzf7jAHGzAmNaTR7F
	 jqd/V6dLmnVhBqGtqfBTvpH0NutcUaTnvzxMovNC/AyK/b6+oAkqvIqhpaGto9nOGx
	 QeoGqAZzeyCw5H2mKmR3GltroNxyzSrvKAws++Q6GXbZ6NXik0MPbEByPfUYa7vepb
	 FGnXU4JNXlLvw==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 10 May 2026 22:11:01 -0700
Subject: [PATCH RFC v4 05/18] fs/resctrl: Add RDT_RESOURCE_MB_MIN and
 RDT_RESOURCE_MB_WGHT
MIME-Version: 1.0
Message-Id: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-5-eb53831ef683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ewfeCcD9Ot0T200VQaUyxNc64vTwsILDn7MzeFMv3kU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQxprz6m/FtfeKXs3Wz4jyXL5NekffXOXuhS2BH6IfDN
 jd4Zrgbd5SyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmsqmX4Z++we/ea2vjpEo8
 j35OZaspOvp5tk/L6uuFh9IYrvgtWRnEyHB6YV9HQCPL7b/ft6174G1uHKcl/ClP+cX8P7FfW7q
 C77MDAA==
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

Introduce bandwidth controls which are semantically different from
the throttle-based MB resource:

- RDT_RESOURCE_MB_MIN: minimum reserved bandwidth
- RDT_RESOURCE_MB_WGHT: weighted share of unreserved bandwidth

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 fs/resctrl/rdtgroup.c   | 4 +++-
 include/linux/resctrl.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 0f331bf5ce82..02733b11e115 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1555,7 +1555,7 @@ bool is_mba_sc(struct rdt_resource *r)
 	return r->membw.mba_sc;
 }
 
-/* RANGE schema is bandwidth (MBA/SMBA). BITMAP is cache. */
+/* RANGE schema is bandwidth (MBA/SMBA/MB_MIN/MB_WGHT). BITMAP is cache. */
 bool resctrl_is_membw(struct rdt_resource *r)
 {
 	return r->schema_fmt == RESCTRL_SCHEMA_RANGE;
@@ -2402,6 +2402,8 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 		return RFTYPE_RES_CACHE;
 	case RDT_RESOURCE_MBA:
 	case RDT_RESOURCE_SMBA:
+	case RDT_RESOURCE_MB_MIN:
+	case RDT_RESOURCE_MB_WGHT:
 		return RFTYPE_RES_MB;
 	case RDT_RESOURCE_PERF_PKG:
 		return RFTYPE_RES_PERF_PKG;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 006e57fd7ca5..9529ed0d1fdf 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -53,6 +53,8 @@ enum resctrl_res_level {
 	RDT_RESOURCE_L2,
 	RDT_RESOURCE_MBA,
 	RDT_RESOURCE_SMBA,
+	RDT_RESOURCE_MB_MIN,
+	RDT_RESOURCE_MB_WGHT,
 	RDT_RESOURCE_PERF_PKG,
 
 	/* Must be the last */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
