Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8CDC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:56:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62CDF64FE8
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62CDF64FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6+lramOoT4Rx24oV5v+3TLHaXsNJtQu0i6A30FFAg8A=; b=i+VNKNRq3yE39MTf1Xo0reJQG
	UBx/BRqkZ9jtXuNqaxt1jY1UnZ9BIGJYyrA1kiefJrFue9jWMJfn8SSmmlxrhXCzeKv1usH4yXD44
	VzUNVF3/ZSC8vQCr52T6kxRJbgoLft79QPwlOGPx9adhfIXp9TucM/NTTHF4+j1w3AhZfAPzuV5Z5
	4H/FRZ0BxVwRRB9VuQm2xpoxqX/RYlbVE/FkILvxk7X1sNWutC4CB7t022S59VZ4aNR2W+cX+ce4D
	zFWK/aYrGfZ/hep+ffXawzpggXZ9vaBZ3uGKyhI7W5FPNnnMS6Imrl/+/N2rAUxxQj1nKZG0ZrMFB
	bNsVDhNBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJp0X-005qJS-5g; Wed, 10 Mar 2021 02:55:37 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJozX-005qDl-Ao
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 02:54:35 +0000
Received: by mail-pf1-x431.google.com with SMTP id b23so2399032pfo.8
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 18:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YBxARwCSnvP/MPs48fuZLZiuQ0mo/90Nc+1kxldAXvY=;
 b=mgPjitELPEW/P5qmpcLVfVoA0D6sHZbihRmkHn2T6K9SBG4Ha/LJO/otu10peacMhr
 LuL0fRZdQLwP7M9wEDrTpBtLj8K8tudZNldX6kZxxwpgoOUxKITkywSl2jzbDDQ+LlzB
 pAfWpubnARGarXUbdueVAOGEZZwgdwg38kjUrvpm8UlRyhUcHqhOLh/KTMLubon7Kb4n
 SDBddPEB0kPjpJ49JkLLyjwoA35CMpN5HTgdd0VAg06YzUz21lg3gZ8E6/aU6kC48WxF
 Iv+Fz7wjENWwmVReUBuT2iyV4vRqfYBaKfQMpvTe0Mkt1040FtnGxaGlyV9nF1Rgq6o4
 4rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YBxARwCSnvP/MPs48fuZLZiuQ0mo/90Nc+1kxldAXvY=;
 b=XBQEF7xgqKxHWUkXuoIu9ErPiSbYylbQFImkB6xH6acZKc/nlBjzD8l2on6Iae6FQn
 NrBO5gNYyK6grcbCXXmOqH01UrsHAplivTLbL1Rk0eX4LGZOpNQ5tUbY6Gmz7IpdfdnU
 9DidWzKou5ypo4AmSKYx6p0rSa9GxCGEHYafIjlNp15WqJJz1+ZEQzQmdz2biLT/ZqZy
 7ic0WG09BDHJvnziEpwQS4o5kikQEULCZof8HRHqwrNQoKpwuCg6JVnREkhbKsH8G/SQ
 RB+jSJlKfbGp55r+fGI1GDiT/Mq9KVHqM0Jm3NeIHMBkIXPBheDp9loLfVh490Caf5+W
 GkGg==
X-Gm-Message-State: AOAM532N9N7URr6b+bCZ+C73F/OoEaRVxPfHAJvSdxj1DByBHwQfGoPA
 rh6Ici5yw0FxQdwur28ryqacwg==
X-Google-Smtp-Source: ABdhPJw9djyUJKGf+CL7k+IvlqXvhXmzFMbBeiDmFCthoAskqXlsDt4pmgMsgrh8nJwik7OuxQCByg==
X-Received: by 2002:a62:b410:0:b029:1a4:7868:7e4e with SMTP id
 h16-20020a62b4100000b02901a478687e4emr891769pfn.62.1615344869693; 
 Tue, 09 Mar 2021 18:54:29 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v1sm4250210pjt.1.2021.03.09.18.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:54:28 -0800 (PST)
Date: Tue, 09 Mar 2021 18:54:28 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 18:54:03 PST (-0800)
Subject: Re: [PATCH 0/3] Move kernel mapping outside the linear mapping
In-Reply-To: <20210225080453.1314-1-alex@ghiti.fr>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, aryabinin@virtuozzo.com, glider@google.com,
 dvyukov@google.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-cf5d29ec-e941-4579-8c42-2c11799a8f2f@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_025433_183136_5D3D7B8C 
X-CRM114-Status: GOOD (  23.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Feb 2021 00:04:50 PST (-0800), alex@ghiti.fr wrote:
> I decided to split sv48 support in small series to ease the review.
>
> This patchset pushes the kernel mapping (modules and BPF too) to the last
> 4GB of the 64bit address space, this allows to:
> - implement relocatable kernel (that will come later in another
>   patchset) that requires to move the kernel mapping out of the linear
>   mapping to avoid to copy the kernel at a different physical address.
> - have a single kernel that is not relocatable (and then that avoids the
>   performance penalty imposed by PIC kernel) for both sv39 and sv48.
>
> The first patch implements this behaviour, the second patch introduces a
> documentation that describes the virtual address space layout of the 64bit
> kernel and the last patch is taken from my sv48 series where I simply added
> the dump of the modules/kernel/BPF mapping.
>
> I removed the Reviewed-by on the first patch since it changed enough from
> last time and deserves a second look.
>
> Alexandre Ghiti (3):
>   riscv: Move kernel mapping outside of linear mapping
>   Documentation: riscv: Add documentation that describes the VM layout
>   riscv: Prepare ptdump for vm layout dynamic addresses
>
>  Documentation/riscv/index.rst       |  1 +
>  Documentation/riscv/vm-layout.rst   | 61 ++++++++++++++++++++++
>  arch/riscv/boot/loader.lds.S        |  3 +-
>  arch/riscv/include/asm/page.h       | 18 ++++++-
>  arch/riscv/include/asm/pgtable.h    | 37 +++++++++----
>  arch/riscv/include/asm/set_memory.h |  1 +
>  arch/riscv/kernel/head.S            |  3 +-
>  arch/riscv/kernel/module.c          |  6 +--
>  arch/riscv/kernel/setup.c           |  3 ++
>  arch/riscv/kernel/vmlinux.lds.S     |  3 +-
>  arch/riscv/mm/fault.c               | 13 +++++
>  arch/riscv/mm/init.c                | 81 +++++++++++++++++++++++------
>  arch/riscv/mm/kasan_init.c          |  9 ++++
>  arch/riscv/mm/physaddr.c            |  2 +-
>  arch/riscv/mm/ptdump.c              | 67 +++++++++++++++++++-----
>  15 files changed, 258 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/riscv/vm-layout.rst

This generally looks good, but I'm getting a bunch of checkpatch warnings and 
some conflicts, do you mind fixing those up (and including your other kasan 
patch, as that's likely to conflict)?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
