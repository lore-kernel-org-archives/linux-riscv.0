Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF86C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 18:58:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7B560E09
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 18:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F7B560E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33G5g4RE2lF7qaeTqISOKYQ+VCtH59fykGFllrTk7Fs=; b=Exztr7ksVM8O8T
	tY+5eQFdvRGszBCvqHW/XaEmy0fecnvOBWfdXcJOeryqXdSnYSrzDF5d5MD5PYgmeHdkIaLxYTmgH
	Cc7Ua46vFDZOtMGd2tL9QYGXUCrpZ0KIuF/fWvUnFMuBR3W5GqWdLLHyckyAKof8rL436hULOeVca
	8eKC3z98yxCLCi63L8cWx+SQrCqfXq8l6urIqwXn8eXCyPQTzJWEcBxBxfhpM/4ThG16Y3P8QmgIb
	OlXc9GC6bzykvag3GSFE/dM2s28i+eqS3KflFA5OTCJr49XXC6+KhoQWsVopkNnJFg/6tgy1V6JAy
	l3Tc85jfBThvmIo5gRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfRdv-002pGu-24; Tue, 26 Oct 2021 18:57:51 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfRds-002pG2-6T
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 18:57:49 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 107-20020a9d0a74000000b00553bfb53348so142040otg.0
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 11:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yXb5tcc4h5n8tVs/+ZyUdUiPi8sa74ADcNZ1YwYZr1s=;
 b=IJiTSGWsaHPCp5eYSs3cy02Si0GOH8OJ64XX2ItfP2YC8e3jObXpQB3krIhmbXQSxw
 5mOYyGsh9yi4u0FABnQKAl1fuV3rlwMdOcY8HrjT6dD77JSQktJK8GLcu2Au+oUQb11V
 V2hVBu2gFqL/ovSjM57HK89EMxHzYLox3py2VrWbQnJoNhgWW061wkCnoF+8l5a3p6+3
 UflCLmnD7r5EBFcVNnPpgwFwtmJS24HaiddcfSD/QmFVVzfTdjhFebhbA1ylVRzQHkYy
 gJOYygeXLmeqa57L02yWnHcu3i955BnBxvvUVaQv3Fm2Hd62UkPGB3TxUnqiqDqoBiwn
 98dw==
X-Gm-Message-State: AOAM532wpSbeE/AleombwNL9mfdZ56agMNIqaVa3vIOBtZk6c2W6I35K
 MEWhFQvWEtOq2Fd3Owf46w==
X-Google-Smtp-Source: ABdhPJwEJfXe5iZi4Vv8sIh0PxJX00V4HchBP4pLf1W0FS/HoJN7GA+G5Fl71yFEWjMyw/vG8nFccQ==
X-Received: by 2002:a9d:57c9:: with SMTP id q9mr2845956oti.281.1635274667337; 
 Tue, 26 Oct 2021 11:57:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k26sm596627otp.42.2021.10.26.11.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:57:46 -0700 (PDT)
Received: (nullmailer pid 3030040 invoked by uid 1000);
 Tue, 26 Oct 2021 18:57:45 -0000
Date: Tue, 26 Oct 2021 13:57:45 -0500
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [v4 06/11] dt-binding: pmu: Add RISC-V PMU DT bindings
Message-ID: <YXhPqfpXh1VZN07T@robh.at.kernel.org>
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-7-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211025195350.242914-7-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_115748_290353_106540D0 
X-CRM114-Status: GOOD (  20.07  )
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

On Mon, Oct 25, 2021 at 12:53:45PM -0700, Atish Patra wrote:
> This patch adds the DT bindings for RISC-V PMU driver. It also defines
> the interrupt related properties to allow counter overflow interrupt.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/perf/riscv,pmu.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> new file mode 100644
> index 000000000000..497caad63f16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pmu/riscv,pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V PMU
> +
> +maintainers:
> +  - Atish Patra <atish.patra@wdc.com>
> +
> +description:
> +  The "Sscofpmf" extension allows the RISC-V PMU counters to overflow and
> +  generate a local interrupt so that event sampling can be done from user-space.
> +  The above said ISA extension is an optional extension to maintain backward
> +  compatibility and will be included in privilege specification v1.12 . That's
> +  why the interrupt property is marked as optional. The platforms with sscofpmf
> +  extension should add this property to enable event sampling.
> +  The device tree node with the compatible string is mandatory for any platform
> +  that wants to use pmu counter start/stop methods using SBI PMU extension.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - riscv,pmu

Only 1 version? Every implementation detail is discoverable in other 
ways?

> +
> +    description:
> +      Should be "riscv,pmu".

Don't write free form text of what the schema says.

> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +additionalProperties: false
> +
> +required:
> +  - None
> +optional:

No a json-schema keyword.

> +  - compatible
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    pmu {
> +      compatible = "riscv,pmu";
> +      interrupts-extended = <&cpu0intc 13>,
> +                            <&cpu1intc 13>,
> +                            <&cpu2intc 13>,
> +                            <&cpu3intc 13>;
> +    };
> +...
> -- 
> 2.31.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
