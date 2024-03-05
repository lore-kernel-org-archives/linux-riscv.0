Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AADC54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 08:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aub8Ox6KrW3Vhty1WLiz29vQ3P1b0paoANIwShw2JTM=; b=lLOCZWXEzXrl3OueIRL4sifzAo
	2w6OtRWFQmANkCQcXQaOPpNiD9EhxaNj7IRn9WvEx9Rd+26EfmcAPO2cj8+6Y7icGDXw0buiaVmIT
	6PNiEHxntWL2ZqcUZBIpBhlJidwPEolMT7MzvbZY0XB1GE6UaLDuLbouAmjAvzdXYYj7t/5o3opXD
	QRPFXrvHzXVekBOc0ytKJxPLfHny6TWIocZafNgj2IVPx0DECfBapPdzjGHKnOUSmQG6Gduh+WikT
	SqhMa1ZeacJRbEWPkGzlyEmI/wTUXjHX3pCtJDcJBF8iZw1ScpBzeIBxoQVHABNNFF1bUV+Y49S6j
	0/RfFt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQ5G-0000000CbFG-4735;
	Tue, 05 Mar 2024 08:23:34 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQ5D-0000000CbDC-3jvZ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 08:23:33 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6da9c834646so4864728b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 00:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709627009; x=1710231809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1g27t8FIKz+8joX7Ftwg5jvloiAU4fC8Iy9tYf6ghx8=;
        b=iuP3dp3sFaQf9Nph5l9+IrAHYhMR0MCu8nxZmp3GL1ALqQH4znQqwJeNCwxAUx8Drn
         y+MboNLbzHMlaLnTiP7cXsz6y4kySOniFZmqfmSVNiV+zc2w0YovNDB23CD5YJOU0vZk
         0cLd5+7JfZ0BRtlSjq1FVkx0E9Qag4VdIu+2XzTw4KIWWKIxchLJ+BykQhIRx5UlVL6d
         75EHbNIuAUZjQ7SA5xhH0AuO7kjid8HhA/dJohptRFeCoboQd2Nvd04JgrxjHEDHonbA
         f0hhjHrT4+HYqxOblAo1nhmmPsqE9Ly9Tq9JBe/orjN1rZeGY501XjPmAi0cUb+KgcZg
         JzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709627009; x=1710231809;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g27t8FIKz+8joX7Ftwg5jvloiAU4fC8Iy9tYf6ghx8=;
        b=IQ+ou/biQDFqS4Hpf7lGFA1z+qfBm4P4XLARy8vmvDNJyyXIfNFkmGdr8F89Z64fDR
         F2ePgPKqDvQTgJbjvV9qCryFW00tHfGPqUZcqIVQDs0iaIBd7GWz5xghh9Q/21nFR3w+
         5NeEsrwxJca0l9RW7SXyteHR1GKXqx2xS3LIpq9nOJue7bsvezYD3/g+HuEBWFxJ9o5A
         oHRKA0qtccbGmq+SgwhFUT8EQCEd343At5LBDoWYf4Cxd5MqT3OZzht/tYn/CGuirpix
         B9lfvLPqSHr/m576zhUWv1FzlNFjlEVz8GuZl+TMzWj/0QLKcgtGIkJtorobg+BgX/Wa
         3gZg==
X-Forwarded-Encrypted: i=1; AJvYcCU8FLwwcAjBWGLoDnVrzx4MuoybCfB198YMaPlyq1jBQEuqDCWdBsl0NWbs9JOuKe6HrppLli6+qkUrh4RaamDPUr+0z3oN9LiYpVsSbbQg
X-Gm-Message-State: AOJu0YzA7dja003HFvKOkRmBmVFRaR/Ca6z0eBQm9xEAwPrPDTW74quz
	oDF6LcIuJeM9jW1LEvfjzRMCTrPi9Px6no0RCO0MrPwg0sKYze/t4pw952W60uQ=
X-Google-Smtp-Source: AGHT+IF9SKk6a4cMNQbrF4DFhdgx+5PiAEPa+d1ZvTRbePz3trVKCB/TlEEpEu54Ag6zLp5U1oxZjA==
X-Received: by 2002:a05:6a20:d486:b0:1a0:efd0:b183 with SMTP id im6-20020a056a20d48600b001a0efd0b183mr1640050pzb.44.1709627008927;
        Tue, 05 Mar 2024 00:23:28 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e5d200b001dd02f4c2casm4781542plf.164.2024.03.05.00.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 00:23:28 -0800 (PST)
Subject: Re: [PATCH v4 1/3] riscv: dts: starfive: Enable axp15060 pmic for
 cpufreq
To: Mason Huo <mason.huo@starfivetech.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Shengyu Qu <wiagn233@outlook.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
 <20230606105656.124355-2-mason.huo@starfivetech.com>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <c8b6e960-2459-130f-e4e4-7c9c2ebaa6d3@gmail.com>
Date: Tue, 5 Mar 2024 00:23:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20230606105656.124355-2-mason.huo@starfivetech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_002331_979340_60D474B0 
X-CRM114-Status: GOOD (  21.45  )
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

On 6/6/23 3:56 AM, Mason Huo wrote:
> The VisionFive 2 board has an embedded pmic axp15060,
> which supports the cpu DVFS through the dcdc2 regulator.
> This patch enables axp15060 pmic and configs the dcdc2.
> 
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>   .../starfive/jh7110-starfive-visionfive-2.dtsi  | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 2a6d81609284..9714da5550d7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -114,6 +114,23 @@ &i2c5 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c5_pins>;
>   	status = "okay";
> +
> +	axp15060: pmic@36 {
> +		compatible = "x-powers,axp15060";
> +		reg = <0x36>;
> +		interrupts = <0>;
> +		interrupt-controller;

This appears to be wrong. I'm working on a private tree of OpenSBI, where I validate
all PLIC SYS/AON/STG CRG/SYSCON/IOMUX, and other devices... register reads/writes.
Looks like this `interrupts = <0>` will cause the kernel code (my vanilla 6.6 tree)
to enable interrupt 0 on PLIC, which is wrong. Of course, you won't see this problem
if you run upstream OpenSBI, where all writes to PLIC are permitted. I assume PLIC
will ignore this request to enable irq 0. Still, this is wrong. Can someone from
Starfive take this issue? Attaching the backtrace here:

# This line is from my OpenSBI
jh7110_virt_plic_write: U7 refusing to enable interrupt 0
# After this, I'll inject a memory access (write) fault to S mode

# Below is from Linux
Oops - store (or AMO) access fault [#1]
Modules linked in:
CPU: 0 PID: 62 Comm: kworker/u9:2 Not tainted 6.6.0-gc3eb9993b167 #14
Hardware name: StarFive VisionFive 2 v1.3B (DT)
Workqueue: events_unbound deferred_probe_work_func
epc : plic_irq_enable+0xd2/0x15e
  ra : plic_irq_enable+0xa8/0x15e
epc : ffffffff804650bc ra : ffffffff80465092 sp : ffffffc8003f34c0
  gp : ffffffff816d2290 tp : ffffffd802411f80 t0 : ffffffc8003f3010
  t1 : 0000000000000001 t2 : 0000000000000003 s0 : ffffffc8003f3530
  s1 : ffffffd801eaee30 a0 : ffffffd8bff835b0 a1 : 000000000000001e
  a2 : 0000000000000004 a3 : ffffffd801eaee00 a4 : 000000000000001e
  a5 : ffffffc804002100 a6 : 0000000000000000 a7 : 00000000000007ad
  s2 : ffffffff80ede5a0 s3 : 0000000000000001 s4 : 000000000000ffff
  s5 : 00000000ffffffff s6 : 0000000000000000 s7 : 000000000000001f
  s8 : ffffffff81707af0 s9 : ffffffff80eda688 s10: ffffffd801eaee00
  s11: ffffffd8bff835a0 t3 : ffffffff816d3420 t4 : 0000000000000002
  t5 : 0000000000000000 t6 : 0000000000000000
status: 0000000200000100 badaddr: ffffffc804002100 cause: 0000000000000007
[<ffffffff804650bc>] plic_irq_enable+0xd2/0x15e
[<ffffffff800649e6>] irq_enable+0x2c/0x64
[<ffffffff80064a76>] __irq_startup+0x58/0x60
[<ffffffff80064ada>] irq_startup+0x5c/0x14e
[<ffffffff800621f4>] __setup_irq+0x582/0x644
[<ffffffff80062368>] request_threaded_irq+0xb2/0x154
[<ffffffff8055571a>] regmap_add_irq_chip_fwnode+0x6fe/0x8f2
[<ffffffff80555944>] regmap_add_irq_chip+0x36/0x4a
[<ffffffff8055cb1e>] axp20x_device_probe+0x36/0x114
[<ffffffff8055cce6>] axp20x_i2c_probe+0x6c/0xa0
[<ffffffff8063a8f0>] i2c_device_probe+0x11c/0x23e
[<ffffffff80533464>] really_probe+0x86/0x23e
[<ffffffff80533678>] __driver_probe_device+0x5c/0xda
[<ffffffff80533722>] driver_probe_device+0x2c/0xf8
[<ffffffff8053385c>] __device_attach_driver+0x6e/0xd0
[<ffffffff80531a2c>] bus_for_each_drv+0x5a/0x9a
[<ffffffff80533ba0>] __device_attach+0x78/0x116
[<ffffffff80533db6>] device_initial_probe+0xe/0x16
[<ffffffff80532722>] bus_probe_device+0x86/0x88
[<ffffffff8053034a>] device_add+0x3b2/0x552
[<ffffffff80530500>] device_register+0x16/0x20
[<ffffffff8063bb54>] i2c_new_client_device+0x14e/0x214
[<ffffffff8063d9ae>] of_i2c_register_devices+0xa2/0xf8
[<ffffffff8063c246>] i2c_register_adapter+0x130/0x32e
[<ffffffff8063c49e>] __i2c_add_numbered_adapter+0x5a/0x86
[<ffffffff8063c55a>] i2c_add_adapter+0x90/0xb4
[<ffffffff8063c62e>] i2c_add_numbered_adapter+0x22/0x2a
[<ffffffff8063fd34>] i2c_dw_probe_master+0x288/0x304
[<ffffffff806409c4>] dw_i2c_plat_probe+0x288/0x37e
[<ffffffff80535946>] platform_probe+0x4e/0xa6
[<ffffffff80533464>] really_probe+0x86/0x23e
[<ffffffff80533678>] __driver_probe_device+0x5c/0xda
[<ffffffff80533722>] driver_probe_device+0x2c/0xf8
[<ffffffff8053385c>] __device_attach_driver+0x6e/0xd0
[<ffffffff80531a2c>] bus_for_each_drv+0x5a/0x9a
[<ffffffff80533ba0>] __device_attach+0x78/0x116
[<ffffffff80533db6>] device_initial_probe+0xe/0x16
[<ffffffff80532722>] bus_probe_device+0x86/0x88
[<ffffffff80532b86>] deferred_probe_work_func+0x70/0xa6
[<ffffffff800238c2>] process_one_work+0x14a/0x23a
[<ffffffff80024760>] worker_thread+0x314/0x450
[<ffffffff8002be5a>] kthread+0x9a/0xae
[<ffffffff8000248a>] ret_from_fork+0xa/0x1c
Code: 97ba 000f 0140 4398 000f 08a0 9bbb 0179 ebb3 00eb (a023) 0177
---[ end trace 0000000000000000 ]---


> +		#interrupt-cells = <1>;
> +
> +		regulators {
> +			vdd_cpu: dcdc2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1540000>;
> +				regulator-name = "vdd-cpu";
> +			};
> +		};
> +	};
>   };
>   
>   &i2c6 {
> 

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
