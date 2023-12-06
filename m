Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BBDC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsUKlcVqeQPdwrCOPPA5qdHGFLWuTmNKibG82tgvtVo=; b=rL2Wo9IP8nHxjS
	lbwnh3hXOUHfdV13ElxtEKGIIpc2vfDvohvfvGomxJjPjpmiAnJS9Drl2nd71k7MKu49uYe3xkiQQ
	ff0H60Uw6u8qobmC9IbDteRsETsE5W4LD8e3ihCmBwpg2+zg/DZpeDwzLH1B9H3evwC+Z+5YST1ma
	JrZt6x2MG6rFd3VhOOPAEbl63gIZYO1MPi85UYdaQ3YlLr1eJpSxDwxmD4xCa1S45sZHAOLA19xK1
	wVsP0YcX54es9h1uw5h+9CO4Lo0T2JW0i9nngNt09gMjVQrn9Jg4grtreUWUpDAh/bbwIcFy4q2jA
	7lyXpJosYHYk/FpDfLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnDQ-009Q7l-1v;
	Wed, 06 Dec 2023 08:25:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnDN-009Q6j-1I
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 08:25:06 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00f67f120aso60993266b.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 00:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701851101; x=1702455901; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hp7zqb1/kBVX+9DznvQDVwzKBngHmOF9Sss/53bRtvo=;
        b=Ezi/TKBNzs+Cpyl1tv4yMz63Ka4W7x26mGcInjUM2Q0ozEB0yyEDCmYqQ+URNmiDdF
         fUUwZMP2rTYbqnoHmz8dWXwGXm9ThEstP9B8CWf5uFWR4G4NxyhPwF4fcV3WB3izMZF+
         TWryMYjErKtWIYKT4/htJz7n9VBOPf8ala2Z82TYCnHeMtYSEQDaRPHAqpQweiC1SRhD
         g78QzGew9YB9vLcuY1GcGPxMvE97FK0v9KPKVVtWk1VTI8PrRh5GhH9lVfHSfiVZ8alo
         JfheENCfVtRtHGT8W0n1p3wjdUYMz5ajppy2EwRSY7ElMRQiuJAwCggtkGkfysT94vKJ
         gImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701851101; x=1702455901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp7zqb1/kBVX+9DznvQDVwzKBngHmOF9Sss/53bRtvo=;
        b=ExScEI5J92QAceA7mnXlfVMndwKDc9rVdeuVDJKULCV+kGlRoRSFCBfF9g9A4BViJg
         iPgl89hcxLGKAXuB9GjW07D/hcx7rYTLvJHlQk4TE2s0cXtUp65wD6tMidwxLT+FNlo6
         m5SrLbkaba2eHuv82TLVM7DVYV7jVQZIKR1gU7tFw8iydML9yLybXy9n3Z16YzFpUN3n
         y8iqro8KHVtfW09cC9MTkbq53jn+G0v/oOELQKXLzJGZJi1AZ7QwGZVfsdnmAa1vPzgT
         XrOxMQi0B2NFoPrCAMlZEojYFsi14FlIFqKkRPINseTgZtSyvOZVoMurvC2L/Ok7Fadt
         5Aiw==
X-Gm-Message-State: AOJu0YyW/TlhbQmPnKr/rBNcLMBFGEsB+xcGtJLGOd+kQ5xP1NV60l7e
	OjpNnHKLIn2Q651iheu09PsYOw==
X-Google-Smtp-Source: AGHT+IGvlcrdcPJHmRBlnrn2mdhOuhilAG4zCEk0GnM4UHpJjxK0Y9SxbVERPgrq5icIz6pMNtaseA==
X-Received: by 2002:a17:906:3387:b0:a19:a19b:55cf with SMTP id v7-20020a170906338700b00a19a19b55cfmr319114eja.95.1701851100490;
        Wed, 06 Dec 2023 00:25:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z25-20020a170906241900b00a14311b5c5dsm7875010eja.185.2023.12.06.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 00:24:59 -0800 (PST)
Date: Wed, 6 Dec 2023 09:24:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	jeeheng.sia@starfivetech.com, conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v2 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231206-b3eb3df001a234172b05d160@orel>
References: <20231129113414.41661-3-ajones@ventanamicro.com>
 <20231129113414.41661-4-ajones@ventanamicro.com>
 <88905b42-206b-4888-aece-6664cee70e68@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88905b42-206b-4888-aece-6664cee70e68@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_002505_463567_C9E6326F 
X-CRM114-Status: GOOD (  19.44  )
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

On Tue, Dec 05, 2023 at 12:23:07PM -0600, Samuel Holland wrote:
> Hi Andrew,
> 
> On 2023-11-29 5:34 AM, Andrew Jones wrote:
> > When the SUSP SBI extension is present it implies that the standard
> > "suspend to RAM" type is available. Wire it up to the generic
> > platform suspend support, also applying the already present support
> > for non-retentive CPU suspend. When the kernel is built with
> > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > Resumption will occur when a platform-specific wake-up event arrives.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Tested-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> >  arch/riscv/Kconfig           |  6 ++++-
> >  arch/riscv/include/asm/sbi.h |  9 ++++++++
> >  arch/riscv/kernel/suspend.c  | 44 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 58 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 95a2a06acc6a..385fcad45c47 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -65,7 +65,7 @@ config RISCV
> >  	select CLINT_TIMER if !MMU
> >  	select CLONE_BACKWARDS
> >  	select COMMON_CLK
> > -	select CPU_PM if CPU_IDLE || HIBERNATION
> > +	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
> >  	select EDAC_SUPPORT
> >  	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
> >  	select GENERIC_ARCH_TOPOLOGY
> > @@ -918,9 +918,13 @@ config PORTABLE
> >  	select MMU
> >  	select OF
> >  
> > +
> >  config ARCH_PROC_KCORE_TEXT
> >  	def_bool y
> >  
> > +config ARCH_SUSPEND_POSSIBLE
> > +	def_bool RISCV_SBI
> > +
> 
> This option was already added by commit c1f048a6bd7d ("riscv: Enable
> ARCH_SUSPEND_POSSIBLE for s2idle"), so this hunk is a duplicate.

Thanks, Samuel. I'll send a v3.

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
