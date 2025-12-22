Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB9E674AD
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sBElD+WCJR3hJAoRDWLeZFjtrhOHAwZ4Cck/YN/zT8o=; b=fi6lzR6Bk/zCsX
	UfgrQOeIq9Km/eBjtv67rj21H5NhdQ+7L+d/QtENI6kfsz7foBPynnRts+/pfGPh1lAtZEdPF0zpM
	YZ+v772RjzQwOTJ/ZQ/lJmKE2b+Y0VJmLa86moOfnhs+kPys/Ugw4e77yuhmwbCaU/MMg0JpOFGph
	v7GKoTFRlv0QWo8Re3cLKFU+NfKDxU8TIgjteYu53jboJVuRpnCOUMlyUBbH86Lan9XmIhH8n3Bgz
	QFn9Ji9l438voifieDiOAGg6nTOCnEOPhRxOuz48ba5V/5AHBh3yE0F5F0vuNQhDJe6PTKNt2Ze8M
	3VuPanPLfEnBC/4tQAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfc8-0000000Dm4V-2hXZ;
	Mon, 22 Dec 2025 13:06:16 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfc5-0000000Dm4B-2kzq
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:06:15 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-34c902f6845so5450252a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408772; x=1767013572; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSLBcbUhwlgDEaLrs1/PzmUOuvFFTI4tz34GWoit1b0=;
        b=LTNHH5rCxvfmvOvOt5vnglx2zKoQTmMugQSK0xt5MkjCWAYcCmKIrS1xjxaAKpCsFp
         /FNCumDNFZoKAQKdO1grhBr5M/IwgVui+1vKPeJMq8KO2gP15RKbbvnjQ51OFe8DWYwl
         FNLi5H3muGFyz/b5urxVROBr8mFMWp8eZEs06B5g2AwSgpgtWbGSE5Sl2vcDdgzvUPjU
         PL9wOBtFKai0TCR4p8UeYfeoE7LWuPyNPgE2Z+WziLxJIBy/hiLN22Mjgr/J8n2tmvxA
         kEaabj8Ky64gT0ubdWHKvbddmAtbpFJIRupw3pNhikzhegCA9hPuDgS3ZIOOK44Lv5x1
         50xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408772; x=1767013572;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSLBcbUhwlgDEaLrs1/PzmUOuvFFTI4tz34GWoit1b0=;
        b=jDs/qYsquozNeQEHOeiSw7hIAc1hfjsamgGGsm58ImnkMAuIO6SXLHl9J1jB2I9gcG
         h3f5aulsx5cW+7GRoDqL2giTAF2Xv5m7hvyQX7RLcoxsQ15b+2WAtg54lQ2UeWQE+RcW
         G4kR3zw5x+Y5KeG2b8ZjJjuk3ybQvrRL1TzMGm/o8FlxNPac01LuMnMy3nlcdGnyeu8V
         GLR7gpogVNYApW4PuPWH7CrdFrPdIlzucabSD+tqwDeW2TOMvF/tIEbUsTqw5rZ9Ylyf
         wTtpIt50O5uKqO33afW5IFgZXDo8F9geaZ/QRVyhBrtRDxSy8t+2/PxCrqlBkI/y1x3u
         nvXw==
X-Forwarded-Encrypted: i=1; AJvYcCU2M7va9Y2OKLN2FcPAreC19dKzhGSpoiPMQ+H1E3Dy8tL8nZU9lf110tEJ9uaKXG3xiFV38NOCC8RpGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGwD50vUjMxab0yF98pJdlTV8JfgSLIE0DkORvkiaB8azRzj+g
	kWw/KRdsWqVMOBxSis4wUQFyPs7xaCCHtQot6DosHPlCilv6ZKKqQNCCOxXmRIy0rfw=
X-Gm-Gg: AY/fxX4hLBMP+bV5E14qItIhm8T/RFWFAE2VW/OhQKITF4F7Bh92CpZewDR1C+Gqu1c
	aZAnJbJba/G/sKXgJhaaRjYR04x/W8qVpl24ca3NPAYol5zvdLa9S0jq0n17tzs/tPiwbnahZVs
	FVVH5MZlaDlT4jiYMaZk5au/2qGjJb+HSQDAS2lcp0NB/ZAm6oi4MneGfT9MOlEjWYoJCCY4uCy
	7nXu8Tz+9vpcRXgFGmheILSHb1YSucOkeWd/7woJ8KMQ60tCEuK6DPA7ZNITTzjzctAby+8m5SN
	lDcLZuxfTLi/criN8jN22+1egXVPkXDfTAq8esGqM2G/oi2O4ZS6Dee7myjwbTLb3/B5zHyqaqZ
	bAm/aHQ69F1yyeNpKPfjwxToTDOFYXYsAQ1ylyUSFg/5+9aATphVtMICk9OT8E3EtnogjuCAoG8
	OxT2HHlia0Kmjt2NRL/ANZ1VlKIDRAO2TjcaquDIJLFg==
X-Google-Smtp-Source: AGHT+IHXI9Uk+L57JPJ2MjX19LtjvDYEjxYY7iQ/11Hl0xX72T2G5hRIIcsMHGDw/P1z/NE6Wuw7Mg==
X-Received: by 2002:a17:90b:3c4e:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-34e92139f2dmr9527010a91.13.1766408772522;
        Mon, 22 Dec 2025 05:06:12 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:06:11 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 00/13] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Date: Mon, 22 Dec 2025 21:04:10 +0800
Message-Id: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMpBSWkC/23MQQrCMBCF4auUWTuSRFOMK+8hXcRJtIPYlplQl
 NK7G7t2+T943wKahbPCuVlA8szK41DD7RqgPg6PjJxqgzPOW2dbfB7wFpUJU0FKwR+NaW04Bai
 PSfKd35t27Wr3rGWUz4bP9rf+d2aLBqNJzrcUEgV3EVbSEmVP4wu6dV2/t9tfw6kAAAA=
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
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050614_110506_A8A71C93 
X-CRM114-Status: GOOD (  11.18  )
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
mandated by the RVA23 Profile Version 1.0 into riscv/extensions.yaml. These
additions are implemented in Patches 7 through 11.

The SpacemiT K3 is an SoC featuring 8 SpacemiT X100 RISC-V cores.
The X100 is a 4-issue, out-of-order core compliant with the RVA23
profile, targeting high-performance scenarios. [1]

The K3 Pico-ITX is an evaluation board built around the K3 SoC.

From an RVA23 profile compliance perspective, the X100 supports all
mandatory extensions required by RVA23U64 and RVA23S64.

This v2 series includes:
 - DT bindings for SpacemiT X100 core, K3 SoC, and Pico-ITX board.
 - DT bindings for K3 integrated peripherals: CLINT, APLIC, IMSIC, and UART.
 - Initial Device Tree for K3 SoC and Pico-ITX board.
 - Add DT bindings for mandatory extensions of RVA23.

This series has been rebased to v6.19-rc2.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]

Patches 7 and 8 from the v1 series have been renumbered to Patches 12 and 13.

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
Guodong Xu (13):
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: serial: 8250: add SpacemiT K3 UART compatible
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      dt-bindings: riscv: Add B ISA extension description
      dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif, and Zicclsm
      dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, Ssu64xl
      dt-bindings: riscv: Add Sha and its comprised extensions
      dt-bindings: riscv: Add Supm extension description
      riscv: dts: spacemit: add initial device tree of SpacemiT K3 SoC
      riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board device tree

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/extensions.yaml      | 180 +++++++
 .../devicetree/bindings/riscv/spacemit.yaml        |   4 +
 Documentation/devicetree/bindings/serial/8250.yaml |   1 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  38 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 548 +++++++++++++++++++++
 10 files changed, 776 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251216-k3-basic-dt-cd9540061989

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
