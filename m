Return-Path: <SRS0=fDxE=GW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20331C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 07:59:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DFC20773
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 07:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DFC20773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J3sdLuIj9k/teXGKRJnnXHI7ztk0lFmuXgN0qFTYgwY=; b=M9eMlVGCtNB2RfKubyIMUd1z0
	l/JkOuG2J9nJcaOBcQ6Mt/IniOGlBmsn1kHgN2kRLheNOsIlNChRmC6CXs1Z55yX8J38NMT665R5Z
	gwgzCGdOLBMRZHQrZsYqzVleEhVWXD/D1MTTYxA+qkTyQNDDI4+gOlfUO99jHPODKRVbXlC8HMlE8
	ih5siNDpuQDXd9eGKgqfABYHyjOwtaxJty5Acbro/VnrBisGzZP/mjaDGOuAzhuPKVMJ/7Yw+9d4g
	wS9FK2ha1G4Q55qhXp0E/MSH9AcVsTG8p8rBeSP+50/Dwbe54uzscLbnyzGq9AIRi46/OXrDOMAxV
	uorCYpbNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1lv3-00083v-Pd; Tue, 19 Jan 2021 07:59:17 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1lv1-00083Y-Ho
 for linux-riscv@lists.infradead.org; Tue, 19 Jan 2021 07:59:17 +0000
Received: by mail-ot1-f50.google.com with SMTP id v21so1181388otj.3
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 23:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=50LoqJ0vcbBGTat2MdC306m45dAPIXcmM7OGo1AqWqQ=;
 b=ILKHre0ibsdHq1b63dm1FWKmjKAYAZ28w6Kc1KJbMSB8OR0ZqH2MBG8RZDpr+7E9of
 SaiWk030eBUCIRIx3dlrWCYPZy1IK27FdhVN/Tbl5MzfhOjXgLo1S44pIOFG4lVbcx/U
 1gP25nsFY2jvv0JAW2F5sFZEOd+YMxzUv6ZIOHQK6zISFC6Ky/jf6Lk5Z4RCFg5WmP5Y
 3t2p2O9R3ltfQWaE+Mu3jye4GCl6GyknAPCd3pAzRs0kSsEHnZGf+LpgSK11tQ5lbnZX
 Izck/k1uQfA++b/+pawkQ226VJoCN5AwdN58cirJh26H3QOWjD4IyGbCJ5iOCurOGyzT
 7k0Q==
X-Gm-Message-State: AOAM531mgk9MYmv4nicMd9u5YPHsg8cmPEfc9LwOVJV78S49C8FhBlnp
 OXQyMbVnZa8YokbStqs/eULoe0kQBK2PppIHPTY=
X-Google-Smtp-Source: ABdhPJz/WliAIvO0lI5a1zlFdgSSgBDzpNZaaOdrNvaOBvgBhtPOxwVGjna9pxcuoaXmPPw3jpupDfNrku6M8CJ0b7Q=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr2586166oth.250.1611043153659; 
 Mon, 18 Jan 2021 23:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20210104164500.1311091-1-geert@linux-m68k.org>
 <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
 <20210114020311.GE2002709@lianli.shorne-pla.net>
 <CAMuHMdWnrPBAh_U43C7jA8wDvyAegqCM3OP++NkkiT1Co5yjkQ@mail.gmail.com>
 <20210118114331.GF2002709@lianli.shorne-pla.net>
 <CAMuHMdUxAEE2A=dyhdH5Tscin_=m_b61WfRpLvj6pJfdPjd1nA@mail.gmail.com>
 <20210118211554.GH2002709@lianli.shorne-pla.net>
In-Reply-To: <20210118211554.GH2002709@lianli.shorne-pla.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jan 2021 08:59:02 +0100
Message-ID: <CAMuHMdU4AyL=tWU5p5rZOGBet1BtpG3H2mnwcO0du29-dmK34w@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/soc/litex: Add restart handler
To: Stafford Horne <shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_025915_603200_3B44D0F5 
X-CRM114-Status: GOOD (  27.90  )
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

Hi Stafford,

On Mon, Jan 18, 2021 at 10:16 PM Stafford Horne <shorne@gmail.com> wrote:
> On Mon, Jan 18, 2021 at 01:27:32PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 18, 2021 at 12:43 PM Stafford Horne <shorne@gmail.com> wrote:
> > > On Thu, Jan 14, 2021 at 02:48:49PM +0100, Geert Uytterhoeven wrote:
> > > > On Thu, Jan 14, 2021 at 3:03 AM Stafford Horne <shorne@gmail.com> wrote:
> > > > > On Mon, Jan 04, 2021 at 05:49:03PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Mon, Jan 4, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > Let the LiteX SoC Controller a register a restart handler, which resets
>
> I think there is a typo here:
>
>   Let the LiteX SoC Controller a register a restart ...
>
> should remove the first 'a' and say
>
>  Let the LiteX SoC Controller register a restart ...
>
> > > > > > > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > > > > > >
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > > ---
> > > > > > > Tested with linux-on-litex-vexriscv.
> > > > > > >
> > > > > > > This patch is based on upstream, i.e. not on top of Gabriel Somlo's
> > > > > > > "[PATCH v5 0/4] drivers/soc/litex: support 32-bit subregisters, 64-bit
> > > > > > > CPUs"
> > > > > > > (https://lore.kernel.org/lkml/20201227161320.2194830-1-gsomlo@gmail.com/)
> > > > > >
> > > > > > Bummer, and that's why the RESET_REG_* definitions are no longer
> > > > > > next to the SCRATCH_REG_* definitions :-(
> > > > >
> > > > > If it helps I have accepted Gabriel's patches and put them onto for-next.
> > > > >
> > > > >   https://github.com/openrisc/linux/commits/for-next
> > > > >
> > > > > I am happy to take and test a patch based on that.  Or I can do the adjustments
> > > > > to base the patch on that myself.  Let me know.
> > > >
> > > > Thanks for letting me know! V3 sent.
> > >
> > > Hi Geert,
> > >
> > > I don't seem to see v3 anywhere.  Where did you send it and what is the subject?
> >
> > https://lore.kernel.org/linux-riscv/20210114134813.2238587-1-geert@linux-m68k.org/
> >
> > So "b4 am 20210114134813.2238587-1-geert@linux-m68k.org" should give you
> > a copy.
>
> Thanks I got it, I am not sure why it does not show up in my inbox anywhere,
> sometimes gmail drops mails.  Hence, I am replying here.

You may want to add a rule to never mark as spam emails with "PATCH"
in the subject.  And check your spam folder regularly, and teach gmail by
marking non-spam as non-spam.

> As per the typo above I can fix during applying or you could send during a v4.
>
> One more small nit is that you move soc_ctrl_dev out to a static instance it
> might help to mention.  But it's easy to see why.

Found a way to get rid of it.  Will send v4 shortly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
