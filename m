Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B389CECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8292F20657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9g/Hfdn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="RhhNkCD0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8292F20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8FdGrH5lYyFwLo5NZusna3L80JLxsg3524E/kQXYV/g=; b=Y9g/HfdnROI34BP4F/dBYHvB9X
	APBc2SF4SFryZjpefmiXJ4hOCqqHYocPPdpMCfpmKnEGRyiOsK88Zq/uu/YM1fjTQfoL7VVC3Mj7S
	/2nIeOl2O8CddVwZB1Z40W9AO+srA+QsbsxjaDbfb0eSg9jDICNI4lDbKLsa8B1kzN9l1U5cMmJav
	gIixbp9RvRrZgyGyKtMraS6DddYuKc6WSfUgCmRoHfqcBrCxKuMC3HILgsRa3KIS67sGx2FyDpFpa
	OhTc53x2EB568V4MMOzEtu2GtxzDQlve4yFvI5vD8bQ+tUZcEGDga2L6XlBfxkGW6d0ildXzQuxlJ
	s6uJg/4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHkHz-0005mD-LR; Wed, 31 Oct 2018 06:47:39 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHkHx-0005fe-0m
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 06:47:38 +0000
Received: by mail-pl1-x643.google.com with SMTP id f10-v6so6810767plr.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jbGses3kKLxFwMMziG7eRw5NjyQ3ctDmuG8/t+lyq1U=;
 b=RhhNkCD0ovQE6FKl+WOSHKOzLviG03HhGHMpt4zJl9WuK/YgK03wRgyPUsGH1L5RQ3
 vc7RJwXiLD6una6/S1hwTSxpC94cLlji32JKzOyw6XI+xxn1SI43F6k8WRqMHerDXjkS
 57PqbAc8+B6Nz9hM2+TPn3fFgwIdYmUlTql/4pgs+qRkVW8oglCuZbwNftZHHce6J8DR
 KGTdpmbRC/GgP3vznlJ6A8IvJuVgf1ML44iV85niZyQY/M0dHi+fx3G1WEOF/e34Q1e0
 qtkKRYS8r95SC6FUZhztVW7ypB7Mxx4Fsx2ZwFUoSn7WzTW28ZMj9TneAIvlhTHt9T8k
 p9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jbGses3kKLxFwMMziG7eRw5NjyQ3ctDmuG8/t+lyq1U=;
 b=tKNml5g8vdh1nQySyJep7pq1G9AspC7/ZpjieD7BJ+nJF83duiWqQblOTZ8fEUOlFv
 X4ZbicrheGaK5c2KyUE6qGY7eevjy3Drs/glJNPgLZY4FvkGhxlUPnyorJhM3Qxc943c
 t1ZTHyJkjrYHZUWeCJw4Yg0HbqnYgI5JwhcExRGAUOgoKUekLocGfkTfS355b695G/ku
 ak/1yAo95DEFIELAfiHb7nMlumqdv226z/98aSKs9L5qSUl+tZFfb5po+FzlPqqI8RRl
 NOeYVPXpEAFAKak24qpzQ4yEN3FAjxeJ7qmbNu1HRB79QrFLTYqLe1CLuUMWuVVFisbO
 PcVw==
X-Gm-Message-State: AGRZ1gLnP6tLqIkj0If6fP/gl2xzI9vIaY9hphd3ptTgwQhVtE0mF6kh
 6wi8uqohl29a8hAMpuKcXwdvkw==
X-Google-Smtp-Source: AJdET5cyaXd7g3uo6iTIq8sGIDTN3KuSkaGfk6ArccNXVzRZCqdvpIyMORuYd/sfD7gbE3QA4V0o1g==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
 i7-v6mr2075226plt.268.1540968446360; 
 Tue, 30 Oct 2018 23:47:26 -0700 (PDT)
Received: from localhost.localdomain
 (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id z7-v6sm12127306pgi.42.2018.10.30.23.47.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Oct 2018 23:47:24 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 3/3] RISC-V: Silence some module warnings on 32-bit
Date: Tue, 30 Oct 2018 23:47:09 -0700
Message-Id: <20181031064709.30981-4-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181031064709.30981-1-olof@lixom.net>
References: <20181031064709.30981-1-olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_234737_059183_66AC59EC 
X-CRM114-Status: GOOD (  11.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zongbox@gmail.com>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031064709.5GZxXDVGuc-oQHRx5_xUodJ_7nE6a3SNKboArmOc81A@z>

Fixes:

arch/riscv/kernel/module.c: In function 'apply_r_riscv_32_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:23:27: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_pcrel_hi20_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:104:23: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_hi20_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:146:23: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_got_hi20_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:190:60: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_call_plt_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:214:24: note: format string is defined here
arch/riscv/kernel/module.c: In function 'apply_r_riscv_call_rela':
./include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'Elf32_Addr' {aka 'unsigned int'} [-Wformat=]
arch/riscv/kernel/module.c:236:23: note: format string is defined here

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/kernel/module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 3303ed2cd419..7dd308129b40 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -21,7 +21,7 @@ static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
 {
 	if (v != (u32)v) {
 		pr_err("%s: value %016llx out of range for 32-bit field\n",
-		       me->name, v);
+		       me->name, (long long)v);
 		return -EINVAL;
 	}
 	*location = v;
@@ -102,7 +102,7 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 	if (offset != (s32)offset) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
@@ -144,7 +144,7 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 	if (IS_ENABLED(CMODEL_MEDLOW)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
@@ -188,7 +188,7 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 	} else {
 		pr_err(
 		  "%s: can not generate the GOT entry for symbol = %016llx from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
@@ -212,7 +212,7 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 		} else {
 			pr_err(
 			  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-			  me->name, v, location);
+			  me->name, (long long)v, location);
 			return -EINVAL;
 		}
 	}
@@ -234,7 +234,7 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 	if (offset != fill_v) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
-		  me->name, v, location);
+		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
