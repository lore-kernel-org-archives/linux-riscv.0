Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF6CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 21:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnrMAC+xexgSwgroaMHKvn+gz/OI2PZcqMI5mw4dFE8=; b=NRYlVP0TUQtFGJ
	LPZ09HdQIrmtV6qy6RAwQ2EjJqRU5wIk/6r7yGeQffFzfU03EiZPQzlD4GA/wJhYsZk4b2OQAYlW0
	RHCHI1mrxP+sytjo2/EGswfgD0nUyu/MhPSyO+Bud3mvvwhv6+j258sWjbrN0oHeIic/A8CMsmxm6
	p6Gwe+o7/kW1isoXubPX/JiuzZcDmK1yuGFDJjzd086ZzIRvqnwR6q3qRXfNTACrOA7PtqqwisgjM
	yxO9ebMclhvN0F2yYDuCo+qSeRqE0Mdi1iAk40M6zAi/fNvQi2vHWto2FYs48HIS6DF8boC2afegU
	ufhT/MbB+8rFkx7kdgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nheAQ-00F0Uu-Vn; Thu, 21 Apr 2022 21:16:47 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nheA7-00F0Qf-3Y
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 21:16:29 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ec05db3dfbso65896787b3.7
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TBOLYdFLXPu73TVN7CymFowM0QIrUj97zla05FMsFmw=;
 b=X3/DiqjRlQU/pF0tYaTzm6xYDxBl9BJtrdHnRKE13u1Wz2URA7HF19ckJ4zY647Qvm
 6wTQcD6ddhubt2kFOzm9no+X1AlTHyHDDtrC9T6TSxQo4GUjadqSGOiqm1IoicWf53Wn
 sC2JBvaICqD2kCfdIapD1e7pAPqkl51MTFGVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBOLYdFLXPu73TVN7CymFowM0QIrUj97zla05FMsFmw=;
 b=XUJLVmfd/sNqG7kj3vO5SLDyeVf+txRl2a+2PeSIONyGIULvHD1M7yk4uVTjoCdxvE
 xHKgubxXu9enmDnQ6sokdDbLD5SKT8E33tyNwPZEweyupj6Qh18RVlesSdseUuOQtRzS
 7zfHnRFg/9JqmzZjlvNgMn4lxRsxWVEhlybyNDIZJC1C9N6mZZnfucuMO/Uys9ExTjaK
 3/0ZYGV9KrThjo+fZWfJWaYGdCD8hLKd87wxOAry/HEcSypky0Z/Xudt5KR0SZnef1Gx
 8iiS9S2BaCJj0+b9il8LQcJcqiheHoBKHiiOeCpIMCBDki1EIpdwp6zE/UCYk8Nw4PPo
 P57w==
X-Gm-Message-State: AOAM532SsmI1G4L6x3CdULuQ1rXEsQjnERyVSDmGO8z/XbmWVtA61dws
 A9KgKgSYzhfDTHMUwMciO1uTRlDUBMtG/XbfC+jP
X-Google-Smtp-Source: ABdhPJzFo0EHc3hgRUGRSf40BDuaLTDCUGRjMcvgkSfCbwsEa0mAJD3OVPnMyv3BFEcQCEs3N1OuASUGW0KklcABQmg=
X-Received: by 2002:a05:690c:16:b0:2db:cfed:de0e with SMTP id
 bc22-20020a05690c001600b002dbcfedde0emr1788900ywb.271.1650575780073; Thu, 21
 Apr 2022 14:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220421170354.10555-1-palmer@rivosinc.com>
In-Reply-To: <20220421170354.10555-1-palmer@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 21 Apr 2022 14:16:09 -0700
Message-ID: <CAOnJCUJp3f2v_ZOy_YxrGOWu-E0k-NZMvDuiP4NykaT0H5nBrw@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: Only default to spinwait on SBI-0.1 and M-mode
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_141627_356133_51A7E668 
X-CRM114-Status: GOOD (  24.05  )
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

On Thu, Apr 21, 2022 at 10:05 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The spinwait boot method has been superseeded by the SBI HSM extension
> for some time now, but it still enabled by default.  This causes some
> issues on large hart count systems, which will hang if a physical hart
> exists that is larger than NR_CPUS.
>
> Users on modern SBI implemenation don't need spinwait, and while it's
> probably possible to deal with some of the spinwait issues let's just
> restrict the default to systems that are likely to actually use it.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This seems to be the source of many of my new hangs when trying to test
> the NR_CPUS=512 support.  It's not really related, just fallout from
> testing different setups.
> ---
>  arch/riscv/Kconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..dd5e975abe37 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -359,7 +359,7 @@ config RISCV_SBI_V01
>  config RISCV_BOOT_SPINWAIT
>         bool "Spinwait booting method"
>         depends on SMP
> -       default y
> +       default y if RISCV_SBI_V01 || RISCV_M_MODE
>         help
>           This enables support for booting Linux via spinwait method. In the
>           spinwait method, all cores randomly jump to Linux. One of the cores
> @@ -370,6 +370,12 @@ config RISCV_BOOT_SPINWAIT
>           rely on ordered booting via SBI HSM extension which gets chosen
>           dynamically at runtime if the firmware supports it.
>
> +         Since spinwait is incompatible with sparse hart IDs, it requires
> +         NR_CPUS be large enough to contain the physical hart ID of the first
> +         hart to enter Linux.
> +
> +         If unsure what to do here, say N.
> +
>  config KEXEC
>         bool "Kexec system call"
>         select KEXEC_CORE
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
