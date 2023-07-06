Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9CCEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WlQQ/GEnSdtB7uW0+Vkveh5ueQ27l9PyspE8CljnVHI=; b=CAbwJw6hi4hO8O6TlidtLluJ4J
	iAlmLTtBG3et8uvqqH4wABYdCAHyr9PFdpFky8uhcNlY9LYN2vGsvbSZMZkqq06OjCaBBbofUQbOP
	PUvS0SuFovA8c8KKgs7dQe8Kz91XIPvEo2V5cREVgdcKwKyiPvqIwGD7yJxpNIZrN3ioLjS40PjrG
	ASG4gG4U7BeyIkZ+v3dWlkxYHN/KAwm282LxMvRVNX7XB/CGNQeFL3q9PZONZHxsN66hg78PjPcsO
	1THE0BIYf9uafUSHhwwMZIwFIMDUOKBYciN1oxhACEmDxsnSzWMrZje7RJklVGIIEtmPH3UKh6+du
	mqkZw3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSTQ-002FXN-2D;
	Thu, 06 Jul 2023 17:08:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSTN-002FWJ-10
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:08:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b7e6512973so6319165ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688663328; x=1691255328;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDFcTWubp+txWejOhlaxkosc/sM3fyBrGXhY50V6+cc=;
        b=Q3tIlLGo1iMeILb+g6CH4AIl3stIczQL9hbypUuloisr7dgdnhmwB6ISQOKN6BvnsJ
         K3O1JcQ5v3+cL1l+D2w4fY7JLprWSNENfngJS/iyg2okZpdYyQj0nlKgzNGHgR8WVuCG
         rUuF78Z/asu/0QEztqH4ky05n9ZBKsI5h7Y55PmYGCUO9CHIjY8e7UQ1Btp63JMcRwzq
         jhGDhbhg1BhKE7eMImJDzMF2Do6AD2gKr/BI86yx2Gr2orCka1+ixbby0Tv5EKv7699d
         AWaojvSBoh3rC2chnKJ4rpkDNiNOHz5Y1/OwlK6eYZQox6JAojJLfoF6o08bcjzr6IJ3
         tr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688663328; x=1691255328;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDFcTWubp+txWejOhlaxkosc/sM3fyBrGXhY50V6+cc=;
        b=iqVao0hgOwee5KRo8/asQbx5L2kLF1heHog8j5jKwyJuN1AZB3Xh21lMDgz3+a093h
         t6jZrTaAuV/o4t2Fy2U6eYdhsO+UscGih9s+8Ign4/5b5LS7MpAxHdeqoPmwyxC/j0pY
         Uurq9HeT52qSQ4cM/Rl/kvClsdqDJLkFErrVhKPnDM98TFX9B7ULyg/kXSs/pNAPp4ee
         r7NQpk0gI/AMUIl1RlCESzG1j+XLBjsg8RFvxJlG4lv0u1afxA0ITrQm4hfpLfIAoEmc
         Z3M6Etx2LQkBdrXolLkijLZtbaGA3N3/0AuBsMuaTgUPnVK7/Ay11qb0LkB5DTd+7tI4
         Lvxw==
X-Gm-Message-State: ABy/qLbPp9Np3Sh6zm1a19spdQMWti8D0ZOM4v5HJLlbZeDc9lcFRmeK
	PtA0pdVDgNCMeU42LXCcUIO/tpQqIPxmFY5phVs=
X-Google-Smtp-Source: APBJJlG74eEINUstmC9zOo36wEsjfZVnckhU+vtEAepiS2jkRuh+o/vzJ/8elzyQtASPJfPTGwaDJA==
X-Received: by 2002:a17:902:efd1:b0:1a6:4b60:3195 with SMTP id ja17-20020a170902efd100b001a64b603195mr1567784plb.66.1688663328525;
        Thu, 06 Jul 2023 10:08:48 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902b08600b001b8a7e1b116sm1668898plr.191.2023.07.06.10.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:08:47 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:08:47 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:07:29 PDT (-0700)
Subject: Re: [PATCH v3 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
In-Reply-To: <20230627082334.1253020-1-privatesub2@gmail.com>
CC: linux-kernel@vger.kernel.org, privatesub2@gmail.com, thierry.reding@gmail.com,
  u.kleine-koenig@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, p.zabel@pengutronix.de,
  cristian.ciocaltea@collabora.com, Greg KH <gregkh@linuxfoundation.org>, linux-pwm@vger.kernel.org,
  devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: privatesub2@gmail.com
Message-ID: <mhng-0cca3d46-6031-4e8a-8e8f-2c479a20b95d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_100853_371094_1D46583F 
X-CRM114-Status: GOOD (  17.50  )
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

On Tue, 27 Jun 2023 01:23:23 PDT (-0700), privatesub2@gmail.com wrote:
> Hi,
>
> This series adds support for PWM controller on new
> Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> provides basic functionality for control PWM channels.
>
> v2:
>  - fix dt-bindings
>  - fix a remark in the driver
>
> v3:
>  - fix dt-bindings
>  - fix sunxi-d1s-t113.dtsi
>
> Aleksandr Shubin (3):
>   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
>     controller
>   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
>   riscv: dts: allwinner: d1: Add pwm node
>
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  86 +++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun20i.c                      | 322 ++++++++++++++++++
>  5 files changed, 430 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-sun20i.c

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm not sure if this ended up somewhere, but I'm assuming it's not aimed 
at my tree.  LMK if you guys want me to pick it up, I'm dropping it from 
patchwork.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
