Return-Path: <SRS0=rW/4=OB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A21C04EBB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 19:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9838620645
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 19:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UkPmPxhB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZ+k4wAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9838620645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dtzQxM0FjKikzwboN8RvCNKStUEwjYjt9dV69Q/qmD0=; b=UkPmPxhBiB5wp2BxN51ZYRNYHW
	kNj/T15jSEZeeStFbP9k8VRW/UN39aQM0OoUiQnvDhjOP/Rb60vdcR98Bl5qNXTz2Io/xIX9+NG4H
	hqqmUt2Vd7B4AOy/YZriqMV2CYn0h6Zl939NBQA/enwE9aTi0SkHcVs/S3iMkKGQBWlLq5cOZc/FU
	GScJeh/49/8ckjPKErFc4DJw7oyeV6mYXX5YkYS8Tw0GGcC57Eix8kB14WTM/JnudDvuDzpjH3i2v
	h2apsUybtMYfjHLERMlHLlA+7IUFw0pEmKlUj4f2wUyQDmdOi7fQVtpIr+BNNA1945q+WNGn8ByEX
	8eZy/Qfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPv3O-0002iP-OS; Thu, 22 Nov 2018 19:54:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPv3L-0002ge-4Z
 for linux-riscv@lists.infradead.org; Thu, 22 Nov 2018 19:54:20 +0000
Received: from sasha-vm.mshome.net (unknown [37.142.5.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0BEF20645;
 Thu, 22 Nov 2018 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1542916452;
 bh=ZNu8WHQed2JoXgLvINJb0Cp1VHXHhW3cx5Jo1Zm8BqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LZ+k4wADZJpXV0hkXKo+uoqrVRtRzM1lisI7vy/uoQhSiAP7WGZH7f0Ai914U2U/X
 NdFI9vDULwGzJwt5C4xvv65hpZAX4yZKTgCDlD7ZMYw8xFfbRyW67GrhjGl6MELxTg
 w4ZydYX4looVzXX7OWUO0T4AZJfRkjl8VM23QqKw=
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 27/36] RISC-V: Silence some module warnings on
 32-bit
Date: Thu, 22 Nov 2018 14:52:31 -0500
Message-Id: <20181122195240.13123-27-sashal@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122195240.13123-1-sashal@kernel.org>
References: <20181122195240.13123-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181122_115419_249980_33008517 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
Cc: Olof Johansson <olof@lixom.net>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181122195231.-9SCh0OZjZVanta3NPHI9tEo1Gdpw41iI8bTlQ8toXQ@z>

From: Olof Johansson <olof@lixom.net>

[ Upstream commit ef3a61406618291c46da168ff91acaa28d85944c ]

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
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
