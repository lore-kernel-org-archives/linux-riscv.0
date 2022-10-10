Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B2C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 07:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7y4Snyt/W2wY/3S9dHaSblyc3nEfdXoruD3d9/gQO/4=; b=hcEGz68Y7NcaGf
	UzY/yZsdFu5/qbL347NVeGo28bNx2EHh+8Ho/8ao4JH8qnafq0kl1tyy2REp9LCXCE/Um+p/2atNg
	n6yZs5ZbjP5I6eGQ3HXA+LClfb7lbd4vxFNHwcyCqf8UsuZ6x4unp/Jazw/7yvJoAers6065BRque
	afEMrTm51O0RWYtMJqko9CWaZKGcmaEHGZn5GC8VaJ1J9Zf4U244D8t3gNMVBrqJXsQzxjx2qfFG+
	e9kPHURJBlElsMYcz3GF89pLHT1003CUtQLQjLeIBVIyCB0tTbgmsyFxxQ9jrb6gcSJsQTv5K/Hxo
	OOH4L03YV5fwwDY0kP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmrS-00HK2X-R4; Mon, 10 Oct 2022 07:06:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmrQ-00HK1n-B7
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 07:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665385561; x=1696921561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xROL4sSA0XHSScYeRuddHrQ4znydf0w9T1UCjqWke5I=;
  b=X98vjRg9mBNhMn9MLy+Wh4klAPHwJDs7FBm5un8pKjpPibQl8GN9rjPS
   LqcR+sz/Ep46h6hncnSkr1i9SUXG/2d+xBXQ0d8Qk+fijgxMEM3hY/cTW
   wsx8L6cFvgZHwy8P7Iy3vEgR9z9eOjFgN26Y1Pi8FSW6UzElW6ZBCyTvv
   1uxxiaJQL2VHtwHFf4/JB3+bVJ4aW4Cc98Of+JZLQuPBq84HE+QjLrZgB
   h3ZUTbD97VLIfq9e5An+wgC7boQqgjS0Saj5Zamr2lMtscRtHp7Z85YDZ
   AetT6l7hgRGdIA6wTohXmodBaCdDLHC8cN6bGKPw8r4bISYkIxhLsG71D
   w==;
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="183997215"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Oct 2022 00:06:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 10 Oct 2022 00:05:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 10 Oct 2022 00:05:57 -0700
Date: Mon, 10 Oct 2022 08:05:35 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Vernon Yang <vernon2gm@gmail.com>, <lkp@intel.com>, <anup@brainfault.org>,
	<atishp@rivosinc.com>, <kbuild-all@lists.01.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: fixup undefined reference to
 riscv_cbom_block_size
Message-ID: <Y0PEPxoH+suUuH0m@wendy>
References: <202210091222.xuZquaM9-lkp@intel.com>
 <20221010013329.199167-1-vernon2gm@gmail.com>
 <Y0O+vEC3/fnUKgxw@wendy>
 <20221010065949.is3kf54ctt2kdmjd@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010065949.is3kf54ctt2kdmjd@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_000600_406521_D6CC1337 
X-CRM114-Status: GOOD (  28.25  )
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

On Mon, Oct 10, 2022 at 08:59:49AM +0200, Andrew Jones wrote:
> On Mon, Oct 10, 2022 at 07:42:04AM +0100, Conor Dooley wrote:
> > On Mon, Oct 10, 2022 at 09:33:29AM +0800, Vernon Yang wrote:
> > > When some RISC-V compilers do not support the Zicbom extension,
> > > the build system auto disable the CONFIG_RISCV_ISA_ZICBOM, so the
> > > source code of the relevant function is not compiled, resulting
> > > in the definition of the riscv_cbom_block_size variable cannot
> > > be found
> > 
> > Hmm, my understanding was that riscv_cbom_block_size was not supposed to
> > depend on CONFIG_RISCV_ISA_ZICBOM because the thead is able to use it
> > even if the toolchain does not support it.
> > 
> > The code in cacheflush.h looks like:
> > extern unsigned int riscv_cbom_block_size;
> > #ifdef CONFIG_RISCV_ISA_ZICBOM
> > void riscv_init_cbom_blocksize(void);
> > #else
> > static inline void riscv_init_cbom_blocksize(void) { }
> > #endif
> > 
> > #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > void riscv_noncoherent_supported(void);
> > #endif
> > 
> > It's early and I only had a quick look but I think that this is not
> > defined because RISCV_DMA_NONCOHERENT is not defined, not because of
> > RISCV_ISA_ZICBOM.
> 
> thead is able to use riscv_cbom_block_size because it does its own
> initialization of it and selects RISCV_DMA_NONCOHERENT to get access
> to it. KVM depends on the initializer in dma-noncoherent.c, which is
> guarded by RISCV_ISA_ZICBOM and does not select RISCV_DMA_NONCOHERENT,
> but RISCV_ISA_ZICBOM does. I think guarding use of riscv_cbom_block_size
> with RISCV_ISA_ZICBOM in KVM makes sense.

Aight chief, you know the code better than I do :)

> > I'm not the KVM maintainer, but I dislike #ifdefery
> > in c files, so it'd be nice I think to sort this out in the header and
> > not have to worry about guarding the variable.
> 
> I also dislike #ifdefery, but unless we move riscv_cbom_block_size to
> an unconditionally built file like cacheflush.c (as Anup once did), then
> we don't have much choice.

Fair enough. Maybe once fixes, for-next & some of Heiko's cleanups have
aligned it'll make sense to do such a change.

Sorry for the noise then,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
