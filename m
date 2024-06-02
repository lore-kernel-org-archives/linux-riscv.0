Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BD3C25B74
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jun 2024 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfAhdfN0unSN7wQ/zTfA4UTqvhbz+c+szqkzMGzDdV8=; b=gkVGhKffDYNV9X
	PSfy5O/zlD7ThR1/Dd3nqGj+kL2rDr70RgLwCo/CwnfOCed0QpsXhOk1bqTsAC58xcNUZBVXGaBiT
	4xPbpdldtJNQV1auRsEuJHCBmaacL6lLViAz/ACVhUtlnjV5tVdVuEVQlHLw1C33AWDjxXQjlaF5Z
	K2Lb6z+U9JLKAH7yvV1BvKQQUDQWzo+krN6E5o2OTFdnsd8j/DGqO8PeiR7xRHpEQSLfwNj0n8XIE
	693jTLugyOClx9zoStrv5LckO51diI4Gb+RMk+u8rS7CdK6duhDnqk4K4xvCqP5ZbwM6omWoGqZhn
	6NyMNX9TDOJQhIqxluyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDfhf-0000000DtsL-1588;
	Sun, 02 Jun 2024 07:32:31 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDfhV-0000000Dtqw-3uY4
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jun 2024 07:32:24 +0000
Date: Sun, 2 Jun 2024 09:32:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717313537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MaeXkfU5+d9iME/l5SX4YTaljCevq2NVRlbP81IKuU=;
	b=OZc6I9qsg1cGXYuLdROyGA49u1EnXdtNWafGGioa6SDOp12ApWkTyVUDBep4y1wzszdaG7
	sGalfIeBgA/EAHqPc+sXNbxNJm035sVKzr/NkfLIWLiuNzEQdHf7knJTk11VlmJjtQXizg
	hBabohPZdGdwrxFlUVrXN3e+nKYFapWwnyKb9otg9W51jsee9/jTBAEOJaCy7Ag8BCWVsx
	uyV9FPYbGCclvHvGqAFAWdlrgpXq5DlbWFVj9BbNgn6Z5eUxivgsHFr41yso0KmRPjixln
	7dmGF8yAcuHi1N39J9ZQQ+Zf/9LPnBkRWuZjLPZNXUNI8K6LrXQPpfrm0msXUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717313537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MaeXkfU5+d9iME/l5SX4YTaljCevq2NVRlbP81IKuU=;
	b=joR/8rMo8+qdZcxRgUK4sNXpNs4h81q5qpBECmx26RwTojRNGMqDkD69QD86U8H5vV3SoQ
	g4LoyxDl42IAaNDA==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 7/7] riscv: remove limit on the size of read-only section
 for XIP kernel
Message-ID: <20240602073210.w0CKrGlj@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
 <9eea4b61f7b6300def3b6582d8e465ef4207501e.1715286093.git.namcao@linutronix.de>
 <2e092f39-0716-4b73-9268-da9211a4b600@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e092f39-0716-4b73-9268-da9211a4b600@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240602_003222_192521_604172CA 
X-CRM114-Status: GOOD (  15.22  )
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

On Mon, May 27, 2024 at 02:58:14PM +0200, Alexandre Ghiti wrote:
> > diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
> > index 8c3daa1b0531..01f73f2ffecc 100644
> > --- a/arch/riscv/kernel/vmlinux-xip.lds.S
> > +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
> > @@ -65,10 +65,10 @@ SECTIONS
> >    * From this point, stuff is considered writable and will be copied to RAM
> >    */
> >   	__data_loc = ALIGN(PAGE_SIZE);		/* location in file */
> > -	. = KERNEL_LINK_ADDR + XIP_OFFSET;	/* location in memory */
> > +	. = ALIGN(SZ_2M);			/* location in memory */
> 
> You can't use SZ_2M here since it corresponds to PMD_SIZE for rv64 but on
> rv32 (which is allowed to use xip kernels), it's 4MB. Use SECTION_ALIGN
> instead.

SECTION_ALIGN doesn't work unfortunately. For XIP, SECTION_ALIGN is
L1_CACHE_BYTES which is 64 bytes, but we need at least PMD_SIZE alignment
to setup virtual mapping.

Ideally we use PMD_SIZE here, but I can't #include that header file.
Probably we can refactor the header files so that we can #include the
header file that PMD_SIZE is in. But I am not sure if it's worth it.

I'm thinking just go for:
ifdef CONFIG_64_BIT
	. = ALIGN(SZ_2M);
#else
	. = ALIGN(SZ_4M);
#endif

Or even simpler, just:
	. = ALIGN(SZ_4M);

As much as I hate magic numbers, I think we can give linker script some
leeway. Perhaps with an explanation why this alignment is chosen?

Or do you have a better idea?

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
