Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D842CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RTIMaf868jqZIDPMlf/LknDLaau3TMVCspRLvtzz20=; b=YjCaYfbrTlIsRk
	1pWkuiZf8cycTtNXg4REf3AwzpBHcShMvbuCy83dSXXO+kQQhuWCYynmHOG5jZmqDC2tTjSdwNjWy
	iN0RUYiKZpk47fUAg8wumLKL+WGUYDkudLNJQJHV79bGSoIzFw0h+K3h8HnoHQYfiJoAq4d9fZRKo
	Z0fNRzZnQOQjtIHfbsCJnd1VsC3ndJMhOHttX9rQDAu+bBZB2n1dCURi/WUm3P0LJj+raCUCdvA1C
	3d/OBeiSvPb0rVdEjVX5FQZPWDvPlnLdMJOYiVGd6UuMHp1hI9bFhdmazRLRt5GHjiPLs/Gloh/GC
	bFsIcw+amVXooBfAvu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0M9E-00G6Ui-B3; Wed, 30 Nov 2022 12:25:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0M9C-00G6UB-68
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 12:25:07 +0000
Received: by mail-ej1-x629.google.com with SMTP id ud5so40926011ejc.4
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 04:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fCDiHDZsrofNxtKzcPYjsDFe13Av3Hg/Ow06Dhhjw6M=;
        b=ocBUwrtEB/e7unvyCsfLhQITcjqQECXFPi+3LOloiEeLHgsCNu06lCYLEtNn6OhMnD
         o3avO2iC8VU88bBe2evd4ZT5DKFsfJ1b/prQwXfFUpU4CaM7UgfzvYSaWlimhTg97pkW
         Fo/XMV2y/ygUwnFx5guMGx28vfIkGS6ckhzcXDc9UltKXdpyiqbBLWd18RNRrtoogbZz
         TRDPdgyoGRy4phdk4DQphjEDp184bUsHdi2oQSEAKz3uVWmOuMrvJlw0IRl4OVxoMD+a
         gyTHhmHEGiaH7tnZIT5ilesy8p3YPKfYY9Bjx2ymOIf+sJ7K1C77URVV2eML+s2ZSFrm
         MMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCDiHDZsrofNxtKzcPYjsDFe13Av3Hg/Ow06Dhhjw6M=;
        b=NVzEJ8b5HixV+P1fYjrCxPRWdFFr7rvpce0MLmUiy6D8zyIUrPj9CuNfRfkmBVrOOS
         e+GwlKF9mbtOSeww7LAas0HiL4Nn2tN9+e5iAORmJmsPv5aNiiWfGAjtBoSCYURuT5XF
         3bgNg8/QqiK8ph/6swC4XE2b1IYkKjolBG5FzrNP81a750wD7lOHRNTCenbqFoa/n36B
         bFlJuKlYXfFf+0MULDSVSH6TjRD/yvI+/0hRH4vTYcqQbySIX/r2GEKk1OjF0r1Pe9hV
         kP8d4JUV0J0iTSCQnx8gcAsx4vEBLoreSN3HGbvRIRi3nbESf2vajezQsvnE9tYW+/1n
         ne7w==
X-Gm-Message-State: ANoB5plASDI0QfvQk5T3jhfRdMXpJ6nl34c4atskosKuSeL25Ma/v8FX
	91eeq+5F++jj1vWqWCmrAZaL4Q==
X-Google-Smtp-Source: AA0mqf5As0pNjsPsvKq/wlgOuxX3VawoCXFADOgaaecDuNGkykAKCYBIIy6/giLXbkQKAV6TiN2Ebg==
X-Received: by 2002:a17:906:f13:b0:78d:8e08:76de with SMTP id z19-20020a1709060f1300b0078d8e0876demr51733297eji.12.1669811104515;
        Wed, 30 Nov 2022 04:25:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id g40-20020a056402322800b00459012e5145sm563953eda.70.2022.11.30.04.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:25:04 -0800 (PST)
Date: Wed, 30 Nov 2022 13:25:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, heiko@sntech.de,
	apatel@ventanamicro.com, atishp@rivosinc.com
Subject: Re: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <20221130122502.52w45qvxu73acfrf@kamzik>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
 <20221129143447.49714-4-ajones@ventanamicro.com>
 <Y4ZhT3R34cE35a0K@spud>
 <3c64b508-a629-0c34-1119-e854b1968a2f@microchip.com>
 <20221130113314.jagmoosmx5ktwt6t@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130113314.jagmoosmx5ktwt6t@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_042506_271893_DDABD5BF 
X-CRM114-Status: GOOD (  34.41  )
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

On Wed, Nov 30, 2022 at 12:33:14PM +0100, Andrew Jones wrote:
> On Wed, Nov 30, 2022 at 09:46:20AM +0000, Conor.Dooley@microchip.com wrote:
> > On 29/11/2022 19:45, Conor Dooley wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > 
> > > Hey Drew,
> > > 
> > > On Tue, Nov 29, 2022 at 03:34:47PM +0100, Andrew Jones wrote:
> > >> When a DT puts zicbom in the isa string, but does not provide a block
> > >> size, ALT_CMO_OP() will attempt to do cache operations on address
> > >> zero since the start address will be ANDed with zero. We can't simply
> > >> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> > >> size because the failure will happen before logging works, leaving
> > >> users to scratch their heads as to why the boot hung. Instead, ensure
> > >> Zicbom is disabled and output an error which will hopefully alert
> > >> people that the DT needs to be fixed. While at it, add a check that
> > >> the block size is a power-of-2 too.
> > >>
> > >> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > This seems to be failing on nommu :/ I've got host machines issues so I
> > > could not reproduce it for you lcoally and paste an actual log, but if
> > > you build rv64_nommu_virt_defconfig I think you should be able to

You mean a 64-bit build with 'nommu_virt_defconfig', right? There isn't a
'rv64_nommu_virt_defconfig' that I know of.

> > > reproduce.
> > 
> > The actual error is:
> > riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/cpufeature.o: in function `.L0 ':
> > cpufeature.c:(.text.unlikely+0x8): undefined reference to `riscv_cbom_block_size'
> 

I can't reproduce this. The following commands work fine for me

 $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build nommu_virt_defconfig
 $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build -j$(nproc)

And llvm also works

 $ make ARCH=riscv LLVM=1 O=build-llvm nommu_virt_defconfig
 $ make ARCH=riscv LLVM=1 O=build-llvm -j$(nproc)

Additionally, I can't see how riscv_cbom_block_size wouldn't be defined.
It's exported from arch/riscv/mm/cacheflush.c, which is always built,
and no ifdefery wraps it.

Thanks,
drew

> 
> drew
> 
> > 
> > 
> > > 
> > > Thanks,
> > > Conor.
> > > 
> > >> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > >> ---
> > >>   arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
> > >>   1 file changed, 13 insertions(+)
> > >>
> > >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > >> index 220be7222129..93e45560af30 100644
> > >> --- a/arch/riscv/kernel/cpufeature.c
> > >> +++ b/arch/riscv/kernel/cpufeature.c
> > >> @@ -9,6 +9,7 @@
> > >>   #include <linux/bitmap.h>
> > >>   #include <linux/ctype.h>
> > >>   #include <linux/libfdt.h>
> > >> +#include <linux/log2.h>
> > >>   #include <linux/module.h>
> > >>   #include <linux/of.h>
> > >>   #include <asm/alternative.h>
> > >> @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> > >>
> > >>   static bool riscv_isa_extension_check(int id)
> > >>   {
> > >> +     switch (id) {
> > >> +     case RISCV_ISA_EXT_ZICBOM:
> > >> +             if (!riscv_cbom_block_size) {
> > >> +                     pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> > >> +                     return false;
> > >> +             } else if (!is_power_of_2(riscv_cbom_block_size)) {
> > >> +                     pr_err("cbom-block-size present, but is not a power-of-2\n");
> > >> +                     return false;
> > >> +             }
> > >> +             return true;
> > >> +     }
> > >> +
> > >>        return true;
> > >>   }
> > >>
> > >> --
> > >> 2.38.1
> > >>
> > >>
> > >> _______________________________________________
> > >> linux-riscv mailing list
> > >> linux-riscv@lists.infradead.org
> > >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
