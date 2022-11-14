Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C149C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 01:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eXPIN3sntFmR8LJsR3DuJm/W4YX8VWwXpJ8KmupKCUU=; b=BtXbVbdJJZoVRc
	UPtUUlzpzxwOU24TvE7LHI4JZzoOE8kAoJrc9DCGC8CrNbz9QMZdaw9D29a1crbLRX8SueD/WGk0V
	avU5/Fr/H4cRNKQzkiAnPoLzXQH3Ejgjl5oG+CU5+wRC7hTCu821HAEc/UEw36ErxG9w6gASUI8da
	3LTlsXHbhs+na2rrm4ZiuK/ctgsJaCdfAVdJsnGxxwsZJyw7s7RHiLmiXb0eIiH8l9sY58bN7jQQa
	3z7hRENLTBTIEsmjU+kskvyf4G56tNRfgYzhnilIEhwxJMGhIJ+w5r/F+bu/qvcMaU3YZ3k6Tpmro
	nteLeWOlFI5yINljOAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouOKU-00FIsK-6A; Mon, 14 Nov 2022 01:32:06 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouOKR-00FIrN-6G
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 01:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1668389522; x=1699925522;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GjZ0QdvwuMaohRhDzpSrO5YV+gD+VV3OjMDizZJu1A4=;
  b=oclTSXSeyeOICw3N3WRnWQszyzj5O4VGUgGZThnkBYk4c520Yawj82N/
   fa5YSYciT+7t2HiuEdtNUBcPsDm+YGm3PlU3noUBOSoBTZ7fKl094rbs+
   /lnjsiWhfQdnau76rErqpCLgLKyCCM4IyWHlBz6rpNonRBgSktkcb06iV
   FC+ib6OcKzHuMuwc3hFY308uFTwKlsKFvB+/JuiMS96i4iouOleuzdKVX
   9DZGRHUgTDIfunPyFbyJgPZEoJcILhIS2Zim4AT2bjbmcSu+bi48ibjvz
   MkStMPg88atIDhJdnbgvfk8pJIUTzhJDqpd2VBvUbxAyib/TiGzaigKNb
   A==;
X-IronPort-AV: E=Sophos;i="5.96,161,1665417600"; 
   d="scan'208";a="320519687"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2022 09:31:55 +0800
IronPort-SDR: GKKG1e82YrLCKp7mOMGjFpktnjNoXz/2ieVh4l6sJnHEOMu/xtfNc0ea+9TXJzS9tywhqJZ4vm
 kaMwaO7agkcnd/SI1KG5YCl84VauYN/MPBRr1S8w8+dDWj/wAQK0QhaCJvXnfkloL9lKeUndNe
 iDUMjtjnWKgCE+eDTNbeCjIRycmdlIGvCEcAzzZs8GaUlW9nlN75D1rbVJzptJbPTQ/GwOq4EJ
 xeBuqx9ULb0LYj8J2PNkzeC0lBNwLO9U/w94l6GiQFuUbrimNRWlWEcBqcm2DukjC/mkM6PmGm
 B7Q=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 16:50:54 -0800
IronPort-SDR: +MglQAPZ4vi7XUH0q3YuUn4Oc+HSG1iRmo9jWnViekXkB+eu8inmUyHlX5mgDZbbR+IbrMvfYC
 q5Z9J6DoucFmAg5y+haKIlDkENt6c4PduxOIEc6KJ//j4n/R4B4ZN6RyQzb/EoUdZANwJ0V+wu
 IXBN193Ws+cuuJOEfN9rxJ5mQBA3wZAZeQFJ/P7emkFsaBjURDZusG3RoqZa/GnQ+QEha2EYsl
 z5mjzDnQM1cSLdls+4ApxdZyHFFy8jNQ7nltSC7aEwnKqNBDNGOm2szaxPYyzPUXoIX6vd47AI
 FKU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 17:31:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N9Wxl6NxZz1RwqL
	for <linux-riscv@lists.infradead.org>; Sun, 13 Nov 2022 17:31:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:x-mailer:message-id:date:subject:to:from; s=dkim; t=1668389515;
	 x=1670981516; bh=GjZ0QdvwuMaohRhDzpSrO5YV+gD+VV3OjMDizZJu1A4=; b=
	I4YvyccmeK9NpobxLXHR29ks21Yr4HDwwZg03pfrijuJXz0fuppt4LEd0KbwUftA
	vTP6IMBY9c3pz3wX+Zsy3Y7AslqW5ZP2p9oyyP/PDdCCncqhkjtAYdxAhKXRe27f
	DADdWshV2ubcKZzH2UvrCmJ6M6JKIO16A3A5WzpR1fcvYmA+4BVBltDQ5cJzGvGb
	BdGA+1lkh0sPveSNVIRyc9yfa0MQlR+qlnsSeJcXFlzIPigCndXoWcj9H7qHE+Xo
	yxTp87HIOPZ/zWYHlfdO3xxLjPRYXKh82yk7Hj5Ev/bfN8UMvGZiDrf8Axl4W1F4
	oBnS/xA29i+S9JPcWcvIpg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HqkwhI1u7koj for <linux-riscv@lists.infradead.org>;
	Sun, 13 Nov 2022 17:31:55 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N9Wxk3Nwdz1RvLy;
	Sun, 13 Nov 2022 17:31:54 -0800 (PST)
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Conor Dooley <Conor.Dooley@microchip.com>
Subject: [PATCH] riscv: Update k210 defconfigs
Date: Mon, 14 Nov 2022 10:31:51 +0900
Message-Id: <20221114013151.714578-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_173203_380941_C2BF2B9D 
X-CRM114-Status: GOOD (  12.37  )
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

In preparation for SLOB deprecation, update the nommu_k210_* defconfigs
to switch to using SLUB. To save memory, CONFIG_SLUB_CPU_PARTIAL is not
selected.

Suggested-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 arch/riscv/configs/nommu_k210_defconfig        | 6 +++---
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 96fe8def644c..18de91e84d1c 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -23,9 +23,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_KALLSYMS is not set
 CONFIG_EMBEDDED=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
 CONFIG_NONPORTABLE=y
@@ -39,6 +36,9 @@ CONFIG_CMDLINE_FORCE=y
 # CONFIG_BLOCK is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
+# CONFIG_SLUB_CPU_PARTIAL is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 379740654373..718d2729a03e 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -15,9 +15,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_KALLSYMS is not set
 CONFIG_EMBEDDED=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
 CONFIG_NONPORTABLE=y
@@ -32,6 +29,9 @@ CONFIG_CMDLINE_FORCE=y
 # CONFIG_MQ_IOSCHED_KYBER is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
+# CONFIG_SLUB_CPU_PARTIAL is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
