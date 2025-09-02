Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBB1CA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 04:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yd4/RQaH2Tfceen1AhC1qcvQjTx5ctBXoej3VqMXlH0=; b=jeBHbVddGh0jtR
	PR1T9QMlUiOr44VNUbJbi4YyZlSXcZbuEg5zLbYSjb0wMihiwiwBr2gLLmhwkvHg8F1PGGWrUpefS
	PBT462HHV0eGzAjaGo8LvqMOEw8rKzmEChHhgzC0Wtmxx5/pkNUak+Ayr6wJxyf/YsMeum6Jy6Xl8
	OA2PnL7NVgYr7OH4vdgEAU2+W7TjKA+FrRjcsFivk0+WJF8nDdrrcs/1VKYz8G26Am70aZUNpHYED
	ErHc5JHpjahtOTAyGwkyzjLweRySrvXrVPL9195CykU4+ifaC5Evw8gm/sHilygXggdbfFibT1FZz
	3G6IzMqrQiwZxGLRD7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZZ-0000000FCT0-40wE;
	Tue, 02 Sep 2025 04:24:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZX-0000000FCQl-1R18
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 04:24:44 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7723f0924a3so2869518b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 21:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756787082; x=1757391882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELXyWcssNZnLWjFVF7tpe1q7V/V3XE3CzBOArXpJV3A=;
        b=ELvmI5mGFvZnHGH7ESqYHCsrUKoltvRrfFUnH6HOZYOSDaBuejIEh/CsyIx22Q5rWW
         y+WM8JQzE06afjaBAykFYXQHPtL/edccaKwPRFgZWksMAlv8KHqfOVnZh1/EKhHWSL6M
         XawBYuIXeWSw7rM0gXQ3HDutZbYXjjDYZc2hqB/NIkPzAT/kPwOOUmuFzqChnXx4KkZ8
         wKq0MxbeLnpwqz/7OOiwwXJF4fAlrekpLctFK64n/CIM3mOkvhQ02RUSkTD0m6mHRF8e
         uaqAT+4/MQWrbmuI1gxQpedtDA/gifNSjlm+1gqUOJHLTNihAsoNKdGcUXH/MxPm4MZp
         eKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756787082; x=1757391882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELXyWcssNZnLWjFVF7tpe1q7V/V3XE3CzBOArXpJV3A=;
        b=gGFlsXBpICZPWNzKVY0ixnC8Qe69B0TLbA4QPeuPUapsJZ0R1L1CJW6bGWnDCohsmk
         vXpoL9VZbTyrljgGFmtfeD++7M2OG8/BWzVTrbSK0q2SU8T7Gf1XGYcJAXhDoMHkoO/g
         wgD6qijukm02d88xTZWBo9iM8//r5UPB0wgo6bZH5N8/rKxdT1HVzluEC+sEZqv3nj55
         L7zUVuDrckbgGGD7gcVgSXLSzNSaj1O0HXlvo1ASJk9lYXkzYBXV1AtKpNnBr6IR4FAM
         e27uZLqU+VzZRn5EvMNStP8OYPPXopHDgYoSKE4NfFEXd876EzPy2ttULDKSiu+jy4Z9
         mrPg==
X-Forwarded-Encrypted: i=1; AJvYcCXub0TTFOapsfDRp1CupIKZUVUA94VVMDyCx2vDPa7thyGL4FS8I9Xd3SbRXS2o0Rcd+odagjUqmInlKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4KAHL2zSalbZOdvaPZ/rTJlq6yke/bR9n2qEONVZ4yajCfdq5
	4OaH76Ztt9xBh1sNb9jO9ZH1YasvgbMA1nqGUTh9Q8sVG7Lnjgnv4Bfy9A6LSfnKvU8=
X-Gm-Gg: ASbGncuwMpCufQc9T1nfaMYGJr7aRyT4tPIO4LmzwtsujX9V7z3x8fhNy9xnD+sxYC+
	xm5LlVd9yrl8OCJv3sDHfSIgjEb9hOhO06d0g33trZeYe1r8T9aowqAbZqzfnMGnFQEhVx09LMs
	2d+aKGtaZPa5DV26R0oW51EgYQSqa9YHA32zz+4PCcxpEvSdUnPWAGx0bCCFJOp92RqYIfQurkI
	4bDI5vLGc1qC2j+JFVr8NLJOpVhOnTozr3mOITBuloTvchD/V9QtFKpb02EZnxroKLzWOC1nBcG
	8X1ZzVdZgAclFZ5kkxFWXEEJfM7rJUYX93kDgI5SpvEtV7ybbrLnwjbBKhWApun3MrPwTU6X2Ae
	rEGONDoGk8LBeH+VNKH0Eonosz31bgbz/AhVGV68E3XOm0ZYWIbXXeFcdKHyLYinYdHEjnnS8n4
	Cu09pewfYrSuL5opjampt7o21yDfFgNtpEZKDdXtpUraE2VRKr5DCxQA==
X-Google-Smtp-Source: AGHT+IGgZRRv1+lJvcGUzyqHqMqDpjPoMrsqY0dxwET91a5H7O0B+l/j1QflRtVZPNoA7S61H349iA==
X-Received: by 2002:a05:6a20:2589:b0:243:a91c:6561 with SMTP id adf61e73a8af0-243d6f04d71mr13318621637.30.1756787082321;
        Mon, 01 Sep 2025 21:24:42 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e21d14a8sm12216706a91.2.2025.09.01.21.24.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 21:24:42 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
Date: Tue,  2 Sep 2025 12:24:28 +0800
Message-Id: <20250902042432.78960-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212443_381536_E196D943 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

This patch seires has been tested with ltp on Qemu with Brensan's zalasr
support patch[1].

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

[1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/

v2:
 - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to 
Conor.

Xu Lu (4):
  riscv: add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: Instroduce Zalasr instructions
  riscv: Use Zalasr for smp_load_acquire/smp_store_release

 .../devicetree/bindings/riscv/extensions.yaml |  5 ++
 arch/riscv/include/asm/barrier.h              | 79 ++++++++++++++++---
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/insn-def.h             | 79 +++++++++++++++++++
 arch/riscv/kernel/cpufeature.c                |  1 +
 5 files changed, 154 insertions(+), 11 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
