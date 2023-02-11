Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841FCC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 05:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r75N0GuxsXS4KXuhC4yhXsAIRxbSHOhfmrAquWN83Ag=; b=n/wjE6FEadCtiP
	ziWD/JlKBNXf0cVtHz++yk/WHcpbrzH6yCL1SETmuqQN8U0bxMDA9BLJsXVy149Ow7rfNXO+HcDhH
	22NW9gVUHryyZ3NjpVz+KGKTA5bslwf0+RQF6s0qYghphfERqMFWGZkORn+YdtaRj1YvAqwz6j1s4
	yfwFrQiEtoblITauUoaPpuVy+enIkvU76blFx9pPrDATltEiylwIUZlAG2OsF2GigGVlWUPLtsGGO
	W2SS7hDXykGfGB8qhQm+x0CBeHJIBRc88677HMbgVyiwp0yI1JYSBOR/p3QdZvNX29Vqgbtdu/UjT
	oF9B+I6qEEmu06HNURRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQi4R-008iJz-A4; Sat, 11 Feb 2023 05:05:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQi4K-008iJF-KU
	for linux-riscv@lists.infradead.org; Sat, 11 Feb 2023 05:05:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C53E360921
	for <linux-riscv@lists.infradead.org>; Sat, 11 Feb 2023 05:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342D5C433EF
	for <linux-riscv@lists.infradead.org>; Sat, 11 Feb 2023 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676091897;
	bh=vx537dWCuWMjvfChwJMNP3xJLRIq5Een1+i50RVJ3Lo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j/pgtBWdjqUMbTLI4NEVXVJ0Qu+tZqshNt6ejLtAapLXKJSAsxPCcgqoPokAo4pAj
	 cVIdkqbORPC/4QPVG9NJGdyWFy1j217HvTFYtfascgZCREFLHpWjj2t7X79MxeBY98
	 Gp5yj5mux141MIX5nD4MCIkIQAxFvVR2d70e0/HGA09xqpbl+ue+X+EfeauUX/UJVL
	 KF6f8Mo+2Cy9tNldyPSC0eGgbaXmZtv1OoFm/6PNpI5zsONQUxo4bQ7S8hxt4/VHzU
	 TNZCjw+ta/8EoScL9E4og1h5y4tPhVcxss+PNWjMWBsTJC3wV2Q/Iq2QFhqoNmu9N5
	 j140Tgf8bnMgQ==
Received: by mail-ej1-f50.google.com with SMTP id rp23so20612758ejb.7
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 21:04:57 -0800 (PST)
X-Gm-Message-State: AO0yUKX5XyI48b9QxEa1h6lSRM5ApSmCZSwWdkWsDhEnj/LuBHgYnrtQ
	YIfJXn4IU9bsFNRwg7mRquWX03XRJ5iCddjG/xc=
X-Google-Smtp-Source: AK7set+IZdOsPLqXqGntVrtALu2/8gJICisCV79h70KYSBQ8rmLPWkO7hs117OxLxJs1jwZGgmUt6mljfsAMTwK9ss0=
X-Received: by 2002:a17:906:647:b0:877:7480:c568 with SMTP id
 t7-20020a170906064700b008777480c568mr1919871ejb.8.1676091895452; Fri, 10 Feb
 2023 21:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20230210185945.915806-1-conor@kernel.org>
In-Reply-To: <20230210185945.915806-1-conor@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Feb 2023 13:04:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQfPoqv1Hq14K6Njim7cueiKECJTQ9rft-yPsN+7N5D7Q@mail.gmail.com>
Message-ID: <CAJF2gTQfPoqv1Hq14K6Njim7cueiKECJTQ9rft-yPsN+7N5D7Q@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: add a spin_shadow_stack declaration
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_210500_756600_B3E97B44 
X-CRM114-Status: GOOD (  18.91  )
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

On Sat, Feb 11, 2023 at 2:59 AM Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The patchwork automation reported a sparse complaint that
> spin_shadow_stack was not declared and should be static:
> ../arch/riscv/kernel/traps.c:335:15: warning: symbol 'spin_shadow_stack' was not declared. Should it be static?
>
> However, this is used in entry.S and therefore shouldn't be static.
> The same applies to the shadow_stack that this pseudo spinlock is
> trying to protect, so do like its charge and add a declaration to
> thread_info.h
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Applies on top of Guo Ren's generic entry series.
It's needn't on top of my generic entry series. It's the separate patch for:
Fixes: 7e1864332fbc ("riscv: fix race when vmap stack overflow")

Reviewed-by: Guo Ren <guoren@kernel.org>

> ---
>  arch/riscv/include/asm/thread_info.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 7de4fb96f0b5..e0d202134b44 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -43,6 +43,7 @@
>  #ifndef __ASSEMBLY__
>
>  extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
> +extern unsigned long spin_shadow_stack;
>
>  #include <asm/processor.h>
>  #include <asm/csr.h>
> --
> 2.39.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
