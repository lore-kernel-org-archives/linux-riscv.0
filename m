Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B048C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xz/UrsqqzDFHXWmJTzZBqIMqEM4d+hjndiqtFSHXSU=; b=0fYl4oCNWKuVv6
	W2XRKh3lo4GLf7TzgX1mXosn0o9aCQPfswtddyM8j+JooFFylJL/lpr1BlprgoUAzaAuZGfkxEuWT
	kAYc1DVSrMlKnh2UtxSnvBbWRmZeSyFWOCMQMgZ97pjgry24yiyq0AjcIHG7fTVMvqeEVBOy88IHB
	KAoz8d9kXv6C/x2AyN7ExFmKWJOrqY/rCEoRc+lqhoFrNS3eenARo4ZFjzK7EtxeOvcVQ+QoHej4e
	6IOIS2MEcuviCpLYDU28qwd/9oLFErbM5SicGENukJwe0kgYCpfRp8HQ2ld49kHoYZdcmHc8/b4hJ
	02NfiN2IflLNS5tGZYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAsm-0000000F3sb-0EC8;
	Fri, 27 Jun 2025 15:20:52 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAfg-0000000F0cR-2Rag
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 15:07:21 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1749713a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751036839; x=1751641639; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kTVCLY7nH8LB+Zm3xLfrn9nxZr6jXIw9YXpYJef7Kgs=;
        b=L0K+/G28s62VLJkMhWbljokhApgNiK3HtEjm3Qy1nc3hnEY018/Sumae9VEBO/xkQR
         wZ96ssmbWPpquXFhYhwRP61HA88vgeGQ/NK/raQmSOU8tajz203fZQrHbmcp8acXF2Xw
         muocPRT7BcC0XWQASj2rHna/QMweXbpGtuQV/vtdlDpkOAQ0mPa8I2Rt2MdRcyZvDgKs
         CJvPSABltOUHOTbFX5pq9qjJwXtHKwan6I8xl/1KiOx+WExyy9A0gVM49I3XbQsgOpfj
         NHY1NAiRDjusu7C0tKdarrJZYBdxHTDORr0HIwBoOKqY7rOHal7pnT1WjpT23Mt0Qb3x
         xouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036839; x=1751641639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTVCLY7nH8LB+Zm3xLfrn9nxZr6jXIw9YXpYJef7Kgs=;
        b=UgIblB/+ocMYr0NwDxr/GzA0mXg1sQU0AyAOx2VNFBHJhPihhK4JZugkoGwz0bLhbL
         yHypFHd5QUb7XzDeecxltts8pt3LcwEKCFpMGmKV+nBSmnA/XR76bhJ4YnTwBU521/9S
         lbXnjkwBlBSTYf73+NYfpTu1pSoiZR5DBmyWdUPRBIWPB85su2CU9gLvhhnZ0Hj27e+N
         jPRUKJxeA28bRk+1k81lHv0evDxJgeo00dVJvi9aYMY6Q3/216rT0O7rwZitp8it4qbS
         YMebBa5Zl3eLCvqbQV17JettacQRWs+0kSADnwAziCY/m8hHWouqFcUy22T5QqDrBhJR
         f45w==
X-Forwarded-Encrypted: i=1; AJvYcCWQQiT7ZpXQdwNT6HHn29QPkTxWZc0M7ViR+veOQymZLX+jRvr0g0yAHAvQDFK0/tdpg5o93hFeRsyMNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDwynwJFK6g8XsXZLxXq4Srw5O9omXJR/T5edx/yB0F+gxSpi2
	PzvsrCDvK9D5vlI6yiugMiG3IFuPfiVLuJUBrWQBx4w3aOKo1XTmdGixFro+FdbPNdQqpanBRYa
	MNsqHeAMui1MDHG7jSh6oX9lzKhRNpD0tpEYPUo9CQA==
X-Gm-Gg: ASbGncvWs+vLfQEp15Lfy381jcwbnFzlg9Aoge+Z73PQdYQjloEO1It9tH9pVC+dNzu
	7vq3VTQIpYZT9ixZGMVEeuETGW7I9K+qzOhO9NX1Qpokjf/ZrrLLXko0WRNUQHZ+yghPg0GSMFg
	VPKXOvLymXsgqouTYL+OlnA1mrWmaKcfW7bj/yWA9Ge3FySxizl67SDyF2h6z9KpL2xp4ZmbA9W
	/yU
X-Google-Smtp-Source: AGHT+IF4AdiLDVJzWcIgdL/8Bs2UVOqvh/d51X69lsgIeuxgoVvKvtiPfY/zv1dvVDdkVgnc/ZS5VJNJlB5QgtEcAew=
X-Received: by 2002:a17:90b:528a:b0:311:d3a5:572a with SMTP id
 98e67ed59e1d1-318c9225e52mr5337592a91.8.1751036839222; Fri, 27 Jun 2025
 08:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com> <aFkZJKnweqBi64b8@smile.fi.intel.com>
 <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com> <aF1UWNzWhheLNTky@smile.fi.intel.com>
In-Reply-To: <aF1UWNzWhheLNTky@smile.fi.intel.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 27 Jun 2025 20:36:41 +0530
X-Gm-Features: Ac12FXyg_1voP3_rSKmrZJ_A-E3gflVigZ0fA-ce5u-xgIj9wegRrIsa-1iLCcE
Message-ID: <CA+Oz1=bAsykB=qAk3r8FV8K8cnPEVT4Ow7L4SWBvrc_3DsyaWw@mail.gmail.com>
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_080720_629802_955BE97B 
X-CRM114-Status: GOOD (  35.79  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> > > > +union rpmi_clk_rates {
> > > > +     u64 discrete[RPMI_CLK_DISCRETE_MAX_NUM_RATES];
> > > > +     struct {
> > > > +             u64 min;
> > > > +             u64 max;
> > > > +             u64 step;
> > > > +     } linear;
> > >
> > > Have you looked at the linear_range.h? Why can it not be (re-)used here?
> >
> > I did the first time only when you commented. And i dont see any
> > benefit in that.
> > linear_range has slightly different way to access any value using `sel`.
> > Here this union represents how RPMI protocol represents the rates and
> > reusing linear_range will only introduce conversion to and fro.
>
> Summarize this in the comment on top of the struct definition so one will not
> attempt to convert the driver in the future.
>

Sure, I will update.

> >
> > >
> > > > +     if (ret || rx.status)
> > > > +             return 0;
> > >
> > > Why rx.status can't be checked before calling to a sending message?
> > > Sounds like the rpmi_mbox_init_send_with_response() links rx to msg somehow.
> > > If this is the case, use msg here, otherwise move the check to be in the
> > > correct place.
> >
> > Yes, the rpmi_mbox_init_send_with_response is a helper function which links
> > the rx to msg. It's a very simple function which only performs assignments.
> >
> > Using msg instead of rx directly will require additional typecasting
> > which will only clutter
> > I can add a comment if that helps wherever the rpmi_mbox_init_send_with_response
> > is used.
>
> This is besides harder-to-read code is kinda of layering violation.
> If you afraid of a casting, add a helper to check for the status error.
> Comment won't help much as making code better to begin with.

Why using rx is the issue in the first place when it's the same layer
which links the rx with msg using the helper function and then
uses it directly?  Infact using rx directly avoids unnecessary code
which is only increasing redundant code which ultimately results in
same thing. Even if I add a helper function that will require additional
pointer passing with NULL checking which all is currently avoided.
And, we are not just talking about rx.status but a lot of other fields.

>
> > > > +     struct rpmi_clk_context *context = rpmi_clk->context;
> > > > +     struct rpmi_clk_rate_discrete *rate_discrete;
> > > > +     struct rpmi_clk_rate_linear *rate_linear;
>
> > > > +     struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;
>
> This should be assigned where it's used. NULL assignment is not encouraged.

Sure, I will update.

>
> > > > +     struct rpmi_get_supp_rates_tx tx;
> > > > +     struct rpmi_mbox_message msg;
> > >
> > > > +     size_t clk_rate_idx = 0;
> > >
> > > This kind of assignments is hard to maintain and it's mistake prone in case
> > > some additional code is injected in the future that might reuse it.
> > >
> > I dont understand what is the problem with this assignment. If any
> > code added in the future reuse it then it has to make sure that
> > clk_rate_idx has the correct initial value before any further references.
>
> Yes, it will add an additional churn and require more brain activity to
> maintain such a code. It's a general recommendation to assign when it's
> actually needed (there are, of course, exceptions for some small functions,
> but this one is not).

Sure, I will update.



-- 

Thanks
Rahul Pathak

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
