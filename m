Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A60C7618A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 21:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0E7j4K3trvRXvdIrgPfHXOddNmwDaSeDKWurIEMS7E=; b=rpbwXVl6FuTLs0
	m3aUaIHpDWEDpUuhc+bS7Qzy5hT929Bjyw+PYPKE7KsaSQQtLEK6t+OeOkXEGESLZMw5BqtUD59oc
	Wdipjw2F+t53TyGeaxo8JUE6VfqoUy0Bsax3zml67wCTK85OqDgAak6oIEBMCbbh1J0MEM9wz4osB
	IbTeTyO3dX1Wsandjj/ZvG5xR0vlasF4tgqmtyK3HgoBwTJyUgQdPU8FgCW20EuqwcdqsE5JbT0WP
	NbQHu2U0rN9BDCHh6EdNUWdJA3sj7eGEYEJeM2EBSfvRslVaRLgBTey2qaPp+c1t6bkflrcQvH6t7
	+LkP3NjoLZtUYS0YHlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYHL-00EQKi-01;
	Wed, 15 Mar 2023 21:03:23 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYHH-00EQJz-0Z
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 21:03:21 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5419d4c340aso207390257b3.11
        for <linux-riscv@lists.infradead.org>; Wed, 15 Mar 2023 14:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678914196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebjbFrpz/+X5Ecv3vTakODOSpqaDbNAgDhn1xxmZU9U=;
        b=3J9p04nY8ZSfVKgwO0UfHaUQ+H9UtqQ38VtcxzoOJZPJGTcF2huqbqTBkfKNCO5ikR
         xJy5CjY1WZ8fzDqNM+4DVF3Lyn1tG/UF6D/Uzs23rhp3yV2t2/iSxxzu+ASbdsm6GL3G
         dNsB5jAjohFoF9sd5vQTbSZf2M3QbIRQxEoE8lLoioRGAJOhGy34UG5Q8GznoHI01fzm
         gZDDq2zBF2/X9RQeqivZK9sHDzzSaPnOdpNOUTGE6XQlXPSTsCbuUOP7LENMJOzay2w7
         xlc53FrzLGh1xUdKKmlB4skKoOp8deGmIQMYYU1lfCs5emjkNG9rkFWCManrdENfTCAk
         EEhA==
X-Gm-Message-State: AO0yUKV+DAGgSSEp+VmlnUgIHy/DVXVTScLcblEwmb6kBXetmqCbJUyY
	UnBZpS0FXVE8usAjeGVfTrZDo130LwzzdAYlKXFfQseY
X-Google-Smtp-Source: AK7set8e62pYUbve18yCJPm1tnWapIagB1amLfxYzcrmp2PVa0ygDPClmkdqYSa+gmKrEF5fpCTg0Pmh3w2ZgUi4VaQ=
X-Received: by 2002:a81:aa0c:0:b0:530:b21f:d604 with SMTP id
 i12-20020a81aa0c000000b00530b21fd604mr751829ywh.9.1678914196433; Wed, 15 Mar
 2023 14:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230315055813.94740-1-william.qiu@starfivetech.com> <20230315055813.94740-3-william.qiu@starfivetech.com>
In-Reply-To: <20230315055813.94740-3-william.qiu@starfivetech.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 15 Mar 2023 22:03:05 +0100
Message-ID: <CANBLGcx1r0Uws5ob5iAwpVdBxvxt4-bHaNyLajxp4oMUoWHFEw@mail.gmail.com>
Subject: Re: [RESEND v6 2/2] riscv: dts: starfive: Add syscon node
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_140319_215018_404C7BB2 
X-CRM114-Status: GOOD (  12.45  )
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

On Wed, 15 Mar 2023 at 06:58, William Qiu <william.qiu@starfivetech.com> wrote:
>
> Add stg_syscon/sys_syscon/aon_syscon node for JH7110 Soc.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index d484ecdf93f7..49dd62276b0d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -362,6 +362,11 @@ i2c2: i2c@10050000 {
>                         status = "disabled";
>                 };
>
> +               stg_syscon: syscon@10240000 {
> +                       compatible = "starfive,jh7110-stg-syscon", "syscon";
> +                       reg = <0x0 0x10240000 0x0 0x1000>;
> +               };
> +
>                 uart3: serial@12000000 {
>                         compatible = "snps,dw-apb-uart";
>                         reg = <0x0 0x12000000 0x0 0x10000>;
> @@ -466,6 +471,11 @@ syscrg: clock-controller@13020000 {
>                         #reset-cells = <1>;
>                 };
>
> +               sys_syscon: syscon@13030000 {
> +                       compatible = "starfive,jh7110-sys-syscon", "syscon";
> +                       reg = <0x0 0x13030000 0x0 0x1000>;
> +               };
> +
>                 sysgpio: pinctrl@13040000 {
>                         compatible = "starfive,jh7110-sys-pinctrl";
>                         reg = <0x0 0x13040000 0x0 0x10000>;
> @@ -495,6 +505,11 @@ aoncrg: clock-controller@17000000 {
>                         #reset-cells = <1>;
>                 };
>
> +               aon_syscon: syscon@17010000 {
> +                       compatible = "starfive,jh7110-aon-syscon", "syscon";
> +                       reg = <0x0 0x17010000 0x0 0x1000>;
> +               };
> +
>                 aongpio: pinctrl@17020000 {
>                         compatible = "starfive,jh7110-aon-pinctrl";
>                         reg = <0x0 0x17020000 0x0 0x10000>;
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
