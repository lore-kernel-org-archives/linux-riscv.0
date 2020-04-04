Return-Path: <SRS0=QTjp=5U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B53C2BA16
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2020 12:12:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC227206F5
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2020 12:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sOyXloRf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RgVJg0wg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC227206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jKltLIjkeugNXvKZ/WNOjs3yWnJYwRe4Lc/bVmXm/3E=; b=sOyXloRfTIjaRKqOoolD/zXcY
	bB1vvQgVlYdaLJB6zu7Opq+pFBdW+25GpVXpVgIm5XUti1V+DzLNMyyIjImvZAcrYgCgzWzHq3GBd
	11uoZbp+TSrv6tlzMdlQsSyFvMFUtYXkHoagDeerbzoMR3/oabdbQtH/iITsovfAPhs+xttEHixOf
	stR+Iw16AnMFn+bv3O0lLukU+I6caUFpxGo1JsOtMxftawqrMFFRdt5ipVlXnWDM+BolemIjBaBB7
	rapDcUAA/WpxIJBPsEIypOE0oBFBWa8TsAeJzNDt3UHgzD5D5mY6etDB6J6U5J30Hg9Mddtqqhucx
	q65Nm7g5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKhfE-0006QQ-7M; Sat, 04 Apr 2020 12:12:40 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKhfA-0006Px-Pm
 for linux-riscv@lists.infradead.org; Sat, 04 Apr 2020 12:12:38 +0000
Received: by mail-oi1-x244.google.com with SMTP id m14so8749147oic.0
 for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2020 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jKltLIjkeugNXvKZ/WNOjs3yWnJYwRe4Lc/bVmXm/3E=;
 b=RgVJg0wgr143G4gyzDbbfm84LsLH3MP4SN7MaIkYorAoVDOBWyb/mqeqd/llZlUALK
 pLOIJVHAXJ7+DwM8KcJEYnfUrevmL8hDEkZ/97Bp0ubUMgkETckeKob2oHdooiBOjPr3
 rriSFYQXyrtdLZ63XdkfzTqKQnT0ak5J596o7hBoouU6OSZJZHm9fjqZkFJTSTYEbQS7
 7jpm0dVmQsP6BVViUdq/XOgAkGrqCq705tOsDII+pSJ/6Xp2C22g2JIm5HujNedbTOk/
 u2M1MideUCCoOEGi150OaW2iKtBiCAQTEXiz4tcpxZLbeOK+BimEdjw0BjbuYQ9r/WUl
 XMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jKltLIjkeugNXvKZ/WNOjs3yWnJYwRe4Lc/bVmXm/3E=;
 b=Kf7T57uFw31F0j5S/erUf65dN8W57QWaQr02H7iQP+HTuB1fpYWcvKd2mxPeZn+jmb
 srLc6prRTuHxHo1o11Jlu9vMZiTuVnTan5dQtGk/YceC7ZbbSdb4mIqOWm1qxY3i2poK
 4WnDq+WJ0t/H7W5Tn6nto4rBVJtzDVLnZt2J29sfptXPBc57ps0KmBazI9u+IkvrQZ0N
 ATqAMuyg6LCrDIagkHeYAAgO5ZY+H2ENFIhzsdixXtR7+rYdjW4OAEi/bEXestP22tuM
 s5oOM3MxvseRQQPNG1Y1U+gHBCwLYk6GMyv7HQw7lU4pIbjoh/eDsasLTAKAtrzjQnVr
 TFwQ==
X-Gm-Message-State: AGi0PuYVmFmC6zw6zfT2KqmmZBXKYPU7K9J3Z3Gdms1OqZBVraSRwDmA
 C61kTQy+6KHi7ktoryBFeDvBYc5P5lBy+Vit4wGvSw==
X-Google-Smtp-Source: APiQypKoUIArlv+AU+qdaFbGmgtLIA43dBjeqmsMapEs9zbS0kBYGn63b7pHIli+RFC4il0+K87DaAx7Q7EETQmoj+c=
X-Received: by 2002:a05:6808:56:: with SMTP id
 v22mr6104012oic.116.1586002354371; 
 Sat, 04 Apr 2020 05:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583772574.git.zong.li@sifive.com>
 <d27d9e68491e1df67dbee6c22df6a72ff95bab18.1583772574.git.zong.li@sifive.com>
 <20200401003233.17fe4b6f7075e5b8f0ed5114@kernel.org>
 <CANXhq0ra3o+mgenbYLq_q0eZY2KiXNpWmo2V0amD0cFDqCQkXw@mail.gmail.com>
 <20200402101733.1ef240faeaeada6e4d38ae80@kernel.org>
 <CANXhq0rMbkNxQ3_qqYEKe8DSbL-vfQku6V9a81Hy9cxW4LaW9g@mail.gmail.com>
 <20200404121428.596911ba5653f8b18a80eab2@kernel.org>
In-Reply-To: <20200404121428.596911ba5653f8b18a80eab2@kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Sat, 4 Apr 2020 20:12:24 +0800
Message-ID: <CANXhq0rc+6jor7CMaa-zqSn3vNBdJhj3gD5wGxPkXAtVVHDHdQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] riscv: introduce interfaces to patch kernel code
To: Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_051237_004149_2D5D494D 
X-CRM114-Status: GOOD (  18.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Apr 4, 2020 at 11:14 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi Zong,
>
> On Fri, 3 Apr 2020 17:04:51 +0800
> Zong Li <zong.li@sifive.com> wrote:
>
> > > > > > +{
> > > > > > +     void *waddr = addr;
> > > > > > +     bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> > > > > > +     unsigned long flags = 0;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     raw_spin_lock_irqsave(&patch_lock, flags);
> > > > >
> > > > > This looks a bit odd since stop_machine() is protected by its own mutex,
> > > > > and also the irq is already disabled here.
> > > >
> > > > We need it because we don't always enter the riscv_patch_text_nosync()
> > > > through stop_machine mechanism. If we call the
> > > > riscv_patch_text_nosync() directly, we need a lock to protect the
> > > > page.
> > >
> > > Oh, OK, but it leads another question. Is that safe to patch the
> > > text without sync? Would you use it for UP system?
> > > I think it is better to clarify "in what case user can call _nosync()"
> > > and add a comment on it.
> >
> > The ftrace is one of the cases, as documentation of ftrace said, when
> > dynamic ftrace is initialized, it calls kstop_machine to make the
> > machine act like a uniprocessor so that it can freely modify code
> > without worrying about other processors executing that same code. So
> > the ftrace called the _nosync interface here directly.
>
> Hmm, even though, since it already running under kstop_machine(), no
> other thread will run.
> Could you consider to use text_mutex instead of that? The text_mutex
> is already widely used in x86 and kernel/kprobes.c etc.
>
> (Hmm, it seems except for x86, alternative code don't care about
>  racing...)
>

Yes, text_mutex seems to be great. I'll change to use text_mutex in
the next version if it works fine after testing. Thanks.

> Thank you,
> --
> Masami Hiramatsu <mhiramat@kernel.org>

