Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF390C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Q6xVA7hNH8IA33UgQsvn3QKpzNss9OmWFO9yvpF2pA=; b=tgnLTf9zEfcgZ4
	t7DjuMYeHQ0pYCw1NeM92p1PAWXqA6i2fzwYCl3Bj3K7XmN7n/wQDzI0GXVepNbrJ5TIqhy95eueq
	XrWrhq9/DX0EivLRluTfRiOCnr0K+5VPdAUdyC3kTFUiA20GDK4xjgIIArCHnSs4oQadIi+TIe4Bj
	T0JYiZ5HHNYbGBJ4CaPxrTr+TS/JtpsKWCwUUwk87RuUqKYF0pglv1ovGnA9U06IRfuiUICHtZeJr
	zzF3d6EaSfQCowZp8hrM46gU5okEGx7PCKFqbC1DXl33nniGYJFkLyYLugzYRhHl/8PZ3IX48SEzR
	2bOPK0xuaJm3IZ+Yxkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6Fu-007BGV-ET; Fri, 18 Nov 2022 18:38:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6Fr-007B74-68
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 18:38:24 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 430453F1C3
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668796701;
	bh=RYI02dFt068UY8kg1Ox7tYgeDjuqkOHogBD3aOmXEwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mXPB937Oev1lzvkjuqbIhZOmjfA9G8nHpXVayTcj4SF6KlKAsUxdany+xDuuAFeiV
	 WpIp9iE+e6f5vOdCM/5SPbzSvqsXQXkJblFb7I9Ob/D0uyipzpbLlarPWGLZVDias9
	 qEzAq8cW134EGY1EoLfeN5BCiVVzsswODUtgFY1kktopge0JxkCxtHMnYQe2A2qoN0
	 /IdpNlxkmjDID2IgLywZjPHTu7gAIVAjWzaWx18PQMIVgNYW//RVovjZATfYkF8uKb
	 OD+aJv51lIj1AEfrz0kqf3XjV01ZDFFnSTuGycIjk1RWIuQTrNesmNko/89b7oKMfq
	 mf0J5CtGuCtKA==
Received: by mail-yb1-f197.google.com with SMTP id f8-20020a25bd88000000b006dda2c86272so5152734ybh.5
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 10:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYI02dFt068UY8kg1Ox7tYgeDjuqkOHogBD3aOmXEwg=;
        b=FufCmBwIBU2kkPD1614SqjEymid//r0UYNqZywnqtnHL1Px9daTsK2F/z+rn0a7mGC
         nJ0By1IKMDSD9eDrjdqiNgZIcn2itEaYS4PC3/X3bHCW16jdYX/UF0+N7ABgvkvissUq
         RiXFGhWkV31Uw+sFmmQx31AOxXzQGBQ8rDZxLQ0ETrUgU7akNATpJc/SNhzqjzf8xgrp
         HbZyG9vchZQEIE0BT597w58wZ8XoHY2GZn8eiuoKb66dB4Y5bu9SbttE1NA2F7D7RK+H
         UZkmV3iyjlEyv4T8kai//yJPgaV0Pwoyu7awe1MxkCQvGt+WcxJaS0c/N5LsW/TX5SW+
         SMxw==
X-Gm-Message-State: ANoB5plhmt8Iv24Hv9uEQSRrDWmIh+CDkIi5oZ41ouwEiFHlKdSv9DDF
	m4nJsMC3h2Kfj6WzHoomLFqEO7D+VCXu2hm+3E3/6pxhVzcHCzyf2P76pFwlICBin6A3PpuV0Y6
	P9X/gNwiQXfRFNPXqMb/O99j2P3t+uSWjOiYiQCROkS6iphxt2tSKoYvW/Re/eA==
X-Received: by 2002:a25:510:0:b0:6d2:e45c:71c0 with SMTP id 16-20020a250510000000b006d2e45c71c0mr7835983ybf.153.1668796698036;
        Fri, 18 Nov 2022 10:38:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4IKtz+bGERRUU6t0gtG+/NROqFnzOSm0Wda5mFXqM87Jebl5N3WBApoYT3Wr9SjFb4XHz8OAX5vTxVq7XpuhI=
X-Received: by 2002:a25:510:0:b0:6d2:e45c:71c0 with SMTP id
 16-20020a250510000000b006d2e45c71c0mr7835971ybf.153.1668796697793; Fri, 18
 Nov 2022 10:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
In-Reply-To: <20221118133216.17037-1-walker.chen@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 19:38:01 +0100
Message-ID: <CAJM55Z_OGDrCHs++9w4FhG-mZzGzOsnHZT77Q6BDJOGWX7eXJQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] JH7110 Power Domain Support
To: Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_103823_393041_EAC5FD05 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, 18 Nov 2022 at 14:34, Walker Chen <walker.chen@starfivetech.com> wrote:
>
> This patchset adds power domain controller driver for the StarFive JH7110 SoC.
> The series has been tested on the VisionFive 2 board.

Hi Walker,

Thanks for upstreaming this! I've left some comments on the individual patches.

/Emil

> This patchset should be applied after the patchset [1], [2], [3]:
> [1] https://lore.kernel.org/all/20221118010627.70576-1-hal.feng@starfivetech.com/
> [2] https://lore.kernel.org/all/20221118011108.70715-1-hal.feng@starfivetech.com/
> [3] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/
>
> Walker Chen (4):
>   dt-bindings: power: Add StarFive JH7110 power domain definitions
>   dt-bindings: power: Add starfive,jh71xx-power bindings
>   soc: starfive: Add StarFive JH71XX pmu driver
>   riscv: dts: starfive: add power controller node
>
>  .../bindings/power/starfive,jh71xx-power.yaml |  46 +++
>  MAINTAINERS                                   |   8 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |   7 +
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/starfive/Kconfig                  |   9 +
>  drivers/soc/starfive/Makefile                 |   3 +
>  drivers/soc/starfive/jh71xx_pmu.c             | 380 ++++++++++++++++++
>  include/dt-bindings/power/jh7110-power.h      |  18 +
>  include/soc/starfive/pm_domains.h             |  15 +
>  10 files changed, 488 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
>  create mode 100644 drivers/soc/starfive/Kconfig
>  create mode 100644 drivers/soc/starfive/Makefile
>  create mode 100644 drivers/soc/starfive/jh71xx_pmu.c
>  create mode 100644 include/dt-bindings/power/jh7110-power.h
>  create mode 100644 include/soc/starfive/pm_domains.h
>
>
> base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
> prerequisite-patch-id: 8ebfffa09b478904bf7c516f76e2d824ddb60140
> prerequisite-patch-id: e8dd8258a4c4062eee2cf07c4607d52baea71f3a
> prerequisite-patch-id: d050d884d7b091ff30508a70f5ce5164bb3b72e5
> prerequisite-patch-id: 0e41f8cfd4861fcbf6f2e6a2559ce28f0450299e
> prerequisite-patch-id: 6e1652501859b85f101ff3b15ced585d43c71c1b
> prerequisite-patch-id: 587628a67adad5c655e5f998bf6c4a368ec07d3c
> prerequisite-patch-id: 596490c0e397df6c0249c1306fbb1d5bf00b5b83
> prerequisite-patch-id: dc873317826b50364344b25ac5cd74e811403f3d
> prerequisite-patch-id: a50150f41d8e874553023187e22eb24dffae8d16
> prerequisite-patch-id: 735e62255c75801bdc4c0b4107850bce821ff7f5
> prerequisite-patch-id: 9d2e83a2dd43e193f534283fab73e90b4f435043
> prerequisite-patch-id: 7a43e0849a9afa3c6f83547fd16d9271b07619e5
> prerequisite-patch-id: e7aa6fb05314bad6d94c465f3f59969871bf3d2e
> prerequisite-patch-id: 6276b2a23818c65ff2ad3d65b562615690cffee9
> prerequisite-patch-id: d834ece14ffb525b8c3e661e78736692f33fca9b
> prerequisite-patch-id: 4c17a3ce4dae9b788795d915bf775630f5c43c53
> prerequisite-patch-id: dabb913fd478e97593e45c23fee4be9fd807f851
> prerequisite-patch-id: ba61df106fbe2ada21e8f22c3d2cfaf7809c84b6
> prerequisite-patch-id: 287572fb64f83f5d931034f7c75674907584a087
> prerequisite-patch-id: 536114f0732646095ef5302a165672b3290d4c75
> prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
> prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
> prerequisite-patch-id: e09e995700a814a763aa304ad3881a7222acf556
> prerequisite-patch-id: 841cd71b556b480d6a5a5e332eeca70d6a76ec3f
> prerequisite-patch-id: d074c7ffa2917a9f754d5801e3f67bc980f9de4c
> prerequisite-patch-id: 5f59bc7cbbf1230e5ff4761fa7c1116d4e6e5d71
> prerequisite-patch-id: d5da3475c6a3588e11a1678feb565bdd459b548e
> --
> 2.17.1
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
