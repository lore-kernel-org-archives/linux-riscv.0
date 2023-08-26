Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D01BC83F11
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNSG1TEBTkWxQ88BqyXCrayq+jkL99HTxrJQHcVCQh8=; b=JoCBtbGbdwFId1
	3KgBf7C/GJFb528nhc3nzIdRl1d/5Wno63PjPNdsO0tPOAmmZ6HZXg2uIbUgg8uXTsU+LfANt07y1
	oEcd+omsgCuTRtszHKBt5YhbR3KdmKaFiVWCOVLfiZ5tKolErZjVGO6An2Z7EYvApZfuiyRVGhQOx
	c1VwUr0ZZqpnGax6YApa3bXhGSomNmb35d6C60hy3aiap89lHnZAYTE4a8n6XqIu0+CA5Jqpap2xu
	kKfEg+mc822zKpAZG/BqSKoQBf+fgHLeV1LcoAS9FzMUHJxIaAuRgdYpAD5RszHceXhu1MXpmXNEk
	1LLD+9v+SMox3TLYcqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa1BK-007Flu-1e;
	Sat, 26 Aug 2023 21:50:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa1BG-007FlW-1w
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 21:50:56 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE3A53F65C
	for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693086643;
	bh=VjTIpaKc3M9gQ6muJD7ayrAgi+ZhVB11zZBZ8oimfFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Q9VrHbf6IT0Yw68n55/HpfW8GkEnYfTztXHhSfNrpTdOFCDMIcQCNyyfqdheXMOuV
	 9OwnfwmJqpskMb0w0e5fSzelxg6E0USiHFdPjUld25U1A5Fout1PzidK0Vg8rYmdfg
	 Q9WwUxyP18KeZB+GcqxWcIG7KidmHWxXNq6LD+OHH93GDhMeiWgBgafu6YKUsNlRzD
	 AWSGozJchS4Wuj3Vdu20LdrtRgb9V4WtPlYPeuBoatoTAXBFos2wnJIpRfYNEFmcAS
	 TtYaITjwtibIqs3OwaciQYWHS+evXsaYg9QQvTJCZVpDFOlsE6eFBrmxww2eMG90Jh
	 Ny0X8EBBndHdg==
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-64bf507a8d4so25421246d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 14:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693086643; x=1693691443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjTIpaKc3M9gQ6muJD7ayrAgi+ZhVB11zZBZ8oimfFg=;
        b=i4ZO816WE43olHc/8MG/mj8/grWM5NUU/w78Q7iPLE/jZNeqYhlIEy4ms7FC4pgQZL
         m752sKTqZDHM+AY6a9u4KsliAo/4aT1Jjd0C6E/wfysNK5WgNVB7mt3a/6q//Xs+yRMS
         pryUKnhNm6XD5qn+1CJd8V5apbECR7qALd1eLMwfYsNcVmt6x9djHdts7YiHrTNxrCG4
         czfXn5m1tMA3kSHk1VsEWYio+9vEWwSr14u82mtkjYCKNXTuMZKjWjX73ZHZGxLA3lR0
         KYXsUWxkH8U4KxR0vZgXMgBJv9Ha0eeXQHs8oEedewMR754i4KbulPrELQ83DwXo3rHi
         33tA==
X-Gm-Message-State: AOJu0YzNyhWFLUyfmptc58S4Z3hQ/JoDykYA/ybrVjrYKFAMO4bauuKH
	uEkO2O78rBU2QaAa/uHR/qbiQ5RPHoIa1gZldUT7L95t7zeNdhWrvv6cvo90rwufXWWJOI+HiNW
	oHOKTUeqdYV1qjG7E9XvhOrYpbVdfmtTy5GdqibyapG2z6fAK/wGKfK7rp2cGSQ==
X-Received: by 2002:a05:622a:118c:b0:412:bea:af8f with SMTP id m12-20020a05622a118c00b004120beaaf8fmr7293533qtk.23.1693086642802;
        Sat, 26 Aug 2023 14:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBLfcky1Z5PXKn1SUBVQjv9ZgfioMwralikcznERsXZJGRRjNVz25sqDnqt9XYzbuahJwL0KTCDKt/yzCUAg=
X-Received: by 2002:a05:622a:118c:b0:412:bea:af8f with SMTP id
 m12-20020a05622a118c00b004120beaaf8fmr7293510qtk.23.1693086642493; Sat, 26
 Aug 2023 14:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230826182702.2641743-1-aurelien@aurel32.net>
In-Reply-To: <20230826182702.2641743-1-aurelien@aurel32.net>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sat, 26 Aug 2023 23:50:26 +0200
Message-ID: <CAJM55Z8zsfywScSeoSyKogAJZndKuPTF+_4GGd9+9ZcYraqLHQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: fix NOR flash reserved-data
 partition size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>, 
	William Qiu <william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_145055_046566_08EC8F9C 
X-CRM114-Status: GOOD (  22.61  )
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

On Sat, 26 Aug 2023 at 20:28, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> The Starfive VisionFive 2 has a 16MiB NOR flash, while the reserved-data
> partition is declared starting at address 0x600000 with a size of
> 0x1000000. This causes the kernel to output the following warning:
>
> [   22.156589] mtd: partition "reserved-data" extends beyond the end of device "13010000.spi.0" -- size truncated to 0xa00000
>
> It seems to be a confusion between the size of the partition and the end
> address. Fix that by specifying the right size.
>
> Fixes: 8384087a4223 ("riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC")

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 498eb179d90f..30c85ba6da02 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -262,7 +262,7 @@ uboot@100000 {
>                                 reg = <0x100000 0x400000>;
>                         };
>                         reserved-data@600000 {
> -                               reg = <0x600000 0x1000000>;
> +                               reg = <0x600000 0xa00000>;
>                         };
>                 };
>         };
> --
> 2.39.2
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
