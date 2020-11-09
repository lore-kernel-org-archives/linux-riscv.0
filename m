Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3432C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 17:45:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA9520639
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 17:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7GRTM+N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no+40PM5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FA9520639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=25YzUy7y1uVmb9QfEKddXBS2FgNp+qB9O6nuYmsgbLI=; b=z7GRTM+NkbN+9biHkdLVR4jbM
	Qx119JKpwpmY1i6HfZegBXIfBGSd1Gyr5/3P+YBXhasE2qSDVexZBDqJ51l2j6G+NSSE19wU61rjt
	RYacRx8m5uAVef3w5WVYyBDhzcBAF+Nho7NlXrW1Mgiyp+pPX1TreupU6T1P4Gx2JEsNSFKuudlKO
	nH5ZrRFrRJHtYPDwa/UuldmhYufj8w+IdiheKo2IrmIAcWKQlZAL0zAvDjrFW1gE8SXGHyNfn2HRR
	xb4fDplRrqczt533IcJj4fCCD0ZbmCrxhTPTZWvYXRfE/bkdq3fQPursG189gEuEZVovy+v7l/DI/
	pNbEHNnmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBE1-0000v3-FK; Mon, 09 Nov 2020 17:45:05 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBDw-0000sc-Q7
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 17:45:02 +0000
Received: by mail-lf1-x143.google.com with SMTP id j205so6264539lfj.6
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 09:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6PkEwJhx8FCOKavtGOYhsFS5NvjQTTcf+upK9UsKwU0=;
 b=no+40PM5oXP5Stgl4mdsYfwCePictQCO/lAgDeyposk3c+C+nCnea1+PzSglmLWlXi
 O26lupimdFAfRyt36m/nOA5IKZeiUSfQG/orEJLcBTkUsu53BEhRb70NYAJAHRYHisn0
 hCj+ciFfuTxvljzBPnfqAp31IKxiM8rOUNwtTk1s0d2i1Unsusw6EplsLHHDSAe1cgdA
 XTKLEUcBk3CVHY+m+9wvoxPXiuRzkWAzYYiHdxJRxsYsnUOR2gcaUs/SvanLnoPnTQ+/
 FdNMTF5oC+sWTkiI2QYkN9V83gTDi3QdmTANTgNSlI2/oBWSxkX7sYeTKSIGXkk/NiEx
 bd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6PkEwJhx8FCOKavtGOYhsFS5NvjQTTcf+upK9UsKwU0=;
 b=Lok3vjjt7Sodw7MjFQ5sTecAEJw16Nn06QdIGoy3U5zujkG3zK7fKZGdvLWX2cxNwl
 1Hy3OGxwUFtighpjDrTOkdvGju9OiEsq12A1pXfwiE6CW0IcOuqdo9BMZh3UIrqC00hA
 VQegYyiLO0SdlbBAjYb77lU1FVSGKVA46Ja7IA61cXtFdYMvhZDbKXMDPpFqwdBauicE
 rMNzRr6dH2XjNcTiKvP24MwxDJn5IftbdMsMFH7px/zsPxmwdtiKR26AJ97KTcdAyeHm
 kZZxk/WaFWuftYYWDNd4Lthx9npC+tlewUSqKSLt0u7WVVTQLp9lStKTYaLpR37Zk7Wd
 0kOg==
X-Gm-Message-State: AOAM533pM7V8by1fwpbC9cq9UfEoMiKQ7DEPMFUUXNlNzTJaBax67N4D
 pK6iBop21wFjVfSovTd471o=
X-Google-Smtp-Source: ABdhPJx6EGOQqxemXoAVKmGJV6KS3yMfgwlSCFSr9pPjqbI2yQSEryRSzZcOA2ebNDyND+jYcPmf6A==
X-Received: by 2002:a19:408b:: with SMTP id n133mr5672872lfa.564.1604943898030; 
 Mon, 09 Nov 2020 09:44:58 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id z4sm815664lfd.123.2020.11.09.09.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 09:44:57 -0800 (PST)
Date: Mon, 9 Nov 2020 20:44:50 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
Message-ID: <20201109174450.myombn5skpj5wcxh@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
 <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_124500_915155_0F5F3F05 
X-CRM114-Status: GOOD (  18.66  )
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
 Damien Le Moal <damien.lemoal@wdc.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Andy,

On Mon, Nov 09, 2020 at 05:14:21PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 7, 2020 at 10:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
> > @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
> >  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
> 
> Sorry, but the above doesn't sound right to me.
> It's a generic code and you may imagine how many systems you broke by
> this change.

Damien replaced the macro above with the code below (your removed it from your
message):

+static struct device_node *parse_gpios(struct device_node *np,
+                                      const char *prop_name, int index)
+{
+       /*
+        * Quirck for the DesignWare gpio-dwapb GPIO driver which defines
+        * the "snps,nr-gpios" property to indicate the total number of GPIOs
+        * available. As this conflict with "xx-gpios" reference properties,
+        * ignore it.
+        */
+       if (strcmp(prop_name, "snps,nr-gpios") == 0)
+               return NULL;
+
+       return parse_suffix_prop_cells(np, prop_name, index,
+                                      "-gpios", "#gpio-cells");
+}

So AFAICS removing the macro shouldn't cause any problem.

My concern was whether the quirk has been really needed. As I said the
"snps,nr-gpios" property has been marked as deprecated in favor of the standard
"ngpios" one. Due to the problem noted by Damien any deprecated property
utilization will cause the DW APB SSI DT-nodes probe malfunction. That
though implicitly but is supposed to encourage people to provide fixes for
the dts-files with the deprecated property replaced with "ngpios".

On the other hand an encouragement based on breaking the kernel doesn't seem a
good solution. So as I see it either we should accept the solution provided by
Damien, or replace it with a series of fixes for all dts-es with DW APB SSI
DT-node defined. I suggest to hear the OF-subsystem maintainers out what
solution would they prefer.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
