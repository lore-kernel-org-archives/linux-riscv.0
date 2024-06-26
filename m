Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A33BC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KX9lHwR6Nadhc16A8jMmQyc8HwjIiR5zMvXSAaxu5iw=; b=UHWs2+PVKrrTe/
	e65yMpKYzAmBIrSt9PqJqh+F00YKRKOv3KMCuF/Kjc8lXZAOZZ4J3O7SO1yWHFc3CFFzETNXWV8OT
	bZ1qmsNILsmUxCmnLtzxHrgu1efWt7ftreUy8Kys9CffQ1C2kTbCjLHaOw7h7f6kcd/FJOKs5cO+H
	dofGd+gKHWgrwmQDrXCLv9JON11t1N2BsLgX4E01703lrAV1OsqAEkR5VAMqsb8Y183ShopbkGCXL
	IaDilS6ihstw5oz90QNACa9mucnI3n3JtkvZAJsAE2tdT4LF77B0hhrJq8fSRBpZdIUxBKP9Gh48P
	PQW1pOcfsZHAt6KGoUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVJg-00000007Ykv-0iKu;
	Wed, 26 Jun 2024 16:16:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMVJa-00000007Yk7-3pnA
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 16:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1C44CE2099;
	Wed, 26 Jun 2024 16:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC9CC116B1;
	Wed, 26 Jun 2024 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719418568;
	bh=Mg1bPnbPD363GuddJswMdK7zDdLLbDjY3zLFI0ddO+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkNlVpreFP/iP0k/bpL5R2bY28xwLcbl/ldpo8GOeHzUxxJLpqMxp2Iij4Npe3hH5
	 6wu8s9zHVxRONqzwE9FklCg7XawsbzXa47o8i5qGraIPAmqQz9TW53i1DNdI/mbLxO
	 IZuUjBFXvfwpG3h0baArjNRuTO3c3JzqMWTIlHJfVN4ZuB/nkUdoeeH2xEBHLePv+q
	 SoqNQxjU3gqNFGNU5Hdu+6fbwwbgOU1M4ynM4/KuZmX1b5q5/Klf9D0Sc2UEZWl8CT
	 9AXtiXRxWeN67jRTeFt8TEmOVLhQ27m4SpTaGDW4K9vJVSE1y+N/+a/EQvCYP+frTl
	 BVv+gXQ3w+xxg==
Date: Thu, 27 Jun 2024 00:02:02 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Schwab <schwab@suse.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <Znw7engdDiMldJp2@xhacker>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org>
 <mvmikxvonjh.fsf@suse.de>
 <ZnwTwnSsnZ8Td9GZ@xhacker>
 <dcf9574a-0f1b-4131-befd-39f47d4f9002@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcf9574a-0f1b-4131-befd-39f47d4f9002@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_091611_913946_805702DB 
X-CRM114-Status: GOOD (  36.43  )
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

On Wed, Jun 26, 2024 at 04:25:26PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 26, 2024, at 15:12, Jisheng Zhang wrote:
> > On Wed, Jun 26, 2024 at 03:12:50PM +0200, Andreas Schwab wrote:
> >> On Jun 25 2024, Jisheng Zhang wrote:
> >> 
> >> > I believe the output constraints "=m" is not necessary, because
> >> > the instruction itself is "write", we don't need the compiler
> >> > to "write" for us.
> >> 
> >> No, this is backwards.  Being an output operand means that the *asm* is
> >> writing to it, and the compiler can read the value from there afterwards
> >> (and the previous value is dead before the asm).
> >
> > Hi Andreas,
> >
> > I compared tens of __put_user() caller's generated code between orig
> > version and patched version, they are the same. Sure maybe this is
> > not enough. 
> >
> > But your explanation can be applied to x86 and arm64 __put_user()
> > implementations, asm is also writing, then why there's no output
> > constraints there?(see the other two emails)? Could you please help
> > me to understand the tricky points?
> 
> I think part of the reason for the specific way the x86
> user access is written is to work around bugs in old
> compiler versions, as well as to take advantage of the
> complex addressing modes in x86 assembler, see this bit
> that dates back to the earliest version of the x86_64
> codebase and is still left in place:
> 
> /* FIXME: this hack is definitely wrong -AK */
> struct __large_struct { unsigned long buf[100]; };
> #define __m(x) (*(struct __large_struct __user *)(x))
> 
> Using the memory input constraint means that x86 can use
> a load from a pointer plus offset, but riscv doesn't
> actually do this. The __large_struct I think was needed
> either to prevent the compiler from reading the data
> outside of the assembly, or to tell the compiler about
> the fact that there is an actual memory access if
> __put_user() was pointed at kernel memory.

Thank you so much, Arnd!

> 
> If you just copy from the arm64 version that uses an
> "r"(address) constraint instead of the "m"(*address)

"m" version is better than "r", usually can save one
instruction.
I will try to combine other constraints with "r" to
see whether we can still generate the sd with offset
instruction. If can't, seems sticking with "m" and keeping
output constraints is better

> version, it should be fine for any user space access.

You only mention "user space access", so just curious, does
arm64 version still correctly work with below __put_kernel_nofault()
example?

> 
> The output constraint is technically still be needed
> if we have code like this one where we actually write to
> something in kernel space:
> 
> int f(void)
> {
>      int a = 1;
>      int b = 2;
>      __put_kernel_nofault(&a, &b, int, error);
>      return a;
> error:
>      return -EFAULT;
> }
> 
> In this case, __put_kernel_nofault() writes the value
> of b into a, but the compiler can safely assume that
> a is not changed by the assembly because there is no
> memory output, and would likely just return a constant '1'. 
> 
> For put_user(), this cannot happen because the compiler
> doesn't know anything about the contents of the __user
> pointer. For __put_kernel_nofault(), we rely on the
> callers never using it on pointers they access, which
> is probably a reasonable assumption, but not entirely
> correct.
> 
>      Arnd

Well explained! Thanks a lot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
