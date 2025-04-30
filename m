Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44C2C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 22:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSa6V+6cORmFRw4eU8oBU7ovSEkVm/OVIf87zMQKe/o=; b=b51HFdaNOoOQqi
	qJ86ezjqczQKIJidfV739kfATAzaYUM60YboeW6R7+6jKKmzoHiLS8qb3tGb4S7jv2yaY3nlI+vGO
	ccsn75ZkuqkNL0ZmUYwGLkj1qNLwhFjY/hOAYatWmtsDS5AtH+QyygaTIYVtw1zSwOGfqYhRMDmdw
	R5486XZaCNlOeMMTEoUbdWhA9TeMnjjGx7jprFvBuo5749zO7cnSYS6C9QnA/UILSEonN6CxZo4av
	4/zyQd/Fzi4q7YuomdPx3iVzrKrS6gKmz/KGutDaywJxN9xpYxrOgCi1sk0xfhi4plTmZ9QHwQt2R
	Sw7KN8+sIPRVQK1A3teA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAG8i-0000000EB2A-3V8d;
	Wed, 30 Apr 2025 22:42:52 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAG8f-0000000EB1Q-3iIJ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 22:42:51 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c96759d9dfso53379785a.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746052968; x=1746657768; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48S3dXdKaci0sGPUxZJCzgj5cjkP8nksM+/jgY0gGYk=;
        b=Z9PHktdiodg948/5dPmD0PXxO/4gg8AJjAc4fPUFfLBBbOCUjZIT3oXNnIgalM2cKR
         DIlzTUjqwH7wwBpKzQ+cvYHCo/RU0nO8n4A6TWzbxZ3RJIlulWfuR4dZ1JFttJBqMuj4
         dMy11LToFEyd5rcC0288CuY/M+6ui5UbDMh3FuwQPSCtWWeRDdlvPK8QNhP46ZchE1lW
         Iialz0RiCF1Wl9guXgyvx7YSqRjWFJFc2gbPb/7/j7KUS1rV0MnIwJuzytK6Ainl0+NP
         n/QthjVEkMnwX91vJCc1PkwDl5f5d7ecBcapB8p/HqMT+OIyNhrxyExWy1YMQeij7+2j
         ohjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746052968; x=1746657768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48S3dXdKaci0sGPUxZJCzgj5cjkP8nksM+/jgY0gGYk=;
        b=T4ku1iB+hCfFlqa4uE07YcpFJphbNiUkRNVkluLnl1CwVhjUU9/EknB7XhoQ0AE7DA
         ppiOlPMCNvAO4gYe99olQYR5wp9IHRV8GY3W1SdiLAkiZfTZG06bn1P5xDuq/UT7a+Fi
         oT/wrnAJH3YP39/mY6YSMcnPcB3reLnRwSMNuy//stSykd33cv6Ao1fBHwQcN1Beqy8W
         cJ701hDCm/zG+OUVbD4W8nXDUri96V5U9RDiO2QN2nxepQdEy4jzw6nM1ZT+OTMY/EOq
         VWJy1D5niifNBL1jiH3OVZ60q1Ot4ObWB1K0EZEqk8Ri0VDaOOH77JJKVVxl4BnUJM5j
         jTOg==
X-Forwarded-Encrypted: i=1; AJvYcCVeLJHyysJe78jQ0anJzoyugE22DZO9Uveq8E3+5iUbSwx2OkXgwAEYK+fpFoTQpWYjtANQ/Gpuemgq+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKq8DKC1dRlN0ysRU+50eLj0/bylCdXzBMwJsUEhenIuP0SNX
	apjC2QhbmNbRODPYjRzqN0tM4jnxA4Ytco7ku+9iNBucudoUCaP9
X-Gm-Gg: ASbGncumOfEtlPOVfs4XFMCn/lOembwPGy5VOlCAf0JYWHsraA8E+7NVrjnCVP5+VL/
	8f/Bz7/hqY09n8rL+qHV1+Q9k3GEXaOQ1t/TEmB32+oJF3ApA3PKi1+tuyKcqG1NmcaKEPosLIL
	t/8kGDK0gSzjeIntYx4jF3TjUSyF0Pu5vbbh6hxZyJ3bcVJUhtzBNQYXBm1FPRepBSa6sesMoCL
	onIbIYaxYv+SYbG63mLRuGHOfV8RduM+RNqFC/Ov8zOd8OjhgJw2VceIoFhrUpP0I7Pr9Osgllz
	CPMmyz0jvNkNgamf
X-Google-Smtp-Source: AGHT+IGMVPqZmzGaSrVitA4ALOh6ohgVuCqPO0wiuXVjKCvGxXKUvoU7kotjtbcu86RB8d1T+y/K2A==
X-Received: by 2002:a05:620a:2493:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7cacd79b179mr118413885a.51.1746052968633;
        Wed, 30 Apr 2025 15:42:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cacdef210dsm15380785a.102.2025.04.30.15.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:42:48 -0700 (PDT)
Date: Thu, 1 May 2025 06:42:31 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <oe26ciwvazn3klvmmw6iyk7yypzrtjzdwui7dw2sf7wslz4wco@kq3hi3ynesfl>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250430-radiance-rebuilt-2caa906d5e6f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_154249_931215_95EE3578 
X-CRM114-Status: GOOD (  21.57  )
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

On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id cv1800_clk_ids[] = {
> >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> 
> Given the same data is used here, should there not be fallbacks in the
> dt for some of these? For example, 1812 to 1800? 

In default, there maybe not fallback for the whole series, I think.
But it is possible to use cv1800b as 

> Or is that not okay, because 1800 is not a real device id?

Yes, cv1800-clk and cv1810-clk is a old wildcard compatible, not a
real one. As this is not prefered, I want to fix this to have a
meaningful compatible.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
