Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C34EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fk+uF1e3pTdtwJFrcgsBX92ce34Cdys87owOrFPz+TM=; b=u26qGlu0X7PbcY
	bl/VT5t0gwSfs6CIWRsc3RUgh+nx4+pVhFuxRGleuViNlU3WOK2xFJe5MJHNKiLiD1XNCV7ldca4l
	nfPbwdF6dbuFJhjeBgvqnT64sxB7LXX6c31WTWiHm2xhsK0PySnldVp1PKiiwTp2KApU0igxeQxn2
	AOcpmqNV4ZG22LBBNszFIuir8VZWnDTn051QcJ+/yiCauFIXbVwL55uLW8+uNHAqZEEh0gfMgEjQd
	y74ZJFkezge/qR1CRNrJheYy7aeS+3UYS/6Z48yOjSn1Hl2KdwKc/VNdCiayQ7c1qGtDzQLiFPIDr
	rp2pwjDO0NBKklDbXPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvWk-00GRDx-2X;
	Mon, 07 Aug 2023 08:23:46 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvWh-00GRC2-1n
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 08:23:45 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3778N83c098807;
	Mon, 7 Aug 2023 16:23:08 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 7 Aug 2023
 16:23:07 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <ajones@ventanamicro.com>, <alexghiti@rivosinc.com>,
        <anup@brainfault.org>, <rppt@kernel.org>, <samuel@sholland.org>,
        <panqinglin2020@iscas.ac.cn>, <sergey.matyukevich@syntacore.com>,
        <maz@kernel.org>, <linux-riscv@lists.infradead.org>,
        <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>
CC: <ycliang@andestech.com>, <x5710999x@gmail.com>, <tim609@andestech.com>,
        Dylan Jhong <dylan@andestech.com>
Subject: [PATCH 0/1] Enhanced TLB flushing for vmap/vmalloc()
Date: Mon, 7 Aug 2023 16:23:04 +0800
Message-ID: <20230807082305.198784-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3778N83c098807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_012344_048343_9A486895 
X-CRM114-Status: UNSURE (   5.74  )
X-CRM114-Notice: Please train this message.
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

This patch is actually the v2 version of the this patch[1]. In the v1 version,
Alexandre suggested that I should make the patch more general, so I even changed
the title accordingly. Many thanks to Alexandre.

And Alexandre also submitted a similar patch[2] recently, in which he implemented
TLB flushing via flush_cache_vmap() instead. However, it seems that flush_cache_vmap()
does not cover every place where arch_sync_kernel_mappings() performs TLB flushing.
IMHO, arch_sync_kernel_mappings() cannot be replaced by flush_cache_vmap().
Please correct me if I'm wrong!

[1]: [PATCH] riscv: Flush stale TLB entry with VMAP_STACK enabled
     http://lists.infradead.org/pipermail/linux-riscv/2023-August/037503.html

[2]: [PATCH -fixes] riscv: Implement flush_cache_vmap()
     https://www.spinics.net/lists/kernel/msg4873712.html

Dylan Jhong (1):
  riscv: Implement arch_sync_kernel_mappings() for "preventive" TLB
    flush

 arch/riscv/include/asm/page.h |  2 ++
 arch/riscv/mm/tlbflush.c      | 12 ++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
