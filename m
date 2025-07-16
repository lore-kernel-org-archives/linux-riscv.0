Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F2C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLnxE6GlscYNC+aJsIOrHJo5VCepDcqAD/dWAHJuo5s=; b=m06saRKYxJh5bO
	g3uy6aVT+KTQ5C+0Zz3cBmOKx5j74/auRGhQyLsSAc58jeD9AaaeYV9kQHjFRE7jWBbTy5IBZCCKw
	df583a2xZrGBXqcK1Ali6rUI4yc73dp8C8Gh1cuM5NYPYm7VQTTHum+65qa+3SWtXbaWbSl0GpzLD
	0/JBgG/poQEjTC5hanRSYgBrHtVFEWJ8jhn0Da9EU0lHdihK1eEYSHucTK3zwtXlbmYRGf1aMV0WD
	uYrZjK1Rm7pbTRFCb0g6srQgTg5/winxs5RW+bouMPS4yHIJdXAy1pmRr40wD1x9AoAaVRlnkocFH
	UwTbql/X311ZsndF993g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Ks-00000007oJD-22sT;
	Wed, 16 Jul 2025 13:38:14 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Kp-00000007oIt-3Hxq
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 13:38:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A289442A2;
	Wed, 16 Jul 2025 13:38:05 +0000 (UTC)
Message-ID: <48bde792-ef10-4da4-a378-f884022660bf@ghiti.fr>
Date: Wed, 16 Jul 2025 15:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/5] raid6: riscv: Clean up unused header file
 inclusion
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
 <20250711100930.3398336-2-zhangchunyan@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250711100930.3398336-2-zhangchunyan@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepiihhrghnghgthhhunhihrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtr
 dgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihukhhurghifeeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_063811_957367_C4B38F0E 
X-CRM114-Status: UNSURE (   9.98  )
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

Hi Chunyan,

On 7/11/25 12:09, Chunyan Zhang wrote:
> These two C files don't reference things defined in simd.h or types.h
> so remove these redundant #inclusions.
>
> Fixes: 6093faaf9593 ("raid6: Add RISC-V SIMD syndrome and recovery calculations")
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   lib/raid6/recov_rvv.c | 2 --
>   lib/raid6/rvv.c       | 3 ---
>   2 files changed, 5 deletions(-)
>
> diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
> index f29303795ccf..500da521a806 100644
> --- a/lib/raid6/recov_rvv.c
> +++ b/lib/raid6/recov_rvv.c
> @@ -4,9 +4,7 @@
>    * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>    */
>   
> -#include <asm/simd.h>
>   #include <asm/vector.h>
> -#include <crypto/internal/simd.h>
>   #include <linux/raid/pq.h>
>   
>   static int rvv_has_vector(void)
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index 7d82efa5b14f..b193ea176d5d 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -9,11 +9,8 @@
>    *	Copyright 2002-2004 H. Peter Anvin
>    */
>   
> -#include <asm/simd.h>
>   #include <asm/vector.h>
> -#include <crypto/internal/simd.h>
>   #include <linux/raid/pq.h>
> -#include <linux/types.h>
>   #include "rvv.h"
>   
>   #define NSIZE	(riscv_v_vsize / 32) /* NSIZE = vlenb */


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
