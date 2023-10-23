Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58612C25B45
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhstfav/ZQDu/o9BHmNHa60pfmP5R+5KU+9pzQM3OpE=; b=NiEEBA2v5Gyxwa
	lwtncrUSscHfRkEWCZLuvdsU+b7JYP8z37Q6ry+yDJdy5nOOahj4ogVEwa6NCYgQ8Y7RPM9+Q+pgJ
	57mco6iHhQYSjxxpo6jlPk6SxLJ+lJxcGEdgqXmvTlZtQcdtaeTVOxwl53Fd4aMZ9KUm5y/VbOo6s
	tmr/a7MSjblNaoDXLpZlvnx8GELx00rABh5j1AjCnR+tHTpMe/mW+iVTZ3+y5poqOCwvxg5VXpR4G
	RQC+U0IjqGW7QaxgD4jLVKk2eXH6oomjDEBa/J8C1VZhTmTkEdPChjfWGOZ9bKEyVPoLyiH7sESGf
	RhVqkWVAvchfHbRDQayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv2He-008Ii1-33;
	Mon, 23 Oct 2023 21:16:22 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv2Hb-008IhQ-04
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:16:21 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-694ed847889so3108172b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095777; x=1698700577; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zvhazaZM9RfI4iJsfgktcPhLE+7qHteXIMbKad1YWwM=;
        b=V/OWV2b8KrrDqsrxOxzd9H0eFf/ekJ7X0TF5RAJNh/BCq4ntQVH0pT4jo16flC69c5
         ds4jVjEpojw7oz1dxN3wL/1u/ePzNHvs9f4cNBKSSmrnv3q3z48edyPa7l8LB7luYNAh
         WucJfKxbMgEVJr9rfB6loISl/Fv2wRg1Sw4ENvFsdo0fuRxoyTuC383mWddUo2/82vd4
         cUMd1Hhtv/+xnQVVz5TpCLWY5a1W6h3j9QyVAljakQUDcOm6aIoMv+PJC8rJORm6OyLx
         K7I35FItUYaJkxNCaC7mMZ3fAgix91oBgjPWbyrDxRevDkss9H70M9rQf4aiPTxPh8Ec
         FDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095777; x=1698700577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvhazaZM9RfI4iJsfgktcPhLE+7qHteXIMbKad1YWwM=;
        b=uPxSbD8/kuN0MhgqRM+9PL/p2ekW4ZZz8dCFJ+T/Hk05oeH8xu/OB5/MIwHkPBZe1A
         tzGyW/+PK7uyJJ80D5wWO385M2HleUo3wccUKqAu3DnrKkfydUp7subtBqRkTcSOzCFf
         +PusFyyVrVknhTEGXulMOB/Q5W1PRbNCb1zjTDyEMV0fv8C89ohBvLNBFV0wnn+3DtGj
         IJi3YfHxvXQKHPgiH6NuMPEjm5ZpiIVvYkeUC+frYnkz2W5LVQ4xKj5pc9pls1ur+HFV
         dBx6RDZbhTLcY2l1XaDAU0aOe9WVW/asY9Si9uKM0zjA9fxHzmLsEZNlRRYhQaKHUThv
         jasA==
X-Gm-Message-State: AOJu0YxTNPq3HjqX/1gmR6gdoZ2pFLVkAvOdHPbEcuPZe25xdZB56P88
	osyDsKi8IpMGSYz/R5kX261sIg==
X-Google-Smtp-Source: AGHT+IHHOa6b8isYHkqmJjQq3xCd6kvCalcUdzFL2r7jyGX64Eq4yPLeQJvZ+MMD0KyWAU4/1ldzgw==
X-Received: by 2002:a05:6a00:a0b:b0:6bd:9281:9453 with SMTP id p11-20020a056a000a0b00b006bd92819453mr9522592pfh.9.1698095777579;
        Mon, 23 Oct 2023 14:16:17 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79692000000b00690c52267easm6535133pfk.40.2023.10.23.14.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:16:17 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:16:14 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 0/7] RISC-V: Add MMC support for TH1520 boards
Message-ID: <ZTbini/VyDxHMyrm@x1>
References: <20231023-th1520-mmc-v3-0-23850668d208@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023-th1520-mmc-v3-0-23850668d208@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_141619_084571_B5FFBB6F 
X-CRM114-Status: GOOD (  24.54  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23, 2023 at 01:33:02PM -0700, Drew Fustini wrote:
> This series adds support for the MMC controller in the T-Head TH1520
> SoC, and it enables the eMMC and microSD slot on both the BeagleV
> Ahead and the Sipeed LicheePi 4A.
> 
> I tested on top of v6.6-rc6 with riscv defconfig. I was able to boot
> both the Ahead [1] and LPi4a [2] from eMMC. The following prerequisites
> are required:
> 
>   [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus [3]
> 
> I pushed a branch [4] with this patch series and the above patch for
> those that find a git branch easier to test.
> 
> Note: I have only tested eMMC and microSD. I have not yet configured
> or tested the mmc controller used for SDIO WiFi yet.
> 
> References:
> [1] https://gist.github.com/pdp7/7850027e8d256b6fd9cd53080240f0f6
> [2] https://gist.github.com/pdp7/fae4637378426723508b679420a0a5a1
> [3] https://lore.kernel.org/linux-riscv/20230912072232.2455-1-jszhang@kernel.org/
> [4] https://github.com/pdp7/linux/tree/b4/th1520-mmc
> 
> Changes in PATCH v3:
> - always call th1520_sdhci_set_phy() in th1520_set_uhs_signaling()
>   and not only when timing is MMC_TIMING_MMC_HS400. This allows the
>   microSD slot to work as th1520_phy_3_3v_init() is called from
>   th1520_sdhci_set_phy().
> - add mmc1 node for mmc controller connected to the microSD slot
> - add enable mmc1 and add properties for microSD on the Ahead and LPi4A

My apologies for sending this v3 series prematurely. I wanted to send
out the fix above that enabled microSD to work but I failed to address
the feedback from Adrian and Jisheng on v2 [1] and I also failed to
applied the tags from v2. I will address those in a v4 but I'll wait a
few days in case there is any feedback on the th1520_set_uhs_signaling()
change above.

Thank you,
Drew

[1] https://lore.kernel.org/r/20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
