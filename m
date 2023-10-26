Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9652BC25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeBdFemfaxBeRsMvrwSxQHmfm2CEaDOHbFteLODAh/k=; b=MUlqjSBCMFeEQW
	PuYmxTqUw6hWMIUCXzFXxaETCT6fH1EXiJTWVVJ84fDeSLJ+v+m9lxpAmGw0DEse2/9Oz67jR6jR4
	E9PlIne39d5l+YrcG33KIFAv/tE4KNcFnnB9HzqeDK4eidnI6cMLFS8iA1os+SPath1+nKcLghuJC
	2HUILMg30uDS5ZNYJBQChlg0SPRIvfqzQvAaq7oaDBSANyIEU2NDsqAsmU1t4p6QQ71tNu2rPlZCx
	2XoWXkcSqG1qzdgDF56J8vxDuHIdroBP0Dl7jY07KMLV58I8DHtd3+9xl1WryVesk151RS7x3nvai
	r85QeLdbXMxJBeoUUBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1kb-00EkD1-2c;
	Thu, 26 Oct 2023 14:54:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1kZ-00EkCP-0u
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09DE9634CA;
	Thu, 26 Oct 2023 14:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEDAC433C8;
	Thu, 26 Oct 2023 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1698332056;
	bh=3QlDzhYrf7P1UVluxNylKvOnHhMo0/dRhjHt5yfy+As=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=luu7O4Zpr91mxYh7wbxwsuSQMyINGvqbzvNM2OYDSLD7DOP9EhGEntc9OF6SE64Oe
	 AlTASilQVbwkxfyTaXBvzyuZ1cFyhppoDgV8B/jtWUiMEus7FZKHdvZ2yBBmC4l5zh
	 BNgWcKFYyQzA5EGlCoUNEXtbBxRjprIrkE8Pcxs0=
Date: Thu, 26 Oct 2023 07:54:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrew
 Jones <ajones@ventanamicro.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
Message-Id: <20231026075415.47c0a032906b604de08ed39b@linux-foundation.org>
In-Reply-To: <36aa1ec7-df13-4741-be09-c53a05f3d591@arm.com>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
	<305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
	<20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
	<CAHVXubi5C0hBaXx5tqVHZAJSd1zvHRqoxUEkk9ZbmZ5mq2=mAw@mail.gmail.com>
	<20231026071300.e12dab3be1edd26007db85ee@linux-foundation.org>
	<32d9627c-821a-48f0-b430-0532a47b8699@ghiti.fr>
	<36aa1ec7-df13-4741-be09-c53a05f3d591@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_075419_389622_6F991AE1 
X-CRM114-Status: GOOD (  12.68  )
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

On Thu, 26 Oct 2023 15:30:44 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:

> >>> Those fixes finally did not make it to 6.6, I was hoping for them to
> >>> land in -rc6 or -rc7: for the future, what should have I done to avoid
> >>> that?
> >> They're merged in Linus's tree.
> >>
> >> 6f1bace9a9fb arm64: hugetlb: fix set_huge_pte_at() to work with all swap entries
> >> 935d4f0c6dc8 mm: hugetlb: add huge page size param to set_huge_pte_at()
> > 
> > 
> > Oops, sorry, I missed them this morning!
> 
> Those two patches that Andrew highlights are the fix I did for arm64. Weren't
> you referring to the corresponding patches you did for riscv, Alex?

These are in mainline:

1de195dd0e05 riscv: fix set_huge_pte_at() for NAPOT mappings when a swap entry is set
117b1bb0cbc7 riscv: handle VM_FAULT_[HWPOISON|HWPOISON_LARGE] faults instead of panicking

I'm not sure what happened to your "riscv: hugetlb: convert
set_huge_pte_at() to take vma" - perhaps it was updated.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
