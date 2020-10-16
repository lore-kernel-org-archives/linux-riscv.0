Return-Path: <SRS0=aLlD=DX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588C6C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 14:56:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC73520874
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 14:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s84AXNtK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ymp3Z3Al"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC73520874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EkL34LpPlJ7lJSG8CBkkzqONTcxxYld6surEur76oYE=; b=s84AXNtKj+oWfEev48H9uE06J
	iC1/WyFTZEKS4Xj9N2t51bIm4aYKX0eLNC2OHH3eYUN6nB65RgswHBq/MCee2dYDBkbkTPbY25XrL
	2gZOkQPhiii+57aq/Weuul8+swev2mXiAoEViXcQNRWuhGlG5cfjeXxAQCRqQYmQzP8Kz5CXN/8EN
	16hOvkT6EEJJEJtEMI+1x371eTO++hIsSc8bdluHbuCKbVMSiURoLVD0ZYisO219utFP0awZ7ZSt3
	L6X+Hk6ylRMMyhwX2T0iIa6bhid4+tf4ooHXVVyIRl5y1jdY6jC20LZ8Qz67aZj6yUG0C2VYLB2zr
	y56iRk4+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTR9n-0003Pd-V2; Fri, 16 Oct 2020 14:56:35 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTR9k-0003OK-75
 for linux-riscv@lists.infradead.org; Fri, 16 Oct 2020 14:56:34 +0000
Received: by mail-oi1-x244.google.com with SMTP id q136so2723826oic.8
 for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2020 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o683JyDzGtCz8h08bH720Xzkdnsct+b153JAeeQ2q3A=;
 b=Ymp3Z3Alkmll4V81zm2iA/funD9+iBwilvwYdSd9IX5hMZRv5M7byKXSK+PMkOp56A
 +yYyeMN+OW4vBy4YOedRf8XjX4mA9LNxrHGmvVrkQ2/PnZSw12zAqipKc5ZExVnn1a+k
 0o+3tuXvjoOf+ml2ynW9iAxrN5i1wfkPOKe8BNsnzj4Zl9a1yViKfBXoMkf13O8R9toq
 O+EoBlUWfBjYm+ei9fZxzNzkD2FqsMsRvuPUEhk8BpX3NGo4Q6rKhrrOtXsCk+g/EYQ6
 hkvAddoDwwCVKhyig9g52Gn5e8MAT0MxaPRma95tSkBJdMnMZ5lVP6fGnBryobfPcveD
 SEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o683JyDzGtCz8h08bH720Xzkdnsct+b153JAeeQ2q3A=;
 b=gr588RuDJDpzkui41e+MjGy2QM6++v+WybV9Umj1uaQ3l0SoJJbWDT2rJCOHSqEF3m
 19lBQZyVofAlAvvsHfG0UKn2Oqf2+csvKE7sjrJWMubsYtGx+r34Gn6bqweMIID8htUH
 ezGksmrG7FRkJJQVZ15CKVNhW88vPeR3WY6uyRDTjTzbmr2khD1i+zOnPFt8jbAfjNJI
 UuWdTC+X6luNhIAl2LRoECTaTpm5WnHx839k5VaFciDTcFmYsqGm6fwBA7XZ5yRWI5+f
 6qwv4EDBNokLtjBG5oQBnpQIV/nKub+Y0WOwQtUarOtJEc7OzTTz1ROlmvUEgXXNyQ8n
 BT3w==
X-Gm-Message-State: AOAM532CvE3Qi63I7c7Rl0YJYkXqOgzEr0ZUzCJcLxNIAcdpWWgGPRhx
 mu9XqG5F+avY8U4eqlD6JdcjXk/oyn3K8A4wsosEfg==
X-Google-Smtp-Source: ABdhPJwaOVXEFgE7MDb+P6rriQcnt5gJEF9iYQ95Wzrs+rMlfp6FglUJ6grrdHS4qDdHDbY3U7tDou8zkTfLCp3asy0=
X-Received: by 2002:aca:6702:: with SMTP id z2mr2818623oix.140.1602860190126; 
 Fri, 16 Oct 2020 07:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com>
 <d0627c5b-1007-bca0-e6d6-0a3740eaf6a7@gmail.com>
In-Reply-To: <d0627c5b-1007-bca0-e6d6-0a3740eaf6a7@gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 16 Oct 2020 22:56:19 +0800
Message-ID: <CANXhq0pgeDZkWgwmZE+sFPjYhAmNBNoYGPRfij+Yz_Pc8hNN-Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: add driver for the SiFive FU740
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_105632_555778_C7311DB9 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, sboyd@kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 10:17 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 10/16/20 5:18 AM, Zong Li wrote:
> > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > clocks than FU540. These patches also refactor the original
> > implementation by spliting the dependent-code of fu540 and fu740
> > respectively.
> >
> > Zong Li (4):
> >   clk: sifive: Extract prci core to common base
>
> I don't see this patch, and it isn't listed on the web archive. Was it
> not CC'd to this list?
>
>         --Sean
>

There is a problem on linux-riscv mailing list for the first one
patch, the size of it is too big, it needs to be approved and posted
on the list by moderator.

This patch set is also sent to clk mailing list, and I can see it on that:
https://patchwork.kernel.org/project/linux-clk/patch/b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com/




> >   clk: sifive: Use common name for prci configuration
> >   clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
> >   clk: sifive: Refactor __prci_clock array by using macro
> >
> >  arch/riscv/Kconfig.socs                       |   2 +-
> >  drivers/clk/sifive/Kconfig                    |   8 +-
> >  drivers/clk/sifive/Makefile                   |   5 +-
> >  drivers/clk/sifive/fu540-prci.c               | 618 +-----------------
> >  drivers/clk/sifive/fu540-prci.h               |  21 +
> >  drivers/clk/sifive/fu740-prci.c               | 102 +++
> >  drivers/clk/sifive/fu740-prci.h               |  21 +
> >  drivers/clk/sifive/sifive-prci.c              | 529 +++++++++++++++
> >  drivers/clk/sifive/sifive-prci.h              | 297 +++++++++
> >  include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
> >  10 files changed, 1032 insertions(+), 594 deletions(-)
> >  create mode 100644 drivers/clk/sifive/fu540-prci.h
> >  create mode 100644 drivers/clk/sifive/fu740-prci.c
> >  create mode 100644 drivers/clk/sifive/fu740-prci.h
> >  create mode 100644 drivers/clk/sifive/sifive-prci.c
> >  create mode 100644 drivers/clk/sifive/sifive-prci.h
> >  create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
