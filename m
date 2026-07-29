Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A9C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc5qV0zQKoBK8dZ1irAh+ntbwd/8areVEA9NiOkofsc=; b=zHZDiWcdI+8yC3
	v1Bzhbi8cLgpSjB6sz09+5sj/XroTutx70W+Oayd5XsW22RTHZFRrBB2L8fs9nxzzIj6gvNjMdGK8
	p/uYHFeVIMV7c3+3gyXKkaaPHORKYuLCJkmM4LoYrWPwlDTmRgOLk3srN+yUJ8mzW+Nsd/35LFWoT
	DsTtGiRFYkE8M53EecxfZQNHk1YQTIfHZi//mikQDX63IuC4mcOWpmmXGXOyzqSslDw6F+iSDOnC9
	5DNXCr9OJ2lyT/8Vc1S7BrS4FdiH18uMxBm64y6QTttWdT1zA3f6UYGQraCt0rUr6CLpAQ/zyzXex
	ht0lv6qFftuzfLep/yXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4ZC-00000008AG4-2f5x;
	Wed, 29 Jul 2026 13:43:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4ZA-00000008AF9-42BP
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 13:43:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A94542CBD;
	Wed, 29 Jul 2026 13:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E941F00A3A;
	Wed, 29 Jul 2026 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785332604;
	bh=PRcOiNq2tBTTPhKJmq+v2axNzroqRGfQ2NZU0eu9iKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZjSuoLL6lpaRqLc85ZT3LkyZzM0Zuhm/g6IAhMNxznnUHr+a6rLolhSNoCEWi/+XP
	 +k6HCNUh4cSAi9zyCrMgJ02jlIO4nJcZUm5LakKUb3pjQbfw2JjFATqCogerkzUdKu
	 5DtyggnyhvqVRAqVowYb9SwgJsscKYOfSP0OGJxeg/F1x0agvlho4n9YPqdCoWkemo
	 MSUrVc5OGlX5iUIMSdxmUF1lEVhqvsf443v/uXJD/wWFWvdytJ7kBBF2MY6kC6xMH4
	 hz2vLPNLN8qVdzpXNXCPMplDRgGhhamfwAgPHf3JuXPd6eVIuScvxjfLlZ57xhK8HX
	 Dias68Gw4/HNw==
Date: Wed, 29 Jul 2026 06:43:22 -0700
From: Drew Fustini <fustini@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Han Gao <gaohan@iscas.ac.cn>, Yao Zi <me@ziyao.cc>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH V5] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <amoDeloQAro0Zcsy@x1>
References: <20260421143154.1590156-1-guoren@kernel.org>
 <ah8N+UThw4JnOdDb@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ah8N+UThw4JnOdDb@x1>
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

On Tue, Jun 02, 2026 at 10:08:09AM -0700, Drew Fustini wrote:
> On Tue, Apr 21, 2026 at 10:31:40AM -0400, guoren@kernel.org wrote:
> > From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> > 
> > The early version of XuanTie C910 core has a store merge buffer
> > delay problem. The store merge buffer could improve the store queue
> > performance by merging multi-store requests, but when there are not
> > continued store requests, the prior single store request would be
> > waiting in the store queue for a long time. That would cause
> > significant problems for communication between multi-cores. This
> > problem was found on sg2042 & th1520 platforms with the qspinlock
> > lock torture test.
> > 
> > So appending a fence w.o could immediately flush the store merge
> > buffer and let other cores see the write result.
> > 
> > This will apply the WRITE_ONCE errata to handle the non-standard
> > behavior via appending a fence w.o instruction for WRITE_ONCE().
> > 
> > This problem is only observed on the sg2042 hardware platform by
> > running the lock_torture test program for half an hour. The problem
> > was not found in the user space application, because interrupt can
> > break the livelock.
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Reviewed-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <gaohan@iscas.ac.cn>
> > Tested-by: Yao Zi <me@ziyao.cc>
> > Cc: Chen Wang <unicorn_wang@outlook.com>
> > Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> > Cc: Paul Walmsley <pjw@kernel.org>
> > Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> > ---
> > Changelog
> > 
> > v5:
> >  - Add Acked-by: Arnd Bergmann <arnd@arndb.de> for asm/generic
> >  - Add Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> >  - Rebase on v7.0
> 
> Hi Paul,
> 
> Han Gao (revy) let me know that there is now an errata entry for 'Writes
> might stick in C910/C920v1 store buffer for too long' [1].
> 
> Does that address the concern you had about documenting the errata?
> 
> Thanks,
> Drew
> 
> [1] https://github.com/revyos/xuantie-c900-bugs#writes-might-stick-in-c910c920v1-store-buffer-for-too-long

Hi Paul, could this be considered for the upcoming merge window?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
