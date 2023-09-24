Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758CFCE7A8A
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B86wCeye4DoVqbfZ4/RGSb8lgzGLXMHUSdjnEMOFZ1o=; b=NQozjgYFYOqvPo
	jWIVWs5oJ9kyeylAvfV1H9C2Bx8FhmfYPZGJel/5ALt59+uO90hbhFtbk3+092EOWvhKkudmsAB3x
	0Py1efsuMEaXgFG+ZFmRzG6ofgJZ5BVgThzNfj44n/vCrZKHvcY8Bk+q4zacXXifQMtis0WDQP8GN
	Sss9GjOo8rFZGI7TZiTZPTnzPGnflRifS5dgbqmefg1cwDctjKwObbwLGSNbaNktAczeAr++tJdRc
	oz90KB472Zaj9yuFQNl3nnZZUj72xka/O/VJXRRB49PfnZ85Nt5dSS7jh9NuIwLFevBVYzz8OmVS5
	xVLe/PdFqNfkw0BVXscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkVQS-00Clyf-1q;
	Sun, 24 Sep 2023 20:09:56 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkVQO-00Clxs-2j;
	Sun, 24 Sep 2023 20:09:54 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a9cd066db5so677600266b.0;
        Sun, 24 Sep 2023 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695586191; x=1696190991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxREjewkNFrWDAgPsnTZpMxgPvvi0KDP02tpQh/XKD0=;
        b=WLnfPO0E+of001AInFntgu+1OQX96upomBJJ0xlNJExSsFn8oyH1SVxtvRKpbNLCOE
         EtFBsvry2NgmwTJxRsdqiIDjkecWGkzChs11USqOnNyiwlCVgItU3Cjewwbxah9rMkJ9
         spJIq9iW1IPGVCNNGw6vCtBQeelH5+pfD9HMM2FBI6QKKHzIjxPkyzlrPaJbrIO7kTMa
         Rd0WTX+PugmssBIV8FtOh3s7twmpBmb5KV6DmNFWTQyUwJ43sHNMzeVi81qq9l3gXefx
         c+jIMPhHnn6ZJzCbZ6Bauv/DTmGQFcGbt31onQoaWyu4z04pJpwirg9ibkOIcr3ozd3V
         adXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695586191; x=1696190991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxREjewkNFrWDAgPsnTZpMxgPvvi0KDP02tpQh/XKD0=;
        b=qeQhhARON+PKusCyORAdifCiI9qejIangHbleCniWsohcIQDWkfIRVW1pJ7QhrQrg5
         D0i47BpPl2wNExzKQPIg4IbS8R7hId0HCs237SwgMqayYN4cv3McsL/XCLoA+86+lRIt
         DJkKIXSDyIrxk/SyfUCLBGOZo+bKyyE2nCJnvuV37SkIqpNvDu6wbsM0z8bFuOkB8Fxm
         IKOtX3gpO5sx8tt0fHIy31ni1mlFrdujtKlbDS/QSGfrEvbdG8SpRP21xiAgVTDe42/z
         +7A4FXwve5OaFCrLFUfAKF5sVeJ4N9H6eZ8+wzZw+dhNizdggRiL8GCNn+tqAUtdN2i7
         /Njw==
X-Gm-Message-State: AOJu0YwvPOkYPF4COEF8OfsIIU9cEQO2t+9Fkn5AgB5spxiO+wBQkz3a
	L47UkVYVYvArkujQZ6YnM8k=
X-Google-Smtp-Source: AGHT+IFacAw8IlUF7W7gT0BHUL/iwLFqkcmREgIzUohJpb5r19xZXpCugD8qQ2/zyVfpFPTyuLkyFg==
X-Received: by 2002:a17:907:7818:b0:9ae:654d:5105 with SMTP id la24-20020a170907781800b009ae654d5105mr4480937ejc.47.1695586190881;
        Sun, 24 Sep 2023 13:09:50 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id la9-20020a170906ad8900b0098f33157e7dsm5342713ejb.82.2023.09.24.13.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 13:09:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Inochi Amaoto <inochiama@outlook.com>, Heiko Stuebner <heiko@sntech.de>,
 Wei Fu <wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>,
 Wenhan Chen <chenwenhan.cwh@alibaba-inc.com>, Guo Ren <guoren@kernel.org>,
 Inochi Amaoto <inochiama@outlook.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: allwinner: d1: Add PMU event node
Date: Sun, 24 Sep 2023 22:09:49 +0200
Message-ID: <1770354.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_130952_926114_18216054 
X-CRM114-Status: GOOD (  20.04  )
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

Dne ponedeljek, 28. avgust 2023 ob 06:30:22 CEST je Inochi Amaoto napisal(a):
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> Link: https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v#L657

Applied, thanks!

Best regards,
Jernej

> ---
> changed from v3:
> 1. remove wrong event mapping of 0x0000a
> 2. add reference url of c906 events implementation (D1 only support events
> described in R1S0 user manual, but event mapping is the same)
> 
> changed from v2:
> 1. move pmu node from /soc to / to avoid warnings when checking.
> 
> The meaning of T-HEAD events can be found in this pending patch:
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C21777BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com
> 
> The patch above also provides a example that shows how to setup
> environment and use perf with T-HEAD events.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..53a984d78e3f 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -73,4 +73,43 @@ plic: interrupt-controller@10000000 {
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	pmu {
> +		compatible = "riscv,pmu";
> +		riscv,event-to-mhpmcounters =
> +			<0x00003 0x00003 0x00000008>,
> +			<0x00004 0x00004 0x00000010>,
> +			<0x00005 0x00005 0x00000200>,
> +			<0x00006 0x00006 0x00000100>,
> +			<0x10000 0x10000 0x00004000>,
> +			<0x10001 0x10001 0x00008000>,
> +			<0x10002 0x10002 0x00010000>,
> +			<0x10003 0x10003 0x00020000>,
> +			<0x10019 0x10019 0x00000040>,
> +			<0x10021 0x10021 0x00000020>;
> +		riscv,event-to-mhpmevent =
> +			<0x00003 0x00000000 0x00000001>,
> +			<0x00004 0x00000000 0x00000002>,
> +			<0x00005 0x00000000 0x00000007>,
> +			<0x00006 0x00000000 0x00000006>,
> +			<0x10000 0x00000000 0x0000000c>,
> +			<0x10001 0x00000000 0x0000000d>,
> +			<0x10002 0x00000000 0x0000000e>,
> +			<0x10003 0x00000000 0x0000000f>,
> +			<0x10019 0x00000000 0x00000004>,
> +			<0x10021 0x00000000 0x00000003>;
> +		riscv,raw-event-to-mhpmcounters =
> +			<0x00000000 0x00000001 0xffffffff 0xffffffff 0x00000008>,
> +			<0x00000000 0x00000002 0xffffffff 0xffffffff 0x00000010>,
> +			<0x00000000 0x00000003 0xffffffff 0xffffffff 0x00000020>,
> +			<0x00000000 0x00000004 0xffffffff 0xffffffff 0x00000040>,
> +			<0x00000000 0x00000005 0xffffffff 0xffffffff 0x00000080>,
> +			<0x00000000 0x00000006 0xffffffff 0xffffffff 0x00000100>,
> +			<0x00000000 0x00000007 0xffffffff 0xffffffff 0x00000200>,
> +			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x00002000>,
> +			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x00004000>,
> +			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x00008000>,
> +			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
> +			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
> +	};
>  };
> --
> 2.42.0
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
