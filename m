Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6814AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 07:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295C561B1E
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 07:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 295C561B1E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K98r3xpIFOq5SBy7x/7/SEWvqnpxT3/v45yLvAEGyW4=; b=wqk4snzHZWStDF
	oYefNfGB7ap54AII4PE9QcJcf9ge23DS7/g675L9PgQyBVTah7jkP1z4hAk1ddf8QOmPsNyc/6JnJ
	Sa2tDvsz3ZtFQ+ekKqzNfvDXyoz1MiQqq2+D3CSgd4ah4rmwLvhFfKlB3rzSLrDCSd5LLmy9wwz/T
	ZbkdLeaTprl5thezXZIITf9iMozC3dnGgK+Ca0LvdQUoUddBrgsi3qv6+y0OB6EMlZgX1gETQSJmk
	ThdXAXVpcwNR/KM9YTkxHitrnkgV3F8CYHkmgGJz1w1uwTPXBvzRrr0bdgoyvM1c8Txu+sY3ewtwY
	oY6L+JuW5P0Cu6moWXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mncFJ-0078sU-G2; Thu, 18 Nov 2021 07:54:13 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mncFG-0078rf-VY
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 07:54:12 +0000
Received: by mail-yb1-xb32.google.com with SMTP id u60so15461411ybi.9
 for <linux-riscv@lists.infradead.org>; Wed, 17 Nov 2021 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUx9UjZoKSPnqR6g70X7U+S/RFB8dii6mOvb2a9mdkw=;
 b=QdZaVueVf1RI9KAn4GY3zFdazR/X2OmjOrNG3c+p4FkxC1hxvkGmqLSDC5JnkUzGoR
 bJIjgd1N331cufVv26TCQHZiyG8JwYR9tD/2vG9Fp3EtD9lnL7PBKozHyQn83bYGZRnF
 urnmL7ipfX/FGNoOKIm2xoNfRfCgyS6fcKrQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUx9UjZoKSPnqR6g70X7U+S/RFB8dii6mOvb2a9mdkw=;
 b=2aw19XwI847lc+USdugZ+THZTwer5GY3qHwfTje7vd8Epr917lRivHd8msExC/kZLS
 ztJNbomhigHq67bJ5czDyAR/bgQ8gl4JkhUBckwjGpxSI5IQi13tYaJNmOuWzd1DxOpk
 DkmP/QtjuwTtyax8GJ0kEIIgckZgayj06+IOQsvIoIevlidkI4HgPSLGdZuvUl1EG95E
 5mh1YK4b1ZUxO5vf0cuCDkEGT6EBz0QwYEaK7AmFumtd7CjAd1j31VQRrW65WErpSbft
 QCrEd2u8CwuVRfRUM6kYzmCcVoTzOjj9MrQ2bCdxC3c9iuSN6euX0soKio53oUk7/wI8
 ImPQ==
X-Gm-Message-State: AOAM531rX8fU9jVSU7+WwwkhloRpCC1rgUUluTFmOUkAbh9/QLXHRz3Q
 /cFoRkXVToftiMcihRzpC4bdRjEXkAbAHjBE0+1O
X-Google-Smtp-Source: ABdhPJztIGeM2yO42tHG/OmNK597LLtMYpZrWrT/uiP9eI1nHBWCBrDBBYc830E4jWNuw8OZfj6oG/jQLdidDgSgfko=
X-Received: by 2002:a25:b005:: with SMTP id q5mr24987464ybf.35.1637222050369; 
 Wed, 17 Nov 2021 23:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20211117084705.687762-1-anup.patel@wdc.com>
In-Reply-To: <20211117084705.687762-1-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 17 Nov 2021 23:53:59 -0800
Message-ID: <CAOnJCULQJj0ZyyF+Q1cogXsC9GDQKLTms8vHvNNpj4aHntmx6w@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a
 module
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_235411_043183_F52BF384 
X-CRM114-Status: GOOD (  12.93  )
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

On Wed, Nov 17, 2021 at 12:47 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> Let's enable KVM RISC-V in RV64 and RV32 defconfigs as module
> so that it always built along with the default kernel image.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v1:
>  - Rebased on Linux-5.16-rc1
>  - Removed unwanted stuff from defconfig PATCH1
>  - Dropped PATCH2 and PATCH3 since these are already merged via KVM tree
> ---
>  arch/riscv/configs/defconfig      | 2 ++
>  arch/riscv/configs/rv32_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c252fd5706d2..ef473e2f503b 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 434ef5b64599..6e9f12ff968a 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
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
