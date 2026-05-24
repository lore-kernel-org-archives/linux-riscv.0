Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F458CD5BAB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpNFmTzmTksl/tJuzTaAniDFEVgUyVeib6DRY9dBI54=; b=mKQFQxHd+zvJhM
	KuUmLpzJSh+6dDryC9vAWfckH2EsqbBCkhBt6ze/Yg/sdoWwaoKgykAah3BR0CQFHXZtkr477i84v
	QM4/QrN9t4XJCMTZBJG+Gk18Lqoet665Y8/CFBi3Eq6vu32vMBJc1RMWjDKm+Sve1vo9mQQvVwckE
	uWlnbyzyG3uDCH+WRcjb5Zgvk2dwI1sObX2Zsn2n9/EB3XImT/NqhpnohFekROrcB10xiT6upE8w9
	Hleh3LJdiEXs9RY6PJ+i+fUlqXVLN16Gt9RWgOY1Gt/RcPbVG0OaYCwhu4mPCHOhD1xUCBXPEZKbN
	hgBv/Lmq4ajKdpXveJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhQ-0000000FsW5-0YKK;
	Sun, 24 May 2026 23:57:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhL-0000000FsTi-17MF
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 23:57:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F22F640E01;
	Sun, 24 May 2026 23:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1D81F0155E;
	Sun, 24 May 2026 23:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779667054;
	bh=pLFiy62tMx7JeOsNO0x0pvKlEUaU3G7gNAtoyChnKRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GMg9Z8WaGByE/GnNqJ/v2cfgGtESFSyPLUaNDIReCmO38LfS7F5zxx6Mdi3PoNvFA
	 mTxWGWS0DyBDzpFfDnOaFRcBRVdtj0xanHzRMS/s9jd6oiCa8SXcz5kFFF09z3ddq9
	 8m9+M1dwKsuRMl9E1TreiB2AJzw5sii1awY/6Xg32v707KGMngtfVpPLr90A2vXPO8
	 40ebvQ4rpht3duJmCmfB9BTRKbjjiPR7NMb7g53dd6FAe65UciQ1WoVsYIT9reacuE
	 rSrSFW+RDixLG+TkaP+zk7OBW0bCFq+xjhPCNo7szPWJ/4SLaWXly5kx2WVmMnQmKl
	 v9BI2o6iEn1Ag==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 24 May 2026 16:55:35 -0700
Subject: [PATCH RFC v5 05/18] fs/resctrl: Add RDT_RESOURCE_MB_MIN and
 RDT_RESOURCE_MB_WGHT
MIME-Version: 1.0
Message-Id: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-5-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org>
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org>
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
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ewfeCcD9Ot0T200VQaUyxNc64vTwsILDn7MzeFMv3kU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQJT8i4L/ydY8KSU09VjbvZmfctiXrecDDXPMmxPXJV8
 GfvN9sWd5SyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAm8v0rw//QkEaBp3e7PaeE
 TtdTND6ZwCN88/6vBVeP/rAzUQ35Of0kw/8y1jUzGHNOLd4dIBx0cZO0mNNUIS/2g+5hR0Tu/T8
 hoc0NAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_165735_360091_C0BE6FDB 
X-CRM114-Status: GOOD (  10.50  )
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
