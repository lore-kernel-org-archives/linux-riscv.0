Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEABAC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0zhcsxAJA8jerpvPhlO5mHeZDk2BLXVAqaqYoiRh/0=; b=A0tXGV35nPqDSs
	0mMdfZbk8UXQeePX/ravMWv/14JgXmYPgvvz6GU5RB4ufDZJUKGdG3zlQ30taSsn9bFDYF8gl4YYV
	3xx1ZYt958xqxZsZrHRHMSEgD5U9RA1X4C5NR4YR7dsL/GBXDtn0r9YkNparidhb+1Efyy0x12UbX
	SmziCG/ge8EvIn+ExcTkMlFKHBpg/8/fVxwgd/Ej8CVFwUez/MKY6ypKnwsaXBIEMvW/ytq9kyO4e
	pw21iIhu9HC8XSiKGh6x7zHQSgEGQ8b77XriBRHvLZ62K4CDWhrvspptZn783Jf/bCHVCI5Z09Qtl
	aCqLVB/UbHHWLYZtaqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6WP-00Axl7-EB; Mon, 07 Feb 2022 16:05:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH63D-00AlUd-DG
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 15:35:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED067614B8;
 Mon,  7 Feb 2022 15:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BB4C004E1;
 Mon,  7 Feb 2022 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644248134;
 bh=U53gZ+l/kdaaJyvWD/b5EEP8osDkf04QBB3k8cFqnJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EMvYcc4JNP+7zcm/GA8wH76cRCamoeL9hklxByyHqVwmPvWQTVfb7Aw57sPbo6DcR
 FcaclsyfDyir6g3P2u4b+Q1gF4gOifVf6+nS2m9OPE/LgH1A3o5/iyaUkoF8oYITvb
 ccA2A8bm3BEfLCkZ3bxKBIW8PEefrWM4KY84+jDlmBbhWT38/fMutqQcTbFy2FZ9At
 3F7HpBjoxQS+gVLMv3mqKvVJDQM41ETvbyUOGEKzV0TiGUlmVP2SXAtC/sS0ChlOyg
 my/CWmpKykQe518DVWWLVUKMADOZwAw4mm/pI3gYc1kKbfxIc3gBRbxcrTo9oCVNhn
 LebOMYeGZR+5g==
Date: Mon, 7 Feb 2022 23:27:46 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
Message-ID: <YgE6co0GR93s1LTQ@xhacker>
References: <20220206174359.2986-1-jszhang@kernel.org>
 <CAK8P3a3Nnw5gfPAYx5UGdW8Om16GDcBi1-SS9Bs+CyLzssgVbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Nnw5gfPAYx5UGdW8Om16GDcBi1-SS9Bs+CyLzssgVbA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073535_573151_3800B0EF 
X-CRM114-Status: GOOD (  31.91  )
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

On Mon, Feb 07, 2022 at 08:35:54AM +0100, Arnd Bergmann wrote:
> On Sun, Feb 6, 2022 at 6:43 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > After irq stack is supported, it's possible to use small THREAD_SIZE.
> > In fact, I tested this patch on a Lichee RV board, looks good so far.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> I can definitely see the value in this, in particular when you get hardware with
> small RAM configurations that would run a 32-bit kernel on other architectures.
> 
> However, it's worth pointing out that all other 64-bit architectures use 16KB or
> more, so it is rather dangerous to be the first architecture to try this out in
> a long time. Some on-stack structures have a lot of pointers and 'unsigned long'
> members, so they need twice the space, while other structures are the
> same size either way.
> 
> IRQ stacks obviously help here, but I don't think the 8KB size can be made
> the default without a lot of testing of some of the more rarely used code paths.
> 
> Here are a few things that would be worth doing on the way to a smaller
> kernel stack:
> 
> - do more compile-time testing with a lower CONFIG_FRAME_WARN value.
>   Historically, this defaults to 2048 bytes on 64-bit architectures. This is
>   much higher than we really want, but it takes work to find and eliminate
>   the outliers. I previously had a series to reduce the limit to 1280 bytes on
>   arm64 and still build all 'randconfig' configurations.
> 
> - Use a much lower limit during regression testing. There is already a config
>    option to randomize the start of the thread stack, but you can also try
>    adding a configurable offset to see how far you can push it for a given
>    workload before you run into the guard page.
> 
> - With vmap stacks, using 12KB may be an option as well, giving you
>    three pages for the stack plus one guard page, instead of 4 pages
>    stack plus four guard pages.
> 
> - If you can make a convincing case for using a lower THREAD_SIZE,
>   make this a compile-time option across all 64-bit architectures that
>   support both IRQ stacks and VMAP stacks. The actual frame size
>   does depend on the ISA a bit, and we know that parisc and ia64 are
>   particularly, possibly s390 as well, but I would expect risc-v to be
>   not much different from arm64 and x86 here.
> 

Hi Arnd

Thanks so much for all the suggestions. Item3 and Item4 look more
interesting to me.

Thanks a lot

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
