Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3254FC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 06:57:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81DEE20786
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 06:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXuBt812";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fGjMpbie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81DEE20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YqB6aBtZGLVBfPAO5z25gSmtddDX5HxeMqjgEdTFXk4=; b=sXuBt812Hj98PvKJZ13vghDpT
	hR3MDA95QGiFZPpOo+Eh8V/ikMcP6Q5bKjFPXz24BuMEFGUwQQFUQiDJQEGy/47KMzQnATlP00HKV
	CdVnKGgeKLnQlrnlArpK+LSHjMpSuZ/Sll1o0E1juowqvjnOqdFlKy72fkDWLllgn5BECxMr7Xcrs
	p8D3sjdlS17lFnUBX/FaMBPyeU2LgCbDPWDg+jE5J6XGZ1UO6A/FJoKeKWlP5CKaJ9Ig7Zu+6cDlW
	QCfjkIMPmFaXX5C/EuueoSaBXTWfqUjkQVmgQz95QGgDLMf1wtGvhwaIjoXiwTxsWcYRhU60z8cUM
	3BnErs0LA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaZCQ-0000Bf-CC; Thu, 05 Nov 2020 06:56:46 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaZCO-0000B4-4C
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 06:56:45 +0000
Received: by mail-oo1-xc44.google.com with SMTP id j6so182884oot.3
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EwC6aaL5scs/P7pPY4FBOZM78H0SX2GDzgejVIvtuSI=;
 b=fGjMpbieMBYGTP8eXkgUOsId8oCd1W0FvaKudufpR/oS4DI1DbaCiew8igvijFxBwS
 EHhoyWaghz1rNg9gKQCAQEMN3BvUTuPkhwCLnk+EQobkdb1tXrYj5a6rBuBQ9F39Dtu2
 VId+sax2ltEsuv9c8Q5RCbyHOAWv1FbLTXg3Y6Kxeguv4tq/CGHIJ5pl5IMERreUSAD6
 UM7T1zFhlnlo2IpL2n6yFmJuAaptDx4lxL3h/VKMT/l7r47IVPkX3DEsgSi/n94y6fle
 ImOYBhqXAjxHdO7nOj+r4aj8mZCPgD+HXicU4xsdbx3245xjMpmp6wc7bZmCqDJpgBra
 17xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EwC6aaL5scs/P7pPY4FBOZM78H0SX2GDzgejVIvtuSI=;
 b=Zox+Wc7twPr8D59MtcvZF/C/ueG3G62q8LB+ttHMRgT2nKGe/Rx7NfFGnfntlAneZc
 hWj7KmQBOC5mdMgolWOObiq2g0Ou2I8U8Sa1n1wwQnLrmzDTxOS42AUpRbiOE6Fgvbnh
 wSAglEgCXp1pwRfy6c+ZLds0iCpHN3nbjRuiz20X9G2Weeiy/MlnYamltt72USh0/ylN
 utaVJeADfsL52XzmHy1KxKj1XnscjLTn7PK3f51f4JV3+XQq/FkGMV7sFY7yiLC7P/kd
 5eSwryofjSUARkAcZ8YczMZk36k+6qfURYn7SBQ6628a8KaO+S+xvTCN+YlfADikyF66
 Firw==
X-Gm-Message-State: AOAM533dw3rb/bfFCzrSbgTf0vPsCrw8dHoAqxj1MzP8uAdjpsgm8O3h
 vZnuGlwkYj2199SKtmfgz0aLvmbeI8DaQOjGYdGN1A==
X-Google-Smtp-Source: ABdhPJzG+mUg1IhLpXs4PxzIVuJht73184cn4t2P8RYlFePqEzl5jZbufSglQtuHFx1WT3FcXVbe7LhHZNe2AclMWNk=
X-Received: by 2002:a4a:96b0:: with SMTP id s45mr804814ooi.33.1604559400459;
 Wed, 04 Nov 2020 22:56:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com>
 <691e24d1c45a4b56b57ce1e02a04268c4253a77d.1602838910.git.zong.li@sifive.com>
 <160454441626.3965362.17922436443029310228@swboyd.mtv.corp.google.com>
In-Reply-To: <160454441626.3965362.17922436443029310228@swboyd.mtv.corp.google.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Nov 2020 14:56:27 +0800
Message-ID: <CANXhq0oNpVAwGYHwjFngdGtbLHGZ8tMvgdQ8Prsg2N9L9Qpf5A@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: sifive: Use common name for prci configuration
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_015644_217960_2614C798 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 5, 2020 at 10:46 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2020-10-16 02:18:24)
> > Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> > patch is prepared for fu740 support.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
>
> Looks ok but needs an ack from riscv maintainers to go through clk
> tree. I was worried it would break defconfigs but it seems that the arch
> selects the config so this should be OK, right?

Yes, this config is selected by arch, the defconfig won't be impacted.

>
> >  arch/riscv/Kconfig.socs     | 2 +-
> >  drivers/clk/sifive/Kconfig  | 6 +++---
> >  drivers/clk/sifive/Makefile | 2 +-
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 8a55f6156661..3284d5c291be 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -5,7 +5,7 @@ config SOC_SIFIVE
> >         select SERIAL_SIFIVE if TTY
> >         select SERIAL_SIFIVE_CONSOLE if TTY
> >         select CLK_SIFIVE
> > -       select CLK_SIFIVE_FU540_PRCI
> > +       select CLK_SIFIVE_PRCI
> >         select SIFIVE_PLIC
> >         help
> >           This enables support for SiFive SoC platform hardware.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
