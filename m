Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A668C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:47:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B2264F40
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B2264F40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=utmdM5b59Aw3J62Rtu/WsLiuz8GA2X3ERfHJoWFJmJw=; b=jWOJCcgk0LXsw2visyRRaZLZu
	dJ2SfR1GKwHjUi6rJrXKU4HzhhP+8ZpKthH70WSzPtQYdDZIS+FSsQbhLC/VFyiIpxq8IxMrBscbs
	b1iRTMyN+pRvYJkmy/xtIxQHz0l/z6HIIUAvb+FPm4XhwfLOuTZzYdkuljP5Ky6Z+OaSx7knFemFK
	0TsQxiyk2wOqObCrikEwcLIfNI5HY5vebeHRWkWbUhq7jZoQpVt8mAEfS/Rq/oHFoHRnvMmbzYRWL
	b7pXHBawuFSjesiETl6q2dY1cCHREe3NeN4Z8SQd2nvmRoQ8YBUp8ksO0IexORIw4mpYjZR82eaVL
	8gcmGcuvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNAmV-006tlJ-Nw; Fri, 19 Mar 2021 08:46:55 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNAmS-006tki-5v
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 08:46:53 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so7819839oto.2
 for <linux-riscv@lists.infradead.org>; Fri, 19 Mar 2021 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nlniv6NhjsX22J8Q1FhSg42awk/KHioL1/VS4RfBXc=;
 b=EBBKPk5/oWfch+5vb4X5lTZDAvqrabwKM/DR8s8xYJJs8B0bEwI9A2TbLFgiQbuPVL
 uh9XcfPp0yObv9mIqDxuQhJgFKz8m+Bboc3pPNSERFV4EL8IGco2mLPm/A+GTm28W248
 JIqF1FikLnBdIQV1DtgVS98gyxuC1zhEU+smszAMhEd+mdfHNIpqVLOGD7rmKAGkyyi4
 7olmgkJn6O9CkQLFAFP8+Y0JiKjtSIJDD5dinqeedtb7BztuNrQDSiwTJedH2WszQcV9
 D4X0z+AMs9hicptJSRoHatiW3WlQ329B18y5u/7nBcrD/m4cN+oaYb9gGOzlVZUt2Zkz
 183w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nlniv6NhjsX22J8Q1FhSg42awk/KHioL1/VS4RfBXc=;
 b=B4TiJp2ZlNyTCZb0iL2+fiV/yByFeRKOypRnASYFuBBgRjriXLooDkoMSCyHaFnlyP
 am+sXfyQJkY7T5K0iKCvKn4NRkHJf01hnDf8fE0h+3dqetUqJzMA+PvA8H64rYPRuvba
 oKxRgUWMcYR8rQMaT9U3YstlIq6iXlfm6TxQHMkdds7KQjDXsMp+l4y4pTqDLji/3FG1
 5v3Cbt+VlcJXXBO4XNMmnK66EQvDht2uQCV6rP3rbQP4fybNXJGhQLwb2l95PBPekMne
 yb6ge43HKoELBwZNM8tDOZZtwJBD24D5PtBt49jwKWSSBruSB38PsxRS+pIFKypJpX+J
 NHoQ==
X-Gm-Message-State: AOAM530ctQ0wsXwsjqKfb3Z/QUFWucRaKrVeUZo7eScxsbaPoiO/IrF6
 XLgGu4SufKtkXgk5ZFxpFgebQdasJ2AB+6WNvHs=
X-Google-Smtp-Source: ABdhPJyDbMzCjB684c2K90H8QTTyo/y47GPwAG/TI8SPIje3RrYh0GEdkIkLrgR7Fgy0lZRuZLpeSjPWfRxXle8bOns=
X-Received: by 2002:a05:6830:8f:: with SMTP id
 a15mr211558oto.299.1616143611072; 
 Fri, 19 Mar 2021 01:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
In-Reply-To: <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Fri, 19 Mar 2021 08:44:00 +0000
Message-ID: <CALecT5iX+Taf=uKy_RoyC9f9BjeSSVgSwF-8U-51N=0PbXwZyw@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Zong Li <zong.li@sifive.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Stephen Boyd <sboyd@kernel.org>, 
 Pragnesh Patel <pragnesh.patel@openfive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_084652_328374_5A195C04 
X-CRM114-Status: GOOD (  16.70  )
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

HI Zong, Andreas:

On Fri, Mar 19, 2021 at 8:21 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Thu, Mar 18, 2021 at 10:07 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > On Wed, Mar 17, 2021 at 3:45 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > >
> > > On Dez 09 2020, Zong Li wrote:
> > >
> > > > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > > > clocks than FU540. These patches also refactor the original
> > > > implementation by spliting the dependent-code of fu540 and fu740
> > > > respectively.
> > >
> > > That breaks ethernet on the fu540.
> > >
> >
> > I would check that, thanks for the report.
> >
>
> Hi Andreas,
>
> Could you please point me out how to test the ethernet from your side?
> I had tried to quick test by using iperf and wget, the ethernet seems
> to work fine to me.
>
I will give it a shot during this weekend, since I'm facing the same issue..

Yixun Lan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
