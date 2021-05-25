Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84761C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 07:37:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4390C610A0
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 07:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4390C610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+MQusUMGatCBBHw7pe1BwpgzzhoGz31YPXCwnsp1Lk=; b=fKpbdkQ58rluqr
	pKDIG3vPT2mLMLW4E6cYIbeR7pXEdH0r2ZTI1OI6LH5Lo7Nrq3F247NLa6TJeo1VHYl+J4+ndY0CQ
	pOwz4oNoTRWpFtM/cKa319v6qZTglQRgoclwhUK8m/j5XjLtGBE+XAYo/4392+m8Aaz7i+gHXHFR/
	HhGUY9i/fAIkGk0/Mud9CxkvX7pwoFxncv2f2b62pDlsvmFTDvsdQAc7HTVj7Ue9OGIXdo9pbGJmx
	Yf24aZwa2lF7rjnzNaCt8JmpE0Uok/23azflj/RElzLtiwn9tsGDOi/vazaF/BDK0HMpIhGTOogHi
	B5aouBlXkAqRII7C9KFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llRcr-003wg3-JJ; Tue, 25 May 2021 07:37:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llRco-003weW-VX; Tue, 25 May 2021 07:37:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 511F161417;
 Tue, 25 May 2021 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621928233;
 bh=8smSQFHHk77+VQ3Wa9iNI4/luQ0j33dqUigN4+FCyA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nnvhn2zwdz8/ljqYIFSsXNkn8JbOP+hM4SLU8Y7IPP8G6iufLkG/MhQGUS4+/STU+
 kK8D3TJ5NZN7ePf7Ew91EPvVyIrqTWc8srHDmGLM9ysBnq3thLheXQCh1Ik+TC+Ld4
 KS0WPD5LBDeKyCYg5QKqIrpwyaXMHejofwOT6mgY=
Date: Tue, 25 May 2021 09:37:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "guoren@kernel.org" <guoren@kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "graf@amazon.com" <graf@amazon.com>,
 Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <YKypJ5SJg2sDtn7/@kroah.com>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_003715_079513_67A4FF8A 
X-CRM114-Status: GOOD (  33.52  )
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

On Mon, May 24, 2021 at 11:08:30PM +0000, Damien Le Moal wrote:
> On 2021/05/25 7:57, Palmer Dabbelt wrote:
> > On Mon, 24 May 2021 00:09:45 PDT (-0700), guoren@kernel.org wrote:
> >> Thx Anup,
> >>
> >> Tested-by: Guo Ren <guoren@kernel.org> (Just on qemu-rv64)
> >>
> >> I'm following your KVM patchset and it's a great job for riscv
> >> H-extension. I think hardware companies hope Linux KVM ready first
> >> before the real chip. That means we can ensure the hardware could run
> >> mainline linux.
> > 
> > I understand that it would be wonderful for hardware vendors to have a 
> > guarantee that their hardware will be supported by the software 
> > ecosystem, but that's not what we're talking about here.  Specifically, 
> > the proposal for this code is to track the latest draft extension which 
> > would specifically leave vendors who implement the current draft out in 
> > the cold was something to change.  In practice that is the only way to 
> > move forward with any draft extension that doesn't have hardware 
> > available, as the software RISC-V implementations rapidly deprecate 
> > draft extensions and without a way to test our code it is destined to 
> > bit rot.
> 
> To facilitate the process of implementing, and updating, against draft
> specifications, I proposed to have arch/riscv/staging added. This would be the
> place to put code based on drafts. Some simple rules can be put in place:
> 1) The code and eventual ABI may change any time, no guarantees of backward
> compatibility
> 2) Once the specifications are frozen, the code is moved out of staging
> somewhere else.
> 3) The code may be removed any time if the specification proposal is dropped, or
> any other valid reason (can't think of any other right now)
> 4) ...
> 
> This way, the implementation process would be greatly facilitated and
> interactions between different extensions can be explored much more easily.
> 
> Thoughts ?

It will not work, unless you are mean and ruthless and people will get
mad at you.  I do not recommend it at all.

Once code shows up in the kernel tree, and people rely on it, you now
_have_ to support it.  Users don't know the difference between "staging
or not staging" at all.  We have reported problems of staging media
drivers breaking userspace apps and people having problems with that,
despite the media developers trying to tell the world, "DO NOT RELY ON
THESE!".

And if this can't be done with tiny simple single drivers, you are going
to have a world-of-hurt if you put arch/platform support into
arch/riscv/.  Once it's there, you will never be able to delete it,
trust me.

If you REALLY wanted to do this, you could create drivers/staging/riscv/
and try to make the following rules:

	- stand-alone code only, can not depend on ANYTHING outside of
	  the directory that is not also used by other in-kernel code
	- does not expose any userspace apis
	- interacts only with existing in-kernel code.
	- can be deleted at any time, UNLESS someone is using it for
	  functionality on a system

But what use would that be?  What could you put into there that anyone
would be able to actually use?

Remember the rule we made to our user community over 15 years ago:

	We will not break userspace functionality*

With the caveat of "* - in a way that you notice".

That means we can remove and change things that no one relies on
anymore, as long as if someone pops up that does rely on it, we put it
back.

We do this because we never want anyone to be afraid to drop in a new
kernel, because they know we did not break their existing hardware and
userspace workloads.  And if we did, we will work quickly to fix it.

So back to the original issue here, what is the problem that you are
trying to solve?  Why do you want to have in-kernel code for hardware
that no one else can have access to, and that isn't part of a "finalized
spec" that ends up touching other subsystems and is not self-contained?

Why not take the energy here and go get that spec ratified so we aren't
having this argument anymore?  What needs to be done to make that happen
and why hasn't anyone done that?  There's nothing keeping kernel
developers from working on spec groups, right?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
