Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CEDC02199
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 12:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cc4NG2TedYWzx2zwNcqDhq7pljYyyjSAME/0wL/moxs=; b=gPd7yeHlJjqH9d
	R0zNoMODEMNFOr4eSpMrIMhVRQpmueLFNFNSv8Al4Ps7k8AWsaLGtPkhGjo0OQP+J5CMdCQP8DUwy
	57VlVbKQj5aQz7gnqKSy5zqV+fwwkVMcYmMsWRRhTmZVM/gJPcmMGfkeeBLWfBd1gicca9nP/3KzQ
	9vyAs5xSi37ZZ5DIDRntmOMZ9OiyvgCJyzhJnTCvLHSBLJes+1d/PRhPf/nCQBgbpp23EmWqZgg7f
	IGpGJiTuUOE0BaO1aJm/7nnps14ymDVOg9JzNg9Mi/jtILGxfwAkNRo7UyyfGTdqbKBO6SP0wsUQj
	biDjyIFXZJjqAC4h1SLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNkN-00000009YUg-0Uik;
	Fri, 07 Feb 2025 12:46:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNkK-00000009YUK-0Cvj
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 12:46:13 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 568053FE6E
	for <linux-riscv@lists.infradead.org>; Fri,  7 Feb 2025 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738932369;
	bh=2ZwUPJofjuVtYyvUvViroJ51go9pRIvg6aRbC/noSgE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Content-Type;
	b=fCFBhiQk+dHfmA7QV8FRDm0NxYcENWEy8owF+Qx3L97DxHt+ja3t0WLIrNqQAEVlR
	 9G36wUWbs/COxtP3On5TRLEQ+4UwjKtXWTVnMHc6L44Jyh+WmmSsFMZhy+k+1JXnKE
	 5YWzJvYv13uDqk6WqAPc+vt65QV7DXk5jl2/H41upg7JIKT+CsuzaL4aF3QNtSgY0f
	 LINK9TN+ScCIGBXh8egbIMYPBtmgt85V4+q4ty+7LIeOqw1IJTq96UoSaH6vKCpOuv
	 cQqGPY6JA+J+Rsz+CGhbGUy+/8A7gL4brhwQWjUzfHURe0rViivjauw1dHjpNjHDmv
	 6850BtUfNGtAg==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2b840a047f6so811640fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 04:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738932368; x=1739537168;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZwUPJofjuVtYyvUvViroJ51go9pRIvg6aRbC/noSgE=;
        b=wrgSZDlJiiIN1Er2tNwvATPKntj2Zg56abTWo6aedVqVAztYZO6Tksij2dYH9oPHVf
         jl87o2SKCNA/YbUoGFFUzF2yYxPPoQ/OOgYxekR3KHYzRoS+Qv/MElgnOis97gPAjYBy
         oHE6O+o321JlS2bhF1yh6HbVrw9rx1LAoNCbZ3E4LFQaxfnrsytQCGa9REJGWynFZ5jo
         0qUvEwu4xb6JgQrc+SoZQClirAp8IEkE9D03gfRlUtpwMdESNYkh4jcnRLBmZWQR/pq5
         bol+FUUDzqt7XVl69C5v8P7XWtZ+s6Wzn6EwrGjHF+I5r+/g9Rfcsli1aHLWG3jqIlbM
         mpHw==
X-Forwarded-Encrypted: i=1; AJvYcCUFBTFxSQmY+XOcu5QSwCGvN3yG8wa7mrUuvHxeC6YVAFYA+XVn23Yq7F3IMdAaF6D62IX092EJ0o/OnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY3vS+KruldvzXRHC+47JnSqWp1RM+ZnSYFzorjnoDcqzJxtPK
	1UxNDN/qaP9VG6jx/vLMB5vui+HIc7z1DjgdkFMMnDXFnzPtkqcDxEaCOaYypJnla5JIZ2Lhut0
	N6yHLRiKP3uAVgrVGzj608ZLOmXsFSlTARXnsfRf/vwrTxboS0GSYEHJ+e9HM5a9o4zCuWbgaxy
	x/Gnf2R9d9ikxTV3u3pTw9DEgunZ4BAdEONwXpkZ5qXY+sOxCvJDPMLjB5
X-Gm-Gg: ASbGnctdUZ1pBxUhy6+AD3E+ka+jX8rAA8uJ6o+dtnxPUpN1wXaIx7WsnnH9iyEf1hT
	fC3a5s2DRp2H54ni9oau4kcl4JlmUldeYX0dcrkkj8mH9/2YMbTmC9SFPAfxSfA==
X-Received: by 2002:a05:6870:c4f:b0:29e:354e:5fdb with SMTP id 586e51a60fabf-2b83ef92ce2mr1639808fac.37.1738932368240;
        Fri, 07 Feb 2025 04:46:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8717iINw6GQLmXUMzAsQEraXJmnomHeDq/9rOE8N8dSrNmc1FXULqlUBnU6Vyo0eCApuqsrLIMq5Hi2dty7Y=
X-Received: by 2002:a05:6870:c4f:b0:29e:354e:5fdb with SMTP id
 586e51a60fabf-2b83ef92ce2mr1639799fac.37.1738932368012; Fri, 07 Feb 2025
 04:46:08 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:46:07 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:46:07 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
References: <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Date: Fri, 7 Feb 2025 04:46:07 -0800
X-Gm-Features: AWEUYZmHbacGaT6tTq_P7xegNAmTpSpPwRhBA5Opynsjcw0ztqQPHtv9Yj0u9dM
Message-ID: <CAJM55Z_zuaXSchVFwdiCzJJ3j2fHKg-w6j4GP+sqKB3AgvipxQ@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: Unify regulator naming scheme
To: Shengyu Qu <wiagn233@outlook.com>, conor@kernel.org, kernel@esmil.dk, 
	robh@kernel.org, krzk+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_044612_349594_36A320E7 
X-CRM114-Status: GOOD (  11.64  )
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

Shengyu Qu wrote:
> Currently, there are 3 regulators defined in JH7110's common device tree,
> but regulator names are mixed with "-" and "_". So unify them to "_",
> which is more often to be seen in other dts files.
>
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>

Thanks!

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 48fb5091b8176..dd2eefc295e5c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -233,7 +233,7 @@ vdd_cpu: dcdc2 {
>  				regulator-always-on;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1540000>;
> -				regulator-name = "vdd-cpu";
> +				regulator-name = "vdd_cpu";
>  			};
>
>  			emmc_vdd: aldo4 {
> --
> 2.48.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
