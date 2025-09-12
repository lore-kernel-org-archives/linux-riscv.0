Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D543CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 23:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRo6XA+ZRZZqKD45yHl7/tVsuF0fHmikoPx0y/n1YG0=; b=2q6ijboQS7ApUc
	g1LfdpZ+6jQA16yVGo1dd61XX1NZy1f4iDzJfmdNuOP5g9njeKnHq4pPSJsDNESTs9baSOSdCFYKy
	uF084E7vp9BgBZh+KkiDQ10GLEVShs6X9/tcytDXbFklqx4zL27lAwICPaj/ax2vbTapUmir7ksgF
	6tEh2uQEaGtDkw6EC6zmdsT5kA/FtIzb7atpiMusH/lE3E+IjXtMrzHZbiwYz+v+O93I9grDe9OAh
	3TkzQDuRA7kVWqlIxc0Ir0Zl+IJVuzTgWnNIQNWkvRztts7w0VgLP0uVh7Yd2oVJXfvzidU+NDFT/
	Z0httmzjWmNPq0OA3few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCwe-0000000C1vO-0tbw;
	Fri, 12 Sep 2025 23:12:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCwc-0000000C1ud-0xwP
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 23:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9324A6000A;
	Fri, 12 Sep 2025 23:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0316C4CEF1;
	Fri, 12 Sep 2025 23:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757718761;
	bh=thLvIl+wvhNHd/h+/PMgcFZYDNKs/se5pXZ8NvBGink=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uPvN51zyf0Gk16PKadXMueozooisxs0w/wRwX29tBoqJBTo4x5gLEZpsOMl3SAiZ8
	 toWs4v4s+Isvs0SZ9f6cZt+BntkInj1O5MG9ejH/dcfWaJNIEJiJCuhLdTEqG5LxpN
	 hvsFbObfpXYXO9VjF+Ym6Y3HlQutUmpGWu0QAL64=
Date: Fri, 12 Sep 2025 16:12:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, kasan-dev
 <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>, open list
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org,
 lkft-triage@lists.linaro.org, Linux Regressions
 <regressions@lists.linux.dev>, Andrew Morton <akpm@linuxfoundation.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, Ben
 Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250912: riscv: s390: mm/kasan/shadow.c
 'kasan_populate_vmalloc_pte' pgtable.h:247:41: error: statement with no
 effect [-Werror=unused-value]
Message-Id: <20250912161240.0a5fac78fed5ed8ddc32450a@linux-foundation.org>
In-Reply-To: <d7a03a2b-d950-4645-80f2-63830bd84f76@redhat.com>
References: <CA+G9fYvQekqNdZpOeibBf0DZNjqR+ZGHRw1yHq6uh0OROZ9sRw@mail.gmail.com>
	<d7a03a2b-d950-4645-80f2-63830bd84f76@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Fri, 12 Sep 2025 13:34:37 +0200 David Hildenbrand <david@redhat.com> wrote:

> > [-Werror=unused-value]
> >    247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
> >        |                                         ^
> > mm/kasan/shadow.c:322:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
> >    322 |         arch_enter_lazy_mmu_mode();
> >        |         ^~~~~~~~~~~~~~~~~~~~~~~~
> > mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
> > include/linux/pgtable.h:247:41: error: statement with no effect
> > [-Werror=unused-value]
> >    247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
> >        |                                         ^
> > mm/kasan/shadow.c:497:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
> >    497 |         arch_enter_lazy_mmu_mode();
> >        |         ^~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > 
> 
> 
> I'm afraid these changes landed in -mm-unstable a bit too early.
> 

OK, I'll drop Patch series "Nesting support for lazy MMU mode", v2.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
