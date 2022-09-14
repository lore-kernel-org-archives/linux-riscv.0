Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA23CECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gd2GI/ywlPJP9UgXzzzp0hgJLIP7cCj5YqkQ/ZAIRss=; b=L7UFCQ706v+OXF
	Y+srpgE6H3Hlb1ZXkp8SlwKWIPyjtyKCB51OVvCYdN27qJfruB7CMQTMyJsjnEdOPOE5GfbCjX2zJ
	SNDJ5yF6BT6MrBafCaYz4jxjC7c2wkQaw6yQ2Q+62e2hPtmCOxKz6mIUKDSOHm0NcTjqRxED+QRIl
	ZJqFRynsNWjFRxIJvc0PvtHZXrJyV9NLqlUaxPghc8fUKjYS9Oq9HWhxFtibmPmyVmYNcBI9D5aD4
	M2G8VG8rc/ReKwH9902dGP/+1coWGeLXFggYp67g5i5YghweoH1R1WwGP7rjNbwwy+ll386hXhVzk
	LBA5D1vds+PTF5CSO6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYToO-002vy3-AO; Wed, 14 Sep 2022 14:56:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYToL-002vqO-R5
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 14:56:23 +0000
Received: by mail-lf1-x136.google.com with SMTP id o2so23448854lfc.10
        for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UOITW+FUZxOHuhavHRFBIqbP2QepsFm6z7T1T7JyEpg=;
        b=C8dFiKtSBL/vqPClGYM4kzsgqx5fb84DvRAc99uio2YVbyRVSp1Pv0T4YkRVJ/PQOQ
         DJ0tr4Hx7EK/+EUxUwG1MeKNKVt0oC3qnTcJC/GM0iv5XM7R+kkDu1lOruFtMxm//rpY
         g4GR6T/1MsOfBdfss4RiC+VDEZLsqG8ZOxkFL2oEgR2l4PPjpP1b3vCEv6TebjOxuJOm
         xHlxRO5vQZ4IxxXRnhPY+KAZI8dURJKLUa3Nlqc9YgIPWucSkKNX+B4cZIbGMF4yyBBt
         gDlx6aKaQd7NbPw0zthuDJHmHsPgwpwz49MwFgLeeID6A0KJJJNPdcy1uXPMkn0E4kY8
         W3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UOITW+FUZxOHuhavHRFBIqbP2QepsFm6z7T1T7JyEpg=;
        b=UHMqGxa5H/wEJ8JNyy+f7XfNAPTQiA83FHliuGvKWvBglS17tnq+0t97taEPOqH1sM
         qe7ILqjz+tR8TpAEnzr+05r93Zvn/FDCmm/fBrbSoYcsVAHRm5iSq7UDqqQxODDWOOB4
         yLAsIEE1aVkBerzDxouCC2j2c3tArw75N3e8ZH+wPHhVMWRHT3l5f39HUvvvEEhwlz9o
         ky6OTMI/05J1OrOwthL7Y+yFzwQWgasAwWY6p9SyokKfM75X8A8+Lo7am0C5AIdcBp1V
         yGEyIVo9JRT/phpooGbxnN/NNcupaqYBiQgS5zOx0X+gmAxfJHDWkfI9UosaBgZAWbQs
         LWnA==
X-Gm-Message-State: ACgBeo1955uhbD5wVrtcVcoT4zf/ifRpb7MBrbIUC7o9uWDnXkBvdR6k
	gMmMW8RtHHKU93Z2CljrcPmRZkYs6s8BdnQ71uIXWFYSR+c=
X-Google-Smtp-Source: AA6agR7z3zbTCGJW9Nc70fm4gSD+Z5wrC8abVpIcMfePeDLIdEbd5U87NrHm876ccxghp0QttVIGr6LMfhmHvBb+FqA=
X-Received: by 2002:a05:6512:11f1:b0:497:adc5:629a with SMTP id
 p17-20020a05651211f100b00497adc5629amr10581793lfs.419.1663167378662; Wed, 14
 Sep 2022 07:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220914143648.74022-1-heiko@sntech.de> <CAK9=C2V+4bn_xi-u0Z0TLmtir02em66PBS2tcaD9DCXKxqxzhA@mail.gmail.com>
 <0662b2d4-5cd3-f240-ee9f-f6da4482b07e@microchip.com>
In-Reply-To: <0662b2d4-5cd3-f240-ee9f-f6da4482b07e@microchip.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Sep 2022 20:26:07 +0530
Message-ID: <CAK9=C2VPkUD5t6=sSu-QWKJVzoExVVmuRjz8MbPHsx4Dq-xmmQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef block
To: Conor.Dooley@microchip.com
Cc: heiko@sntech.de, palmer@rivosinc.com, linux-riscv@lists.infradead.org, 
	nathan@kernel.org, mail@conchuod.ie, atishp@atishpatra.org, 
	ajones@ventanamicro.com, anup@brainfault.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_075621_901372_6D74B35A 
X-CRM114-Status: GOOD (  26.02  )
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

On Wed, Sep 14, 2022 at 8:24 PM <Conor.Dooley@microchip.com> wrote:
>
> On 14/09/2022 15:46, Anup Patel wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Wed, Sep 14, 2022 at 8:07 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >>
> >> riscv_cbom_block_size is used by all current non-coherent dma operations,
> >> not only the zicbom variant. So move it over the block also containing
> >> the riscv_noncoherent_supported() prototype.
> >
> > At the moment, only non-coherent DMA operations use riscv_cbom_block_size
> > but soon we have other parties using it as well. For example, the RISC-V PMEM
> > support and KVM RISC-V Zicbom support.
> >
> > I am not sure if this is the right thing to do.
>
> This is a fix for a current error reported by LKP.
> When said future users need to use it - they can move it to a better location
> IMO.

Why don't we move it to a better location now itself ?

Regards,
Anup

>
> Thanks,
> Conor.
>
> >
> > Regards,
> > Anup
> >
> >>
> >> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> ---
> >>   arch/riscv/include/asm/cacheflush.h | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> >> index a89c005b4bbf..5c16d901d3da 100644
> >> --- a/arch/riscv/include/asm/cacheflush.h
> >> +++ b/arch/riscv/include/asm/cacheflush.h
> >> @@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> >>   #endif /* CONFIG_SMP */
> >>
> >>   #ifdef CONFIG_RISCV_ISA_ZICBOM
> >> -extern unsigned int riscv_cbom_block_size;
> >>   void riscv_init_cbom_blocksize(void);
> >>   #else
> >>   static inline void riscv_init_cbom_blocksize(void) { }
> >>   #endif
> >>
> >>   #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >> +extern unsigned int riscv_cbom_block_size;
> >>   void riscv_noncoherent_supported(void);
> >>   #endif
> >>
> >> --
> >> 2.35.1
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
