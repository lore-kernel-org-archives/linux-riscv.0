Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C1C71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 03:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:References:Message-Id:In-Reply-To:
	Mime-Version:Date:Subject:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ciit84oW44utA9qltvxWZI+Yz5NOZjgqDOxPk3/RhO4=; b=uKtgb9nrFA8TmN
	gtJ93Mq9FCBEe2QRGV42W6YtEEDPlNdeezteuTorNCfci2I2nIKuW8gdnU9NoGeP2nhsx1NCtQAuC
	O8RUCoOQcJIE5fK01EhoI1GpMzI7vni1e/+XZtk5r1Fi390w4ak01xWKS1V1AtCKOP0FDhTJkeNCY
	ZhUVKPofH/FACyXF1wP7NmuGRL/4kMZpjC9BnziZr0Xlw6vKvcuuErRZUhSyMduH95xOkBs/H6ysr
	+nL2e4OqhWim503KusXmG7+pJXLi7wrE1V1Y5ap7XwNoKz0zU1sGBEteJQISS6DqyS1q9tS/Bq7Zz
	WV4wuvwwlG5wcH5RyRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyrY-00000004A0n-1hEj;
	Tue, 08 Jul 2025 03:19:20 +0000
Received: from sg-1-30.ptr.blmpb.com ([118.26.132.30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyrU-000000049zP-3qNy
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 03:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1751944747;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=v7xxPby9ALMOMg798Mawic9TVy+9UEXIg4abmY1scKw=;
 b=X+5/RJAwAkw4WhaO4dBSCz+Yhe9csYoar4GpZYx7pqNxYKV0FcKZyiGB0BCYArv3JDZE6I
 9dDmWE0vfvfjiLnvrL+FJcUKLIFGRMmIQ783Pr+Px17P+OaLQVR6opYM+s+xk4Khx3BXmv
 Qqaszg5IUBOo88k3i5T6dKLAN3HZmNZedFYtEZH34F13PgXij8yaqUTlQhomp28HzhplyZ
 eKwKmRp7edxdiKNpQe6R80NSZPYM/W3aka8HMhertiAkZC+YdwBm85ALKfSMGKhAj269jx
 yTUPR3YvQd4xM1uUn2ADsOpMN69XcKBkgztqMZ+WUpK/lHWgcVw1mFX7Z9au1w==
To: "Han Gao" <rabenda.cn@gmail.com>, <devicetree@vger.kernel.org>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, <linux-riscv@lists.infradead.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
Date: Tue, 8 Jul 2025 11:19:01 +0800
Mime-Version: 1.0
In-Reply-To: <915bef0530dee6c8bc0ae473837a4bd6786fa4fb.1751698574.git.rabenda.cn@gmail.com>
Message-Id: <26fdb706-62b0-4726-8d51-c4664b61ee64@lanxincomputing.com>
References: <cover.1751698574.git.rabenda.cn@gmail.com> <915bef0530dee6c8bc0ae473837a4bd6786fa4fb.1751698574.git.rabenda.cn@gmail.com>
X-Lms-Return-Path: <lba+2686c8e29+d51e5b+lists.infradead.org+liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Content-Language: en-US
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 11:19:04 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_201917_972830_694E0913 
X-CRM114-Status: GOOD (  12.18  )
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

On 7/5/2025 3:00 PM, Han Gao wrote:
> The sg2042 SoCs support xtheadvector [1] so it can be included in the
> devicetree. Also include vlenb for the cpu. And set vlenb=16 [2].
>
> This can be tested by passing the "mitigations=off" kernel parameter.
>
> Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-4-236c22791ef9@rivosinc.com/ [1]
> Link: https://lore.kernel.org/linux-riscv/aCO44SAoS2kIP61r@ghost/ [2]
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

> ---
>   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++-------
>   1 file changed, 128 insertions(+), 64 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index b136b6c4128c..dcc984965b6b 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -260,7 +260,8 @@ cpu0: cpu@0 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <0>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -285,7 +286,8 @@ cpu1: cpu@1 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <1>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -310,7 +312,8 @@ cpu2: cpu@2 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <2>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -335,7 +338,8 @@ cpu3: cpu@3 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <3>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -360,7 +364,8 @@ cpu4: cpu@4 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <4>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -385,7 +390,8 @@ cpu5: cpu@5 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <5>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -410,7 +416,8 @@ cpu6: cpu@6 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <6>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -435,7 +442,8 @@ cpu7: cpu@7 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <7>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -460,7 +468,8 @@ cpu8: cpu@8 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <8>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -485,7 +494,8 @@ cpu9: cpu@9 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <9>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -510,7 +520,8 @@ cpu10: cpu@10 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <10>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -535,7 +546,8 @@ cpu11: cpu@11 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <11>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -560,7 +572,8 @@ cpu12: cpu@12 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <12>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -585,7 +598,8 @@ cpu13: cpu@13 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <13>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -610,7 +624,8 @@ cpu14: cpu@14 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <14>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -635,7 +650,8 @@ cpu15: cpu@15 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <15>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -660,7 +676,8 @@ cpu16: cpu@16 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <16>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -685,7 +702,8 @@ cpu17: cpu@17 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <17>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -710,7 +728,8 @@ cpu18: cpu@18 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <18>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -735,7 +754,8 @@ cpu19: cpu@19 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <19>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -760,7 +780,8 @@ cpu20: cpu@20 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <20>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -785,7 +806,8 @@ cpu21: cpu@21 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <21>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -810,7 +832,8 @@ cpu22: cpu@22 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <22>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -835,7 +858,8 @@ cpu23: cpu@23 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <23>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -860,7 +884,8 @@ cpu24: cpu@24 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <24>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -885,7 +910,8 @@ cpu25: cpu@25 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <25>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -910,7 +936,8 @@ cpu26: cpu@26 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <26>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -935,7 +962,8 @@ cpu27: cpu@27 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <27>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -960,7 +988,8 @@ cpu28: cpu@28 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <28>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -985,7 +1014,8 @@ cpu29: cpu@29 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <29>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <30>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <31>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <32>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <33>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <34>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <35>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <36>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <37>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <38>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <39>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <40>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <41>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <42>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <43>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <44>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <45>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <46>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <47>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <48>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <49>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <50>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <51>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <52>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <53>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <54>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <55>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <56>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <57>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <58>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <59>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <60>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <61>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <62>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <16>;
>   			reg = <63>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
