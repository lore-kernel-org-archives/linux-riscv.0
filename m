Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F9DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2602261054
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2602261054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLJlSiiuaXdfFu8hboUxEc2T8mJE/xi2SS1cqggiPvI=; b=SqPMKQ2+dEliBD
	FltSTAJg8B1lWOtv6If1RSQOnaQgBDg3PlLfL2PDWZWMT6l28f8fk+hN0gBMRaeQrSdkKUlDgA0dV
	gyQaiY76MTIcjKxFDYwOA97i+fU6xRGSRmn6lh6cVGCziOtpjyGliG1nxak75+jbqGXiEG7orIdqY
	m6VSZdxfDmEQgG/G0ZPFCPF5zlgR152+rGq/EiqfskPJcDU1ydNSkZm+cRKSS9eQxpAQQHc1+eA0R
	MsNrI1UeYUJm5GETDcW7+2nRUHlmgU+NGCNBkQupngpqb6eZzWuwOMqhFgohoyJ6XaUHvAWUEJrn2
	FC5VTYYmwAbuccmBzk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNQm-001EIj-Ew; Tue, 09 Nov 2021 09:28:40 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNQf-001EGS-VL
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:28:37 +0000
Received: by mail-pg1-f169.google.com with SMTP id g28so9299991pgg.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yz8tM/z3N2e7EAzXLrtHRMyDGqdFNyhQg+TbKONS+ZA=;
 b=w/T7hrDg7pZN0ryw3NWIQ7KSxkjz5pgjB3OTkJYmlNmUOcfnU5WAx5FBI3bcKS+Bbe
 NifYGkErX7TuYpLsmk7+KqDDID2BK0mn/FBpocQk1loMQsSRq9YTzqUWFnKcXqVyPlb0
 3ATxNayH9+xdOjiVhyZ6v6Xs7K1qVQP0YUTbLs7+UU0s7CySsNe32XqLTUOEUbni8kxA
 YX45b/XMzWlGRmUfLP26i7g7ED6jp/WPph8Bpj6BDJAIEBVJojiBKVgzZ0I/clsIEnkk
 aJY3Ku0Hs0y7UP79LbZ4fb0nPn5/6f4N/4rJVOWkOmwCwugb9oxdpqnY7hxSvBSes+2Y
 1/cw==
X-Gm-Message-State: AOAM5310xsgpc6w8k4zpT0j+3H7/m+yeOQWITBzKm0IR4P5qkuKxqMgN
 CssBAatOMqMR5WZR9b7ngesrYUF2FGy5I2Q5mWE=
X-Google-Smtp-Source: ABdhPJxW3OzBbFwk6SYjQCx51Ta8chEzqW82y4oeq2E/L1Hmmq+pPv46FbGKxh51ekUabxDvqUbynxlLSoh+pPpDjsk=
X-Received: by 2002:a63:b11:: with SMTP id 17mr4847235pgl.51.1636450110959;
 Tue, 09 Nov 2021 01:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
 <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
 <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
 <CANBLGcztx0DL=U06QPJ5XT4ra=kx2QAZxxP=0bjfgQ0skhv3Bg@mail.gmail.com>
 <YYjrE/+1wxgGEAKJ@smile.fi.intel.com>
In-Reply-To: <YYjrE/+1wxgGEAKJ@smile.fi.intel.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 9 Nov 2021 10:28:20 +0100
Message-ID: <CANBLGcwwE7u377N-9B4X7Tew9hLUtusZ=0B9GSj-b3mV3r-Sbw@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, 
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_012834_085259_7F9959EC 
X-CRM114-Status: GOOD (  14.17  )
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

On Mon, 8 Nov 2021 at 10:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Nov 04, 2021 at 01:15:46PM +0100, Emil Renner Berthing wrote:
> > On Tue, 2 Nov 2021 at 22:17, Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > I'd really like to understand your reasoning here. As far as I can
> > tell reading 2 adjacent 32bit registers with a 64bit read as you're
> > proposing is exactly what would cause endian issues. Eg. on little
> > endian you'd get reg0 | reg1 << 32 whereas on big-endian you'd get
> > reg0 << 32 | reg1.
>
> Nope, it won't. The endianess is a property of both CPU and device.
>
> The I/O accessors, such as readl()/writel() and iowrtieXX()/ioreadXX()
> are _always_ LE.

Aha! Thanks, that's the bit I was missing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
