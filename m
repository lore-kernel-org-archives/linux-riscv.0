Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81A1C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 03:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5bzRzlqMXqg5l2nyRvkp8SUBff53oZwcSQSMvv25vY=; b=pVljL2FKCoDQ5o
	SaGVeG3eEZ1A0IQheRyrsdvFITAUZ9owgRbAm1rMgEtCaBvOjQC5fLZpgMyPTVi8wc36JeOmq7t+p
	PbjDhljZfSe5GPd5w9OGQWwyGqV/xANN5k6olLoowtrmFNaJ4j1pL1vCmdd1JyLaGdWozIYRRKt2I
	swJYq1CsmuQWHV+/5qY6ihxqLHHB7NVgEah2FdkYAOLGyKyjjtGg4lm2jXSPpRqikG1iWcXeVpLqo
	GPOHgGVqpVW176ZWacZwdsyCjIPBGNSC4IgKhikRQJ12zlu9zp9o9bxK786URQ9f3xFwFgdx1DAey
	v2pDk2n0kJNN87HkPAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHVG-00BzfY-P5; Sat, 20 Nov 2021 03:57:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHVD-00Bzew-9r
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 03:57:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so54720wmc.2
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 19:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxYwFgP8QJkY0fxAaKGmN1e+xFo7sJTuqw6yMPGfDkU=;
 b=IK9SuPgNEEXpXn5eTloZtETIgJUVZCFMm5dY5FECGXFayp2QZE4sItiri8a9E3ZAwO
 w44k+4ShvTftu/4aHhItjEmF4SqykRKGl7KRMBTtE9mW9l3Y29TF2ZLaNrCHFjUuDWTU
 dpVb3ufS2FrPSIusaomI3+nEQX+1quVvFzdW+MswCGStMDsSD9Eg7/+XvdYNPTyvpbkS
 9pXy4UpmC+qIoBsu8dA1LHtUXwJhr49g5SLjtl7ZrEiicgWxM0fIcbAI0bXN42k/vgop
 Pea5vu4B32j+LaYtaFNdhTqwObs8SEMnmGvVceC/Lez4+Nefb/MdW6QRk0G5FXBCldUD
 yc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxYwFgP8QJkY0fxAaKGmN1e+xFo7sJTuqw6yMPGfDkU=;
 b=J2aWtlsfD2/2Zn9Tbz8KTtpqgPYRuSW+w/mRz6JC7CfS/B6Crs1WaDb0KA2MCPQJyH
 4Tixx8/WKDat8m9R1c93MKMoFrFJpcqv6bjkE+sCFuEoVqulrtmsCeSPIzNMdM/7EtoI
 0V40BVFtIISlYmRQ0ktLHrzuU42pQ2xgCWTBareT5CzBpRdX1y07OF6cndbvvPZYS/+U
 a63SvOZqXCsyZT95Kj8l3jUSkiRBEyVy4hQqxWCbDjnDR+qsw+064klAbd3udiE6wN0R
 gEg13vD0iBq2X+uq1r3pPY/TOt0hUzh8aodKR/S8IRmkdv2SWQ22fhIeTJuKe+eT9cNS
 Pi8w==
X-Gm-Message-State: AOAM530S9WyF0cZmCssubloplrgDj23Dw7jTWlnRZeqXd/cd/uoljbQE
 NbuJl2kmLzAcGyIUyvBfQqqL8MySNLacZMC6QY06zw==
X-Google-Smtp-Source: ABdhPJyIb0xxDF6sP8Nm5V4J/JpeG+4+whciNZU5mV9yRjqVSK7mUHZ0qQPwxtG1jTQX1H5BGp23UGzUxdWfTn+fudI=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr6680170wmi.61.1637380641708; 
 Fri, 19 Nov 2021 19:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-3-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-3-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:27:09 +0530
Message-ID: <CAAhSdy1hx3Me_YCKnE=QkTaA9j-qyZjmgJDM8nT-uYCdg7vf=g@mail.gmail.com>
Subject: Re: [PATCH 02/12] RISC-V: MAXPHYSMEM_2GB doesn't depend on
 CMODEL_MEDLOW
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, 
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_195723_371892_8C818C79 
X-CRM114-Status: GOOD (  21.48  )
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

On Fri, Nov 19, 2021 at 10:14 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> For non-relocatable kernels we need to be able to link the kernel at
> approximately PAGE_OFFSET, thus requiring medany (as medlow requires the
> code to be linked within 2GiB of 0).  The inverse doesn't apply, though:
> since medany code can be linked anywhere it's fine to link it close to
> 0, so we can support the smaller memory config.
>
> Fixes: de5f4b8f634b ("RISC-V: Define MAXPHYSMEM_1GB only for RV32")
> Cc: stable@vger.kernel.org
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

>
> ---
>
> I found this when going through the savedefconfig diffs for the K210
> defconfigs.  I'm not entirely sure they're doing the right thing here
> (they should probably be setting CMODEL_LOW to take advantage of the
> better code generation), but I don't have any way to test those
> platforms so I don't want to change too much.
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 821252b65f89..61f64512dcde 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -280,7 +280,7 @@ choice
>                 depends on 32BIT
>                 bool "1GiB"
>         config MAXPHYSMEM_2GB
> -               depends on 64BIT && CMODEL_MEDLOW
> +               depends on 64BIT
>                 bool "2GiB"
>         config MAXPHYSMEM_128GB
>                 depends on 64BIT && CMODEL_MEDANY
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
