Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F7CC83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzlp635jogCO2owciYielKTy1EZPi/CWtE6xQ6rVx0Q=; b=qJ2V4J97KJS+i2
	+bnhzSYxr7lIi+wWnXmrIt7CXFHVi5UcxkVEPYj4uc5WybIzj9iRZLW2PY8xmEGErQHu74ozRO/jw
	iBjGnWsSC6+xSKNnd2M4uNrY1ynpUp5OdBeJD3K4uY2S1eUioB19SAVreJneGd5SBmhNR0Lbrjv+z
	RL5Sem/KhyPJubZWBoIN0TakbedhTxjKbkfuBx0uNj7+LXYNoJSK7/Il1hrJ4Npvu+ZpRQmcNJPFC
	5TcCto4CqlJUawsoT75L72gj/+PmsCzIZpOQK+NujIuFAOConuxGF987VP1bs/I0yYSm9NcTVrOCb
	84QBrRS3PKjPXY/xGqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclls-0000000Clo3-17NR;
	Fri, 18 Jul 2025 14:09:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucllo-0000000ClnP-3kRg
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 14:09:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B700B43A0D;
	Fri, 18 Jul 2025 14:08:58 +0000 (UTC)
Message-ID: <00a97b26-0269-4c07-99b9-33bb759067f5@ghiti.fr>
Date: Fri, 18 Jul 2025 16:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] raid6: test: Add support for RISC-V
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
 <20250718072711.3865118-6-zhangchunyan@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250718072711.3865118-6-zhangchunyan@iscas.ac.cn>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfedtfhgtmeegtdejtgemieehgehfmeefvdhfleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfedtfhgtmeegtdejtgemieehgehfmeefvdhfledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfedtfhgtmeegtdejtgemieehgehfmeefvdhflegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepiihhrghnghgthhhunhihrghnsehishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtr
 dgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihukhhurghifeeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_070905_068095_2BD414DF 
X-CRM114-Status: GOOD (  11.92  )
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

On 7/18/25 09:27, Chunyan Zhang wrote:
> From: Chunyan Zhang <zhang.lyra@gmail.com>
>
> Add RISC-V code to be compiled to allow the userspace raid6test program
> to be built and run on RISC-V.
>
> Signed-off-by: Chunyan Zhang <zhang.lyra@gmail.com>
> ---
>   lib/raid6/test/Makefile | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
> index 8f2dd2210ba8..09bbe2b14cce 100644
> --- a/lib/raid6/test/Makefile
> +++ b/lib/raid6/test/Makefile
> @@ -35,6 +35,11 @@ ifeq ($(ARCH),aarch64)
>           HAS_NEON = yes
>   endif
>   
> +ifeq ($(findstring riscv,$(ARCH)),riscv)
> +        CFLAGS += -I../../../arch/riscv/include -DCONFIG_RISCV=1
> +        HAS_RVV = yes
> +endif
> +
>   ifeq ($(findstring ppc,$(ARCH)),ppc)
>           CFLAGS += -I../../../arch/powerpc/include
>           HAS_ALTIVEC := $(shell printf '$(pound)include <altivec.h>\nvector int a;\n' |\
> @@ -63,6 +68,9 @@ else ifeq ($(HAS_ALTIVEC),yes)
>                   vpermxor1.o vpermxor2.o vpermxor4.o vpermxor8.o
>   else ifeq ($(ARCH),loongarch64)
>           OBJS += loongarch_simd.o recov_loongarch_simd.o
> +else ifeq ($(HAS_RVV),yes)
> +        OBJS   += rvv.o recov_rvv.o
> +        CFLAGS += -DCONFIG_RISCV_ISA_V=1
>   endif
>   
>   .c.o:


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for the new version, I'll take that for 6.17,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
