Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC56C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:27:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7366664F68
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7366664F68
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EoLLhMjrskwQ2HDMhDE3Z92JG6s3Wj9qkuwOwhJSqm0=; b=cAddFTwKq2IguKflaQ6E/pF3I
	RWzdVrtq7FTQouWXeDw8cqy4UfsnnqR2QFa6NL43iVI6uBGZ4XHEfdHtHwaxcViJYRPkG/QfQSoMl
	EqvsAN3uKi3WdklIqDTNzigLcSoxOUyrul66PJPOhSHhLXzItK6OQVY5hbmxMGgvMtDVbZa2Eqqm8
	GE/kELNMXcRpK+IO/0r890DcN6HiEmkQ/MJf0hI7Pi3baNNobiOl9NXt7re9YirTGCfT1SKmOb3Gr
	CcBwG8XP8lJ6QpKqPIsvvqneFFCUTXSN2LLoLQ+4HkbxJQ1ZJEdFhIs9PxGxY4LUA4Q5Pj/w0cX2V
	cQZ6+7E6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70OB-0005Dc-Cx; Tue, 02 Feb 2021 18:26:59 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70O9-0005DA-Uf
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 18:26:58 +0000
Received: by mail-io1-xd32.google.com with SMTP id u20so8289942iot.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 10:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmzOT4IsDLV3fXyPYr4zxnFCLhCQEvRE3p9inRWF1PE=;
 b=HIJKflfrQ+uGL3yQoKDtRdNobK5gwelcUlTfCyyMqBeeehEpooqJdfXs2z4qZV9NpJ
 sLzmSRd8AAdWoHrb2v9DUHd8H+47iZVmvOPz8uSNF4K0xl8eU6TC4PzgF6ah8KGj8Yww
 Kcy7QueBzC2ayDWhuVOZulLwm7bgp9Yc69bug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmzOT4IsDLV3fXyPYr4zxnFCLhCQEvRE3p9inRWF1PE=;
 b=ZYJ+RhJkMtH1AkqyWdE3ba1YdDn9dJmVc4TwiMgziUekkhibtto1dReDbEtkqbM/6m
 nF7P7MmxD00QIo+xbx1WOeC+Tw6C40EdCfer8jzWPXnfQ09rC7BJNiVIbjDiBUmgmLIS
 fSbF0Mt/GpGsMGy0WOM2NQwkonWpZd7rye7BBSLztbQ4H4in3gvIX5vxS5xi0SQrkfnd
 uLEk6Yp4aoqOotQ4Ngds3do6QcmWKQB+tUYNlhuixVqstGaww9OkAeWqUE+AVKMKpyMX
 x5Cd0/7qCUUEtKHms/K+iEj8W7yKNkQOTDiWdoDDiP50ZWo21hdkK6hCy9I57SzpunS2
 E3Fg==
X-Gm-Message-State: AOAM530ULklNOSjryTRoLvWbW047ytNkMwtGuHhcBqeNCm0uBSP0Nqao
 uuEUvVIZyuOM3Sr2oz4awjojuXlkuz74OP4C3GWQ
X-Google-Smtp-Source: ABdhPJynZBXpnTgaTGJ6pK5pVPFtUKnD+OjqllGoMMAGsAqSXlzGfyeDRyHGa4wFfCBupzvetmDpdhE4jdjqfRdtxw8=
X-Received: by 2002:a05:6602:2d0d:: with SMTP id
 c13mr6403881iow.51.1612290416119; 
 Tue, 02 Feb 2021 10:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-5-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-5-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 10:26:45 -0800
Message-ID: <CAOnJCUKZ82o_BihhJ-1WmUhjiiUDrUc7Wps7JRLMrDeWA012uw@mail.gmail.com>
Subject: Re: [PATCH v14 04/16] dt-bindings: update sifive plic compatible
 string
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_132658_017153_7ACCB098 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add the compatible string "canaan,k210-plic" to the Sifive plic bindings
> to indicate the use of the "sifive,plic-1.0.0" IP block in the Canaan
> Kendryte K210 SoC. The description is also updated to reflect this
> change, that is, that SoCs from other vendors may also use this plic
> implementation.
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../sifive,plic-1.0.0.yaml                    | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index b9a61c9f7530..3db86d329e1e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -8,10 +8,11 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive Platform-Level Interrupt Controller (PLIC)
>
>  description:
> -  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
> -  (PLIC) high-level specification in the RISC-V Privileged Architecture
> -  specification. The PLIC connects all external interrupts in the system to all
> -  hart contexts in the system, via the external interrupt source in each hart.
> +  SiFive other RISC-V and other SoCs include an implementation of the
> +  Platform-Level Interrupt Controller (PLIC) high-level specification in
> +  the RISC-V Privileged Architecture specification. The PLIC connects all

The latest privilege spec doesn't specify PLIC anymore.

> +  external interrupts in the system to all hart contexts in the system, via
> +  the external interrupt source in each hart.
>
>    A hart context is a privilege mode in a hardware execution thread. For example,
>    in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
> @@ -41,9 +42,14 @@ maintainers:
>
>  properties:
>    compatible:
> -    items:
> -      - const: sifive,fu540-c000-plic
> -      - const: sifive,plic-1.0.0
> +    oneOf:
> +      - items:
> +          - const: sifive,fu540-c000-plic
> +          - const: sifive,plic-1.0.0
> +
> +      - items:
> +          - const: canaan,k210-plic
> +          - const: sifive,plic-1.0.0
>
>    reg:
>      maxItems: 1
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

other than that,

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
