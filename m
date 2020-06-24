Return-Path: <SRS0=NJ9D=AF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF758C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:15:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799C920738
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K3eVZXMO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFQxL2bu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799C920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MJUfy7OWrvPkjkwxRoB1mWSw17XeMxlf60QJrtfT/pg=; b=K3eVZXMOuc/JwF2UVC7jbY3B1
	9azCIa5E5qLXjFbp09gK256eIQOoF4u4NLxK4wQjrg1QUsV+W4j13Ggw1nIgc5KjoD5CMwwXPjgIQ
	MUJfyauiqaGRvo+y86ob7CDnwTsAvfVL1NJ+k1hyXC2Tp3GR6vaeSTRcPqkVzS/znJM7dgLd5kxEQ
	z+B0GbF545Bbg2opDSLoMFQRzUPf09fz/1zjXDmbj2Esi/CS1yRaXKoi/gftvND+HysWeFIs6M0Lx
	FzV8H2ucYZ99uqBgQm64bixpNOv23er4/CmjeKBtTYBd4nwRRCOE9VazJ5ioHoJWUda1Nbifv/aaF
	A1yt01kIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo1VL-00041l-CN; Wed, 24 Jun 2020 09:15:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1VG-00040N-5n; Wed, 24 Jun 2020 09:15:34 +0000
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 187F020738;
 Wed, 24 Jun 2020 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592990133;
 bh=14K+VhMvuge//+mHFVRO68jMad3Xx5brMH+O3+ggBOk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IFQxL2bunzkopmfTsIvl2UbpyJSVNCbVz1tMkicOQpIhZE+i7/lWCftYg10E3XPAI
 LleqWHI0jaKN4UcquF75OjUnAAl7OdeSI1CZUwvRqOC11GAXNdmVhHLdaOFnoVbq1E
 XfG8K/JctUacbaPa4zvCuXENEZxWe4yQDQX+rA74=
Received: by mail-lj1-f172.google.com with SMTP id a9so1765760ljn.6;
 Wed, 24 Jun 2020 02:15:33 -0700 (PDT)
X-Gm-Message-State: AOAM530wZCAIL8S3PiqIuLqIyj2bRUhU9B/KzDMMM6f5gnvjtzY2Am/w
 khE401v+3jj8C3C4MtORmOic3J0ckfh1Ui/UGPQ=
X-Google-Smtp-Source: ABdhPJxbxsux7XuzN8uOjxja4hquHGy/NKFHEFBm47OMUifwg0Hc5X+Fhkw49rQCA/MTWVvIK0zPn0Jq/i3BDFjZoEY=
X-Received: by 2002:a2e:954c:: with SMTP id t12mr13005177ljh.287.1592990131408; 
 Wed, 24 Jun 2020 02:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
 <1592902276-3969-2-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1592902276-3969-2-git-send-email-yangtiezhu@loongson.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Jun 2020 11:15:20 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
Message-ID: <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
Subject: Re: [PATCH 1/7] irqchip: Fix potential resource leaks
To: Tiezhu Yang <yangtiezhu@loongson.cn>
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
Cc: Baruch Siach <baruch@tkos.co.il>, Tony Lindgren <tony@atomide.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhc@lemote.com>,
 linux-riscv@lists.infradead.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-csky@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 23 Jun 2020 at 10:51, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> There exists some potential resource leaks in the error path, fix them.

This should be split per driver and per bug (although mostly in driver
it's just one bug). Otherwise it is difficult to review, backport and
revert.

Best regards,
Krzysztof


> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/irqchip/irq-ath79-misc.c      |  3 +++
>  drivers/irqchip/irq-csky-apb-intc.c   |  3 +++
>  drivers/irqchip/irq-csky-mpintc.c     | 26 ++++++++++++++++++++------
>  drivers/irqchip/irq-davinci-aintc.c   | 17 +++++++++++++----
>  drivers/irqchip/irq-davinci-cp-intc.c | 17 ++++++++++++++---
>  drivers/irqchip/irq-digicolor.c       |  4 ++++
>  drivers/irqchip/irq-dw-apb-ictl.c     | 11 ++++++++---
>  drivers/irqchip/irq-loongson-htvec.c  |  5 ++++-
>  drivers/irqchip/irq-ls1x.c            |  4 +++-
>  drivers/irqchip/irq-mscc-ocelot.c     |  6 ++++--
>  drivers/irqchip/irq-nvic.c            |  2 ++
>  drivers/irqchip/irq-omap-intc.c       |  4 +++-
>  drivers/irqchip/irq-riscv-intc.c      |  1 +
>  drivers/irqchip/irq-s3c24xx.c         | 20 +++++++++++++++-----
>  drivers/irqchip/irq-xilinx-intc.c     |  1 +
>  15 files changed, 98 insertions(+), 26 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
