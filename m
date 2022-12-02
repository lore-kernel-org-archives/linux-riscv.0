Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3511C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HIn4cc0lUeaP/zxgeGRTDouziKEMbyNT7TE1rYcW38s=; b=Q0r43vt4YJ/9sn/NbL/QXYfKB3
	MV8FZ+QncmCJUtecNvS5qj0jH0I3ZSkgU0UbO5lCziLVJYHshbLoDzC5bOW/GcomGJGbm2LtunDVc
	N8FD0te9auWZCqn1vPqnuccZWrC3MRTuf2rZTi/NYyc+c18CtdvRIHJO8FIpb5nO3GUdqhyBB2glz
	CDVHCSfIXLP+HTLWvyb3SfAfDkT87GCTzUi2PE2/jd+n5bxLFyUJpgip/RGdxYuTJcQwxAjUrIVyF
	wgnvn15+IQCnpmO7bz/JTnVmQ8GQcvaTUxdIoobEO6bhWkiJtfpnjKbyOxiD2wUwrRg6iFpDmZOmu
	0nD8bS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BKn-000s63-Bk; Fri, 02 Dec 2022 19:04:29 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BKk-000s1b-HG
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 19:04:28 +0000
Received: by mail-pf1-x435.google.com with SMTP id 130so5726965pfu.8
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 11:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imr/GnqPcqLqa9JjMVgPxbyj/eiQHdpFYtFNeUfm5rU=;
        b=gjGe+7auDv+ZXu6qt73zTRHUZnU4jIZZDL8KgYXKoGC8YpiLul81hfXyWSVs8xKDya
         t46krBPFaRKw9a19sjeRINFTz7UVLN6gOzU36gNecQUBhsUnE22CNUE+K4xhyRNaUBM+
         p8I9Og0ekoekO2mPafx4QjwACLsfml6Z6s+j2L61u/ZKeaPYRl7AEEFelJj6Whh8nNXV
         eiye/7Dl58HiuzcKADeL0yHqi6QrhQKHVwgx/vxEkwSdfKEsTmTgqLl0LRZATTbULKB3
         p0QOn4w0Sg5f7gdC2LWyBahjjxFDIiqEIMv8r9AJNnux9OJVgDNi5yAS6L2MvsVP94Qb
         Fd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imr/GnqPcqLqa9JjMVgPxbyj/eiQHdpFYtFNeUfm5rU=;
        b=5/i3FV1Ikq7KG+KO2NZJHijkQ48XHx69vaxcFiijtXhWfhJeQXVrTX4TRxmB7MHBzV
         NkNAhza6zY50r6556l0HPujq5Gd21Si5NRZZlQizfGRxbZlA2efsfj5Cp9y/k8W2ST5g
         gtV3/C8tzNyeEn0aLl/L/5BrjCEJNsK7i3Mp0AyCq16r6Cd2xvPl7V7BTSEmi6YfR0F7
         k+qPT91Dw81iusF1CghFkcVS73AGqhNBl4cGtn5B4DmX4Th4uJZbi0PeqG4q6joVCXlY
         e/epgO9VtOeME06mhp2YSw2i6uE0DlYSrj8LckWE1WXg4KueYrnV5Htms6G9WW+X4oQL
         +auQ==
X-Gm-Message-State: ANoB5plHRRoHpUeLQ1LIHEFiQaUcjjLKddw6TE3Dw1/YlO3GP5Fn2L+p
	rIVh0phhTrvMeZNVpF9d407tEA==
X-Google-Smtp-Source: AA0mqf6FmyD0wOrbzu3xmRH000pMYIZ+lhNtF3BHMD8wby88YkYEyGqw52oKyOS+R5dIP4i/6feQ8w==
X-Received: by 2002:a65:588b:0:b0:456:f7bd:a1 with SMTP id d11-20020a65588b000000b00456f7bd00a1mr64729248pgu.79.1670007862734;
        Fri, 02 Dec 2022 11:04:22 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id pl11-20020a17090b268b00b001faafa42a9esm5104893pjb.26.2022.12.02.11.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 11:04:22 -0800 (PST)
Date: Fri, 02 Dec 2022 11:04:22 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 11:04:12 PST (-0800)
Subject: Re: [PATCH v2 0/8] Basic device tree support for StarFive JH7110 RISC-V SoC
In-Reply-To: <167000761729.13669.16471163583440376052.git-patchwork-notify@kernel.org>
CC: hal.feng@starfivetech.com, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  ben.dooks@sifive.com, tglx@linutronix.de, Marc Zyngier <maz@kernel.org>, sboyd@kernel.org,
  mturquette@baylibre.com, p.zabel@pengutronix.de, linus.walleij@linaro.org,
  emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: patchwork-bot+linux-riscv@kernel.org
Message-ID: <mhng-9bf55be8-1ce6-4f4d-91ef-7a18f694d8da@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_110426_592519_6B7C72A0 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, 02 Dec 2022 11:00:17 PST (-0800), patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
>
> This series was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>
> On Fri, 18 Nov 2022 09:17:06 +0800 you wrote:
>> The original patch series "Basic StarFive JH7110 RISC-V SoC support" [1]
>> is split into 3 patch series. They respectively add basic clock&reset,
>> pinctrl and device tree support for StarFive JH7110 SoC. These patch
>> series are independent, but the Visionfive2 board can boot up successfully
>> only if all these patches series applied. This one adds basic device
>> tree support. This patch series is pulled out from the patch 1~6 and
>> patch 27~30 of v1 [1]. You can simply get or review the patches at the
>> link [2].
>>
>> [...]
>
> Here is the summary with links:
>   - [v2,1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive2 board
>     (no matching commit)
>   - [v2,2/8] dt-bindings: timer: Add StarFive JH7110 clint
>     (no matching commit)
>   - [v2,3/8] dt-bindings: interrupt-controller: Add StarFive JH7110 plic
>     (no matching commit)
>   - [v2,4/8] dt-bindings: sifive,ccache0: Support StarFive JH7110 SoC
>     (no matching commit)
>   - [v2,5/8] soc: sifive: ccache: Add StarFive JH7110 support
>     (no matching commit)
>   - [v2,6/8] riscv: dts: starfive: Add initial StarFive JH7110 device tree
>     (no matching commit)
>   - [v2,7/8] riscv: dts: starfive: Add StarFive JH7110 VisionFive2 board device tree
>     (no matching commit)
>   - [v2,8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
>     https://git.kernel.org/riscv/c/6925ba3d9b8c
>
> You are awesome, thank you!

Looks like the bot is a little confused here, it's just that last patch 
that's been merged.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
