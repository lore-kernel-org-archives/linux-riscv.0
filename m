Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F858C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsPeuV72Jyr8aILAcUvzk5NsPA0Zh89ks6odHW7LiZs=; b=ijKhNUa5xXDahA
	c+5K45fXqNSY0h3FQWOnxHBZ+sHdybVmrSqNViTjUyHnQ5RDkOjuaopSML/Ga3YxTICZhp69cUHsA
	V2epIKyb2qq+3qEmw6DOi5wGDhRTno0+zk1b8P6EFEgnhJQIDAoKn9jA6aFFLtZUnT+mlvM4evA5N
	MxtlZkxXfrrcvTwU23Ypjrj0uo2bpfis5EgCODThZDeIcLYdbWLYex74LaYaLjvKBUNDPlAeEKw3+
	oAY52rrzjqNNJx5XBbK63AhQ4drU/WJGybtbnOYjUt8X8OKufFpqtMAwsBnoCOZvHxqnLagj2Yb5K
	f+w91fgnwHv/8G1jsx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLFF-0067XU-2l;
	Wed, 02 Aug 2023 23:27:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLFB-0067WG-2N;
	Wed, 02 Aug 2023 23:27:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3070061A39;
	Wed,  2 Aug 2023 23:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7D3C433C8;
	Wed,  2 Aug 2023 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691018824;
	bh=dXUKJkIoed37jDapmTPT1iaAXLQDtDHU7xnQ/I2jPX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r36CHzo/3Rel1ZN9XWIqQf01FiFkSXD9cibk6aala4tUTnRnWsLR5rkNltHuJyo8K
	 VXQe6iAhFI525JSKYD4PNa3tje4+23vN4i5GKCxQrTUd5H3UXJhKSJ9L8gaU+4yhRo
	 rn1Pla9y6Qxycb0W1m/ZWcp+7xKFtCJyybL3pYH3U6qnjupxsb9D4IFjtdMZvdzRHl
	 7xLCboZ/auYcUmDMLwcoRNE/cwCaYgDFlMFLPI9eaAmI7kL+GAOdO/2ZFQ1OEyUvDH
	 VUMwPHA2kXg2bNtsEpNgNRON2i09m8alugVvH0zjERT3CXnwVNbBj26SoKUfRd/ACS
	 JmhymbqtDf0dA==
Date: Wed, 2 Aug 2023 19:26:53 -0400
From: Guo Ren <guoren@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <ZMrmPbJYeROizR7u@gmail.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
 <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_162705_864685_9D466C7E 
X-CRM114-Status: GOOD (  28.07  )
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

On Wed, Apr 19, 2023 at 10:42:16AM +0200, Andrew Jones wrote:
> On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:
> > When the SBI STA extension exists we can use it to implement
> > paravirt steal-time support. Fill in the empty pv-time functions
> > with an SBI STA implementation.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/paravirt.c | 56 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 53 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> > index 141dbcc36fa2..5f8d96b919e4 100644
> > --- a/arch/riscv/kernel/paravirt.c
> > +++ b/arch/riscv/kernel/paravirt.c
> > @@ -6,12 +6,21 @@
> >  #define pr_fmt(fmt) "riscv-pv: " fmt
> >  
> >  #include <linux/cpuhotplug.h>
> > +#include <linux/compiler.h>
> > +#include <linux/errno.h>
> >  #include <linux/init.h>
> >  #include <linux/jump_label.h>
> > +#include <linux/kconfig.h>
> > +#include <linux/kernel.h>
> > +#include <linux/percpu-defs.h>
> >  #include <linux/printk.h>
> >  #include <linux/static_call.h>
> >  #include <linux/types.h>
> >  
> > +#include <asm/barrier.h>
> > +#include <asm/page.h>
> > +#include <asm/sbi.h>
> > +
> >  struct static_key paravirt_steal_enabled;
> >  struct static_key paravirt_steal_rq_enabled;
> >  
> > @@ -31,24 +40,65 @@ static int __init parse_no_stealacc(char *arg)
> >  
> >  early_param("no-steal-acc", parse_no_stealacc);
> >  
> > +DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
> > +
> >  static bool __init has_pv_steal_clock(void)
> >  {
> > +	if (sbi_probe_extension(SBI_EXT_STA) > 0) {
> > +		pr_info("SBI STA extension detected\n");
> > +		return true;
> > +	}
> > +
> >  	return false;
> >  }
> >  
> > -static int pv_time_cpu_online(unsigned int cpu)
> > +static int sbi_sta_set_steal_time_shmem(unsigned long lo, unsigned long hi,
> > +					unsigned long flags)
> >  {
> > +	struct sbiret ret;
> > +
> > +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_SET_STEAL_TIME_SHMEM,
> > +			lo, hi, flags, 0, 0, 0);
> > +	if (ret.error) {
> > +		if (lo == -1 && hi == -1)
> > +			pr_warn("Failed to disable steal-time shmem");
> > +		else
> > +			pr_warn("Failed to set steal-time shmem");
> > +		return -ENOMEM;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > +static int pv_time_cpu_online(unsigned int cpu)
> > +{
> > +	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
> > +	phys_addr_t pa = __pa(st);
> > +	unsigned long lo = (unsigned long)pa;
> > +	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
> > +
> > +	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
> > +}
> > +
> >  static int pv_time_cpu_down_prepare(unsigned int cpu)
> >  {
> > -	return 0;
> > +	return sbi_sta_set_steal_time_shmem(-1, -1, 0);
> >  }
> >  
> >  static u64 pv_time_steal_clock(int cpu)
> >  {
> > -	return 0;
> > +	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
> > +	u32 sequence;
> > +	u64 steal;
> > +
> > +	do {
> > +		sequence = st->sequence;
> > +		virt_rmb();
> > +		steal = st->steal;
> > +		virt_rmb();
> > +	} while ((sequence & 1) || (sequence != st->sequence));
> > +
> > +	return steal;
> >  }
> 
> So anybody poking around the implementations for other architectures will
> see that I shamelessly ripped this off from x86's implementation. However,
> looking at it again, I think all the references to the steal-time info
> should be wrapped in READ_ONCE(). I'll write a patch for x86/kvm to
> add READ_ONCE's and also update this patch for rfc-v2.
Hello, what's the status of rfc-v2? The riscv paravirt_qspinlock is
based on your series to reuse the paravirt.c and CONFIG_PARAVIRT.

https://lore.kernel.org/linux-riscv/20230802164701.192791-10-guoren@kernel.org/
https://lore.kernel.org/linux-riscv/20230802164701.192791-17-guoren@kernel.org/

> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
