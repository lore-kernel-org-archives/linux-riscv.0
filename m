Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90EEC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFWYErP30PMiyJ1zY2A46GN9eP00ziUwtb2h6OzZIGA=; b=lu9uF4pwAwnETj
	VfWFf9aGBhV6rBm6pBKElRCDIM9cR9G+j6dVY4YFCvewqCEHMMISlH9Lvm4OC9tx4jFT9v32n/io9
	Qgz4/cM606gLBdmovhRuyGPmW0SJL7gGjvItTbNJjILaz4i1g27Pj2UTjHLDprUPX5QA27sL5mnBa
	ACb87QWmHoB41mW5YTzH61s/c2kBGbBO5c8t8XoQnYFiKlt/uTTqjkIEj5U4qEX9Cvl5sV+JlwLMl
	iJNv81qeuY+8S5UCeZlp7BoZ4o2s5BSAw6oA+egnY5li76REbdvWvv8/Hou13eitv3AnpD9/rlr3U
	opH6fixCDcyGrbUhbiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRd17-00FkOO-SD; Mon, 13 Feb 2023 17:53:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRd13-00FkMs-1k
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:53:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id mg23so6119781pjb.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oVVr3kQ4dvAV/kgzEs7a/6cws3klBr48elRB1k69r0=;
        b=LgKghyebGOh3bP8hEzFdfwGSMH1cBm60cGIsaZx4fuMF1cE9MKe95/CBSIay+QUiGs
         K5K6RtfkTuHGEqjv71opafmVuUPM1Nft/EzzyEKVJzTBUNUKnOaRBfq5zjBK3LgJ7fVw
         OzZi5n1ouKx3lYXXyr4Ci0lh/xE3zl88BMexkD/o8grh8QpNpfJxB67leAlRvdwdTyUP
         taku6PTjeZisqV4wQzgbj5BhHK48ei4lFfl67jUv16Bloub9IASuBmpue9CPJbJoktbr
         Ec8HgAJl7XpobYesmC2Bu271Eao9xSQUoxQJDVTEe1yJQKnR3QDoCJ0UisuThdBFETZZ
         w5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oVVr3kQ4dvAV/kgzEs7a/6cws3klBr48elRB1k69r0=;
        b=JcIJ615Kayq68tjnT8PzFON7ThsaDU2PCqE2fgCKdKwohN/MtrVhUKKBySUwOn5twy
         jzJK+9qS4XGPVgwc9ZuhKfscnu9VIDj8q6CFE7PeRqzk/xvpXIFgFrUAmGS+6Qhvcoow
         /oeNRnF+vj0pliBsHzun44/qJ0ualGBqn4ZYphPWINjRgXWQCDZqGfqSAt/v3Y3/dA+3
         xsmIifYGWXwip3eQ3QQnXQ3meklzFGneeooRaXBMsACfSGeKcHc9ToBPFGpjKxglW/9R
         iOBUMTM6xfVMJdKe8rzPChioVgkGP9t7St64X0KojqdznR+fMNyJPs3pkEYb22FRAbLf
         JHHQ==
X-Gm-Message-State: AO0yUKXi6IBn2zHkH1Fjl2cbLiWSqVMF5sztBMxoGnYFUpBSw3Ao32r1
	qHsBuGu5B3SE/9yIL93sh575nA==
X-Google-Smtp-Source: AK7set/Qv3EVerw9Rt6XlSc5yNUHkObHYZU2J5Vc5WEa1EMKFQCvEB+ZhzHAg32cootQVX1l5sQS9Q==
X-Received: by 2002:a17:902:c791:b0:19a:9642:dee8 with SMTP id w17-20020a170902c79100b0019a9642dee8mr5270304pla.0.1676310803091;
        Mon, 13 Feb 2023 09:53:23 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm7453935pls.183.2023.02.13.09.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:53:22 -0800 (PST)
Date: Mon, 13 Feb 2023 23:23:16 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 23/24] MAINTAINERS: Add entry for drivers/acpi/riscv
Message-ID: <Y+p5DL/c12naJotE@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-24-sunilvl@ventanamicro.com>
 <Y+Vroj6CmrL4I9lN@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+Vroj6CmrL4I9lN@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_095326_351389_8E57C6C7 
X-CRM114-Status: GOOD (  14.96  )
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

On Thu, Feb 09, 2023 at 09:54:42PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:24PM +0530, Sunil V L wrote:
> > ACPI defines few RISC-V specific tables which need
> > parsing code added in drivers/acpi/riscv. Add maintainer
> > entries for this newly created folder.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8a5c25c20d00..b14ceb917a81 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -450,6 +450,13 @@ S:	Orphan
> >  F:	drivers/platform/x86/wmi.c
> >  F:	include/uapi/linux/wmi.h
> >  
> > +ACPI FOR RISC-V (ACPI/riscv)
> > +M:	Sunil V L <sunilvl@ventanamicro.com>
> > +L:	linux-acpi@vger.kernel.org
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
> 
> Supported, no?
> 
I prefer to keep it same as ARM.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
