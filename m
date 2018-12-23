Return-Path: <SRS0=SCiz=PA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1549C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 23 Dec 2018 14:58:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1D021849
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 23 Dec 2018 14:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5zit7DR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="UZQd+vr+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1D021849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnbcJj3mfhGyfwcBAH1Ntzu63tP6etqULnwGiaUkPgM=; b=E5zit7DRFUZoUT
	xkW06cbtq1kSlXAIs/EdRTBsuuc/8ITAQ7RayzqlkwzQDQg/6on1UO7L+TCe3F3bUn+S5hp/Yxn8b
	NijLCmcVVqPJ6XWjiaLJ3+y7A28ZGtD/FhqY95SrUi+F41vZIyFxf3O07idGIyAKkeUyCQAIl0oDZ
	y0vjryq2/+Mpz86y+kOKArC4Q4N2R2DfKzcwthnXc3d8m8nTeOg0GgG/yCiyRVY12V7n9fkm9lBS8
	AdoSztQrxnzqIrThmVzo8D+0U8Mf8H9FKfqwin8aYAdnaGqB+U4eweSTEDMppP5GMDDypdCJfWYJw
	hY66U8dtizou7CAtzwWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gb5DP-0002be-6B; Sun, 23 Dec 2018 14:58:51 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gb5DM-0002b3-0T
 for linux-riscv@lists.infradead.org; Sun, 23 Dec 2018 14:58:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id t6so9616164wrr.12
 for <linux-riscv@lists.infradead.org>; Sun, 23 Dec 2018 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6scqON9KStlQnmh87N7ktbYjs+ArQwzAXpCvM+jErY=;
 b=UZQd+vr+FHB8k2FxAxU+hW45BJ+WlM/q4C4cjfMELqPM2rk6Jfj9TEeJpc7NoT/bIC
 5eX0e2/9SxxgujScDFExdJvouaZY7RBwLf+IZvWSaSyaIo/8lXtbdtc4sRCvsdXyXH11
 xLisGm/7BQ9gS97ezApPwEuDAkOjqTkL3JrURFn64l32Brs4KUPai90TCTjC81R6XGVZ
 P4R0QgtY6vL1TOPXsJbYnjZddKf8hACmAwuVUl58QMrfgM0EtkwQfOSHd7s22EvEoUqq
 WMYnLQju0JGfYpIsuLaTE6UlWE7VO+2LlvDDTXlp84ZgonWGsDl7JDBkq/phndsl8vSk
 YM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6scqON9KStlQnmh87N7ktbYjs+ArQwzAXpCvM+jErY=;
 b=KmQV9yI64txlCDoyF+SE0ZqOYzF8F3UiSESNvASGubiTt3J7rrnc9YZN7OmG3GjClt
 P9KhhWQg1952Hq6Vnylk91zqUGl4RyuDxVUBk8QfmPEZW0KI1U+3fxRkJm8fZQNJwDrw
 IGVyl+zZUbl4kj4PWQdymziViOREvmypnjfM6Q28TsgpB7p2B2y7zhvouI3uAcojcrHz
 c+nqHudFuWgtoqAPSTiLGWfzc2fD9mCSkQ+9iaTNks0Jru4BUSq8oHvW+3R8rRdMe/Oc
 xQoVabR3wXixv/sKTUK9RTrFAv0WpQffBwtv6oojcjbvL4eTD9w8c93ryNhpGoiXE+zn
 d0YA==
X-Gm-Message-State: AJcUukfSjmk3RDcHzG2ntyFQrf6X9a78SPgSm+0LAo7n/rbAutrgeZfF
 v+b3lr3QrtbU1lHDHOJ2O/J2Xbbf4J05YLzVYTDmOQ==
X-Google-Smtp-Source: ALg8bN6xQVUIj8PyiGEJkSO1dIigINps6TDf+6GgyzqlJnrxCJPk/8wr4HsiwAwfZZW4G+gjjvU08REazOotgyIEr0A=
X-Received: by 2002:adf:f785:: with SMTP id q5mr9494358wrp.9.1545577112835;
 Sun, 23 Dec 2018 06:58:32 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1danjgviJ2WGGEANQXFkzZzXUdCj+04dZ4eLjcVOt14A@mail.gmail.com>
 <mhng-d6686972-69e1-4355-8b30-e03893e24db6@palmer-si-x1c4>
In-Reply-To: <mhng-d6686972-69e1-4355-8b30-e03893e24db6@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Dec 2018 20:28:21 +0530
Message-ID: <CAAhSdy16jCvYZzSmec7FyWLB6y6djqj=KBKtj=17p_dNkaxjsg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181223_065848_194219_66EDF5DB 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 21, 2018 at 2:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 17 Dec 2018 01:36:45 PST (-0800), anup@brainfault.org wrote:
> > On Mon, Nov 26, 2018 at 11:42 AM Anup Patel <anup@brainfault.org> wrote:
> >>
> >> The objcopy only emits loadable sections when creating flat kernel
> >> Image. To have minimal possible size of flat kernel Image, we should
> >> have all non-loadable sections after loadable sections.
> >>
> >> Currently, execption table section (loadable section) is after BSS
> >> section (non-loadable section) in the RISC-V vmlinux.lds.S. This
> >> is not optimal for having minimal flat kernel Image size hence this
> >> patch makes BSS section as the last section in RISC-V vmlinux.lds.S.
> >>
> >> In addition, we make BSS section aligned to 16byte instead of PAGE
> >> aligned which further reduces flat kernel Image size by few KBs.
> >>
> >> The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
> >> 8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
> >> 7991740 bytes with this patch applied using GCC 8.2.0. In summary,
> >> this patch reduces Linux-4.20-rc4 flat kernel Image size by 809 KB.
> >>
> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >> ---
> >>  arch/riscv/kernel/vmlinux.lds.S | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> >> index 65df1dfdc303..cc99eed44931 100644
> >> --- a/arch/riscv/kernel/vmlinux.lds.S
> >> +++ b/arch/riscv/kernel/vmlinux.lds.S
> >> @@ -74,8 +74,6 @@ SECTIONS
> >>                 *(.sbss*)
> >>         }
> >>
> >> -       BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
> >> -
> >>         EXCEPTION_TABLE(0x10)
> >>         NOTES
> >>
> >> @@ -83,6 +81,8 @@ SECTIONS
> >>                 *(.rel.dyn*)
> >>         }
> >>
> >> +       BSS_SECTION(0x10, 0x10, 0x10)
> >> +
> >>         _end = .;
> >>
> >>         STABS_DEBUG
> >> --
> >> 2.17.1
> >>
> >
> > Hi All,
> >
> > Any comment on this patch?
>
> Sorry, I haven't had a chance to look at it yet.  Aside from the macro issue
> mentioned by Nick it seems OK.

I have send v2 to address Nick's comment.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
