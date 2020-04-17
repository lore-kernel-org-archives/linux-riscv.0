Return-Path: <SRS0=37zL=6B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D6DC2BB85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 07:28:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB4C22242
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 07:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHjYkuh2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB4C22242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CAlxRW45me+SFTqp2fMa5KvZpf6cMRTo76EH5fkTTvc=; b=SHjYkuh2ZRRL/PqzM0mN1dpWn
	Wvym1tafHSy+MALeeio8Lcidc4p5+VU4hIT3PBOkx2vzalZhrdDC7WqBJ6U48J1cvRnxQMqJQhPXy
	ix5IRs88UejCIOecDZXI3pefdUW8bl4s10BmWgQrysYN0YAzR2kgetdRML70DPUBCHghtbTJNxAxE
	X9yyWvAOOZD6npLcAj0Fg+wDuY7heMMFdkooRMP7ar4X4hoElP3SZLu81jk42atgcUYXTCDsqiryy
	w2V36jSJlKPBrQiZbV6SutEejgovQ356x8hQVKX7ydlz5UONKAcz9wPb29BwfXu6n/irFS2xawBrU
	Lcq5qujSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPLQL-0008Gz-Ut; Fri, 17 Apr 2020 07:28:29 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPLQI-0008GZ-Ny
 for linux-riscv@lists.infradead.org; Fri, 17 Apr 2020 07:28:28 +0000
Received: by mail-ot1-f68.google.com with SMTP id k21so696995otl.5
 for <linux-riscv@lists.infradead.org>; Fri, 17 Apr 2020 00:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CAlxRW45me+SFTqp2fMa5KvZpf6cMRTo76EH5fkTTvc=;
 b=sTshC3+nxnzJyO61XVp6F9NRC4RAm5GdRIjQDm0AKsqAd7JaszQOSh6yAFFFetREu7
 jjhLMmVdd8w47zn6LJoqxKDZQs1bbV5bToZR2Q+GbE153dipB0YliXpgupPftq97Xulw
 +Fxoyzj4pQvHC9f3PjeDaYGRn757J1J10SIhNEAf6EC/KybOkMGdUaVywwsV4Ed3T07T
 4w9/6GS1K1YIfxdKsJt8k4Lk6d0jqQoLRid0lz3PgwuzWfvkNsowuUCX4AUms5rS0BP3
 inHz8U0np0UXF02WErqy2wjxPcR79r/fSwhluenNs9b0wRWsrgs0MFF5SCKYfwcQGayy
 B/fg==
X-Gm-Message-State: AGi0PuZd1lU2LhddsnSEo++oQy/zg3h2MPPimgDo9z+tMlYlWBqtd2Xo
 TI0t7f9Wq/9ClRSUvlS0MIr+RCgWIjL5Njevtxw=
X-Google-Smtp-Source: APiQypK7KuRAoPktsLMQh2Me8mfNzHEYpwL9p+AMo7Mc+i20vMVMtApNzN65ngvXei2FszcvDlo15xrOTNLy+/p43Ec=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr1548442otk.250.1587108505576; 
 Fri, 17 Apr 2020 00:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200416220130.13343-1-willy@infradead.org>
In-Reply-To: <20200416220130.13343-1-willy@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2020 09:28:14 +0200
Message-ID: <CAMuHMdWxhVoPCZ5+=Pf1LFpdE9vPv9GGTqTYMQP9oFz7eCxDaQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] Make PageWriteback use the PageLocked
 optimisation
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_002826_778523_625402DE 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Matthew,

On Fri, Apr 17, 2020 at 12:01 AM Matthew Wilcox <willy@infradead.org> wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> PageWaiters is used by PageWriteback and PageLocked (and no other page
> flags), so it makes sense to use the same codepaths that have already been
> optimised for PageLocked, even if there's probably no real performance
> benefit to be had.
>
> Unfortunately, clear_bit_unlock_is_negative_byte() isn't present on every
> architecture, and the default implementation is only available in filemap.c
> while I want to use it in page-writeback.c.  Rather than move the default
> implementation to a header file, I've done optimised implementations for
> alpha and ia64.  I can't figure out optimised implementations for m68k,
> mips, riscv and s390, so I've just replicated the effect of the generic
> implementation in them.  I leave it to the experts to fix that (... or
> convert over to using asm-generic/bitops/lock.h ...)
>
> v3:
>  - Added implementations of clear_bit_unlock_is_negative_byte()
>    to architectures which need it

I have two questions here?
  1. Why not implement arch_clear_bit_unlock_is_negative_byte()
     instead, so the kasan check in asm-generic is used everywhere?
  2. Why not add the default implementation to
     include/asm-generic/bitops/instrumented-lock.h, in case an arch_*()
     variant is not provided yet?

Note that you did 1 for s390.
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

