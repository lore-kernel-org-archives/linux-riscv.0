Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA07C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 06:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE6660FC3
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 06:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EE6660FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfFHlXan67jJRojadL63AN8eOkN5HRBGSlNrZi5xWsE=; b=vCO0Vr025OBdmU
	9sZuuISiHEjDhpDOkSL1/B9Fh53kFYihCARJD28IecaC3cPkNwV3y8TYsc+cMnQzlQFPRuoBW0KmH
	1thT7nKiZKUR+qGaQ7NmSxeD+IIoSIkqQ+bSlHo4VMAws+Lt+2lk5LUBVl4a+jdB9LjcXW8oWNXh9
	IHiqqR1/XnY3hmN4/GkgAfxfo0o17QcpF1Cpn7i4oI0WMLsFDvuTPA1zsgFoFRsvhuBz5E7MWM/tG
	PExbntjpu09mMJmoUUSqYydONX20tNKZjnNUCN8tPL3PGZpKUW3CMuK4Dt80n0dehkPmQWn/h7tlV
	0Ms57+n6Immqb01r/SCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mciKX-000Gqb-RX; Tue, 19 Oct 2021 06:10:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciKV-000Gpy-Oj; Tue, 19 Oct 2021 06:10:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4692160FC3;
 Tue, 19 Oct 2021 06:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634623831;
 bh=u+Ilu8ZfCIk/SAHfeUMLovFRamhqskc32+yAIxg0U+0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DPkhJySxmCpIUk2eNWQTLHbFcR/tyojuHdM5zdK1mzRiPsABPFMPgPdyoofQ4PXoW
 1X9pjj0vKQPh2ZAmyX/XwOkFYdV6BcAF3NF/qv62c5vQom2zOVFjfWoUIFnG1S4YJ2
 yCg/AzSW6lH4RJ0QQRD8ZbOhYhgx3d4jkPNCeB4ER92YGvWNkkspjD84sEDQgogBro
 dTR5qWEA4HzD5CEl97TPb3vhfgJveiREpUXFRlYpmDdKczpRuUlrTiHFWkdr1E4w5B
 yk7ToI331G1T7wzyaBLL6AX/vL5yqf4euyHJMToJG1YqxXZwAeDXnxzcZ1yjPeCT3E
 XX3bEM/JDdoNQ==
Received: by mail-ua1-f50.google.com with SMTP id r22so7985554uat.11;
 Mon, 18 Oct 2021 23:10:31 -0700 (PDT)
X-Gm-Message-State: AOAM5323J/7n+CTM8etosd4eZkgTEdKoyJUwFOZvGtLNdMVmFoeMdU/H
 hgMp+8XhkXvRKsqyJKl8bTDQlrJbWm3Fwzb8q4g=
X-Google-Smtp-Source: ABdhPJw3Mc6SqA6Eam+0sVztf/Pclmbs4aaAoLiGe4ywO9oP8nSkm4l+4xes/yIXIaU/1wxduBlytApEX0jhxhKslZk=
X-Received: by 2002:ab0:6797:: with SMTP id v23mr31062668uar.97.1634623830411; 
 Mon, 18 Oct 2021 23:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Oct 2021 14:10:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjhc2JvC9xdXf6DagMNR_sg41txjnw5Wn2NfJLXd7woA@mail.gmail.com>
Message-ID: <CAJF2gTTjhc2JvC9xdXf6DagMNR_sg41txjnw5Wn2NfJLXd7woA@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Guo Ren <guoren@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Xiang W <wxjstz@126.com>, 
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_231031_860477_95FB3C69 
X-CRM114-Status: GOOD (  20.51  )
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

On Fri, Oct 15, 2021 at 6:10 PM Heinrich Schuchardt
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
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a35952f48742..266012d887b5 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -41,6 +41,13 @@ properties:
>    reg:
>      maxItems: 1
>
> +  reg-io-width:
> +    description: |
> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support

         ^^^^^^^^^^^ -> allwinner d1, new version of our processors
would support 64bit access
> +      32bit access for MTIMER.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 4
> +
>    interrupts-extended:
>      minItems: 1
>
> --
> 2.32.0
>
>
> --
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
