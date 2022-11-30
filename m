Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D521CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CsXWp7wxyMCBc65n7vYIRqq6BKqhVFMwOw7ws6VsQg=; b=D+APgF9WtkJixQ
	uY0/ziM2PlMhkjBiEAhtKGp0wT2hcvSekvOFcBg+9Q2wRoqSdfOz6ZTdZls7cwm8cPgsdF+RvPyhQ
	x21/CZR4nV1X1A0wUe3cJ4J4DJyy99tdA5WWjEL3eSWrCrGguf3LCmN/jsXAZVty/6PdkRf/VH8FE
	q0z7txw5QCzheOgyS7a/V4NMi3DmOXHP8I34Qc4UiDt/v/5g6xeIwA4oUARgKZJW8a4TkncMQLEdO
	8cadkL48xkqimpykZG5LbFsC0k1vPHZCP/N1DfpQcBRJNOJEzTVJzjudNtVfnRz1JGJYaQ5Ug6x6U
	jnTE/WP/llACyo5XL4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LL9-00Fpvc-Es; Wed, 30 Nov 2022 11:33:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LL6-00FprC-30
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 11:33:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id td2so26489072ejc.5
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 03:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRKVtL8Vnp/NjQ0+Ol1LbLwshz8jD/8ClYbnisG9Iiw=;
        b=KYwJEzc7Stl9vu5Agrl6dD29YAvSP75W/Y1fhiwOjq5of3IMz4W67gBlvG+5wM2M0Y
         rpSdPvx9nJfnc8W8GLIpTfwA8BxAxpuKW8VWtxR6+dRMJ/j9/0QWHP6fIpenA0gMe6Uy
         rDGN85/XZDM0NEsd803oiIJR6tfjcJz7FhTQyQK44Kttr8EP9b8DN5EY/6yAR1xkzQNk
         tgsouz4VvlVU3t3qgFt01Uc1NxnzwWKDEv7dHwHoP/bGm+4Z57MHkhXVjqenqLbwV2rV
         C9hKkY3AzzksLQFpl0fGFety3WZN3EZ6WC9kvu9aB1wzEFMiUa2lWtpyvrWvWF24Zj15
         VjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRKVtL8Vnp/NjQ0+Ol1LbLwshz8jD/8ClYbnisG9Iiw=;
        b=7EnKewZNeReJ08u9a5dN0qWQj4RLlDgQCKD5kKQI9u23UbUtpmerCgyR7xdSzaV1+w
         bPJlf3XcEvnj40HA6wOLkx2BlyS/PsRf9N8MjZr4+CvlPAxGmrr+7rBSK3bMJHaoBrCK
         ISjCF8afwizZ+q1IqBQgNf13ROuuk+i288g9d2aw1LJigDoUD3KaMSA11ZfqKjeml9/k
         nVU4u9NZvwqyySxWd7BPxj6MGTKyrx/hd+yruuhL6pw5pE80ColdTQWeJ0TdinDq7h8C
         M8foks3fLuI+GerR9E748Ck/3H2PV3Yy9Zl4LZmbV9qiwTd8qup/catrBtORvnPn3A16
         jLOw==
X-Gm-Message-State: ANoB5plcA5U9D+GiviYYNK+rMp97EgK9TnD6GPv+TjQ/WQlMsCYmxfF6
	0GoUmf4ndzqAYXn9Vm3hDtbPKA==
X-Google-Smtp-Source: AA0mqf7BrqaWlqgvfuUMa9ZKkvdy9WUIYZxAHmSIaOlIiK8962ZK7NXJLTobzsVxxdE9HqwNvqGFJw==
X-Received: by 2002:a17:907:a04c:b0:7c0:98e5:f886 with SMTP id gz12-20020a170907a04c00b007c098e5f886mr3172837ejc.516.1669807996440;
        Wed, 30 Nov 2022 03:33:16 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906200a00b007ae243c3f05sm522915ejo.189.2022.11.30.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:33:16 -0800 (PST)
Date: Wed, 30 Nov 2022 12:33:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, heiko@sntech.de,
	apatel@ventanamicro.com, atishp@rivosinc.com
Subject: Re: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <20221130113314.jagmoosmx5ktwt6t@kamzik>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
 <20221129143447.49714-4-ajones@ventanamicro.com>
 <Y4ZhT3R34cE35a0K@spud>
 <3c64b508-a629-0c34-1119-e854b1968a2f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c64b508-a629-0c34-1119-e854b1968a2f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_033320_158491_79A907E4 
X-CRM114-Status: GOOD (  31.30  )
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

On Wed, Nov 30, 2022 at 09:46:20AM +0000, Conor.Dooley@microchip.com wrote:
> On 29/11/2022 19:45, Conor Dooley wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hey Drew,
> > 
> > On Tue, Nov 29, 2022 at 03:34:47PM +0100, Andrew Jones wrote:
> >> When a DT puts zicbom in the isa string, but does not provide a block
> >> size, ALT_CMO_OP() will attempt to do cache operations on address
> >> zero since the start address will be ANDed with zero. We can't simply
> >> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> >> size because the failure will happen before logging works, leaving
> >> users to scratch their heads as to why the boot hung. Instead, ensure
> >> Zicbom is disabled and output an error which will hopefully alert
> >> people that the DT needs to be fixed. While at it, add a check that
> >> the block size is a power-of-2 too.
> >>
> >> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > This seems to be failing on nommu :/ I've got host machines issues so I
> > could not reproduce it for you lcoally and paste an actual log, but if
> > you build rv64_nommu_virt_defconfig I think you should be able to
> > reproduce.
> 
> The actual error is:
> riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/cpufeature.o: in function `.L0 ':
> cpufeature.c:(.text.unlikely+0x8): undefined reference to `riscv_cbom_block_size'

Thanks Conor,

I'll try to get this fixed and send a v4 ASAP.

drew

> 
> 
> > 
> > Thanks,
> > Conor.
> > 
> >> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >> ---
> >>   arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >> index 220be7222129..93e45560af30 100644
> >> --- a/arch/riscv/kernel/cpufeature.c
> >> +++ b/arch/riscv/kernel/cpufeature.c
> >> @@ -9,6 +9,7 @@
> >>   #include <linux/bitmap.h>
> >>   #include <linux/ctype.h>
> >>   #include <linux/libfdt.h>
> >> +#include <linux/log2.h>
> >>   #include <linux/module.h>
> >>   #include <linux/of.h>
> >>   #include <asm/alternative.h>
> >> @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> >>
> >>   static bool riscv_isa_extension_check(int id)
> >>   {
> >> +     switch (id) {
> >> +     case RISCV_ISA_EXT_ZICBOM:
> >> +             if (!riscv_cbom_block_size) {
> >> +                     pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> >> +                     return false;
> >> +             } else if (!is_power_of_2(riscv_cbom_block_size)) {
> >> +                     pr_err("cbom-block-size present, but is not a power-of-2\n");
> >> +                     return false;
> >> +             }
> >> +             return true;
> >> +     }
> >> +
> >>        return true;
> >>   }
> >>
> >> --
> >> 2.38.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
