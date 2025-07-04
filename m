Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADF1C83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+U0Yeh1RYcQXUHs6GOkCOVoFog2mqx4OucErH1zE5M=; b=2Q+8mE2EbcoXRS
	b4fkIK6UR+DfbZmyy3UTAtbVXflcZzGala81A+ZKe66UqMAijfrboajKYHKJd2cVxxfKU2uMcHNmT
	B4Mxy1q/+AadEiwl12sQvV2rAVw4IKu3r4cxW12YDXDPQzi5Tifhv3xhIr6M7xBKTE0UBasDEyilS
	V1t0HVcD7kZm2EjIORznvghmmAPDNN2bbmOiftNIq6mhcNNYCCFFp/mmJuMinAj3HTl0JZGBqts7C
	DMBOdQr0s3p18fy2opuUN0zKSQMbHqW55NqVrfVG3N3UYBaU/80d8YWJum8EMNNfJc0BoLjEu116g
	uyRpo87AmHIzHiP3Ocrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXa9F-0000000DRw2-1ApV;
	Fri, 04 Jul 2025 06:43:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXa5W-0000000DRRk-1gIv
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 06:39:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b321bd36a41so519751a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751611197; x=1752215997; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymwt9R5fmPgIM//LR+Lj3Iy4Vwk081dGhvYmgoS7Ai4=;
        b=nOJANc9OwvPIvof+mURqaLaPrS3c4y/K1o6Kbq/gSWiweBDJgd18R92sAICbFTlATI
         dg8BitLQi2f5UHSx5ipIuwmag/wLOuZ1WqP0693sqYmoMTZTsOmmcpafNxg/dP513djN
         vBR49P5nuGPDS7I1/lrdencOojV1Wi+Ymsr+sM1CrQGg6E/06GiDc3k8+hxu5btsM+6j
         5qP7RQ8bVxSpfyTyDWTEzbKh24k7bTeZ9NgBQo9bGjpJfjejvG0GW18HKw8HfrJG53X2
         nBychPi/WF6sTCoXiJqD8gaGy8AmtzPPYvmCJ9mMatRwtxcFXMPRNn8JvDhSysmz0Lr8
         CoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611197; x=1752215997;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymwt9R5fmPgIM//LR+Lj3Iy4Vwk081dGhvYmgoS7Ai4=;
        b=GZKvwel/eSmL+tYvkQ/w52mXMnXk7+POrUkGN4yX+CwD8MeRbafs7HPdf91oK8bIGu
         eECsk6vRdbKyZaK9egVblSXf6Lt1/JRg6M4uGFhfFKWBPWRF2U33vYtA9yu/tcIrq9Kz
         +ORzKkj+P7DQzfTTcp3I5sA+3NWc5kMVbFHTUp+vV5eMYSfhx7EAu69KZO+7FgJCIXqa
         xZp0MtumTbT/VNB/Ln4ci8gt/6DyDMaOnlKYV6bz3VJPPHX/K1jPVn+W+glZmOggBqN5
         58WkioMOD0I+B8jkG83obuU/zJzBbUthFx5V5cDHjQo21XNyMJzBv5vNLWEIf+0A5hSM
         LHFw==
X-Forwarded-Encrypted: i=1; AJvYcCUKTUo+S3rQAWHDUMgFxLD8oJ7axg9huNmAe6TDJ2sM4oJcaMNwSKgYtKVbdm0/rR8+paOyfqXNNklVDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjY/7gevYtTfrBEEAS4AUTw7YLTiAwKOEZkDdG6p19BNCC7w6O
	C1UfTLF4sTdbTYmW+iqp3Yihe30atug9ZC7FGnTZ34evp7pS1FCy6QQx
X-Gm-Gg: ASbGncufvu/o9Zke5H6dRjG/8/mvQtcWjz7aEuHaBOtmVp3jLcuMG2lu6XoiBgNBstF
	MFSUjlgRLHvVZL773RTL5vI7Vi5pb49GRaNgHl7joXhXjKBG3vRHxtCdIUw+UFQLRISqPYuQHc0
	+NpKJkAogMWYXFXFRzAm0uV+4iGL69lPj9zeZD8ShMrC+/yTvU6AkDU511nlAzFfbCnYJfm6FAy
	8Yk9oUCJV7Z2BhAVl4RJkYkTnmkrtFiQ2Lh/cEm1nGOmH4XqhrHALN/EH0MMLjhKKISBV8Q4z1+
	KkSyER5U9ApchHzADGmLzU0yvm2w/H3P0hbj6tTvyV2mnNY/jky3IwjiQnjKVBFRA8MkJw==
X-Google-Smtp-Source: AGHT+IFOkhU+1nxlQZhAQxZXi77aM4zfexPWDU++C9eDMbXR9WmHMDnfeoJU+xJpMd5beE5eWd6dYg==
X-Received: by 2002:a17:90b:264a:b0:313:f6fa:5bb5 with SMTP id 98e67ed59e1d1-31aadd853b5mr1776898a91.18.1751611196972;
        Thu, 03 Jul 2025 23:39:56 -0700 (PDT)
Received: from smtpclient.apple ([206.83.106.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cd1be78sm4231889a91.42.2025.07.03.23.39.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:39:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add pmu configuration
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250703003844.84617-1-inochiama@gmail.com>
Date: Fri, 4 Jul 2025 14:39:39 +0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
Message-Id: <58869404-7F27-4299-AB26-1B5E9F59D8ED@gmail.com>
References: <20250703003844.84617-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_233958_439895_B09A5928 
X-CRM114-Status: GOOD (  15.28  )
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



> On Jul 3, 2025, at 08:38, Inochi Amaoto <inochiama@gmail.com> wrote:
> 
> Add PMU configuration for the cpu of sg2044, which is the V2
> version of C920.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 91 +++++++++++++++++++++
> 1 file changed, 91 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> index 6a35ed8f253c..2d21b2881ab8 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -2778,6 +2778,97 @@ l3_cache: cache-controller-16 {
> 		};
> 	};
> 
> +	pmu {
> +		compatible = "riscv,pmu";
> +		riscv,event-to-mhpmevent =
> +			<0x00003 0x00000000 0x00000010>,
> +			<0x00004 0x00000000 0x00000011>,
> +			<0x00005 0x00000000 0x00000007>,
> +			<0x00006 0x00000000 0x00000006>,
> +			<0x00008 0x00000000 0x00000027>,
> +			<0x00009 0x00000000 0x00000028>,
> +			<0x10000 0x00000000 0x0000000c>,
> +			<0x10001 0x00000000 0x0000000d>,
> +			<0x10002 0x00000000 0x0000000e>,
> +			<0x10003 0x00000000 0x0000000f>,
> +			<0x10008 0x00000000 0x00000001>,
> +			<0x10009 0x00000000 0x00000002>,
> +			<0x10010 0x00000000 0x00000010>,
> +			<0x10011 0x00000000 0x00000011>,
> +			<0x10012 0x00000000 0x00000012>,
> +			<0x10013 0x00000000 0x00000013>,
> +			<0x10019 0x00000000 0x00000004>,
> +			<0x10021 0x00000000 0x00000003>,
> +			<0x10030 0x00000000 0x0000001c>,
> +			<0x10031 0x00000000 0x0000001b>;
> +		riscv,event-to-mhpmcounters =
> +			<0x00003 0x00003 0xfffffff8>,
> +			<0x00004 0x00004 0xfffffff8>,
> +			<0x00005 0x00005 0xfffffff8>,
> +			<0x00006 0x00006 0xfffffff8>,
> +			<0x00007 0x00007 0xfffffff8>,
> +			<0x00008 0x00008 0xfffffff8>,
> +			<0x00009 0x00009 0xfffffff8>,
> +			<0x0000a 0x0000a 0xfffffff8>,
> +			<0x10000 0x10000 0xfffffff8>,
> +			<0x10001 0x10001 0xfffffff8>,
> +			<0x10002 0x10002 0xfffffff8>,
> +			<0x10003 0x10003 0xfffffff8>,
> +			<0x10008 0x10008 0xfffffff8>,
> +			<0x10009 0x10009 0xfffffff8>,
> +			<0x10010 0x10010 0xfffffff8>,
> +			<0x10011 0x10011 0xfffffff8>,
> +			<0x10012 0x10012 0xfffffff8>,
> +			<0x10013 0x10013 0xfffffff8>,
> +			<0x10019 0x10019 0xfffffff8>,
> +			<0x10021 0x10021 0xfffffff8>,
> +			<0x10030 0x10030 0xfffffff8>,
> +			<0x10031 0x10031 0xfffffff8>;
> +		riscv,raw-event-to-mhpmcounters =
> +			<0x00000000 0x00000001 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000002 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000003 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000004 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000005 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000006 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000007 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000008 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000009 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000000a 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000010 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000011 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000012 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000013 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000014 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000015 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000016 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000017 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000018 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000019 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000001a 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000001e 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000020 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000021 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000022 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000023 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000024 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000025 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000026 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000027 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000028 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x00000029 0xffffffff 0xffffffff 0xfffffff8>,
> +			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0xfffffff8>;
> +	};
> +
> 	soc {
> 		intc: interrupt-controller@6d40000000 {
> 			compatible = "sophgo,sg2044-plic", "thead,c900-plic";
> -- 
> 2.50.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
