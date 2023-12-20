Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A235C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vffI+mPhmXQm5gMuVTVKeSrDY6iblq/Bd4lg1jpQO8M=; b=MRLACKu9jQLKlu
	ECcVtjEZ8ePYC6m/u5mkXwfyzsW8CXrQQ+bvDjWKRZJhGb9/8Oks4CIYZ8IFh5zxqt/e6NAxf1iAw
	hWdvLev+1bXHYcPDg715mm6NuvhRVZ4lSTV6F2EEufc/4FIF3B+Eu6rwj9sKc3Bn1tThpPfPfMVlZ
	/BPa9hWAoVXrZpmR3OLkswXTTwVfkEu+temh0UpmEtH90W9r3E7XTbWz/vD/O/FRp1e898OIyASo2
	Fyo/VtX/MEG7Z6iDBRDfaab0WbdVsw8ywdNTPV+Z673w6448YwVOAKVa/+supfbWAPCWwmt5itC0G
	+4eMICvnVx8jKjpcdNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFySP-000EHA-0e;
	Wed, 20 Dec 2023 15:26:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFySK-000EFd-2o;
	Wed, 20 Dec 2023 15:25:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c236624edso63101715e9.1;
        Wed, 20 Dec 2023 07:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703085953; x=1703690753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uS6w3rNmw0cdtYnw4LMSsxjjgZzl4QPxrmb81MWLsvk=;
        b=fnQSkDrXD3YtOfvFO+MxgmHcL66lv351/qh5XhJ19zTE/ywtoOk5okLkPh6xkQOLU7
         aO/YcdnjO2atxItOY2ffOEeSs/Hqpldn+hEyo0sUsgylc24LVyt2tSSUNWuRcDXXZLGl
         2N0sruj6M798PPEsrXZZGg+FS+e31L3dHwgg+nDG4dNHjAZ6yjA/rzlGs1b68V1akBNP
         pe8tKsQMbJznMtyG+7Vsg1GMzjqEyvOELCAW/dlHc/7TbR+wbbBa3G9fSYS3fHfu4sCn
         qSWq8jy7sehUg9/zd0ub6564SxWDSm8ImZ0TZKKXg1CLQBc3RhMLvSxKQmvps3f86fYa
         rv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703085953; x=1703690753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uS6w3rNmw0cdtYnw4LMSsxjjgZzl4QPxrmb81MWLsvk=;
        b=M+WkItPCtJKpn29QxuBUCqhy7tQ/EcBJhZCXHqWXUac82d+pRhKHkUclwzeveyfwSt
         tkErj+iCUnZQGEZfVjd+uOsh+ik3Xha8MqpwQWcVFdgUtFReo9ZDYhJyPK13a95Nrn9s
         AOffe8xQlicNunVqq4EFiAy8tF5aCkWhftzswjbeUIGaEdngmSPMseZkjC9gxJuiPGVl
         w14DzT4iqw4EdnzA11QSPgGK20+fKeyN3q4tMM+mdzP25IiPiePF0dsQ/gLnASUQSgry
         Admuq4wP3RIxat8bs2SKgVkKnca8sQF0OQVioD6NFDqKFcSvbxQ3LXyE2lMyTJlmKSCF
         bLBw==
X-Gm-Message-State: AOJu0YxsjKhIF7ERBFZVgbxMvfPcZAc2iyBqvDottBwAOxoAmt6ZrSfl
	rT/PkMDcMSwRP0bZ5P6VBRs=
X-Google-Smtp-Source: AGHT+IGqN3fsaKks2Cw8XAX/rXbmEt1dkYX1uzdoef3zSrDXFU1J51FjOJPUUlBcU0nkMxM5sTgiRQ==
X-Received: by 2002:a05:600c:5d5:b0:40c:34e1:72e5 with SMTP id p21-20020a05600c05d500b0040c34e172e5mr9978141wmd.69.1703085953376;
        Wed, 20 Dec 2023 07:25:53 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c4f0200b003feae747ff2sm7858073wmq.35.2023.12.20.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:25:53 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: Re: [RFC PATCH 2/2] riscv: dts: allwinner: Fill in OPPs
Date: Wed, 20 Dec 2023 16:25:50 +0100
Message-ID: <113541315.nniJfEyVGO@jernej-laptop>
In-Reply-To: <20231220095141.27883-3-fusibrandon13@gmail.com>
References: <20231220095141.27883-1-fusibrandon13@gmail.com>
 <20231220095141.27883-3-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_072556_926411_CCDC51B5 
X-CRM114-Status: GOOD (  14.31  )
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

Dne sreda, 20. december 2023 ob 10:51:41 CET je Brandon Cheo Fusi napisal(a):
> Specifies two voltage ranges, in order of increasing stability,
> for each OPP. This is heavily inspired by
> 
> https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133
> 
> and
> 
> https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Remove links from message. If you really want them, add Link tag for each.

> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 2f1771c19..8e7bc8bd0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -48,13 +48,17 @@ opp_table_cpu: opp-table-cpu {
>  		opp-408000000 {
>  			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <408000000>;
> -			opp-microvolt-speed0 = <900000 900000 1100000>;
> +
> +			opp-microvolt-speed0 = <950000 900000 1100000>;

Second value should be same as first, otherwise you'll experience stability issue.

> +			opp-microvolt-speed1 = <900000 900000 1100000>;
>  		};
>  
>  		opp-1080000000 {
>  			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <1008000000>;
> -			opp-microvolt-speed0 = <900000 900000 1100000>;
> +
> +			opp-microvolt-speed0 = <1100000 900000 1100000>;

Ditto.

Best regards,
Jernej

> +			opp-microvolt-speed1 = <950000 900000 1100000>;
>  		};
>  	};
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
