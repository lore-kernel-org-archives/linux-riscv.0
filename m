Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C74BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWxwPjcGS99W4DduWJS7IkcfcYW2w0NGtS2dEN79QG8=; b=owEIP5EqH7SZRv
	iHbnj6g6qdkHZlCJkCF8xbJE/DIdZ3Tv61Zg9JdBeMClY6VV+Wvr85mvXBtlJt/bgP7sMUyDRAbzv
	J3a+0aK8HsVyE6MytZohcExbaNnHnPFrstAm9hrcE4AUhrHquKt+DZ4P7N1o1LLhAaFe0i2vRL3U6
	WiMCpsh+r8XmU4ogCXMpvuHJ9yDZ2DUV8vJBOH8tlAUMK+XuRgJfhjO0BicbjtwCdRc8Thk8hP1nj
	vJR8WgHVVLI7M3kA1jpFvQ3Anenu62VZC7xE64hvlBNAbzwrGNtMzkgjxtlx/fnFqI43NvzIZF266
	BamSHD8/CxsTHDIG54HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhT8q-00ClH8-9t; Thu, 21 Apr 2022 09:30:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhT8n-00ClFn-En
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 09:30:22 +0000
Received: by mail-lf1-x129.google.com with SMTP id x33so7655047lfu.1
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67sfB0IzHVXeR5A8puxseus3O+X5kUTFhlECjiPj6x4=;
 b=fmIPbE1IBLcf3qYXbw+olE1xUMN93LGj1KaoeCohxNiXqe/IYmOR+GNMCYDO9BV3c5
 v8VrA2RrG9XLDbSN1FgCSuioGJ5TOoSErvJmCZpZsunnR+EtJv70QquoeihauNHuR0UP
 RirMlujj/Ha9r1dj1uUgIFTR3YrP1u/zjmXzkYSgv1J68uNJPbBu/73B2Sh2kwRKqugs
 inRGGd2FlV103fq8wddg04I7qf3rcM2wr7PTd0UYBkj36CXEV4Uf5QfdjYvDFLwyOON2
 aj5KJBCk1OJIDEVhC5GjAywZQAa/N1Xi6UfsgqhbtrtTWIeyitADL3C3l2X1Syi4OyB2
 9VCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67sfB0IzHVXeR5A8puxseus3O+X5kUTFhlECjiPj6x4=;
 b=HFxVI8d+49N68MgYDXfeBznfpkaLaxsidGn57Rh5hjz/evCWwqaPhjgPFX6Yv6ZNen
 MJxDO3yQPDmeWWgB7V70bMYqVJQ8tLKbSBRMjcCnbtB3i4G4oCfYyL8K3Ipky09cN5zp
 Fuqj16noEPlUNJl2HdcIayALcLuON09f0GlHiuMXvzBBIi/rg0UFb5W9DgPwSR0b1XC1
 y2m7k5yMZMo7qie3l1hRaGuInHyO5Ix+GCuXCxhVTgirAgMLPkR3q5XI7J2uNL4dDg0+
 f2dHuBqMLpu+iDEJMTcLBnPMNQa9JV7WJvekImd7gQNYCBosKcbC8kqRTC1jD0E3QLOM
 Ha+Q==
X-Gm-Message-State: AOAM531NO3otnYE/YhqMjX1e61a1aYu3xOcPBZkXkCHj5nM0ra9GEnR8
 QZrIlom/Gsz+l1PXByjB4YimAsvZwRNSXlhMo4iGIg==
X-Google-Smtp-Source: ABdhPJzoFpYEMBId0vI8slCjJdfA2UOYmWG5jdk+Km/dMYqYelRd2ehVOg2cAmAYllGKHBeStzko5XCzXa5i312zsiw=
X-Received: by 2002:ac2:5ddc:0:b0:46b:85a3:9c3 with SMTP id
 x28-20020ac25ddc000000b0046b85a309c3mr18314110lfq.130.1650533418465; Thu, 21
 Apr 2022 02:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220412033335.1384230-1-apatel@ventanamicro.com>
In-Reply-To: <20220412033335.1384230-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 21 Apr 2022 15:00:05 +0530
Message-ID: <CAK9=C2UB-SKcb2Lf=m9VQZnOmkoY1W=kNeSJ40VcVXfr5WuPZQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: mm: Fix set_satp_mode() for platform not having
 Sv57
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_023021_537155_EA5AE052 
X-CRM114-Status: GOOD (  15.67  )
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

Hi Palmer,

On Tue, Apr 12, 2022 at 9:04 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> When Sv57 is not available the satp.MODE test in set_satp_mode() will
> fail and lead to pgdir re-programming for Sv48. The pgdir re-programming
> will fail as well due to pre-existing pgdir entry used for Sv57 and as
> a result kernel fails to boot on RISC-V platform not having Sv57.
>
> To fix above issue, we should clear the pgdir memory in set_satp_mode()
> before re-programming.
>
> Fixes: 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
> Reported-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Can this be considered for 5.18-rcX ?

Regards,
Anup

> ---
>  arch/riscv/mm/init.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9535bea8688c..b0793dc0c291 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -718,6 +718,7 @@ static __init void set_satp_mode(void)
>                 if (!check_l4) {
>                         disable_pgtable_l5();
>                         check_l4 = true;
> +                       memset(early_pg_dir, 0, PAGE_SIZE);
>                         goto retry;
>                 }
>                 disable_pgtable_l4();
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
