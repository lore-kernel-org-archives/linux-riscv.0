Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF15C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 04:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29BAE610E8
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 04:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29BAE610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOOeVj7eq98XdOOtAQv1Ga+p6TDTZvYt5Nm+RJvblU4=; b=ddc9bbPX/VjzAl
	Hb4yzDR8ZfxaIr1EOCO31PQO/p/mMLX2thGu2AwE4Q07+XyZDWvs4oDQbFWRZn94Egxz2D06puMlJ
	sUX95wGl5Qo8Zp22bBCAx2gB1mkZp39dW5vynZDhQRnrVIW2DSa9XIhYl9kGemFJNJSNPQaj95BuW
	s4rj9dMl/ih/6PfVVW0QGmEyqKh5q+Yv7eh8yXkwMVMzG94yBGkC4ozpQc1cj/k/18Q8AYFPlVi2U
	to1+95yxrcN9cN4yDn+2xpalJXCBUDjXvimu4Aqo1Fbi3VckelD3EZWG4HPd/MOXh0z+fXcEpyrg7
	naiOyQBXc+wichRLylSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcKKu-00E1xN-Pq; Mon, 18 Oct 2021 04:33:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcKKr-00E1w0-IN
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 04:33:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t2so38917440wrb.8
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 21:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtUBtWA90x+Pb9HFP4uoXiLc4o2TxeGhqR6fwQbYKb8=;
 b=8FITqn9K5KfRz8Ss1x15c/E4gIyXjugA04x7iNdNUejiXgz2555yzSJAAogSzeqS7q
 q7PQ64fPTE7OmgI+KE4+63vBXNG4t75ylGCguocaJ6W9ts3/Z1BzDET5FIoc2I0p573S
 nMV1YdamHEgyQ8bjZKH1qaKYLQpK/1souUpEJWopgjAFcAIaKWe90l9Yg/iheEyLtPaO
 nXfg1S4L/hDNCIp7SPKlZHganpou+0uiJ/IhRAu8zr1ObxfsGE2/es/iP0LCvWlVHVW+
 1tkyy3NLORkCqIBvtpdUCdzdyiHfetUE4MxNWl8QmpFlJYamaRoNqlJfWNs1c0s3QA7f
 2WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtUBtWA90x+Pb9HFP4uoXiLc4o2TxeGhqR6fwQbYKb8=;
 b=RwY5xzBSC9JQn0yQ8WvVOj+u5rBmtFI9YMNJgomYBfZaZ+s8KoUFghNwdW7rFSsLNJ
 z9RSBTkUUQ6UIMTKe7DAfLnKEakipFySMsG/4kfxpDODm/d7ZdDl6CSaWCMRx5MszLbG
 9pGZeWF9Fh6vDRx8IU/BC4amZ4NnPT7f33gpHIniQobLkKs7vtLgE4wNLnU3kStRTAvY
 zBBiaRN7Qzs4bU4of5jd0AO6CbLq86yBzRVIu+S3g8s4isEJubb8fOpm6gtnLKer9wzZ
 /2VZOPc2HGtXjXi/mQZE0B17p/LTQ/QS4dNCVR4/OLmxBQMPtFsGk75RhdclXpjfuzMF
 tAOg==
X-Gm-Message-State: AOAM532DYc7JVMLuYNdBQ7O7zjB5d7vXPHoXQKchzL2TtuHFff18zdFf
 plLOZ1L3/b/3VLfBBCwZwlVDctzlxl6J0hBbusPAlQ==
X-Google-Smtp-Source: ABdhPJydk0ydbDmFLt6u8ok8LYEytDSxAqGGTqx/OVzL0U1AcEhdOHzFxvIrItXho4WDm+C9oH+N3RJyq1U48OoRJwM=
X-Received: by 2002:a5d:6dce:: with SMTP id d14mr32967521wrz.363.1634531595601; 
 Sun, 17 Oct 2021 21:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211015120735.27972-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20211015120735.27972-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Oct 2021 10:03:04 +0530
Message-ID: <CAAhSdy3JU6jitTWFk4CVRG5Xc7P7ueZzd=xmnKBNpx8eGaR6hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: reg-io-width for SiFive CLINT
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Guo Ren <guoren@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Xiang W <wxjstz@126.com>, 
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_213317_637259_AEA63DE4 
X-CRM114-Status: GOOD (  23.18  )
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

On Fri, Oct 15, 2021 at 5:37 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
> the MTIMER device. The current schema does not allow to specify this.
>
> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> restriction. Samuael Holland suggested in
> lib: utils/timer: Use standard property to specify 32-bit I/O
> https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
> to use "reg-io-width = <4>;" as the reg-io-width property is generally used
> in the devicetree schema for such a condition.
>
> A release candidate of the ACLINT specification is available at
> https://github.com/riscv/riscv-aclint/releases
>
> Add reg-io-width as optional property to the SiFive Core Local Interruptor.
> Add a new compatible string "allwinner,sun20i-d1-clint" for the CLINT of
> the Allwinner D1 SoC.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  .../devicetree/bindings/timer/sifive,clint.yaml     | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a35952f48742..d3b4c6844e2f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -26,6 +26,7 @@ properties:
>        - enum:
>            - sifive,fu540-c000-clint
>            - canaan,k210-clint
> +          - allwinner,sun20i-d1-clint
>        - const: sifive,clint0
>
>      description:
> @@ -33,14 +34,22 @@ properties:
>        Supported compatible strings are -
>        "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
>        onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
> -      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
> -      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
> +      CLINT v0 as integrated onto the Canaan Kendryte K210 chip,
> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC,
> +      and "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
>        integration tweaks.
>        Please refer to sifive-blocks-ip-versioning.txt for details
>
>    reg:
>      maxItems: 1
>
> +  reg-io-width:
> +    description: |
> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
> +      32bit access for MTIMER.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 4
> +

Please drop the "reg-io-width" DT property.

Based on discussion on ACLINT MTIMER DT bindings, Rob suggested
using implementation specific compatible string for detecting register IO
width. We should follow the same strategy here as well.

Regards,
Anup

>    interrupts-extended:
>      minItems: 1
>
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
