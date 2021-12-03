Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E541CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gt6rXr2Flqjgr2VZxLt2BTergEYPLRWx0oDneNRCh8M=; b=zYqMnHyzCJruVB
	QdgFRPWSrtsUioefaUJYgH5ozDsNlk2oRrrnrCWNIZHzSqjB0jvfVzbtalxl59JoUrETvsMtfVkKR
	LHBfIpm4IG8vtpSNLOlQyoCB/bsR5IvtdW16PIl5CqZnttrcEoakeqLYuL0B544e0pmg78cV38qj4
	ZT3sp2LpD8qe++epH8EIuEhBoLtLoz/g6nZXMtT6P8ozZpABqTbWAjmtygM21iPpRbY5d7CaCBTu9
	rZv25XwNznzOaQVf9el7jMX3BeNgKiKybVH9TdbpM9q+TgCvvSyiAJmJwQga5EZcmjBcEcYrBaCUc
	qTc6Juz+rlZlS59JiZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtBbe-00GYXE-05; Fri, 03 Dec 2021 16:40:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtBbQ-00GYT8-Rg; Fri, 03 Dec 2021 16:40:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id 200so3617348pga.1;
 Fri, 03 Dec 2021 08:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AzSi1tupIbZkFi0UfocPlqtMyRurN+AU97a561lGfSg=;
 b=Zgbr2YIqdOhynKybaNnprHbnokcq2D+tK9HEbPMElZSSk0x6jKzZ+YWq+SwMdxxdGg
 99HBQqOE1MRIGvNs8Bv2WUVSqJW0YREqj3PtTCsIgslRpeqNLQ0tU9QLQ6HwBJ3hDkXi
 uWN/n/JyE7fLMRB7E4WZ9pNfxXf39zd7tPg5rdL8bLkuKzzo7SwaifSBA4CAHcz51qpP
 N9LzPtl9/kuigULaH3eTDzEACUeGbIBoBKJWwThNkM1FzRSX/KqVfeMjNkWHWSHmCqCy
 fzVqyQGMXLReEIgsyfvO0dD8kA63pVNMMVEIyfejUTNpWs2Cti04mfQ3CtPc380vaDLo
 qWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzSi1tupIbZkFi0UfocPlqtMyRurN+AU97a561lGfSg=;
 b=pLMNyMo7CzLv/R3lkolKKkPSDzNNpwIRCwBdN/B9kEFMlXd9TC+IZzi6a5fiKpR6GW
 igeoH/eeS8RNL1YZtsVUsZfvIxkMvObzBngAzta3gKtjdG1322nBfpURwD3/i+mRllrR
 BDoE270iaNEPj8vRVfrZWSZPe70LYVneqOtF340L7QPw+354Bk9LBaclewke2dX8lsdR
 S4VzpMl9h2IfZ80DyM9c4IUnvOZdrq7i35pJdTDBmm9qGnurtXFFyWXtxsPXHtr5J4fo
 xL3aHoIqUT9I5WzD5/s+nQPaUj6Ov5lrU5txUje8iqtwzqcxGwxJSOuZj33ZbV1QFMHY
 dI0w==
X-Gm-Message-State: AOAM531SAfqj0TRiHtCHUvNntqKLJs+RvA3p3I8MEu8AIAokNYZHAE5p
 JkqqemVOqZbAWkXcAhEns3NUaNG+TnTK4pv/YEw=
X-Google-Smtp-Source: ABdhPJybVcL5RCbZQeTQkzNV6CttzUfLqTTbS/hyn00ZF6L5sMQrj+WdKA3v+tcWEnX1SFX0XpcBCt5Bpn1fKZcpeh8=
X-Received: by 2002:a63:b608:: with SMTP id j8mr5102543pgf.519.1638549602519; 
 Fri, 03 Dec 2021 08:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20211203051157.2160-1-jszhang@kernel.org>
 <20211203051157.2160-6-jszhang@kernel.org>
In-Reply-To: <20211203051157.2160-6-jszhang@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Fri, 3 Dec 2021 17:39:51 +0100
Message-ID: <CANBLGcw0-OLMM5H_GGwsWS5J2UZd38aNNrHWke9JkzhSDkNj+w@mail.gmail.com>
Subject: Re: [RFC PATCH 5/5] arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of
 #ifdef
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, hpa@zytor.com, 
 Eric Biederman <ebiederm@xmission.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_084004_922866_F5FBD90E 
X-CRM114-Status: GOOD (  20.22  )
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

Hi Jisheng,

On Fri, 3 Dec 2021 at 06:22, Jisheng Zhang <jszhang@kernel.org> wrote:
> Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to simplify the

The patch looks fine, but I think you mean
IS_ENABLED(CONFIG_KEXEC_CORE) here, not CONFIG_BLK_DEV_INITRD.

/Emil

> code and increase compile coverage.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/arm/kernel/setup.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 284a80c0b6e1..f9a054a344c0 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -973,7 +973,6 @@ static int __init init_machine_late(void)
>  }
>  late_initcall(init_machine_late);
>
> -#ifdef CONFIG_KEXEC
>  /*
>   * The crash region must be aligned to 128MB to avoid
>   * zImage relocating below the reserved region.
> @@ -1001,6 +1000,9 @@ static void __init reserve_crashkernel(void)
>         unsigned long long total_mem;
>         int ret;
>
> +       if (!IS_ENABLED(CONFIG_KEXEC_CORE))
> +               return;
> +
>         total_mem = get_total_mem();
>         ret = parse_crashkernel(boot_command_line, total_mem,
>                                 &crash_size, &crash_base);
> @@ -1056,9 +1058,6 @@ static void __init reserve_crashkernel(void)
>                 insert_resource(&iomem_resource, &crashk_boot_res);
>         }
>  }
> -#else
> -static inline void reserve_crashkernel(void) {}
> -#endif /* CONFIG_KEXEC */
>
>  void __init hyp_mode_check(void)
>  {
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
