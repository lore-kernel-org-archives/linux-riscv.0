Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E989EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/1Zmz8Vi1snQl1gC94NGnr8OeYVXutlsk0BNM31fny4=; b=qIz/bAWZ72w5Myckh/w/GiJD+o
	3Aa9CZjb+W09QM77sexqP7LuG48rfpT0rSKHfm0GKaE2JRhp5n3NDQ5PlUPd4Un+pV2IBVa1n6LG4
	zHj2b/Gi1TJ6sZK8BrCDnGnOmTa98BtiwACxnvm4VZYBGM3IZ0ABaFDmCAfkSZLdmFvy9qdBlVQCD
	65kbAZJ58RAa7YlFiULfVsu+lurHvyzCqhrdLfr00nkgNRvMg37QVmlKdt3mKENVK5iMLuL4gLoCj
	bH4kr0atEq41mvyyazx+prlG1Su3cnAD2A8UDYtZ0qBs623uP8UwOXMZ6Z60sh2RG2LQ9NBdbt1Uw
	+T/C9z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Dd5-00GSBp-3R; Fri, 16 Dec 2022 16:32:11 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Dd2-00GS96-6x
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 16:32:09 +0000
Received: by mail-pg1-x529.google.com with SMTP id 79so2091319pgf.11
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 08:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHeZEl4urkRUVM2RdVBA/kn/ywb3AI+XBKELaiBu0qc=;
        b=NCsfCJsxNnxBuuq0Z9i2gnSCgatr455aBSI9i8tkoK19Ms86AoCXDQoalTrDt3hwXY
         edQKOS0BX+FQhPJ+mBklzXsWQm1/jb3cxaXxKxFB6OZ3kMbizjfTY7t08YialN7iWaZB
         spDcvXPqt6N8s9z8yj/qzCnNOVS/y+JMBWYA2+XoGWAFxacEcJFazUZloDyR9yq5/GoA
         49f2IkGjvpwJogwF3lkFyaCCryEl1W+3MMdc1LYeEJS9UySIVc/n8YwgmI1BzXIndBGw
         d4OFHxtUKjNa8kE1pqBsMBc2jfWbPCaNyt9dCrrIbRnRps5hGgrGhn1GA64w1NuYL/vY
         ZS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHeZEl4urkRUVM2RdVBA/kn/ywb3AI+XBKELaiBu0qc=;
        b=bSyN2C0dClLeiGkH1c3/lfHMm/NdG3zPESrX3voZy4vovX7TMV8hiLcNESC+SUGvry
         KnFGnmLP2eFeK7rE0/7zgGCw6jsvt7xo3kuY9ca4o1Sl8XN8zBVLCJbOOJsvWGXc9dAl
         03K+Ji1efrdTMVJXIUf/5Lc0B+YvzZuRzNvqYzdYFSUOElXI+uXMlAWhJQhbsD23aOyJ
         6P90cIeqicgsf8BPXK5I/CwCJ5VvmJW8DN7KXyhtDM6APriUEeggeg5RvkwpQeiYaOGi
         pxgAIKl5x2fF0fwVmU+7SodenkkWF5M/U1/+MgcD+Mo/rCmL81oYwj9LBcTlWWlIBZZS
         bdrw==
X-Gm-Message-State: ANoB5plqd0itrlNU0YOcMDCr6Hb7Bmkvn2dY/C619BECV1jyt+RWze6B
	YvS78R7kR5/eCDETSwCTio2fMw==
X-Google-Smtp-Source: AA0mqf4izKqYro6PFUpm34vh03n5EOn7EYe4G+r+5xdAGgx0ZYapdWHCjn9GLpaZ5ybuKQdkcdMwuQ==
X-Received: by 2002:a05:6a00:1409:b0:56c:cea7:88ef with SMTP id l9-20020a056a00140900b0056ccea788efmr39605813pfu.18.1671208325653;
        Fri, 16 Dec 2022 08:32:05 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l187-20020a6225c4000000b0057621a437d7sm1699327pfl.116.2022.12.16.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 08:32:05 -0800 (PST)
Date: Fri, 16 Dec 2022 08:32:05 -0800 (PST)
X-Google-Original-Date: Fri, 16 Dec 2022 08:31:46 PST (-0800)
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
In-Reply-To: <Y5wYIrMZIqu5f+WM@infradead.org>
CC: geert@linux-m68k.org, Christoph Hellwig <hch@infradead.org>, soc@kernel.org,
  Conor Dooley <conor@kernel.org>, prabhakar.csengg@gmail.com, Arnd Bergmann <arnd@arndb.de>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, magnus.damm@gmail.com, heiko@sntech.de,
  Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org, guoren@kernel.org, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, jszhang@kernel.org, Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com,
  ajones@ventanamicro.com, nathan@kernel.org, philipp.tomsich@vrull.eu, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
  biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-8b05b6cd-d8a1-4302-af24-2f64a4bf7c32@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_083208_260423_47FB5D5E 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 15 Dec 2022 23:02:58 PST (-0800), Christoph Hellwig wrote:
> On Thu, Dec 15, 2022 at 01:40:30PM -0800, Palmer Dabbelt wrote:
>> Given that we already moved the SiFive one out it seems sane to just start
>> with the rest in drivers/soc/$VENDOR.  Looks like it was Christoph's idea to
>> do the move, so I'm adding him in case he's got an opinion (and also the SOC
>> alias, as that seems generally relevant).
>
> Well, it isn't an integral architecture feature, so it doesn't really
> beloing into arch.  Even the irqchip and timer drivers that are more
> less architectural are in drivers/ as they aren't really core
> architecture code.

That makes sense to me, it just looks like the SiFive ccache is the only 
one that's in drivers/soc/$VENDOR, the rest are in arch.  It looks like 
mostly older ports that have vendor-specific cache files in arch (ie, 
arm has it but arm64 doesn't).  Maybe that's just because the newer 
architectures sorted out standard ISA interfaces for these and thus 
don't need the vendor-specific bits?  I think we're likely to end up 
with quite a few of these vendor-specific cache management schemes on 
RISC-V.

I'm always happy to keep stuff out of arch/riscv, though.  So maybe we 
just buck the trend here and stick to drivers/soc/$VENDOR like we did 
for the first one?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
