Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3284AC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 03:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmXmYKLUng20OI1+VMr6LdH0YGx5m3g5ARM/qpSjMo0=; b=03ZokVeoKvoEU4
	62u5IJTMjK81rt/KRxym0XgokmVx6f4dMbZIVARJEEh79i6cgVgU9+UfLxNlo6VHyZkwY2DG0jBsY
	QNR8MTWtZedgUYzsY1+YqxgRy9XyMACP5jpApBQh2Od7QT4uxNRtC5b5Uo9wHLWi2APiYZZwrXxGN
	Xf6xL5NEEjuSO+1EoP3K1Pvn7pb8QpY2utT370v1qGNgLJNF3/qA+6BVS0InIEA0UbQKqgiogtZQg
	fGF266iFt146qPe5xk4nrQWruRCXEs0hCSsd5jH/pvyF1c1CRknF9T5lsBwaWIiGWs23lG89NGpuC
	FChTK7kDKKcDquu94k4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ1YY-00B7jw-Jp; Mon, 06 Mar 2023 03:30:34 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ1YT-00B7iY-Gt
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 03:30:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id ADF7324E194;
	Mon,  6 Mar 2023 11:29:50 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 11:29:50 +0800
Received: from [192.168.125.110] (183.27.97.46) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 11:29:49 +0800
Message-ID: <ae6ddeeb-81d3-81e5-c6ab-5d728007817d@starfivetech.com>
Date: Mon, 6 Mar 2023 11:29:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Content-Language: en-US
To: Tommaso Merciai <tomm.merciai@gmail.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <ZAJFpKlXPM+riuSa@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ZAJFpKlXPM+riuSa@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_193029_747844_FE807E0B 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, 3 Mar 2023 20:08:20 +0100, Tommaso Merciai wrote:
> Hello Hal,
> I start to play with jh7110-starfive-visionfive-2-v1.3b I have collect
> your series [3]. Now I'm trying to boot the image with the following
> cmds:
> 
> setenv bootfile vmlinuz;
> setenv fileaddr a0000000;
> setenv fdtcontroladdr 0xffffffffffffffff;
> setenv ipaddr 10.0.0.100;
> setenv serverip 10.0.0.1;
> setenv kernel_comp_addr_r 0xb0000000;
> setenv kernel_comp_size 0x10000000;
> tftpboot ${fdt_addr_r} jh7110-starfive-visionfive-2-v1.3b.dtb;
> tftpboot ${kernel_addr_r} Image.gz;
> run chipa_set_linux;
> booti ${kernel_addr_r} - ${fdt_addr_r}
> 
> 
> This the result:
> 
> Bytes transferred = 109443584 (685fa00 hex)
> StarFive # run chipa_set_linux;
> StarFive # printenv file
>   fileaddr filesize
> StarFive # printenv filesize
> filesize=685fa00
> StarFive # booti ${kernel_addr_r} - ${fdt_addr_r}
>    Uncompressing Kernel Image
> ## Flattened Device Tree blob at 46000000
>    Booting using the fdt blob at 0x46000000
>    Using Device Tree in place at 0000000046000000, end 0000000046005c14
> 
> Starting kernel ...
> 
> clk u5_dw_i2c_clk_core already disabled
> clk u5_dw_i2c_clk_apb already disabled
> 
> ---------------------------------------------
> 
> I'm missing something? Any hints?
> Many thanks in advance! :)

You can try the instructions at the link [1]. The branch [1] is
based on v2 of this series, so you need to change the dtb name
to "jh7110-starfive-visionfive-2-v1.3b.dtb" when using tftpboot.
I will send v5 and update it to [1] this week.

[1] https://github.com/starfive-tech/linux/tree/JH7110_VisionFive2_upstream

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
