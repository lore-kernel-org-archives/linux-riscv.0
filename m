Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD393C74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 03:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asQCBV7xLMR4buw4a1G36T+5HHpOeP3D8OC0Gz5bu9k=; b=FxVsEvO2SVcs8f
	NWXr7vDjxlSkcdUmy4PnLikCVhmImJqutd5ecD7A23JXEskM2ZcCo9Bt5toi618IMsFmbt/t5+f8i
	OOPYJJkLbxsA6cr6EpDb4YzBrI6uTHZRStSAepRsiRjlxojDBen94OPey4Xf9M/bdCFk8YhgKH5Cv
	8CE6TsV9QwzSRiSGArV2I4rh4STaSURNHKN/COm7qWVJKvfhO7l+0rKzwGF9bXjURwFysX9sbDDJi
	p/sQEJhL/z+lgiunIGmFgOreOjb1mFUYBEdmDWARbOXTYsHAXVNDrvjCKnoQEh9Zt2sF6rqXmrQy3
	31onKvDKQnb4Q1FBf6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjN1-002Syh-2Y;
	Thu, 30 Mar 2023 03:54:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjMx-002Sx5-36
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 03:54:38 +0000
Received: by mail-pj1-x102a.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so20715336pjt.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 20:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rif9SVht3Xq5rHKwiENZowsz+awWs141IU0VAwjN1vg=;
        b=fV9FgxnApIXbe1N5pM4jjR9lUZGUI9IHgwkMnRZ43spPTOEuCOBgE6jom5YYd5NaSw
         hO3BaFodAmNdmeJnu/2X1bnm5xCDXutVF46Q4qkwiWvp0QD7VT2G+FS8VK6si5hM24E1
         cmhd1+iI264Fr/t7n/mmHq+QUCu9AJBXrHRE5NMw2hhSYMEgz0n/xxhnwIpLUx49DXMe
         3cXje5lTdqWVmeRk8+mxVWjAALckaFIQEvLAfdbfPdG7pkmLiTnNEoZXurcL3Sjcbenu
         TxKvKkOO0B7xmXzmAWEmob+khrROpJZhtq4GhLIFBe54WEv6nH0q1+rtBdjUdUgdh/Qs
         KpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rif9SVht3Xq5rHKwiENZowsz+awWs141IU0VAwjN1vg=;
        b=AsERuZ0myvrgof6zB9arckl7HRHtTvGrApo7+uMt+eoqcPkT4o4OvK9NaRt95mis8L
         RaZyUS74122IoLyACVu+BD9mAk7yXn7nEFpv0cQoFmfDy4SQiOaUTeDp8tYMzxNdT0hR
         RSmdHISPZtbnifr4RXhvgvbig6rIweQmedy8Q3CwlwdmrJZ9adKinMdvzPi3R4gzOSE2
         eu3eTPXbezAS9VIu3GsnE9sNKRM8Td2j7HHFrgYGqQr8AWIaP5LvTpnk6+YeWrt7bzGq
         52L5Q48UXDZprPbPUY+JiIIy/RXBX27DGzfp/gXLvGDLOmXbK7jsBphRxiWEPnVndAmt
         8zOg==
X-Gm-Message-State: AO0yUKXftdugNnQCc7JszMF2yNRoogl5vheCkmEeq74jVFzgyVqVjO+i
	O++MXEF5wByE3SIU6kN/dotYTg==
X-Google-Smtp-Source: AK7set+6CKB9aX3Y+69CYgYb8mvQ9d90t+LT0/3dtpbyQgu7Ff5u0kg7CAes3wOVIzKhF5KBg4AuvA==
X-Received: by 2002:a05:6a20:c119:b0:d4:77a6:156f with SMTP id bh25-20020a056a20c11900b000d477a6156fmr18152236pzb.53.1680148472791;
        Wed, 29 Mar 2023 20:54:32 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00627f2f23624sm20068315pfi.159.2023.03.29.20.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:54:32 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:24:30 +0530
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
Subject: Re: [PATCH 14/19] cpufreq: Adjust includes to remove of_device.h
Message-ID: <20230330035430.z6x3escbvr7nlya5@vireshk-i7>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_205436_031400_C85AA0CC 
X-CRM114-Status: GOOD (  14.23  )
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
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 -
>  drivers/cpufreq/kirkwood-cpufreq.c   | 2 +-
>  drivers/cpufreq/maple-cpufreq.c      | 2 +-
>  drivers/cpufreq/pmac32-cpufreq.c     | 2 +-
>  drivers/cpufreq/pmac64-cpufreq.c     | 2 +-
>  drivers/cpufreq/qcom-cpufreq-hw.c    | 4 ++--
>  drivers/cpufreq/spear-cpufreq.c      | 2 +-
>  drivers/cpufreq/tegra124-cpufreq.c   | 1 -
>  drivers/cpufreq/tegra20-cpufreq.c    | 2 +-
>  include/linux/cpufreq.h              | 1 -
>  10 files changed, 8 insertions(+), 11 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
