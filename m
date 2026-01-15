Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E787D3CCB3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bxUATAIiP1ROQoKi8QcftJX0m1Yp90kMLXTKUTps3SQ=; b=trHac1f32admKl
	jEy+Ue6g6VNf+tISoLF7N2b/BZq93Dfx04346N9PlL1e5mZi8okEpxRU9l1DL5GqTwZptJRHMUKdk
	gJWn0jlEeSdtn9ds6/Sx9tsdiHxD4Se9FJm3By6hRYKwHzmErPByKP14zolXHLnUG/mAKArAvYAch
	Sx1GE1qgbZCuCiLcSctKcaiV4IHSOmknGpxzQYTMNJc8eTi2g9xz2T8trrvfuiO6MyPGq2KIw46Nr
	I15J9FJpUSwUoicH18lLiC4rY/BkjdQd2TI1a6DSL3n7Vs9MDAsDUKr+1+1UKN5rtkBLmVdvSViuq
	J2AL0tA4xQisGUrd5AmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDE-0000000Bswz-2eob;
	Thu, 15 Jan 2026 06:52:08 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDA-0000000BswW-2JA4
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:52:06 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a0bae9aca3so4214105ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459923; x=1769064723; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WD5EX5DuQsu6pRaXLnKPwypf1PUd+lvHZxR7rQ8Qqm4=;
        b=fD3Ldv9wocRiGjTgUtQJbdhKhOh+/jYYS+nYlvDIPKLJkup400fQHFNtsgAwrbzbky
         7VVHEzmLWOJTS0MKA0+ukC22l/4TC9PvlS70NRe3/qJz5g8MtWGM7AHkLpTeHyInWkUf
         u002m8uWcqRx1KZ4C1gBusOyV3ZR/tEuEFigRa+JVDd36wG+opezNJECuC94KmnQmMaP
         tjjLtigWjPKQ/GCZTWefPXCelks6/nH3tGoJt5rYnCqEPDrQo5sSA5ERPt/el78gcO5r
         8kwyPOuAo/WeHI34P0/gRDoxMR29LeUlgpaGAqwqFgGDYa6EIGOG87elW62ig5NkkRv/
         IEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459923; x=1769064723;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WD5EX5DuQsu6pRaXLnKPwypf1PUd+lvHZxR7rQ8Qqm4=;
        b=ZO6cSf1O9/DgOZyegwItbykhQPBhg6JZ7jsaosPYc6OAPcw1yfqpf4Qjpclwfq//T7
         bQhneAryaFjyCotGitZSCqivuPoHDD1Fudc9J+90XKMac6dcbVF9pIvLVMzNyjZhpzyj
         pjg7Syr/L6ycHyccUmYwHPTuPg61mDAPWJTRiGkjqLOZN7ChU05Nts0m4r7PW/VDz3HR
         ilkb07kfSsctkEfsLCJd35xlaX0/YWbCdN61ZxUrSZ77CuzqmWpHp0Xx9/YZSXRIGLlp
         mnwkaNdd4VASapg32gZZoAoAk52dgoTaTP9GSfG8nU/ppQE2CJ/Oq8FIkAhnQMc5msAx
         o6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUK19T2lmxN/rgHTfPCZ+IShaofSKYi8tjEPeytLLY/qQRUPRHv13Ves1l6/nYTIiNDMPyp8OscZq7waw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKiU7ha7TYiUNp+mrAqo5j268xpbJAicnSmiLsFJYzWMluHfGk
	Hja+LYkwzSCkspD5zacVk3vf0mmdLlsGQTkYqxD+ebm9+HDfjQ9QBvrA5Q664nhRLGY=
X-Gm-Gg: AY/fxX5UmQZN6x9sNN12Mx3SAoaWJikhruRyjJ1HldNPWbzpWojnOezRgDQuvtXcXqY
	LS60Ef4yBQAPJ4OFFDRPEynym+5QLCi2Jhxais/SJmif9yHgSFzp8s8FGDddTVaMijzzySOZACW
	ePujY3Kqp/T/E1nksXmSjwW39XJeIdGDTyyeQAQdvTN4j4nLGR0bNkbmPjRps93mI8PkwKxO853
	fXs+suMXkfEzbU/R6fVytuVBj5BW3bjurVgUk4I3mX4NkYM7uBvExCQ7JhbOFhr432GwOyGvh0X
	2EgT5zH0Ycryccoh38yrKCq3OS7vlVZ6f4TGwbEcXyuXC8eXTTdIVWgZOugfog+PlibNWmLUM57
	ra92o6bbhHs5lbzfYXUuUhrKzPyczkBOfPgqbbqylhk1jiKujaiRs+oyWnDvvg9xY6VlXCrbuvI
	8vGyHg53YsXZ0ZKonp6SWezS5YVch7ZlDSmOAvU1Ht1RwAcAbgumz5C2cO8yRq3Xos
X-Received: by 2002:a17:902:e54e:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2a599da5160mr56673845ad.12.1768459923615;
        Wed, 14 Jan 2026 22:52:03 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v5 0/7] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Date: Thu, 15 Jan 2026 14:51:39 +0800
Message-Id: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHuOaGkC/23QQWrDMBAF0KsErasympGNlVXvUbpQpFEjSuxUU
 k1KyN07SVqIi5d/xPuCf1aVS+aqtpuzKjznmqdRQve0UWHvx3fWOUpWCNgZNL3+IL3zNQcdmw7
 RdRagN25wSsSxcMqnW9vrm+R9rm0q37fy2Vyv6z2z0aA9ROz64GJw+FJyDbX58hymg7pWzfjAE
 ZcchZNPlChESINf4fTHezAwLDkJ5+gc72wgH2mF2wduYMmt8GgdJvIEKf3//XIfpvDnl6zb7us
 o4azl/ZDbdjPyqenfcivi8gPXxYELlwEAAA==
X-Change-ID: 20251216-k3-basic-dt-cd9540061989
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_225204_739212_FEB3EE89 
X-CRM114-Status: GOOD (  11.49  )
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

This series introduces basic support for the SpacemiT K3 SoC and the
K3 Pico-ITX evaluation board.

In v5, patches 6-9 (dt-bindings) have been dropped as they were accepted
by Conor and applied to riscv-dt-for-next.

The series has been rebased on linux-next tag: next-20260114.

The SpacemiT K3 is an SoC featuring 8 SpacemiT X100 RISC-V cores.
The X100 is a 4-issue, out-of-order core compliant with the RVA23
profile, targeting high-performance scenarios. [1]

The K3 Pico-ITX is an evaluation board built around the K3 SoC.

From an RVA23 profile compliance perspective, the X100 supports all
mandatory extensions required by RVA23U64 and RVA23S64.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]

Changes in v5:
- Patch 1:
   Add Acked-by from Paul.
- Patch 5:
   Add Reviewed-by from Yixun, add Acked-by from Conor.
- Patch 6 (Patch 10 in v4):
   Update the copyright year to 2026.
   Update the commit message.
   Set M-mode maplic and mimsic status to "reserved".
   In maplic node, use riscv,delegation to match kernel binding. OpenSBI
    accepts both delegate and delgation, but the binding documents only
    riscv,delegation.
- Patch 7 (Patch 11 in v4):
   Update the commit message subject line.
   Remove the unused aliases.
   Update the copyright year to 2026.

- Link to v4: https://lore.kernel.org/r/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com

Changes in v4:
- Patch 5:
   Adjust maintainers list in alphabetic order.
   Declare spacemit,k3-pico-itx as an enum, which could save future
    code change when adding new boards.
- Patch 10:
   Fix missing blank space after comma in simsic compatible.
   Add m-mode imsic and aplic nodes, per suggestion received from Samuel
    Holland.
   Adjust node properties order in nodes simsic, saplic, mimsic, maplic to
    follow the DTS coding style.

- Link to v3: https://lore.kernel.org/r/20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com

Other Changes in v3 include:
- Patch 1:
   Acked-by: Krzysztof Kozlowski
- Patch 4:
   Acked-by: Krzysztof Kozlowski
- Dropped Patch 5 "dt-bindings: serial: 8250: add SpacemiT K3 UART compatible"
   as it has been applied to tty-next.

- Link to v2: https://lore.kernel.org/r/20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com

Changes in v2:
- Patch 1:
   Fixed alphanumeric sorting order of compatible strings (swapped x100 and
     x60) as per Krzysztof's feedback.
   Update commit message with more information about X100 featurs per
     Yixun's feedback.
- Patch 4:
   Fixed the order to keep things alphabetically.
- Patch 6:
   Use "one blank space" between name and email address.
- Patch 7 ~ 11:
   New patches. Add description of RVA23 mandatory extensions into riscv
    binding YAML file.
- Patch 12 (Patch 7 in v1):
   Removed aliases node.
   Updated 'riscv,isa-extensions' with new extension strings available
- Patch 13 (Patch 8 in v1):
   Updated the memory address to the hardware truth.
   Added aliases node in board dts.
- Patch 1,2,3,5: Add Reviewed-by and Acked-by collected.

Link to v1: https://lore.kernel.org/r/20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (7):
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      riscv: dts: spacemit: add initial support for K3 SoC
      riscv: dts: spacemit: add K3 Pico-ITX board support

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  29 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 590 +++++++++++++++++++++
 8 files changed, 629 insertions(+)
---
base-commit: 78ffa9bb137071c00eec2d4afc247ef92d5c0b90
change-id: 20251216-k3-basic-dt-cd9540061989

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
