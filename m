Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544EFC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 19:24:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231F42078D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 19:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H/MXMckU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeI8lPtK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 231F42078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kz/29xK3zFofXJSbO9lIqyGCj4GDUszNdd5CZ8GeiE8=; b=H/MXMckUMbCxiA8d9tu+Tzsuj
	qMhM25emaJ5ik3l4v3hvZa09MPvhKuaj0m5bAahLurrHufQa7YIFVHVVRJGCVZPiUWwkpwnYcECks
	F/Qw/QxalWGEjJAVlslzxV/y0R6+CDcPbjadgdbNHYx4NrkeuqCi9xszRGtG+oSAF4vUPZUc3M7Mq
	1s62l+IBTz/0Xmp5Miq7lZRzKH59wi7odGVw66GkxdeKE4TkABr58M4mlD8GM1ERzt7aAJVc32Xk/
	sHp4BFymCKWVr4BACwIeTtRO6CaoILqwTgFGFsXfs8AtpTHOjKOH5p1djiKrLNjAtSo8yVZMi6qu7
	yvVfWwzZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Th4-0005WW-AP; Wed, 19 Aug 2020 19:24:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Tgu-0005Sy-5X; Wed, 19 Aug 2020 19:24:09 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9402E2078D;
 Wed, 19 Aug 2020 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597865047;
 bh=6hhM8PiKqrI8OznN19QgLRQ0zl2av/Rwj0VbHVeg6TI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GeI8lPtKHV2olB+n1d/AHlFuCQdtbzjHW+ZeY/rUdgLakHkOt9wUYAnS0FY5DAaBS
 I2RN/QPVX1NYA77mL4Gju2LBembz/syr0lV3QTr54MfcpA1iUpBgt41tqO0dgw0etA
 mFQuuqulIWY5wbe9fNPxiTsAazhpzTtzhltFAhpw=
Date: Wed, 19 Aug 2020 12:24:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 09/17] memblock: make memblock_debug and related
 functionality private
Message-Id: <20200819122405.88e9719e86ac7c3c44b4db32@linux-foundation.org>
In-Reply-To: <20200818151634.14343-10-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-10-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_152408_457374_88455E4C 
X-CRM114-Status: GOOD (  18.82  )
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 18 Aug 2020 18:16:26 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The only user of memblock_dbg() outside memblock was s390 setup code and it
> is converted to use pr_debug() instead.
> This allows to stop exposing memblock_debug and memblock_dbg() to the rest
> of the kernel.
> 
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -137,7 +137,10 @@ struct memblock_type physmem = {
>  	     i < memblock_type->cnt;					\
>  	     i++, rgn = &memblock_type->regions[i])
>  
> -int memblock_debug __initdata_memblock;
> +#define memblock_dbg(fmt, ...) \
> +	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> +

checkpatch doesn't like this much.

ERROR: Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects
#101: FILE: mm/memblock.c:140:
+#define memblock_dbg(fmt, ...) \
+	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#102: FILE: mm/memblock.c:141:
+	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)

ERROR: trailing statements should be on next line
#102: FILE: mm/memblock.c:141:
+	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)


The first one is significant:

	if (foo)
		memblock_dbg(...);
	else
		save_the_world();

could end up inadvertently destroying the planet.

This?

--- a/mm/memblock.c~memblock-make-memblock_debug-and-related-functionality-private-fix
+++ a/mm/memblock.c
@@ -137,8 +137,11 @@ struct memblock_type physmem = {
 	     i < memblock_type->cnt;					\
 	     i++, rgn = &memblock_type->regions[i])
 
-#define memblock_dbg(fmt, ...) \
-	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
+#define memblock_dbg(fmt, ...)						\
+	do {								\
+		if (memblock_debug)					\
+			pr_info(fmt, ##__VA_ARGS__);			\
+	} while (0)
 
 static int memblock_debug __initdata_memblock;
 static bool system_has_some_mirror __initdata_memblock = false;
_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
