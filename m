Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79723C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 03:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMFB7JA5+MsR7tii1rnC3WaH7/+h/fvz9h/0hR3YBro=; b=vEeds5iftVbjdY
	jbxOOdA17q+hX/73i+hCjjnByiDKNX7DVOsS6V6GZBxseR1LzSEGAuHHwzDdn2aJ43iWeKitzjzAO
	XyLs0eLzIyB0px+6Mzg6VmSBQqnEIL5sPGWWuVen9UTrdAprjU8B4H4iwVgulp5HVscmP/jyHfJLQ
	r2eVI+sQjIrgGjm6T6IcIma/JjXdKJHP0XfA3/v60qjP2RW59qSGpvnBW6uMfXLei+zUA17JuyvR/
	bvo3EDzM7ua1EXlHhCF6sWqFkqb+VIIsW3KI+G1pstJ+2QoJ6VoL4iENQKpUw1oMLMhNsLj88Azc6
	wJI3pFHljX0ZCpaENOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndO1u-0047sT-9i; Sun, 10 Apr 2022 03:14:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndO1q-0047rn-2f
 for linux-riscv@lists.infradead.org; Sun, 10 Apr 2022 03:14:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r13so18235479wrr.9
 for <linux-riscv@lists.infradead.org>; Sat, 09 Apr 2022 20:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQhVZa5zS/cp4cV+errRXLAMnB+DiB4HyYAPMjkY4K8=;
 b=UFYOXOPG9FCkpBR5SfB6ZkR44JnMOZCnPMNEPGolirtBvQ5K8HohB+06K/9nHFwa2a
 Ph+deIvvix/BQHExSvsHrBVJh5/3eJVwlhPZC+jtXBtIdP/mS+7iB2vgMggKu3S63kiO
 x4Z/QwptpNQyCRLDUz0IYLVtM0E1stgu9ufs1Zs4QCdfwW0sQXW7YOtlMyjr8MHK12Im
 oEaKinFIzLptFh64JdAFr3hPeP0rbqADjvC8pLENolThAhE5ljrA2F32Whd8KIjAKvSl
 jqgibbhtcvZxHoDCj/LZaQjhQwkcSh9xylhniCJeSpQei8K+4dDuLGSLb2mZk5vBbMZa
 xEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQhVZa5zS/cp4cV+errRXLAMnB+DiB4HyYAPMjkY4K8=;
 b=ylsqDeSievlDd8L9Ky51/gcfwxOc+fntsG7tHZkRcXPePoMR3WcZLxiOypEa7VzDVX
 lJlNGymQHBM3eUaU1oogFbBl9KxlfCAMWT0WM7ekRWlfACenOYGnsUU7EbTY7xPGAtEz
 5MeXa7EBWfDqOjKbU+Q86ae1pkD/bfwSvsGKCoMtMtE3JtwB5CuJ+j8Az4oYseZEHRlK
 x3EWCZ5JfLimoiM2K4aubhJrV7LA7j6KGgu8LXP6AoL/7JJcN7bb26KqTjHIa9TsxKQQ
 Xog5mHWf9kNrgzTqJmb1Xcknmh33HtFMjaY5VJOED5X16VH/+cTRjh7JrlshK34LvzfM
 qbxg==
X-Gm-Message-State: AOAM531UdsmJU8Z+8LTkJ2UszXmR0gqVRPPUle1x8/UZFYJTY7xgQAC7
 DTXm35vw1S+Zm6RfU85wzEnxrHSR1qCCM8AjnNyGcQ==
X-Google-Smtp-Source: ABdhPJz6wvOSYjEON6CTS085brMf7i9aM1nV/OcdrAV1FXqDOFTBq5x40YE4Gs5+r/euPjtovDTFnNddAHIceO6pOGY=
X-Received: by 2002:a5d:6e84:0:b0:206:147b:1f59 with SMTP id
 k4-20020a5d6e84000000b00206147b1f59mr19852120wrz.86.1649560455158; Sat, 09
 Apr 2022 20:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220409225317.14332-1-rdunlap@infradead.org>
In-Reply-To: <20220409225317.14332-1-rdunlap@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 10 Apr 2022 08:44:03 +0530
Message-ID: <CAAhSdy2090hRn9eS=-NpRVqTHKXYdeed4LORo-sQ-j-eXDfDMQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: cpuidle: fix Kconfig select for RISCV_SBI_CPUIDLE
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, 
 Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_201418_380109_177E87C6 
X-CRM114-Status: GOOD (  15.52  )
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

On Sun, Apr 10, 2022 at 4:23 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> There can be lots of build errors when building cpuidle-riscv-sbi.o.
> They are all caused by a kconfig problem with this warning:
>
> WARNING: unmet direct dependencies detected for RISCV_SBI_CPUIDLE
>   Depends on [n]: CPU_IDLE [=y] && RISCV [=y] && RISCV_SBI [=n]
>   Selected by [y]:
>   - SOC_VIRT [=y] && CPU_IDLE [=y]
>
> so make the 'select' of RISCV_SBI_CPUIDLE also depend on RISCV_SBI.
>
> Fixes: c5179ef1ca0c ("RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/Kconfig.socs |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -38,7 +38,7 @@ config SOC_VIRT
>         select SIFIVE_PLIC
>         select PM_GENERIC_DOMAINS if PM
>         select PM_GENERIC_DOMAINS_OF if PM && OF
> -       select RISCV_SBI_CPUIDLE if CPU_IDLE
> +       select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
>         help
>           This enables support for QEMU Virt Machine.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
