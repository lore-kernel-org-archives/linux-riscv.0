Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6787C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 01:48:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E2920792
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 01:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MJnmTb5q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0nWPc3Jn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74E2920792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Jrl4y69C7LFIOv9g0FZ5l7d6nguaAqs+k1/U2nsw2Ts=; b=MJnmTb5qk0fGv6E8cP2ZlAQ5i
	ZEIWtZ04jtUkYxdG+iwY/r01spNoFHtfP/mbMrvaBgnl4AKd2aXeuOCG3aB+/q6KNZnZEcKjV1pIJ
	94+4cP/UCd+xsxL0herkzHj4rZdIwag3s3IOchu0egXiD6pQSAwpOG+VizWvWSo3kCHMXEg7/TNAZ
	V5UefpDW6KOOuG2zc3nlQJG65dDhrBcn0sc6x9NsckMpD/1DUB2KMrzoJ/Wm3idGEGo5cvR880und
	CpGF7trxQIEejjpjrIUHbz9LwHS2/tXavuLIZJTCsXmIcx+1IU8+YGTNYomnM9VbA4AFKJ4Ar6YR3
	98hx5RFgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k38XC-0008RA-Jq; Wed, 05 Aug 2020 01:48:02 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k38X8-0008PK-Oi
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 01:47:59 +0000
Received: by mail-pg1-x541.google.com with SMTP id o5so5532140pgb.2
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 18:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=j65hl2pUPWvRBCvP5UfBYwkdWCQ+opfh83SIaOomumk=;
 b=0nWPc3Jnrmdjj1thXDdb0nsxHlWBaEFrdPjvEzy/NF6FCrxahLF/igaj3kwTwA3KDM
 a+ViGXMXxuTKcSk/8V90anyNwoN4Alwong3RO4+M3sYDhtEUZIv09RG9YtnbAW3ld88F
 t8Lq6FMqiI1Xw5FRkiSxFqG/ogw3KrCk5FFp6yva4tthwmljV8m1C1LnJ32SItbaStpq
 Ov6ixSDnHO70+4gLDzoGx7kynFSkhz3RVH2VPd1lB06bdiGwvlhWaCWPj6Vp8e9wrCGr
 cEWRq8yDkqPHxk+XMs3B+kMvEZ392ZnOf69zcGnSBjf5cqzZPu2UhmxnCT2Ur4UgAum5
 3aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=j65hl2pUPWvRBCvP5UfBYwkdWCQ+opfh83SIaOomumk=;
 b=D/zMKacRCgNV4xO+yOKgRG4XyBIvjhtcx3llAekNr7t2Cgc76tBzQuzJE1br/Y+0cl
 tHVV2fkkAtPqxH4xDS4APbQJi+mBesgf7XTbpV51Fs0AUoq0Rak/z5lQ4iPYa7K32ilk
 Q8soO0z1V7AUWINuWZegH/7UKgSe4pGhRvx/1iPAJFP65p+Gkb1l2Vw1i7o/5p4R+B2e
 A+YyUYaNPPlqobEhKGmmlXJaUoHSFRO4bmIpI8OU9PnAzyEE11yD62uy0ou8OkfqwYoY
 HH0e7K5sw+o670McvrE811VcX+JkzmDV/rsjHOXcrE0PA0JGViRj/2XUMSkHQxCEY6wo
 zhOQ==
X-Gm-Message-State: AOAM530K84NG2ZBytrtPmPFro+l9+Wv4AiuZA69sBaolGn6IHNSfBe3p
 2OsNml1lMPLPtF7kGoFIi2yZAg==
X-Google-Smtp-Source: ABdhPJyuFFmk+82rB0ni0x79mPwQUbHfkDBrfOGruFSOkrDPftIPB+K4DHVRTGU9Yz9VttsZAD3GNQ==
X-Received: by 2002:a62:c103:: with SMTP id i3mr1086842pfg.180.1596592076555; 
 Tue, 04 Aug 2020 18:47:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 207sm543411pfz.203.2020.08.04.18.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 18:47:55 -0700 (PDT)
Date: Tue, 04 Aug 2020 18:47:55 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 18:41:10 PDT (-0700)
Subject: Re: [PATCH v6 4/4] dt-bindings: timer: Add CLINT bindings
In-Reply-To: <20200724071822.126758-5-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-af0c875c-57e6-4004-bb43-1f5dc3f1db36@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_214758_850816_09795A23 
X-CRM114-Status: GOOD (  22.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 aou@eecs.berkeley.edu, kernel@esmil.dk, anup@brainfault.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 robh+dt@kernel.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 Jul 2020 00:18:22 PDT (-0700), Anup Patel wrote:
> We add DT bindings documentation for CLINT device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> new file mode 100644
> index 000000000000..2a0e9cd9fbcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Core Local Interruptor
> +
> +maintainers:
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> +  interrupts. It directly connects to the timer and inter-processor interrupt
> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for CLINT device.
> +  The clock frequency of CLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,fu540-c000-clint
> +      - const: sifive,clint0
> +
> +    description:
> +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> +      Supported compatible strings are -
> +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> +      CLINT v0 IP block with no chip integration tweaks.
> +      Please refer to sifive-blocks-ip-versioning.txt for details

Perfect!  I was going to mention that we forgot to define the
"sifive,${name}${version}" scheme but I guess I just forgot that we did define
it ;)

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    timer@2000000 {
> +      compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> +                             &cpu2intc 3 &cpu2intc 7
> +                             &cpu3intc 3 &cpu3intc 7
> +                             &cpu4intc 3 &cpu4intc 7>;
> +       reg = <0x2000000 0x10000>;
> +    };
> +...

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
