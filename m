Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE0AC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V7dJsMApNgVwk3rVM0eDBI3VqaxBwadgi8zpv2vRLlw=; b=uBzNNz98EUZreJ
	y4eQ1N+ItqgjxJ93Kd02M5860dIuRC/K1ceKHZAsrn4r1GXRNOer0RNS6Ts/yXmDASzNaiOwlcBZG
	Pm4podk23AGz5WSrKXVC/aXWnvb+nsEi6rNV6gKaz4fXwFIN+KmKda11/pM+g1KjBmcUMk5KqHLe/
	a0hMg37mMH3DpJTfkQdws2rmbasrzyPJJnkXiM/48w22Y9HdZVQ7XMmxd+/2gyuc+Mnt1xB95nyBm
	rE0M4m6cu6dDTI2E03dpqQqDD/mmb1DudD2yBDhXGVV6OE3OMb9fj6cHcSJj1uSAcOmrqoDV4zt39
	GeoSdWGlQbyl0tJ0dB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VBN-002Cdg-2v;
	Fri, 26 May 2023 11:00:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VBL-002Cb7-1X
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 11:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685098827; x=1716634827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qWz9IuIpPGye3RBkjnvRNmgujqz6lziLZvgBzgEKyBY=;
  b=kdqLORZNSZjjksd/CgJpQjg1YK0ow5q7sYod3wNwXjJVTT28HkdIg1Z8
   2UH4Nvg2Cim0BuP53XaDRMzLwdyCcifhFfnUHzUL2mhxOqBH7Zc7jPGVc
   pER3UvjaECrS/A+1wsP5BgFaMG4ufpGCGPXA5MqT/cOhiHeo1BrfWaqNQ
   JOxabuaocypBKY5R67nnp9DMMP8t4die9vRbqFpv1wQEW082Oc1Uu/LyA
   RwYhW9QJ8raYjtMz4q14spiMwM1rfEZyE0yiRhhXK7Km0RDa5v5UQrJuq
   PsyosBQ9JVF5SF7+GuyzPBedymCk2/NHUtoMnplqOpnjz7KKLHbb+zMV1
   g==;
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="154080381"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2023 04:00:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 04:00:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 04:00:23 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, <atishp@atishpatra.org>,
	<anup@brainfault.org>, <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>, Song Shuai
	<suagrfillet@gmail.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>
Subject: [PATCH v1] RISC-V: mark hibernation as nonportable
Date: Fri, 26 May 2023 11:59:08 +0100
Message-ID: <20230526-astride-detonator-9ae120051159@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qWz9IuIpPGye3RBkjnvRNmgujqz6lziLZvgBzgEKyBY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkFE34mJVWE3Z62p3fJyeAU8+8Tch+9/fhGYOqlY+arPNXf ppppdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiUVMZGdorIjPO1p/et/Cw9f6D3g EuEo/jfPVmsYto/rD++8xagYuRYR5HqfLMG5Uciyex710809pLNI3rYUX7mqvZUrHzxauecgIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_040027_575372_F432C76D 
X-CRM114-Status: GOOD (  11.44  )
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

Hibernation support depends on firmware marking its reserved/PMP
protected regions as not accessible from Linux.
The latest versions of the de-facto SBI implementation (OpenSBI) do
not do this, having dropped the no-map property to enable 1 GiB huge
page mappings by the kernel.
This was exposed by commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages
for the linear mapping"), which made the first 2 MiB of DRAM (where SBI
typically resides) accessible by the kernel.
Attempting to hibernate with either OpenSBI, or other implementations
following its lead, will lead to a kernel panic ([1], [2]) as the
hibernation process will attempt to save/restore any mapped regions,
including the PMP protected regions in use by the SBI implementation.

Mark hibernation as depending on "NONPORTABLE", as only a small subset
of systems are capable of supporting it, until such time that an SBI
implementation independent way to communicate what regions are in use
has been agreed on.

As hibernation support landed in v6.4-rc1, disabling it for most
platforms does not constitute a regression. The alternative would have
been reverting commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for
the linear mapping").
Doing so would permit hibernation on platforms with these SBI
implementations, but would limit the options we have to solve the
protection of the region without causing a regression in hibernation
support.

Reported-by: Song Shuai <suagrfillet@gmail.com>
Link: https://lore.kernel.org/all/CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com/ [1]
Reported-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/ITXwaKfA6z8 [2]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 13f058490608..117d53785560 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -800,8 +800,11 @@ menu "Power management options"
 
 source "kernel/power/Kconfig"
 
+# Hibernation is only possible on systems where the SBI implementation has
+# marked its reserved memory as not accessible from, or does not run
+# from the same memory as, Linux
 config ARCH_HIBERNATION_POSSIBLE
-	def_bool y
+	def_bool NONPORTABLE
 
 config ARCH_HIBERNATION_HEADER
 	def_bool HIBERNATION
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
