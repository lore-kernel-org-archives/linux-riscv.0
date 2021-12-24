Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6CFC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 06:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ha1bELr/Y5GAKjaa4k0B4ut6nFB/aGKMj5h6t6/EZBA=; b=o5JhouDFr1j34I
	sa0Zh6+N9JaNx78kONxu2KB630IQm+XxXW+wgLCoZex4gCyasG3vjNh32xyojW5iMWLtym63D+S57
	cx9gbWbMX86WFAbW7M/yuReEvtHyfWs++nMIIAQ9fdWmMIpe/CD/QM+QRy95GRX7tCUDGNdqUe15k
	jOJyAKSDv+w8UXdthAuZOMvHlTqEFHzRPThSS8yYLTcDkt76tjUqR9EXhtqk14ED7vE5z4r586wNo
	RqjVFfeSa+YuDwBOneWvsjKnLlztWq8pQdzKLXfsS113FWZtxWPudu03ZE2t82dhEdIr+J60f5h2C
	7YN8LoM9VPexnD7yWeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0eTL-00DorQ-14; Fri, 24 Dec 2021 06:54:35 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n0eTJ-00DorD-QV; Fri, 24 Dec 2021 06:54:33 +0000
Date: Thu, 23 Dec 2021 22:54:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, gregkh <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
 Drew Fustini <drew@beagleboard.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 08/13] riscv: compat: Add COMPAT Kbuild skeletal support
Message-ID: <YcVuqfsiObz4XirW@infradead.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-9-guoren@kernel.org>
 <CAK8P3a0-ZOwoC_Ft+TiKAXdETcqU5XPS+9DZGkA+bB73SNCCbQ@mail.gmail.com>
 <CAJF2gTQ=Yo98-S12D9CbVXPJsAKpLu1NhJAVB3yu+J9thz6CUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQ=Yo98-S12D9CbVXPJsAKpLu1NhJAVB3yu+J9thz6CUg@mail.gmail.com>
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

On Wed, Dec 22, 2021 at 08:06:55PM +0800, Guo Ren wrote:
> On Wed, Dec 22, 2021 at 2:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > > +
> > > +config SYSVIPC_COMPAT
> > > +       def_bool y
> > > +       depends on COMPAT && SYSVIPC
> >
> > Can this be moved to init/Kconfig next to SYSVIPC?
> 
> I would try another patchset, to see other architecture guys' advice.

The existing per-arch definitions are pretty much historic cruft.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
