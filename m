Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95733C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 07:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WoaofxZ/qwAL+1XiLbhN1XRu15OrYTyJ4achrFPf8H4=; b=RacDyh6lKv5PeM
	U1LmxmxWDI9xvX6IRYtfgurCCmJM+LB+HW3ODKQMAOG/1Cfqr/BEp2c61dI/4zGyvZwQSxMKQuILp
	KgdGJt2dsRzKxaejqYHhmfCXb0eElrq/N+F092DoDtiBFjybJU3AQAr3aEoJjtU8G1d0UYxl4NK8y
	QkFpU/E7MBE+nn2YSEZWoJ3MEE0dHETSwsxQCri+zix3ozQXG5m3pTXLhadCoYWG8hS9EaSqv1Bfh
	v7xOJ+V42TSPjYcuCNd+w8dfj6egCJl7G3acUH7aujpJmb7iSPD/kkZmyFi6D/UAXhnfVRV1C/Apz
	2nurcesAugHcmG4UZ/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY8h-00000006GOv-1mBw;
	Fri, 03 Jul 2026 07:16:43 +0000
Received: from mail-oa2-x01.google.com ([2607:f8b0:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY8c-00000006GMj-18su
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 07:16:41 +0000
Received: by mail-oa2-x01.google.com with SMTP id 586e51a60fabf-447489dd9c7so125062fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 00:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783062997; x=1783667797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/To5uu366iTzXiach4JBOKu6hRxUbkL3Sh+ENphnrM=;
        b=hPxP282euhfBcgOQ17R9Y8SUfnmAnqFSbUGioQxNXTfjCYk/l4NnTtsXOnyxjDAeVM
         zXWuTv/hWkt1oxp1hIVmtCdyZaeoVmdnpV+ITUXVJLnypKNqbZsJpxCLlr9jy93C96ks
         ga5BRWz/zlApOQrsR68iTticXjbFI8so6cxtA5unJ3qEXY6jRC0qRvldKl6FHQ3yxl4B
         ApERA0pqGAgL3rxUnkFbzy24W3r0+aYQszcU+OujSNMJvHp4hAzKWrgVxLi7gn0L1wda
         xxz/imIYBv17A7gVRHmE3cZQg2qosy2YFezTSmVSclCbn5shvFGOXDWHCru+FZHQKWNx
         bTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062997; x=1783667797;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/To5uu366iTzXiach4JBOKu6hRxUbkL3Sh+ENphnrM=;
        b=VPoDwB5DuA4YQQ4sglyMSa99Ns87kbpwaxLHlgLmbpxEzt5eZp/LOkNme9oDBsBx79
         eJJwRu5mc/sJOy/CZX+RCegmIrxlTpii0JZIOlT2WMyGY38l4DxCyTeF82l8Aly8+IZ8
         fwtJ4TTUv5I9rXHdPxtoq1dvK8cjKzPqdFvoQjeRz8TtrCHHgJLrq6/SWZlx9MdT7JQh
         iLX6GkmAE+DxCXZUzxALigx6JGUdo4jvrn7kfVjRSABM84gbnNrwE4hmIp+9GgQe0MIW
         zfdN5OL594/w5hobEvpUYD9vnTHIC1AOfzL21nEeqgigS4QkY618TTUsLoMPdUJ+ORQ0
         Icvg==
X-Forwarded-Encrypted: i=1; AFNElJ+RigJmEZmiUFBduSv6Vs36GIXRMU7TKgg1aEcd1i4vEC71gU0iPL+3A4vptVBl+19CEaPj1Ih+7XjYOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV+kevN9ac+guxCjbIcwFy8IYw37mv7UzF8Dw3atCXMlCnnw6k
	vgRt3zhx6S6v332wJi9MMFqpa3JH/lfHWSCuKPsRaXVrvm0dQvDUw+Pz
X-Gm-Gg: AfdE7cls8hVDjKAxeP7uszrDlZc60lBfNBMlHaVO+uSw1Gn9rAItv8SIVJeCoTUkwQh
	TdYnMNC1WEJFgzd0RHMQsq2/zWROPDeMe5ylpgeLEBB7cdCWTl3vtARy1IBxZsUzXMW7va1/2br
	gEs9YYGSNw4V59s+W36AiPeoKFM7AFoUkZ7fGo4/7zYKCDM3/775Olc0nWmyTiCGClSaSlX4x3+
	bAy3ZwOivEOEqT4mcLhHxCY3j1oPDnM8IDzhdvE8tdxj0cHw45IOmMzl1LUTF/8FlO4SGdS2XLH
	T0LmmhptxHXPp6PT083/v/OoPn20wTE6EnaNq2WE+nx6dDpZFSMViiVX3tlYhuPHJazqrydK9w4
	8F2Z5NS2T964OvdcMRU9WkguoMLiRpyRt5lJ29dINVvvzVuPbFAgvtU/XlIXXlPVjtuMqI1WPPr
	eJdNv0VSl9CiZYZ2DZGtHAWkhaqyC8+25aACM7mUNzjXJQ23oeKzOABVOyOy0jf60=
X-Received: by 2002:a05:6870:2187:b0:449:bccd:79fb with SMTP id 586e51a60fabf-44cab961fb9mr6076032fac.24.1783062997063;
        Fri, 03 Jul 2026 00:16:37 -0700 (PDT)
Received: from ubuntu24 (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb54f775sm1162626fac.10.2026.07.03.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:16:36 -0700 (PDT)
Date: Fri, 3 Jul 2026 15:16:29 +0800
From: Xing Loong <xing.xl.loong@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jens Wiklander <jenswi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: firmware: add mbedtee,rpc binding
Message-ID: <akdhzUQWPsUS69P5@ubuntu24>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70068ae8-ede1-41d2-899b-98ed11e19953@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_001638_337947_E3D5E99C 
X-CRM114-Status: GOOD (  35.48  )
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


On 01/07/2026 16:05, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:25, Xing Loong wrote:
> > Add YAML devicetree binding for the MbedTEE Trusted Execution
> 
> Drop YAML, there is no such thing as YAML binding.

Will drop.

> > Environment driver.
> 
> We don't take bindings for drivers but for hardware or firmware. Please
> describe these instead.

Will rewrite the description to describe what MbedTEE is as
firmware, not the driver or the binding.

> > The binding covers two platform configurations:
> >   - ARM/AArch64 (TrustZone, SMC): two reserved-memory regions
> >     (rpc-t2r-ring and rpc-t2r-shm) plus a GIC SPI edge interrupt
> >     for TEE-to-REE notifications.
> >   - RISC-V (IMSIC): three reserved-memory regions, adding
> >     rpc-r2t-ring for REE-to-TEE command submissions; no interrupts
> >     property (T2R notifications use IMSIC MSI allocated at runtime).
> > 
> > Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> > ---
> >  .../bindings/firmware/mbedtee,rpc.yaml        | 221 ++++++++++++++++++
> >  1 file changed, 221 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> > new file mode 100644
> > index 0000000..08ae255
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> > @@ -0,0 +1,221 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/firmware/mbedtee,rpc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MbedTEE Trusted Execution Environment
> > +
> > +maintainers:
> > +  - Xing Loong <xing.xl.loong@gmail.com>
> > +
> > +description: |
> > +  MbedTEE is a Trusted Execution Environment for embedded systems.
> > +  This binding describes the shared-memory regions used for RPC
> 
> Describe firmware, not the binding. It's redundant to say what the
> binding is about, just say what is the hardware.

Will rewrite, removing "driver", "YAML" and "This binding
describes" wording throughout.

> > +  communication between the Linux REE driver and MbedTEE OS.
> > +
> > +  The REE and TEE CPUs sharing the RPC memory must be in a
> > +  hardware-coherent domain (same CPU cluster, coherent caches).
> > +
> > +  Two or three reserved-memory regions are required:
> > +
> > +    rpc-t2r-ring  ring buffer for TEE-to-REE notifications (all platforms)
> > +    rpc-t2r-shm   shared memory for TEE-to-REE RPC payloads (all platforms)
> > +    rpc-r2t-ring  ring buffer for REE-to-TEE command submissions (RISC-V only)
> > +
> > +  On ARM/AArch64 the transport uses SMC calls; TEE-to-REE
> > +  notifications use a GIC SPI edge interrupt.
> > +
> > +  On RISC-V the TEE notifies the REE via IMSIC MSI; the REE submits
> > +  commands via shared-memory rpc-r2t-ring that the TEE polls. No
> > +  REE-to-TEE interrupt is used. No SBI ecall is involved.
> > +
> > +properties:
> > +  $nodename:
> > +    const: mbedtee
> 
> Drop, why would it be relevant?

Will drop.

> > +
> > +  compatible:
> > +    const: mbedtee,rpc
> 
> Feels way too generic. First, Google results on mbedtee are basically
> non-existing, so what sort of company is that?
> 
> Second, rpc is just not specific enough. Please carefully read writing
> bindings doc.

Will rename to "mbedtee,tee". mbedtee is an open-source TEE
project (https://github.com/mbedtee), not a company. Patch 1/3 adds
the corresponding "mbedtee" entry to vendor-prefixes.yaml.

> > +
> > +  interrupts:
> > +    description:
> > +      GIC interrupt used by the TEE to notify the REE of pending RPC
> > +      responses (ARM/AArch64 only). Not present on RISC-V platforms which
> > +      use IMSIC platform MSI interrupts allocated dynamically at runtime.
> 
> Please read writing bindings doc.

Will drop the description.  Will add maxItems: 1 instead.

> > +
> > +  msi-parent:
> > +    maxItems: 1
> > +    description:
> > +      IMSIC MSI controller used by the Linux driver to allocate the
> 
> Again drivers...

Will drop the description.  Will keep only maxItems: 1.

> > +      TEE-to-REE notification interrupt on RISC-V platforms. Not present on
> > +      ARM/AArch64 platforms, which use the interrupts property.
> > +
> > +  memory-region:
> > +    minItems: 2
> > +    maxItems: 3
> > +    description:
> > +      References to reserved-memory regions for REE<->TEE communication.
> > +      Entries must match memory-region-names order.
> 
> Obvious. Please do not come with your own style of bindings.

Will drop the description.  Understood, will follow the standard
style used by existing bindings.

> > +
> > +  memory-region-names:
> > +    minItems: 2
> > +    maxItems: 3
> 
> Why is this flexible?

Will constrain it via the allOf: if/then branches (ARM: fixed at 2,
RISC-V: fixed at 3).

> > +    items:
> > +      enum:
> > +        - rpc-t2r-ring
> 
> rpc is redundant, drop

Will drop the "rpc-" prefix.  Will use t2r-ring, t2r-shm, r2t-ring.

> > +        - rpc-t2r-shm
> > +        - rpc-r2t-ring
> > +
> > +required:
> > +  - compatible
> > +
> > +allOf:
> > +  - if:
> > +      required:
> > +        - interrupts
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - memory-region
> > +        - memory-region-names
> > +      properties:
> > +        msi-parent: false
> > +        memory-region:
> > +          minItems: 2
> > +          maxItems: 2
> > +        memory-region-names:
> > +          items:
> > +            - const: rpc-t2r-ring
> > +            - const: rpc-t2r-shm
> > +    else:
> > +      required:
> > +        - msi-parent
> > +        - memory-region
> > +        - memory-region-names
> 
> So memory-region is always required?

Yes.  Will move memory-region and memory-region-names to the
top-level required: list to make this explicit.  The interrupts and
msi-parent properties will also be made mutually exclusive per
platform (msi-parent: false on ARM, interrupts: false on RISC-V).

> > +      properties:
> > +        memory-region:
> > +          minItems: 3
> > +          maxItems: 3
> > +        memory-region-names:
> > +          items:
> > +            - const: rpc-t2r-ring
> > +            - const: rpc-t2r-shm
> > +            - const: rpc-r2t-ring
> 
> Your top level schema said that. You only need minItems.

Will drop the redundant constraints from the else branch.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* ARM TrustZone (SMC) */
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    / {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      gic: interrupt-controller@2f000000 {
> > +        compatible = "arm,gic-v3";
> > +        reg = <0 0x2f000000 0 0x10000>,
> > +              <0 0x2f100000 0 0x200000>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <3>;
> > +      };
> > +
> > +      reserved-memory {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +        ranges;
> > +
> > +        mbedtee_t2r_ring: rpc-t2r-ring@85f10000 {
> > +          reg = <0 0x85f10000 0 0x20000>;
> > +          no-map;
> > +        };
> > +
> > +        mbedtee_t2r_shm: rpc-t2r-shm@85f30000 {
> > +          reg = <0 0x85f30000 0 0x40000>;
> > +          no-map;
> > +        };
> > +      };
> 
> None of the above is relevant, drop.

Will drop all platform infrastructure nodes.  Will follow the
minimal example pattern seen in linaro,optee-tz.yaml.

> > +
> > +      firmware {
> > +        mbedtee {
> > +          compatible = "mbedtee,rpc";
> > +          interrupt-parent = <&gic>;
> > +          interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
> > +          memory-region = <&mbedtee_t2r_ring>, <&mbedtee_t2r_shm>;
> > +          memory-region-names = "rpc-t2r-ring", "rpc-t2r-shm";
> > +        };
> > +      };
> > +    };
> > +
> 
> Best regards,
> Krzysztof

Thanks for the thorough review.  Will send v3 after incorporating
all of the above.

Best regards,
Xing Loong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
