Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F09C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+GLBYgntdvgxLSw/sVg2BNw1pcShE4LiLuz3mwyXbI=; b=UM9FXiac+j+f5c
	ubIhWgx47PKZcuZvmxM/6Fclqq6GkEav3PSb70YwbuhMRdrzyL87D8QXRN/hYhM4La97JvgvmwTiP
	cLKtxQjt72tlA1J0O6qgWIkSUC+JCQrTqt93iaRON/2xNvTAc5RSZN6ZPbLCR72+RGC0dLMRoulRV
	omT9fHbXztY/oeQi0NsZXT1A+ntwMKII2T3H4EUEBON7he2skWN+RU+HQWN8USWps8Om+VZksQ+uh
	U12OWdcaMonjcQHEC+Mw8OUqIuMGhF0iDrjkJmi8TXnlJk1JrhdJkv7dhYalx9oaVxGjWyRR5VBFz
	cnESUgA/MCiX4QA4m7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzpy-00000002Ksg-1dR1;
	Wed, 19 Jun 2024 18:15:14 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzpu-00000002Krs-3EPE
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 18:15:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-706264e1692so108440b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718820908; x=1719425708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObNK4nw+goLT3sduvlOOitPrsfAxlE+HFMLfQaVSTdo=;
        b=g6ndK0gdYCyTBB3O8oH0C0/kvZeYKY+McnwvVGD3N8msDFbs64tpHssu5zddvJioiJ
         8h6ZD7ODU/9EfoxV0xNOdeENkIgZrDRKHcRzblQjLeGAztkraxvAa/QQdVmtbO6HWhsc
         fTyuvqDignXXtnou0FRiwJFP/W5pegyEdejus5PjKk6XXBJ3GhueRu2QqkeO0r/pwUdE
         ECAAwWkAesLEXYmCLvIZs5hnbscX0Y9Jh942dlBq3rSAQ4h5SjkVm6JdXiNfSHQ+GJcE
         4yHSQr3hGooyxlsUcDr7OKetVK/CsFZrBK2YwIXR84CA++4iCZqZKqP/S+7RnKt/hzPM
         qZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718820908; x=1719425708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObNK4nw+goLT3sduvlOOitPrsfAxlE+HFMLfQaVSTdo=;
        b=DVG6wnwj7Fp1yvt/Hbo8jODgyvqH374+5pWiUQmGzVpQ6iqtZuATmSiha/ymYWdTGm
         rwKH4FD+qxrfK1L5MmlbbhdNy+O7USSO0MALxLuV7FHUwBWTHtWkGBYJI1X+3TT07zrC
         f7lJADS+tg9UFApszT/3LWOcq9KX/WtFtvlWdFnKduvrQQ4NtimlusX39+MOQHDScaKT
         RyvE1Lw7dwlJy4zCSvoEXnEZMH5ZpNrdPQoVHbp830NdAwH/G7FwFoK1r205QJhKAM+X
         8oMMOrN53unyr+V9qBxaxuU4kEr0wynKwvkf/pmLzXbD631jPNCsZy6pFT8ccQqAavk7
         jOcA==
X-Forwarded-Encrypted: i=1; AJvYcCXP6FrGoaU5ZbFWfy1+zUhM/mNRep7MgrEYaYve29iczaH845VxK4p6Oon64BrAtBnjdawF3dcLfq0wfLAIPWXhVAlRLJCQgyn3ohYeQfpB
X-Gm-Message-State: AOJu0YzwjVvTuWeldQs/yY4TEpzjuhaM43cLzihl4HgcNmEnHSlenVGd
	LuHr73qmElhw/muP5Jjw2Dor8/Foc9jOdf5uNwIITxvd8uVOdqKHYXXjwatq9CM=
X-Google-Smtp-Source: AGHT+IGj5wpO/mjLKZrOGKZvpPOXW2hKDnc/Jp/UqhQuyCI6Q1OQJ7aj2Y4azc+GePSR7cngyftNOw==
X-Received: by 2002:aa7:9e90:0:b0:706:29f0:33fa with SMTP id d2e1a72fcca58-70629f038d4mr3002643b3a.6.1718820908271;
        Wed, 19 Jun 2024 11:15:08 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:7627:e2a7:42c9:f02c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc967334sm10993307b3a.57.2024.06.19.11.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:15:08 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:15:06 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: thead: Add support for TH1520 AP_SUBSYS clock
 controller
Message-ID: <ZnMgKs/dUcYXiisk@x1>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
 <20240619-tapping-jaundice-471811929d96@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619-tapping-jaundice-471811929d96@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_111510_855831_99C0E428 
X-CRM114-Status: GOOD (  16.09  )
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

On Wed, Jun 19, 2024 at 12:12:30PM +0100, Conor Dooley wrote:
> On Sat, Jun 15, 2024 at 06:54:29PM -0700, Drew Fustini wrote:
> > This series adds support for the AP sub-system clock controller in the
> > T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
> > 2023 [2]. Jisheng made additional improvements and then passed on the
> > work in progress to me.
> 
> One thing I noticed on the dts side is that the GPIO controllers have no
> clocks provided. Does the AP sub-system clock controller provide their
> clocks too?

Good question. I see that dwapb_get_clks() in drivers/gpio/gpio-dwapb.c
does call devm_clk_bulk_get_optional() for "bus" and "db". There doesn't
seem to be to many in-tree examples of clocks being defined for gpio
controllers with compatible "snps,dw-apb-gpio", but I do see that
k210.dtsi defines K210_CLK_APB0 for "bus" and K210_CLK_GPIO for "db".

From the TH1520 System User Manual, I do see the gpio related clocks in
Section 4.4.2.2 AP_SUBSYS. The peripheral clock gate control register
(PERI_CLK_CFG) has:

Bit 20: GPIO3_CLK_EN
Bit  8: GPIO0_CLK_EN
Bit  7: GPIO1_CLK_EN
Bit  6: GPIO2_CLK_EN

I will add these gates to the clk-th1520-ap.c and reference them from
the gpio controller nodes.

Since each gpio controller will only have one clock, do you think I can
omit the clock-names property?

Thanks,
Drew

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
