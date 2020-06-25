Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9139BC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC1B206DD
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mR08c3Uz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aYrU/9rV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC1B206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sjyo4WrFZPDjSJp844uYZWw5N+yzalH6f06rX4OB8yY=; b=mR08c3UzTsE2q4OhrmZE1ZiRM
	rBkbasl6GjBXyuIf7rpbIu/WHUjquvwj1BeWE21LtSo9NnfHHWXiXHywYE2OH6S5HRFk/m4ak8QeT
	gKBntUDiCLi6tBXregPk4COsxTNO4yTd448ooCBW46HF4jgnI9wdCVUDW/m0vfBMeoti/LBvl9KZ0
	wFAgCRLDZ3Y88oTL8n2HiFB1aMhktukze7+QaAeGzsXCZCfFXwN0Hr7gICpGez0LrgE41gZrwFWSz
	/03JI5xmoDQ8N7vZ3z/jmu2MEWjtGuB7fk63myXtSS7l5yiBXY/2cKfwLPogsq0ndERKR6GtbM4CB
	tXEmUpGDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolyG-0006Vq-T3; Fri, 26 Jun 2020 10:52:36 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojmT-0002Se-Ct; Fri, 26 Jun 2020 08:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160339; x=1624696339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1f5tFToh6jF2Fr3c6Bri7MNiVrYpT85jVmyBw2a1o8=;
 b=aYrU/9rVZ0hMu3SpQhDlPaMyd0HDaP21YSDlQnEwjzR+Yt13uj074FEj
 KPy2tX8bO91EX5nu18k9vDULWZLEbA+TFoa2roe1R/OEFydNWnxIYcl6r
 XYlHIrC/AMuJ+S5uXmSxq773XYjigZrdcNRKjmikSHwQKsbCczQ6eg5+/
 Mz+6QDrxHqj5LuZh6xC2pWIlNHU5VVba/KB5JNQYv2Wn7Bnew+KMum1Nu
 3rPzTRR1DE8WLMhnAeDqP2vRQLb4wKOmiYTSs79pkpRN/UU2EqpdCpIqn
 Q1o9E5s/DglC2GlBdTwSdWwSbqDqY5X4zBJeEx3BQAEKl8LWbhq9KgO/A Q==;
IronPort-SDR: 3C45ie6KGoNNXNnAoh5a7V/Qm+JMg4g+69iGD36qD9Hj50c4lV7LAJURzN+btR3YgZCwulh0bm
 H8LspNpCeNla9qLonXtAGI0O3UJ89+tiNcWjtOK8Fvp8/A3P4wMHTRuFAFDPbL4wYDkNhhU1Jk
 7wBUgxAs+Czlzke7O7YCRwCA0DPdVBLRs7RxOJtNMrt9uDlGPT4LlDj83g/XdtsOK+3XpQGF4l
 6DL2+oycGkPKBrHOsxEBRikzkx2MM51FiKnhsduzeQ+jystN29rS+SGrHWZOO4ezmw34gZpIl6
 RzY=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966117"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:45:58 +0800
IronPort-SDR: 1+rJeBaCAD2XncIQUuMdrCpHQ4Emw1o87TeREXaFO7oEOMvzaFGmTdyKiWsm7QT2aNUfFgoiIJ
 fhqzuCTAo6pJstegHJWT3Koz43/tr4LC4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:26 -0700
IronPort-SDR: x27YsbO1KVXuwcO1coWKuCCOUz0CEkeOSTXMxHLCyjOMlyEdoh9s5hWmoxbaG9WTGee2GcC+DR
 DbQR7vLieVwg==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 05/11] RISC-V: Set maximum number of mapped pages correctly
Date: Thu, 25 Jun 2020 16:45:10 -0700
Message-Id: <20200625234516.31406-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200625234516.31406-1-atish.patra@wdc.com>
References: <20200625234516.31406-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, maximum number of mapper pages are set to the pfn calculated
from the memblock size of the memblock containing kernel. This will work
until that memblock spans the entire memory. However, it will be set to
a wrong value if there are multiple memblocks defined in kernel
(e.g. with efi runtime services).

Set the the maximum value to the pfn calculated from dram size.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bad60686d080..4021706aef81 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -147,9 +147,9 @@ void __init setup_bootmem(void)
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	set_max_mapnr(PFN_DOWN(mem_size));
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = max_pfn;
+	set_max_mapnr(max_low_pfn);
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	setup_initrd();
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
