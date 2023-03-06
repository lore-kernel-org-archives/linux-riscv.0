Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92B2C6FD19
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHy2V+3nJzCiLIlQvzEBStHJP3xR/KXqkM2wMMw9jLE=; b=y5PaUKEVTczjgF
	vrzesVjxindrF8o1XjxPsYO2OZqJQ/jZNAOuOOewbIjkLoivRMA8qSdVbZu4zzzp1FpqlF6blQmlW
	LUz3e3fI5pzRDiTH8/IfXc66W05tPrC73Thy95SSardXgsF5YAwAM5JAn/rsmXUxlxtsrUFwFyUM8
	ZT8hchhw7eDPrj+M1NipsnskUerwTCsqbDndXi2sTsiDuOq18CrZ+Bd9epOCmwrOhsNxAgcjKjv+7
	FngCNW/gZtafoJllNW5ZZhf0IZrF+pwR54/TCBV2BenoViEUgFBax/qhcusfJ7H8d3E6lIAUwySNu
	lEezyevKFH7XXeopKsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7z3-00CI2R-MY; Mon, 06 Mar 2023 10:22:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7yu-00CHyw-Fq
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 10:22:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id ay14so32614741edb.11
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 02:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678098126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNrtJRsE6dABDiGSx7TOq0l2sTmEuXcCBgXcO3kg+/w=;
        b=ezBMnHU7JH5JcFgDBHtf0mxNurKzwBRsUBybb11stGQgX3lSqbWsCFXKg2tTP6LJ3F
         UDRS3i/R8NEnxKLFuij+qhSK8oL2k6lPZAzEb4NOa2CPjuhNgJaF6J3Zff+hbNRvVOo4
         kre+grebg40q5JqzhxZ+Wv+5lAukx1xzRS39xm8fNIZM/uJ2BCy5Ia/cojoJvanvaxCW
         rkuqiBaBCWwFyIBaCLTZr8mGqx5jeIq43mLo28v9D0mItwXl2LyF85+Sq23FS+m3whUl
         RBmErGq5/D+HCJGqu7sIlbhzDXSYT4IH5ZHxjukkIfzUXJIlpu9mGVlNf5zZEd+PqNZ8
         2PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNrtJRsE6dABDiGSx7TOq0l2sTmEuXcCBgXcO3kg+/w=;
        b=Chs1BtlwVzqsMNhyPK1nLsUK+/HbC7IpuDHwpS312kImhRqGdo3iKy/Z5aDXT51D+N
         Re+KymFn5qWJP8W5wqSBydPMbBvDSWTHkI9M1jFd3s+8iBXRhNWWTBO/rkjA1SdPkSEJ
         HYkxrRFQNJovaqyMBZHTJoUXzoRXiX2N3aog0uq+nwsb9f2NtzS45jrmfKUsm+pH3tSW
         2tIttaWOF0V9ZuFt1vG4yi1dqUqSYvEoCmVaVRmM3Z/RXu//PFsX0NsX1AYIwjwMXPpv
         xvaoW28xazrzs5eIJDJnrdIMcRUoPWk37tWw03uL0rGwZuv+OPm/Pe2lZW67Svo3y+9p
         NFnA==
X-Gm-Message-State: AO0yUKWkoGE3clwk4ZPjcV7aoCbt4FBFW0MyQ2fYZuRgsrHDMttTWpEp
	PPDMjVNQfrzwqTY9aEY7DyU=
X-Google-Smtp-Source: AK7set+wUbFY7M3phB1lHjhvXIcWTL9OvRGQa7H3Z9KE8O9kqk1OJeI8bwA6WpZZUNlsMFGzAfmjhQ==
X-Received: by 2002:aa7:c1c4:0:b0:4af:62af:460a with SMTP id d4-20020aa7c1c4000000b004af62af460amr11197692edp.8.1678098126517;
        Mon, 06 Mar 2023 02:22:06 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-172.cust.vodafonedsl.it. [188.217.49.172])
        by smtp.gmail.com with ESMTPSA id se18-20020a170906ce5200b008d6e551e1bcsm4366449ejb.2.2023.03.06.02.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:22:06 -0800 (PST)
Date: Mon, 6 Mar 2023 11:22:03 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <ZAW+y1CLMV7cJT+p@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <ZAJFpKlXPM+riuSa@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ae6ddeeb-81d3-81e5-c6ab-5d728007817d@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae6ddeeb-81d3-81e5-c6ab-5d728007817d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022212_554093_26E926A6 
X-CRM114-Status: GOOD (  21.48  )
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

Hi Hal,

On Mon, Mar 06, 2023 at 11:29:48AM +0800, Hal Feng wrote:
> On Fri, 3 Mar 2023 20:08:20 +0100, Tommaso Merciai wrote:
> > Hello Hal,
> > I start to play with jh7110-starfive-visionfive-2-v1.3b I have collect
> > your series [3]. Now I'm trying to boot the image with the following
> > cmds:
> > 
> > setenv bootfile vmlinuz;
> > setenv fileaddr a0000000;
> > setenv fdtcontroladdr 0xffffffffffffffff;
> > setenv ipaddr 10.0.0.100;
> > setenv serverip 10.0.0.1;
> > setenv kernel_comp_addr_r 0xb0000000;
> > setenv kernel_comp_size 0x10000000;
> > tftpboot ${fdt_addr_r} jh7110-starfive-visionfive-2-v1.3b.dtb;
> > tftpboot ${kernel_addr_r} Image.gz;
> > run chipa_set_linux;
> > booti ${kernel_addr_r} - ${fdt_addr_r}
> > 
> > 
> > This the result:
> > 
> > Bytes transferred = 109443584 (685fa00 hex)
> > StarFive # run chipa_set_linux;
> > StarFive # printenv file
> >   fileaddr filesize
> > StarFive # printenv filesize
> > filesize=685fa00
> > StarFive # booti ${kernel_addr_r} - ${fdt_addr_r}
> >    Uncompressing Kernel Image
> > ## Flattened Device Tree blob at 46000000
> >    Booting using the fdt blob at 0x46000000
> >    Using Device Tree in place at 0000000046000000, end 0000000046005c14
> > 
> > Starting kernel ...
> > 
> > clk u5_dw_i2c_clk_core already disabled
> > clk u5_dw_i2c_clk_apb already disabled
> > 
> > ---------------------------------------------
> > 
> > I'm missing something? Any hints?
> > Many thanks in advance! :)
> 
> You can try the instructions at the link [1]. The branch [1] is
> based on v2 of this series, so you need to change the dtb name
> to "jh7110-starfive-visionfive-2-v1.3b.dtb" when using tftpboot.
> I will send v5 and update it to [1] this week.
> 
> [1] https://github.com/starfive-tech/linux/tree/JH7110_VisionFive2_upstream

Thanks for your help!
Collecting your latest 26 patches from [1] I'm able to boot the board
using cmds suggested in your link [2].

In particular I pick the following patches from your repo:

11934a315b67 (HEAD -> visionfive2-minimal, tag: visionfive2-minimal-v4, origin/visionfive2-minimal) riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device tree
c246291ed2d0 riscv: dts: starfive: Add StarFive JH7110 pin function definitions
53c360e87ee8 riscv: dts: starfive: Add initial StarFive JH7110 device tree
e769528b7cd8 dt-bindings: riscv: Add SiFive S7 compatible
1f4c7408d02a soc: sifive: ccache: Add StarFive JH7110 support
cd1a430b56db dt-bindings: sifive,ccache0: Support StarFive JH7110 SoC
96fcf2e390d3 dt-bindings: interrupt-controller: Add StarFive JH7110 plic
542c43452e08 dt-bindings: timer: Add StarFive JH7110 clint
2b1bb27b0cff dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board
328cac9205d2 pinctrl: starfive: Add StarFive JH7110 aon controller driver
dd082f89c4fb pinctrl: starfive: Add StarFive JH7110 sys controller driver
aabf6ba76b81 dt-bindings: pinctrl: Add StarFive JH7110 aon pinctrl
f2c5025c54f9 dt-bindings: pinctrl: Add StarFive JH7110 sys pinctrl
7601624bdde0 reset: starfive: Add StarFive JH7110 reset driver
b1a2db0b97f4 clk: starfive: Add StarFive JH7110 always-on clock driver
0b2aaa26d5c8 clk: starfive: Add StarFive JH7110 system clock driver
2959b29a7d80 dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
cfb65ad0957a dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
f9df80901f49 reset: starfive: jh71x0: Use 32bit I/O on 32bit registers
c9400fc69d3a reset: starfive: Rename "jh7100" to "jh71x0" for the common code
8f05fdea85cd reset: starfive: Extract the common JH71X0 reset code
28f5efaa3b06 reset: starfive: Factor out common JH71X0 reset code
aa82ce33f593 reset: Create subdirectory for StarFive drivers
fb87b93f6aa8 clk: starfive: Rename "jh7100" to "jh71x0" for the common code
d73e36277d5f clk: starfive: Rename clk-starfive-jh7100.h to clk-starfive-jh71x0.h
04611bf6db16 clk: starfive: Factor out common JH7100 and JH7110 code

Hope this can help other peoples that start to play with
jh7110-starfive-visionfive-2-v1.3b :)
Thanks for your work!

Regards,
Tommaso

[1] https://github.com/hal-feng/linux/commits/visionfive2-minimal
[2] https://github.com/starfive-tech/linux/tree/JH7110_VisionFive2_upstream

> 
> Best regards,
> Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
