Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXHVJT7W7ze1UxRTEZ2enxe8c3uR2I5WvgjkwQ5WqhQ=; b=yCfVKzV+0N28vl
	KpMDyBBYa1RyWsX5gasmvYsSyrUX3xubq31nWSGK49JItpTU9G0YmB781Y/lNV6LGVk3HAkeqrvvU
	GpdgTDo9GJXoQbKw3U4rF9WTemseFPjjPlOt8K/6e5TGZ5zkA0gWOVjGXgLezXO7VZbLzTjjgcPWU
	0pPzxfg5cbnAFu2CV28D96AJKV22kas5Snun5dC1sNaWQjo7MGGtWLvA2H0q2C/T5yny4SFUepHqz
	1Ue28f0YvT4rGkO5kbFYsWIeixchcGHU6fG+B8CaARtfJElQ7g+VH7HwOzpltE4UC3ersugw0qHAg
	JM70YdUcofycpyV3nPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Py2-00FPiz-KW; Thu, 22 Dec 2022 18:06:54 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Pxe-00FPco-NR
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 18:06:32 +0000
Received: by mail-oi1-f177.google.com with SMTP id e205so2555049oif.11
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 10:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnwlcEHISNopnq+CmFljTGKvcGCFq1+OvWw4yrNda2k=;
        b=d8tCEiLR9bObnRIlPIqM3wxGoJMqDmeJojUu+ej05LkMLKdMwi2xw4Qw4ekHEbJCih
         FNEjQj+NLSPboatuH1Yw/mrLDLVVKUKG3ZhOomeIn2504mggQswzUWWyin/98KifRwak
         Lrz6cYVKAD4zRyVdYjtYJOXGdJGAL13dqggfNLOLKw6Iv5MLGCZAoduf5TYVGlkeByfu
         gA36A1au0YLFLzfKK25zEyMhgTxO0W9o6sj7LlByZXt2WC+Z/r83c8LNX/ymseH8fQyI
         53bBdoVT5BOJ4w9wQ4fYcbX1UIb837e+DP7nb4FwaVXMUZU7krIzdXVJAHi6hGMOJuuY
         JzEA==
X-Gm-Message-State: AFqh2kpmGcxBGFCITDC2G/OKvq0MnE/4W7rIRNJ12rG8dxQPaOeJ5uRm
	itKfAFUG4ZtaErez2ODQOw==
X-Google-Smtp-Source: AMrXdXtk+Mko16yvalIZW/LDiiAqzitC2SvlNmtRx2poVHSuQ4sMiV+x+LWhDW3u3x4vmThZkw7aiw==
X-Received: by 2002:a05:6808:2197:b0:360:d8ca:b809 with SMTP id be23-20020a056808219700b00360d8cab809mr12491600oib.28.1671732388461;
        Thu, 22 Dec 2022 10:06:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m1-20020a05683026c100b0067c87f23476sm596245otu.57.2022.12.22.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 10:06:28 -0800 (PST)
Received: (nullmailer pid 1797084 invoked by uid 1000);
	Thu, 22 Dec 2022 18:06:27 -0000
Date: Thu, 22 Dec 2022 12:06:27 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, atishp@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, apatel@ventanamicro.com
Subject: Re: [PATCH v1] dt-bindings: riscv: add SBI PMU event mappings
Message-ID: <20221222180627.GA1748427-robh@kernel.org>
References: <20221221141548.274408-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221221141548.274408-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_100630_802962_340059ED 
X-CRM114-Status: GOOD (  45.36  )
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

On Wed, Dec 21, 2022 at 02:15:49PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The SBI PMU extension requires a firmware to be aware of the event to
> counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> DeviceTree to describe the PMU mappings. This binding is currently
> described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> since v7.2.0.
> 
> Import the binding for use while validating dtb dumps from QEMU and
> upcoming hardware (eg JH7110 SoC) that will make use of the event
> mapping.
> 
> Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> Co-developed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I asked Rob on IRC about these bindings a few weeks ago & he said he
> would be willing to take them. I have modified wording slightly in the
> descriptions, but have mostly left things as close to the OpenSBI
> documentation as possible.

Please CC the perf maintainers. Might be crickets, but so they at least 
have a chance to see it.

> 
> I'm not super sure about what I've done with the properties being
> correct type wise, I went digging in bindings and am sorta using the
> first thing that "fit".
> 
> Since you wrote the md doc Atish, I put your co-developed-by. OpenSBI
> is BSD-2-Clause licensed so I am also unsure as to what license I can
> use for this binding since that's where I took it from.
> ---
>  .../devicetree/bindings/perf/riscv,pmu.yaml   | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> new file mode 100644
> index 000000000000..d65f937680af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/riscv,pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V SBI PMU events
> +
> +maintainers:
> +  - Atish Patra <atishp@rivosinc.com>
> +
> +description: |
> +  SBI PMU extension supports allow supervisor software to configure, start &
> +  stop any performance counter at anytime. Thus, a user can leverage full
> +  capability of performance analysis tools such as perf if the SBI PMU
> +  extension is enabled. The OpenSBI implementation makes the following
> +  assumptions about the hardware platform:
> +    MCOUNTINHIBIT CSR must be implemented in the hardware. Otherwise, the SBI
> +    PMU extension will not be enabled.
> +
> +    The platform must provide information about PMU event to counter mapping
> +    via device tree or platform specific hooks. Otherwise, the SBI PMU
> +    extension will not be enabled.
> +
> +    The platforms should provide information about the PMU event selector
> +    values that should be encoded in the expected value of MHPMEVENTx while
> +    configuring MHPMCOUNTERx for that specific event. This can be done via a
> +    device tree or platform specific hooks. The exact value to be written to
> +    the MHPMEVENTx is completely dependent on the platform. The generic
> +    platform writes the zero-extended event_idx as the expected value for
> +    hardware cache/generic events as suggested by the SBI specification.
> +
> +properties:
> +  compatible:
> +    const: riscv,pmu
> +
> +  riscv,event-to-mhpmevent:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description:
> +      Represents an ONE-to-ONE mapping between a PMU event and the event
> +      selector value that platform expects to be written to the MHPMEVENTx CSR
> +      for that event.
> +      The mapping is encoded in an array format where each row represents an

s/array/matrix/

> +      event. The first element represents the event idx while the second &
> +      third elements represent the event selector value that should be encoded
> +      in the expected value to be written in MHPMEVENTx.
> +      This property shouldn't encode any raw hardware event.
> +    minItems: 1
> +    maxItems: 255
> +    items:
> +      $ref: /schemas/types.yaml#/definitions/uint32-array

Huh? A property can only have 1 type. I wonder what the tools do with 
this...

> +      maxItems: 3

Better to do:

         items:
           - description: what's in the 1st word
           - description: what's in the 2nd word
           - description: what's in the 3rd word

And rework the overall description to not say the same thing.

> +
> +  riscv,event-to-mhpmcounters:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description:
> +      Represents a MANY-to-MANY mapping between a range of events and all the
> +      MHPMCOUNTERx in a bitmap format that can be used to monitor these range
> +      of events. The information is encoded in an array format where each
> +      row represents a certain range of events and corresponding counters.
> +      The first element represents starting of the pmu event id and 2nd column
> +      represents the end of the pmu event id. The third element represent a
> +      bitmap of all the MHPMCOUNTERx.
> +      This property is mandatory if event-to-mhpmevent is present. Otherwise,
> +      it can be omitted.

No need to state this in freeform text, use 'dependencies'.

> +      This property shouldn't encode any raw event.
> +    minItems: 1
> +    maxItems: 255
> +    items:
> +      $ref: /schemas/types.yaml#/definitions/uint32-array
> +      maxItems: 3
> +
> +  riscv,raw-event-to-mhpmcounters:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description:
> +      Represents an ONE-to-MANY or MANY-to-MANY mapping between the rawevent(s)
> +      and all the MHPMCOUNTERx in a bitmap format that can be used to monitor
> +      that raw event.
> +      The encoding of the raw events are platform specific. The information is
> +      encoded in an array format where each row represents the specific raw
> +      event(s). The first element is a 64-bit match value where the invariant
> +      bits of range of events are set. The second element is a 64-bit mask that
> +      will have all the variant bits of the range of events cleared. All other
> +      bits should be set in the mask. The third element is a 32-bit value to
> +      represent bitmap of all MHPMCOUNTERx that can monitor these set of
> +      event(s). If a platform directly encodes each raw PMU event as a unique
> +      ID, the value of select_mask must be 0xffffffff_ffffffff.
> +    minItems: 1
> +    maxItems: 255
> +    items:
> +      $ref: /schemas/types.yaml#/definitions/uint32-array
> +      maxItems: 5
> +
> +required:
> +  - compatible

I assume at least one of the other properties must be present?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmu {
> +        compatible = "riscv,pmu";
> +        riscv,event-to-mhpmevent = <0x0000B 0x0000 0x0001>;
> +        riscv,event-to-mhpmcounters = <0x00001 0x00001 0x00000001>,
> +                                      <0x00002 0x00002 0x00000004>,
> +                                      <0x00003 0x0000A 0x00000ff8>,
> +                                      <0x10000 0x10033 0x000ff000>;
> +        riscv,raw-event-to-mhpmcounters =
> +            /* For event ID 0x0002 */
> +            <0x0000 0x0002 0xffffffff 0xffffffff 0x00000f8>,
> +            /* For event ID 0-4 */
> +            <0x0 0x0 0xffffffff 0xfffffff0 0x00000ff0>,
> +            /* For event ID 0xffffffff0000000f - 0xffffffff000000ff */
> +            <0xffffffff 0x0 0xffffffff 0xffffff0f 0x00000ff0>;
> +    };
> +
> +  - |
> +    /*
> +     * For HiFive Unmatched board the encodings can be found here
> +     * https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf
> +     * This example also binds standard SBI PMU hardware id's to U74 PMU event
> +     * codes, U74 uses a bitfield for events encoding, so several U74 events
> +     * can be bound to single perf id.
> +     * See SBI PMU hardware id's in OpenSBI's include/sbi/sbi_ecall_interface.h
> +     */
> +    pmu {
> +          compatible = "riscv,pmu";
> +          riscv,event-to-mhpmevent =
> +              /* SBI_PMU_HW_CACHE_REFERENCES -> Instruction or Data cache/ITIM busy */
> +              <0x00003 0x00000000 0x1801>,
> +              /* SBI_PMU_HW_CACHE_MISSES -> Instruction or Data cache miss or MMIO access */
> +              <0x00004 0x00000000 0x0302>,
> +              /* SBI_PMU_HW_BRANCH_INSTRUCTIONS -> Conditional branch retired */
> +              <0x00005 0x00000000 0x4000>,
> +              /* SBI_PMU_HW_BRANCH_MISSES -> Branch or jump misprediction */
> +              <0x00006 0x00000000 0x6001>,
> +              /* L1D_READ_MISS -> Data cache miss or MMIO access */
> +              <0x10001 0x00000000 0x0202>,
> +              /* L1D_WRITE_ACCESS -> Data cache write-back */
> +              <0x10002 0x00000000 0x0402>,
> +              /* L1I_READ_ACCESS -> Instruction cache miss */
> +              <0x10009 0x00000000 0x0102>,
> +              /* LL_READ_MISS -> UTLB miss */
> +              <0x10011 0x00000000 0x2002>,
> +              /* DTLB_READ_MISS -> Data TLB miss */
> +              <0x10019 0x00000000 0x1002>,
> +              /* ITLB_READ_MISS-> Instruction TLB miss */
> +              <0x10021 0x00000000 0x0802>;
> +          riscv,event-to-mhpmcounters = <0x00003 0x00006 0x18>,
> +                                        <0x10001 0x10002 0x18>,
> +                                        <0x10009 0x10009 0x18>,
> +                                        <0x10011 0x10011 0x18>,
> +                                        <0x10019 0x10019 0x18>,
> +                                        <0x10021 0x10021 0x18>;
> +          riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0x18>,
> +                                            <0x0 0x1 0xffffffff 0xfff800ff 0x18>,
> +                                            <0x0 0x2 0xffffffff 0xffffe0ff 0x18>;
> +    };
> -- 
> 2.38.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
