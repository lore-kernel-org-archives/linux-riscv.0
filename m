Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04453CD5BAB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 23:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74QrUNqayd87PmoxrHOhYUsezJ4iH1wIw56mWCFcuH0=; b=4Gn5l7UM4jcxkl
	JcjePD1AO/fq1yO9nEqoeARv+bHRbI+40TQUS3y1BkPaMXujUbr6mL9juZ2Uz7RtFHVhtNbDoqMQF
	XaeUdYNPFC3QMYGNFkj9yIiAB/14Fj+6p2IUQzM8VEgmwjLLSvyJ9v4LO+cfkNoBhpbNExfzrxUMT
	Ds2qb4+MTwk7anV6Qr1XIYyj4sgCfhTc85PiF1atZv3AIWn6PI7l5a1CCZBNJ94bEtZp+BlHCAVqo
	866ErH69UeLTyyq069ydAF+sNK1wVZzOcesjFDJYSoX3HeS0gOz8mmq+sigDs1My+FuWYh01ojCyx
	HtjZqCnw5TJRGnjWcRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhQ-0000000FsW1-0Aol;
	Sun, 24 May 2026 23:57:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhK-0000000FsTT-2WhP
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 23:57:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CCC742E4C;
	Sun, 24 May 2026 23:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F831F0155C;
	Sun, 24 May 2026 23:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779667054;
	bh=04z5b3ENFFStDILh5daSgPFr7SyjhKEetoj74bl6s2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aocyLNmKzmXQ9FlssytmARSxj1PZsMH67qwm22RzG6SBtcNMrhjiNYkLkwmIlkaLL
	 BSrU23bZJI7DUIDYdVSBlm5VDdqdZ0aZ40vzm/dcoH4kS19uaPu0lFX0JCR1017WxJ
	 JrjzayD0/A8ZXR1yG350GzIgar/jNM3q3nJZ9JnQzgkyqVFf0f6FQhvsSXXYJBJuno
	 t2rhAYzt+6+PCgh5tKYDaZ3XB/KTliu4zn1B0pproBmTumtJcZTQXVR2UezO4G/h3r
	 Pc9HPFpETnkgvVsoKvI6Hxzfks5xlQYDCZk/AYhhyqpeP+Ar7MnXhDi8RD7Tg2ta0x
	 DyoZGgU3BKsqQ==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 24 May 2026 16:55:34 -0700
Subject: [PATCH RFC v5 04/18] fs/resctrl: Add resctrl_is_membw() helper
MIME-Version: 1.0
Message-Id: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-4-78d3a7ba9dbe@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3572; i=fustini@kernel.org;
 h=from:subject:message-id; bh=AWRHihJSBi+LIrOoIsOzoxnsBG0+4NVU5YSaIMOxEs8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQJT8iIurXa8YCswwyR44Jmc01np96aZh52ba6GioO3/
 +M7h7JkOkpZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATSVnAyPDkl/bc7Y5b+rtt
 ZRe0rFp98dPBthq9qIi6vIiHfaUcnCaMDKvqV/b+WOVWKvn1gLrzyd19D/Y7R3CFzBcuvtAf4r2
 VhxEA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_165734_687826_15A85AF8 
X-CRM114-Status: GOOD (  12.12  )
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

Four sites in fs/resctrl distinguish bandwidth resources (MBA, SMBA)
from cache resources by explicit rid match:

  fs/resctrl/ctrlmondata.c parse_line()
  fs/resctrl/rdtgroup.c    rdtgroup_mode_test_exclusive()
  fs/resctrl/rdtgroup.c    rdtgroup_size_show()
  fs/resctrl/rdtgroup.c    rdtgroup_init_alloc()

Replace the open-coded MBA/SMBA tests with a single resctrl_is_membw()
helper keyed on schema_fmt (RESCTRL_SCHEMA_RANGE). No functional change:
every existing RESCTRL_SCHEMA_RANGE resource is MBA or SMBA today.

This isolates fs/resctrl from the addition of further bandwidth resource
types so the four call sites do not have to be updated for each new rid.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 fs/resctrl/ctrlmondata.c |  3 +--
 fs/resctrl/internal.h    |  2 ++
 fs/resctrl/rdtgroup.c    | 14 +++++++++-----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 9a7dfc48cb2e..d9f052700941 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -245,8 +245,7 @@ static int parse_line(char *line, struct resctrl_schema *s,
 	if (WARN_ON_ONCE(!parse_ctrlval))
 		return -EINVAL;
 
-	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP &&
-	    (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_SMBA)) {
+	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP && resctrl_is_membw(r)) {
 		rdt_last_cmd_puts("Cannot pseudo-lock MBA resource\n");
 		return -EINVAL;
 	}
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1a9b29119f88..76187987b2ee 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -397,6 +397,8 @@ void mbm_handle_overflow(struct work_struct *work);
 
 bool is_mba_sc(struct rdt_resource *r);
 
+bool resctrl_is_membw(struct rdt_resource *r);
+
 void cqm_setup_limbo_handler(struct rdt_l3_mon_domain *dom, unsigned long delay_ms,
 			     int exclude_cpu);
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dfdaa6f9d8f..0f331bf5ce82 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1412,7 +1412,7 @@ static bool rdtgroup_mode_test_exclusive(struct rdtgroup *rdtgrp)
 
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
-		if (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_SMBA)
+		if (resctrl_is_membw(r))
 			continue;
 		has_cache = true;
 		list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
@@ -1555,6 +1555,12 @@ bool is_mba_sc(struct rdt_resource *r)
 	return r->membw.mba_sc;
 }
 
+/* RANGE schema is bandwidth (MBA/SMBA). BITMAP is cache. */
+bool resctrl_is_membw(struct rdt_resource *r)
+{
+	return r->schema_fmt == RESCTRL_SCHEMA_RANGE;
+}
+
 /*
  * rdtgroup_size_show - Display size in bytes of allocated regions
  *
@@ -1616,8 +1622,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 					ctrl = resctrl_arch_get_config(r, d,
 								       closid,
 								       type);
-				if (r->rid == RDT_RESOURCE_MBA ||
-				    r->rid == RDT_RESOURCE_SMBA)
+				if (resctrl_is_membw(r))
 					size = ctrl;
 				else
 					size = rdtgroup_cbm_to_size(r, d, ctrl);
@@ -3648,8 +3653,7 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
-		if (r->rid == RDT_RESOURCE_MBA ||
-		    r->rid == RDT_RESOURCE_SMBA) {
+		if (resctrl_is_membw(r)) {
 			rdtgroup_init_mba(r, rdtgrp->closid);
 			if (is_mba_sc(r))
 				continue;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
