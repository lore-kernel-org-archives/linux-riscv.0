Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EAFC49EA6
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 19:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA8B6100A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 19:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA8B6100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWdRF/wNrsrvS/9D14mtOj1oKgDFjHUoqBRQYGCkIKU=; b=ReVsSZUP33CYjY
	BzvXY6IxBPxyzQsxcu4+Nx6UgrPWIUtz0Gu4auIDWWT4+7NHxG/wDvsdpHZC9PiKVYiVDfqoUhX5m
	ZWC/wCQSx8USJ7XD1ofsQaTesILsFFIa3e9iR1wr3Ncj7SMg6VB4G0MyomJj5b0tc0bXxQ4KYQX/o
	c6tehnuN92xlShoShk+0PLB/oFQCv8Fjxqv2uZIGUQ6cE5cLxUWv1b0A9EJJdIPOAosUArtbcwv+H
	UDrnxqxfNeLDdA9SiL+SkxAZ+dtv3JOY5lL+vghjuVO07JOi9CboEfwPv759dOD/B8BIU+FR8cDm+
	tn9MrSopt1l4JIIHwg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwVAW-00G4Ny-HY; Thu, 24 Jun 2021 19:37:44 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwVAT-00G4N7-PJ
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 19:37:43 +0000
Received: by mail-il1-f171.google.com with SMTP id i12so7460846ila.13
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 12:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BWhye/6S8g9hGkNXlGHIocDBMqgPBs5Mtuh6KXd+3tY=;
 b=V8iVlkRcXF4AU/qFOxTn3zrc3ESK5C204QyJI2oyjojqFIVennhekaxv2s9p3TA0fm
 8pS3BHW+pLujg5tN7vQeDhdH9BWkqWLtE/kcgMapaI9831Q6+zGu4wjCEaVtKupAwX5c
 m8YSNmg3wC7Ogo9CNVOCyX8u5aQsKlVyHUh3lVmdwug/1bYqTzOEv+r5lbs8hA/UWWaN
 RaXWtw/T/UuhMKgME9dAAeXzofDALgeqsaesA4VOo4aYur3Tx74KziNd/HimBcoi2K2f
 lbQiPiGl+RCQbbfg/QA3l+xwbRY7a7Nc/S1MFCgNo2Txxor2EqHaol7nreqnQPhPWEKz
 an3A==
X-Gm-Message-State: AOAM532FCQ17FQZJJPN/RsdLJldo6V3ah62jmMGHHiHnzvWn/Vui36vK
 FFtgilTXzvpxTKoc0L2jnw==
X-Google-Smtp-Source: ABdhPJwSd8/oiajVe2YqxqKTvKQy/jjMa32+1wKg7yUUaZPVJEVf6zw3457IUh+MYcOR6C1/0RkKgA==
X-Received: by 2002:a92:c686:: with SMTP id o6mr4676515ilg.278.1624563460923; 
 Thu, 24 Jun 2021 12:37:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d194sm1544999iof.37.2021.06.24.12.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 12:37:39 -0700 (PDT)
Received: (nullmailer pid 1861539 invoked by uid 1000);
 Thu, 24 Jun 2021 19:37:35 -0000
Date: Thu, 24 Jun 2021 13:37:35 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v1 09/10] dt-bindings: timer: Add ACLINT MSWI and
 SSWI bindings
Message-ID: <20210624193735.GA1847423@robh.at.kernel.org>
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-10-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210612160422.330705-10-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_123741_866585_5F28A44A 
X-CRM114-Status: GOOD (  20.94  )
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

On Sat, Jun 12, 2021 at 09:34:21PM +0530, Anup Patel wrote:
> We add DT bindings documentation for the ACLINT MSWI and SSWI
> devices found on RISC-V SOCs.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  .../riscv,aclint-swi.yaml                     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> new file mode 100644
> index 000000000000..bed15411c18f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V ACLINT Software Interrupt Devices
> +
> +maintainers:
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  RISC-V SOCs include an implementation of the M-level software interrupt
> +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> +
> +  The ACLINT MSWI (and SSWI) devices are documented in the RISC-V ACLINT
> +  specification located at
> +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> +
> +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - riscv,aclint-mswi
> +          - riscv,aclint-sswi
> +
> +    description:
> +      Should be "<vendor>,<chip>-aclint-mswi" and "riscv,aclint-mswi" OR
> +      "<vendor>,<chip>-aclint-sswi" and "riscv,aclint-sswi".

Don't write descriptions that should be schemas.

Is there no vendor or specific implementation yet?

You can write "pattern: '.*,.*-aclint-sswi$' as an entry with a comment 
to add specific compatibles.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  interrupts-extended:
> +    minItems: 1

maxItems? 

> +
> +  interrupt-controller: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +examples:
> +  - |
> +    // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):
> +
> +    interrupt-controller@2000000 {
> +      compatible = "riscv,aclint-mswi";
> +      interrupts-extended = <&cpu1intc 3 &cpu2intc 3 &cpu3intc 3 &cpu4intc 3>;

format as: <&cpu1intc 3>, <&cpu2intc 3>, <&cpu3intc 3>, <&cpu4intc 3>

> +      reg = <0x2000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +    };
> +
> +  - |
> +    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):
> +
> +    interrupt-controller@2100000 {
> +      compatible = "riscv,aclint-sswi";
> +      interrupts-extended = <&cpu1intc 1 &cpu2intc 1 &cpu3intc 1 &cpu4intc 1>;
> +      reg = <0x2100000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +    };
> +...
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
