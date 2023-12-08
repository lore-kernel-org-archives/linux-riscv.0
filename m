Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185C8C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uQRYOT4TbW8IRRtPgps3mp/1vX9f86SVghposUsjnaI=; b=qriz+hAmXn39Z/7n4HchP0iaRf
	3e5nyrcmYzSfDipJIkKuExi7UzKZ9lBURcCfzZdLUsLKHX0JiX15KDyB4NBgn/pxOF7Nql02Nwmle
	3Z+bVRCOD2S9uC6PpW5OLz0ucaZN49T2QjzqZI9AAcwdhUCPZGGYWcVx4BcRqZKLJ9t85m9GBEEWh
	2WQZDZnxzN+TgimP7oJ0+4U3DhZdPZYAVyy1fE2KRA7fYOBdaVqcLqRHOORLGicb+Lhc9tjnn1BeZ
	wzPGe5IOCaVgCFOgJyDGTLH+/sVOni8ZZznuSV8Oav/Gf+hDkAEP5J55im9TR1bxLePMgvU2Rngk6
	RPfNVDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeph-00GD3T-1J;
	Fri, 08 Dec 2023 17:40:13 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBepd-00GD2B-0l
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:40:11 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 35C7C3F79C
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702057203;
	bh=0Wg7c2RtoSlacNEX+QsvU/G8vYuCUeUJAnALPbL3Qqk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=oGsCiZm9In+2jXgImmVL8dzSuruyfGsL4cWAkffTvth1Fgi3Jh4711hMmuS3PoFqB
	 mtpV+RGxpHG0jIsqPLp8u3siYu+1AD8QH76eW1/5Rcm1/SSdNnVvOMPlU/yQr76xIM
	 L4PoMxeisdI5zwBQULSzRfl8/vvFrCvEWbdQ492IAmFBJFGMGCVtG6mf9VsWszzmJ+
	 uwDHWlApmS/T/IT+JabMCkqW+WdBPEcWMH1hXmBvuO0v8r0q6s1uDVbwXuDxPw1I3g
	 BTQJcwqC667CZQSYGYT0TdQxVv8th2V/4ymADhDTyzA1O4/kYwa2xo0tiI/PK4Wq2a
	 ooi27HTcQLIWg==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1fb36840642so3679773fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 09:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702057201; x=1702662001;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wg7c2RtoSlacNEX+QsvU/G8vYuCUeUJAnALPbL3Qqk=;
        b=UiudSmrXSrJGSe1Yn+x+cy/2jfvbzG8L/WwfRRkGq2CmCKysABF7UmIQbMz2fcj5rB
         yqJZXesKuOWWXikSuDjQvXcno27xEKz11vXjaRSbd5SDNphu8T7c3O20iTKpocmerz1m
         TK5VT189TBQCTBU9e1jRpmvo/dvFT4dYkQv8lJbx35navnZ9X5gtnJ7zHH7+GF7j5OMI
         CIADklf+nQVdPv5PBEutnyBFKukUx+NM8vbQcGo9oa9o91OClqcqa8pWB3iSM585Z+Zt
         3QfOXcInLScbEj9p/JC6VRmpx0jRiFtYBJVCkVSvVZHK93o1HbAkDCuvOCxXiDlKISRa
         n3Ew==
X-Gm-Message-State: AOJu0Yzm0dotf/pHXDycVAGDpu3M+xYWqA0dUXjd0nXdC2spfYZ9M81T
	LajEUIweP1EOcc5U++8vOJXOd5e2JBVbBv/dLEtaN4zEBk/87h4o4xgQq/EMjvO/YpTfQjcb07Z
	9tEL2pdcMrix5LbE992oIHCsGFyi6uVvO7xfLCZv1KYzdosp5uDe+1B+S06NT6g==
X-Received: by 2002:a05:6870:829f:b0:1fa:1ca4:b917 with SMTP id q31-20020a056870829f00b001fa1ca4b917mr505707oae.41.1702057201369;
        Fri, 08 Dec 2023 09:40:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvoxqbD9MmiUzi/kijiStuj/gY6AFJbn8AI5LFKGHA7PcQEWa4r0J5A0xv1noNymQSla3/fUfHzp1Y4889ZZA=
X-Received: by 2002:a05:6870:829f:b0:1fa:1ca4:b917 with SMTP id
 q31-20020a056870829f00b001fa1ca4b917mr505697oae.41.1702057201119; Fri, 08 Dec
 2023 09:40:01 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 09:40:00 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231208-unripe-maximum-fc77f4967561@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud> <20231208-unripe-maximum-fc77f4967561@spud>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 09:40:00 -0800
Message-ID: <CAJM55Z_ozf=MwOJCSM154L__TE1Gv7Ec=gM8LFJ31-_eX66OKA@mail.gmail.com>
Subject: Re: [PATCH RESEND v1 1/7] dt-bindings: clock: mpfs: add more MSSPLL
 output definitions
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_094009_409777_AFCC793D 
X-CRM114-Status: GOOD (  15.35  )
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

Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> There are 3 undocumented outputs of the MSSPLL that are used for the CAN
> bus, "user crypto" module and eMMC. Add their clock IDs so that they can
> be hooked up in DT.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/dt-bindings/clock/microchip,mpfs-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
> index 79775a5134ca..b52f19a2b480 100644
> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
> @@ -44,6 +44,11 @@
>
>  #define CLK_RTCREF	33
>  #define CLK_MSSPLL	34
> +#define CLK_MSSPLL0	34

You add this new CLK_MSSPLL0 macro with the same value as CLK_MSSPLL, but
never seem to use it in this series. Did you mean to rename the CLK_MSSPLL
instances CLK_MSSPLL0?

> +#define CLK_MSSPLL1	35
> +#define CLK_MSSPLL2	36
> +#define CLK_MSSPLL3	37
> +/* 38 is reserved for MSS PLL internals */
>
>  /* Clock Conditioning Circuitry Clock IDs */
>
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
