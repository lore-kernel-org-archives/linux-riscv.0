Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FDEC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:13:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F0520771
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALvlojci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F0520771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v+xFb2A+uQassLymUpSG0PgZAzUaW2AAkZ9f+bBdcss=; b=ALvlojcio+VS0B4pu7fhYEq2g
	OZGgnOMYOVGyaJgeibznErqP1oClYniTZMtsTz469lmgQw1iyTYd384+n0Ge8uoYkatamcghOye8h
	EqNoqMWFE6AxxOUqoL3W1ZVAz0dWCcvRun3rqtg+KprrXuPg4+AdL9xMDS+d98SgRybNVa9sk3jaH
	i0NIr1OU1cp+Up581N9Zh//2N1lUt8BTgJbCSQEPlJkzg4CTd5tHh2QS1ZBrKbfIUdnRL2+xdYFvZ
	Nabp/zX2TuX2R/tERb18rV5Zm/oTrWHHBIDmmB5Jb9kdlsN4217jUpxbu2ZcTP5Zy+nkTsAeeYwU+
	5/909tZpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy1S1-0007Wo-6h; Tue, 21 Jul 2020 23:13:33 +0000
Received: from kernel.crashing.org ([76.164.61.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy1Ry-0007WL-Dv
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 23:13:31 +0000
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06LNCxrb017185
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Jul 2020 18:13:05 -0500
Message-ID: <6fbea8347bdb8434d91cf3ec2b95b134bd66cfe3.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, alex@ghiti.fr
Date: Wed, 22 Jul 2020 09:12:58 +1000
In-Reply-To: <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
References: <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_191330_766253_6B19F784 
X-CRM114-Status: GOOD (  25.53  )
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
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, mpe@ellerman.id.au,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 12:05 -0700, Palmer Dabbelt wrote:
> 
> * We waste vmalloc space on 32-bit systems, where there isn't a lot of it.
> * On 64-bit systems the VA space around the kernel is precious because it's the
>   only place we can place text (modules, BPF, whatever). 

Why ? Branch distance limits ? You can't use trampolines ?

>  If we start putting
>   the kernel in the vmalloc space then we either have to pre-allocate a bunch
>   of space around it (essentially making it a fixed mapping anyway) or it
>   becomes likely that we won't be able to find space for modules as they're
>   loaded into running systems.

I dislike the kernel being in the vmalloc space (see my other email)
but I don't understand the specific issue with modules.

> * Relying on a relocatable kernel for sv48 support introduces a fairly large
>   performance hit.

Out of curiosity why would relocatable kernels introduce a significant
hit ? Where about do you see the overhead coming from ?

> Roughly, my proposal would be to:
> 
> * Leave the 32-bit memory map alone.  On 32-bit systems we can load modules
>   anywhere and we only have one VA width, so we're not really solving any
>   problems with these changes.
> * Staticly allocate a 2GiB portion of the VA space for all our text, as its own
>   region.  We'd link/relocate the kernel here instead of around PAGE_OFFSET,
>   which would decouple the kernel from the physical memory layout of the system.
>   This would have the side effect of sorting out a bunch of bootloader headaches
>   that we currently have.
> * Sort out how to maintain a linear map as the canonical hole moves around
>   between the VA widths without adding a bunch of overhead to the virt2phys and
>   friends.  This is probably going to be the trickiest part, but I think if we
>   just change the page table code to essentially lie about VAs when an sv39
>   system runs an sv48+sv39 kernel we could make it work -- there'd be some
>   logical complexity involved, but it would remain fast.
> 
> This doesn't solve the problem of virtually relocatable kernels, but it does
> let us decouple that from the sv48 stuff.  It also lets us stop relying on a
> fixed physical address the kernel is loaded into, which is another thing I
> don't like.
> 
> I know this may be a more complicated approach, but there aren't any sv48
> systems around right now so I just don't see the rush to support them,
> particularly when there's a cost to what already exists (for those who haven't
> been watching, so far all the sv48 patch sets have imposed a significant
> performance penalty on all systems).


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
