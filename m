Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E0AD185EB
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FYsYoF7dO5+uWK0txq210J4eDwBwHqz/ebcA5548XnM=; b=i29da6jj5cTGCq
	N8EW9eyCR2WZM9C+rpRPaes8SHgWdSjbQzFn4t2QuhNAZo5tXS6ngqjZj+Z/9xNW+jRqqe8y2g37R
	Ou4KwuSItRK2it67DV/X43n9oLILnkzw9nxMbsMXZsTHn3AFG/dp798LfZfmsIHkV+glkc+ZESKwn
	tNP9qSjYqRpCb5/3+gHsz5InrMlm0+zoImXD9b/WPjJOWJ2Zfsl+mCyS/qxi+PClbMHeo2e52YbEJ
	WW8A+OXCjJZjwJhO7RjgCFzBuDYb5pzn4z7UTjrm0qUJWZ3RtJuYEoDeYAjXb9MwYhKwA89dzB06q
	j2M08M6LWMXtjFRjPYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp5k-0000000GzRN-3y1U;
	Thu, 08 Jan 2026 12:26:16 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp5e-0000000GzOr-46y5
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:26:13 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-29efd139227so25037445ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875168; x=1768479968; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5a5Cmx6eSpgB6FweLtrTLFy8CMWvSpkFBSClkOyo2G4=;
        b=2ZVWJqwoZJK9w/bBW6tw5edSkrqOH9XgnGnrCELLztrGz7bN8qHY7xrxLUjRMu9UoC
         tQYOJ6KU3pzRmNEFXin9RvG3iX2swsxGIMtimU5Op2lhSofXplSad5CavxbS4LIdKviK
         661UZiylb+0B0TA5BXSXsbzMyiqQvdxejkuM0mLh7K/sxgi7WtQvGoB2fUuMNYD+tVD8
         nY/hCuDnpkOkA8jFokvOUArSkN0poCZZvP/hmuziDrCl562xT89co6ruAKvdo130M3xL
         Jzj/r9c3PqU+IRIGuK2C24yV+qPA0UTN/FrzYzQfdjIfQw3z/tpJ82Y5fRQjUoT/pr9y
         KDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875168; x=1768479968;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5a5Cmx6eSpgB6FweLtrTLFy8CMWvSpkFBSClkOyo2G4=;
        b=qWDuRpFdNTr4xCXDJxH/D48RFCFi3ewy7IN7osySXCvi9t0kldkxLF7gu5D2mGpzqx
         nkH67FEeoWrP5+sem4/68A80o6bitfrOZ1cxNhK3wMx5UAjo9Iuwc4F7UYvcrWvlvmYs
         bnzB3KtWK2a2lBC8RWkyPupgUvrFgJ3EI2EQ+9SUguoaIt/O3EUfulEs7qPtbdUrwQaH
         zqAO4OokAvf0yn1pPgNnCjLPJNeT6UzMHyA92MKMsQ2i/UcapkTBEDXTUb2w8fN2G8i2
         sxpWOyASSHCeNCJH+hJJQtTRxolSyCBp9LBxC87IOutmU3CWxspAeqEJeLau2YLjjyRm
         RPUA==
X-Forwarded-Encrypted: i=1; AJvYcCXcWnaK0clGkc3yvuMSpC7ftxhDhhKcRfi3TgVjIwWacjQargka36FUyjaY4dHrqerrsxHO0C6kQtpAkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Ubi7tZMyVM2swfKhxwrY+A7qHpf4cTlOlyjNYjYoBv87k9DW
	ZfZUgUI5HWLs6c9WvRPIeJxB/LOQsiYiwP1ktjECSINnjz0NdpsgGmnZjHlsE1HBhOg=
X-Gm-Gg: AY/fxX7TlvdIUPfEu4k6W5J1t97CrKbNBoRc65Fp3ae+vYd6l4OJ4MklH3VG+JibKzh
	ErM8xEeEE186SR2Q9+zNXHmjOnh/8IcVnqx6kGk6SS9oxPeopdZw169wWT9fuczFY6RWwKjNhOr
	qzprvxeD07wkCTx224dYZlZgZIbCkQ9KwYIHAxSQr4SlCB8BYsQR9fPXNjmzgJF7to2n45Tgf5e
	/+mBXOClkKytYrR43wnCd4BKOUJ7zpOfB4amvxTW7mucgVEe7ubVfzmd72wgGZo9oCyH8YVLVql
	t7MzBFd6vytP8FbW3WjBYC0A6NbtoJfPnVlxeTtn7RXKNq1WsmUFy4i/Wgh5TNfQyfZioH8LFRD
	WcdoRzryK8hEiR7ud+qWSZ0Omnlj4iTt5ZPOAUcOvLJOXlwE9YGTUP1NOsUM0LBhJicA9yFhpgo
	Vvamo+vX422E19yRfLO8hugD0DN4YvIK0=
X-Google-Smtp-Source: AGHT+IG5WlQCcSrpKjtmrTKSuTso7FBs91pigsQBNziZVwp1qYR1+jHUes01I7ZrZxHGXnTVwt7C9A==
X-Received: by 2002:a17:902:e5ca:b0:295:5dbe:f629 with SMTP id d9443c01a7336-2a3ee433154mr49122985ad.8.1767875168169;
        Thu, 08 Jan 2026 04:26:08 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:07 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Date: Thu, 08 Jan 2026 20:25:51 +0800
Message-Id: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE+iX2kC/22PQU4DMQxFr1JlTVDidELCinsgFh47oRZqpyRhB
 Kp6d9x2A4jlt/We/j+ZXpqUbh43J9PKKl2Wg4ZwtzG0w8NrscKaDTiYPPho34KdsQtZHpY4T1v
 nos8pGyWOrVT5vNqeXzTvpI+lfV3lq79c//es3jqLjmGKlJkyPDXp1Ae2e1r25qJa4QcO8BsHx
 QPWUAOxqwn/4OdbtVbeP3TfuPUziher/70M3QtQyUPeZoY4JcZEcYYUY62VZs+ID4zOZ5WdvwH
 Ew//JNAEAAA==
X-Change-ID: 20251216-k3-basic-dt-cd9540061989
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042611_284933_15EB7B49 
X-CRM114-Status: GOOD (  16.74  )
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

This series (starting from v2) also adds descriptions about ISA extensions
mandated by the RVA23 Profile Version 1.0 into riscv/extensions.yaml.
There are extensive discussions about how to handle these new extensions
in v2. In v3, here is my best understading of what I think we have reached
consensus on.

The SpacemiT K3 is an SoC featuring 8 SpacemiT X100 RISC-V cores.
The X100 is a 4-issue, out-of-order core compliant with the RVA23
profile, targeting high-performance scenarios. [1]

The K3 Pico-ITX is an evaluation board built around the K3 SoC.

From an RVA23 profile compliance perspective, the X100 supports all
mandatory extensions required by RVA23U64 and RVA23S64.

Hi, Conor

For the binding riscv/extensions.ymal, here's what changed in v3:

 1. Dropped the patch of adding "supm" into extensions.yaml. At the same time,
    I will start another patchset which implements the strategy outlined
    by Conor in Link [2]. I understand there could be different opinions
    and anyway, let's move the discussion about "supm" into a patchset of
    its own.
 2. Dropped the dependency checks for "sha" on "h", "shcounterenw", and
    6 others. "sha" implies these extensions, and it should be allowed
    to be declared independently.
 3. Enchanced the dependency check of "ziccamoa" on "a". Sepcifically,
     - added the dependecy check of "ziccamoa" on "zaamo" or on "a".
     - added the dependency check of "za64rs" on "zalrsc" or on "a".
     - added the dependency check of "ziccrse" on "zalrsc" or "a".
    The commit message of this patch is updated too, to better explain the
    relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".
 4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", making the
    dependency check in both directions.

Thank you for your review.

Other Changes in v3 include:
- Patch 1:
   Acked-by: Krzysztof Kozlowski
- Patch 4:
   Acked-by: Krzysztof Kozlowski
- Dropped Patch 5 "dt-bindings: serial: 8250: add SpacemiT K3 UART compatible"
   as it has been applied to tty-next.

The entire series now rebased on top of tty-next (tty.git), which now merged
with v6.19-rc3.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/ [2]
Link to v2: https://lore.kernel.org/r/20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com

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
Guodong Xu (11):
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      dt-bindings: riscv: Add B ISA extension description
      dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif, and Zicclsm
      dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, Ssu64xl
      dt-bindings: riscv: Add Sha and its comprised extensions
      riscv: dts: spacemit: add initial device tree of SpacemiT K3 SoC
      riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board device tree

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/extensions.yaml      | 169 +++++++
 .../devicetree/bindings/riscv/spacemit.yaml        |   4 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  38 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 548 +++++++++++++++++++++
 9 files changed, 764 insertions(+)
---
base-commit: 322fc12949d2658da8c6b2866fffcb1daa7da019
change-id: 20251216-k3-basic-dt-cd9540061989

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
