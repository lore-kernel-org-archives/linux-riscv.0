Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC3C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfGX5TrBx4MVsl4TmEzmLImt46RSGAIO5L1lGB+eU/U=; b=irK7jzzECTgc/Q
	RZMCdT2/hL7qUuDUCIW6mXLue++HUl+QFtsCR0bMZAbGDPDO/94jTQ6/cSoewWHIwRfR3iL0goNI/
	5oR7HbyUgaDWwolLRRe76+dyiiGpi/95qI77ZnqH3+6UbVjlEll8fG/1LvKxWyr/FXCMsts00Hi7A
	yuKfF2YmoQG11dopcyxdvrp7hFO7xLswgssyIIdUeisSFMVXvljNrr0EYJ4YbRwzuKQvSuwcfi/4l
	iyww/AY+do5CDXU2Q0h+dpDFHHlZgJX7VKxTOo8sR/25POnwij1LrdbcBcJ9U9JixuUCfiiycPxLj
	bbuYn0LlIiIYi4rgTZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy911-007ORP-Hi; Thu, 24 Nov 2022 09:59:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy90u-007ONC-Vl
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669283964; x=1700819964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vwfci9L8RiCJZJk4q1ZcbZBshRi/h91hw6qStmAse7s=;
  b=ZJ71JOJLZn0u0OoCS2RvdVQX9zsfAyzv/rjO1b13egKJQ+vUz9aWEYls
   qyOIHZiGOk/HiUWNR63IundZ/2VvKatzH8tLBYLESYuq/tDjNdn+a//g4
   pyxRmM1OgtxdELG++W5AlS+kc4O9WQMnT5j4pIPMNFajHosGLSbBXwssA
   /dlrVqhbfO+AcFlxfkTAr14ZvbGLz48BO03dkAJ8FzOEY5iUBwBY/mApV
   A56UpT9QuhK1FElHS8tHalWLv/Uci8WXeJTEvQDnlR7QCHdSovG2AOTJ/
   sspFctzMRm8JBOoB1HPn6ZDU/F1Hd0aeoK4Q1Vi5/ujaDVg3EeC9bb2WQ
   A==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="188489524"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 02:59:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 02:59:14 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 02:59:11 -0700
Date: Thu, 24 Nov 2022 09:58:53 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Ortiz <sameo@rivosinc.com>
CC: "Hongren (Zenithal) Zheng" <i@zenithal.me>, Palmer Dabbelt
	<palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Eric Biederman <ebiederm@xmission.com>, Kees Cook
	<keescook@chromium.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-api@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
	<linux-man@vger.kernel.org>, Jiatai He <jiatai2021@iscas.ac.cn>, Heiko
 Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar Crypto
Message-ID: <Y39AXYPFzSiBngwI@wendy>
References: <YqYz+xDsXr/tNaNu@Sun>
 <YqY0i22SdbHjB/MX@Sun>
 <Y385rS/5zDaDJ3Os@vermeer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y385rS/5zDaDJ3Os@vermeer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_015925_096780_CA056280 
X-CRM114-Status: GOOD (  18.00  )
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

On Thu, Nov 24, 2022 at 10:30:21AM +0100, Samuel Ortiz wrote:
> On Mon, Jun 13, 2022 at 02:46:35AM +0800, Hongren (Zenithal) Zheng wrote:
> > diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> > index 46dc3f5ee99f..bfed3e5c338c 100644
> > --- a/arch/riscv/include/uapi/asm/hwcap.h
> > +++ b/arch/riscv/include/uapi/asm/hwcap.h
> > @@ -22,4 +22,26 @@
> >  #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
> >  #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
> >  
> > +/*
> > + * HWCAP2 flags - for elf_hwcap2 (in kernel) and AT_HWCAP2
> > + *
> > + * As only 32 bits of elf_hwcap (in kernel) could be used
> > + * and RISC-V has reserved 26 bits of it, other caps like
> > + * bitmanip and crypto can not be placed in AT_HWCAP
> > + */
> 
> Have we agreed that multi-letter ISA extensions would use hwcap to be
> exposed to userspace? With so many potential extensions, we could
> quickly run out of space on AT_HWCAP2 as well.

Palmer whipped up a PoC hwprobe interface (during Plumbers I think) that
Heiko is currently looking into - I think his motivation is misaligned
access performance. There's a branch but I have no idea if it even
compiles... I'm mostly waiting for whatever Heiko comes up with ;)

https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-hwprobe-v1

This patchset seems to need a rebase anyway per your other reply, but I
guess that the new proposed interface would be preferable?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
