Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C31C388F9
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 22:06:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F48B223BF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 22:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AXuyAsR1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzbvq7je"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F48B223BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LTKvGywGCUveLN94ndVGOTL0lqYSCf6klGyGsnwNknI=; b=AXuyAsR16Y5bsG8iVCTcIML47
	IZ5KwGD6V2t/tt1VJyP+UpUkfXaRDm8X+aD6pdrzJtEbTcerMEBQNC+8EMfQASdRAArkVbXQeOdPK
	uym/AelQGYGGbpWdPC9H38tr6PbuB6c9QNnrSuD+6pWa9kbk6u6M+ARsRA56R+kFHnT+ugbwShHHK
	2UoGppob3uYUa7Ae/TkYhix0Z6I9Ks8TWT/Shzqz/f7pNk8i6pBuXN7F7wNsHKH8YqRTD9eAECHz7
	qhxjuTSgb1hHwcSNOI5iUMmKjROSzX5KRtgBuEVFoHYX7CHT5iE9qWzqhC3etueN/uybQUzraf8K/
	YsY76GRTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keme5-0006Tk-C3; Mon, 16 Nov 2020 22:06:45 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keme2-0006TL-Cc
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 22:06:43 +0000
Received: by mail-lj1-x243.google.com with SMTP id o24so21894899ljj.6
 for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2020 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BJxsU8gN59tvuGgU7PNdMo5fT7THwls7sknlrTbR/LI=;
 b=Dzbvq7jedO3PcJom1SrUcQvsxJ8jFOdFumGcK2rmcwJwZGsmVTyjrYF/OMRmTFJub9
 tVspSg+BzS5AvYB2h4VhuaIDU9XJc9IrheSXoEBnY2LNc6qODA7O7CkwpNS1iAwbjnHw
 oiVvCY3oynumTov2j3ns3vDvoCX2nMB8KElSOu/TiY5VVAxnmK6zhPtxK9+H+QDAp60w
 2Wrd/QzGEU+eLLmGTx4aXT7Lj52dv2gSYX59IntvyTZDa2dYIkoaieufTHpjTNon4ix4
 pifwxW/tMNxIqIbNkp1X3OxDtH0r0FrNaAayMAck1wFjMMe7GPVof9aMYcrnT51TfTIp
 jIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BJxsU8gN59tvuGgU7PNdMo5fT7THwls7sknlrTbR/LI=;
 b=WkwmgzSd+Wf0UJ8JXYZnLsJfNHlcQC25BLTJXyNNpFU+L9SzXiav0esntUT+FcZTVJ
 2+gPmC3TZvj3t3ow5SQYNtMeKCQ3SSCqeFJ+6cYFTmRnX+Cr3sqaJDF0ZURjEPtQbEMI
 Xqy2o/X3SzbZVPbFHM1oOwHxVIZb015lg5VPCEA0QAl5twXV6oOmr4iCqFLbui0maIRO
 eNq5uPAYMBzhdjmz2XHNwfDSdSvWSUZSZV7jY5N4wEzGxSlUxQ9ZZdN5scURx3Vtz9qR
 ExtxYrKhcS1BG4R6A6JwWjPNmz76d6cmnRQGiLW2r/i5n+1Ssjy2iWHbjWrbrM8lXDwS
 UoNg==
X-Gm-Message-State: AOAM531zMDlYpyEq1lG3k4y4FQSkZaQP75wheN40ONN/h+/CE+2B0AAP
 GK9+o4Zyms1yrsX960hhGGk=
X-Google-Smtp-Source: ABdhPJyf4bQRr3U3N2oJ43oLqlb4UWVX9zldVIP1uKyiEN1cpLv1Kt1MOolmlKctMFvj+U1UU5b7xg==
X-Received: by 2002:a05:651c:207:: with SMTP id
 y7mr600414ljn.428.1605564400898; 
 Mon, 16 Nov 2020 14:06:40 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id i7sm2756834lfi.269.2020.11.16.14.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 14:06:40 -0800 (PST)
Date: Tue, 17 Nov 2020 01:06:38 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
Message-ID: <20201116220638.ljrj6zgvgmvyib3k@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
 <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
 <20201109174450.myombn5skpj5wcxh@mobilestation>
 <BL0PR04MB6514880A6977E605D38D68BEE7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL0PR04MB6514880A6977E605D38D68BEE7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_170642_468216_35F7E622 
X-CRM114-Status: GOOD (  32.59  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 07:30:15AM +0000, Damien Le Moal wrote:
> On 2020/11/10 2:45, Serge Semin wrote:
> > Hello Andy,
> > 
> > On Mon, Nov 09, 2020 at 05:14:21PM +0200, Andy Shevchenko wrote:
> >> On Sat, Nov 7, 2020 at 10:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >>
> >>> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
> >>>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
> >>>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >>>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> >>> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
> >>
> >> Sorry, but the above doesn't sound right to me.
> >> It's a generic code and you may imagine how many systems you broke by
> >> this change.
> > 
> > Damien replaced the macro above with the code below (your removed it from your
> > message):
> > 
> > +static struct device_node *parse_gpios(struct device_node *np,
> > +                                      const char *prop_name, int index)
> > +{
> > +       /*
> > +        * Quirck for the DesignWare gpio-dwapb GPIO driver which defines
> > +        * the "snps,nr-gpios" property to indicate the total number of GPIOs
> > +        * available. As this conflict with "xx-gpios" reference properties,
> > +        * ignore it.
> > +        */
> > +       if (strcmp(prop_name, "snps,nr-gpios") == 0)
> > +               return NULL;
> > +
> > +       return parse_suffix_prop_cells(np, prop_name, index,
> > +                                      "-gpios", "#gpio-cells");
> > +}
> > 
> > So AFAICS removing the macro shouldn't cause any problem.
> > 
> > My concern was whether the quirk has been really needed. As I said the
> > "snps,nr-gpios" property has been marked as deprecated in favor of the standard
> > "ngpios" one. Due to the problem noted by Damien any deprecated property
> > utilization will cause the DW APB SSI DT-nodes probe malfunction. That
> > though implicitly but is supposed to encourage people to provide fixes for
> > the dts-files with the deprecated property replaced with "ngpios".
> > 
> > On the other hand an encouragement based on breaking the kernel doesn't seem a
> > good solution. So as I see it either we should accept the solution provided by
> > Damien, or replace it with a series of fixes for all dts-es with DW APB SSI
> > DT-node defined. I suggest to hear the OF-subsystem maintainers out what
> > solution would they prefer.
> 

> As Rob mentioned, there are still a lot of DTS out there using "snps,nr-gpios",
> so I think the fix is needed,

Yes.

> albeit with an added warning as Rob suggested so
> that board maintainers can notice and update their DT.

Yes.

> And I can send a patch
> for the DW gpio apb driver to first try the default "ngpios" property, and if it
> is not defined, fallback to the legacy "snps,nr-gpios". With that, these new
> RISC-V boards will not add another use case of the deprecated "snsps,nr-gpios".
> Does that sound like a good plan ?

It has already been added in 5.10:
https://elixir.bootlin.com/linux/v5.10-rc4/source/drivers/gpio/gpio-dwapb.c#L585
so there is no need in sending a patch for the gpio-dwapb.c driver.

-Sergey

> 
> 
> > 
> > -Sergey
> > 
> >>
> >> -- 
> >> With Best Regards,
> >> Andy Shevchenko
> > 
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
