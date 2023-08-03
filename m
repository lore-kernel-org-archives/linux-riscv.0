Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDD6C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRxbp+0cUgz+w8tFKaRGO8fGzvnhsPVgBX+JCuMufec=; b=0tnuEBE2/KkUrU
	Bm3OoatJ8pj8ra7sYzaL9wcYxGw9JFaSiCiqI5W6sxnnmEiWuqqqp6zjn3SLykjlVi6EniYCT8UUb
	u1xzXlqFaPTpYBOQ8KgWabewXrv2cO0C06xMa399ry4BFDze+sxVmi5cci6N4PSP3K4eX6TKAU+24
	AiIhLLXkUUJ/0gRSsvd+EeJnmIa8K20EO/iUp/PQmO4aPVDhTnENB/sB5jzy8m1BZFbO8Mr0epMuf
	eZQFio5sae5u2SIu7xC39nTpftxy2Vp4GYwPPkikYsrmRLrEYHNYOoX4iMKl2xG94NVt+r3xbQVLC
	7OsSHEMa6rv9/dTsJUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSOJ-006pIz-1b;
	Thu, 03 Aug 2023 07:04:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSOF-006pI5-1V
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 07:04:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c1d03e124so73849866b.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 00:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691046292; x=1691651092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d17aiPZ9Woej51FQDiLOCQatt5w2DBo4Zc7i9xeKf7Q=;
        b=I6TQVquGKa4NCSKiBbhi193ywJ8PqvkNX1q7bTl2imm4yQRfG1km+x/MMUXCaQpuQ5
         wFxdw/fHUpvxchHqMBnXKWdDwOsWcNSEQVMjgj2/yzRCFJ3ZfLe4S3efqkNG0uabV7OZ
         sPUjUv0RR5RdOLdawe1X3/wiW0oJ/wSGNVh2juSjmjjSlAYwTbRqM1oXrgd7fXVyXv/o
         nP7QPm6fFB4XqpgtS9NEvxJPvn10ZmLncKhRBscCxk9fxSMfxjtg4RYZPOlgETfKIt+K
         5pOTBeuIDPZQRj//dNHQaSbbEdbAJ1B3al2GxFBFkW22M4Vq1y4audnYHIB5tWx/E/43
         LDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691046292; x=1691651092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d17aiPZ9Woej51FQDiLOCQatt5w2DBo4Zc7i9xeKf7Q=;
        b=gp609QTvOPkEV4DxdR8qq6IdgSk7xW4Jrv4bKHXhKf+lXRBgr4XVHmc68CkH/eeDTF
         OgggaxQbJ6TAAjBFxJsLXitJSxhf38oym1th/kvu4CXRV+HrwCK41dk38jXJLOBInOom
         f9bC7sn+V5iBc8HTem8utGre2iQ5chsD37TTD899SqVXCLq5ZjPk6hWSbSLVNCpn+ztk
         2inpFNifjzPz+SZSZAPNKatS+UPEoGIxNizCM9EN7tDxNfuMWpjgNfJMWF5he5Yazdm5
         Cx8KIrRDqo+50HdaBr5fKLet3lbgc/lXwP3/8JriAao3Yb0YKgtk+mvAVdJ9maOc0lbg
         XYyg==
X-Gm-Message-State: ABy/qLZXaBRWyJ+mTzUM2a9daKFU/W2SnAj0cvzCCnJd71+neZrsRqv+
	j8CvaDH4jY1erXEm0EkPRh1TjQ==
X-Google-Smtp-Source: APBJJlGp16CJoOcNt9mm2VfQedqHJuIRJ1WezfyP7b/DCLrvin01HpEAaH0bEaGjXvm6072AUMJ4FA==
X-Received: by 2002:a17:907:2c78:b0:99c:47a:8bd5 with SMTP id ib24-20020a1709072c7800b0099c047a8bd5mr5989828ejc.65.1691046292184;
        Thu, 03 Aug 2023 00:04:52 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id gy26-20020a170906f25a00b00992b7ff3993sm9988601ejb.126.2023.08.03.00.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:04:51 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:04:50 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, 'Paul Walmsley ' <paul.walmsley@sifive.com>, 
	'Albert Ou ' <aou@eecs.berkeley.edu>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 
	'Paolo Bonzini ' <pbonzini@redhat.com>, 'Juergen Gross ' <jgross@suse.com>, 
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>, 'Anup Patel ' <anup@brainfault.org>, 
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <20230803-61c4bc90486e17560b338272@orel>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
 <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
 <ZMrmPbJYeROizR7u@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMrmPbJYeROizR7u@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_000455_503243_62321475 
X-CRM114-Status: GOOD (  33.98  )
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

On Wed, Aug 02, 2023 at 07:26:53PM -0400, Guo Ren wrote:
> On Wed, Apr 19, 2023 at 10:42:16AM +0200, Andrew Jones wrote:
> > On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:
> > > When the SBI STA extension exists we can use it to implement
> > > paravirt steal-time support. Fill in the empty pv-time functions
> > > with an SBI STA implementation.
> > > 
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/kernel/paravirt.c | 56 ++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 53 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> > > index 141dbcc36fa2..5f8d96b919e4 100644
> > > --- a/arch/riscv/kernel/paravirt.c
> > > +++ b/arch/riscv/kernel/paravirt.c
> > > @@ -6,12 +6,21 @@
> > >  #define pr_fmt(fmt) "riscv-pv: " fmt
> > >  
> > >  #include <linux/cpuhotplug.h>
> > > +#include <linux/compiler.h>
> > > +#include <linux/errno.h>
> > >  #include <linux/init.h>
> > >  #include <linux/jump_label.h>
> > > +#include <linux/kconfig.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/percpu-defs.h>
> > >  #include <linux/printk.h>
> > >  #include <linux/static_call.h>
> > >  #include <linux/types.h>
> > >  
> > > +#include <asm/barrier.h>
> > > +#include <asm/page.h>
> > > +#include <asm/sbi.h>
> > > +
> > >  struct static_key paravirt_steal_enabled;
> > >  struct static_key paravirt_steal_rq_enabled;
> > >  
> > > @@ -31,24 +40,65 @@ static int __init parse_no_stealacc(char *arg)
> > >  
> > >  early_param("no-steal-acc", parse_no_stealacc);
> > >  
> > > +DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
> > > +
> > >  static bool __init has_pv_steal_clock(void)
> > >  {
> > > +	if (sbi_probe_extension(SBI_EXT_STA) > 0) {
> > > +		pr_info("SBI STA extension detected\n");
> > > +		return true;
> > > +	}
> > > +
> > >  	return false;
> > >  }
> > >  
> > > -static int pv_time_cpu_online(unsigned int cpu)
> > > +static int sbi_sta_set_steal_time_shmem(unsigned long lo, unsigned long hi,
> > > +					unsigned long flags)
> > >  {
> > > +	struct sbiret ret;
> > > +
> > > +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_SET_STEAL_TIME_SHMEM,
> > > +			lo, hi, flags, 0, 0, 0);
> > > +	if (ret.error) {
> > > +		if (lo == -1 && hi == -1)
> > > +			pr_warn("Failed to disable steal-time shmem");
> > > +		else
> > > +			pr_warn("Failed to set steal-time shmem");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > +static int pv_time_cpu_online(unsigned int cpu)
> > > +{
> > > +	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
> > > +	phys_addr_t pa = __pa(st);
> > > +	unsigned long lo = (unsigned long)pa;
> > > +	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
> > > +
> > > +	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
> > > +}
> > > +
> > >  static int pv_time_cpu_down_prepare(unsigned int cpu)
> > >  {
> > > -	return 0;
> > > +	return sbi_sta_set_steal_time_shmem(-1, -1, 0);
> > >  }
> > >  
> > >  static u64 pv_time_steal_clock(int cpu)
> > >  {
> > > -	return 0;
> > > +	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
> > > +	u32 sequence;
> > > +	u64 steal;
> > > +
> > > +	do {
> > > +		sequence = st->sequence;
> > > +		virt_rmb();
> > > +		steal = st->steal;
> > > +		virt_rmb();
> > > +	} while ((sequence & 1) || (sequence != st->sequence));
> > > +
> > > +	return steal;
> > >  }
> > 
> > So anybody poking around the implementations for other architectures will
> > see that I shamelessly ripped this off from x86's implementation. However,
> > looking at it again, I think all the references to the steal-time info
> > should be wrapped in READ_ONCE(). I'll write a patch for x86/kvm to
> > add READ_ONCE's and also update this patch for rfc-v2.
> Hello, what's the status of rfc-v2? The riscv paravirt_qspinlock is
> based on your series to reuse the paravirt.c and CONFIG_PARAVIRT.

I prepared it, but then didn't bother posting, since the series has to
stay an RFC and not be merged until the spec is frozen and the changes
were pretty minor (mostly just name changes). The pv_time_steal_clock()
changes described above look like this

static u64 pv_time_steal_clock(int cpu)
{
        struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
        u32 sequence;
        u64 steal;

        /*
         * Check the sequence field before and after reading the steal
         * field. Repeat the read if it is different or odd.
         */
        do {
                sequence = READ_ONCE(st->sequence);
                virt_rmb();
                steal = READ_ONCE(st->steal);
                virt_rmb();
        } while ((le32_to_cpu(sequence) & 1) || sequence != READ_ONCE(st->sequence));

        return le64_to_cpu(steal);
}

> 
> https://lore.kernel.org/linux-riscv/20230802164701.192791-10-guoren@kernel.org/
> https://lore.kernel.org/linux-riscv/20230802164701.192791-17-guoren@kernel.org/

Thanks, I'll take a look at this.

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
