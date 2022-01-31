Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHM5nYOPrcu9TbmR4Dk8F1UcdQCKAfIu+0QWCN+Aj+Q=; b=X/MWFxaWfwZ3zQ
	df0V9Idr1+lqwkCzFVFrszsbBSVeEQ+/jqrYTrAgn576lKFEjERt5uyUZNyqkdrZJygaTxAq5Sw+Z
	cvuShaw6Ji+VXIPuJcGNPjWPi0ewyFDvtTan9nQZLBSmtAcX//4+ClS9Eau9Dp3EQveaaRys1ot52
	wltvBmzkV9O0UBxnTqW44minjuXhEIwpiuIT3+GBZnRGoRimRbYduBidVp0qmOe6tzrZTS3RDWAzz
	PoamFS4kNAGurDwaOlpqLOhll9tV2ViKUg2h5/LxBbTgGAo9RUpoFxvChfunf/GFa98s9dEklGL1W
	PxvbXhANHtumk6P/FedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEX5Y-009X1Z-AD; Mon, 31 Jan 2022 13:51:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEX5L-009Wyl-Cv; Mon, 31 Jan 2022 13:51:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4C0B612CE;
 Mon, 31 Jan 2022 13:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5C0C340E8;
 Mon, 31 Jan 2022 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643637070;
 bh=Zm6bqi0OhyogvNh7aVMw7s3EunV9nSGhxKYNcbdO5KQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VB1HtyLzdS8WyvTpKJiOpoPPxcoguxNbLzYv4abyqilCHSyogINouv1glvQJZFH4Q
 klN9Wf3wTM0XCcb+sbaTp/p8xQ3BGlv3yDFVAn7mISzfv+RJ6uwysKLrZqcIeuZsV0
 BafaHReeaiYXGCqOvoDbXH50/QdF/KmcOkwUxcC6z5s7S+ynuf4rtQHXbffR8BjGLb
 OitbrZLld31AnRz+oX2yFY1TO1RrEA5ZhTTBsfnzjWQo8vsm9Slf91RTtqGsq68Oz9
 hbWbewIN8h4nsorfwtz6FBkTHNk15L724FloIzYmecGANavOB6kIoQwYSRDlSCKONR
 zPKyniu/L1/aw==
Received: by mail-vs1-f51.google.com with SMTP id a7so11853007vsc.6;
 Mon, 31 Jan 2022 05:51:10 -0800 (PST)
X-Gm-Message-State: AOAM533lWogG2PIIDsnswkPrFTPo/xmu+If89N0ryQXwYEobATHOHu1X
 8Z0Zj700suXEOCZkFqKF0UkV1pL5/qESMuDxhXw=
X-Google-Smtp-Source: ABdhPJz6ty+HfMaRNZhEmkeOc11XYS0No2YCxA7dV1DvlPk1ApPFjUS4E1RUl7Xx1jtPl3XXvKrXpTneiT3oAugpR68=
X-Received: by 2002:a67:e947:: with SMTP id p7mr7921986vso.59.1643637069468;
 Mon, 31 Jan 2022 05:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
In-Reply-To: <YffVZZg9GNcjgVdm@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Jan 2022 21:50:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
Message-ID: <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Christoph Hellwig <hch@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_055111_496077_3D176C4C 
X-CRM114-Status: GOOD (  12.55  )
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

On Mon, Jan 31, 2022 at 8:26 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> Given that most rv64 implementations can't run in rv32 mode, what is the
> failure mode if someone tries it with the compat mode enabled?
A static linked simple hello_world could still run on a non-compat
support hardware. But most rv32 apps would meet different userspace
segment faults.

Current code would let the machine try the rv32 apps without detecting
whether hw support or not.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
