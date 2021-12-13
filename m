Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA58C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqrlQrD6OKj+QE1hIxLxIabY2NQrA1couwCW2LY42CU=; b=yZ6cSxmgiVAsqP
	xvLpwhExLYf8WX2Y9E7vt7C03Qs27dgd9RfrRati+PAE9KBfr9n8tiCQSl7DK99QhT8WomSZul/sQ
	ch5weWmWWUNKsCTU51dGB6exe0ZPahxX5bOhRa1d4Myvl5w5nR9nr7pszCpsrsNLDW2UpXWTNSnKc
	Q6Z+3WUFP5HEpHjJafg2m6Q8BC0nVgujp2vtuEPGnyBX1pFJS0oLFxSTXMIgN/UOAVUu60WdsAKmd
	yaSLTCWpwwoMyjAR7tgpyLJ8rh+3pLJfyXl3F/MPtOZ216TDd2s8BAgZPyByutTQ6GwzPu0O3CIjw
	JIstUT3y+jrZFT1tB51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwn0z-00AIoR-MQ; Mon, 13 Dec 2021 15:13:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwmYX-00A8n5-EN; Mon, 13 Dec 2021 14:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WN0UBRQSaVnqth1lPLeu1h3m2LsiDV8FPn8ylQJCtw8=; b=p3RXvBFb2so3jcvbNtFm9YqLoy
 Db6NHe524T07Hi4ZiyLaxSrQxikXMESk//fQ258u8C8HwL4tvSiBf9GqWsbjwUJj0MpZb99Q3r7Gn
 U8I4uIl0lJmqmxhPuXIO2nSstlKIwd5Iq6DRxuuB+XewafpJUhhMkxy8nn3Di3UE6QlKKR/tkzwqN
 82AY01mLzM89zRBTPtsel1HfkWhp0iwheQwoshPsb7I7IaBR/GEnNFzI6tMIojo9QsGW9FNyl0q0u
 8cNlSbM2lT2wank3wbXnRWxj4TWJs6JahqJ/E/e+nJSdtlRCOOK0S/1TpqDLQhR1BBCV9fSEeWv7a
 TVTjir2Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mwmYS-00Csn8-Vy; Mon, 13 Dec 2021 14:43:53 +0000
Date: Mon, 13 Dec 2021 14:43:52 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Cc: 'Tiezhu Yang' <yangtiezhu@loongson.cn>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 0/2] kdump: simplify code
Message-ID: <YbdcKK3Cq6ITTg/l@casper.infradead.org>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
 <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
 <YbXhVxRJfjvKw++W@casper.infradead.org>
 <b7a75ae9253445af81ff2fedd5268af4@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7a75ae9253445af81ff2fedd5268af4@AcuMS.aculab.com>
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

On Mon, Dec 13, 2021 at 08:30:33AM +0000, David Laight wrote:
> From: Matthew Wilcox
> > Sent: 12 December 2021 11:48
> > 
> > On Sat, Dec 11, 2021 at 05:53:46PM +0000, David Laight wrote:
> > > From: Tiezhu Yang
> > > > Sent: 11 December 2021 03:33
> > > >
> > > > v2:
> > > >   -- add copy_to_user_or_kernel() in lib/usercopy.c
> > > >   -- define userbuf as bool type
> > >
> > > Instead of having a flag to indicate whether the buffer is user or kernel,
> > > would it be better to have two separate buffer pointers.
> > > One for a user space buffer, the other for a kernel space buffer.
> > > Exactly one of the buffers should always be NULL.
> > 
> > No.  You should be using an iov_iter instead.  See
> > https://lore.kernel.org/all/Ya4bdB0UBJCZhUSo@casper.infradead.org/
> > for a start on this.
> 
> iov_iter gets horribly expensive...

Oh, right.  Reading the kcore is a high-performance path, my mistake.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
