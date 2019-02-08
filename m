Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037E7C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C2B20869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mBuICvsN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hzPG/ehF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8C2B20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lwGMr++5URo0U9Zi0quo9LuxGmbWfHe6+KR6xf3I3Ps=; b=mBuICvsNHS8LqtRsfd5k9YJp/c
	gNM+kn7t/abnyEz0l2y7y8XRk6tdC2+abLIAEy2ijwflhlEbnU69b+Gj50gkgDsOt47rxab8/3PXb
	ErGa/gGCRFM6/bLmHSbrfgmDCWPOFS9TJwHoM49X39EZXf+H7Ltk+WHcoJzpsIyF4uKm2bT/FDuDW
	/alAbZ8kHX34GgXqLDnWsTA8PeONBp7TkyE3IMWar6sNTuRd2qEKjQw2s9XtArzxWm3LwBeJTY4Xd
	51KYhigZ1k4GqKPYjuGRRQu8+p825MXRwHkQouI7j8od0azAf1dhJR70GABsu93t/DLzJno6X+jWr
	7jBpWGlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grvKe-0002hJ-KX; Fri, 08 Feb 2019 01:51:56 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grvKX-0002Yr-IL
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 01:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549590709; x=1581126709;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ViV6PhKpKnhRP9ucbxYfmK43deu7UXliWl3/nyU8MVA=;
 b=hzPG/ehFObhMu9QXc7gIxHOyuAPzvC4Yts/8u10/38GmPHa4D0vQXJbs
 r3hzxqxNH6Q+bc0brhtoNh5vk4HIhORgVBJAVvUpFHeB38xqiWTNYSWNO
 NrTWLK/yl7pSeo5VAQDtVRYX48qdlunrS8Rjr1UP79KwGTp9/vj7fG/+I
 YDsR4uItlzPZZCDS/+NKtKVAI7jbm4GwdogZJvR6QWHhzDwqXw5Rwl+t/
 ivI8ePeA0uzfH77FnOai8ITIUQTcxW5mPJnAPtsazJm01hMR4lBZpRfpu
 ZX7X35M2Uv4yByoua+m908YUFAwybv+9aN+DNsWlI7AhsIefVSdIRyDcb w==;
X-IronPort-AV: E=Sophos;i="5.58,346,1544457600"; d="scan'208";a="102533283"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 09:51:36 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Feb 2019 17:30:19 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2019 17:51:36 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v3 PATCH 4/8] RISC-V: Allow hartid-to-cpuid function to fail.
Date: Thu,  7 Feb 2019 17:51:17 -0800
Message-Id: <1549590681-24125-5-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_175149_867451_D3DBA340 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

It is perfectly okay to call riscv_hartid_to_cpuid for a
hartid that is not mapped with an CPU id. It can happen
if the calling functions retrieves the hartid from DT.
However, that hartid was never brought online by the
firmware or kernel for any reasons.

No need to BUG() in the above case. A negative error return
is sufficient and the calling function should check for the
return value always.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index b69883c6..ca99f0fb 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -60,7 +60,6 @@ int riscv_hartid_to_cpuid(int hartid)
 			return i;
 
 	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
-	BUG();
 	return i;
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
