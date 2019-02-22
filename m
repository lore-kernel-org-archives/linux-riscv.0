Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CD9C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 553DB206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hdHJG1pT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NRwJKNiA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 553DB206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ta9gXPE3TfFK+SXfYXeO+10Ybyu0RNdH1K6svt3iFso=; b=hdHJG1pTQmf1zfgQqnaKvkB4uT
	tJY5puVRJTGL7/H674oqWh61EuH2poclCrHK6p3T/9dFgkA0N95mw2uqPXLy5OL90ewRSm3zCwgyk
	FcIIvAAnMD7quYLyGCwnnA3VwhptRMw+TmfPtAc/N4lIT/r4vSYKYsDmfPRKfgAycbI0BpeWbFH9d
	mb3Hd2vMeRoWBcnVGH9/6nYVhaosxGJV0yw99NQs5FeLewaFDw9YkVqcBJ8D8fAGZ9ctmFx/yL7jR
	HxXYYR6D5/uzR72SUyhFequtIRyvBn0debxy6JzyQ8iEWzIXLQVvujTwIPyH0mE3JYG5Zjw/88uSO
	Z75kJ7ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxGiM-0007Tb-SQ; Fri, 22 Feb 2019 19:42:30 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGiG-0007KC-Mm
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 19:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550864545; x=1582400545;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=BXPJoBB0Kgm4J4WvDGeNZxKZbFFkYo9XWYKOd8CvDv0=;
 b=NRwJKNiAMHkLYBkwOvyAeqyH/ClQxjY0HZHvXAcleW9nkn+hhvwJnI6Q
 1hDveMAQT8FAf9XvbpyJMwpsUnO51zu304S4tfu+QrmOnAdT2kne0pNt7
 C7ppGJ77ufWPGyd1gKw1TLvt/Sq8oGxYvgPotId2JHf08poBJSA63InES
 P8MmrxobY0w28o63x8Ga/M4WUMEUIlYec+ksZUdyyt5tIJFZ1uQa+2dDm
 zGlPs5cEP2gHb9R7VcsD9MlHPhPkjoOVbpCeaaGjqtoCitlUMzHGBcmL6
 oZzRNhQY7Y+pW6s5Oq26LW7J/fKrNgAhlnQZcUoUV6rl1/jOSF21yzbLd Q==;
X-IronPort-AV: E=Sophos;i="5.58,400,1544457600"; d="scan'208";a="101966791"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Feb 2019 03:42:04 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 22 Feb 2019 11:20:03 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Feb 2019 11:41:45 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v6 PATCH 4/6] RISC-V: Allow hartid-to-cpuid function to fail.
Date: Fri, 22 Feb 2019 11:41:38 -0800
Message-Id: <1550864500-13652-5-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
References: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_114224_880774_9E0A6FC3 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

It is perfectly okay to call riscv_hartid_to_cpuid for a hartid that is
not mapped with an CPU id. It can happen if the calling functions
retrieves the hartid from DT.  However, that hartid was never brought
online by the firmware or kernel for any reasons.

No need to BUG() in the above case. A negative error return is
sufficient and the calling function should check for the return value
always.

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
