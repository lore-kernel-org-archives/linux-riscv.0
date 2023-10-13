Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24A5CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4A6ndkDARbyP7Tw6aYDSn7Krxth+eXddY5njgPMwxU=; b=0xPWoDSARft+M+
	WwlGt3iyuGB///wUK/yztpDUGSYeGwMF/WWJXKiQYH3FGl1AdrunLX5l4qsLQe7dfxPqCFbHqKlc5
	NwlmDxLORt8hKACbppKR8SYy3xb9TZUPoZjbarWDTMFqsRTMQe8AZka5/vuJdPFnksTjs650f+161
	aeYAqrL1+SLVq5NdtT2Ui8zTLIol0IH1T2R1pb1MHAYST+Pi9kPkFxP+9oBQhxsugxDngikxP/pP+
	deNUodmB/2jMQ3OuLDCNzMILC1HLli/KrtkvxZe5PnkkMPia/CG+1t+iFJpMQqrPmzAqRnMBNaUkE
	WsUeYUupdn8fDclIBiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrNk4-0048NV-2B;
	Fri, 13 Oct 2023 19:22:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrNk0-0048Ln-0U
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 19:22:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4054496bde3so24999775e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697224950; x=1697829750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kye3A1Yvs5J4Iww0la3AMmDBB+iCND6AhkOM5t1F0VI=;
        b=ZeVAE4XSsvjdomicx1wKmeZMGUp5qyc47P8f6P8XzyrMASFXpkJllzcvh/vr1hl8HH
         PSR+edRtHBrNoSN24vDkOXgAQwM/Y1ZmLG32eM1zLxJGdf+kIaZBTmtMToWsEGWgPLrT
         hB55HdekeYrg82QDsi0Nze2GST6v97bu50tHiorTSvBeNceRWAZ6UIebRjPnEbto3440
         BWZNe6oC1H7ajhwC3bszFD0oVEEhCXve9VYhR/MxUKLMNmEha8tzlRZI8iW0VS0WWJZt
         Sus9eWopHQFK/tGwaIhvrCbwZeTFdKNhWY3ahlO4Dj+gMqDlrLz0+86TIvkQ/PNtjW29
         LSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697224950; x=1697829750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kye3A1Yvs5J4Iww0la3AMmDBB+iCND6AhkOM5t1F0VI=;
        b=RFz6AswL59gZbufNaSyu5mmwA2d8+aJpeImvXUCPEX/cfaTLQaaVW1xuTDoXUmxMbS
         2umzPJq/ECiCF+aMM4Zhu6KMrRjIPt7wcVDcpCdK5U/N2ByokcpjFVqMi5vf+yV29Opt
         2of4IwXlkZlL+qRvJMA4yVywN8eXTe/wuWQU270jpmkl1ekVdoUi1fxoXXkczGfIRwJw
         dV00ftghEuDQbTyhLZ8e9Hie9pr9ICDAUeDn+ToUtTZW0zmkBoDDWmnale3r2a4gLwKf
         2uB/3vJNNaCtY2KjCMKcVjR612FZH126C7y6T7iTT9X+uO5AdaQP70hMF+jAR/qKUXCP
         BEZA==
X-Gm-Message-State: AOJu0YzEmg+sYyLzBMsq44XDtIqQJhMJVY/Syg1xplh3Ll6Jv5eqdrjF
	91vVcsznwqGFq5OvaNEAYsc=
X-Google-Smtp-Source: AGHT+IGajdHE3PweJdvXSQ0yret8uEjGOtFP2vrw3G3CEj2ABtyBTVw14FyU6Qk14fADJaWQKUMP0A==
X-Received: by 2002:a5d:5391:0:b0:32d:9d3d:3025 with SMTP id d17-20020a5d5391000000b0032d9d3d3025mr1851163wrv.26.1697224950584;
        Fri, 13 Oct 2023 12:22:30 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id i2-20020a5d5582000000b00323293bd023sm842831wrv.6.2023.10.13.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:22:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-riscv@lists.indradead.org, Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, conor.dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] riscv: dts: allwinner: convert isa detection to new
 properties
Date: Fri, 13 Oct 2023 21:22:28 +0200
Message-ID: <3766810.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20231009-moonlight-gray-92debdc89f30@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231009-moonlight-gray-92debdc89f30@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_122232_190270_45728770 
X-CRM114-Status: GOOD (  12.17  )
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

Dne ponedeljek, 09. oktober 2023 ob 11:37:49 CEST je Conor Dooley napisal(a):
> Convert the D1 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied, thanks!

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 0856f18dc3cf..64c3c2e6cbe0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -25,6 +25,9 @@ cpu0: cpu@0 {
>  			mmu-type = "riscv,sv39";
>  			operating-points-v2 = <&opp_table_cpu>;
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			#cooling-cells = <2>;
>  
>  			cpu0_intc: interrupt-controller {
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
