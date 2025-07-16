Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6466CC83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKp7BgwohPhkF6tGwg9HSMJhDvNgnJp5XrGYMOU5bbA=; b=02m1gIQk+g4kyn
	6o0XATb/GmSRmgc3JDNSPKSGBk7GwHf0Z9KXZ6DJrrfSAMMAQkaSg6YfKEQwbg0WG2a9+gAv01KAs
	hDYLNIWFfNBgpUZrytij/YdFml5XnBsip6j2MYKjzAqCShoKwFRjP49KP6WxbgWG5UsFF6S6M31OD
	HSyqJdzFXAPXOjGMLfJL3p1BWozfytewlQL+vwkLxpZjIgYbT2HVHUmsHdap5tjWdgSjo3W+P2wUD
	8VMWwsdVSPiI3nCVS8YiSFPWH5QqCY5pde7ovPP3pW4kJXioyXqctlL31s/4Ln0X3XDES06oENvVQ
	SzifaZZSlOX8Unxi7m2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2NP-00000007od7-13tP;
	Wed, 16 Jul 2025 13:40:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2NN-00000007ocn-0okM
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 13:40:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D0A743A05;
	Wed, 16 Jul 2025 13:40:37 +0000 (UTC)
Message-ID: <8865f36d-c8a9-454b-aa55-741a82ca96b4@ghiti.fr>
Date: Wed, 16 Jul 2025 15:40:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] raid6: riscv: replace one load with a move to
 speed up the caculation
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
 <20250711100930.3398336-3-zhangchunyan@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250711100930.3398336-3-zhangchunyan@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepiihhrghnghgthhhunhihrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtr
 dgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihukhhurghifeeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_064049_371532_DEB8B3F2 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 7/11/25 12:09, Chunyan Zhang wrote:
> Since wp$$==wq$$, it doesn't need to load the same data twice, use move
> instruction to replace one of the loads to let the program run faster.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   lib/raid6/rvv.c | 60 ++++++++++++++++++++++++-------------------------
>   1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index b193ea176d5d..89da5fc247aa 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -44,7 +44,7 @@ static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE])
> @@ -117,7 +117,7 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE])
> @@ -218,9 +218,9 @@ static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      "vle8.v	v4, (%[wp1])\n"
> -			      "vle8.v	v5, (%[wp1])\n"
> +			      "vmv.v.v	v5, v4\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> @@ -310,9 +310,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      "vle8.v	v4, (%[wp1])\n"
> -			      "vle8.v	v5, (%[wp1])\n"
> +			      "vmv.v.v	v5, v4\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> @@ -440,13 +440,13 @@ static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      "vle8.v	v4, (%[wp1])\n"
> -			      "vle8.v	v5, (%[wp1])\n"
> +			      "vmv.v.v	v5, v4\n"
>   			      "vle8.v	v8, (%[wp2])\n"
> -			      "vle8.v	v9, (%[wp2])\n"
> +			      "vmv.v.v	v9, v8\n"
>   			      "vle8.v	v12, (%[wp3])\n"
> -			      "vle8.v	v13, (%[wp3])\n"
> +			      "vmv.v.v	v13, v12\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> @@ -566,13 +566,13 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      "vle8.v	v4, (%[wp1])\n"
> -			      "vle8.v	v5, (%[wp1])\n"
> +			      "vmv.v.v	v5, v4\n"
>   			      "vle8.v	v8, (%[wp2])\n"
> -			      "vle8.v	v9, (%[wp2])\n"
> +			      "vmv.v.v	v9, v8\n"
>   			      "vle8.v	v12, (%[wp3])\n"
> -			      "vle8.v	v13, (%[wp3])\n"
> +			      "vmv.v.v	v13, v12\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> @@ -754,21 +754,21 @@ static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      "vle8.v	v4, (%[wp1])\n"
> -			      "vle8.v	v5, (%[wp1])\n"
> +			      "vmv.v.v	v5, v4\n"
>   			      "vle8.v	v8, (%[wp2])\n"
> -			      "vle8.v	v9, (%[wp2])\n"
> +			      "vmv.v.v	v9, v8\n"
>   			      "vle8.v	v12, (%[wp3])\n"
> -			      "vle8.v	v13, (%[wp3])\n"
> +			      "vmv.v.v	v13, v12\n"
>   			      "vle8.v	v16, (%[wp4])\n"
> -			      "vle8.v	v17, (%[wp4])\n"
> +			      "vmv.v.v	v17, v16\n"
>   			      "vle8.v	v20, (%[wp5])\n"
> -			      "vle8.v	v21, (%[wp5])\n"
> +			      "vmv.v.v	v21, v20\n"
>   			      "vle8.v	v24, (%[wp6])\n"
> -			      "vle8.v	v25, (%[wp6])\n"
> +			      "vmv.v.v	v25, v24\n"
>   			      "vle8.v	v28, (%[wp7])\n"
> -			      "vle8.v	v29, (%[wp7])\n"
> +			      "vmv.v.v	v29, v28\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> @@ -948,21 +948,21 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
>   		asm volatile (".option	push\n"
>   			      ".option	arch,+v\n"
>   			      "vle8.v	v0, (%[wp0])\n"
> -			      "vle8.v	v1, (%[wp0])\n"
> +			      "vmv.v.v	v1, v0\n"
>   			      "vle8.v	v4, (%[wp1])\n"
> -			      "vle8.v	v5, (%[wp1])\n"
> +			      "vmv.v.v	v5, v4\n"
>   			      "vle8.v	v8, (%[wp2])\n"
> -			      "vle8.v	v9, (%[wp2])\n"
> +			      "vmv.v.v	v9, v8\n"
>   			      "vle8.v	v12, (%[wp3])\n"
> -			      "vle8.v	v13, (%[wp3])\n"
> +			      "vmv.v.v	v13, v12\n"
>   			      "vle8.v	v16, (%[wp4])\n"
> -			      "vle8.v	v17, (%[wp4])\n"
> +			      "vmv.v.v	v17, v16\n"
>   			      "vle8.v	v20, (%[wp5])\n"
> -			      "vle8.v	v21, (%[wp5])\n"
> +			      "vmv.v.v	v21, v20\n"
>   			      "vle8.v	v24, (%[wp6])\n"
> -			      "vle8.v	v25, (%[wp6])\n"
> +			      "vmv.v.v	v25, v24\n"
>   			      "vle8.v	v28, (%[wp7])\n"
> -			      "vle8.v	v29, (%[wp7])\n"
> +			      "vmv.v.v	v29, v28\n"
>   			      ".option	pop\n"
>   			      : :
>   			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),


Out of curiosity, did you notice a gain?

Anyway:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
