Return-Path: <SRS0=F3Ra=MX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08594C677FC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 20:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF5F204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 20:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eD6G52Ye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF5F204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9MtIOiWZoPuSR7V+YznX+AsLjgINLcOanX7Xu90/0A=; b=eD6G52YeD313bo
	Q/rPwaXyG7fV/AENtcMw1/NgeYoMv7wOcj3axGEX8jY7DXHFPFajh/8I4rGANCN+vcdQAn+uvtjIE
	RFl2mNVaZhwPC1jyTi4drtvwfdr6ioqyaPpafcbaYvscp+nMIMw0baLgI6Q6m2+X57uS3sQw6slfn
	bd7+wNu7ZFLnFDvyLYJgcE9Q/T1zU5a3EgeGgme27vO23e3K67FAbbueE+YD/QsG3NbF8YV0EtJco
	SxS/QF6djgkCSN0wrNFZ8uzWoAfRDv5jv/wbyw5kUyOzvdRKoHSLvHMaXKvZiL4HWPi6xSkqUmy28
	x86iBYTqPXHFhQyImDMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAhTS-00074N-AE; Thu, 11 Oct 2018 20:22:22 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAhSe-0006a2-Rw; Thu, 11 Oct 2018 20:21:41 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gAhSR-0004GP-Bp; Thu, 11 Oct 2018 14:21:20 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: Christoph Hellwig <hch@lst.de>
References: <20181005161642.2462-1-logang@deltatee.com>
 <20181005161642.2462-6-logang@deltatee.com> <20181011133730.GB7276@lst.de>
 <8cea5ffa-5fbf-8ea2-b673-20e2d09a910d@deltatee.com>
 <83cfd2d7-b840-b0c6-594e-8b39be8177c1@deltatee.com>
Message-ID: <cfb2af87-7e47-539c-d149-2599f23b663a@deltatee.com>
Date: Thu, 11 Oct 2018 14:21:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <83cfd2d7-b840-b0c6-594e-8b39be8177c1@deltatee.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, michaeljclark@mac.com,
 linux-riscv@lists.infradead.org, olof@lixom.net, linux-mm@kvack.org,
 zong@andestech.com, sbates@raithlin.com, linux-kernel@vger.kernel.org,
 palmer@sifive.com, linux-sh@vger.kernel.org, andrew@sifive.com,
 aou@eecs.berkeley.edu, robh@kernel.org, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 5/5] RISC-V: Implement sparsemem
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181011_132133_292517_5136128C 
X-CRM114-Status: GOOD (  13.45  )
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
 Andrew Waterman <andrew@sifive.com>, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, Zong Li <zong@andestech.com>,
 linux-mm@kvack.org, Olof Johansson <olof@lixom.net>,
 linux-riscv@lists.infradead.org, Michael Clark <michaeljclark@mac.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181011202117.lfjpWV54LCsHwdWGCPmK1LhOQb1itMsmRfrupv0sxYw@z>



On 2018-10-11 12:45 p.m., Logan Gunthorpe wrote:
> Ok, I spoke too soon...
> 
> Having this define next to the struct page definition works great for
> riscv. However, making that happen in arm64 seems to be a nightmare. The
> include chain in arm64 is tangled up so much that including mm_types
> where this is needed seems to be extremely difficult.

Sorry for all the unnecessary churn but I've figured it out. Just had to
realize we only need mm_types.h to be included where
STRUCT_PAGE_MAX_SHIFT is finally expanded. Thus we only need it in one
more spot (fixmap.h). See below.

Thanks,

Logan

--


diff --git a/arch/arm64/include/asm/memory.h
b/arch/arm64/include/asm/memory.h
index b96442960aea..f0a5c9531e8b 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -34,15 +34,6 @@
  */
 #define PCI_IO_SIZE            SZ_16M

-/*
- * Log2 of the upper bound of the size of a struct page. Used for sizing
- * the vmemmap region only, does not affect actual memory footprint.
- * We don't use sizeof(struct page) directly since taking its size here
- * requires its definition to be available at this point in the inclusion
- * chain, and it may not be a power of 2 in the first place.
- */
-#define STRUCT_PAGE_MAX_SHIFT  6
-
 /*
  * VMEMMAP_SIZE - allows the whole linear region to be covered by
  *                a struct page array
diff --git a/include/asm-generic/fixmap.h b/include/asm-generic/fixmap.h
index 827e4d3bbc7a..8cc7b09c1bc7 100644
--- a/include/asm-generic/fixmap.h
+++ b/include/asm-generic/fixmap.h
@@ -16,6 +16,7 @@
 #define __ASM_GENERIC_FIXMAP_H

 #include <linux/bug.h>
+#include <linux/mm_types.h>

 #define __fix_to_virt(x)       (FIXADDR_TOP - ((x) << PAGE_SHIFT))
 #define __virt_to_fix(x)       ((FIXADDR_TOP - ((x)&PAGE_MASK)) >>
PAGE_SHIFT)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5ed8f6292a53..d1c3cde8c201 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -206,6 +206,11 @@ struct page {
 #endif
 } _struct_page_alignment;

+/*
+ * Used for sizing the vmemmap region on some architectures.
+ */
+#define STRUCT_PAGE_MAX_SHIFT  ilog2(roundup_pow_of_two(sizeof(struct
page)))
+
 #define PAGE_FRAG_CACHE_MAX_SIZE       __ALIGN_MASK(32768, ~PAGE_MASK)
 #define PAGE_FRAG_CACHE_MAX_ORDER      get_order(PAGE_FRAG_CACHE_MAX_SIZE)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
