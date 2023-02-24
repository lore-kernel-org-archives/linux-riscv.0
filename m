Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1943CC677F1
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmOGcslzJnck1CO5gZivsM5sS1DIm5fzO7l5I3uLvTU=; b=ASXYaWPNWtq6Af
	HfpeJyZwWIuc5zebkhjx3Ct0p0Fo53Loud8LtuLfKtaigj9ShRrIy7ZfKBA310FqfwmBoqw5DdvN6
	a+1yfAFoBr/N/FUVk+HTefnUwUNq6hO0sk46qTWk8z4Fun04BBR0phkYA4FlDCupDAsegEclFnQkk
	TWoPWbMc9Jh8n3M+CixICx2Vyq+hYgjVQTini6cTaQnSteiA42/XKeLexVKb1pqP9O9vo4LYC95Wz
	qwwcfF/aapgNnfY5NFckXO5jLsT5su0YFvVZzd+89sO5o6gGEadr8acvp/ndQkuzpi4odlZ+UHI24
	zSXAkFl0uRqeY5iR3NPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTjL-001ZqW-SI; Fri, 24 Feb 2023 08:47:03 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTjJ-001Zob-5l
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 08:47:02 +0000
Received: by mail-pg1-x52f.google.com with SMTP id z10so7038822pgr.8
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 00:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMm4tTnCBx/UWlRMFi35xdsLvkcX8RtXFHwDjnM/k8g=;
        b=R7WanfuN4UrhQd8BNoxEa9os2dRd/evoOBxPjVlUaje5t2eNCIqE9nwXs+ujFcBbxH
         uC9Ppmp0NfNCCWnqND/LaF7KEEXc+6dV7aFZmADi8tGi/BCrc4MvnFxB7AbxGaHb0zPs
         kuj5udBV2ymPfzH4kosWoqwAo972VHDL6bqv+JKeY2cYOSQb0PBpLoEfw+NseDtccsWh
         wwPgNxRzCvcHibW67bPDVX2Vhr+raVNK/XfC7pfcmicZSI0XddoajlozT946Kb3tTSHr
         yZOg4aDSQftzxDd/e4u2Fk+8QCxJULu3hr6xkcWj5w+ym5wCagTNm2Ju6P64ko+UY6/F
         ARJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMm4tTnCBx/UWlRMFi35xdsLvkcX8RtXFHwDjnM/k8g=;
        b=w4IqTnv5cOFhKsgZqxS23w0YiZ39Ipb0oc1U33H4qJ3sLf9ectXhsC5Ij6SZ8yozYQ
         9v1JTmcdTdXpAIhmktg51MzXosyfBtgUg51AkO05OewGuCWJ4D7k9X5SyoOB9UsP0SGR
         SK51e9etAsH5H8FfMX92TyjGRrGIhi9b0iFMnj3tA5Xt1V6+C3YUIhZoRd1i+8yDZySe
         TtJIGemIOr5iVlPDFx1xPijfkX3ucR1SzFcSEKmt3MpoABWiM+Lt93T5J4RNU8aXoBPo
         rQxcN7iwgOxjUZju9lDt+SFuAvG+yOTyX3fEZi3JW8MFgm1opd7rbXLrj1IstZev89PF
         Dcaw==
X-Gm-Message-State: AO0yUKWk3HcN7B94Yey29WVEor/TJouqm+lQPpWG/KGkS0UQIIroNEDg
	vXxrVzgJ0Sn6W3+2BW7XE9y4aA==
X-Google-Smtp-Source: AK7set8FrW7c54xe2wApbvz8+IVHsJOwdjux1tqWoB5KJLo1CTFzoYM8ZtgqRDfWykSZaFnESf3lkQ==
X-Received: by 2002:a62:1545:0:b0:5a9:d676:ae58 with SMTP id 66-20020a621545000000b005a9d676ae58mr13650050pfv.13.1677228419747;
        Fri, 24 Feb 2023 00:46:59 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id q22-20020a62ae16000000b005d6fcd8f9desm4483802pff.94.2023.02.24.00.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:46:59 -0800 (PST)
Date: Fri, 24 Feb 2023 14:16:50 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 19/21] RISC-V: Enable ACPI in defconfig
Message-ID: <Y/h5eoPyZeEpUSL8@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-20-sunilvl@ventanamicro.com>
 <20230220200909.gkwmpklocw36632w@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220200909.gkwmpklocw36632w@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_004701_242477_93A083BC 
X-CRM114-Status: GOOD (  16.24  )
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

On Mon, Feb 20, 2023 at 09:09:09PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:41PM +0530, Sunil V L wrote:
> > Add support to build ACPI subsystem in defconfig.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 128dcf4c0814..f89f79294b34 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -218,3 +218,5 @@ CONFIG_RCU_EQS_DEBUG=y
> >  # CONFIG_FTRACE is not set
> >  # CONFIG_RUNTIME_TESTING_MENU is not set
> >  CONFIG_MEMTEST=y
> > +CONFIG_ACPI=y
> > +# CONFIG_PCI_QUIRKS is not set
> 
> I'm guessing the addition of the CONFIG_PCI_QUIRKS line wasn't
> intentional?
> 
Yes, I realized after sending the series. Will remove it in next
revision.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
