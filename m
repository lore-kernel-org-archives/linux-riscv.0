Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430CB606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3z29Z96U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTeenUyO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lPzDv6wcIuzfi1XZip6YIBrgx3uA+5DL9pEc5P14jGs=; b=3z29Z96UweM1KkjluTVYktU+WN
	Zjr8O00oVzPTfcXh7VlJ7j9YJIZRjHJK/cnTrYv1RYG8xlTC6+9Rz4FSIIM620VXANV7kAoI95TQe
	PDksWH4Fs/A0bl83tZPF5wXfC39DFkjIN1S/zIT5HGRx3rtYT/MkJqUjs/cfDdJkgYehSQwq83Sib
	B+JB70fvg3B0A/svVkK1vrWfNzV7nxP1dfLviJ/vDKkLE9EmUz5q2B71aVwKa+mTcIrTqhD/nH76L
	UPLJpcqIeKUeMwgsISWIeLcyGMzMkKRlLAtGT0jis+28y3ATVOcAwOPqcrf/rBxl0LEZdqPL63ex2
	lcW3AroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIKx-00000008McH-2sYS;
	Thu, 29 Oct 2026 05:06:04 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIKr-00000008MbR-1ebb
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:06:01 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1665464a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250355; x=1793855155; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qzyK/sep4k0pgE8m3Kj8rFxd4gj+fEVyhh5FmlJnLT4=;
        b=RTeenUyOUfRxTZtLZAOPsMM7CPdWrj45/FsV5zkr7AO8BCsVQaCvf1tPrgHEcZWbt1
         t8PLfCY/LXqBWntnRyHMfZsb5eTf/JZh8pTO3MPg3BkCB1MQYJXA9tE6jBM0UUsTSGuC
         Sb6QmM76/X1ksTRkij2+qMOXjy3Sw88IN9KQ8XjhIeBfGylSm71Gj4f+fquCf2vS4oYf
         ZFk1PTLtfq90buuzvf/S2FJdywaSgUFYQeE0vi+Nx4oD2Yr+7klmuSwFhv/JHxeRUsr4
         9eQ5YwRKzWX02V6tIwavqkFoIwdm+GYzbiHalkIfJytD90A37YPzN9SvoRS20ZgSYEJs
         jZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250355; x=1793855155;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzyK/sep4k0pgE8m3Kj8rFxd4gj+fEVyhh5FmlJnLT4=;
        b=TjIuYkqMNI1uRPSAiVx9oXJev27A3ZgrDqPlAB4kv4UgU0lfxdKWg0y7/QNFGWQ8o7
         GbKx1ptP3P4U2a9iJL8dvgdZshCkqn0bcYXd3ryYzYE2Pz6x5veharPYEl2MTK9k9KlL
         oKE0CKQw8sK3XmIgdcvU9kV1cp9SRlMXVkHkjEI6i2BvPlExFpZnMfmtEXCwY3ZWR2pc
         w1mjx9OyQJqJhlY04CHI/aBq3MxyZSR9KIxSJnm0Z1WmuMQAX5rqPA6IGgzGUC5UrV1U
         2y0a13gGQ9Mmb5qsPUPPJiiiyXR0CtvtQSX+Xw7TYP/B4eP5FlYPKoan0Ki5xR6llcqm
         3xSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcFfM4ACgE04SFlDT6IlI+UH0bSKT/Z15jUUIQ+DbaG5+jgro0DXLN4LOZAYWFoLVd2NxrAkAE1d+ZTw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLz8GFYvcj6DdcCyVzjYGHN7r8B3drsOS5MA4t1MFBb7eMlIg2O
	Hny3d8HYYmAiY9MxzJOdPyR9oeH70IRHcisP5h5npTS1Wnvdj85dws6s
X-Gm-Gg: AYBFou2dXGBvLekAphg/5LXYcJwsfXmkn2adcjUJ7AIuQwhGvSXvCkYQJ+dPTdZkyPZ
	+sZJAeRmM59EFysJF2MR9U98xTF335z+ZKjdkBsA0M3RMjRMM2ENgqHRm/xc9p8MQLiU+IIGcsY
	EZ+l+g/GV4TPT8YPxzOj1TVTtJAQiZp3dK4rDRvWF6KLzd5nbWuf2DdaMwXJwmtonqwQkAlSJ37
	lcnDlwKqYIl9EhGaxNnh9gjpp+xR3QRzT/rwXF9iDuD2OpDul61JByXEalX2nn84RseXkVgAu5Z
	fUhRk5y3kho8NJmXdJS5A9lmruhVXpwTX20nVaTXAx7pe9OpaQFyNiGKpLzHEnX4f9FovfLm+hR
	jXp9pqmY5IhMBPMQR8YEw2mi7VlpcdlL++vA67UjyEUefUad/qWc8PJo+2KrHC6b/PJiH3BDaKh
	2dQ5mS193jUL2Thv8ZV8u88RjzJRyegl/GWws1oHayTFaGLiL0jSskuuss3qhHy1GsAMH92Tq/i
	U1VVJh24yx9D7TqzMJFVTm1ecpz4KxRqk/papc+XsGjeNkIEI4fYqoQC/XN5O7+NA+zGh5kNnqa
	7KeInYBD0NgKhiHti9mP434SU2Sx
X-Received: by 2002:a17:90b:562e:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ae580dd6d0mr3805262a91.46.1793250354465;
        Wed, 28 Oct 2026 22:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:05:53 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Subject: [PATCH RFC 00/12] Add BL808 UART3 support with a Rust serial-core
 polling console
Date: Thu, 29 Oct 2026 01:05:41 -0400
Message-Id: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACXU4moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNT3aLS4hLdpBwLAwvd5Py84vycVF3DtKRUw8Q0YxNjkxQloMaCotS
 0zAqwodFKQW7OSrG1tQDtuKqpaQAAAA==
X-Change-ID: 20261025-rust-bl808-console-1fbe1af3434d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_220557_636170_8B3E014C 
X-CRM114-Status: GOOD (  13.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce minimal Rust serial-core abstractions and a single UART3 polling
printk console for the BL808 D0 and Sipeed M1s Dock.

The BL808 is a RISC-V SoC used in boards such as the Sipeed M1s Dock
and PINE64 Ox64 [1].

The serial abstractions and their BL808 consumer are adjacent patches.
Port registration is owned and device-managed. The adapters provide UART
locking for termios changes and normal console writes. Userspace TTY I/O,
RX, interrupt-driven transfers and DMA are not included.

I kept the driver limited to polling console output for now, so the
initial driver and Rust abstractions stay small. Does this seem like a
reasonable starting point?

The Rust abstractions cover only what this driver needs. Is there
anything missing that should be addressed at this stage? I'd especially
appreciate feedback on the port ownership and locking interfaces.

UART3 is registered as ttyBFLB0, using line 0 of a one-port driver. The
board selects it through a full stdout-path at 115200 8N1 without aliases.
Firmware initializes clock routing, gates, reset and pinmux; the board
provides the existing 40 MHz fixed baud clock.

Jisheng Zhang previously submitted BL808 platform support with a C UART
driver in 2023 [2]. The UART compatible, bflb,uart, is reused from
Zephyr [3].

This series depends on the exclusive MMIO reservation fix posted at [4].

[1] https://pine64.org/devices/ox64/
[2] https://lore.kernel.org/r/20230518152244.2178-5-jszhang@kernel.org/
[3] https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
[4] https://lore.kernel.org/rust-for-linux/20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com/T/#u

---
Kwanghoon Son (12):
      dt-bindings: vendor-prefixes: Add Bouffalo Lab
      dt-bindings: interrupt-controller: Add BL808 PLIC
      dt-bindings: timer: Add BL808 CLINT
      dt-bindings: riscv: Add Bouffalo Lab BL808
      dt-bindings: serial: Add BL808 UART
      rust: serial: Add minimal serial-core polling console support
      serial: bflb: Add Rust BL808 polling console
      riscv: Add Bouffalo Lab SoC selection
      riscv: dts: bouffalolab: Add BL808 SoC
      riscv: dts: bouffalolab: Add Sipeed M1s Dock
      riscv: defconfig: Enable Bouffalo Lab SoCs
      MAINTAINERS: Add Bouffalo Lab BL808 support

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/bflb.yaml  |  21 +
 .../devicetree/bindings/serial/bflb,uart.yaml      |  57 +++
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  13 +
 arch/riscv/Kconfig.socs                            |   8 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/bouffalolab/Makefile           |   2 +
 .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts |  18 +
 .../boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi     |  19 +
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi         |  70 +++
 arch/riscv/configs/defconfig                       |   1 +
 drivers/tty/serial/Kconfig                         |  16 +
 drivers/tty/serial/Makefile                        |   2 +
 drivers/tty/serial/bflb_uart.rs                    | 334 ++++++++++++++
 rust/bindings/bindings_helper.h                    |   2 +
 rust/helpers/helpers.c                             |   3 +
 rust/helpers/serial.c                              |  33 ++
 rust/kernel/lib.rs                                 |   2 +
 rust/kernel/serial.rs                              | 505 +++++++++++++++++++++
 rust/kernel/serial/console.rs                      | 107 +++++
 rust/kernel/serial/termios.rs                      | 104 +++++
 23 files changed, 1322 insertions(+)
---
base-commit: b7ac81a9d691d0af65a5e1d3e16ef03d5dc8f2b4
change-id: 20261025-rust-bl808-console-1fbe1af3434d

Best regards,
-- 
Kwanghoon Son <asdfkwang@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
