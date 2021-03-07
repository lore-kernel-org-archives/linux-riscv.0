Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619ACC433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:26:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C71B6501E
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C71B6501E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0RhhSA/WTP7oT/8km3rz+d0+OpYS6mQXQQ/BtZdL1ZM=; b=cF/JSU8ELK0k0AeiUzgV2xWJs
	6Il3MFfNITrpsdwkkETZzQxQKGfhp7iU2AEeQU8vFyc9EvAn74BOzbYzte0S2SsPDAQ37bA14srLd
	h6Jj72EOQoPgqdneufW/0Tdj45weHkre3LtCfS7GwBL/qdVQuxL5Jy/DOHaUx2bKpr11s6apAPp+1
	Op8/vqBb5ChEgqSazcC/W0QOBF0fMEsovnR+vZsxGZOO6OfbGjzsw561Rh1dyc4WXGoandFpbjm9Y
	Ucv9nRycgThtgCGZ1b3bw7IfotgAqFG9CKGTT35OBKKjGJUzfnDXF1+Cjvr2gt/IkoDsjaP8EYPzU
	wN9ZKiT6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIvIp-00AgUG-0C; Sun, 07 Mar 2021 15:26:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIvI8-00Ag8a-M0; Sun, 07 Mar 2021 15:26:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB50365004;
 Sun,  7 Mar 2021 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615130759;
 bh=V/rnb1AVNwtLWMi0d9qcbLHFs+41XoX6fyeCxePOyVo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=m5HRiDdx10OLhRHK7devuG46qhiuHWpQS7aRYMmVErpTy/4Aj3iP2oex/LZXG7V8N
 e2S16hewcRlOV694+/w+310EMHS8dDiWf5HBf6k/E+LHkcSiOD93RmGZzbtvAqiWZq
 nuRG3vPva/JobbIbXfFKg2rvDd/itxsWaQW2JcfA=
Subject: Patch "mm: Remove examples from enum zone_type comment" has been
 added to the 5.10-stable tree
To: akpm@linux-foundation.org, anshuman.khandual@arm.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com,
 frowand.list@gmail.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 guro@fb.com, hch@lst.de, jingxiangfeng@huawei.com, lenb@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 nsaenzjulienne@suse.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
 rjw@rjwysocki.net, robh+dt@kernel.org, rppt@kernel.org,
 song.bao.hua@hisilicon.com, sudeep.holla@arm.com, wangkefeng.wang@huawei.com,
 will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 07 Mar 2021 16:25:45 +0100
In-Reply-To: <20210303073319.2215839-8-jingxiangfeng@huawei.com>
Message-ID: <1615130745254160@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_152601_219121_5E5488E6 
X-CRM114-Status: GOOD (  12.65  )
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


This is a note to let you know that I've just added the patch titled

    mm: Remove examples from enum zone_type comment

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mm-remove-examples-from-enum-zone_type-comment.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Mar  7 04:22:37 PM CET 2021
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Date: Wed, 3 Mar 2021 15:33:19 +0800
Subject: mm: Remove examples from enum zone_type comment
To: <gregkh@linuxfoundation.org>, <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>, <nsaenzjulienne@suse.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>, <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>, <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>
Cc: <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <frowand.list@gmail.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, <jingxiangfeng@huawei.com>, <wangkefeng.wang@huawei.com>, Christoph Hellwig <hch@lst.de>
Message-ID: <20210303073319.2215839-8-jingxiangfeng@huawei.com>

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

commit 04435217f96869ac3a8f055ff68c5237a60bcd7e upstream

We can't really list every setup in common code. On top of that they are
unlikely to stay true for long as things change in the arch trees
independently of this comment.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/r/20201119175400.9995-8-nsaenzjulienne@suse.de
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/mmzone.h |   20 --------------------
 1 file changed, 20 deletions(-)

--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -354,26 +354,6 @@ enum zone_type {
 	 * DMA mask is assumed when ZONE_DMA32 is defined. Some 64-bit
 	 * platforms may need both zones as they support peripherals with
 	 * different DMA addressing limitations.
-	 *
-	 * Some examples:
-	 *
-	 *  - i386 and x86_64 have a fixed 16M ZONE_DMA and ZONE_DMA32 for the
-	 *    rest of the lower 4G.
-	 *
-	 *  - arm only uses ZONE_DMA, the size, up to 4G, may vary depending on
-	 *    the specific device.
-	 *
-	 *  - arm64 has a fixed 1G ZONE_DMA and ZONE_DMA32 for the rest of the
-	 *    lower 4G.
-	 *
-	 *  - powerpc only uses ZONE_DMA, the size, up to 2G, may vary
-	 *    depending on the specific device.
-	 *
-	 *  - s390 uses ZONE_DMA fixed to the lower 2G.
-	 *
-	 *  - ia64 and riscv only use ZONE_DMA32.
-	 *
-	 *  - parisc uses neither.
 	 */
 #ifdef CONFIG_ZONE_DMA
 	ZONE_DMA,


Patches currently in stable-queue which might be from jingxiangfeng@huawei.com are

queue-5.10/of-unittest-add-test-for-of_dma_get_max_cpu_address.patch
queue-5.10/mm-remove-examples-from-enum-zone_type-comment.patch
queue-5.10/arm64-mm-set-zone_dma-size-based-on-devicetree-s-dma-ranges.patch
queue-5.10/of-address-introduce-of_dma_get_max_cpu_address.patch
queue-5.10/arm64-mm-move-zone_dma_bits-initialization-into-zone_sizes_init.patch
queue-5.10/arm64-mm-set-zone_dma-size-based-on-early-iort-scan.patch
queue-5.10/arm64-mm-move-reserve_crashkernel-into-mem_init.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
