Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB5AC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 03:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxfY7BK2IPsi/A404Is826AZXI311H3vlYrE3YyRMpA=; b=Uteq+f7Higb8yG
	XSSU9178NO58cxXT42ZmW/cGB38TwdFuXisF8d+Hgdg6jgbLuV0jB8C+cCZEPNWYayeyYbuyZ55og
	qNC+LaKafrSKJnlS/u2iqqo6n8WHsN0MNXuygTBUZvsLwMkGHeOxzcr6YFuKzBv/3X4VWI19fFyag
	n9Yh/itOwBm/lpBFSk5veGaVwhV5rrzRXEdHY1QlK7tM/6g+gydzuIhbMpvEtofSX7/zfWBNaobol
	5U87i007k2y6EgIJUcpI0SnBaS8nFRkVKcaOQhxiEaw4qA/6olCa+X6UdONjoYA+5OnrwJdd4SqyJ
	TsY+53zvZwV/Ey9OrDjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHWD-00Bzok-Kx; Sat, 20 Nov 2021 03:58:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHWA-00Bzng-AL
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 03:58:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t30so21407197wra.10
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 19:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2CjoMsxBptXVqkDa29fYtIMwwlgdoCQU4ETPJxBOQ8=;
 b=EhjqRL/Z4pOX+J811Y+x6gcbH7pV9cQJosEHhcTLiQ8rexN1ajlRPoJoyIr/dwbIJC
 7MYQVzWG8XuY/mcMHREuB9s36SOreVe8G4NfHUKz0ChpPWhUABvb23kh9dBqZHJ0RIpK
 hRFVUGXQ3ZeSCUS5YD6jV3efnsb2lcfO7GRok5FVKGBgWYz9ucsvDBH55XxtJzn/Ge4L
 rHxArTMMLhYF2nsWLagRH7L/2ME08CJZTMuYvVAZGA6tCp9BDdt+TXtFwW94ARDQuHmK
 sGyiIJX5klNEISw5aGszx81lylTc9nA56c/rE1RmYJYNgXxMjUiNnP7seCTWs7Ru0FOn
 Kr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2CjoMsxBptXVqkDa29fYtIMwwlgdoCQU4ETPJxBOQ8=;
 b=tXSr9T2nNLbf0HQsMyitOTnvcZDjFOSm2cFo12jeLS5rs1zO1wix+p399bnXemy8++
 n40TXSi+PAiU2xALcXbkOPlv0WPLE6zUtN/gJxzTkN7AoNi3h6n4xA9kBSsUuHtRlzPc
 WM8T6qJchMN8N3JWCiLIEMdmnx9E9m6YPtiSFnDbTmEEHJzUGG2IG65f/OkUlrYG0bwk
 vubKToelNPNTU//LlAPkfWNkbIPcX2QJDTMGvt2IrrYk8tjCHc9vxqSwW4ufOPeYixrM
 fX+SNFXfnr2ATSkV5dlSk/Ap8c+5MMff+wqNFU/PdjgllTsBUNB2Lie3A/8Rf4NJEOpN
 PzwQ==
X-Gm-Message-State: AOAM531jC73Er9ss3AKnx5lE+CBcoRX69z8As6cF1G6gZFrSqXXjf+5P
 R9wuxghE5oPdMa2EtnNNBE+TKN+Z9VMX/w15CBI9AQ==
X-Google-Smtp-Source: ABdhPJwGvccO8ogaudOrnhnsD+gIPWIGY/81C3RezCTNz+iSgUGzBBaViIBhkvwypBJ+MIZDrneEzGUnme2SftJo9y8=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr13626836wrs.249.1637380700802; 
 Fri, 19 Nov 2021 19:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-4-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-4-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:28:09 +0530
Message-ID: <CAAhSdy2qswfrbb0LMNxq-U29og9OQRwRyMBH+KaGPgFdDQEgEg@mail.gmail.com>
Subject: Re: [PATCH 03/12] RISC-V: defconfigs: Sort CONFIG_BPF_SYSCALL
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_195822_389047_41B8A6F0 
X-CRM114-Status: GOOD (  12.79  )
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
> This should have no functional change, it just sorts CONFIG_BPF_SYSCALL
> the same way savedefconfig does.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 2 +-
>  arch/riscv/configs/rv32_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 11de2ab9ed6e..a6cb99cf4d3c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
>  CONFIG_NO_HZ_IDLE=y
>  CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BPF_SYSCALL=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> @@ -13,7 +14,6 @@ CONFIG_USER_NS=y
>  CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> -CONFIG_BPF_SYSCALL=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 05b6f17adbc1..8a57c940d5ef 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
>  CONFIG_NO_HZ_IDLE=y
>  CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BPF_SYSCALL=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> @@ -13,7 +14,6 @@ CONFIG_USER_NS=y
>  CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> -CONFIG_BPF_SYSCALL=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
