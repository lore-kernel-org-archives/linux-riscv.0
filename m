Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4595C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 21:16:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C86222EBD
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 21:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C86222EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rDJeXa6yd5CnPXTNyv9r0tLk7zhpC11cjUNCtRWW79A=; b=KAo1YwiT7Lij8atA28SSDMTav
	bEUxmjiyKzBGaEXypXnq2iavfUz1q9oxPbTWg2rhHsolF5WjyMJvlrVQY/laUIV03jmqfJXBnPn+O
	5oi4XgNrJQmjZ9b+E0RdUIaBU7nEDndQf/8vvg8Ehq1f4DoWTS/1fGAI/sRIJswviLgdv2T/cEH3t
	zg/PEaeaVMYrTPsFrW3PUXfwZuLvpOuiYQWMMGCehg7dvmT4yPh2/Qp6MtjUki7p+a7b96kssTBxK
	8dTVtrqVyt3A9DhCgRsGBl7/Hm0CJF2C3kXdyuJaQ85jNTBblzPzt/BB9dRegwyM2ER+QRDLqhOQC
	eKYpQt2KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1bsb-0004oR-8L; Mon, 18 Jan 2021 21:16:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1bsX-0004na-Ph
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 21:16:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id p15so10264055pjv.3
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 13:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n6ccMeFbQ5o+gz4ZLG3v85J3POpNhHyS8cqYFbBY9Nw=;
 b=Okf4zD4ZvjiKYhpxXhqvo/q91mDIgDpEHaknqMjRYq1Tj9eADuXtzDZk5pnS5f3Zho
 Uz68jsEh3R4KogqWJLEyahcGkTlCvOV48aUER2+r3FYHhsVqRMQIJQV5PtE5OQsFaNEO
 7WYGMCe+NER8LcHV3UGe+Mx0sGkfGq0sA8ct+ITT2MfSk6QT27Uuu49rxlUWTomZC7V4
 1bpIzqUBl72XiW+F7lUO9+0Wx8pSjOdbZ2YWIQN+EsPROjqscc5+9nfZ1aAoI/gvQjgM
 j5FZA7vJXIxDMKVeTk99MIpNJyI5fLHi3MHpnOlz76BHZF6PbjuFxJQxNnMhL5NZcz5x
 FMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n6ccMeFbQ5o+gz4ZLG3v85J3POpNhHyS8cqYFbBY9Nw=;
 b=Rjed8n+qcOvTxm3fQhZ8ET2T55b0QMjol7lH3HXWiOaWRUQNRimAt5sgcj+1JTQUd4
 eekpMtFjGTKxYQVNA2deezpt87Mag0DdlIQ9Imb1Eczdn/DTjJKWAEL0ZT19qSyauaB/
 aUHWf1zCyUCkI2NfScT2yxtFJN1/2ERIjcGqO/EtoLz5lcyZg9Chp1OQNygsDV1yw7wX
 J1pwXK0QUp5eyn0EtgB53s7R8jyfiOuDmbk92GKfPtfzH99RNSVPrhXcqtUnGTgJFQYT
 SW9xsYv4m2S4rCCEHdXOaIyuzCSUWsyzEC/SqOQAteTTeqOnyjI7k/6KrgMYb/VPq6Vq
 z1xQ==
X-Gm-Message-State: AOAM5319JCz6HVo+u8w3yeIXyx1ALsgwUHPtQuOso4arsPlYU7heeyMP
 TSUe7qQNsy+K13eHsJzcRWo=
X-Google-Smtp-Source: ABdhPJwr7otRnwzmlhyKKc7fxrw9vPkypltSjfr/FJoMTsNeIkowL9MfQnTdO/GY8z8Orr5F5OxWAg==
X-Received: by 2002:a17:902:7149:b029:db:a6de:4965 with SMTP id
 u9-20020a1709027149b02900dba6de4965mr1324421plm.3.1611004557389; 
 Mon, 18 Jan 2021 13:15:57 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 i62sm10487833pfc.150.2021.01.18.13.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 13:15:56 -0800 (PST)
Date: Tue, 19 Jan 2021 06:15:54 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drivers/soc/litex: Add restart handler
Message-ID: <20210118211554.GH2002709@lianli.shorne-pla.net>
References: <20210104164500.1311091-1-geert@linux-m68k.org>
 <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
 <20210114020311.GE2002709@lianli.shorne-pla.net>
 <CAMuHMdWnrPBAh_U43C7jA8wDvyAegqCM3OP++NkkiT1Co5yjkQ@mail.gmail.com>
 <20210118114331.GF2002709@lianli.shorne-pla.net>
 <CAMuHMdUxAEE2A=dyhdH5Tscin_=m_b61WfRpLvj6pJfdPjd1nA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUxAEE2A=dyhdH5Tscin_=m_b61WfRpLvj6pJfdPjd1nA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_161602_087889_B37FFAC4 
X-CRM114-Status: GOOD (  25.25  )
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
Cc: Gabriel Somlo <gsomlo@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Mateusz Holenko <mholenko@antmicro.com>, Karol Gugala <kgugala@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 01:27:32PM +0100, Geert Uytterhoeven wrote:
> Hi Stafford,
> 
> On Mon, Jan 18, 2021 at 12:43 PM Stafford Horne <shorne@gmail.com> wrote:
> > On Thu, Jan 14, 2021 at 02:48:49PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, Jan 14, 2021 at 3:03 AM Stafford Horne <shorne@gmail.com> wrote:
> > > > On Mon, Jan 04, 2021 at 05:49:03PM +0100, Geert Uytterhoeven wrote:
> > > > > On Mon, Jan 4, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > Let the LiteX SoC Controller a register a restart handler, which resets

I think there is a typo here:

  Let the LiteX SoC Controller a register a restart ...

should remove the first 'a' and say

 Let the LiteX SoC Controller register a restart ...

> > > > > > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > ---
> > > > > > Tested with linux-on-litex-vexriscv.
> > > > > >
> > > > > > This patch is based on upstream, i.e. not on top of Gabriel Somlo's
> > > > > > "[PATCH v5 0/4] drivers/soc/litex: support 32-bit subregisters, 64-bit
> > > > > > CPUs"
> > > > > > (https://lore.kernel.org/lkml/20201227161320.2194830-1-gsomlo@gmail.com/)
> > > > >
> > > > > Bummer, and that's why the RESET_REG_* definitions are no longer
> > > > > next to the SCRATCH_REG_* definitions :-(
> > > >
> > > > If it helps I have accepted Gabriel's patches and put them onto for-next.
> > > >
> > > >   https://github.com/openrisc/linux/commits/for-next
> > > >
> > > > I am happy to take and test a patch based on that.  Or I can do the adjustments
> > > > to base the patch on that myself.  Let me know.
> > >
> > > Thanks for letting me know! V3 sent.
> >
> > Hi Geert,
> >
> > I don't seem to see v3 anywhere.  Where did you send it and what is the subject?
> 
> https://lore.kernel.org/linux-riscv/20210114134813.2238587-1-geert@linux-m68k.org/
> 
> So "b4 am 20210114134813.2238587-1-geert@linux-m68k.org" should give you
> a copy.

Thanks I got it, I am not sure why it does not show up in my inbox anywhere,
sometimes gmail drops mails.  Hence, I am replying here.

As per the typo above I can fix during applying or you could send during a v4.

One more small nit is that you move soc_ctrl_dev out to a static instance it
might help to mention.  But it's easy to see why.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
