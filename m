Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2717EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wdu+71i4qMSOwcovAwcRHxlekdhOrEqi+eOYOy5JAec=; b=bTuuZuRH6/e3h8
	Kh0nIwiKYZ7jRMZsysdnaNCZtZTfcn8o2Ds9jmXES5QMDAaVjBHIvtmqyqmg/gBDbx1y1k0tWGdxD
	EHehc83nlJyiKY+EeluhDww172VJkWAljeICtAAV8NXbsGYPdcXJQXXSr/dBKJ6Pg0dJhNtfeGS/2
	7b/yVuAPwHJGXljaBiR5UiodSOtnSjNVAFgiKB4hxBximnlEKheEA0l2gNQ4HRq+Ai74jlGxXm51N
	KkIlHa01lsrzXoDUw4Y1C37le+pbsXmF8b20iSXS012JIiHJnpTZaW/WbUzn4Ia5AE+r/5/4U364E
	xE/NB/eDQofxiU35J9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFzwA-0087bW-1u;
	Sun, 02 Jul 2023 16:28:34 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFzw7-0087Yf-07
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 16:28:33 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362GS2oc016328;
	Sun, 2 Jul 2023 18:28:02 +0200
Date: Sun, 2 Jul 2023 18:28:02 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v2 07/13] tools/nolibc: sys_lseek: add pure 64bit lseek
Message-ID: <20230702162802.GA16233@1wt.eu>
References: <5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com>
 <20230530135433.405051-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530135433.405051-1-falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_092831_539364_71A0833D 
X-CRM114-Status: GOOD (  21.06  )
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

Hi Zhangjin, Arnd,

On Tue, May 30, 2023 at 09:54:33PM +0800, Zhangjin Wu wrote:
> > And then do the selection inside of the actual lseek,
> > something like
> > 
> > static __attribute__((unused))
> > off_t lseek(int fd, off_t offset, int whence)
> > {
> >         off_t ret = -ENOSYS;
> > 
> >         if (BITS_PER_LONG == 32)
> >                ret = sys_llseek(fd, offset, whence);
> > 
> >         if (ret == -ENOSYS)
> >                ret = sys_lseek(fd, offset, whence);
> > 
> >         if (ret < 0) {
> >                 SET_ERRNO(-ret);
> >                 ret = -1;
> >         }
> >         return ret;
> >        
> > }
> 
> Yes, It is clearer, thanks. will learn carefully about the kernel types.

I, too, like Arnd's proposal here. I tend to use a similar approach in
other projects when possible. Often the limit is the types definition,
which is necessary to define even empty static inline functions. The
only thing is that due to the reliance on -ENOSYS above, the compiler
cannot fully optimize the code away, particularly when both syscalls
are defined, which may result in the compiler emitting the code for
both calls on 32-bit platforms. But the idea is there anyway, and it
may possibly just need a few adjustments based on BITS_PER_LONG after
checking the emitted code.

> > For the loff_t selection, there is no real need to handle the
> > fallback, so this could just be an if()/else to select 32-bit
> > or 64-bit, but for the time_t ones the fallback is required
> > for pre-5.6 kernels.
> >
> 
> Ok, will test it on the pre-5.6 versions too.
> 
> Hi, Willy, what's your suggestion about the oldest kernel versions we plan to
> support? ;-)

Like I said last time, since the code is included in the kernel, we
expect userland developers to use this one to build their code, even
if it's meant to work on older kernels. At the very least I want that
supported kernels continue to work, and then as long as it does not
require particular efforts, it's nice to continue to work on older
ones (think LTS distros, late upgraders of legacy systems etc).

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
