Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B39C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NZecgtlupopauJ51mMJaiOKIKpsqZwvgNtcxH/I3zgU=; b=39E4+ST9tnT0DU1AU4bCemL2RO
	2qw/GvMD8LzP0mMw1gT/VhIkx4RjV4OlQxgWEHWM1t3E29oiSAyKoRhEJ11fy1Vtcrf/zdUWt0q9p
	GaddzrxtXabwybOFm4DFUsZF0q0paodnAiiaaL6lTzwKLo9Xph2aeuV5zBPsJb4/l7Cy/U/Pih0Px
	r/hf9PdTrZPmXDJfPBHIQW2YoKuhv1yXkzd2wY8J0RbXiTM/DKDd6cFM9pQFmfJa8z3lNFu5WUHVx
	pa0kwTZ+sB52saXosLLHzAjJR9IRdfhSuqV5kMprOOQV+pOi3uuHSoU25uoy12F5+GLAAj68gfAcr
	IV/aZGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeLn-002R4c-25; Tue, 07 Mar 2023 20:55:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeLd-002R2U-6z
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:55:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id bo22so14488658pjb.4
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 12:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678222546;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO0KQCxzIVJEU61zfS2DoDmuDuWz5uR1jN4Ijq9LhZo=;
        b=lpHxnwwPK15OkkFaTvNUoMCaaJEJi5c9/PYeQlJ2jMiPjoPkgwrepzfmkgtyO8O+HT
         wu3juAerU/L8cjIvUiZtQspVCHC1d+932kvi9FW+xS58qaCCsLdpwmai+bjXxQUdzCBk
         l5mlHFpS9jE3/r4xQTsIA2O/p/CuMHJIkcb3A1pOHy9/Eybrn33WBmaDgDf4G3UIfr1c
         iefB4omy/roI6W5ox5wVdjkHqU98G/aw2ZD5T4ZB2CVf1Z6vufEQTV3jCShu28V1PcbC
         KCwAXE2IWqbcaM7JP5Wtn8oVYsGG0J89eG+an5RJcAvSARQQ+1X9OB8PkFV4ARWVOREC
         56Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222546;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO0KQCxzIVJEU61zfS2DoDmuDuWz5uR1jN4Ijq9LhZo=;
        b=MoPms0dTLhHR07FXpFen38mvSXC0ZL4ftWrAF9ky6qzjC/uEAZhHlwhF52Cs4WVt/4
         PLcQiT1xC96G+l7QQT002ORCn6fy+3qgaZTm5j9hLOw9TJbQbNHUp3d6Cth+yf4h8hAp
         VLq2TSMKphuK+6VkMmo5Hxg9OvMtI3rgPKTM7/792h2nYXv7d0+6FA6pCe6Id/gx51oh
         40VugxHs3FT1wSAaks7Cago+/jwGEcH/myo64GgaJ3xZdIROXo544b4UqKxbxoX2VoJz
         9T2J/sHo6v+DiMokKMccLzHWTI/EONsajSgy9f1/eUUDGVmJvXoZaNOPpU9dDzM40L6A
         g/8Q==
X-Gm-Message-State: AO0yUKUw5RsmlgsNisdYu2rC9twFhgCFo1AwVbcC6A79JpUo0FUeuKQA
	N6nfHpWxI8arIKirbM0ziB9MgQ==
X-Google-Smtp-Source: AK7set8dzNL26UJcqtdZJRUN5setrL9jyj2OiCFQRqVQnRmvelN4BI2oq+p+jIfWk57Ieeg5LqLM/Q==
X-Received: by 2002:a17:902:bc42:b0:19e:6a4c:9fa0 with SMTP id t2-20020a170902bc4200b0019e6a4c9fa0mr14126770plz.49.1678222546093;
        Tue, 07 Mar 2023 12:55:46 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b0019c2cf1554csm8814373plc.13.2023.03.07.12.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:55:45 -0800 (PST)
Date: Tue, 07 Mar 2023 12:55:45 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 12:54:38 PST (-0800)
Subject: Re: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add crypto engine node
In-Reply-To: <20221231220146.646-4-samuel@sholland.org>
CC: clabbe.montjoie@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net,
  wens@csie.org, jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
  robh+dt@kernel.org, samuel@sholland.org, aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-sunxi@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-0ef61e01-7731-4c5f-9487-e4ab8553b87c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_125549_278242_AEBD72AD 
X-CRM114-Status: GOOD (  17.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 31 Dec 2022 14:01:45 PST (-0800), samuel@sholland.org wrote:
> D1 contains a crypto engine which is supported by the sun8i-ce driver.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> Changes in v2:
>  - New patch for v2
>
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index dff363a3c934..b30b4b1465f6 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -378,6 +378,18 @@ sid: efuse@3006000 {
>  			#size-cells = <1>;
>  		};
>
> +		crypto: crypto@3040000 {
> +			compatible = "allwinner,sun20i-d1-crypto";
> +			reg = <0x3040000 0x800>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(52) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CE>,
> +				 <&ccu CLK_CE>,
> +				 <&ccu CLK_MBUS_CE>,
> +				 <&rtc CLK_IOSC>;
> +			clock-names = "bus", "mod", "ram", "trng";
> +			resets = <&ccu RST_BUS_CE>;
> +		};
> +
>  		mbus: dram-controller@3102000 {
>  			compatible = "allwinner,sun20i-d1-mbus";
>  			reg = <0x3102000 0x1000>,

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
