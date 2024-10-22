Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6894D1715E
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 04:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1W1Xy+aB3mDynBCF396LEG8XFndKAINzhlN/cWFCDe4=; b=hdTkPQhjBWOU5u
	+wT0GuOIKZQuigskAJr7oqARauM5nfkEFULXYwNO8GxaONwuiAQgmjne0vSTtEtRjMxRlcMxrR/5d
	wmeYLZC4Tc5RZMW9atSUJu4rXR0XAtU0Ld1UD3ey32dm9AkJfdLtNY7ZdIAQ0C9DEnZn9ephyTjbj
	qY93N1cq2jK7qY86Hejtr7rEddsTJfUU09YvgVSZstZjUnZOkPm+6tRIDpygWgDzKRc3HjFhHmi80
	63smmqhN3AfA3LaizC9v4rIJ6lXN7brMaP4g/xbdTs86HHfh3kqz5A1V1D1eixzZuYqaVjUVbF4hi
	8duciWbzY47aTRh/p58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t366W-00000009WI3-0dB9;
	Tue, 22 Oct 2024 04:02:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t366S-00000009WGt-2vef
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 04:02:42 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so3453977b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 21:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729569759; x=1730174559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nea/uoG8iPW4a7XYpG+H39uNOfUSPgNFFD6MagPMBtI=;
        b=Bxe4w6/B6vCrjxnYfpJFl5Fmw5XNpu1hcr9f1a8AHRvPIn1NjbrBG5LV9oKzECbCSb
         qd3f4cpYDqIFyphBnwJFLQx0VVPqzgZgF6NAmwFW5ZaGzDKfuzCiFOMu+JPkxPBBySpr
         5Joe0TqwkaZkVF5B4E8ZrQhclrR0qFJtlW0QSdDciR16F3mqbeBKKujbWl/EvEX6ljHc
         bP5Lry+CGmqjsSjMOZkDZercqylLhoQOveU2/VY+bD5mmaNoz87QN1And+n/wahoOoFQ
         PnXwkoQfWgowVUEkOCN2zqhNhbFCfKb+j5h1wAVI9lVlmgt/pg+ONe0vzwgov9x/JjCN
         rLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729569759; x=1730174559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nea/uoG8iPW4a7XYpG+H39uNOfUSPgNFFD6MagPMBtI=;
        b=IlSkmnH668ag2rYHLyWcXGQDQxnZOvSZvbZ+HfvYoxhctANBbE30AprYtALAsoCtAa
         kcxFPx4s+af53ZjFmlaL8COWteKwpTDNzo6HVgAD+taO2fkoSieHhokYNhk8Nud3ykuM
         LrurczlD4J3gFK6j14XDDuL8Dfmsp+p+SjN1sBBWNPubU8fbC73FOKJgcQKAM4ptQBiO
         DGnNcWAcK53p4MXgJulGNuIiC9fW+BK3DbQcWRjc8i+FIjgXSQF0wNYnTCyM3szmPwXo
         Tb9cTNRxvmxZI9p4+7nRyohHqD778zOLzvpC5YRz7cLLMRU0KIHhx21VYW3T49ASzK/8
         VirA==
X-Forwarded-Encrypted: i=1; AJvYcCUsZoWWg5E/7DFKsLju/qYwmXL0vwkJgkcheZqIAlYyP680hpnGE6KnmSG0EdnVwUYJJPsYL4OQ5K8yZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ZvxCPbKp95gz27TOqLbYBKoinzIsT0wazW7BilJ8WwSKAbrz
	I3zONsmkdWF+xjEmxkdJOAvW4HG4PzPmfhyldsE2tUQZksWUU1PZ
X-Google-Smtp-Source: AGHT+IHNtZXGUiNVcCrwfzac/NGxd/pCUL64tbYSFBn9zGC3zRO1Pl8NFNRTEdokdy8Jo0pfuy/WvA==
X-Received: by 2002:a05:6a00:1acd:b0:71e:74bf:6b1a with SMTP id d2e1a72fcca58-71ea32d4226mr19927835b3a.16.1729569759299;
        Mon, 21 Oct 2024 21:02:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d7478sm3713087b3a.128.2024.10.21.21.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:02:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/3] riscv: interrupt-controller: Add T-HEAD C900 ACLINT SSWI
Date: Tue, 22 Oct 2024 12:02:14 +0800
Message-ID: <20241022040218.450573-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_210240_762112_9E6A6713 
X-CRM114-Status: GOOD (  11.62  )
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

New version of T-HEAD C920 implement a fully featured ACLINT[1] device
(This core is used by Sophgo SG2044). This ACLINT device provides a
SSWI field to support fast S-mode IPI. This SSWI device is like the
MSWI device in CLINT/ACLINT, but for S-mode. The only thing is different
from the draft is that the T-HEAD version SSWI needs to write 0 on the
SSWI address to clear the IPI.

Add full support for T-HEAD C900 SSWI device.

[1] https://github.com/riscv/riscv-aclint

Changed from v1:
1. patch 2: use computed reg offset to avoid uncessary reg additions
   when setting/clearing irq.
2. patch 2: fix mulitple format issues and improve some comments.
3. patch 2: disable cpu irq when CPU is stopped.

Changed from v2:
1. patch 2: add SXSTATUS.CLINTEE check for T-HEAD cores.
2. patch 2: add select GENERIC_IRQ_IPI_MUX in Kconfig

Changed from v3:
2. patch 2: add SMP depends in Kconfig

Inochi Amaoto (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
  irqchip: add T-HEAD C900 ACLINT SSWI driver
  riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers

 .../thead,c900-aclint-sswi.yaml               |  58 ++++++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/irqchip/Kconfig                       |  12 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-thead-c900-aclint-sswi.c  | 176 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 6 files changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
 create mode 100644 drivers/irqchip/irq-thead-c900-aclint-sswi.c

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
