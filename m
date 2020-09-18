Return-Path: <SRS0=9SVT=C3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ACFC43463
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 12:08:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA13F21582
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 12:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bi6ebA/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA13F21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N8O7YKxRtzC4DD04BqcILGV9qL4AECEI+CFfwcqCico=; b=bi6ebA/y+rBD07djkpI1wrFk6
	71vb2N5KfZ/FrkjlSYtmagxwM5VYXFRtRDfrUinu88rAQDAX1pA7xQ+cWQ2c5hNBGgnQi385JVC7U
	uFrWZMytRmoKTQ86UIhgu5HYOkFYJIBEqS/wqbqiQ1djwm80XKhpl6PnBkBvdHlMS39p8NkQZsyZ4
	vttuDrPRGJA6gBwDH/U5r0ExRybkn5BCme+wVs2rubnGgCARH/SD6/T4t3seR+8pOg2Ub1wN0czhp
	jf0n02LyhIVyNxZsq0jT2kSzZP2khOtMngwjyjsKR2RHVzc8kovCAIlO4VsssGrg86zyaT70G39Th
	WWVN6JbxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJFC1-000165-TX; Fri, 18 Sep 2020 12:08:45 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJFBz-00015h-Ie
 for linux-riscv@lists.infradead.org; Fri, 18 Sep 2020 12:08:44 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95200AC2F;
 Fri, 18 Sep 2020 12:09:15 +0000 (UTC)
Date: Fri, 18 Sep 2020 14:08:39 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: vmalloc faulting on RISC-V
Message-ID: <20200918120839.GB31722@suse.de>
References: <CAOJsxLFWbV6FoEgHPHVN3PksrP5mXWbbFUuzH8YEDd1VdvEp7g@mail.gmail.com>
 <mhng-5b700d9d-3913-4058-ae6c-c9905582fb5a@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5b700d9d-3913-4058-ae6c-c9905582fb5a@palmerdabbelt-glaptop1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_080843_743477_F4748B25 
X-CRM114-Status: GOOD (  18.08  )
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
Cc: penberg@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 09, 2020 at 01:35:11PM -0700, Palmer Dabbelt wrote:
> If there really is some reason shared between RISC-V and x86 that makes this
> approach infeasible then we'll have to fix it.  Knowing why x86 changed their
> approach would be the first step.

On x86 there is a need to sync vmalloc paging updates at one single
level to all page-tables in the system. This is a slow operation and
requires a global spin-lock to be taken, so x86 did not synchronize the
mappings at creation time but used faulting to sync them to other
page-tables.

But this approach is problematic for at least two reasons:

	1) The page-fault handler might also access vmalloc'ed memory,
	   which can then result in recursive faults because the
	   page-fault handler can never finish the synchronization.

	   The primary reason where this happened on x86 was with
	   tracing enabled, as the trace-buffer can be vmalloc'ed,
	   leading to recursive faults and an effectivly frozen system.

	2) Faulting for synchronization does not work if valid ->
	   invalid changes need to be synchronized. This has happened on
	   x86-32 an caused memory corruption, because the page-table
	   level which needs synchronization (PMD) is also a huge-page
	   mapping level. The ioremap code can use huge-pages, so there
	   is a need to synchronize unmappings.

So x86 worked around these problems by having a function in the kernel
called vmalloc_sync_all() which had to be called at random places to
actively synchronize the mappings. But that never solved the underlying
issues so they popped up again and again in the past.

This was the reason I removed the vmalloc_sync_all() interface [by the
time it was already split into vmalloc_sync_mappings/unmappings()] and
introduced the arch_sync_kernel_mappings() function, which is only
called when a relevant mapping changed and which makes sure the memory
is mapped when vmalloc() returns.

Initially I thought this would also allow to remove vmalloc faulting
completly, but that is not the case because of the race condition. But
arch_sync_kernel_mappings() serves as a decent replacement for the old
and even more broken vmalloc_sync_all() interface.

Regards,

	Joerg

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
