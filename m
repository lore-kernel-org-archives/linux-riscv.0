Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C7C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Umprs6YgVWovhQH01I+VxqvedOav778E+pzhnPULeRY=; b=gyP1SKsJSe7FnR
	ImKVTxMj7g41ZBdSAHwe38aMaescCQzAzJ2hPUe54tI+56/imZzMmZIfmDmYUAFWEyeGSXN6fFT3Z
	uf3bd+jBKnhNJWqay2qE58zdamunbYa9a6YEzvKZbzpjv9PD7xzPoIO8pG+aLT77Y6bxqOdyKNbFY
	tWLQkTUBHRfNKJ8iSPT83/cOqhvrm6ZoGv1QEapzQ2gze5Sd67ybxeLm/mIHkN6qxtrf4rJ27L1ke
	kyxJBCy3XaxuIanIFLNcn9jT0Bl9gKyIt3zjlmq+DoXQGE9Xp1Swdb5VWGNKb3aZedHoDlgV88ely
	QzQkZv2CkSi4Lof9x/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA3tw-0078u3-4Z; Sat, 09 Jul 2022 06:25:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA3tu-0078te-IK; Sat, 09 Jul 2022 06:25:10 +0000
Date: Fri, 8 Jul 2022 23:25:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Alan Maguire <alan.maguire@oracle.com>, Yixun Lan <dlan@gentoo.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
Message-ID: <YskfRqDqmNhGcuVF@infradead.org>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <YsKAZUJRo5cjtZ3n@infradead.org>
 <CAEf4BzbCswMd6KU7f9SEU6xHBBPu_rTL5f+KE0OkYj63e-h-bA@mail.gmail.com>
 <YsUy8jBpt11zoc5E@infradead.org>
 <CAEf4BzZrvOyYxmJpw=azZ59adeEqnHYqnUXKQProyUKBP5NaUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEf4BzZrvOyYxmJpw=azZ59adeEqnHYqnUXKQProyUKBP5NaUA@mail.gmail.com>
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

On Fri, Jul 08, 2022 at 03:22:51PM -0700, Andrii Nakryiko wrote:
> On Wed, Jul 6, 2022 at 12:00 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Tue, Jul 05, 2022 at 10:00:42PM -0700, Andrii Nakryiko wrote:
> > > riscv existed as of [0], so I'd argue it is a proper bug fix, as
> > > corresponding select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE should
> > > have been added back then.
> >
> > How much of an eBPF ecosystem was there on RISC-V at the point?
> 
> No idea, never used RISC-V and didn't pay much attention. But why does
> it matter?

It matters because we should not spread broken legacy interfaces.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
