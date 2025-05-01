Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A94C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMd6dHSj2/mpuKorVDQ0f4XR6661LVa4q6DLIuHlXWA=; b=JWrQLZkViMbw2s
	2egrQhhTvBnujHiwzH4VG3GV3VmnpRki2kol8euaqCJv97xH8wTeV9wgxMMdiozv8KZ63qnNBX7WJ
	3WVmgHOFKN8off2sYfb0dfBaHvjZanJLfB4ajYvmu+rfLQ2NcXfPYTpXU4/IjOblgXrRengKoJypL
	iMmCibYjHLCk385pMWTYmTTYUjYzBjd217d5xptvchV5AgMjLbo9h/1t6BzymrxGn6uHB4ya0cM//
	9+qq1dI4IXCvYpMRQKuJq0/JjnStxtdBRWy4uQgdjWAREdc9ycsYv2fHnFJRPZvZtOrSZyBJ+qu68
	wyy/ibdXNHkEMsQkVPew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcJy-0000000HZ24-2bbo;
	Thu, 01 May 2025 22:23:58 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcJv-0000000HYzK-3AOB
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 22:23:56 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c5aecec8f3so249909085a.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 15:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746138234; x=1746743034; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALJpzUTq/FKpZ6ZIbBrWjDg3p3NoIlcuclCH+vNu1Do=;
        b=ej8vB2H5Z8KQJuSj+ohjMFLI2rCb/7eByx4DJGhoMCCK5QP8/EilQA2JvHzIFaYWo9
         O3RNgsbthys+K4QmIc62IiGgMmrZKxgZ5BZS/yFL2hpoSCrJj1Bjpbi7FCJCxXhtFh45
         Vul/geX298BP3MzmEyA3zrbLcAPg70FpgomwGovMrYJFhVQieab+R/Okb5UjFIV6F6c0
         wAJyiK3xQfyTbx7GoUa0hf0WKJjbHgqgAIoSgPi3FllWA8ayApPfW8eOxAs8SRG7yZSX
         UuBChUYEJsUpQP938W1+Qawk/8iqnFd1x41NW9w7FAv0qPsUSzvmVA4M2uA0aeQEW5IJ
         DMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746138234; x=1746743034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALJpzUTq/FKpZ6ZIbBrWjDg3p3NoIlcuclCH+vNu1Do=;
        b=mrAabBuQBv3uO6HJly90Kfh/6CGEIZTsAFZcA/FNHl/G+FTSOB1XCeDpqrPwMdGOgz
         2BMzrda3GZqDvIb9j5u1AkuA1Ncn7bRahEAgbKtdaoex7H7+RX80qBinaPs7aeiBokyV
         79tWtE4xwMxUkLrss/PviHwErn142LBK6xGaGGHNsEh6cnbTlkOD1LQklHZ9W6NY069+
         LhqiVSovgRacZ+7DUH5/5VFd2b+b4SXRh6kIYokSnNRi1B53WpGoYFl/8UxVFNupMGvi
         jIHPYdg91HYp5aRbnVAJSR/ccDblxIPjq1NzICJDB/vS7NmN8qBb6ldNqPpZiEIQsokh
         1rOw==
X-Forwarded-Encrypted: i=1; AJvYcCWAf2Vth0EWOGdysWBBkuCkGcneq4IVN6QvQ6/N4lQwWKjWNDnhiRhT9VOdnDQ1vVfRz/bS95FGrX4ilw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPzvR1DY6ljrV6GiiNbHFhichTzVE567DnCOhxaMT/AvNWEjb/
	G+e+ue96/e41criSbgGpLltz14daa7aY16vGv8xHzePUas3L3mnL
X-Gm-Gg: ASbGncviA8eWbxtnmFK8s8yq83NsD4dyCbkqwrY5L78qW6lvCmlmQPZne/8QaHGJzk+
	Q1saIw7Zqxn0jGuNAu+dX0A+Tes95nsKYPku3gL7S+09qlrMWp3sWlhY8RMvv2ejApCyn3WXP3B
	HW9xue3iqSHjjaLa9ksUjdBnJSHLTu5eiEHFp9MZaCcGhjKGYmJBpXMF2gjtANTqZM3DCTBlB+B
	cscU3CV3u7npNoja/FDXexlrMhDzg8Dmct9WzLishf8+ukHEMMZqsg2zRiVSatG3sHPOoZBugf4
	zSSmOdhE3Bx5nnx7
X-Google-Smtp-Source: AGHT+IHSSsKyi9FGAPd9UU71QhjqJiaS5ihLbJsB2KEjxOY2dmC2E2E/lDqi0usoLmyGcynJlgTLAw==
X-Received: by 2002:a05:620a:460d:b0:7c5:4adb:781b with SMTP id af79cd13be357-7cad5b2392bmr136857685a.7.1746138234183;
        Thu, 01 May 2025 15:23:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23c3ed3sm100036785a.44.2025.05.01.15.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 15:23:53 -0700 (PDT)
Date: Fri, 2 May 2025 06:23:35 +0800
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
Message-ID: <ocbvvu7hmeh372dfvyokwy5saa3l3atjfxwd7i5prif57r3wan@mizv37xwg3k5>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
 <20250430-snort-raider-dbf10d14993f@spud>
 <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
 <20250501-shrubs-unmixable-a2a8a9bedd01@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250501-shrubs-unmixable-a2a8a9bedd01@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_152355_793779_C28AA5D7 
X-CRM114-Status: GOOD (  26.76  )
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

On Thu, May 01, 2025 at 03:22:17PM +0100, Conor Dooley wrote:
> On Thu, May 01, 2025 at 06:43:07AM +0800, Inochi Amaoto wrote:
> > On Wed, Apr 30, 2025 at 04:37:01PM +0100, Conor Dooley wrote:
> > > On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> > > > On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > > > > Add of device id definition for newly added precise compatible.
> > > > > 
> > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > ---
> > > > >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > > > > index e0c4dc347579..e10221df6385 100644
> > > > > --- a/drivers/clk/sophgo/clk-cv1800.c
> > > > > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > > > > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> > > > >  
> > > > >  static const struct of_device_id cv1800_clk_ids[] = {
> > > > >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > > > > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> > > > 
> > > > Given the same data is used here, should there not be fallbacks in the
> > > > dt for some of these? For example, 1812 to 1800? Or is that not okay,
> > > > because 1800 is not a real device id?
> > > > 
> > > > >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > > > > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
> > > > >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > > > > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> > > 
> > > Actually, this one is a better example. sg2000 is not marked deprecated.
> > > sg2002 uses the same match data. Why is no fallback to sg2000 used for
> > > the sg2002 case?
> > 
> > Yeah, It is a good idea. I will take it, thanks,
> 
> Can you point out the difference in the dt-binding patch when you do,
> between the sg2000 being a real device and the others not?

I will, thanks for the reminder.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
