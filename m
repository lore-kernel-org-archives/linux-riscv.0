Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4FBC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scUileXTMcNCqZ9aimD8cTHi8hgq0rXy9ldA8PkFwCE=; b=QBpM+LBPbSbpmg
	yeJxWF5n3bLPjmKZcAd8wv77IZ6iV/4ZegSl6gySmFl4+mVLfyreHI4BURKLhOGgo02aJdC0cpaAA
	mg3ZDABJlv9zX7gQFyXhbWz2SQ344RBTgwBeXODg/x43SNVxjdEx9FIC935fwlWYoF2tr5nrOuH6/
	9D7Nx0yMIPBr09xy1eF6+mYxkfRT0yoFIjMBASx3OVV63kqpBrJEhMXuX58u0JcySS0oRoQNSNI3+
	Kx4VnP22JU8OfO0Y0q1vjad/0apajWkOCxVzH4UPYjVIKmdAiFpzbnxhvhRMh2hcvfOL83Zg/sLqU
	M9QadBE4XYl5BOwmRBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6hZ-005Iys-1a;
	Wed, 19 Apr 2023 12:14:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6hW-005Ixe-1Z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 12:14:19 +0000
Received: by mail-ej1-x631.google.com with SMTP id b16so5821470ejz.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681906457; x=1684498457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zElmKSLaEm4y6zcLoV0rolf8s/f24D5f1KpZgZCUlBA=;
        b=mQCNazD2AatHamZYxHnt2aAHwJE9hs9ddiUE09BvuaQnaPD8voYi/7IAS48k4aj8eq
         4uPfTZW4dLx5N9FIoJOXbiQ4zVwPcSssDx/yMPXuGUkh+HyZ/nPf8AVpAmLIEBG+jPPv
         sVf5DXrywKIpagEzIkcvr/sj/+ycMnNbKHqs+53fCtIm84u4Fjqs2HpRQjioPioTC4/I
         hTmVrE5yzuK4ZDZ6LuSW3D4AGvtP27p+8SrLlc0IpFa3CgJqJLG44EOK3yIk+/0mYup7
         kQAw9xxU7zEZ1rTDNOI7MdJHZPg8rgGOo0pxdnqPe7oBM9ApPBOu5mo/dLI9B1diNpQN
         onMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681906457; x=1684498457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zElmKSLaEm4y6zcLoV0rolf8s/f24D5f1KpZgZCUlBA=;
        b=XP0k7Fta/NAZHEOd9CN3j098rlXrKyES+WAzO3ISN1loB9DrL8Co4WoqXRORnstsAt
         BWOr67eo6+Y/a3la7Ci2hZKhDlPwaCDQ4/siYiMDKRhYUJKuis0bBNeurZIDR4YbHu2a
         CC5tybgO1kL72m4iRvErCHuRzpvr0IoZNkQCmuwIJ3aBUb3lNysuRMa78BGZdu4oRx/B
         A5otCtRa6Y/Ca4kKWQ/PBZrXUdipoccVwe55/NRkvRIG4x+FCOCqhl+ZARKUB9A4Z7+N
         6Y4g22Ri55oWcoHUeufiD1KQazQORDG7yzzJBtzR7d1M8tx0AaoSyXidwXHpBD3bL3Er
         JrVg==
X-Gm-Message-State: AAQBX9eP6VcUfN0/fm9g+aR85tu6y+Ir+/lWrJsXTVLTPn7ZS2lukAqN
	vxrLdmvPhCZ30flbDQ+1iB3TlQ==
X-Google-Smtp-Source: AKy350aMVhuN78nInYSQ13k+okJiSpLRXH4vcOUq6d0TXqWu1+DgjMpUg/SLt18P0MCU+eJK+dvTxg==
X-Received: by 2002:a17:907:4ce:b0:94e:c142:df98 with SMTP id vz14-20020a17090704ce00b0094ec142df98mr11946639ejb.60.1681906456834;
        Wed, 19 Apr 2023 05:14:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id sd27-20020a1709076e1b00b00953381ea1b7sm1380026ejc.90.2023.04.19.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 05:14:16 -0700 (PDT)
Date: Wed, 19 Apr 2023 14:14:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>, 
	'Albert Ou ' <aou@eecs.berkeley.edu>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 
	'Paolo Bonzini ' <pbonzini@redhat.com>, 'Juergen Gross ' <jgross@suse.com>, 
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>, 'Anup Patel ' <anup@brainfault.org>, 
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <jhgx3in3mkv3jrurvwn3jvv2qgg3avb5gdo2wrxto6xzrllhaf@5q4efxh44lqv>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
 <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_051418_526656_3D7E3FBD 
X-CRM114-Status: GOOD (  28.28  )
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
>

After rereading "COMPILER BARRIER" of Documentation/memory-barriers.txt, I
no longer believe we need the READ_ONCE wrappers for x86 nor riscv, unless
we add them "for documentation purposes", as suggested by that section.
The reason is that the virt_rmb() barriers also act as compiler barriers,
which not only ensures program access order, but also "Within a loop,
forces the compiler to load the variables used in that loop's conditional
on each pass through that loop."

That said, my preference would be to add them, though, so I'll at least
add them for riscv for rfc-v2. Maybe I'll still send the x86 patch too.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
