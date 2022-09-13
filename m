Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB17EC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DmrWnZ+UU7x9p9gh3h9YqTjb5G/rFuB2TRmqOM7W244=; b=YO/bplYC0JEeYRvb25yhuBogsp
	xgN5bLYTuvKLB21OOt0NUTa9ga2ttDxSDwe1V+EyStGk/8ZsYue/3V9nB3JL9UOq2WZ97g/ICeV4u
	jyiNmnEGfwWw53ZKN2rYmk1dISoNbP1UTYecplbcBNOFj84FHtLrFvrAFTn+kkIpMVyUOVj32BmjH
	fQwPLpM846FixV5lLpH9zFgSa64fIoLKzou7fPhkpE24xGKEnFmgq2YlbXKezUVi4GrM9oIOiMJzn
	2el3bZ8FngE/QFBQPVr1jp9yaA4AKFmymCMhZPhQV9ZrUrkloD+lseqJprl0l3ECbdvIxCXVbiRIO
	S3d0tMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3vS-0081qi-JJ; Tue, 13 Sep 2022 11:17:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3vO-0081Pj-A2
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 11:17:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id c2so11486035plo.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=C/+G5dQIx4kTVg0j6GrOWzwaZxaPXzGpPc5JIVptdz8=;
        b=iK8bVfjbTJRxm9QuQYo45CMXd8mMSO1TzZbZTdlYfGqtNca/McckN+iFozGRgskvc5
         SrkR5MfBRo6zf56E3t6RHPznd0iGoF0QqARAnkey2CNl7nivK+yeMoy29WZLUkSSKyO8
         RSyF9FoMgNnR3viueo+jCCNlJbI1YMOtuqjqPWiffIBfv9QYeBs1EzhJnmAZfdFiF2fJ
         tJ/jLU7mIiEUuwoZslFLWejd8P9W2klmfyTFhdBh5SoMx+rqsVOnrKAxZYhvuJvqW3d/
         5mfZZ0/bs3pG2IDNH6d3jRqFahDma90yvCbmMrBsZEapsTTir9h8Wg40qwB4PJz91mZP
         fIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=C/+G5dQIx4kTVg0j6GrOWzwaZxaPXzGpPc5JIVptdz8=;
        b=qfGko14xy1yiE7Xd+4/nYOGosekShcc5IM0yPqdJ1PWGTaSq3I5aPVkhBjsQIt+vRO
         x8Ej3kN8IWbNbwjKA2Mxu7l7hL8/jQQzZZwIFHGv2uN4+bXTvvTCPtU/HvjI5MBAiGkW
         +3iV5I1ePzyezk1JIagSbmVZf88TuWw+kpdhJOBZ+DOYtTCTkBxopVIeoWtQzu4bs13H
         hCBdCGzOvAl+lvSw7HTXF10KzGmFJ41Krot8WdJsdP97IhR4sCcjNrU3Wuw57bu+A9XT
         ntX3Ahj9EI2Brj6iAq+235Itp8JYi3EoUay7NYSqZdFnvYeg2MqB4WchyQHg+OZX9a+Q
         BRDw==
X-Gm-Message-State: ACgBeo0wSfKPFLXMTsyzFq4p/WJgdao7cFSRwCDXQCZULJwuP97tbR4M
	E5HaiIVoJHN1xXhdeAp58ulgGw==
X-Google-Smtp-Source: AA6agR4CZ3zGEyQYswTvvzdyV0E7DKCMjCk2JlJw0ZN0gs7VE4u3ZOXADy/XvXGgn+JXpLrFX8ZLSQ==
X-Received: by 2002:a17:902:7b8b:b0:170:c7fc:388a with SMTP id w11-20020a1709027b8b00b00170c7fc388amr2409619pll.29.1663067870216;
        Tue, 13 Sep 2022 04:17:50 -0700 (PDT)
Received: from localhost ([185.122.133.20])
        by smtp.gmail.com with ESMTPSA id q5-20020a63e205000000b00434760ee36asm7278389pgh.16.2022.09.13.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 04:17:49 -0700 (PDT)
Date: Tue, 13 Sep 2022 04:17:49 -0700 (PDT)
X-Google-Original-Date: Tue, 13 Sep 2022 04:17:45 PDT (-0700)
Subject: Re: [PATCH v4] RISC-V: Clean up the Zicbom block size probing
In-Reply-To: <YyBQASDHnbEd6aMq@dev-arch.thelio-3990X>
CC: mail@conchuod.ie, atishp@atishpatra.org, ajones@ventanamicro.com,
  anup@brainfault.org, conor.dooley@microchip.com, heiko@sntech.de, jrtc27@jrtc27.com,
  linux-riscv@lists.infradead.org, lkp@intel.com, mchitale@ventanamicro.com, stable@vger.kernel.org,
  Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: nathan@kernel.org
Message-ID: <mhng-d301ef20-cef6-4b10-af21-532227c6f0c7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_041754_567197_4802ACF8 
X-CRM114-Status: GOOD (  28.82  )
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

On Tue, 13 Sep 2022 02:40:17 PDT (-0700), nathan@kernel.org wrote:
> On Mon, Sep 12, 2022 at 11:48:01PM +0100, Conor Dooley wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> This fixes two issues: I truncated the warning's hart ID when porting to
>> the 64-bit hart ID code, and the original code's warning handling could
>> fire on an uninitialized hart ID.
>>
>> The biggest change here is that riscv_cbom_block_size is no longer
>> initialized, as IMO the default isn't sane: there's nothing in the ISA
>> that mandates any specific cache block size, so falling back to one will
>> just silently produce the wrong answer on some systems.  This also
>> changes the probing order so the cache block size is known before
>> enabling Zicbom support.
>>
>> CC: stable@vger.kernel.org
>> CC: Andrew Jones <ajones@ventanamicro.com>
>> CC: Heiko Stuebner <heiko@sntech.de>
>> CC: Atish Patra <atishp@rivosinc.com>
>> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
>> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> [Conor: fixed the redefinition errors]
>> Tested-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> Build-tested-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks a lot for continuing to chase this!

Ya, thanks.  I was actually opening my laptop to try and find the build 
errors for the one I just sent, but this is way easier.  It's on fixes.

>
>> ---
>> Hey Palmer,
>> w/ LPC etc I figure it's highly unlikely you'd have this respun
>> in time to have it applied this week. I dropped all the tested
>> and reviewed -by tags since this patch has been changed a fair
>> bit back and forth since the tags were left. Checked it on my
>> D1 to make sure nothing blew up.. if this could make this weeks
>> rc, that'd be great so that the clang allmodconfig builds are
>> working again.
>> Conor.
>> ---
>>  arch/riscv/errata/thead/errata.c    |  1 +
>>  arch/riscv/include/asm/cacheflush.h |  1 +
>>  arch/riscv/kernel/setup.c           |  2 +-
>>  arch/riscv/mm/dma-noncoherent.c     | 23 +++++++++++++----------
>>  4 files changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
>> index 202c83f677b2..96648c176f37 100644
>> --- a/arch/riscv/errata/thead/errata.c
>> +++ b/arch/riscv/errata/thead/errata.c
>> @@ -37,6 +37,7 @@ static bool errata_probe_cmo(unsigned int stage,
>>  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>>  		return false;
>>
>> +	riscv_cbom_block_size = L1_CACHE_BYTES;
>>  	riscv_noncoherent_supported();
>>  	return true;
>>  #else
>> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
>> index a60acaecfeda..a89c005b4bbf 100644
>> --- a/arch/riscv/include/asm/cacheflush.h
>> +++ b/arch/riscv/include/asm/cacheflush.h
>> @@ -43,6 +43,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>>  #endif /* CONFIG_SMP */
>>
>>  #ifdef CONFIG_RISCV_ISA_ZICBOM
>> +extern unsigned int riscv_cbom_block_size;
>>  void riscv_init_cbom_blocksize(void);
>>  #else
>>  static inline void riscv_init_cbom_blocksize(void) { }
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 95ef6e2bf45c..2dfc463b86bb 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
>>  	setup_smp();
>>  #endif
>>
>> -	riscv_fill_hwcap();
>>  	riscv_init_cbom_blocksize();
>> +	riscv_fill_hwcap();
>>  	apply_boot_alternatives();
>>  }
>>
>> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
>> index cd2225304c82..e3f9bdf47c5f 100644
>> --- a/arch/riscv/mm/dma-noncoherent.c
>> +++ b/arch/riscv/mm/dma-noncoherent.c
>> @@ -12,7 +12,7 @@
>>  #include <linux/of_device.h>
>>  #include <asm/cacheflush.h>
>>
>> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
>> +unsigned int riscv_cbom_block_size;
>>  static bool noncoherent_supported;
>>
>>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>> @@ -79,38 +79,41 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>  void riscv_init_cbom_blocksize(void)
>>  {
>>  	struct device_node *node;
>> +	unsigned long cbom_hartid;
>> +	u32 val, probed_block_size;
>>  	int ret;
>> -	u32 val;
>>
>> +	probed_block_size = 0;
>>  	for_each_of_cpu_node(node) {
>>  		unsigned long hartid;
>> -		int cbom_hartid;
>>
>>  		ret = riscv_of_processor_hartid(node, &hartid);
>>  		if (ret)
>>  			continue;
>>
>> -		if (hartid < 0)
>> -			continue;
>> -
>>  		/* set block-size for cbom extension if available */
>>  		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>>  		if (ret)
>>  			continue;
>>
>> -		if (!riscv_cbom_block_size) {
>> -			riscv_cbom_block_size = val;
>> +		if (!probed_block_size) {
>> +			probed_block_size = val;
>>  			cbom_hartid = hartid;
>>  		} else {
>> -			if (riscv_cbom_block_size != val)
>> -				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
>> +			if (probed_block_size != val)
>> +				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
>>  					cbom_hartid, hartid);
>>  		}
>>  	}
>> +
>> +	if (probed_block_size)
>> +		riscv_cbom_block_size = probed_block_size;
>>  }
>>  #endif
>>
>>  void riscv_noncoherent_supported(void)
>>  {
>> +	WARN(!riscv_cbom_block_size,
>> +	     "Non-coherent DMA support enabled without a block size\n");
>>  	noncoherent_supported = true;
>>  }
>> --
>> 2.37.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
