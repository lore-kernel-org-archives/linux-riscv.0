Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138B3C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8CBE2184A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRFJlZ1C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VvImXXY+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8CBE2184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1ohqkYrYbHi7JsdRtBpb7ro2zRfGBy4MjqRl3r7PSyQ=; b=uRFJlZ1CqPLxQRK44Q48edT57V
	yi1xN+5gHlWbbHUkNT1Phq9psqNVZe8hu9Jl62RbKQBFFb7PLa5g7tdJhFVH5kOjgYq4B9WvOHKq0
	/e74muRPB8dmygvqnrlcYwn0uZnCqES1QnB5D2dutNaC1UpttClb0nDsXzrEJ+QD4eQ2QzZ5ho09j
	893VLvCBzmW2d8ks2eOh1KdvzEBO+brXO8XtWJHwoP19j4mFIt1smO4GyrQZo8X0IHXyvTCaJarWj
	OTlRZIImqQ79SFBi1bW58JMaBaZ+SYca1AFixGsntZBZUbmgBVipq5++9WKCcxGZhXlU1VKQwMgAF
	NlXUzISw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtVxY-00035G-9O; Tue, 12 Feb 2019 11:10:40 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtVxP-0002rL-Jp
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 11:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549969832; x=1581505832;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=bTj3ZFVXgC5G434PAQjLdqn3TV1DqlyoGc/NiuvITNw=;
 b=VvImXXY+lxnyV/O4LxBvzm5kSidZVJ6HxlX4voSwRxmfWamfDgZ2d7HP
 d2I3IHsk7O+j8qI3INfV//FVD6LoJ3GMzHE43kILqmzcLHGW0DJspyc5x
 K/q0RP/GXCynAiwAvB2k+Z/VWaBrL86sVsRu1NZeANjF8fCtBa7miaD3l
 FZKnngFd0ZCej2zhXRBTf8G/E62ZWvKrWrM8utRt3IgakMRfjUlQ5PAz1
 fBxjZgfJHlHqFcd2mJEZSHaHZlN/a8Ap+o9FtxE/ftCewD+R8wOgPaljq
 nZony7cmaHFcMHP/TGCAtedPIGw3Ok+yI7AnCQ4DZQAS5YzXnZTFgSajV A==;
X-IronPort-AV: E=Sophos;i="5.58,361,1544457600"; d="scan'208";a="102308199"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 19:10:22 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 12 Feb 2019 02:48:57 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Feb 2019 03:10:22 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v4 PATCH 5/8] RISC-V: Compare cpuid with NR_CPUS before mapping.
Date: Tue, 12 Feb 2019 03:10:09 -0800
Message-Id: <1549969812-22502-6-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_031032_045819_6F7C18DB 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We should never have a cpuid greater that NR_CPUS. Compare with NR_CPUS
before creating the mapping between logical and physical CPU ids. This
is also mandatory as NR_CPUS check is removed from
riscv_of_processor_hartid.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d369b669..eb533b5c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -66,6 +66,11 @@ void __init setup_smp(void)
 			found_boot_cpu = 1;
 			continue;
 		}
+		if (cpuid >= NR_CPUS) {
+			pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
+				cpuid, hart);
+			break;
+		}
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
