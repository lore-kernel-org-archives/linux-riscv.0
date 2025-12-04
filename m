Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711DFD24448
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDhEHU4P5IC81VJdXC4DcYhmr3+a7Dw8130QhBzD0RU=; b=3sSQYzenUJopVT
	reU8Bg2F601cl8JKlEDeoYKtqrXYqyyVWUj66senNlgNQnhCw96/qR9sC13AiWx2LxFpKTIJ1COQB
	6h3ggNtbXjFDPYq+XCsSbr+FrOfJP00Ul1cqGwWL2UxPK28FNUsKo4MAFd397HNknRmn8tsk5xSaI
	Aj6KOShnlBeWH93MX4D1c1AOGKozs7u4JTCDAQUva/v5wQiAqtDmQqqXqELsoSsavBDZMyyYxIEyR
	z0jijKZ7V5zXsBaRazPyjkVskNqAuFXHix4Ix1qPSsWW+gqIY0/5W4xERb+e1QLGmH7sfeHNL2b1Q
	ZNxXRfV/FVuNWGqx7KJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRClf-00000008LLz-3SYZ;
	Thu, 04 Dec 2025 17:05:23 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCld-00000008LLZ-3EZ0
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 17:05:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso1911945a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 09:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764867919; x=1765472719; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kg3+GXQJrSRCIpl+szpU9K94sF3dPzVaXSDtfFd90yg=;
        b=Jwqj7/tcWZ/7omBx6X4p5DekO5wcRQ5vxVqJrMjaaVh2G0yoqo/+StpjeQ/JGUk6tI
         cmCDzTaTyeHfmIeBGz4U4APqxXwULUgXeadCtJbHJDi5YPaBrMp9RQuW2eMEfyFky9ya
         w/0i6R9M5+NYlOfJn6FkHPQz9HZ4hzkD4F7+TSR6InHYitM+kbp+/WP0VemYvwUZRMbQ
         xpQQfvLbbrVkNWlHLUkZhu1uj6jkn98b0rhs1Pb4sZqyHAlVfex2QALE/RYYBwwu23sq
         lMGHnVKlmnu4E3N8N0XdCV7XKS66rcsAvAVg3xolCALOKamDfp9ZxptmNKSujYYtL0Hg
         IaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764867919; x=1765472719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg3+GXQJrSRCIpl+szpU9K94sF3dPzVaXSDtfFd90yg=;
        b=rMWmivKpPCgkhkOhLEN9bwVVidc1h2gy+KjghMGBqSwUHVDJCZEBzHu7ovqvnNHugb
         ijsKDNa0CkQ54Gq+Xf8w+z+URAXc94tX8UkGNTRKEsCwmoxkzUjbwErIKL2OlfVa6TF+
         jpABov7OUXh1JloxX74JCbNZY2//ibukcl9nKdY7NubNc08H9tBV/LyuCpJEH97cNqvk
         wzReqj8wY745F39uoaXqpRIlPe+cigGzhrb9clJVMubCnDrTdbB9tcTwFJTIm+XbJ6hl
         z7RM66zoqXSqo4+yxBDiUVbV7Szwpe4RnEzb5DA2CD+P9bS3fEyE7mnp5VC/Z1HjJnc9
         D21Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNPA9CuR8aZq4Cneit5a5Mvai2jolE4bxbh6WgFMlo/Btk7giepst3F/7xtDudTaSc7buNTjjzjIb4RA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdJFfV8Xb++2VYPu08oVXHfaQ81lBIM3W4tRyNo4KPh6LAcN3x
	cHV4dw1uBdRdMSjb6jRU49pNkIDNivnNOCdZgytgwZftr3AWMeB7WVUx5qCVhpfldo2tsEf2/k6
	vY23x9nC04UNAl7WOoA7J9uOrOQMa5C0=
X-Gm-Gg: ASbGnctglqF5LTR+KoYwgeMXjbH2pPLKjquPLZ6CdH3gC5/rd1iHw5kd0C8hpzSeewj
	sIdlI/Tusg4VY0vO6AJWUXVXmpo0GSX/ZFHwzB2Iz3Lsm14zoyAvv9idNjBb4uz/5KoDWgiJ7J+
	YdRa81Y6fm5FPEGcj3LpCB3t3fW9uOiZSeGzLQ9amYpgVgsRIEIwmvlTHnj3Xbsm2g85I1k1/8p
	OvtqmbsEtFYkrPxYVL/4ygW9yF0//wVBE/FUFgv5uCCgN9C59T4Hhg5oOsaRSnOBIEQQQ==
X-Google-Smtp-Source: AGHT+IG9AKS27UcSx07KoYOWwja6RVplBXqyc0tOREa2QICJ8kkCeFjeLh3AGbZxmPxO+LrN0uh7FoxQp64DfkzF090=
X-Received: by 2002:a05:6402:d0e:b0:640:ff5f:47a8 with SMTP id
 4fb4d7f45d1cf-6479c3f6532mr5947624a12.8.1764867919153; Thu, 04 Dec 2025
 09:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20251125075604.69370-1-hal.feng@starfivetech.com> <20251125075604.69370-5-hal.feng@starfivetech.com>
In-Reply-To: <20251125075604.69370-5-hal.feng@starfivetech.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 4 Dec 2025 22:35:01 +0530
X-Gm-Features: AWmQ_blo07jkPZn5svQ8GwL_vHDmoWP8GFySAR6LM46D7PTJjpA9bu9AWt48b7g
Message-ID: <CANAwSgQSBB_yTw5rDz2w6utvjUueWJi9tWUY9oZcpNAT8Wm8iA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_090521_850644_F97D2DD1 
X-CRM114-Status: GOOD (  16.19  )
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

On Tue, 25 Nov 2025 at 13:27, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> Add a common board dtsi for use by VisionFive 2 Lite and
> VisionFive 2 Lite eMMC.
>
> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Tested-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2-lite.dtsi    | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
> new file mode 100644
> index 000000000000..f8797a666dbf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +       vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> +               compatible = "regulator-fixed";
> +               enable-active-high;
> +               gpio = <&sysgpio 27 GPIO_ACTIVE_HIGH>;
> +               regulator-name = "vcc_3v3_pcie";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +       };
> +};

The vcc_3v3_pcie regulator node is common to all JH7110 development boards.
and it is enabled through the PWREN_H signal (PCIE0_PWREN_H_GPIO32).

VisionFive 2 Product Design Schematics below
[1] https://doc-en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.pdf

Mars_Hardware_Schematics
[2] https://github.com/milkv-mars/mars-files/blob/main/Mars_Hardware_Schematics/Milk-V_Mars_SCH_V1.21_2024-0510.pdf

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
