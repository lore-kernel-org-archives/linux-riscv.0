Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613ACC5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5bGMJhYJEkwg0Fhp97VJJuxr/KSoXasssZjvQF2wKpk=; b=WLXAaYzJLufnOCEGIJmh+8id4x
	pMozNln0Tei5vQoGU31GMsAGKbZ8bKl6GlJAKjY6CCGENkP6Bcq1+rrNXZdubOtPfJgID0UaS51PZ
	3MXV7aIJKKdarWl88HneFHgXzNrCd7ZJLcIxVz+mAFmacgWyWxipbibl5wEGyOjzb73BR2QZ9MgPY
	FvW0Ee40mZ86RCnoxxeZU2TiPVOqnBA2e8oqjJyxXre75krP1kclOKP6SCr2SM6gPFMzt/iFAl6P2
	J9ZLRuxS+92YUMpAs2x1BVkrG8adCLzU5ZEcS8wjcZ/x0rPtsIGtOmES6eTqEqjD+e7vy/f+FzeIB
	2SwNKGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rctfr-00000002YC3-04ng;
	Wed, 21 Feb 2024 20:58:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rctfm-00000002Y99-2cZB
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 20:58:36 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d93edfa76dso46368745ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708549113; x=1709153913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+tU7eObkjYjs1vfTPBX473q/rKEbyH/Wex2trZa7yA=;
        b=UN4NDxINyfKD4Ct7gCOwsAcv8e/8CLOyPdX9OE9CZH4KouMkmASQB7btLkTKHzjw5s
         xLZcKC7llX3W7aKA81gLRQkGSbwp5043W8grtqm4VbFaerb95ERgd6O1L2kjf3Xz5r6o
         su/skyeU3FdSU/gkwBb4kWeDHGuMuTZfkNSNr6Nem2jvq7rAPcwdfpYkFNW+g3Pqc7pq
         9SgH8ygr5uhSV6puk9P19US45dfAFQfx5yEPkQgPeEI/Qr+fxIZgf/sAVbIinah2J5wu
         xEs2PXJcSUVQ7zZJz11RXFVWb3ppy9CnshDuZEb09aB2OH5A4ThzuN0vhhfddX4aGMgX
         ErzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708549113; x=1709153913;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+tU7eObkjYjs1vfTPBX473q/rKEbyH/Wex2trZa7yA=;
        b=bXf0IM3MVzXRLAXmcQaMbBdNrKSAuZC19+uABtiPBnsIl/ogpKt7oW/ecNnLWJ+/u3
         c/MhwxT/T3RXczubc8n27W0DyFkhm67Yq+4ZS62Q7SFrCskT7GaP0FB59XrTE+oz0Zeg
         Oln+3K42B8uh/wNi+8/7OSL67eHujlXg4jYveXHhgE/zd9WbNBlITATAe8ufopndQQDh
         ivT/vpI/COI53RKHKaO+O/JFWgQIcWjGfr+aYfTwLQDLdmjCgx67vP/OaRhXhqvGnRxY
         hIztDCz3lyxSnwBhbMDY/fSUFMPhW8lOG9hcYUfSDfRoGZgptxBdRwuqLRS8cruDii8/
         h+YA==
X-Forwarded-Encrypted: i=1; AJvYcCVQv6F+8epQw2LfYYbZV6UMauLM+6yfS7TBlD8at/TTbcrXx2o5GVub+H7q6HF0eeolJNi6TFlKiwCey3xhfpbXsADvvrXm672TO0YjB4LN
X-Gm-Message-State: AOJu0YyiuSUnRWj1w73fX+OydhdsDuXFxErs6n0kXc41tevTD7Sjrmd1
	nwDyImFLy2g6yH5O2UglSv90NULkO/dLpuDWUXZ5GX4Ja9ll0Nw+ddfYa8mzMJE=
X-Google-Smtp-Source: AGHT+IFE+PZQn+UmaaW8t5TQcd5db2AP8n7T//Ds6WRmFRk+fZnuSEKbOzi1SIKbGiLp5zwIJMhyjw==
X-Received: by 2002:a17:90a:15cf:b0:299:3c25:4248 with SMTP id w15-20020a17090a15cf00b002993c254248mr3727507pjd.38.1708549113387;
        Wed, 21 Feb 2024 12:58:33 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id st4-20020a17090b1fc400b00296a7ac8b5fsm2374093pjb.6.2024.02.21.12.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 12:58:31 -0800 (PST)
Date: Wed, 21 Feb 2024 12:58:31 -0800 (PST)
X-Google-Original-Date: Wed, 21 Feb 2024 12:58:29 PST (-0800)
Subject: Re: [PATCH v8 00/10] Support Andes PMU extension
In-Reply-To: <20240129092553.2058043-1-peterlin@andestech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: peterlin@andestech.com
Message-ID: <mhng-b85cfae6-43ef-42ac-94b4-d0f4ce2d0940@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_125834_914478_6E5E0C8B 
X-CRM114-Status: GOOD (  20.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, irogers@google.com, Heiko Stuebner <heiko@sntech.de>, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, peterlin@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, Conor Dooley <conor@kernel.org>, linux-perf-users@vger.kernel.org, Evan Green <evan@rivosinc.com>, inochiama@outlook.com, jolsa@kernel.org, wefu@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jan 2024 01:25:43 PST (-0800), peterlin@andestech.com wrote:
> Hi All,
>
> This patch series introduces the Andes PMU extension, which serves the
> same purpose as Sscofpmf and Smcntrpmf. Its non-standard local interrupt
> is assigned to bit 18 in the custom S-mode local interrupt enable and
> pending registers (slie/slip), while the interrupt cause is (256 + 18).
>
> Linux patches based on:
> - ed5b7cf ("riscv: errata: andes: Probe for IOCP only once in boot stage")
> It can be found on Andes Technology GitHub:
> - https://github.com/andestech/linux/commits/andes-pmu-support-v8
>
> The PMU device tree node used on AX45MP:
> - https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md#example-3
>
> Locus Wei-Han Chen (1):
>   riscv: andes: Support specifying symbolic firmware and hardware raw
>     events
>
> Yu Chien Peter Lin (9):
>   riscv: errata: Rename defines for Andes
>   irqchip/riscv-intc: Allow large non-standard interrupt number
>   irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
>   dt-bindings: riscv: Add Andes interrupt controller compatible string
>   riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes
>     INTC
>   perf: RISC-V: Eliminate redundant interrupt enable/disable operations
>   perf: RISC-V: Introduce Andes PMU to support perf event sampling
>   dt-bindings: riscv: Add Andes PMU extension description
>   riscv: dts: renesas: Add Andes PMU extension for r9a07g043f
>
>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +-
>  .../devicetree/bindings/riscv/extensions.yaml |   7 +
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   4 +-
>  arch/riscv/errata/andes/errata.c              |  10 +-
>  arch/riscv/include/asm/errata_list.h          |  13 +-
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/vendorid_list.h        |   2 +-
>  arch/riscv/kernel/alternative.c               |   2 +-
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  drivers/irqchip/irq-riscv-intc.c              |  88 ++++++++++--
>  drivers/perf/Kconfig                          |  14 ++
>  drivers/perf/riscv_pmu_sbi.c                  |  37 ++++-
>  include/linux/soc/andes/irq.h                 |  18 +++
>  .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
>  .../arch/riscv/andes/ax45/instructions.json   | 127 ++++++++++++++++++
>  .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
>  .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
>  tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
>  18 files changed, 494 insertions(+), 39 deletions(-)
>  create mode 100644 include/linux/soc/andes/irq.h
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case someone wants to take this via another tree.  I'm also OK taking 
it via the RISC-V tree, pending a resolution to Thomas' comments on 
patch 2.  For now I'm going to assume there's a v9 coming.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
