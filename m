Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D19C761AF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 03:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2Su7k5oebmJua2Oq908eom5CN3oTrDM5uTBHhn8WAE=; b=p6/drIsndO4V4t
	wq9CSIhIABJpRgEIRPHeO+okJJjVBzdtAN4Fk7vMrOhVOgsYZlyGcZlm7dB31UYiAMzfwDv+D+nlG
	N1x0MtApZY8iSWVq4lc6VFi463a8lk1NHUJ3iD4Vis+N1Zo4396O3PmqsJc6/6hGoFrwFZrYT2J6A
	JxIq1JsyAlMr/l46UDjPdNfZ3qUAxQ5EQ9h6YGFrttvewVz+0dhWi9YkJL/2nLPCyB0+hLlJ/I+2+
	/zgCJoE/R42QBbgrEF2wS6ZxRv0mgT51MXCP867gd/KC68ruklGHN0AEIy0WahTHNqtQFevmFZ0Ls
	lTFq5VHfs6rnzlVL7KtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjNL-002T63-09;
	Thu, 30 Mar 2023 03:54:59 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjNG-002T0Q-2S
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 03:54:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id iw3so16911476plb.6
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 20:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORTcc1S4DbhSj9bYXgbzlVEJUmJSEuJEOt6fEFrhs3I=;
        b=KDkr9GukbLDb5E0cjryjb5Wh0SCZaycf/IUr90YlJNe0yf+CJFbuqVLgseHvC1XTAs
         Mj696hVP3J+/JyxeccnDx4sbyBLoQR8t6nLYlyTiLLcc21ZTbl5DObP3Sn5N4aoPtg5K
         vT05+Dy7pELaLbJ3Jtjg4yd67A4IfUXlaie5LW1NfYlipHOIwyXNtqF0se+FNlmkrAW9
         0bSdtfv+XKaMh8hj340BwSg3B4py1O/ULmxkhI+S+4sADQi7xMUd3Eyip4T50rRfAII+
         GbYAWTbGyTjtff51zxbKYOhiJVlu3d4/NXIx3s+ZSTQbkwQZhq1bYkwIvzgmP/zufxWD
         V87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORTcc1S4DbhSj9bYXgbzlVEJUmJSEuJEOt6fEFrhs3I=;
        b=tHeLL0wRkj3dnRCIfABeRqwcm9d5W2qrp8ldhLiAcBGrMI+I54r5GphxhZiMeCSKcc
         cD78cq+jpt+XHf8b/39CrJzPOzgw+yOnucwPssRhx8Q2mK1Vb/B1CWeBa1Od7LlMEYjt
         VR2TCCpH1hOpwoszGk8VLDDN3s6WmjAbZPnCQkRIYlir4Rpemb6yNIV9nMWDHwbtxR0f
         YArZYqIRxwx7YapcUJbwoZ+Ofcz31BmxtTUmYW6m8Zb/xulEAff4lx2VcqS/lzuQjJ17
         8jF3SHJbzqp14OKqEGcRtWMSJ2Bc4jImMpVVWySFe7O6SX0WF8y04H6wpQ7qEGMQYsN2
         tKHg==
X-Gm-Message-State: AAQBX9cWsbtpRUkJRIbW73OniJ7x3/AhqAyxhyoHFL52aw1ba/zI2Nqi
	hcuoJk8TfafepNKU2Z8WFHqJzA==
X-Google-Smtp-Source: AKy350Z3+wrY9ZgUHedACp4BaESa2FvIEkabhjg74d5bnPV2JCYBYbJoHjnYpjGWoPDBynyeKDWcRw==
X-Received: by 2002:a17:902:d503:b0:19d:1720:3873 with SMTP id b3-20020a170902d50300b0019d17203873mr24981326plg.57.1680148494287;
        Wed, 29 Mar 2023 20:54:54 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090ad38900b002340d317f3esm2154710pju.52.2023.03.29.20.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:54:53 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:24:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 18/19] OPP: Adjust includes to remove of_device.h
Message-ID: <20230330035451.huc3ae2acvgoh4xs@vireshk-i7>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_205454_808970_9672EB10 
X-CRM114-Status: GOOD (  17.30  )
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

On 29-03-23, 10:52, Rob Herring wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  drivers/opp/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index e55c6095adf0..63b126c6215e 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -13,7 +13,7 @@
>  #include <linux/cpu.h>
>  #include <linux/errno.h>
>  #include <linux/device.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
>  #include <linux/export.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
