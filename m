Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C24BC98306
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJ+PqJS88n16Bm9ROFB1FPoNcxqGccyZqEPXiDJo0Hw=; b=fEE1a9+zqAQVLX
	XIp7n4BtMBb2GMBK1IaIrzu74tPeCnIll27n0/wvbKho2xWzg9VeSseeh2kjZ7C300wEtHZHVhdn6
	AFDOLwo/x/w7tQha10nNvdN5x721RLssN5GQGXDekGBlYAY7aq8CrWN9rCwIL+Y1rRV9cB0HtEbsC
	P1QBvcl/UlpxkWh4PipightaULZyBkCuyd425xmqEXEB+DpeOlLqyvu/gNxT+sLa55KYGAKKZ0mRe
	/5CNN3Lmf3yWVeo3oKIfpXEbrzG32snII3o2X7fIWnKQTjvjAzbcQdTaesonY3EMLJDwjD09FKDYW
	xD1JVv8WCA7zcaPlyGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zYH-0000000Cl6L-2p0I;
	Fri, 25 Sep 2026 06:36:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zYF-0000000Cl60-3wbp
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 06:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GkZl7SRHY1wbGx3TBWUhC4BzBN19cLafsEXyXuI3yfg=; b=p6pp3mgLmUb6vlUYGC+20TWkFr
	7woOn1re7ekQj2HNbSDJ9RyK6bm40SZg2H9/sgU8aDfpGYOVZxDgfr4kz/eYPaL5YA5JyfAvHc04w
	0E9MEu+WLYzXvmKAyqAEmr3B296lMrFA89XyBeCzrsPTw3kM6b9CqbzcKDMTDuo7A8W0Ncv43v5zG
	6Ym5X5S+5PR4E2kt3erTiqDpxcLS/pb2hGkjBdycLl04Vo8so1fl8xOg46lLGOcPWxEGCil2rBsI+
	v/uqlGLoTxXUWndBeDI2uB8LoTvC6JlfOZTYOcZYdaw16LP3sY5Vh+GgPhjPagisi8+0/gXyDrDuM
	8j2jkEdA==;
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9zYC-0000000GegR-0uzU
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 06:36:54 +0000
Received: by mail-dy2-x10.google.com with SMTP id 5a478bee46e88-3381a6a05c9so272023eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318210; x=1790923010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GkZl7SRHY1wbGx3TBWUhC4BzBN19cLafsEXyXuI3yfg=;
        b=OX2CdzfwbVHW/WUUbIgIVeZ0j8TM2qQXoilX1grS60jzKeD++7jMyfiCccia78Ppnq
         PeXVRnQKoL/W9N2ekCF1csyRfrD8TJnIg6eujCoao+yIl0paHqQD8Qyj4z4XbKnznH0S
         0UK3+boCL5AkaS0veb1TA/jm5IVAFIjMPyb7obKx+ZrsUmmZ+leJLUqECeMJPFdgDX3s
         iFOnPwUYxPuK/RCk/3vDmLBwqd8GRq3kDjnlV/nPhBpqEMNuEtubyQqJ28TwEiYB26cs
         XXYeRJUqp60tFnP4H65MBCikKqP0x3YIuk5zDNt3fLBd0o1iUUnwx9VlsfzAodANODxd
         ZZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318210; x=1790923010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkZl7SRHY1wbGx3TBWUhC4BzBN19cLafsEXyXuI3yfg=;
        b=phPI1u5C5NRya3V9BJZX7nUtRt22Rfe6dujFtPObOYj+oNWPmlNkWpTSgqisF6ly/6
         yY17jHYegdMYCqueYtwD2IAnMu2UhanCBZJwRnzAiE5aRKEYuT/p4gSSwZMWt5f7v0jd
         D5nOUHz7jU1QCHzPr7XpWYHuqJqpaUhDwfeppjGhZJJpHFB7wZMtp/SKsLg+76TzSmEN
         wUmBjALH8RVlH8LZSck5R7AzKtTCDSe+VzbVXgkWvMNGuKyllxktbdBqCeQTWenkbeki
         +X0czxltCd50rC/Dm1voyI/TgN1LQJ0C5rQiRL629RFzrIfnrwQAd7NPx0YKsd/zf+YU
         1M0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmBAplRMWsRSrTPuhHxGMySuky2J/u+/4Tc1BClQ7nZ2G6d+ZLOONax1iXjLqW1Pgl/WFPW9C1pAx+CA==@lists.infradead.org
X-Gm-Message-State: AFuF++lCLNiXX/NzFvApxi5LW/JS19b36a7n5t9PO9NWSCtekk5cvFOB
	HKZSZe2Ked0go8aYsN9UntHgidTifq4EH8CZPi4IoPw+UXhfO5/4yz5R
X-Gm-Gg: AYBFou1KkRi3F4TQsCY3op/1iKLz1zifVNlL4sijBr9cnKNL9V3uuHe3VJmOGM6BIV7
	tubuBP8I1jQgeA3f+B1u31tF7iYVTb04Z72O0HkTLwKVM3ZLk9dL/7j2ZKujWpMw+RjJC0wgpr+
	NCUN3FKdHvu8inC56bG+fkgVAAW6g1B/NUZUe8k8Zyjo5+aRnqRZjmlUZt4oXXjg6XEOm3M8GPT
	XGo4gqKvFGcyUNsYX5uz/zh2C3Uco/Pcg/0Ks1D+FVms/FzdCJY0iKYhrymnQBIKfethXJZX3oF
	a/c4Xf3f5k3LCON/gx6uNfwstIK6uAJh/K3Gn+K0y/nUVRKE3oUOhma0y1MwQAndNLBjoChxXzM
	kB8zPRKXMtTBX/+24GYVZHLMWrP7lcz2sC+ptAuBU+BHS2rbpfRO/Tp+8PchGaNMgU9SgcilWIC
	yZMhvDhwwvafdRa//7JeN4LfXkhKjpRlXetMzok4Dn2hwEKUxcZrt4fMOQDkZsyGPAS6QWmfdmA
	EAxFVXySPuXUcIpIqUJxeidbpBrq/cF9BK4WrDPqPP5
X-Received: by 2002:a05:7301:160a:b0:33b:dc33:7f98 with SMTP id 5a478bee46e88-340db4b9d18mr2352154eec.14.1790318209994;
        Thu, 24 Sep 2026 23:36:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm3789127eec.23.2026.09.24.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:36:49 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:06:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org, 
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com, ynorov@nvidia.com, 
	joelagnelf@nvidia.com, david@davidgow.net, fujita.tomonori@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYWDWmMJgIAt1_W@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
 <20260924151335.18402A8b-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924151335.18402A8b-hca@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_073652_643491_EA367BA3 
X-CRM114-Status: GOOD (  18.07  )
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

On Thu, Sep 24, 2026 at 05:13:35PM +0200, Heiko Carstens wrote:
> On Thu, Sep 24, 2026 at 01:15:57PM +0200, Peter Zijlstra wrote:
> > Untested thingies for arm64 and s390x.
> ...
> > diff --git a/arch/s390/kernel/traps.c b/arch/s390/kernel/traps.c
> > index b6ba4465f59d..8bbb082fd5e3 100644
> > --- a/arch/s390/kernel/traps.c
> > +++ b/arch/s390/kernel/traps.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/entry-common.h>
> >  #include <linux/kmsan.h>
> >  #include <linux/bug.h>
> > +#include <linux/uaccess.h>
> >  #include <asm/entry-percpu.h>
> >  #include <asm/asm-extable.h>
> >  #include <asm/irqflags.h>
> > @@ -55,7 +56,12 @@ static inline void __user *get_trap_ip(struct pt_regs *regs)
> >  #ifdef CONFIG_GENERIC_BUG
> >  int is_valid_bugaddr(unsigned long addr)
> >  {
> > -	return 1;
> > +	u16 insn;
> > +
> > +	if (get_kernel_nofault(insn, (u16 *)addr))
> > +		return 0;
> > +
> > +	return insn == 0x0001 || insn == 0x000e;
> 
> I have no idea why anybody wants to do this, but it looks like I'm not
> alone :) In any case: the check is wrong.
> s390 uses only the monitor call instruction and this should be
> 
> 	return insn == 0xaf00;
> 
> At least it is not possible to set a kprobe on bug instructions, which
> would make this "interesting".

Hey Heiko,

should i send this out along with ppc. I am not paricularly very good
with s390's assembly, but if this looks correct to you, i can send it
out.

Regards,
Mukesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
