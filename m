Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B0EC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 02:08:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539C064EFC
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 02:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539C064EFC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GxVE3CpKuZ6kGC3qzi1+8xww/79EfxPBGJ5j3hUzyoo=; b=TMMeUKLSW7xtX8DD9VGeyc00l
	Oit7M2VeWzXdfLYq5EAKTh3NMe4P+qogQUJRGn29GgPzcDeDmnkjhGAV7tWbLkfPBF1zxt6GDCJQO
	dSO2h5lHOs7uCQTvfB7nx0mG9QkRVVCbaKmKBjjsXoJw1xvw2IIdqcKGkQq5MPAfaHIR+G3uAwlwK
	fHFhe9OeqaVVGZ5hTqFoYn3OGA9k2sWrjD3oGftqxlkrFA1k6Ub6DlibqVujhvHbPZD6GC6mh8wud
	Bzj/FNOvEb3OGIJ6fxUS9XMVqyQthqwNJKIOCZHr1Zy0w4YfFIMaG3kmDoSaQQqphN701JB4tajbm
	t40J5Yn+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMi4j-004HHA-UP; Thu, 18 Mar 2021 02:07:50 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMi4e-004HGi-Py
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 02:07:46 +0000
Received: by mail-oi1-x230.google.com with SMTP id u62so827921oib.6
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 19:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cBOic09Ji2sUr7lSL2XtTwyzCrDuTRmAgWURvlhvtG0=;
 b=Ndyrp+nu/db70ubdGOP4GiYnNhiVuTIguQnDDahQbyBGQtCYZkmBwbFRrQ0REfFdj2
 dRkdkq4cgKCrJ8QfojElCvKbvTvOOx4+f16SDDder/3dQUojGoLn8e1GIaj4tmukiFd6
 a4QwSiqMelJNPB48P0pbFRbE+P/KM6MHbvLTe+tmVJbozYvI6PqWLDPBILZM84FJTWUW
 lZ00OaIwe0tRb/hp5VmnHACLpUaOuqKvERUGxgLjPUbbSfEwfwmv3yGkidDsLkSHf5Ta
 r4CdscMpJb/kl0YwPHEaEdBuDNozUW8qyLuBqNZRgD94Ul84FkiCjiDZwUJjpYA9dyeZ
 El/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cBOic09Ji2sUr7lSL2XtTwyzCrDuTRmAgWURvlhvtG0=;
 b=gLypsotQKXNif2VqcGXUgrjTRUMqak5HZ6UHm+KgvxAQO1Y6DTyv3qkfMBioSv7Nvd
 uTwIDEpG013+PLhgC/O7V1n2ULqXvHNLQaplPSKykOTYziCRTtRx1LozthPrGZuF6tsJ
 Hpbx5i5ddlKSgUoh8bUzOk1bDdy1IfJMp2/fnA4Iil3HmBy1+a36/VVEUO+mJM9n5vSL
 u8pHkk/Sg2b+fF8OXR2r0xf/CO2CVZ9uzvRSmreXHpdx7vOP8Ep/+gZ1jtJldQcppDNR
 ipYajj/ErHvwVtyWuTrYE98usjILJ/GHrR7i/zWS4cPATUkzTFGUP/bElo7EV1b+JCBY
 0zwA==
X-Gm-Message-State: AOAM532i/Rgr1QPyw7o90vg0JLCId8sEgnQQYTX/Mgcan1HJpsPsM6j5
 vH5L9mriAQG5Uf1VqSvC1bR8g+g1dKi2U7vCzEo45A==
X-Google-Smtp-Source: ABdhPJyIpml/gdyY9dmtxfJlp6jCFpscTMsFU75hsrbdN3tUsgB4w6NmCOGaxfR8kIRzYDCQD946laEs77CtO2uP5Ko=
X-Received: by 2002:aca:1c02:: with SMTP id c2mr1352536oic.31.1616033262714;
 Wed, 17 Mar 2021 19:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
In-Reply-To: <87v99qyjaz.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 18 Mar 2021 10:07:30 +0800
Message-ID: <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 Yash Shah <yash.shah@sifive.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_020745_002051_3FCB94AD 
X-CRM114-Status: GOOD (  10.75  )
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

On Wed, Mar 17, 2021 at 3:45 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 09 2020, Zong Li wrote:
>
> > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > clocks than FU540. These patches also refactor the original
> > implementation by spliting the dependent-code of fu540 and fu740
> > respectively.
>
> That breaks ethernet on the fu540.
>

I would check that, thanks for the report.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
