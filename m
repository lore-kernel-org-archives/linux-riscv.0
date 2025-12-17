Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E08AD64060
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 00:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Tfeduvqg3TjcCmIqZPOUlbIoejLW5/WqvSxjDB7M9I=; b=q0LvMcX1cEPmKG
	DxhlVDR6Y30lJwODlIBEOgFuqzWM3N+1E3Q4IYodFI7GexL02WczFsapOW/wJzKLghpv62D9tOLy/
	a0GOst9wW66MpV/5FAg8KAfXQbUSMTs3xGI9guMSysmi1WA/K9AeIOdgYV8qhIip3RjN2XwKyI8e1
	q85c7OytHItjLImb7lINUebFop6BLO5vNGGGG1bkDa3scxLX/TICqB+XrKdbJam8DtVdec/g9GWwb
	S1G1+LrjkLZNsZW2HzaypA03PnhD3XwvmKvH9DlNLuTz54NpolkAzIG8+JUg2nAid9HHRlAQcTr1R
	i9yxHmLlOKK5f+9kjMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfVQ-00000005zlV-2aQg;
	Wed, 17 Dec 2025 00:35:04 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfVO-00000005zl4-0jo6
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 00:35:03 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c03eb31db80so3711365a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 16:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765931701; x=1766536501; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I16GnD6fZp55p7NM5OBmJZlxxa+Of8TIwfznHTqHcjM=;
        b=f3lEr/tHKVnZScl6w7qY51RwlRQfOW1SYM5LQG+c3DxX+Yaf43h+HEiPaaq7A0uM8f
         OOJlFT3TTD1XNPU7VrabgA027cNjEzrN1FVGfcoIuAP9BXYGDTBnbQ4EvITdbOVKIgH6
         5tdTYZFkTpNtAV739urpK2B518BU5OLq1fLdz7ol2CI6ntATpv5K1drcpNbYFhZV0EWK
         SdX91/QUAnFtbuYtOC1CmHrk6T0zb25usAYZfwks2WipFsHgnehk4/9l0ZeaevIuUI+P
         CB8xJVrGk9UROrE9sD8pKtV3KPDaS3FMD1waywjQBEbfuxy24ETi7aYtXWf+FtEbtIDj
         ODhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765931701; x=1766536501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I16GnD6fZp55p7NM5OBmJZlxxa+Of8TIwfznHTqHcjM=;
        b=qcgizeSkrm2LNaeMGOacmFZscfIDIfeBaHHVbesTDzvB2ykX0MH0c4TDQ8PZaNP1oD
         QdGSyjytP9UpRVDVilZFj13zXHfg7YA04G/g3GFW/WjMQK/K8v1ThU4a+1eW2YWemTfm
         JGIQ8t7gLcenaew53fYhlzsNp/Z+WsMF7WPbfm/wRAR5Qjp4Rx4NgUv+o1ChdkSnaE0R
         uG+nDYLBgNkIdGU9HIpVStUpMOzEc1VgyV1s5e1ovyoYYu2HlFTdblio2+0MxRvRzX6r
         0TmApRzvnfLxY+QgLss0y+JfquwpRCoQ5tMrLPjglcXHXPIXCMFZlokex2lpR+wtLvXp
         t+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG7NMDiYn+SmRK+z/iEhBakogaUARREgu//4g+Ox662jdXqeXubRKvgoRTKV6654hfCy9URdMio+emHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrD2jgTHaEPKOHDTAAZkCmsddf579Kmx1gWVyOJOL10MyTbtIA
	ODXM3+CHPHFeNhc2b2c7xFXlrMrvI9XuF1OJZ7ahgZj6529mYXOXnxrP
X-Gm-Gg: AY/fxX5xwrUbYeGtKPQrhYivKesuLlc/lUI3CvU3xZEpdMNPRtbusF8YB/rx4pD0Jd7
	8KUksstrT/LFVl+RX1gotVA8pSJKMwU7mAvigbIHJFkBwKSIGZpoJxZaQ6SqJZzIjTy8wD1Vnta
	9N1RdPWYDAwgVzRGSa+6Si4apuvtpXhxPMCIhKJR31ht/Kv6qo1wRmrDKFcjnF3iyiBIcbNinVf
	tGZS8G+KOlTL/eDbUeZFjAjFPms09kV+VTP6ogyWcQFlj37B/kUoHzmabN4dyC75g5jESkpIyPP
	kmOUxi2tTjZZvU1RsJWa7sm3ioSLm94yhsOUpxKMOBUIFDgsWs6MQ2rPS5Gqaowui6MucU5d1GW
	dFtPqXIxixyMmCTyThNu1m2Pg9cqimX6zX1f9+WPVComeZ2FzTdw9WJjHmxcOTCGBuWz+DwtgTf
	Qiul8Ooa1eag==
X-Google-Smtp-Source: AGHT+IForQc0D2tDs5AEskKGH8DsPL45V5wktJcbV9kRoh1ELjnGuofFRcuE+2hAQcJLnodC7x9ehw==
X-Received: by 2002:a05:7300:cc9a:b0:2a4:3594:72d5 with SMTP id 5a478bee46e88-2ac2f86daabmr10134969eec.4.1765931700780;
        Tue, 16 Dec 2025 16:35:00 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f054619sm1918117eec.20.2025.12.16.16.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 16:35:00 -0800 (PST)
Date: Wed, 17 Dec 2025 08:33:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <aUH46Rqb-bzsqUn_@inochi.infowork>
References: <20251216233514.646263-1-inochiama@gmail.com>
 <20251217001833-GYE1903981@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251217001833-GYE1903981@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_163502_224340_4D95CF35 
X-CRM114-Status: GOOD (  33.13  )
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

On Wed, Dec 17, 2025 at 08:18:33AM +0800, Yixun Lan wrote:
> Hi Inochi, 
> 
> just noticed, you failed to CC to the mailing list
> please increase patch version and send a v3 next time..
> 
> also please see my comments below
> 

Yeah, It is my mistake. I failed to add cc/to with git send-mail.

> On 07:35 Wed 17 Dec     , Inochi Amaoto wrote:
> > For build spacemit common clock driver as a module, the build
> > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > build will fail.
> > 
> > Add these missing hints, so the driver can be built as a module.
> > 
> > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> > Change from v1:
> > 1. Use EXPORT_SYMBOL_NS_GPL to export clock ops
> > ---
> >  drivers/clk/spacemit/ccu-k1.c  | 1 +
> >  drivers/clk/spacemit/ccu_ddn.c | 1 +
> >  drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
> >  drivers/clk/spacemit/ccu_pll.c | 5 +++++
> >  4 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > index 4761bc1e3b6e..1f42b8045bf3 100644
> > --- a/drivers/clk/spacemit/ccu-k1.c
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> > @@ -1204,6 +1204,7 @@ static struct platform_driver k1_ccu_driver = {
> >  };
> >  module_platform_driver(k1_ccu_driver);
> > 
> > +MODULE_IMPORT_NS("SPACEMIT_CCU");
> the name should be ok as long as no collision and unique, but..
> I personally would prefer "CLK_SPACEMIT" which follow "subsytem + vendor"
> 

I disagree with you, after doing a grep, I found it is more common to
use "vendor + xxx" format.

> >  MODULE_DESCRIPTION("SpacemiT K1 CCU driver");
> >  MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> 
> [snip]...
> 
> > index d92f0dae65a4..893af23c6b25 100644
> > --- a/drivers/clk/spacemit/ccu_pll.c
> > +++ b/drivers/clk/spacemit/ccu_pll.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/math.h>
> >  #include <linux/regmap.h>
> > +#include <linux/module.h>
> > 
> >  #include "ccu_common.h"
> >  #include "ccu_pll.h"
> > @@ -157,3 +158,7 @@ const struct clk_ops spacemit_ccu_pll_ops = {
> >  	.determine_rate = ccu_pll_determine_rate,
> >  	.is_enabled	= ccu_pll_is_enabled,
> >  };
> > +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "SPACEMIT_CCU");
> > +
> ..
> > +MODULE_DESCRIPTION("SpacemiT CCU PLL/MIX/DDN common driver");
> how about name it more generic? you don't know whether any other clock type
> will be added in the future, so
>   "SpacemiT CCU common clock driver"
> 

This is fine for me.

> > +MODULE_LICENSE("GPL");
> I've got a comment [1] from Ziyao in the review of K3 clock driver
> that suggest to distill the common probe function, which make sense.
> So, I plan to have separated ccu_common.c file, with this change,
> it would be more proper to put MODULE_DESCRIPTION/MODULE_LICENSE
> into that file
> 
> It might takes some time to get there, as I now got a weird panic/hang
> issue with that change..
> 
> Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> 

I have seen the K3 driver, but I think it is still necessary to add
this line to this file. As this is a fix and it may be ported to the
other version if got merged. So it is better to just add these line
in the  ccu_pll.c and then you can move them in the file you desired.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
