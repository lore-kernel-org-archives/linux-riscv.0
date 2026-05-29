Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD212CD5BD1
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 03:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HY+g/UAzOZ9SHyYNo1W/x8GJ+n/eSupNaLZamtcqZLg=; b=LJpjkK4ClE6afN
	7IiHwFL8XXAQZeFXcF1qQhqmlntp8+sMXOkmNHHHoUJdC3Y0v+5QH8xdvKENoVY9E7AmFoF1Pr1w7
	RzCZNg3SKRPhyryBjYXjGYmoKW3aCztTaf23LPI+DpxFJTR+kOwlBVqZ+jfUmsHKHGqozTLZfVDfv
	4m/bStLDduAojlsdMGSeS/DwYSotgqPiXL7Q1+cFM6/9XeiFtKrxlsJDDu1X7spo9osKO2iXu2i4U
	59q7UlI33vWeNQL3s+FO+eidfcZKvuZtmjzRuhoGP1336ynIkbfImGHYYAjLsOJzopAFu4kI+f1EC
	EM+03723d0bbv/fI+w+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSng7-00000006gBP-2Va3;
	Fri, 29 May 2026 03:14:31 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSng4-00000006gAj-1he2
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 03:14:30 +0000
Received: from [10.213.6.54] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAB3XON4BBlqAXjOEg--.479S2;
	Fri, 29 May 2026 11:14:00 +0800 (CST)
Message-ID: <302dfaf7-4a38-408f-997e-68ed27de2341@iscas.ac.cn>
Date: Fri, 29 May 2026 11:14:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: cpufeature: Add Zic64b ISA extension support
To: Qingwei Hu <qingwei.hu@bytedance.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
 Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Hui Wang <hui.wang@canonical.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>, Guodong Xu <guodong@riscstar.com>
References: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
X-CM-TRANSID: rQCowAB3XON4BBlqAXjOEg--.479S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW8tr4kXw1kJry5WrW3Jrb_yoW5trWkpr
	Z3Crs5Cr45X34fuwnFyrWkWr1rXw4UK395Kw18W34rJFy2yrWxWr1vya43Cw4DJa40qr1Y
	9a1Fgr4fZ3yUC37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5qeHPUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_201428_817898_2FDBD9B6 
X-CRM114-Status: GOOD (  20.93  )
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

On 5/28/26 22:16, Qingwei Hu wrote:
> Zic64b describes a platform with 64-byte cache block sizes. It is a
> mandatory part of RVA23U64, but a system may provide 64-byte CMO block
> sizes without satisfying all profile requirements.
>
> The ISA string parser currently ignores Zic64b because the extension is
> not present in the cpufeature table. Add an ISA extension ID and table
> entry for Zic64b so it can be reported in /proc/cpuinfo when firmware
> advertises it.

I'd like to understand: What is the motivation to doing this, given that
the very same information is already available as riscv,cbo*-block-size
and hwprobe?

> Validate the entry against the CBO block sizes discovered from firmware.
> Only check CBO block sizes that are present, since Zic64b constrains
> implemented CBO extensions to use 64-byte blocks but does not require all
> CBO extensions to exist.
>
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  arch/riscv/include/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 7ef8e5f55c8d..b17cae75c295 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -112,6 +112,7 @@
>  #define RISCV_ISA_EXT_ZCLSD		103
>  #define RISCV_ISA_EXT_ZICFILP		104
>  #define RISCV_ISA_EXT_ZICFISS		105
> +#define RISCV_ISA_EXT_ZIC64B		106
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index f46aa5602d74..510ea6aa66ae 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -136,6 +136,19 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
>  	return 0;
>  }
>  
> +static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
> +				     const unsigned long *isa_bitmap)
> +{
> +	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
> +	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
> +	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
> +		pr_err("Zic64b detected in ISA string, disabling as a present CBO block size is not 64 bytes\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
>  				const unsigned long *isa_bitmap)
>  {
> @@ -499,6 +512,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),

If an extension is what we want to go with, then
Documentation/devicetree/bindings/riscv/extensions.yaml also needs
updating to match.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
