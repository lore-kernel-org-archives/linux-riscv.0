Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76BCC77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LrT5XQJyOggpUahgbQiYSkuvKKWsK+KK1faWEPF4tyE=; b=pN8Xo8DhW0Iqnjyo6pi5E9H6MC
	AxerrQFsAzgDg5yVMVxyVXQ6h8Kpa6lFZippt6LS9Eyq0RKMXSMUkmx8vUMDI0CO5FchgiPS5ntpn
	ANE9+Ld3lijphZQAAoE00U4LtBb7QVA8A2+gelwwIrgih84066/fVDE9IiGwEDQRDkMMDlF6iaqO8
	TYsGzB1VgK36kL8xmcFPyG+Nfcn0DywnNsnNKO7bjYEjP7mw+GVtjh9dYflYn82X4dcbQejI1ox+i
	oKDFRHUVhGoGfv6+Z46oHRXhWtqaqGxqEz4oe0hB/01lWz/eiwnd2jqUnAFxOcZh5GGkRQuypxYoS
	X52H5rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pspFg-00CzzH-0e;
	Sat, 29 Apr 2023 18:24:56 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pspFc-00Czwi-13
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 18:24:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64115eef620so19283529b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=osIreuhFqrOaZAAl/27+IK5Hi1AB1StDT3MQB4UJdmyvLv00XqfYnZDOR5DEup+Zbc
         EMMhztAPOHm+IIUb2Jko/Ql1Qxequoi14q5q6ioXxwV6ONNbTHbCpppQsquBotBv7NZA
         0xsoGYgWKOy6+E6yOM0QJd1lS7m7Gz/d+GxIdfE4O363XFxvr58OuzUA8yahfjRkgl76
         daFFl6DyngHfFxsVeUlgdYpwovv5SK9w21aq217ZLhFo3Y8jm5Njv+T6oNvGK4lJj/ES
         nDCkxSdKHcKkITKghp2NRdG/dKj2tCryrSlZDF5O3eK56lzP0kExP10+gizADZGE0dho
         uu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=PjbErRDzcFxL4PucCK66Q9fC0/Eyp+xBWTxd95o5AjVtMLIR4bJlPv0z1u+878SfZy
         E4yluDSwZP6Z9oq3S14i5N8lRsDfeO4PJ9o40rZ3ZCTbbI+rPyrjNHetWknvNOxevEPB
         vxtJufrl86UVdbD+mgGefw5J8P/fvqe7vQqlAFRd91/CsHUkXxkz87qgKsY2JJkGm6mn
         RbAhfEVAtiyY9TwSPhPkRBvI6+U4vkRE0HMtArhgSHqYofSrZEsXrZabLw4YhEMnNISs
         rzOgGZ0nbfSul8S7lTxLAb93WgRvLIsl8QV0JX0L0gTYR8An80CXYBjeJ8tahDUYyjHh
         zqZw==
X-Gm-Message-State: AC+VfDxWg70DHAPcHRe9uet88eSDKXf/MPI9BPY23pj0iddziWlVfoN4
	QAloxPj1HLzJ7WffLMs6xAK8Gg==
X-Google-Smtp-Source: ACHHUZ56+SNdXMph8Hdac6/dfoFg0Vhv/AYaUOOmwxyPYiHuY8kgDpOram8U+gPi6EA5PyHcO2u8+w==
X-Received: by 2002:a17:903:41cf:b0:1a6:d0a8:c70f with SMTP id u15-20020a17090341cf00b001a6d0a8c70fmr11307108ple.5.1682792690325;
        Sat, 29 Apr 2023 11:24:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001960706141fsm15126026plb.149.2023.04.29.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:22 PDT (-0700)
Subject: Re: [PATCH 08/19] riscv: Add explicit include for cpu.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-8-581e2605fe47@kernel.org>
CC: davem@davemloft.net, robh+dt@kernel.org, frowand.list@gmail.com,
  linux@armlinux.org.uk, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org,
  daniel.lezcano@linaro.org, tglx@linutronix.de, amit.kachhap@gmail.com, viresh.kumar@linaro.org,
  lukasz.luba@arm.com, amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
  angelogioacchino.delregno@collabora.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  thierry.reding@gmail.com, jonathanh@nvidia.com, tiny.windzz@gmail.com, lpieralisi@kernel.org,
  sudeep.holla@arm.com, agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
  anup@brainfault.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, Marc Zyngier <maz@kernel.org>,
  vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, sparclinux@vger.kernel.org,
  linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
  linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
  linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-3fdcd7ba-9d00-4521-a55f-367cf53f5f12@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_112452_365082_31FEAFF7 
X-CRM114-Status: GOOD (  18.06  )
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

On Wed, 29 Mar 2023 08:52:05 PDT (-0700), robh@kernel.org wrote:
> Removing the include of cpu.h from of_device.h (included by
> of_platform.h) causes an error in setup.c:
>
> arch/riscv/kernel/setup.c:313:22: error: arithmetic on a pointer to an incomplete type 'typeof(struct cpu)' (aka 'struct cpu')
>
> The of_platform.h header is not necessary either, so it can be dropped.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 376d2827e736..dcfa4b6fa4b1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -8,6 +8,7 @@
>   *  Nick Kossifidis <mick@ics.forth.gr>
>   */
>
> +#include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
> @@ -15,7 +16,6 @@
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
>  #include <linux/of_fdt.h>
> -#include <linux/of_platform.h>
>  #include <linux/sched/task.h>
>  #include <linux/smp.h>
>  #include <linux/efi.h>

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
