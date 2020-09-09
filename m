Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E08CC43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 18:28:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F47206E6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 18:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLtUS5Dx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16F47206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jMfyd/Onp71yxQ+83FrjvlwmMVAJ8wPOkakIOtzJL7E=; b=GLtUS5Dx7NAweMOHR+hYHzg8y
	aqKK2ZT7kz9LifUHXyO9PSOWvI5D8DMS9rNGcuYIWcJZT1fu/bXpWIKZyjhc/bM8MfdL4FxF7pceI
	LYIseI25guFaQgym/xgwWkp7odliKIowYhpaYitGOyG81p5NMrHK6wfFTq/QEfrNVXDZ9sPrC2pOQ
	xmVw4SnUHFJZfpVdmo0yDbnfr+h6JmZ09ZLn0PD4wTHi600VaCQRzWED6QsH/WW4fMMxWBXNdmyPw
	htEVN3j82GDMsFM8DjvhqKnfYC+q7nuQokKBW+hpR93QXJIqvB7KLeWK0JkfJqM8ZnxwOukP7IMbC
	mUMfcbg6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG4pm-0000e2-Ih; Wed, 09 Sep 2020 18:28:42 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG4pk-0000dR-DI
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 18:28:41 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15A16AF87;
 Wed,  9 Sep 2020 18:28:52 +0000 (UTC)
Date: Wed, 9 Sep 2020 20:28:34 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Pekka Enberg <penberg@kernel.org>
Subject: Re: vmalloc faulting on RISC-V
Message-ID: <20200909182834.GF23826@suse.de>
References: <CAOJsxLFWbV6FoEgHPHVN3PksrP5mXWbbFUuzH8YEDd1VdvEp7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOJsxLFWbV6FoEgHPHVN3PksrP5mXWbbFUuzH8YEDd1VdvEp7g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_142840_579988_1028619B 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 09, 2020 at 09:29:10AM +0300, Pekka Enberg wrote:
> Why does RISC-V need vmalloc faulting in do_page_fault()? If I
> understand correctly, some architectures implement it because process
> page tables can get out of sync with "init_mm.pgd". How does that
> happen on RISC-V?
> 
> I am asking because Joerg Roedel recently switched the x86
> architecture to a different approach because apparently vmalloc
> faulting is error-prone:
> 
> commit 7f0a002b5a21302d9f4b29ba83c96cd433ff3769
> Author: Joerg Roedel <jroedel@suse.de>
> Date:   Mon Jun 1 21:52:40 2020 -0700
> 
>     x86/mm: remove vmalloc faulting
> 
>     Remove fault handling on vmalloc areas, as the vmalloc code now takes
>     care of synchronizing changes to all page-tables in the system.

It is actually not vmalloc-faulting alone that was error-prone, it was
its combination with the (now removed) vmalloc_sync_* interfaces which
had to be called at random places in the kernel. This interface was
removed and replaced by arch_sync_kernel_mappings(), which makes sure
that mappings are synchronized to all page-tables before the vmalloc'ed
pointer is returned.

Above commit to remove vmalloc-faulting on x86 had to be (partially)
reverted, because relying on arch_sync_kernel_mappings() alone turned
out to have a race condition.

Please see commit

	4819e15f740e x86/mm/32: Bring back vmalloc faulting on x86_32

for details on that.

Regards,

	Joerg

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
