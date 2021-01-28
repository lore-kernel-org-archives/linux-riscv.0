Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022CEC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 03:18:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1568664DD0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 03:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1568664DD0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L2YDssGknW0YhFTXYa7kwqdg5PofbSS0Qiseoe8vfhA=; b=T8fXizU+EtSy77DyUQLOfcTmhI
	Rm129hOh9HtDSXx3Zc8GrJhL5sFBLBf2U3vdE0QP0ZxpLro9i/6n+qiFGZPzYDOR4qw3Gbysss8ST
	RBvd/WAzkUs8pNayWyeLXwf7qfNpUmMH8KSOQwzvZUzg8hY8lBVWyY78Fnk5HuXSn8+DU/bNSKqph
	s77I2wHIpDcYhmIfTbcDDxL92fo3o9ka27f655jKirvCfzzxaSwrZ3goRuIh5IsPPwNhWmss0hhK9
	G2MgvDfQ1WsVNGFiRUTvA4BankMqbzcs+4mQq6uoK2VjH3kxsl1wrOHb29Ug4XjNbptGMaZObIJql
	B+33t8Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4xp5-0005L9-PN; Thu, 28 Jan 2021 03:18:19 +0000
Received: from [2601:1c0:6280:3f0::7650]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4xp3-0005Kk-3E; Thu, 28 Jan 2021 03:18:17 +0000
To: LKML <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Kconfig-induced build errors: CONFIG_PAGE_OFFSET
Message-ID: <b67f8941-6624-d814-e6d3-2ddfdfbdf7dd@infradead.org>
Date: Wed, 27 Jan 2021 19:18:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

I took a riscv-32 .config from kernel test robot (it was for a clang build)
and did a "make olddefconfig" (using gcc tools) and got build errors
due to this config item from arch/riscv/Kconfig;


config PAGE_OFFSET
	hex
	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
	default 0x80000000 if 64BIT && !MMU
	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB

PAGE_OFFSET is undefined for the case of 32BIT && MAXPHYSMEM_2GB.
That causes lots of errors when _AC() is used to paste
CONFIG_PAGE_OFFSET to "UL", like these:

In file included from ../include/vdso/const.h:5,
                 from ../include/linux/const.h:4,
                 from ../include/linux/bits.h:5,
                 from ../include/linux/bitops.h:6,
                 from ../include/linux/kernel.h:11,
                 from ../init/do_mounts_initrd.c:3:
../arch/riscv/include/asm/uaccess.h: In function '__access_ok':
../arch/riscv/include/asm/page.h:34:46: error: 'UL' undeclared (first use in this function)
   34 | #define PAGE_OFFSET  _AC(CONFIG_PAGE_OFFSET, UL)
      |                                              ^~
../include/uapi/linux/const.h:20:23: note: in definition of macro '__AC'
   20 | #define __AC(X,Y) (X##Y)
      |                       ^
../arch/riscv/include/asm/page.h:34:22: note: in expansion of macro '_AC'
   34 | #define PAGE_OFFSET  _AC(CONFIG_PAGE_OFFSET, UL)
      |                      ^~~
../arch/riscv/include/asm/pgtable.h:26:27: note: in expansion of macro 'PAGE_OFFSET'
   26 | #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
      |                           ^~~~~~~~~~~
../arch/riscv/include/asm/pgtable.h:41:24: note: in expansion of macro 'VMALLOC_START'
   41 | #define VMEMMAP_START (VMALLOC_START - VMEMMAP_SIZE)
      |                        ^~~~~~~~~~~~~
../arch/riscv/include/asm/pgtable.h:50:26: note: in expansion of macro 'VMEMMAP_START'
   50 | #define PCI_IO_END       VMEMMAP_START
      |                          ^~~~~~~~~~~~~
../arch/riscv/include/asm/pgtable.h:51:27: note: in expansion of macro 'PCI_IO_END'
   51 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
      |                           ^~~~~~~~~~
../arch/riscv/include/asm/pgtable.h:53:26: note: in expansion of macro 'PCI_IO_START'
   53 | #define FIXADDR_TOP      PCI_IO_START
      |                          ^~~~~~~~~~~~
../arch/riscv/include/asm/pgtable.h:59:27: note: in expansion of macro 'FIXADDR_TOP'
   59 | #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
      |                           ^~~~~~~~~~~
../arch/riscv/include/asm/pgtable.h:471:19: note: in expansion of macro 'FIXADDR_START'
  471 | #define TASK_SIZE FIXADDR_START
      |                   ^~~~~~~~~~~~~
../arch/riscv/include/asm/uaccess.h:56:17: note: in expansion of macro 'TASK_SIZE'
   56 |  return size <= TASK_SIZE && addr <= TASK_SIZE - size;


I suppose that it wants something like this, but someone else can
fix/use the correct default value here:

---

From: Randy Dunlap <rdunlap@infradead.org>

Provide a default value for PAGE_OFFSET for the case of
32BIT and MAXPHYSMEM_2GB.

Fixes many build errors.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 arch/riscv/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210125.orig/arch/riscv/Kconfig
+++ linux-next-20210125/arch/riscv/Kconfig
@@ -143,6 +143,7 @@ config PA_BITS
 config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
+	default 0x80000000 if 32BIT && MAXPHYSMEM_2GB
 	default 0x80000000 if 64BIT && !MMU
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
 	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
