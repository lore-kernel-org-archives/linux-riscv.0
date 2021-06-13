Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D06C48BE5
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D1A61040
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15D1A61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eq3cmLDo2FzE3D1uE/QHOjiAzUNDpzAq6ZXW9UYSQM=; b=iUIhsuWrasm4mL
	WM7pDFtQaWEDI55ofI60+V2n1CGgS/4t+VpqXs9KZgi5MZ8yJL6s150+oScgfMmq2HHCqVsdHdFy8
	kPPqV9u3gHtxuZxP/GEB/XFavRHG0tYdkkXEaiFYu42zbkndrC14nIEEZiahzwhlfZArQDXSuhz2U
	8Cvv53/bPqPHrR4DtCiYkhfuYBkWN5eJDorEekwLLUt0GxzCJgIjfJ/BcnWr2PRBfOWT7TpstX6tT
	eTuiDWFa+XCmtX9OVGBODnoYngZu3y2RvKECOopwlOuCDFyLI1KQAsjP2rY4CbaBcCWCRnSCHXUXA
	ifFkqQrelPJ4wP8Kml8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsELR-009Owo-9p; Sun, 13 Jun 2021 00:51:21 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsELN-009Ovk-Mb
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 00:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=DaZ74OPMtx5ZkV7YUIGH2vM4+SOhqjSoTZ
 OAJpitrIc=; b=VQpmGMWoAsrhM18bRe2iu18R2BPimovNnGUEGnAslHJcLYaZCh
 HehUrktT6mywivvl1OZDt8XMgqg0moLHESf81FWMH3K86UhKqMSXI8QFZZg1iOJr
 E12fe9AdoHFj1C4Y2GkhCSJtxjCTFxfffAGvDB0JHVd3aVSBxe5kSAeBI=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCH9JRZVsVg177PAA--.54070S2; 
 Sun, 13 Jun 2021 08:50:33 +0800 (CST)
Date: Sun, 13 Jun 2021 08:44:47 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: emil.renner.berthing@gmail.com, alex@ghiti.fr, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, jszhang@kernel.org,
 Christoph Hellwig <hch@infradead.org>, zong.li@sifive.com,
 anup@brainfault.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
Message-ID: <20210613084447.6db3cc02@xhacker>
In-Reply-To: <mhng-dfabeabd-e6df-4035-a9d0-c16269390120@palmerdabbelt-glaptop>
References: <CANBLGcy3HrnmrweSpnDZViVstoWJYh4sCBoaX_24AsgWd=Q9XA@mail.gmail.com>
 <mhng-dfabeabd-e6df-4035-a9d0-c16269390120@palmerdabbelt-glaptop>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCH9JRZVsVg177PAA--.54070S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWDuFy7XFyrKF4kJr13urg_yoW5Jr4xpw
 s5AF4vkF15JFy8Jwsrtw18uryjyFsrC343Grn8Ga4YvFyjvF48Xw4DJw15ua4kArn8tr1x
 Xr1rGa4I9w15J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07beAp5UUU
 UU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_175118_382900_C6EA897B 
X-CRM114-Status: GOOD (  23.57  )
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

On Sat, 12 Jun 2021 17:23:51 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> On Sat, 12 Jun 2021 16:23:03 PDT (-0700), emil.renner.berthing@gmail.com wrote:
> > On Fri, 4 Jun 2021 at 13:51, Alexandre Ghiti <alex@ghiti.fr> wrote:  
> >>
> >> Make the physical RAM base address available for all kernels, not only
> >> XIP kernels as it will allow to simplify address conversions macros.  
> >
> > Am I just reading it wrong or won't this patch make it so that the same kernel
> > can't run on two chips with physical ram starting at different addresses?

I mentioned this point in http://lists.infradead.org/pipermail/linux-riscv/2021-June/006840.html  

> 
> IIUC we were in that position, at least without relocatable kernels.  
> Maybe I'm misunderstanding this, though?

Just my humble opinion, before this series patch, at least geneirc Image
for RV64 + MMU + !XIP is doable.

Thanks

> 
> >
> > /Emil
> >  
> >> ---
> >>  arch/riscv/Kconfig | 6 ------
> >>  1 file changed, 6 deletions(-)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index b58596b141fc..3d8e7e4bb45c 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -493,13 +493,8 @@ config STACKPROTECTOR_PER_TASK
> >>         def_bool y
> >>         depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
> >>
> >> -config PHYS_RAM_BASE_FIXED
> >> -       bool "Explicitly specified physical RAM address"
> >> -       default n
> >> -
> >>  config PHYS_RAM_BASE
> >>         hex "Platform Physical RAM address"
> >> -       depends on PHYS_RAM_BASE_FIXED
> >>         default "0x80000000"
> >>         help
> >>           This is the physical address of RAM in the system. It has to be
> >> @@ -512,7 +507,6 @@ config XIP_KERNEL
> >>         # This prevents XIP from being enabled by all{yes,mod}config, which
> >>         # fail to build since XIP doesn't support large kernels.
> >>         depends on !COMPILE_TEST
> >> -       select PHYS_RAM_BASE_FIXED
> >>         help
> >>           Execute-In-Place allows the kernel to run from non-volatile storage
> >>           directly addressable by the CPU, such as NOR flash. This saves RAM
> >> --
> >> 2.30.2
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv  
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
