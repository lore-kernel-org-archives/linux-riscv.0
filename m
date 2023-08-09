Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34120EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 05:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m012WadZDw2QIqSjicd6qMMI4KyaGlG59A6Qs2FTm5U=; b=gjAKfHAoECGgLt
	EP7RzWq04uE6R8ux8xRc30fawz21SNVGnMlWj1eI8WO76eR1D4SC5ReS7VvtFy9cHENiLirVUb4Xy
	Cs8CsA6BAbSVonq1NhQ8nKf5DPVYPFz1KsUTMQpl+3QctAdLL3sUvEM/klnkoIbIOw0NLnIVaq52P
	+Ze+3T8p9qY1hIQc8tl7Ag2ck8Qh9GWCuVcyWnjJu5v/nFU8DmJZ4v6YhnmtN2N3YJllGXY88dCdf
	Qnuf5Xq4nRqTDysYOaD4Xy2meN0pFgwNvFsNy7j0Jk0Qe6yWApgXsev8uYRzXHtUET0KL+bcqkHLr
	6sK7r+v5TRw8opDDjdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTc4I-0046Bp-0v;
	Wed, 09 Aug 2023 05:49:14 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTc4G-0046Aj-07
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 05:49:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-686be3cbea0so406023b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 22:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691560150; x=1692164950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVTaAMwRyC5EbNmGnKMt5GVO62sfdhMkzEYvy7bRsXA=;
        b=pMiFqkbnzjp3jnyPBYTlRVYHWKdOC3du5VSbz4kIkpsKYuFw9hdbPRFTVwZMALrr6e
         SZQa4f+4WZaBbUbb6WuQfpPki/JvBjPp3gjUfPEIXaiLa05X12JMBBOfzjSrRxroNd8E
         U8Edn8SEcynqoXeuGV5OH3SalOEtqtT5FxFqX3SU35gIbEJIMsWiFKFV8NvAmigpo6ZX
         1VFuoHP8/06kb6ySqnq3J06knDAvIozFyfM6zzK+UBFfagPTFrZhAS/6e+TQ40mMrgEV
         TIYNk8nuqoeDiKI9nMVSb8/4cZxnMmXu4gGya+KvDa2cNxeo6xZuYxs2vwpsCYCPIRLF
         DSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691560150; x=1692164950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVTaAMwRyC5EbNmGnKMt5GVO62sfdhMkzEYvy7bRsXA=;
        b=O8yOo+IFV+eItO71OYK3Naa/3iIu+nSPJ8ujzHLNFZS66RAW1I1U2iCzH00//HZgRh
         ulxdqiCwFU7/oV7jOfaCy+VpbtySARfyTvTBhwFmZrJArS1WvWXEB50i2MscUOnsHK/h
         PdHSSI1CN/wshc65Fj3BKel1g3KNLQLlHZ3kb/39XGHX16xWb2uZnC2U/T6MR7HxtFIZ
         52R+z4bkSclwoXma8wBv4H8vqjbAO7fCpoHZktX0F9OJ2toI5G+us/w0SPuDwcilyDjV
         SZ++iDWL6FRymXHjMxULnICzTpkHl7JphRbQ4rrTuxmxfAOWfjG9ZhhsaA6BUjSF5bAo
         Z1gg==
X-Gm-Message-State: AOJu0YzxiYauqO11fj8W0qXCUXW+PdvtbLgtN1lkhjIMXTzrIPU1jhKJ
	mRnd5VMDTv2wKcWSxE6w+HSFkg==
X-Google-Smtp-Source: AGHT+IE7jfHYeQCcbaWLiyPRjvliIUWRMsM3DMDq94jcA4CT6KzEh4TL3KUw8Az8khdjGzhK4KpCbw==
X-Received: by 2002:a05:6a20:9147:b0:141:2cb:2954 with SMTP id x7-20020a056a20914700b0014102cb2954mr2498077pzc.3.1691560149975;
        Tue, 08 Aug 2023 22:49:09 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id z21-20020aa791d5000000b006829969e3b0sm9001358pfa.85.2023.08.08.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 22:49:09 -0700 (PDT)
Date: Wed, 9 Aug 2023 11:19:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Robert Moore <robert.moore@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Subject: Re: [RFC PATCH v1 12/21] irqchip/riscv-intc: Use swnode framework to
 create fwnode
Message-ID: <ZNMozPV2yU1G9+1z@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-13-sunilvl@ventanamicro.com>
 <20230808-chuck-jailhouse-0cb08b55d1bd@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808-chuck-jailhouse-0cb08b55d1bd@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_224912_079183_87ACC9C0 
X-CRM114-Status: GOOD (  27.38  )
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

On Tue, Aug 08, 2023 at 09:31:49AM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Thu, Aug 03, 2023 at 11:29:07PM +0530, Sunil V L wrote:
> > By using swnode framework, all data from ACPI tables can
> > be populated as properties of the swnode. This simplifies
> > the driver code and removes the need for ACPI vs DT checks.
> > Use this framework for RISC-V INTC driver.
> 
> btw, you are permitted to use more than 60 characters in a commit
> message...
> 
Sure.

> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  Documentation/riscv/acpi.rst     | 21 +++++++++++++++
> >  arch/riscv/include/asm/acpi.h    |  1 +
> >  drivers/acpi/riscv/Makefile      |  2 +-
> >  drivers/acpi/riscv/irqchip.c     | 46 ++++++++++++++++++++++++++++++++
> >  drivers/irqchip/irq-riscv-intc.c | 12 ++++-----
> >  5 files changed, 75 insertions(+), 7 deletions(-)
> >  create mode 100644 drivers/acpi/riscv/irqchip.c
> > 
> > diff --git a/Documentation/riscv/acpi.rst b/Documentation/riscv/acpi.rst
> > index 9870a282815b..e2406546bc16 100644
> > --- a/Documentation/riscv/acpi.rst
> > +++ b/Documentation/riscv/acpi.rst
> > @@ -8,3 +8,24 @@ The ISA string parsing rules for ACPI are defined by `Version ASCIIDOC
> >  Conversion, 12/2022 of the RISC-V specifications, as defined by tag
> >  "riscv-isa-release-1239329-2023-05-23" (commit 1239329
> >  ) <https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-1239329-2023-05-23>`_
> > +
> > +Interrupt Controller Drivers
> > +=======
> > +
> > +ACPI drivers for RISC-V interrupt controllers use software node framework to
> > +create the fwnode for the interrupt controllers. Below properties are
> > +additionally required for some firmware nodes apart from the properties
> > +defined by the device tree bindings for these interrupt controllers. The
> > +properties are created using the data in MADT table.
> 
> I don't really understand this text, specifically what you are getting
> at w/ the dependency on devicetree properties. What exactly does "apart
> from the properties defined by the devicetree bindings" mean?
> 
> Is there prior art for this kind of "ACPI needs swnodes that look
> vaguely similar to devicetree" for other interrupt controllers?
>
Never mind. This will not be required with Marc's feedback.

Thanks,
Sunil 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
