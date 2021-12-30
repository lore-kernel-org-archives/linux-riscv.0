Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F057C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Dec 2021 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJpmn8jvnuT59R/FL48kFOlpbRjS9UjLX8YDP2Gkn3w=; b=GBNxiSsrq9qOXu
	hR6B6w1FYVBrI7C6O0no5Bxj9UGgOWBoAvIcWNv/j1KTUYJAlNj38xFwXjryxbRhZPzYVwd3Y0ICK
	+Cvuwai+D12TdEXC0v7hHrtIlfG8jMITZWlxqb0hxr8gBDe9/3zOLRdOnGMy4OHMr1joEgGRvFrVj
	sOEOnAhsLUt0I0YeBC2n6RyRQQIwqg20CPfM3pnhCbKnCqJV5eryUR3atloW6vpZj4xTCdjpLyTZ8
	RxQcbqqdJs2wymZOpk/cAVtVjLxP7sJKX0y33RbqN+GgzaJ2VXoHpEO8fZYHXrmktpCcT2YQXp8N9
	bUmZds6jvUzGfw8lnb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2y9K-004kAg-L1; Thu, 30 Dec 2021 16:19:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2y9H-004k9P-O8
 for linux-riscv@lists.infradead.org; Thu, 30 Dec 2021 16:19:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3B7AB81C77
 for <linux-riscv@lists.infradead.org>; Thu, 30 Dec 2021 16:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5DEC36AEC
 for <linux-riscv@lists.infradead.org>; Thu, 30 Dec 2021 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640881164;
 bh=arlWW/UtCGQmMH5E2Pogag5ZNNfDUyUhSMYEtoB3GwU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nallgZfdxZjoVCuHYZ4XlZvCFvFjCagAjfY/7DnXl6uLT3rQXZhTqfX8CxA2KfD5s
 ggMTdGtk4qkhT64rRpeqYTGP0AX7rd5U9SpMvtI5EA3ixEunFcmItWDP+Dny71TOkU
 2N+6dF/itqqOSChjsVTnbC/RnZjqsumYlT6QDIepmBYHjzM3WHIoXjPTsXx998T4MH
 AbHzEa9iCb3R8ZQuSPQxkbKl22DO8o6HOrukaINf9SUG+j2QRXNBifWfkcqIVJpn3F
 2oqxztcYkbMDMWDWXHLWL9/qwAxBjNURJG+yFFF4BLBbRogQN0MJupw1+goKz9KbcM
 BfBhOeAdyvsxQ==
Received: by mail-wr1-f45.google.com with SMTP id s1so51459990wrg.1
 for <linux-riscv@lists.infradead.org>; Thu, 30 Dec 2021 08:19:24 -0800 (PST)
X-Gm-Message-State: AOAM531xVsrSN822AZUuueTThAKjzw1fHoX1+gaR7A0SOGZydUOVlFVk
 P64WVeDKSIKYkVqziqzVVtvTf5Tgk6FIbr3Mi9g=
X-Google-Smtp-Source: ABdhPJzh0JRUZ8uDOReUUyLcA2Hj2LVO0R3PZ4wX3Eigt9m04vC/yXSrbqUBq3MAhxfR6QKgikfyV3h0Maj9zD2gdAs=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr25095895wru.12.1640881163018; 
 Thu, 30 Dec 2021 08:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-31-schnelle@linux.ibm.com>
 <YcrIHxTDipVNUuCA@kroah.com>
 <b9d0c0b88ef66f9beb51a880e765177670a76394.camel@linux.ibm.com>
 <Ycw6kXhd+NV0GMWc@kroah.com>
In-Reply-To: <Ycw6kXhd+NV0GMWc@kroah.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 30 Dec 2021 11:19:05 -0500
X-Gmail-Original-Message-ID: <CAK8P3a1p6_=s4XcJiJSkuZJBrCpwCXQ1MX6EadY00KdypVQisg@mail.gmail.com>
Message-ID: <CAK8P3a1p6_=s4XcJiJSkuZJBrCpwCXQ1MX6EadY00KdypVQisg@mail.gmail.com>
Subject: Re: [RFC 30/32] /dev/port: don't compile file operations without
 CONFIG_DEVPORT
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_081928_098620_AFBF441B 
X-CRM114-Status: GOOD (  18.54  )
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

On Wed, Dec 29, 2021 at 5:38 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> > > > -static const struct file_operations __maybe_unused port_fops = {
> > > > +#ifdef CONFIG_DEVPORT
> > > > +static const struct file_operations port_fops = {
> > > >   .llseek         = memory_lseek,
> > > >   .read           = read_port,
> > > >   .write          = write_port,
> > > >   .open           = open_port,
> > > >  };
> > > > +#endif
> > >
> > > Why is this #ifdef needed if it is already __maybe_unused?
> >
> > Because read_port() calls inb() and write_port() calls outb() they
> > wouldn't compile once these are no longer defined. Then however the
> > read_port/write_port symbols in the struct initialization above
> > couldn't be resolved.
> >
> > >
> > > In looking closer, this change could be taken now as the use of this
> > > variable already is behind this same #ifdef statement, right?
> >
> > Yes
>
> Great, feel free to send this individually, not as a RFC patch, and I
> will be glad to queue it up.

I think this patch should contain the 'depends on HAS_IOPORT' that
is currently added in a different patch (char: impi, tpm: depend on
HAS_IOPORT).

However, we can't merge that version until HAS_IOPORT is actually
added to the kernel.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
