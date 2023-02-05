Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CB3C636CC
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 06:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PS5a2EFW4u4sMwPfP03L2lnOx2sCG7n6pwv62KximYg=; b=DnSqUF7ggxGa9e
	R71GNV2tDEcFJRtafPYxnAzY2GU+rh13WbXfbCBadx4XEtmak3PlbkdEMsZA9v+0DtohsbNkwrN5m
	q9tta24gXDLn7d88oDbzqXTuZfMtOWTKaUZKVF+4onUeffFxU4/2rz5PXoQ5degkUk4YT0E98DJOl
	Lu2csW2mGWYIGCSazwDSoaKcuyOoS9/pYQbwNdpUS6ZukuUFiGPBT6Gv/Q8aHXUtiszwA04wma4e4
	XZLiZ+fFVY7B5eq1wP+SR03rv6jJ2U66Icc3efBTqmcjUrfeP3SDeEAPGOoGBYU5q5Rs2F7Aqsbsw
	CDp/Uu6Ab4mpkMYrNENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOYK9-0063Qh-EG; Sun, 05 Feb 2023 06:16:25 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOYK5-0063PL-K7
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 06:16:23 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 5EAC63200124;
	Sun,  5 Feb 2023 01:16:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 05 Feb 2023 01:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675577767; x=1675664167; bh=hmB8NiHkQ5VrUabRisnaTxPVwBHX
	9Yof16xrIa+uZ4w=; b=rOKaPu3DT9duQjRq4Ez/XhnitooRKGpbYAkW6xLm07uG
	q6L+bduvNmIsjwE7ALTsMZ5ZiBWlGFBIQysy2Nk/NEvRwrBLkXyJ6T4H5yp6m87L
	s239am+pbhVeS1ZpHH1D/LGbgTt0lSEHFnKu2fXMXRruU/I9Llc4s4f+OFHx04Sf
	vySX7XVyRDi2fgL3Ob510kKuRamgZT5Zd0RHzJEgJnIFeaf4482JsvweS/vTan9f
	xFUmO9AdW46nrF3fVkI/Trv7cS8AtWuOGqsP6XRAnOyWa040ZjJUqKm6LNHKUgM/
	Het/i4M7TEEiA6UJ5qp1k+4daE7mjBNKnQZRSlUtaQ==
X-ME-Sender: <xms:pknfYwQvusITua-krH511nFhlq8I9nK0Z2hXrrb5vZpxABj9bD40bw>
    <xme:pknfY9y4KUc5_YYtpPI-brkZNW3In78m5Ln0JdRuQcM6ylPhr7TL7EJyjpj3HQ1tP
    80nnpEGdOrPH1Tc_t0>
X-ME-Received: <xmr:pknfY921CfOtiMeF-C2SMvup-HaDZw67SQ5SEFbS0ydsodHOIHSVX481biNTIyo-lCrhVgTwlewe1yWgtNBGWLM30PhZPq5sYwI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegfedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:pknfY0BpJsflhm7oFWuLVeWkEqN8Av1gwLtiZFgRraAI3VUqcjhYoQ>
    <xmx:pknfY5gULhG3Xc0qYFL37F23Ltobm2bMlo3P3tUDk47mvlZYB-jj_w>
    <xmx:pknfYwrxJQS45d_SUQdlNTYqR3GknDe9sYItRSJFhG-UQZRkzoSDbA>
    <xmx:p0nfY-b8Ip6T5nVeCVaMrQ4uXeXmSgsfT7ZZ8lg0ADpvWnMBT7I7tw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Feb 2023 01:16:03 -0500 (EST)
Date: Sun, 5 Feb 2023 17:18:08 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Al Viro <viro@zeniv.linux.org.uk>
cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, 
    linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>, 
    Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
    linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
    sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
In-Reply-To: <Y9l0aBPUEpf1bci9@ZenIV>
Message-ID: <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_221621_713992_0D99F490 
X-CRM114-Status: GOOD (  21.45  )
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

Hello Al,

On Tue, 31 Jan 2023, Al Viro wrote:

> m68k equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY 
> handling" If e.g. get_user() triggers a page fault and a fatal signal is 
> caught, we might end up with handle_mm_fault() returning VM_FAULT_RETRY 
> and not doing anything to page tables.  In such case we must *not* 
> return to the faulting insn - that would repeat the entire thing without 
> making any progress; what we need instead is to treat that as failed 
> (user) memory access.
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

That could be a bug I was chasing back in 2021 but never found. The mmap 
stressors in stress-ng were triggering a crash on a Mac Quadras, though 
only rarely. Sometimes it would run all day without a failure.

Last year when I started using GCC 12 to build the kernel, I saw the same 
workload fail again but the failure mode had become a silent hang/livelock 
instead of the oopses I got with GCC 6.

When I press the NMI button after the livelock I always see 
do_page_fault() in the backtrace. So I've been testing your patch. I've 
been running the same stress-ng reproducer for about 12 hours now with no 
failures which looks promising.

In case that stress-ng testing is of use:
Tested-by: Finn Thain <fthain@linux-m68k.org>

BTW, how did you identify that bug in do_page_fault()? If its the same bug 
I was chasing, it could be an old one. The stress-ng logs I collected last 
year include a crash from a v4.14 build.

> ---
>  arch/m68k/mm/fault.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
> index 4d2837eb3e2a..228128e45c67 100644
> --- a/arch/m68k/mm/fault.c
> +++ b/arch/m68k/mm/fault.c
> @@ -138,8 +138,11 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
>  	fault = handle_mm_fault(vma, address, flags, regs);
>  	pr_debug("handle_mm_fault returns %x\n", fault);
>  
> -	if (fault_signal_pending(fault, regs))
> +	if (fault_signal_pending(fault, regs)) {
> +		if (!user_mode(regs))
> +			goto no_context;
>  		return 0;
> +	}
>  
>  	/* The fault is fully completed (including releasing mmap lock) */
>  	if (fault & VM_FAULT_COMPLETED)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
