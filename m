Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CACC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0WjZ4WZmtAx29YLbJmI9NzjWNCai8sq1hJitDYjtR6M=; b=BcNpQZ6GnWZI0h3RMfA/lRTL6q
	OZsFMsZzlUvN+TAZNF0PxMX3Sjl3gJdo8lXtKK7Ti3YKIapBibm8S8TptwxdylkPTD8ShajYZQus+
	cu5oojwqY7MhbAv/VBWQaqUXaNXZ+3YrRKaXG6ICVCpISuu8TYDLYbUYmKXVmqElIHDYmLfY9xBLV
	WpC0PH2XWNQFvQDrteUz/I46WMaoZ7QkADrRFWWacRFyF1MoVBEJu6CASUPid2JBGQ/q8lVTvOrOO
	IVJiQoh9ZySqqMyI5TGzMou8LQOhr9EcBXOLx5/MI75CEED+QkPD4i/0q6036IRv/MdnF/29SIuf+
	LP0am5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGnW-00B2iL-HX; Thu, 10 Nov 2022 23:17:26 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGnT-00B2fa-AU
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 23:17:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id i3so3371258pfc.11
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 15:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2bzNs4rtiIEWS4hP4fFa/WTzjX0pYcg+YnAfRUDQN0=;
        b=Xw3EpdN3gudzO9w1MQTSqivuHehUg3UFHs7GTJzfjHQuRrFtKgfDnTN5uTaXzTfxoG
         BrsSgabn0RC+9Rjyq1OQJG62qxSd3fOuTEH/MjtLZlI+P++RCJc3yIbi7ZAeaRwzvP6w
         8wyzh4TSPAHmK0q+rmuAB9O7THoPsu1HsTDZcpZVfgIY2SmxqZhk/cc014/nc9M3R5Up
         OuMXLbeH5ZKBofdUsvBIo2tAsxKL3MJ1mqTKCIbDtMQzTtgpP5qUHNR0nDFqI9QbFVKo
         p06DC7abQGdBPjxAZ/lHIVVcFsfnEt5ETNjR56PEHFa2ydVqf2IHnQm6HwHbI53yHuAb
         QgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2bzNs4rtiIEWS4hP4fFa/WTzjX0pYcg+YnAfRUDQN0=;
        b=LuRCrwaeewBD+NTYD9VOb81hInPlSjnzy4NjGgkRpDKzinkVTqw+fLnuiHAdkpVbsU
         QYlT4D66WdVruoiM+mKp7wscPTZi8eylvfJ0AoryM3VFRFORLzqW+SM13Zs9nC/ZcC/r
         M71duqlcE6aDlleY7v4O2pU6MLmwKoB+cOKNOT3+CDQRPPjIx2J+CzEd9BQbedOG/fWh
         BFO5TBhzBXIymBWpDq62Bv16tgy8aD2YBlPnuOi+6WhLkvs9Uqg7u/cLaFXJeHj5qfv2
         q1JQOs3+3n35/fk4p+z9PDR3s7Q6mfvjGpy//jCoBwq7a7NaIZ/k2K1WsVu9wtBmx0Ht
         9aUA==
X-Gm-Message-State: ACrzQf0XmNzyFzwz8wQ97xg8idLhknCdVpSSq9Wz6DJsrkaHIfmxF2oO
	CaygjJ3vzhDuEJP69kMxPA5oFg==
X-Google-Smtp-Source: AMsMyM7fh4Kur0PAb6g0H7G7SKOATz8yhuh3ZZgW15M4GbiGWv0ZqC7iVD85WQJ+IQZgK22mOcu/hg==
X-Received: by 2002:a63:d513:0:b0:46f:6afe:d94b with SMTP id c19-20020a63d513000000b0046f6afed94bmr3775600pgg.72.1668122240093;
        Thu, 10 Nov 2022 15:17:20 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e29-20020a056a0000dd00b005668b26ade0sm190138pfj.136.2022.11.10.15.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 15:17:19 -0800 (PST)
Date: Thu, 10 Nov 2022 15:17:19 -0800 (PST)
X-Google-Original-Date: Thu, 10 Nov 2022 15:14:30 PST (-0800)
Subject: Re: [PATCH] RISC-V: vdso: Do not add missing symbols to version section in linker script
In-Reply-To: <20221108171324.3377226-1-nathan@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev, patches@lists.linux.dev, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-430179a1-e929-4bf8-8f7f-d176215f80a7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_151723_633914_8975D1A0 
X-CRM114-Status: GOOD (  19.21  )
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

On Tue, 08 Nov 2022 09:13:23 PST (-0800), nathan@kernel.org wrote:
> Recently, ld.lld moved from '--undefined-version' to
> '--no-undefined-version' as the default, which breaks the compat vDSO
> build:
>
>   ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_gettimeofday' failed: symbol not defined
>   ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_gettime' failed: symbol not defined
>   ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_getres' failed: symbol not defined
>
> These symbols are not present in the compat vDSO or the regular vDSO for
> 32-bit but they are unconditionally included in the version section of
> the linker script, which is prohibited with '--no-undefined-version'.
>
> Fix this issue by only including the symbols that are actually exported
> in the version section of the linker script.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1756
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/kernel/vdso/Makefile   | 3 +++
>  arch/riscv/kernel/vdso/vdso.lds.S | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f2e065671e4d..82416ebf4cca 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -28,6 +28,9 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
>
>  obj-y += vdso.o
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
> +ifneq ($(filter vgettimeofday, $(vdso-syms)),)
> +CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
> +endif
>
>  # Disable -pg to prevent insert call site
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 01d94aae5bf5..150b1a572e61 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -68,9 +68,11 @@ VERSION
>  	LINUX_4.15 {
>  	global:
>  		__vdso_rt_sigreturn;
> +#ifdef HAS_VGETTIMEOFDAY
>  		__vdso_gettimeofday;
>  		__vdso_clock_gettime;
>  		__vdso_clock_getres;
> +#endif
>  		__vdso_getcpu;
>  		__vdso_flush_icache;
>  	local: *;
>
> base-commit: f0c4d9fc9cc9462659728d168387191387e903cc

Thanks, this is on fixes.  Something is confusing b4, so I've merged it 
using the old flow -- hopefully that still works ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
