Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D96C07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 05:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12205613B6
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 05:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12205613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nc3ZJIcPjYOchNNCEMoE4O9frimVOsMgUVO+Q9xQQyU=; b=Gl5TMOsBgNsqw/
	m28QoqbCkKjvl8oS2PCmr+ru04hVQrTI5LgCWFR52vXXqKkvTF6HFVDndSjNsHw8foYBxyPHeoeio
	fNqYLrvuTVoLDfHaYRn/mSVNvxg7eolJb4xXW8uB7oUI5spbl09zSTX3cjF6m2AcXGxqO6DeRKB4A
	ZMJZt/4Y++lG4M+CAo15ABKRI9wWQa6QwtnRgh9yz55UC9dS+2YmS4X/hfjsetdP679gft75B4dkz
	bdjXXLAjbP34r68WHjYBLEUZTdG0c7k8nU4nJwPoCOEXFlTUs2ldb4yUMrCCmlQS3NbOM7LFRQjqu
	qza5Nc2TQRTbdVitFeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Xpg-00COYv-Q4; Wed, 14 Jul 2021 05:53:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Xpc-00COYF-Nv
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 05:53:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id u1so1682838wrs.1
 for <linux-riscv@lists.infradead.org>; Tue, 13 Jul 2021 22:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DSn6XjRg0PbwGAe5aupCxoR3xo9khOKhTSDoJF9mVDo=;
 b=HZuZEdJIq/2aP+l3jVaRtFhJ0IdDwBhEQr9atUchZgm8Ko49uiCJ+X4p9X47Q5QOxu
 yanrKuG1n7NTG+lkCWyamOfeMQiAcBrVaYtq3JMnF96zNhy69vPVblJHoRlI7gHMkQnv
 qPjMgD1NPmq6E5HKa/l8Ci/fXnwnZPpZoeuyZRMPfpc+1bHrUk3hHRGRhALjInqTyn/k
 1epgOnw6/AiX85FBX8PDiDZzWzgZHD1tpzrm+W0avvFWXQH13G9V6yvLuH/40Ix6XkIZ
 S1IQrXPvVm5x9GsURV/Ab1OVjMkEy+HR1qEjoQDfvK1xm15eJZXMnGyv1l7ru6nGGXe8
 3yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DSn6XjRg0PbwGAe5aupCxoR3xo9khOKhTSDoJF9mVDo=;
 b=o9hKDbKTnN5X24Emtb2qGAZIrJRA1zXJU0yDs0kKOnhl1Uzt/waQV9I8imaprB1X68
 GNsMjocNx82Vat4VVXWKJk27nHvvrzve/M7NkAQXDBS4N82QZUOJiLYujILb/33KF8a+
 1SY58x0khvxofBWLt0YTFmHy3YxGEO6DC9VKYOJPpZIoKYVqf/ArmcDAkp9cnxoVRKlC
 tKQkHgFHeuK7ALY6BzM5srh87XtSIZhfhHhTNaTzqOeT9AA1lwVtGE/qCm+JzXUXpMyz
 ou2kTaKMLr/W/4Ap+ewS4OGgzftrxkVw2HutRqw5lk0xzyYk2Tt2XbdaUXtAg2cRaMqm
 qEGw==
X-Gm-Message-State: AOAM532pMKsZBNIYak/ZLZRvQjn4tOfiVpsf3oTH1I+B4jnEYs4vZ9wE
 xRhHXNMl052H65/ieFgxKn0kdsPdzwaQwiAIBfqhvA==
X-Google-Smtp-Source: ABdhPJyWiPmoDmfNB/69cnZzb1pow0MLb9HlG5u3nWeZ3BQcVWVCVGvjpwbYHlDzicq2az5Z4j+MJxHFcFcVo9tRBT4=
X-Received: by 2002:a5d:464b:: with SMTP id j11mr10707490wrs.356.1626241991022; 
 Tue, 13 Jul 2021 22:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123851.1344518-1-anup.patel@wdc.com>
 <20210618123851.1344518-7-anup.patel@wdc.com>
 <20210712192207.GA2322460@robh.at.kernel.org>
In-Reply-To: <20210712192207.GA2322460@robh.at.kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Jul 2021 20:57:43 +0530
Message-ID: <CAAhSdy0=aL+N7fLD4+b0u3j3zj8+xYOFH_WAu3N8wFkJNxFqrg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_225316_830450_3C6E59B2 
X-CRM114-Status: GOOD (  30.80  )
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

On Tue, Jul 13, 2021 at 12:52 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jun 18, 2021 at 06:08:46PM +0530, Anup Patel wrote:
> > We add DT bindings documentation for the ACLINT MSWI and SSWI
> > devices found on RISC-V SOCs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  .../riscv,aclint-swi.yaml                     | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > new file mode 100644
> > index 000000000000..b74025542866
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V ACLINT Software Interrupt Devices
> > +
> > +maintainers:
> > +  - Anup Patel <anup.patel@wdc.com>
> > +
> > +description:
> > +  RISC-V SOCs include an implementation of the M-level software interrupt
> > +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> > +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> > +
> > +  The ACLINT MSWI and SSWI devices are documented in the RISC-V ACLINT
> > +  specification located at
> > +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> > +
> > +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> > +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> > +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> > +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - riscv,aclint-mswi
> > +          - riscv,aclint-sswi
> > +
> > +    description:
> > +      Should be "<vendor>,<chip>-aclint-mswi" and "riscv,aclint-mswi" OR
> > +      "<vendor>,<chip>-aclint-sswi" and "riscv,aclint-sswi".
>
> The schema doesn't match the description.
>
> There's no actual vendor implementation yet? You could do:
>
> items:
>   - {}
>   - const: riscv,aclint-mswi
>
> But then your example will fail.

Is it okay to have optional vendor compatible string ?

Vendors can add their specific compatible string if there is some
special handling required. If there is not special handling required
then the two compatible strings are enough.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#interrupt-cells":
> > +    const: 0
> > +
> > +  interrupts-extended:
> > +    minItems: 1
>
> You need maxItems too. I guess this based on number of cores, so just
> pick a 'should be enough' value.

There is a limit on the maximum number of connections between the
device and HARTs or CPUs so this will be the maxItems over here.

I will update this in the next patch revision.

>
> > +
> > +  interrupt-controller: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts-extended
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +examples:
> > +  - |
> > +    // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):
> > +
> > +    interrupt-controller@2000000 {
> > +      compatible = "riscv,aclint-mswi";
> > +      interrupts-extended = <&cpu1intc 3 &cpu2intc 3 &cpu3intc 3 &cpu4intc 3>;
>
> interrupts-extended = <&cpu1intc 3>, <&cpu2intc 3>, <&cpu3intc 3>, <&cpu4intc 3>;

Okay, will update.

>
> > +      reg = <0x2000000 0x4000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +    };
> > +
> > +  - |
> > +    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):
> > +
> > +    interrupt-controller@2100000 {
> > +      compatible = "riscv,aclint-sswi";
> > +      interrupts-extended = <&cpu1intc 1 &cpu2intc 1 &cpu3intc 1 &cpu4intc 1>;
>
> Same here.

Okay, will update here as well.

>
> > +      reg = <0x2100000 0x4000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +    };
> > +...
> > --
> > 2.25.1
> >
> >

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
