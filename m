Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCABC2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 06:37:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51E322384
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 06:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v0dZRc0R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EK8UYcc+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51E322384
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qKlmHEyZf8OIlWkz+YjGzmI2JTJ9nnzw3UCrHCNoUIE=; b=v0dZRc0RYNZy2j9Qv8FC1U+zD
	a2r5QwUOz+k7IZ+z/HNmWp2kGb26zwKNiWd0RTCdcNJq8CAUsM4zXNUBDCvCOgG1MKbf8OzresimG
	DRcqvO2sI5zeoZf62AcsdlZriPZ/WovIPW0/DTWwIXfpHsro7fd/wjZmyTbdwY8u+b3z/7IS39DTV
	VK4+z7mf/JVQEV2RuC5V5CuL7RBbahBi1BQ8nzjn7zLHN7+h64XOWVuQNryATsDw0IRuQcEl0T2hG
	VxAANdoe+nOllz19t+iIEZDOHqIKNNhaFnXdnymgsZPg/rA21THCdOYtT07GVo66nVtmB2RG8iHgp
	lO8NSxsqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaCQJ-0003gu-AW; Wed, 04 Nov 2020 06:37:35 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaCQE-0003f5-VW
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 06:37:32 +0000
Received: by mail-oi1-x241.google.com with SMTP id t16so3763885oie.11
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 22:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NdyAupHoBSpX8M4LNhpuR15yjy0bTroUkv3Rh3Q8LnI=;
 b=EK8UYcc+V7mbPA5bIGcRMagowbDawbm+GUFAp0Zae+iwnjhU3XDGEG2pQWoO7dNIiH
 iROpuEoA50KNMGEgL2wvanozsOfE1uO5ufljm7v1JPHmmN1ma7YuJdt3JB1z02wC5rdN
 TFyqiALsjwDjp3oFLw72sa0Kj37oaj2wOpx7bQFOkm8Cb1ZQbkTGzlFClXkwCMl86agQ
 vqLdQr8HHLYy4eBSo0trBzkTVod5SCD4rv5xzwh8q7OADK0yWqvpYt8Z/e2p1zUYjNHC
 +WyOYPbfXaO1yHXAYgy/RU7VpTdpFmxb493pHA5MqL9mETHw3XAMfowwbvag06WFiGfQ
 KS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NdyAupHoBSpX8M4LNhpuR15yjy0bTroUkv3Rh3Q8LnI=;
 b=Cft7WatHJjISw+UhhWbWj0ub3WhjCr5VrmFohIZ2xkP/OPAxlY+imWU2z0vpkibmI6
 AuYKuP9YXu3ULP4q0m325dWq9j2EVWewU84hMb+obYPBU1U0OpXinDWj3Fsa72WBCU0B
 8IE3uThUAroJKtk55Hjrd6HTh/osj0cl0LoRV7WrEKeslykzEF2mVdQpsT92Jt5rVuZT
 4srq0TZl215lz99L8i2E1+q9lMQKhqcObgT9uKsQy+MsuRIYm6i3nEi2NqNEt5b2dP9Y
 N0og5Sb2GgDOGkXoyq9zSKvyihf77VnWdnvUkbg/X0i401P1/debo9Wd76kvFHp1gdTk
 ou5Q==
X-Gm-Message-State: AOAM531pVDT6MBI47BfYHjnWTAo3EehkKYqxvCBlpeI6JcBljQ66bPYf
 SwgrG425b7zeWuBSqjoC1YkykQTCsSvA0qHYq1QwkQ==
X-Google-Smtp-Source: ABdhPJxm7DLYXbMomK9YWiWLSTVUPaRI+VJJ5tgZdr7+a3a21THR3UvntEHG9wp+X9qffZpaoq6YN7wXRbLEutw3IRc=
X-Received: by 2002:aca:4b82:: with SMTP id y124mr1676328oia.35.1604471847796; 
 Tue, 03 Nov 2020 22:37:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com>
 <d0627c5b-1007-bca0-e6d6-0a3740eaf6a7@gmail.com>
 <CANXhq0pgeDZkWgwmZE+sFPjYhAmNBNoYGPRfij+Yz_Pc8hNN-Q@mail.gmail.com>
In-Reply-To: <CANXhq0pgeDZkWgwmZE+sFPjYhAmNBNoYGPRfij+Yz_Pc8hNN-Q@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 4 Nov 2020 14:37:16 +0800
Message-ID: <CANXhq0p2txQE4-hCu0kGNQ4gX6t-RMjAyk4Jx5eZVVLbFKrPyg@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: add driver for the SiFive FU740
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_013731_330955_50161FF2 
X-CRM114-Status: GOOD (  21.26  )
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

On Fri, Oct 16, 2020 at 10:56 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Fri, Oct 16, 2020 at 10:17 PM Sean Anderson <seanga2@gmail.com> wrote:
> >
> > On 10/16/20 5:18 AM, Zong Li wrote:
> > > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > > clocks than FU540. These patches also refactor the original
> > > implementation by spliting the dependent-code of fu540 and fu740
> > > respectively.
> > >
> > > Zong Li (4):
> > >   clk: sifive: Extract prci core to common base
> >
> > I don't see this patch, and it isn't listed on the web archive. Was it
> > not CC'd to this list?
> >
> >         --Sean
> >
>
> There is a problem on linux-riscv mailing list for the first one
> patch, the size of it is too big, it needs to be approved and posted
> on the list by moderator.
>
> This patch set is also sent to clk mailing list, and I can see it on that:
> https://patchwork.kernel.org/project/linux-clk/patch/b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com/
>
>
>
>
> > >   clk: sifive: Use common name for prci configuration
> > >   clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
> > >   clk: sifive: Refactor __prci_clock array by using macro
> > >
> > >  arch/riscv/Kconfig.socs                       |   2 +-
> > >  drivers/clk/sifive/Kconfig                    |   8 +-
> > >  drivers/clk/sifive/Makefile                   |   5 +-
> > >  drivers/clk/sifive/fu540-prci.c               | 618 +-----------------
> > >  drivers/clk/sifive/fu540-prci.h               |  21 +
> > >  drivers/clk/sifive/fu740-prci.c               | 102 +++
> > >  drivers/clk/sifive/fu740-prci.h               |  21 +
> > >  drivers/clk/sifive/sifive-prci.c              | 529 +++++++++++++++
> > >  drivers/clk/sifive/sifive-prci.h              | 297 +++++++++
> > >  include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
> > >  10 files changed, 1032 insertions(+), 594 deletions(-)
> > >  create mode 100644 drivers/clk/sifive/fu540-prci.h
> > >  create mode 100644 drivers/clk/sifive/fu740-prci.c
> > >  create mode 100644 drivers/clk/sifive/fu740-prci.h
> > >  create mode 100644 drivers/clk/sifive/sifive-prci.c
> > >  create mode 100644 drivers/clk/sifive/sifive-prci.h
> > >  create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h
> > >
> >

ping

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
