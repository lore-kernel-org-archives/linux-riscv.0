Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F7EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTVusMTSNmI6RD2wN3eAuXv+HB+9MQeTCdfNzLHuXSo=; b=of0Iva/oZXcvU9
	pZBVPausodyu3/fnohAcFy8YedPTBwZmte6tO2EedQ0a3hcpvwc/Tnndts6U5pdendHQcFcpnvYor
	Gkm16pBYy6S3nkpuPIMc2ldO8jIdky1kFLCmaHYz5z8ldPAHFSYX3cnwl5w++dSB3DS2TIqs7IzbF
	27uFeNNT88sThFq40SjEUF68Lu4jNaMfaz1XBqt/dk+PrEVPg2OW1vYI0PlFrQZDnlULd0kSftqiL
	mAQCUvYBNHfjMa4dLxL+l5V0pEvd/wzp4Q+BFSxXy8PxW8Ie3zrUBXa9CN05ZHQuDYkBjeQMlwAcW
	naRrDRi9TES+ga4bXSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiquh-00AjZJ-B5; Thu, 13 Oct 2022 05:37:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiquf-00AjYt-0i
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:37:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D01A8615DC;
	Thu, 13 Oct 2022 05:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1CEC433C1;
	Thu, 13 Oct 2022 05:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665639463;
	bh=8aVZC45tzS5Xypj4wP6sxsCkOsmuarZG9AGJpu3SPco=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=F/D4d5YEo4S11Gj+F+xVctT+5me3AkVUXb2whtUfIS8fJ2mFuvUr8PySwMHqJDeAZ
	 b2NkTQDtu5CaRGkklBGxSm8sI7e0sfzKQs9O+ynrHay1wfBk3l89nFUEsU66zrPrFg
	 18ShVKVDCefbYGjeJYkNcpW4kNI2s4E8l2acQZ1t5DZGJBcjMK8ZdfNnaQhjsqmGye
	 An86ifLgD2CmtT+nU0bZV7B1MAhbFI87RXTyhsZDhv5+LYXvn3vc+f90B8uxlGYaDi
	 hGgxNoDjGA+p6gZQV4JMvoE0xUHL8zhimDiaqzRXHXzsslA+O0BwlTr/ZXlRqeYZIk
	 CBwcIQMlg90Ng==
Date: Thu, 13 Oct 2022 06:37:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/8=5D_riscv=3A_move_riscv=5Fnonc?= =?US-ASCII?Q?oherent=5Fsupported=28=29_out_of_ZICBOM_probe?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y0GCST9IQcKws9Yh@xhacker>
References: <20221006070818.3616-1-jszhang@kernel.org> <20221006070818.3616-2-jszhang@kernel.org> <Y0F1uH71Ll7YGygB@spud> <Y0GCST9IQcKws9Yh@xhacker>
Message-ID: <BBEFA528-0F84-41CB-A62F-ED4673947928@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_223745_159320_3E3EC2F1 
X-CRM114-Status: GOOD (  20.47  )
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



On 8 October 2022 14:59:37 IST, Jisheng Zhang <jszhang@kernel.org> wrote:
>On Sat, Oct 08, 2022 at 02:06:00PM +0100, Conor Dooley wrote:
>> On Thu, Oct 06, 2022 at 03:08:11PM +0800, Jisheng Zhang wrote:
>> > It's a bit wired to call riscv_noncoherent_supported() once when
>> > insmod a module. Move the calling out of feature patch func.
>> > 
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > ---
>> >  arch/riscv/kernel/cpufeature.c | 7 +------
>> >  arch/riscv/kernel/setup.c      | 4 ++++
>> >  2 files changed, 5 insertions(+), 6 deletions(-)
>> > 
>> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> > index 3b5583db9d80..03611b3ef45e 100644
>> > --- a/arch/riscv/kernel/cpufeature.c
>> > +++ b/arch/riscv/kernel/cpufeature.c
>> > @@ -272,12 +272,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>> >  	case RISCV_ALTERNATIVES_EARLY_BOOT:
>> >  		return false;
>> >  	default:
>> > -		if (riscv_isa_extension_available(NULL, ZICBOM)) {
>> > -			riscv_noncoherent_supported();
>> > -			return true;
>> > -		} else {
>> > -			return false;
>> > -		}
>> > +		return riscv_isa_extension_available(NULL, ZICBOM);
>> >  	}
>> >  #endif
>> >  
>> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> > index 2dfc463b86bb..1a055c3f5d9d 100644
>> > --- a/arch/riscv/kernel/setup.c
>> > +++ b/arch/riscv/kernel/setup.c
>> > @@ -299,6 +299,10 @@ void __init setup_arch(char **cmdline_p)
>> >  	riscv_init_cbom_blocksize();
>> >  	riscv_fill_hwcap();
>> >  	apply_boot_alternatives();
>> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
>> > +	if (riscv_isa_extension_available(NULL, ZICBOM))
>> > +		riscv_noncoherent_supported();
>> > +#endif
>> 
>> I have a personal bias against ifdefs where possible, maybe @Heiko
>> remembers why riscv_noncoherent_supported() was not defined as something
>> like `void riscv_noncoherent_support(void){}` for when that CONFIG is
>> not enabled? If it was this could become a an IS_ENABLED & we wouldn't
>> have to be so careful about wrapping it's usage in ifdefs.
>
>Good idea. Will do in newer version.

Given this comment and the LKP report I've marked the series as changes requested in patchwork FYI.

Thanks,
Conor.

>
>> 
>> Your change in isolation makes sense to me though, so:
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> 
>> Thanks,
>> Conor.
>> 
>> >  }
>> >  
>> >  static int __init topology_init(void)
>> > -- 
>> > 2.37.2
>> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
