Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F6C52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9DujJmp9petQpM7pUkzHeYAfmEu+GoOanEggleYZVBQ=; b=is4Xy7W9K/b2UJZ0UJhkucBB6q
	SCErY7KnG8RixzpJT26SzPZGmqX8YEU5QpEIS2JVCrk1CXq82bP4MpH+9vMl2SSzMQj1U3RvftYa+
	wDyECV636GCYGdwFzgbDhfTqaH0JSglZ8OLg7DeZKha4auJmBRNeT3R1IGp/eMLEeVlUSeWwPnjKs
	TGNZjxfTFMBJdLAzafWIdEHgxGfAnUC9rSpCcF1+RjhyPT6/gvnnifMW/OaR5L1EShB/GRym1NeR2
	rMH60QA0DxhO3fK0TyecAUoqlR3VozhGFqtzSJ8bXlmCKqPwRHKrlN9ibJFYn3oetPGxDhDH10ey4
	3lP0DWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfhBc-0000000Giwx-2ofV;
	Sun, 18 Aug 2024 14:47:16 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfhBZ-0000000Giw8-0UEn
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 14:47:15 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d3b4238c58so2773630a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 18 Aug 2024 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1723992431; x=1724597231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0Go8AiJdek7lWgXbzWIQti4cldN0KMyV85X7iQ7LZM=;
        b=uM3H7nwgR2tMqicjwSltOwP8CdkM5BSW+WJLq5UgTlgtp6Zscn3qkTHVJdqge418DC
         rOqSVZH8itSoV+vGWJ9C8OiGUSNHICPA7WxdknFqdxWgjc6trEfi4oYizsIfvmCYLf2f
         8PT8P9QgXMxZkQf2X844lwTaiNwNGOn4K0nxLGR3N0p8AP6I3PPaENC/x9DdFhkcJF7T
         r+6CB3//kLm2IZLRDJNRQGNWRthRXxIwjanGd5HtRsEJfj3n7s3P4OzbTa4P+r8kCoMm
         1tCaQ8Cm6eca43Iwe16+EmdNZU7tPuGJPmR8+A2XnVQKdaj3uFmvfg3YHhwbjHRH2WVP
         doTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723992431; x=1724597231;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0Go8AiJdek7lWgXbzWIQti4cldN0KMyV85X7iQ7LZM=;
        b=ubew5oUOvu09KtJ33tgL9LtgJmcQ7sYMo+1J+IpNunRAhOHxLiKdiFgRUuUvYlHJ7j
         K8Ezrukgzzeao5sVaxFJ+w6mlzRiD/KwdWw1Su+bphY+1H8r690TdLOjROnC6jJdL9A/
         a24PSLpfDwipKuQ7ZA7T+CDnHHHBpTZzU0aJ/rGkAPmm6tCDuIFRebpa6wrxNRqZ3dWp
         0zCacK1NiBeY1sgHNz1BT7UfLoS2vNucYr2Nhp5rigdV53+mpX0ler9jLwhwjpqWlv3/
         pofbYvw56wKYTLlyZlJEHtIxnFKjVEvGw4LkgbSCrMvLKXgEDALT4Wwiokk2pOEMlGpZ
         n0uw==
X-Forwarded-Encrypted: i=1; AJvYcCUhlv4USgzSflLl7qgB9LcqDuysBWzB/uI13qzM6d7AAHlWasv3yu22L5FnK/mrjT5PHQmkeEw05iO9Va3HrrpOGVG8rU4q90J2y0+SV4z1
X-Gm-Message-State: AOJu0YzyBpVqOik62cUz2Wrwj+QZ9UTkmfBclZ9ugMAyXHZZVy5wcpyJ
	/JS+AA0TCTQqjF7WxQm4mUFumdkf5PPMlTvxkj98j3NO7jCPrCg6Zq8mkDkP9IM=
X-Google-Smtp-Source: AGHT+IFPsZCr0YUiUpr/DaFMboUHyjc9cdjktUKCX4FN+D2Lradt6LfpdkLAoK6RZRWM1coGNNq1GA==
X-Received: by 2002:a17:90a:fe93:b0:2cf:fe5d:ea12 with SMTP id 98e67ed59e1d1-2d3dfc7b35bmr10124972a91.24.1723992431051;
        Sun, 18 Aug 2024 07:47:11 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e83ebaa1sm5346974a91.17.2024.08.18.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 07:47:10 -0700 (PDT)
Date: Sun, 18 Aug 2024 07:47:10 -0700 (PDT)
X-Google-Original-Date: Sun, 18 Aug 2024 07:47:04 PDT (-0700)
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  apatel@ventanamicro.com, tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  samuel.holland@sifive.com, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Renner Berthing <emil.renner.berthing@canonical.com>
Message-ID: <mhng-e2f36a06-7e9e-47bb-8120-126f1a4441f5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_074713_438127_3F41403F 
X-CRM114-Status: GOOD (  17.92  )
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

On Wed, 14 Aug 2024 07:56:32 PDT (-0700), Renner Berthing wrote:
> Hi Anup,
>
> As described in the thread below[1] I haven't been able to boot my
> boards based on the Allwinner D1 SoC since 6.9 where you converted the
> SiFive PLIC driver to a platform driver.
>
> This is clearly a regression and there haven't really been much progress
> on fixing the issue since then, so here is the revert that fixes it.
>
> If no other fix is found before 6.11 I suggest we apply this.
>
> [1]: https://lore.kernel.org/linux-riscv/CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com/
>
> /Emil
>
> Emil Renner Berthing (9):
>   Revert "irqchip/sifive-plic: Chain to parent IRQ after handlers are
>     ready"
>   Revert "irqchip/sifive-plic: Avoid explicit cpumask allocation on
>     stack"
>   Revert "irqchip/sifive-plic: Improve locking safety by using
>     irqsave/irqrestore"
>   Revert "irqchip/sifive-plic: Parse number of interrupts and contexts
>     early in plic_probe()"
>   Revert "irqchip/sifive-plic: Cleanup PLIC contexts upon irqdomain
>     creation failure"
>   Revert "irqchip/sifive-plic: Use riscv_get_intc_hwnode() to get parent
>     fwnode"
>   Revert "irqchip/sifive-plic: Use devm_xyz() for managed allocation"
>   Revert "irqchip/sifive-plic: Use dev_xyz() in-place of pr_xyz()"
>   Revert "irqchip/sifive-plic: Convert PLIC driver into a platform
>     driver"
>
>  drivers/irqchip/irq-sifive-plic.c | 296 ++++++++++++------------------
>  1 file changed, 117 insertions(+), 179 deletions(-)

I'm still only testing on the QEMU-emulated platforms, but this isn't 
regressing over there so

Tested-by: Palmer Dabbelt <palmer@rivosinc.com> # QEMU

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
