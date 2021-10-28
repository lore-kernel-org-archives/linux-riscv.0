Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC72C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 20:18:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3B661139
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 20:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB3B661139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVixmJUWpRH/h/HLU4vS1B61R9UiYWEMrxgU90LglVA=; b=jgRxrZU3lpBg2o
	o0y93J7cPBaJpYtPqE2oK4UOKzy6YYADnU5WEq1u5EWfbV/g3hNnemuioj3cZior5PO/rHWdKvtMa
	kD2uU73SJKA/fLzXinzTP1KhDXHU5fsx8M4cNar4bDbOwBrdYB3tj5qjJsoW2BRfQOePWc7GfA9pn
	1TEEcObUQPN0lcT9usszkUA9izYIZT2zz8XO7RNWqG1maRhc9pIVZbGbyiapLozADCt/lQ1i5vXoA
	EAi4D7Za2rRhnFSvsmd5j5Gol6cHt6wNAh3yilyYjH+TuSnqL7suTingM4LTItI9c1oBdHgrt5QHB
	/FVVkK+8zpmFB0xGfieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgBqP-00925m-9k; Thu, 28 Oct 2021 20:17:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgBqM-00924E-Be
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 20:17:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d10so12316553wrb.1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QQHy5W4NO/yZkhM4CUJlGj83LWvnUyD366Fk7aGMOq0=;
 b=foANG7O14U8sEI7ZM6z8LKCSBA21HEfZaM4bwrYibqI9I+7AD56u4y1BdbkLifkfVm
 AtrE9CrJTCU7T7u4SCamS3G6CjOUp3rL8f0+28Dkc9RLyFf0l2vYnDOr9ygVQ7W/mPrj
 2o7df8IPsKQ93pXnjmkq6AwYNd07iCu+J47pHl9u4Eu1X/2nB8cBwipHprKsa9rSAn1k
 Bm8Kgr7VTpiTm6K2fVsmoqlcJ5P8f8oJl2IGsGtlif97mpifCBf0ivhNGe7qyLv7Qiz6
 IW52nn/EIWvuVa+ztbwucd0BMpjBYLEWf+wPytCIr7ZTRHpEsHECm8xY9y9NxFEKuGIR
 QrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QQHy5W4NO/yZkhM4CUJlGj83LWvnUyD366Fk7aGMOq0=;
 b=La9e+suoVB2kA0fl5yqekwebBHDbqYhdHb1fuO1GW8I1dbvnyYzNU2PSz4aAR+dmD+
 1sUfoAEGXJJK4PX4PKjpophNXdxfI7rL0WWJgGjhA6NTw7jw34T78HcIlr5no4o1C73c
 /xGRvaPw0iz3Ct9mcMr8+NDn0mYnkAn4AfSL30KIUHToMF4j9AFor38EB3E/v3UWTBVf
 IijJw7S0DEKbAVQlstznFASgtGO8+SXFJufK+F1czaZCeIbJRah4B3d/jc+6Lud/oS1u
 lUsQmzxao6vWNixmjT7U1PRdEjFf0FVXQmvcONOANBL+Db0Cml0xUPeTEjhrIMSHWkMT
 S6dA==
X-Gm-Message-State: AOAM533UjG5a6TwwpRRh8MvHGrnrcdjefXYxnZx/Sulwmi6Dicdeh0WA
 7eotIapn9FtwjCIU8lhzP1Lbwg==
X-Google-Smtp-Source: ABdhPJwQ1VglxMGcOdndU0OUSIqA7uD0zPYkNbvW3Po5Rb8V6zwfdp3UJXnb4kkrEEhK65pslhw79g==
X-Received: by 2002:a5d:4f85:: with SMTP id d5mr8741341wru.247.1635452263729; 
 Thu, 28 Oct 2021 13:17:43 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.local (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id t8sm3835979wrx.47.2021.10.28.13.17.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Oct 2021 13:17:43 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id D60A89279738; Thu, 28 Oct 2021 21:17:42 +0100 (BST)
Date: Thu, 28 Oct 2021 21:17:42 +0100
From: Jessica Clarke <jrtc27@jrtc27.com>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [v4 06/11] dt-binding: pmu: Add RISC-V PMU DT bindings
Message-ID: <YXsFZmRwpQAWhSw0@Jessicas-MacBook-Pro.local>
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-7-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211025195350.242914-7-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_131746_497398_02F0FF0C 
X-CRM114-Status: GOOD (  27.90  )
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

This is conflating the Sscofpmf extension with the SBI PMU interface;
the former is what the hardware supports, the latter is what the
firmware exposes. The SBI interface exists today and does not require
overflow interrupts to be supported, so there needs to be a distinction
between that case and the case where Sscofpmf is supported in both
hardware and the SBI implementation, which probably means having a
second compatible string for that case that also includes the generic
SBI PMU interface as a fallback compatible string.

Secondly, I do not think this is the right name for this. The riscv,pmu
compatible string (or anything of that nature) should be reserved for
*hardware* that provides usable performance monitoring features to an
OS. This is not that, this is the SBI interface that requires an OS to
make firmware calls for any starting, stopping or configuring of a
counter, which results in an even greater probe effect than is already
present with frameworks like FreeBSD's HWPMC or Linux's perf (I don't
know how the two compare on that front, but I imagine Linux is similar
to FreeBSD). This should have SBI in the name so that it doesn't get in
the way of real performance monitoring support once the architecture is
finally mature enough to have S-mode-configurable counters and a
standardised set of common events like pretty much every other
architecture.

Also I do not like the use of PMU, since that is Arm's terminology,
whereas RISC-V uses HPM, but you've already defined the SBI interface as
being PMU so I guess that ship has sailed.

Jess

> +
> +    description:
> +      Should be "riscv,pmu".
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
