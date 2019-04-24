Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F86C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 05:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70132148D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 05:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LuEwhBsQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnX2l9JJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70132148D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9I/B+86izeuRIQoVYNnKJ8hPLFLcZ4AUnhG0AzGli8=; b=LuEwhBsQTUu7vT
	ef2JOw8yxzNN6uSXnRXWxzDu3PSWti+gzgf0mpHXPRTKKYcdYpacCsng61dGMpbbDZZPembVcBbWm
	hjveTfXtRMUEIUr6jcv20SDSyW5TiXtQKOrButpuMUQ+sGsNLlrLLKZaV3T5CW2B6fk1IXqz3DHl4
	KJkn9SGIFWts+H1asxqBZHxt0ewAD941UXibwt7zrmFIasyfg801KfnweZlA4RKaT1kvC5End0iLd
	qmJnBZCFIJHqYudZ0rwY8e4oz3UtWvfK1cV0qOVhyyDKgV6Nx/JYyzeE5y6wBvEXjDmWJh1t4I4h4
	mcpLilAqBA7/8MVdSt+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJAuD-00030h-El; Wed, 24 Apr 2019 05:57:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJAuA-00030M-Ic
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 05:57:15 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1ED3020685;
 Wed, 24 Apr 2019 05:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556085434;
 bh=V9Pz+gYUFLVTL56/7KV0ypL1it59CR9uq1PLv5VuzB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YnX2l9JJBTVusTxchGtFcEp6fQM0t93aRf1lW0yDXmE5Bxxp4zbsetVjL4CPQCT2W
 HmdGWm9G8rlkHmLD1gDyEhK95ywFbfnvWNTRacNmVV2dOMwMRIUWYt0J/791yBGyTQ
 CJ5asGfoMJaZBslWZa5j/9FzfRVL83DHkzhgZXMw=
Date: Wed, 24 Apr 2019 13:57:03 +0800
From: Guo Ren <guoren@kernel.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Message-ID: <20190424055703.GA3417@guoren-Inspiron-7460>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de>
 <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de>
 <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
 <20190424020803.GA27332@guoren-Inspiron-7460>
 <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_225714_644739_FA3B9B34 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Andrew Waterman <andrew@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup.patel@wdc.com>,
 Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincentc@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, "ren_guo@c-sky.com" <ren_guo@c-sky.com>,
 Scott Wood <swood@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "tech-privileged@lists.riscv.org" <tech-privileged@lists.riscv.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Gary,

On Wed, Apr 24, 2019 at 03:21:14AM +0000, Gary Guo wrote:
> > Look:
> > linux-next git:(riscv_asid_allocator_v2)$ grep GLOBAL arch/riscv -r
> > arch/riscv/include/asm/pgtable-bits.h:#define _PAGE_GLOBAL    (1 << 5)    /*
> > Global */
> > arch/riscv/include/asm/pgtable-bits.h:                                    _PAGE_USER |
> > _PAGE_GLOBAL))
> > 
> > Your patch tell us _PAGE_USER and _PAGE_GLOBAL are duplicate and why we
> > couldn't make _PAGE_USER implies _PAGE_GLOBAL? Can you give an example
> > of a real scene in PTE about:
> >   _PAGE_USER:0 + _PAGE_GLOBAL:1
> > or
> >   _PAGE_USER:1 + _PAGE_GLOBAL:0
> > 
> > Of cause I know USER & GLOBAL are conceptually very different, but
> > there are only 10 attribute-bits for riscv (In fact we've wasted two bits
> > to support huge RV32-pfn :P). So I think it is time to merge these two bits
> > before hardware supports GLOBAL. Reserve them for future!
> 
> Two cases I can think of:
> * vdso like things. They're user pages that can really be shared across address spaces (i.e. global). Kernels like L4 implement most systems calls similar to VDSO, so USER + GLOBAL is useful.
Vdso is a user space mapping in linux, See: fs/binfmt_elf.c

static int load_elf_binary(struct linux_binprm *bprm) {
...
#ifdef ARCH_HAS_SETUP_ADDITIONAL_PAGES
	retval = arch_setup_additional_pages(bprm, !!elf_interpreter);
	if (retval < 0)
		goto out;
#endif /* ARCH_HAS_SETUP_ADDITIONAL_PAGES */

All linux archs use arch_setup_additional_pages for vdso mapping and
every process has its own vdso mapping to the same pages.

I don't think vdso is a real scene for GLOBAL in PTE.

> * hypervisor without H-extension: This requires shadow page tables. Supervisor
> pages are mapped to supervisor shadow pages. However these shadow pages cannot
> be GLOBAL because they can't be shared between VMs. So  !USER + !GLOBAL is useful.
Hypervisor use 2-stages TLB translation in hardware and shadow page
tables is for stage 2 translation. Shadow page tables care vmid not
asid.
If hardware don't support H-extension (MMU 2-stages translation), it's
hard to accept for virtualization performance.

I don't think hypervisor is a real scene for GLOBAL in PTE.

Are there other scene for GLOBAL in PTE?

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
