Return-Path: <SRS0=Z8u2=57=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19171C2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2020 13:54:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91BE2076D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2020 13:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sf//KLnI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gae2fyGY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C91BE2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VoVfmxYHYrGT8FRKsSsoJto7pKs3GSxuLHxpm5XKHFU=; b=Sf//KLnIviO4ZiTZikKWM76VH
	Bzbu5ZGKh9r06n4wdNpBwjc8okk/uIlVJTFXiUgvZ/mru82Uu8C8nRFoGGLOGQiMt82Qzk6VxGcvi
	FaU8Qdu5JhJdw3aFPXULMfaqxKIX9eWF2DFrVlRzVaTbzRFL290D91obElCX7FLKa+8Z17UKaIpkA
	vmQk8HBXvrT9DITtFYCJl9eduRfLODbSFAAVy/yzzXll9wW4iU7JVsVgMQumj9p5FqiOfT1XVA2zR
	hok9XWC8B1/Rua9/bQTHcZa64/TFH+N1jGY2C5ioS93cgsnRGZLL6x0ykoWVnsijSfYjQD9oeyyPk
	lNFuizqrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOiUY-0007QM-N0; Wed, 15 Apr 2020 13:54:14 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOiUW-0007Pj-1I
 for linux-riscv@lists.infradead.org; Wed, 15 Apr 2020 13:54:13 +0000
Received: by mail-pg1-x543.google.com with SMTP id h69so1503015pgc.8
 for <linux-riscv@lists.infradead.org>; Wed, 15 Apr 2020 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VoVfmxYHYrGT8FRKsSsoJto7pKs3GSxuLHxpm5XKHFU=;
 b=gae2fyGYNKNIW6QFLLg6S/zYaJs+SzKeTKP5xOkozklzZ3AacLhlprRumbF3uiWLOc
 yUQkg4FmVVeVhuUbqu79kQh9OtJvjE/Fd3w+TdqFUsxnzwMRH9Exo1pCvrkgXr7XW99F
 2x9DRcTEZA2GXaKRhbId0b0tAZGBzwuWABJvDy/zpblHoAIsoLXpvOzXBGrpNE3Yqw/M
 JqkSP7+zYeHUx4Q/ujWfpbKCvtEoZsaAyeMM77SZb0mJTL6dOIwGFIWfqFz98yRL2BcF
 +N6SU7lWhfDX9Pq0/xtro15w0XIR1+no/ycot5SnPrRM0yiky3BiwJV9q3gxlgVHUwbe
 9Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VoVfmxYHYrGT8FRKsSsoJto7pKs3GSxuLHxpm5XKHFU=;
 b=MR6SnDcZIe/EFnxBDqH7eM/fadBREnmBZ0Z8RW6ftVsZBt4mqJwVj5CwxZ/1BWck7O
 Qjebz72PXJjdhsYxf3HeNMGtA2Eig9HJgPbdnQVmPOxqIwf8ceB7Fa/8v/UzG470P0wg
 XkH9B4Uz6Zl26ts5zq2MW4TeCl2VyOGSJkK1ou9NjqwSKVSn9GdmkOM5Hto7mZyoZ53x
 xJ6GC5xcmxH+YF2d98vrMQT9YHSL8krHC9808fbPY3r1KdoG9QZ9w7n5ikZNFDGjyN+N
 7XblkwD0ZBc5R5WvcHU6AJkyiLRSFJrriAEvFe6lIs1DoYN1+F9xFtXnhSio9kGBdOlN
 nzAg==
X-Gm-Message-State: AGi0PuYLm6GTVIMC7rCWsUmku5AldqCFhuc4agbC7vCCe4Cnog9fGBMX
 5Lkl+nGBxg21CVEDssL+2/I=
X-Google-Smtp-Source: APiQypJJO6A+zBPcFPvcxTlmZZcVYNubuxvGmj5zln/Mu5X8Wu0ZpS04NGAtD+yWF80GmuT7E+I8dA==
X-Received: by 2002:a63:c20:: with SMTP id b32mr10710890pgl.75.1586958850568; 
 Wed, 15 Apr 2020 06:54:10 -0700 (PDT)
Received: from localhost ([49.207.49.194])
 by smtp.gmail.com with ESMTPSA id u18sm14109144pfl.40.2020.04.15.06.54.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Apr 2020 06:54:09 -0700 (PDT)
Date: Wed, 15 Apr 2020 19:24:07 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/3] Highmem support for 32-bit RISC-V
Message-ID: <20200415135407.GA6553@afzalpc>
References: <20200331093241.3728-1-tesheng@andestech.com>
 <CAK8P3a3LokurC0n9XiwtPQh9ZgQcswMKY4b+TEsQh1VgYDNeWA@mail.gmail.com>
 <20200408035118.GA1451@andestech.com>
 <CAK8P3a1JS3_2fWrhNTZx0eTWjJa-GTb4AscTPqydpSP5EB15Yw@mail.gmail.com>
 <20200414151748.GA5624@afzalpc>
 <CAK8P3a0JW9x-Wk9Ec3+zLjPHbWAvPQx8MF-xe-PnWUgEjRAuTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0JW9x-Wk9Ec3+zLjPHbWAvPQx8MF-xe-PnWUgEjRAuTg@mail.gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_065412_100494_E68A9878 
X-CRM114-Status: GOOD (  22.71  )
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
Cc: Borislav Petkov <bp@suse.de>, Eric Lin <tesheng@andestech.com>,
 alex@ghiti.fr, Alan Kao <alankao@andestech.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Logan Gunthorpe <logang@deltatee.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Steven Price <steven.price@arm.com>,
 atish.patra@wdc.com, yash.shah@sifive.com, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Gary Guo <gary@garyguo.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 zong.li@sifive.com, Thomas Gleixner <tglx@linutronix.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Apr 14, 2020 at 09:29:46PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 14, 2020 at 5:17 PM afzal mohammed <afzal.mohd.ma@gmail.com> wrote:

> > + rmk

[ Forgot to provide context to Russell - this is about implementing
  VMSPLIT_4G_4G support for 32-bit ARM as a possible replacement of
  highmem ]

> > If no one have yet taken it up, i am interested in doing the work, i
> > will sponsor myself :). i will proceed at a slow pace without derailing
> > my other things normal.

> Thanks for offering to help, it's very much appreciated. Let me know how
> it goes and if you have any more detailed questions.

Okay, i will proceed initially w/ things that can be done using qemu &
available ARM boards. Right now no questions, i will probably be coming
up with questions later.

Regards
afzal

> I would recommend starting in a qemu emulated system on a PC host,
> you can just set it to emulate a Cortex-A15 or A7, and you can attach
> gdb to the qemu instance to see where it crashes (which it inevitably
> will).
> 
> You can also start by changing the functions in asm/uaccess.h to
> use the linear kernel mapping and memcpy(), like the version in
> arch/um/kernel/skas/uaccess.c does. This is slow, but will work on
> regardless of whether user space is mapped, and you can do a
> generic implementation that works on any architecture and put that
> into include/asm-generic/uaccess.h.
> 
> A second step after that could be to unmap user space when entering
> the kernel, without any change in the memory layout, this is still
> mostly hardware independent and could easily be done in qemu
> or any 32-bit ARM CPU.
> 
> Another thing to try early is to move the vmlinux virtual address
> from the linear mapping into vmalloc space. This does not require
> LPAE either, but it only works on relatively modern platforms that
> don't have conflicting fixed mappings there.
> 
> If you get that far, I'll happily buy you a Raspberry Pi 4 with 4GB
> for further experiments ;-)
> That one can run both 64-bit and 32-bit kernels (with LPAE),
> so you'd be able to test the limits and not rely on qemu to find
> all bugs such as missing TLB flushes or barriers.

