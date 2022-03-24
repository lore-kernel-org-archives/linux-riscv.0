Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 21:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svXFYZUfwVyVr/Qw34pY23dVAQUOLOXWZWS5q4yMuSo=; b=VSwjLzydJzsCKm
	e9LpKPcQFh0NjhUE+LHyHB6SbI+pBioo4r5xt+F61TRLcjOSmetJhtbzSfhn5JsaXwi7UKWL+/CHC
	3BXBX594E4ZcXecDSxSLwepp3MvEORl+syJG2G3Hq/ShrpAfKxlRKydc31a6+SC/xLhd65V0iigQv
	gMg+KFKH2Z456W/gGAqiOSZZFp15Awh+0E+FpMzwd/9r918xpsRrsaRNaTl/jh24CkyFl84FHLXir
	T4yW0xi7NrtTar9GIaaqPj/Wwekx5DAeY7v4Un2HAzs5Mk1bXr2Npsif/4VAdMNm9avvVzrYO+8J7
	d8XdOFpa5O3egNamvFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXVQt-000OLv-91; Thu, 24 Mar 2022 21:55:51 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXVQq-000OLC-3S
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 21:55:49 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so65633767b3.2
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYEqzUc+Pfapc4sMxwo+uOeq6PIucn41FGvHxchecZ0=;
 b=HZps2ZYckW9+s+dZVBppLITFilmdg0uztmxSO6VBxpQelLhSo1kSQvuwmElCAsa/Av
 AzNrT8YOoZ0mPfm+73jfPjtGXVkzaheXaLtAvM17wSG59+XmiDLgrzJPffmb22jKUjdH
 86on4V9maDoznHGbNEpRSHctdMgU0NZb9LCm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYEqzUc+Pfapc4sMxwo+uOeq6PIucn41FGvHxchecZ0=;
 b=JQSp20ihQoWbw6Oe4FECbzcjyeRvQvHwkExZ4VprMtXZOQD5xd3mFKeuv8uOo9IYOJ
 v69bysepiRgR4kaN6k/dNPt8vc5FJhjWmngY4HFSX0OkTm9/o+Bzw2KR3MkpohNFFFGb
 Reg1HjJIyu40CkCJGYlN7PWHSWti/sw0Z/54pvx3cwGt6cTj1AYXL5NMTMLRA7SrAZT/
 wnldwfgAB2H726jhvf2S3vYVcRaSTMyc/PMJGT2A7k0Etm/HmDQfMkE2h+5n2DoHA4wk
 FElnvQ8Dt0009dQKxH+cK/AeRVoaCT/gULhduEWM0Fr30mC/acq5G2XrpYlOljBIYivc
 Q2Zw==
X-Gm-Message-State: AOAM533oO1vr3OBt9SIpU+TqfU8da9dgT//yYGJU/cOqRtoADH3bQN7r
 aRDZw9bmBZpL+ecRZKRLthXXM/ipvYp6QtD50cI8
X-Google-Smtp-Source: ABdhPJxD+GUsGNXibUCwg+DiidjDutjxpfHR4zXGd9TrBGye5hH5lSXva7IIQYzSLvq9G6KqLxNIlJLThsJIySDhokA=
X-Received: by 2002:a81:843:0:b0:2e5:d91d:3e2a with SMTP id
 64-20020a810843000000b002e5d91d3e2amr7212799ywi.443.1648158946375; Thu, 24
 Mar 2022 14:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220324053020.606637-1-apatel@ventanamicro.com>
In-Reply-To: <20220324053020.606637-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Mar 2022 14:55:35 -0700
Message-ID: <CAOnJCUKbP5VEXcauvuY29BcbSZ0YXRtjJfNarNyPMN=KGFKXRA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Enable profiling by default
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_145548_229101_F3E091E6 
X-CRM114-Status: GOOD (  13.57  )
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

On Wed, Mar 23, 2022 at 10:31 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Let us enable profiling by default in RV32 and RV64 defconfigs so
> that we can use RISC-V PMU drivers on various RISC-V platforms.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> Changes since v1:
>  - Enable CONFIG_PROFILING instead of CONFIG_PREF_EVENTS in defconfigs
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f120fcc43d0a..bfebee46784c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PROFILING=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8b56a7f1eb06..2b68b1bd2559 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PROFILING=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
