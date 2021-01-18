Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECF6C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 08:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8669622525
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8669622525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bmNn3dLmrT+U+t8P06/2odNgO7SV6u8VrWlc5Cbuvsg=; b=3QJjWpzJA3r4tpAbB0vWGCE3Z
	uXxpLGAS0V0hKFsIqWUVBlqY4UOMNLHvQwLfDQ8iaipgo9pI0G92rD78o4yp5mdQfWrMTss25Z9XD
	dFRSEWGeoaEMlwLhoafGjR/0/NenqSgv0970cqsgjqQowmFugmui7fr+4KDpPpzKQ1Uz1sugM4Wro
	EfDIIXcqGev8ZATi9rt8I2gSHIqRSpvq1NkE3/53daajmvg1FEVObJZjjSV5xfWkTSHqrr8MeB7J5
	DGJ/bz2K/NvZvqxEsPEG6euzKv5DDxL6b5Rml3fikLPBD0zXaKn1uUA6xoowpJlIZLSXNgvc0c9nC
	AYvZdwRfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1PeP-00075c-CF; Mon, 18 Jan 2021 08:12:37 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1PeM-000754-Lv
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 08:12:35 +0000
Received: by mail-ot1-f52.google.com with SMTP id f6so6242672ots.9
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 00:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31XpIbRqba5JSaVyBEgokuz5T05hWoDAIOrtX8MvC7U=;
 b=Bl5cz/alauTfHcYMIFwx/zmH6F8bYwB/lKPsUHsKgFHzKePMaSKoN5LDfxX4gWrBES
 bdw2qAo5Ys4eGUh92Cj3356bcKp4hxFrvNoGbqS5y1kklNgLRyouTeDsAk9Vj9zJ47Ht
 FdmnXzvlvq2oHVu5+5BvM24EkW98yWfYjNl3+Fbj6MwwD9gr0YGMETwjSPni+tTkp/5n
 YhRkqX36u+r30Rg2Il1H1vg1VV66vv+JqkEOx7NRpDsvm13AI5QZhy52+QiiKDp5XB0F
 Z2DD2duWQCbgx/S7hBAS/Bkll3zXD/pF9fDfzpkaywokDsSKWu3CO5Qdr8d5Qhl2G5N7
 2D1A==
X-Gm-Message-State: AOAM53284bNuP/PgkpJZAxfBLxagiFiU6ft5QLpmEBDyKDxSIdluDU+4
 F1cRZAEsBJIpxXafZ9AYZxEytH7MS3/OE+hrdvA=
X-Google-Smtp-Source: ABdhPJzcCY/iXKi7Kc0vXiWqIk2C3vZktMnLaO7mcZ0cI2l3IJuI/ff6kau9CKJBiNg6cS2QFbuImUd8hCVWNwSGwS4=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr16527017otr.107.1610957553495;
 Mon, 18 Jan 2021 00:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jan 2021 09:12:22 +0100
Message-ID: <CAMuHMdWZTRb2FtREftr5yBo-3nFEjpMXCjHQTE6rd0vuJAHQ-A@mail.gmail.com>
Subject: Re: [PATCH v13 00/17] RISC-V Kendryte K210 support improvements
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_031234_739314_2563F8A0 
X-CRM114-Status: GOOD (  10.28  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Mon, Jan 18, 2021 at 3:05 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> This series of patches improves support for boards based on the Canaan
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
> already included in the kernel. These patches complete it, enabling
> support for most peripherals present on the SoC as well as introducing
> device trees for the various K210 boards available on the market today
> from SiPeed and Kendryte.

Thanks for your series!

> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v26 branch.

I think you forgot to push?

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
