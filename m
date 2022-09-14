Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E4C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaweCFYeZtjUq+NbxqVDsYiHNl505xFHxJ+Rbbugk6Q=; b=sOC01lzWsv12Lg
	dktOyLR/8bkwzHxCBvFOpQWWqYsEsN70uHaVQWPQjAQXkEmscqAVz9r6Qj9vvLMrYWeAYbWypfuYo
	iK2giSDxt7D7cBA5rfGMwOLJofYplGteKPpXIW52bVptq3v6axFPyNIO+f+SGnzGOUWqO1h+4ZTIJ
	apd4OmFwlNlFx3gdSN2h2lqFby6vAKOAn54qotp5WEnekuwYG0fVq7W9jcFSdlOHidatavFcn12kf
	5Pe65gLYTOkBZbMb8j3Wt5pt6wwseTyKJMbSFd7t/YHBgguVXjkx7LEegsTpSe4yGCP+wJpQV2XNP
	EWKJvxyD6o214+K6o3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYajs-00BDa8-92; Wed, 14 Sep 2022 22:20:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYajp-00BDYt-O2
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 22:20:11 +0000
Received: from [89.101.222.236] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oYajb-0000Tc-2O; Thu, 15 Sep 2022 00:19:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com, Conor.Dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org, mail@conchuod.ie, atishp@atishpatra.org, ajones@ventanamicro.com, anup@brainfault.org, lkp@intel.com
Subject: Re: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef block
Date: Thu, 15 Sep 2022 00:19:51 +0200
Message-ID: <1905154.PYKUYFuaPT@phil>
In-Reply-To: <e7e5a415-e097-a56e-880b-fa0488d2b73a@microchip.com>
References: <20220914143648.74022-1-heiko@sntech.de> <e7e5a415-e097-a56e-880b-fa0488d2b73a@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_152009_819315_EF0DD588 
X-CRM114-Status: GOOD (  21.88  )
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

Hi,

Am Mittwoch, 14. September 2022, 21:32:01 CEST schrieb Conor.Dooley@microchip.com:
> On 14/09/2022 15:36, Heiko Stuebner wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > riscv_cbom_block_size is used by all current non-coherent dma operations,
> > not only the zicbom variant. So move it over the block also containing
> > the riscv_noncoherent_supported() prototype.
> > 
> > Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> 
> I accidentally fetched palmers repo rather than riscv & noticed he
> pushed a fix there for this too:
> https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=zicbom-fix
> 
> I think Palmer's solution is slightly nicer, but to me either makes
> little difference, just getting things squared away for 6.0 is all
> I care about at this point.

yeah, Palmer's solution is nice and incidentially should also
not only make LKP happier but maybe also Anup in one go :-) .

So I'd guess disregard this patch and move Palmer's patch over?


Heiko

> 
> Either this or the one on Palmer's branch is:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > ---
> >  arch/riscv/include/asm/cacheflush.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > index a89c005b4bbf..5c16d901d3da 100644
> > --- a/arch/riscv/include/asm/cacheflush.h
> > +++ b/arch/riscv/include/asm/cacheflush.h
> > @@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> >  #endif /* CONFIG_SMP */
> > 
> >  #ifdef CONFIG_RISCV_ISA_ZICBOM
> > -extern unsigned int riscv_cbom_block_size;
> >  void riscv_init_cbom_blocksize(void);
> >  #else
> >  static inline void riscv_init_cbom_blocksize(void) { }
> >  #endif
> > 
> >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > +extern unsigned int riscv_cbom_block_size;
> >  void riscv_noncoherent_supported(void);
> >  #endif
> > 
> > --
> > 2.35.1
> > 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
