Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD912C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 06:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UJER7jU06C9kQyxl71BjK3MDGPA9skONmfgFb3Ub9/0=; b=0tRdbTnHoZrdBI
	tF40fS/r3UCk3HshnB7vOSSPSZGtKs2sgt5LoOwSkU7RKRIf+eeDMG15Ip9ZecPqPDiyQ+dYjKpHg
	XXCz/wkurnd75vohF1lf8WUHAavCCNdTucjExQy9yYUSw0BSBDhYbJoANdMKEfL13TWxweb1QpO/o
	OFF6+uLbO7v4ixAxvvF/WUyoyAK0vwNg9Lief+E+/mZiNZx56/LHh8yepEir9bPS4+wn6jfgU5Mvc
	LlHpLCYw62HYz1zeyqKYuXB8z1U9xwzLixqBm1Fm6oiFbN5hdnQBYrdHF6jiZj/S3H5KWuAKzTxnK
	lOFLkMQNPRpa4fckeqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFsW-0000000GZMD-148b;
	Thu, 16 Jul 2026 06:47:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFsU-0000000GZLw-2LxD
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 06:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD1AF6001A;
	Thu, 16 Jul 2026 06:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C9A2C19425;
	Thu, 16 Jul 2026 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784184445;
	bh=/zx4SWgfXy/FgxbCsI3BUXlGcB3UXuH1/jO8vvwsMGY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XDlvCaxUSzM4QpvE8vtF432NIfo5MgMD5EkTxRRUF1J6OoG1Ca6SiSlK/en2GJoeI
	 2b30WLDdXpsQewxXbioYmM27+XRcVEGOdHDzm7g9fbNli3lyjSQ81I4AuB+TnyLeZH
	 WOcM71Pa+523H2a6Vayx4A0PiXbzlYm2zYyVGGuYbglRG2CrIvbq/hyIs1rR53x64G
	 V1TcvLscC/rJWZd1oFi0dU7/nqsY/8jI20N+v3qxPDmGXbXoOTSh1l7eqU3SsklES5
	 YpIFnepfbPFQEMytwoGAX0cMtctkn70kP6cXMoxTtu1SQK+ynifLbYJohR+gb9gKgN
	 LCcD4awxQvSsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492B6C44511;
	Thu, 16 Jul 2026 06:47:25 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Thu, 16 Jul 2026 14:47:10 +0800
Subject: [PATCH] riscv: require vmemmap for NUMA balancing
MIME-Version: 1.0
Message-Id: <20260716-numa_kconfig-v1-1-b0cd6d29accb@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAG1+WGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3bzS3MT47OT8vLTMdF1DI+NUU0tLA1NTizQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loApLKF33AAAAA=
X-Change-ID: 20260716-numa_kconfig-123e5990558f
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784184444; l=2137;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=zX7msVePD9cWH1tEIezrckJapIDNnZ2LJUbuDS1r9Mw=;
 b=+GzWBgzTf9QJL3KiJ+0unqSrHP/5cWqUcnSLsVPvDjP0JMqzlClZX+fwtSLZ5ee7lnb/pLJXQ
 E8jeyNr/Xc+CSPNQYXkrgYOgMVTUk+LOqUVA+iabCBNXn7oKeVb9wot
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

RISC-V randconfig can enable NUMA balancing while selecting
SPARSEMEM_EXTREME without SPARSEMEM_VMEMMAP. In that layout, the
section and node fields can consume enough page flag bits that
LAST_CPUPID cannot fit in page->flags.

The generic MM code then stores last_cpupid in struct page and emits
the "Unfortunate NUMA and NUMA Balancing config" warning from
mm/memory.c.

NUMA balancing needs LAST_CPUPID storage, but this fallback grows
struct page for a configuration that randconfig can select
accidentally. Keep NUMA support available, but advertise RISC-V NUMA
balancing support only when SPARSEMEM_VMEMMAP is enabled, where the
page flag layout leaves room for LAST_CPUPID.

This was originally seen with a RISC-V randconfig generated from
KCONFIG_SEED=550012.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
RISC-V randconfig can enable NUMA balancing with SPARSEMEM_EXTREME while
leaving SPARSEMEM_VMEMMAP disabled. In that layout, LAST_CPUPID may not
fit in page->flags, so the generic MM code falls back to growing struct
page and emits the "Unfortunate NUMA and NUMA Balancing config" warning.

Limit RISC-V NUMA balancing support to SPARSEMEM_VMEMMAP configurations.
This keeps NUMA available while preventing randconfig from selecting the
known-bad NUMA balancing layout.

The issue was originally seen with a RISC-V randconfig generated from
KCONFIG_SEED=550012.
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c0a6992933e4..681c5a2eb006 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -481,7 +481,7 @@ endchoice
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
 	depends on SMP && MMU
-	select ARCH_SUPPORTS_NUMA_BALANCING
+	select ARCH_SUPPORTS_NUMA_BALANCING if SPARSEMEM_VMEMMAP
 	select GENERIC_ARCH_NUMA
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK

---
base-commit: 37e2f878a7a660a216cc7a60459995fefd150f25
change-id: 20260716-numa_kconfig-123e5990558f

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
