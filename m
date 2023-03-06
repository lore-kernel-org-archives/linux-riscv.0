Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31266C678D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 13:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/ZHoQF8kZh+no35O4fZJMz0AlD+hM/Aw1j7jjBuBQs=; b=TLJdkletSrUWSw
	o64cKEzUF+rm7i4x0zv2dG0hmy5UqvkEJFCAsJSCHVJjBM5272Xs9z8PzF5f2OlGMuPznpc58DoZ3
	e1YySk2OBzddX8j48Jv1EkhXZWNJzpjBRxI6EGTAcaalvrkADqmZ3QitwLM7x/H8yIkGeQxRcMMNw
	UFSqmiXiyPmsgVMw16C6v9TrPi5OO6zzNqTniceZ6ZzIkwqAH+cQloUk36xkUiqXTEQr2vFEAwvHg
	Kq8MpupjJoub8sVRWoU5Jka16E1W6XqUaKtBqLeGIJLjWFVu2YA7mevc1T2sJ2UQenDnWc4anWrdQ
	0CkwJne/jWRjbbAUPIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAWH-00CnbC-VB; Mon, 06 Mar 2023 13:04:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAWF-00CnZq-Aj
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 13:04:48 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC9CC3F59E
	for <linux-riscv@lists.infradead.org>; Mon,  6 Mar 2023 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678107885;
	bh=GVtu8wUlTQmI/OH1YDjpwQxG8xUfKX4sW1hVlYeaYkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=GTj4W7uA576Owu1vYoLTkdv1/8FCC7t88z3/a7ijeO3bbY9pHMaIcvE//BE1FBjGp
	 4usP/ZqG49SMjGzCCCxgeG+fRgly40UwLwoZ2ezW+4HwghEMGqZQNR9sOiFWFbAfrx
	 8fkKl09TcrXoHYqHz/pN2eXl7F8LaOIEXJXSBM+7lzj3+0gXiw75n6FcmhfYkRflqb
	 qRmnX4SHDv9O0yRAqPx96ANdyslNxdpGr7TgnH465oK7Rz16ofYHPzrK76PPNlvfcq
	 z+1E1hJzR8GxkR6CAo1LoYsewzUhmrl7+Ah5c9AQTfae4boaDa79/BAq5K5oC4b7XP
	 Fkfu1oHGnmTng==
Received: by mail-qv1-f72.google.com with SMTP id y3-20020a0cec03000000b0056ee5b123bbso5493538qvo.7
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 05:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678107884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVtu8wUlTQmI/OH1YDjpwQxG8xUfKX4sW1hVlYeaYkE=;
        b=bzPAUYlBLCvb+dTAVIldB41L0PsVwcmIxfOgS+gj2TjdK8uF7Nnqxq58BYlf1FDgV3
         HUPG1TmHEb6K7avbpbgK/jQtJduvMsRB7FIsUb6t+sqkZcWBrHQT/t6mpnBf87vJ+pm/
         ZphSSK5WqrXZ+vqNggQWKNRNw+NybuoXx5Nv4K8Hatu8bbynxu22wld4527KNId3R3t1
         99sBXC9tl9yGV5j01u/6RVxQGjPgxppfVJGqHvTRYbiX4XUCwvQyWRRMr476Psb+t24g
         paix3rS14Z6w+Z27IZmoTIOWceYzyDWfeXlSh7BeFVJtdi6T5TR6tpHTywOjq6ljhPDq
         Ee8w==
X-Gm-Message-State: AO0yUKWsdoae2cwiTqkorIAC0zqhHo7e/EIBlD2ExkRfyqqV0sQ80ahm
	A0QYHw9LsVDJb+R1scpCtsE468PVS00HPNao1rlYOhzcHR/uy+slJe1D5LveB6ob1C34l0WNmR+
	Ptdbr9Z7EzgOwCQ1XdCxJCgqc/7XbJz15HShiRdS/2gFBULlQiUawWwhEzoHOBQ==
X-Received: by 2002:a05:6214:18c4:b0:56e:9089:a447 with SMTP id cy4-20020a05621418c400b0056e9089a447mr2646922qvb.0.1678107884407;
        Mon, 06 Mar 2023 05:04:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8y6a5SSW6hPw+GDXCh+fqXFJP9UdQM/IWboALvjPkMRMhCZDeVIkVx5ql1CNUP6/Ugh0IafMD5qUh9dXlK4Pc=
X-Received: by 2002:a05:6214:18c4:b0:56e:9089:a447 with SMTP id
 cy4-20020a05621418c400b0056e9089a447mr2646908qvb.0.1678107884159; Mon, 06 Mar
 2023 05:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com> <20230303085928.4535-13-samin.guo@starfivetech.com>
In-Reply-To: <20230303085928.4535-13-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 6 Mar 2023 14:04:28 +0100
Message-ID: <CAJM55Z-WpxJUshAa_gN5GD+mMp1VaxPbnF6AV-ua0HzsFWsB6w@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] riscv: dts: starfive: visionfive 2: Enable gmac
 device tree node
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_050447_515316_482FC2F7 
X-CRM114-Status: GOOD (  17.18  )
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

On Fri, 3 Mar 2023 at 10:01, Samin Guo <samin.guo@starfivetech.com> wrote:
> From: Yanhong Wang <yanhong.wang@starfivetech.com>
>
> Update gmac device tree node status to okay.
>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../dts/starfive/jh7110-starfive-visionfive-2.dtsi     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index c2aa8946a0f1..d1c409f40014 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -12,6 +12,8 @@
>  / {
>         aliases {
>                 serial0 = &uart0;
> +               ethernet0 = &gmac0;
> +               ethernet1 = &gmac1;

Please sort these alphabetically.

>                 i2c0 = &i2c0;
>                 i2c2 = &i2c2;
>                 i2c5 = &i2c5;
> @@ -92,6 +94,14 @@
>         status = "okay";
>  };
>
> +&gmac0 {
> +       status = "okay";
> +};
> +
> +&gmac1 {
> +       status = "okay";
> +};

Since you'll need to add to the gmac0 and gmac1 nodes in the board
specific files too and it's only one line, consider just dropping this
here and add the status = "okay" there instead.

>  &i2c0 {
>         clock-frequency = <100000>;
>         i2c-sda-hold-time-ns = <300>;
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
