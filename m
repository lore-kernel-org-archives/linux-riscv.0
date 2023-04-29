Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6ACC77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZjQZ5yuKPUowmZa3knQj+2BFBGVpHFT7e2MV/I21oWU=; b=F3zWg5SqbqqQ4DLzyvr84qsJn9
	wMcwVzH0j2n+1A2PMvpJNrRrtum5NDUgbf1IGJgQD1QvcNcHbr3bhJ7lIqOZZaGTRtbUyPD371rRr
	p3niR3NxhOyT6Wz51x+DrbYNtKulPSYne+Jqi8BFxS2yJWaITyoADYYyL98cfMSNhXVZoWGL3oSBy
	cE8JcDTDIUPB245hHcfGc33SjyDvmMdilpRQXaygaPLG9mCo1QYIY9+bsipgCDitZ0uvn60qvQ8Es
	QViJDQ4DGY6aPTTUb5nzDcOwatOnk2ebnJINXXtYRgV8maYOu+UMRuKL32XsZqTHeRIrUhdeox/NX
	nvkZWaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psplp-00D28p-1N;
	Sat, 29 Apr 2023 18:58:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psplm-00D28P-1S
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 18:58:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1aaca0bb8c2so11604955ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 11:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682794685; x=1685386685;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tneK3rBistnd9Ha67Ea2Jz2s60WaNrk0c+1Wr5wtZd4=;
        b=bNJ0a9PlEcdBF+D7KklysARre66PsS60KW+fqG+FgUkVbvZBScXzV/P/qemIinvqdA
         RGjVj3zDl7+7EkuCjfrdbpQ0s4DPd3daiJj3DDYvtgjnilpb4n+rlVqYpNMi32EdVk9z
         4ScOzIRJFMYTstYR5uFnSTj6AoU3o3Fa8ypRxptygBv2aX/e/Cnp8o8zOoMo+Kxir2hq
         RCzHThJv5X7vqng0eMKkZNIKLFHcNPnebigPe3eMwzmTmqtKBftjHNNBbhckPj+b1Osf
         FyHXLMIO6pisf5F61w+pkhU5ZQWdLtoDNoQVDMCa06KuRcFHigfnw38q9VLh0f894bO5
         v+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682794685; x=1685386685;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tneK3rBistnd9Ha67Ea2Jz2s60WaNrk0c+1Wr5wtZd4=;
        b=FbItxvnkL2qVGDX7+5zS+mI4aCyOsW98W1P61C6qsLcWwy7GcJUR18L9fGTPOPij2p
         P5S2GRHicpc3+LP7d08TrSXvFqn28r7MHh3K7yXF02IU2I35lD4sAPOYDxiAPwXIKfn7
         3ND4QSNbM8z5RuJeu26VYoEdRrJt94X2/1yqqIcdUvMI9hcyMf87CZ/1y0xx8CnrUQWd
         5NzBg+LrFJ2isRDtH65QcX4WeYrbEzJyYMgmIZimXQhToYIzATiBY/WUVtUVu2/VIv6b
         sEhv4jXnO1jmOEtjbRtiSoaHCG7Cm4d2gQ6M1qco5ihNhzHKxDX+E5lM27lzMbr40z3M
         NrUw==
X-Gm-Message-State: AC+VfDz7uNNhaeB9Si196F2e6rB/rFIHU8n3Ta/zHMn69NSJBvJWwlXb
	kPUDDZALpvkRuYtzUoPJZto6mQ==
X-Google-Smtp-Source: ACHHUZ5s+GEIwUVRzUqUdkcm4/YL6Qb5gwwrAB6zsCenMUYBzTYBLu4Hq1rlV4SjZnoSUrs2/azH/Q==
X-Received: by 2002:a17:902:bd8d:b0:1a9:90bc:c3c5 with SMTP id q13-20020a170902bd8d00b001a990bcc3c5mr8643899pls.62.1682794685224;
        Sat, 29 Apr 2023 11:58:05 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902f68900b001a1a82fc6d3sm774266plg.268.2023.04.29.11.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:58:04 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:58:04 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:57:50 PDT (-0700)
Subject: Re: [PATCH v7 0/2] StarFive's SYSCON support
In-Reply-To: <20230406103308.1280860-1-william.qiu@starfivetech.com>
CC: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Conor Dooley <conor@kernel.org>, kernel@esmil.dk, william.qiu@starfivetech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: william.qiu@starfivetech.com
Message-ID: <mhng-698f09f5-3840-4456-87c2-5c04742b42f4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_115806_494396_E0A45FAE 
X-CRM114-Status: GOOD (  19.27  )
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

On Thu, 06 Apr 2023 03:33:06 PDT (-0700), william.qiu@starfivetech.com wrote:
> Hi,
>
> This patchset adds initial rudimentary support for the StarFive
> designware mobile storage host controller driver. And this driver will
> be used in StarFive's VisionFive 2 board. The main purpose of adding
> this driver is to accommodate the ultra-high speed mode of eMMC.
>
> The last patch should be applied after the patchset [1]:
> [1] https://lore.kernel.org/all/20230401111934.130844-1-hal.feng@starfivetech.com/
>
> Changes v5->v6:
> - Rebased to 6.3-rc3.
> - Modified compatible's property.
> - Added clock-controller and power-controller node.
>
> Changes v5->v6:
> - Rebased to 6.3-rc1.
> - Changed file name to starfive,jh7110.yaml.
> - Modified commit description.
> - Added syscon node dts patch to other dependent modules.
>
> Changes v4->v5:
> - Added a incremental updates to fix a bug that prev_err is uninitialized.
> - Dropped the merged patches.
> - Dropped the dts patch.
> - Sorted compatible alphabetically in yaml.
>
> Changes v3->v4:
> - Added documentation to describe StarFive System Controller Registers.
> - Added aon_syscon and stg_syscon node.
> - Fixed some checkpatch errors/warnings.
>
> Changes v2->v3:
> - Wraped commit message according to Linux coding style.
> - Rephrased the description of the patches.
> - Changed the description of syscon regsiter.
> - Dropped redundant properties.
>
> Changes v1->v2:
> - Renamed the dt-binding 'starfive,jh7110-sdio.yaml' to 'starfive,jh7110-mmc.yaml'.
> - Changed the type of 'starfive,syscon' and modify its description.
> - Deleted unused head files like '#include <linux/gpio.h>'.
> - Added comment for the 'rise_point' and 'fall_point'.
> - Changed the API 'num_caps' to 'common_caps'.
> - Changed the node name 'sys_syscon' to 'syscon'.
> - Changed the node name 'sdio' to 'mmc'.
>
> The patch series is based on v6.3.
>
> William Qiu (2):
>   dt-bindings: soc: starfive: Add StarFive syscon doc
>   riscv: dts: starfive: jh7110: Add syscon nodes
>
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 15 +++++
>  3 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
