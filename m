Return-Path: <SRS0=IS4U=WX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44303C3A5A3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2019 14:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B78C206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2019 14:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sX1j5S4C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B78C206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEi35Jb2Mp/wLRARpQuLIZQ+znOpd51VZKkMY2iSxIo=; b=sX1j5S4C9pERhf
	JEIKFU4TCbuG7HoxuM2/A2VOQd8wnWU0OLjpy0dgFcjjjEtUSKG/AnvJcfKN3bd2oQ/9hi5HhO/7o
	EYG0aOD1sKOPAagXfDuTf/0ULxQeEPvKVS/bFmCQ3Gi1aA3VpVTe0oB1xpKt9NQ/5TstAvDtqjD89
	OYPQhcJoXB0k4mQsoQLacqp9xXh9tNof8PIv5agFNJCj1pNqGJeWjLc1meKa8qKVcNj85GclJRKYN
	h3q0q0Crq5JpM32kOb6GFTNfzdpgieLj7Kl99+gY149E+yW/g4xmXX/S6EuJeYyqf9GrGQvDvV5Zy
	kujSEog/YhY+YWsRCzvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2c5U-0004DV-7W; Tue, 27 Aug 2019 14:04:44 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i2c5S-0004DE-5P; Tue, 27 Aug 2019 14:04:42 +0000
Date: Tue, 27 Aug 2019 07:04:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC PATCH 1/2] RISC-V: Mark existing SBI as legacy SBI.
Message-ID: <20190827140442.GB21855@infradead.org>
References: <20190826233256.32383-1-atish.patra@wdc.com>
 <20190826233256.32383-2-atish.patra@wdc.com>
 <20190827140304.GA21855@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827140304.GA21855@infradead.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Gary Guo <gary@garyguo.net>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 27, 2019 at 07:03:04AM -0700, Christoph Hellwig wrote:
> > +#define SBI_EXT_LEGACY_SET_TIMER 0x0
> > +#define SBI_EXT_LEGACY_CONSOLE_PUTCHAR 0x1
> > +#define SBI_EXT_LEGACY_CONSOLE_GETCHAR 0x2
> > +#define SBI_EXT_LEGACY_CLEAR_IPI 0x3
> > +#define SBI_EXT_LEGACY_SEND_IPI 0x4
> > +#define SBI_EXT_LEGACY_REMOTE_FENCE_I 0x5
> > +#define SBI_EXT_LEGACY_REMOTE_SFENCE_VMA 0x6
> > +#define SBI_EXT_LEGACY_REMOTE_SFENCE_VMA_ASID 0x7
> > +#define SBI_EXT_LEGACY_SHUTDOWN 0x8
> 
> As Mike said legacy is a bit of a weird name.  I think this should
> be SBI01_* or so.  And pleae align the numeric values and maybe use
> an enum.
> 
> > +
> > +#define SBI_CALL_LEGACY(which, arg0, arg1, arg2, arg3) ({             \
> >  	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);	\
> >  	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);	\
> >  	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);	\
> 
> Instead of the weird inline assembly with forced register allocation,
> why not move this to pure assembly?  AFAICs this is the whole assembly
> code we'd need:
> 
> ENTRY(sbi01_call)
>         ecall
> END(sbi01_call)

Actually we'll need a mv to a7 for the function id, but the point
still stands.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
