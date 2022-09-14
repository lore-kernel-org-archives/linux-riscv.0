Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70A3C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ftm4wZq8T0M/MlKGqPali5xtpScW913HlvOUeBMtoSU=; b=MHgiEC5QhgXnoc
	6KVLbBzr2zXmgjMbxLtUWQTJP1uayZChvoQ8u2+YqTtqKSiXXbhvo6nQgByap1tQpOQ0mN/apvSZk
	SnTcB/SqYzWCmKcBYNMOEzhFyDap+j7uo75NKdSZx3cGvTNFQTpp8SvItbSwudX0fAVoGaWgkxpFG
	9zwwzU/vH7Stf6uZwDoD4jEMh5HOWNRg0Ssh55DQXP5L46tLhDhGDy7i6nttbdm+flNS5kOc1Ds/H
	OrhvwMXDT/+IiTMfm6Q/3APRLZNBJPHAxUO8gt+e/7nfNR5XGgYY/BcbUjixizj7sGftUI8ySCEGG
	CjAcGwj+xElolkQST7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTqe-0031dI-IP; Wed, 14 Sep 2022 14:58:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTqb-0031KR-6T
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 14:58:42 +0000
Received: from [185.122.133.20] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oYTqU-0006io-Fm; Wed, 14 Sep 2022 16:58:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Conor.Dooley@microchip.com, Anup Patel <apatel@ventanamicro.com>
Cc: palmer@rivosinc.com, linux-riscv@lists.infradead.org, nathan@kernel.org, mail@conchuod.ie, atishp@atishpatra.org, ajones@ventanamicro.com, anup@brainfault.org, lkp@intel.com
Subject: Re: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef block
Date: Wed, 14 Sep 2022 16:58:33 +0200
Message-ID: <4425504.LvFx2qVVIh@phil>
In-Reply-To: <CAK9=C2VPkUD5t6=sSu-QWKJVzoExVVmuRjz8MbPHsx4Dq-xmmQ@mail.gmail.com>
References: <20220914143648.74022-1-heiko@sntech.de> <0662b2d4-5cd3-f240-ee9f-f6da4482b07e@microchip.com> <CAK9=C2VPkUD5t6=sSu-QWKJVzoExVVmuRjz8MbPHsx4Dq-xmmQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_075841_272683_8F3FDEBB 
X-CRM114-Status: GOOD (  30.88  )
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

Am Mittwoch, 14. September 2022, 16:56:07 CEST schrieb Anup Patel:
> On Wed, Sep 14, 2022 at 8:24 PM <Conor.Dooley@microchip.com> wrote:
> >
> > On 14/09/2022 15:46, Anup Patel wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > On Wed, Sep 14, 2022 at 8:07 PM Heiko Stuebner <heiko@sntech.de> wrote:
> > >>
> > >> riscv_cbom_block_size is used by all current non-coherent dma operations,
> > >> not only the zicbom variant. So move it over the block also containing
> > >> the riscv_noncoherent_supported() prototype.
> > >
> > > At the moment, only non-coherent DMA operations use riscv_cbom_block_size
> > > but soon we have other parties using it as well. For example, the RISC-V PMEM
> > > support and KVM RISC-V Zicbom support.
> > >
> > > I am not sure if this is the right thing to do.
> >
> > This is a fix for a current error reported by LKP.
> > When said future users need to use it - they can move it to a better location
> > IMO.
> 
> Why don't we move it to a better location now itself ?

Probably because a fix should be a minimal set of changes,
the breakage already exist and we're shortly before 6.0-rc6 ;-)

If we start discussing now where to put it, we might end up
releasing 6.0 with bugs.

> 
> Regards,
> Anup
> 
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Regards,
> > > Anup
> > >
> > >>
> > >> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> > >> Reported-by: kernel test robot <lkp@intel.com>
> > >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > >> ---
> > >>   arch/riscv/include/asm/cacheflush.h | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > >> index a89c005b4bbf..5c16d901d3da 100644
> > >> --- a/arch/riscv/include/asm/cacheflush.h
> > >> +++ b/arch/riscv/include/asm/cacheflush.h
> > >> @@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> > >>   #endif /* CONFIG_SMP */
> > >>
> > >>   #ifdef CONFIG_RISCV_ISA_ZICBOM
> > >> -extern unsigned int riscv_cbom_block_size;
> > >>   void riscv_init_cbom_blocksize(void);
> > >>   #else
> > >>   static inline void riscv_init_cbom_blocksize(void) { }
> > >>   #endif
> > >>
> > >>   #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > >> +extern unsigned int riscv_cbom_block_size;
> > >>   void riscv_noncoherent_supported(void);
> > >>   #endif
> > >>
> > >> --
> > >> 2.35.1
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
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
