Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CF0C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 05:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rx+B5JnPQxDasBv+T/P5cOcdQMXLdsvDSOZapHBUXjM=; b=O3wQLCoqMYUXN0
	rmfpIiNJ4iJm24yFW5aMzmU9jXujAMLY+yN6T1X2hSzaH790tWmIczKD1Pw/67Hu25LeatvZK9LxU
	y/GrB0gEEprlez7phqTu+qCcZZY6YK7Bp+g5fpt5x2sUwh48McNNQcAhHmrZ5KeAArJTOTr6sBf7A
	Lv4glMa56BWK6seR7Oi50rqCLjOFST8PMkoByxocC+IR0ZchYr7JiaahvjxBX5FUU7clWj78+FCaV
	JVXpGpbdSJB1ZFvT2p2Dg8auqNlXv5/QxlQbfkgKDRhCzuMINbcwCpUn+6FNXU796ldeU6l33KUdo
	/APR/Hny2280zPgLcOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozAMV-009hIz-2k; Sun, 27 Nov 2022 05:37:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozAMR-009hFQ-0a
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 05:37:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id i10so18631839ejg.6
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 21:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3KmLRsY6EbWCmI5X/CBpgkjwnWpgkXgjDD4h7S5TYCk=;
        b=1p2v7B2RsFmkYAMqlgRvDlJHOfwtDMLCA3HO2KsSpfQghuwklX4irNM4a8lt3sacrq
         8lAxQb6BkH/xPrwi5+neRY9TqzqCZ/+iYOykkPGl66jY/tuPXcgSHpLfegBQJWIjbECX
         Yi0CqjuIvD+Us1Zzjm9NfXnJNaxRk/oJ9IrOxMLa+b0PDsXv/gqTeucSRCpYF0Si2m6L
         VSEVC7BkXHewNfnXsttQxkIRXCGdYhNgMJ+NuGrh0doAdd+qfvLu0ZgXdV+KePBoz3ZO
         YmT6ZvTTEcUodEtQXjAjU1Ef1993Z7e67/O8XLe3vmFbCk0sRHcHHxbkJ8Mruo2uhObB
         LYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KmLRsY6EbWCmI5X/CBpgkjwnWpgkXgjDD4h7S5TYCk=;
        b=XUVn3bXJWKhhRdOO3luQMcSYl49ytdywCfKrJjXS6CiGUgFheMA7HCiJp99Ye6uU7w
         ON+4vrfjUzS70bpHniN2ci0wb+6kLuX9S4GuiWjWFNrr7JgsuwlP3FA2xvgjLlSFoycL
         0QPBavdeICgis41yKl535a+jT3areYMJS8TRfjHUoJ4KeXPTuMZjA4+Wl8k8PT8bvc4M
         dWj0SeniSdeHzZKW5gf63wlPL217yvKg1N5i1e+BaXaCtSdBUSj+6C++wZbv5SUJre/3
         fkKikFBFi5v08rrp/YPFo6xSEhDhoiE+WV+Ii4UiQ46OMyNmlWdfhQmQeEPaMKmFPvor
         FA+Q==
X-Gm-Message-State: ANoB5pnZQ2xJs9K48LXMuwZaIwVekuKJGCR+eeo+IdrHZh+3UKtTL1oI
	OeZWiecvGcDXp7teTMRCVRZEtGfBqkcj+HUPR3BnDQ==
X-Google-Smtp-Source: AA0mqf6LzeaQimBGW1kKOub+iapLV0NhxUTpEiWNOIft5d5+94PzEc6kyScrPJvVEp2bUrVArm18SByL8ZSAi8FbNcI=
X-Received: by 2002:a17:907:a044:b0:7bc:27ab:6b2d with SMTP id
 gz4-20020a170907a04400b007bc27ab6b2dmr10678920ejc.750.1669527467928; Sat, 26
 Nov 2022 21:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-6-ajones@ventanamicro.com>
In-Reply-To: <20221027130247.31634-6-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 11:07:36 +0530
Message-ID: <CAAhSdy0eKP-4uvK--N97CDcqq+yemXSzSE1neGhSEeETo6y3xQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] RISC-V: KVM: Provide UAPI for Zicboz block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Atish Patra <atishp@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_213751_301428_FAA46682 
X-CRM114-Status: GOOD (  19.07  )
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

On Thu, Oct 27, 2022 at 6:34 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> We're about to allow guests to use the Zicboz extension. KVM
> userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 8985ff234c01..4bbf55cb2b70 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -49,6 +49,7 @@ struct kvm_sregs {
>  struct kvm_riscv_config {
>         unsigned long isa;
>         unsigned long zicbom_block_size;
> +       unsigned long zicboz_block_size;
>  };
>
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 71ebbc4821f0..18a739070b51 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -270,6 +270,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>                         return -EINVAL;
>                 reg_val = riscv_cbom_block_size;
>                 break;
> +       case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
> +               if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
> +                       return -EINVAL;
> +               reg_val = riscv_cboz_block_size;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -329,6 +334,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>                 return -EOPNOTSUPP;
> +       case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
> +               return -EOPNOTSUPP;
>         default:
>                 return -EINVAL;
>         }
> --
> 2.37.3
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
