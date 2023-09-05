Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390F7CA100D
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 20:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFbKu4/P1W+muRhRRkbWAxDxSy10ksnzo/xDIC7M21g=; b=N833iKGNdHX0VH
	jfyjA8BfPvRl7VzH3UbQQVmYxbQ/4//Mhf1nDJlMJtzNxd37OsObNhWCoTGZxlmXhS3VsA+a0CPvs
	yxjFU7ZbN73t3GayX8zPCNx3AE+ZUvu6z2kGPV3DrUvCBxUEauE+7HUdUSuqM4MBEv2z6pUzI2poG
	/SZKEz04LXJSPke3oMiCjpvoOZJfxpsdjgWvr23ZacP51w2XYswRYE1UHKN56HdV5E8zGydsBS1fy
	4m3rbPkD7JrycZYuVYrx4804qILGLUgS0kcEf1VxmkCzmnF4lNryNu9/+tBTUOk3ciCTNTESo93/W
	N/OJsEoGQCE/s7x7Rkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdchr-006gqD-0I;
	Tue, 05 Sep 2023 20:31:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdchn-006gpY-3B;
	Tue, 05 Sep 2023 20:31:25 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a5e37a39ecso415326866b.3;
        Tue, 05 Sep 2023 13:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693945881; x=1694550681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgTzGf3A5ABFaOAKIOcvbbSGQ+ICpNJmns+q5eLD6Uw=;
        b=IrvhJ8L1bC9bwdcEwh2o3PkxHxhIknxcspjKiQqJCae1a0bz1IwYZFriM6f9CXb5hx
         oII0lrCEXKuUKRLHgfzQwry/HRDgw0QHM4FCPlphWX3uIBweexJs9qKnaI9QwnKjCLca
         HeSaGBuxzrU9WeVAeb9yb8HmM6NCMnF3TdMag9dO515FOtxGAK0guVmlFYOLkNMwvWo8
         p+TzdyFkGoJFqLroaYD96z4ljLE/8bYTauxPlIqX0qUQb3pEOAL3pV0Md9E/7u/4Fjjp
         f+1y01QA1owB4SFFZ2/5T3N938pMGVVTAK/7W8XctljwNE4L62281yZ3+44BiqoaSj6h
         FuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945881; x=1694550681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgTzGf3A5ABFaOAKIOcvbbSGQ+ICpNJmns+q5eLD6Uw=;
        b=UQa766hS2alSrQjHKkJ0N4uzUhxNvKYedKhka32Mj91ILTgeN6GMTbxsYlLiYM3FpS
         TYyTh3mZp1s8FsuowFX5YBTU+XzgqSys5D6+rZNpdprWyAyhDA5LWH7S/0tQxjdmFxc2
         f6or/dSYkDLUnARA2vh48pMpkr5nJkcFOvn5VWt/geHXsf9fsn9GqbXXvGFkieiZpD7b
         1/zLKeHmqL4BzaQO007rKmctivPSUkMjytqpF99GHvAImOZbUnB/FTTOQm/xzA+Ub7AX
         eiqxMXn23YqIJBVHR2Xyrs2lsFC5owv+mpmFNOiQtiejyYCK1PWmc+WgGtYMRKh00hbj
         BYbQ==
X-Gm-Message-State: AOJu0Yw99EdyjTaJMitwrYHe4kpZDzL71oZGKPQ7zqg4wsPaX7D2Sd7O
	RhEOFG4yLpppB04O2GCL7hg=
X-Google-Smtp-Source: AGHT+IE8Ds1Fhnf96UooRYa+B+2f6mBXEO1bpMNk1UHPXQ808A78VR9ByCkJN3v1B2Gy1JkrO34TRA==
X-Received: by 2002:a17:906:214:b0:9a1:ce57:8e47 with SMTP id 20-20020a170906021400b009a1ce578e47mr665120ejd.68.1693945881305;
        Tue, 05 Sep 2023 13:31:21 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id a25-20020a1709064a5900b0099bd8c1f67esm8124988ejv.109.2023.09.05.13.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:31:20 -0700 (PDT)
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
Date: Tue, 05 Sep 2023 22:31:19 +0200
Message-ID: <3760158.kQq0lBPeGt@archlinux>
In-Reply-To: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_133124_045188_777AA067 
X-CRM114-Status: GOOD (  20.76  )
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

On Monday, August 28, 2023 6:30:22 AM CEST Inochi Amaoto wrote:
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> Link:
> https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/
> pmu/rtl/aq_hpcp_top.v#L657 

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

What's the status of dependencies? Are they merged?

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
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C21777BB
> E2A@IA1PR20MB4953.namprd20.prod.outlook.com
> 
> The patch above also provides a example that shows how to setup
> environment and use perf with T-HEAD events.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi index
> 8275630af977..53a984d78e3f 100644
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
> +			<0x00000000 0x00000001 0xffffffff 0xffffffff 
0x00000008>,
> +			<0x00000000 0x00000002 0xffffffff 0xffffffff 
0x00000010>,
> +			<0x00000000 0x00000003 0xffffffff 0xffffffff 
0x00000020>,
> +			<0x00000000 0x00000004 0xffffffff 0xffffffff 
0x00000040>,
> +			<0x00000000 0x00000005 0xffffffff 0xffffffff 
0x00000080>,
> +			<0x00000000 0x00000006 0xffffffff 0xffffffff 
0x00000100>,
> +			<0x00000000 0x00000007 0xffffffff 0xffffffff 
0x00000200>,
> +			<0x00000000 0x0000000b 0xffffffff 0xffffffff 
0x00002000>,
> +			<0x00000000 0x0000000c 0xffffffff 0xffffffff 
0x00004000>,
> +			<0x00000000 0x0000000d 0xffffffff 0xffffffff 
0x00008000>,
> +			<0x00000000 0x0000000e 0xffffffff 0xffffffff 
0x00010000>,
> +			<0x00000000 0x0000000f 0xffffffff 0xffffffff 
0x00020000>;
> +	};
>  };
> --
> 2.42.0





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
