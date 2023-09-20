Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DF9C004D6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=McdsEkCYDQL5hLY0aQmtCQmEzWN6EpvE0yZzWvXl6X4=; b=SLJrn56KKiPpRFJN/apSxAOXbA
	QxkYq/dW2jCs3AX9IPoQom/qv5TVZHoPONsB0I0CB7GDAiT6faYhFzD2DrmyhpiOmK6X6TwmzrTBa
	qichOWinC7KwYzOKeARIB7FZSpPv/Ynkv+q5Xzv5i5mkVUqcLLd7Tv12WmENmWsZB2X1r4/2F+mWl
	TwB6h4o/+scmUWm38TwZBZodCbiimNKK/XcjUbHpsbv+qMirnboRclKFov5VgXVkH6HqN2QcDcV4Z
	UcPjXEhY7OcTi2C3+nBfwpDCQ3eymNs6toLrVqanMP4jjVappKuZMrGLDu5/XJE1EHqNDUd4IneJS
	Ins4XlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiz2L-003UTL-1c;
	Wed, 20 Sep 2023 15:22:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiz2I-003USR-04
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:22:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so55586355ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695223359; x=1695828159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPVlO2IEEO/6nSEB/eijM1OQHKXd4fySTb02GTapUFA=;
        b=JKEe3Pbt3JlB+BNbuzfhMzzjBIfT6T2y7bJQRqjdCl3N43rtmDytN5nTl+wfvJtXy7
         8Yu/67o6KkXDSx8hlKTWR+Nak7s1oDEVBpTcylMkAdM1rFlYrjhiKzgDdAnrfa91gV7s
         sqjVZkeljri3NAhWfoeIYFp9S1vRFQviVHSFZT/uoT11237TlcRZ8kWAMospPth3nuzt
         eWXlATaqmtzLhwQ1PriZQiDXBt/BuX8fSgmgLgOjXCKpOTul5NYZQABF1a4mvMP52W7S
         p/mrsTpGPrM3SDPgV+X/SmoHWJsir5QOhjez28TZgc4Taqlyk+5SqyqiT3R/4CiHb3IN
         7StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695223359; x=1695828159;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPVlO2IEEO/6nSEB/eijM1OQHKXd4fySTb02GTapUFA=;
        b=aVCZLvivXAzVyt4X8oE3/TSIREZV2XUPg7lC0j2npcsPMqEecl4P6uRmjauwCR5UoW
         Rwo0J0qlKCynoR8mAVA/0kObUm9grAk2vINIkrKvfAYBu1Oi0mAU0aTjAB5aUTBmqdwY
         a202ua6YFcir/Eiybz8e/FpVSoWqaX6mnVETIfDW7mTsnjZnrtcvZ7v8G2oN/YVX8QjV
         MliKj1ORr/z2W292ood8sbzsrpoMccb0TER8RrzjGhigUVJWsRGX66Wl8Fq1XudHlKhW
         fNtT7AyqqAhilCzORcYtwo1ld4fjLt5JM/ar6LdueqWOdGfyLlRgCtuahHPCEZZcFVN0
         UeXg==
X-Gm-Message-State: AOJu0YwqEGZlYOAyVVZMdrlSwRfhqQvA6DH5vhK4aOFDFPCg40qGYHQM
	OW7Ey30UzupZ+rbuxthuEoQI4w==
X-Google-Smtp-Source: AGHT+IE4ApIConu2a/RS1kYG9WIO5HCabtzPHK0Zlm4BRkU6utrvdaNjkCBDuHUBV+76Hg4kOamhwg==
X-Received: by 2002:a17:902:bd43:b0:1b3:9d13:34b3 with SMTP id b3-20020a170902bd4300b001b39d1334b3mr2337093plx.37.1695223358955;
        Wed, 20 Sep 2023 08:22:38 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f7ca00b001c46f1e15edsm6633148plw.271.2023.09.20.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:22:38 -0700 (PDT)
Date: Wed, 20 Sep 2023 08:22:38 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Sep 2023 08:22:35 PDT (-0700)
Subject: Re: [PATCH v2 00/11] Add Milk-V Pioneer RISC-V board support
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
CC: aou@eecs.berkeley.edu, chao.wei@sophgo.com, Conor Dooley <conor@kernel.org>,
  devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, guoren@kernel.org, jszhang@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org, xiaoguang.xing@sophgo.com, wangchen20@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: unicornxw@gmail.com
Message-ID: <mhng-1c4de53c-6168-432c-b37a-284c90b1ed2d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_082242_086742_0C4CBFF8 
X-CRM114-Status: GOOD (  22.78  )
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

On Tue, 19 Sep 2023 23:33:48 PDT (-0700), unicornxw@gmail.com wrote:
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
> in a standard mATX form factor. Add minimal device
> tree files for the SG2042 SOC and the Milk-V Pioneer board.
>
> Now only support basic uart drivers to boot up into a basic console.
>
> Thanks,
> Chen
>
> ---
>
> Changes in v2:
>   The patch series is based on v6.6-rc1. You can simply review or test
>   the patches at the link [4].
>   - Improve format for comment of commitments as per input from last review.
>   - Improve format of DTS as per input from last review.
>   - Remove numa related stuff from DTS. This part is just for optimization, may
>     add it later if really needed.
>
> Previous versions:
> v1: due to it is not sent in thread, I have listed permlinks of the patchset
>     [v1-0/12] ~ [v1-12/12] here for quick reference. You can simply review or
>     test the patches at the link [3].
>
> [1]: https://milkv.io/pioneer
> [2]: https://en.sophgo.com/product/introduce/sg2042.html
> [3]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal
> [4]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal-v2
> [v1-0/12]:https://lore.kernel.org/linux-riscv/20230915070856.117514-1-wangchen20@iscas.ac.cn/
> [v1-1/12]:https://lore.kernel.org/linux-riscv/20230915071005.117575-1-wangchen20@iscas.ac.cn/
> [v1-2/12]:https://lore.kernel.org/linux-riscv/20230915071409.117692-1-wangchen20@iscas.ac.cn/
> [v1-3/12]:https://lore.kernel.org/linux-riscv/20230915072242.117935-1-wangchen20@iscas.ac.cn/
> [v1-4/12]:https://lore.kernel.org/linux-riscv/20230915072333.117991-1-wangchen20@iscas.ac.cn/
> [v1-5/12]:https://lore.kernel.org/linux-riscv/20230915072358.118045-1-wangchen20@iscas.ac.cn/
> [v1-6/12]:https://lore.kernel.org/linux-riscv/20230915072415.118100-1-wangchen20@iscas.ac.cn/
> [v1-7/12]:https://lore.kernel.org/linux-riscv/20230915072431.118154-1-wangchen20@iscas.ac.cn/
> [v1-8/12]:https://lore.kernel.org/linux-riscv/20230915072451.118209-1-wangchen20@iscas.ac.cn/
> [v1-9/12]:https://lore.kernel.org/linux-riscv/20230915072517.118266-1-wangchen20@iscas.ac.cn/
> [v1-10/12]:https://lore.kernel.org/linux-riscv/20230915072558.118325-1-wangchen20@iscas.ac.cn/
> [v1-11/12]:https://lore.kernel.org/linux-riscv/20230915072624.118388-1-wangchen20@iscas.ac.cn/
> [v1-12/12]:https://lore.kernel.org/linux-riscv/20230915072653.118448-1-wangchen20@iscas.ac.cn/
>
> ---
>
> Chen Wang (8):
>   riscv: Add SOPHGO SOC family Kconfig support
>   dt-bindings: vendor-prefixes: add milkv/sophgo
>   dt-bindings: riscv: add sophgo sg2042 bindings
>   dt-bindings: riscv: Add T-HEAD C920 compatibles
>   dt-bindings: interrupt-controller: Add SOPHGO's SG2042 PLIC
>   riscv: dts: add initial SOPHGO SG2042 SoC device tree
>   riscv: dts: sophgo: add Milk-V Pioneer board device tree
>   riscv: defconfig: enable SOPHGO SoC
>
> Emil Renner Berthing (2):
>   dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2042 uarts
>   serial: 8250_dw: Add Sophgo SG2042 support
>
> Inochi Amaoto (1):
>   dt-bindings: timer: Add Sophgo sg2042 clint
>
>  .../sifive,plic-1.0.0.yaml                    |    1 +
>  .../devicetree/bindings/riscv/cpus.yaml       |    1 +
>  .../devicetree/bindings/riscv/sophgo.yaml     |   28 +
>  .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
>  .../bindings/timer/sifive,clint.yaml          |    8 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
>  MAINTAINERS                                   |    7 +
>  arch/riscv/Kconfig.socs                       |    5 +
>  arch/riscv/boot/dts/Makefile                  |    1 +
>  arch/riscv/boot/dts/sophgo/Makefile           |    3 +
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 1744 +++++++++++++++++
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   19 +
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  439 +++++
>  arch/riscv/configs/defconfig                  |    1 +
>  drivers/tty/serial/8250/8250_dw.c             |    5 +-
>  15 files changed, 2265 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
>  create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi

Given this is the first sg2042 and it appears to have a few errata (the 
FP rounding issues and the special fence for starvation), I think we 
want to make sure we figure out how to provide that information to 
userspace.

> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
