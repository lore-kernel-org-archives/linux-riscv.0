Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B877CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 857AE2085A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pehy60Qy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="oCGunGSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 857AE2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NIn533DsQyzlBZ2PP6uQGWWrJmjAusp0q5ZbVR8020=; b=pehy60QyfyTi0T
	mHKfnRKY7sSJyayU3owi4pEbh7ALKwoqkmUtWLhiv0mq3NOCDelgCDyqHyKlfkHbSDEMhbhuM/v4s
	rLUokQ2HX3LJNseELrItt95c69cqeJAHDijBKexdoHhAcdhCUIQj6Jx+1ZDocK82DnFw5c9fflWZ8
	UQencjiPBcPqc3IiLuOErMuGvXZicAGY9RFiHg3iZukYM1J2JwDlJNJ56ce3/nmCYeVpuQmyd1yf8
	Z14Z9TenYLlBP7qGAo6ltoD4nxtws7TZjX0xyTLkOsvW/O1ghD2t9XJu/XHQ6P5gDpOLUA/jvU6vB
	jFvPziyYdOEktg0gxfZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JZp-0005EN-Q7; Mon, 25 Mar 2019 06:59:21 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8JZk-0005DN-Ph
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 06:59:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id g3so5222189wrx.9
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 23:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N0CZYjFXovkJsI/9QEDEPROJKfnrmM28A3Czk4ehuJA=;
 b=oCGunGSmmKDA7JdBCm21Xfd24OkSiuyoChBtmXQSA0fFH1TA0D6VZO2PDlmV1/l6aK
 KQB5BNj+8oIIQcYDfjkJ0t/+gKH3I6voTzNPzmWWMcMGifAhJH1ZMd14bbrSNyEZ7mEI
 hvIcELpCx40jr36iuwJrcAvzU474eJRwOq5r15NMR6I9ZUYSb8Gq8eey2im2B17M/Gkf
 Y/b6qFt6RmmdI0NHLxVQ1KwmttoG6WE5YDUE2iw4OC2gPHuiBV7xczemJluS2vKmg9Xt
 Czo45n4CATD2SS4QHRbNpbIRhG9gkK9e8eExInjJcVhVC0lGLrlYaW/wLI+5rf+P1Zer
 Zs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N0CZYjFXovkJsI/9QEDEPROJKfnrmM28A3Czk4ehuJA=;
 b=KC5zCYClzkwjFmqPqNkMSuwWmoZwSmFUyRUYNzbAhTr1KTjqVN6Pu3Bq4mCtuFNDwj
 4OEc2W1ajRPdSq14vFbgjgKN+MqdjeBibT0pKLAD963GiqPODhucx/OFvtgz6+GZOoKV
 Kwdzu7xyC3yVB9TQOKs5sFDGdqm8LJrgMdDYeq32ukiANYGg/GhBQ0BIXyMwmoO7oY53
 EEJGlDeSQv8/qxh++Ajhtm4ufLD7K25cm04c2K/cImJgdiGIeD8m2ZBuy3z4S1kJ+4y3
 Ssrk9X+N/YJp+Xx/y42KgMmc6Ggnho8mKgXyYrdNRz6sdkkpCPw1Bfj/i+gjSGnTmwGt
 ESXw==
X-Gm-Message-State: APjAAAXSHklL6sgi3nkO/IvNJxQqu2O29F3dD83L+3ORTU2h/DqKRFNJ
 4OmyXq9UzJPBQemypeFyGsrSP0qahkHRpwmZgjS7Sw==
X-Google-Smtp-Source: APXvYqwMP0b7DlWO+/dhfW/YQnyEJ21Adkz/UN4gTLLrK6iNKZm8O5Cl6rk8oezwxe6PDMvpukqZYQth97p/WtVvueA=
X-Received: by 2002:a5d:4087:: with SMTP id o7mr2766082wrp.9.1553497151665;
 Sun, 24 Mar 2019 23:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190325033648.16171-1-anup.patel@wdc.com>
 <20190325052550.GA30996@andestech.com>
In-Reply-To: <20190325052550.GA30996@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 12:29:00 +0530
Message-ID: <CAAhSdy1wZB-A9Gon5=X21Hnf59hGktggO1f0iERq9eC6Zz-JCQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
To: Alan Kao <alankao@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_235916_890646_003844CA 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 10:56 AM Alan Kao <alankao@andestech.com> wrote:
>
> Hi Anup,
>
> Sorry for being late to the party.  I think one more thing should
> move together with setup_vm():
>
> On Mon, Mar 25, 2019 at 03:37:38AM +0000, Anup Patel wrote:
> > The Linux RISC-V 32bit kernel is broken after we moved setup_vm() from
> > kernel/setup.c to mm/init.c because Linux RISC-V 32bit kernel by default
> > uses cmodel=medlow which results in a non-position-independent setup_vm().
> >
> > This patch fixes Linux RISC-V 32bit kernel booting by:
> > 1. Forcing cmodel=medany for mm/init.c
> > 2. Moving remaing MM-related stuff va_pa_offset, pfn_base and
> >    empty_zero_page from kernel/setup.c to mm/init.c
> >
> > Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
> > Suggested-by: Christoph Hellwig <hch@lst.de>
> > Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > v2: Removed CFLAGS_setup.o from kernel/Makefile and replaced SoBs
> > ---
> >  arch/riscv/kernel/Makefile | 2 --
> >  arch/riscv/kernel/setup.c  | 8 --------
> >  arch/riscv/mm/Makefile     | 2 ++
> >  arch/riscv/mm/init.c       | 9 +++++++++
> >  4 files changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index f13f7f276639..8b9780b6bd7f 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
>
> earlier in this file, there are four lines about ftrace,
>
>   5 ifdef CONFIG_FTRACE
>   6 CFLAGS_REMOVE_ftrace.o = -pg
>   7 CFLAGS_REMOVE_setup.o = -pg
>   8 endif
>
> removing "-pg" flag from setup.o was necessary for ftrace to work, since
> setup_vm() cannot process the trampoline of ftrace properly.
>
> As setup_vm() is being moved to mm/init.c, you may either mark it with a
> "notrace" attribute with its declaration, or adding corresponding CFLAGS_REMOVE*
> to mm/Makefile.

Let's handle it in same way as it was handled for kernel/setup.o

Most of the stuff is already moved to mm/init.c so no need for
"CFLAGS_REMOVE_setup.o = -pg"

I will send-out v3 with above changes and also update patch description
accordingly.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
