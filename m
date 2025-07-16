Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F50C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0H/QH9U3Pd0dEQUwTllrnSjLalKR3Dgyx0IBM2B688Y=; b=Jd+X8yFF5Cga9c
	utwoQcYiMppMy++N2C8d+NncLdExCg+W1pHkhRZe2bh9dx0EaynFMA/NYf3zepjGkh847I8eWv16z
	P0n7zr9QKqxUsyY7+dMDBMqDQ+Rs3ZQT6dEZnec0S3ls/+/5yFjWBm+Fk242Ghk0V7hqTVRSnWjdE
	vPAI2h5goLnIX/R71vk/jGUbysKAM7tRUEPKTxrqkMXtLpeYD7iiNHm3cyCeCwALyVSWmwWxxMBq2
	NASW+OrUqLvQRpGx0U8H8zTJAvCh5YvJboaI8YgrEfLWvGQ3eA4w7364owYkHMDIpOWZD2tBNDAg0
	FDcc4lmaXjZS85bRUJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2QW-00000007p1h-1LtG;
	Wed, 16 Jul 2025 13:44:04 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2QU-00000007p1G-02Q6
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 13:44:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1196C4395C;
	Wed, 16 Jul 2025 13:43:56 +0000 (UTC)
Message-ID: <69e3f295-3b43-4a13-bb84-3f9a89171331@ghiti.fr>
Date: Wed, 16 Jul 2025 15:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/5] raid6: riscv: Add a compiler error
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
 <20250711100930.3398336-4-zhangchunyan@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250711100930.3398336-4-zhangchunyan@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemleehtdgumehftgegieemjeejlegvmedvfhgvfegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepiihhrghnghgthhhunhihrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtr
 dgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihukhhurghifeeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_064402_182417_98301273 
X-CRM114-Status: GOOD (  13.66  )
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

First, the patch title should be something like:

"raid6: riscv: Prevent compiler with vector support to build already 
vectorized code"

Or something similar.

On 7/11/25 12:09, Chunyan Zhang wrote:
> The code like "u8 **dptr = (u8 **)ptrs" just won't work when built with


Why wouldn't this code ^ work?

I guess preventing the compiler to vectorize the code is to avoid the 
inline assembly code to break what the compiler could have vectorized no?


> a compiler that can use vector instructions. So add an error for that.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   lib/raid6/rvv.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index 89da5fc247aa..015f3ee4da25 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -20,6 +20,10 @@ static int rvv_has_vector(void)
>   	return has_vector();
>   }
>   
> +#ifdef __riscv_vector
> +#error "This code must be built without compiler support for vector"
> +#endif
> +
>   static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>   {
>   	u8 **dptr = (u8 **)ptrs;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
