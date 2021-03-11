Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E3FC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 05:22:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C20C764FBB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 05:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C20C764FBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3HRFyd11RCefucKgpowTozL9W8nYpo6orcFUv/m/rNg=; b=SNNhj7EoJzXJCFRdcSDFyXWsI
	lv0GCA4zvTPu3d4hvUub8klm+IYrjLqAdcO/I3JUxSe4lTKGZAoUgI+GIA08dj4K7C9HQ4jARSath
	2Oa5eO7MR34LAT4O7dN0IScedZ+/26f2FmN7NKdwN/dX1Ejms1M7EvfLTQig2ZBuV3NxM+lwBGY+i
	aygQ6LTHE7SGb2WUIRHIaJtf+asU0g7uROUhKvYulkuMA30HsHxVXiKHAZpzEj+tM8gWe67+yyQV5
	asymk2/PB9RuVpaaJYAd9wO4H9KXfrHdl55WbCNMQvps2L4MIiAKt57XZTA9EaCn3NVOTQDI5axos
	XH16zeVSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKDlx-008OX4-KJ; Thu, 11 Mar 2021 05:22:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKDlt-008OWj-Pj
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 05:22:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id n17so6088634plc.7
 for <linux-riscv@lists.infradead.org>; Wed, 10 Mar 2021 21:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aC+FlSoCfEoEA1s//wbMbEfdrP7u4drNIY1Rwx2Q/aE=;
 b=R7kMBj+pu88Al1Zjmycc7bexQ5HNTLAYkasaQc2SRTDXHvCMctTYih1wp+5irWKGN3
 PC3Aq9ymJ29psvsMY1hxGo6nbFj9TFobCFK+Iko1NYCZ3h+tIQVkUORczH4jmeSyQMsJ
 PNE3HZ5d3tVdY6ccrmwSU77qgkPZHI0DVjvBwmHGu35nVRqX1dL8vV9N/o13p1+xtbD6
 7HO/QwVxvSX3tGSg5mNW9OQlLin6+yXJUdrAgvfqLADogb88Uy+bnhfyMjXLLygWDxWy
 F/WzixFIC9cWOYzJgqMGp0tcwNC8s3Ktt6aerLYkUhkYK0JQXp3TvPltbvaDcx+HVnXz
 C6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aC+FlSoCfEoEA1s//wbMbEfdrP7u4drNIY1Rwx2Q/aE=;
 b=C4h0TzXBOeD9feFQriXIVFURMpPQMi9WGFlOkWtW8bqOabd/vCyf10UQCuLVxdsCVw
 0EDbzGcPdOQYl2y8cEdEWPPPkXmsvRMSAFlfsPFsp7tQOBC95SIjeZUIj3cWk35MXd98
 ZRZwqN3lT8By/D27NW9fPpzwNZc2SN4TwZbeste9BRTvaxjxCxAYLfWNQU7wh4r79eez
 9ERz3JDNXQnW+3Iaj5exVtNEhUxDPGqu+LzoWuzHPz7yZK1fNP4B7NASV5NWjOTTD1Dk
 JxQH1vJtL48jOnRCSF07D1ScVgov6m8SdGTO32IJ2G4zZMb8eV0n0fY/ByXJaRno2lJa
 VaQA==
X-Gm-Message-State: AOAM530dXgt961AA+o6AhE8qF7D9njs5t0vth5hYdGxNFUamSxVa65oL
 F8Oap+LkOCdVMDfZLHBSoVEkFAN4GLwmT59FRFYaTg==
X-Google-Smtp-Source: ABdhPJwMp6CctorcwIFc8AQQykfWONwgPUJZtbW+VftQU35MK9wqbo87bg77Nsdt+UZZKUK2Jtrl2WOTGP8dX6rB+mw=
X-Received: by 2002:a17:902:b781:b029:e4:545d:77 with SMTP id
 e1-20020a170902b781b02900e4545d0077mr6448296pls.59.1615440123203; Wed, 10 Mar
 2021 21:22:03 -0800 (PST)
MIME-Version: 1.0
References: <1615175897-23509-2-git-send-email-vincent.chen@sifive.com>
 <mhng-9928bd58-137c-4618-822c-56790ecd275a@penguin>
In-Reply-To: <mhng-9928bd58-137c-4618-822c-56790ecd275a@penguin>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 11 Mar 2021 13:21:52 +0800
Message-ID: <CABvJ_xhaTB4qntNpKfkAMHtR_++dae17x2tEfPzW4Egqfa9vpw@mail.gmail.com>
Subject: Re: [RFC patch 1/4] riscv: Add 3 SBI wrapper functions to get cpu
 manufacturer information
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_052205_940085_44252E82 
X-CRM114-Status: GOOD (  16.65  )
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

On Wed, Mar 10, 2021 at 12:39 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 07 Mar 2021 19:58:14 PST (-0800), vincent.chen@sifive.com wrote:
> > Add 3 wrapper functions to get vendor id, architecture id and implement id
> > from M-mode
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  arch/riscv/include/asm/sbi.h |  3 +++
> >  arch/riscv/kernel/sbi.c      | 15 +++++++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 99895d9c3bdd..94a7f664caf4 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -97,6 +97,9 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> >
> >  void sbi_console_putchar(int ch);
> >  int sbi_console_getchar(void);
> > +long sbi_get_vendorid(void);
> > +long sbi_get_archid(void);
> > +long sbi_get_impid(void);
> >  void sbi_set_timer(uint64_t stime_value);
> >  void sbi_shutdown(void);
> >  void sbi_clear_ipi(void);
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index f4a7db3d309e..33e3a9d6efab 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -547,6 +547,21 @@ static inline long sbi_get_firmware_version(void)
> >       return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
> >  }
> >
> > +long sbi_get_vendorid(void)
> > +{
> > +     return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> > +}
> > +
> > +long sbi_get_archid(void)
> > +{
> > +     return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> > +}
> > +
> > +long sbi_get_impid(void)
> > +{
> > +     return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> > +}
>
> The function names should match the SBI function names, which have an extra "m"
> in them.  Otherwise it's just confusing.
>

OK, I will add an extra "m" to them to match the SBI function names.
Thank you for the comments.

> > +
> >  static void sbi_send_cpumask_ipi(const struct cpumask *target)
> >  {
> >       struct cpumask hartid_mask;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
