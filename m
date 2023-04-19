Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A5EC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eI3WYLUphm3yq+asjLhDexGW+UiY3lidVoV8rs/dJs=; b=CND8perhz/gLc5
	NO8/gw9r3pzB7X4hP3P9ElFhqF+yJJA05Ap3qK0zPxiJKOOpg+IenDTBd43XMFT3skDDpOK0SR7TA
	HDY34ov5u9nb1BYADnCrWpAZ7WPTpPyp8+lGHsSIxKjMBnOLqGyC/ZukzJiVErjq83puVd8s6SQOp
	pR7wCPf113YjCsqHoCL2rGldHEb9yWYw+l2HKh8AQ7XguU6fjDIvWTYOsKDgK1GIGmyiED2942FT1
	aaLIssCbp4cDEmlYHxieqofBkKWv/JOJ8M0ENRycT1OTjR0YZ63HVKxyn8PJte9m43NFUThdJ8eLK
	zV11R8b6U/KVyLf9WMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp37C-004anz-25;
	Wed, 19 Apr 2023 08:24:34 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp379-004amK-0r
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 08:24:32 +0000
Received: by mail-ej1-x633.google.com with SMTP id dx24so35501602ejb.11
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681892669; x=1684484669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqFxwBhMWX4PGb2NBrmEW0KCcvXls3BQs2QU86F1owo=;
        b=KjrJtnUNN0HFirOipF1bBwKMFfxFlf3S467A3iMEueRogEFOlZHDjxJmPTJwcAv/vB
         Akv2T/1Bj5wE+CcgTYrm0dYDn63lOzgIhJ3lAm5d2njJa2BFO906YQPIeeK9yjJCimLb
         mnLYKscusklULCodTOIrfR4qmRbubjG8+3GsVu+b3gRHGF3uULmk46W85Xsf1ootRIfZ
         4v6etUYMVNzHiILHbiCfweChJiTfiSge0h/GUHhIfgpEnQLhSAMUXZ3blLAXZmBIYl0l
         u8Mu3G7cYhedyH0BZnMiKf8ftjX0eOwqr50Eb604B8s6dRCXa0zLokYNFNeNBipkbTPq
         mnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892669; x=1684484669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqFxwBhMWX4PGb2NBrmEW0KCcvXls3BQs2QU86F1owo=;
        b=Kh/c3lRBQzG1iQACjjx7g/B3a7W2+tAGygN1rrLQcAw1SrbrQpElqiNb8Sl+Yaqx9v
         IimEkKLW2F5jGIBfQvG2oAJ72EkGOAjM97nTa8gGRhNSYPS2wBP96Iloh4jRsYCqhGrS
         L6S25ocjTCNmGAKSGXQ64rUu+3BIvoU4i+LRfo5Xfu2HGdMnJXkjO1slxu4ry0Zj/xOK
         FXSEF/XqqklSNRLiJRtT+SaBUt3ImHuM1DKi8PGHaeRJXnZgbLB2JoJA8yoQhCZuVcn2
         DOow68dJ6j4FNs+Tf+VMoD1YcDN9cVhR1mS4THpXvZESBTxJVhe+RJvc5bwvlabtd0mM
         QPng==
X-Gm-Message-State: AAQBX9fug1Z6Zo5yU2v6qeXsiXSqUO07XPioOiuMveVoTr1/qeYyF0rl
	CPVRMfR+U78F6E7LMTIHy6gkvw==
X-Google-Smtp-Source: AKy350bTHEx0B4A+hKeWZHdw1PYqxHFZ9IUawyaxdw1U1l5zHfOBJqBwQaDZig9c4gDSbzKQzXxhdA==
X-Received: by 2002:a17:906:2dda:b0:92b:f118:ef32 with SMTP id h26-20020a1709062dda00b0092bf118ef32mr15745725eji.48.1681892669123;
        Wed, 19 Apr 2023 01:24:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id kx13-20020a170907774d00b008e54ac90de1sm9015453ejc.74.2023.04.19.01.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 01:24:28 -0700 (PDT)
Date: Wed, 19 Apr 2023 10:24:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, 'Paul Walmsley ' <paul.walmsley@sifive.com>, 
	'Albert Ou ' <aou@eecs.berkeley.edu>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 
	'Paolo Bonzini ' <pbonzini@redhat.com>, 'Juergen Gross ' <jgross@suse.com>, 
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>, 'Anup Patel ' <anup@brainfault.org>, 
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <stn3ql2b5s6fkfo7udn4dcylyidbayiodfqvccrbgno2vylqwt@bi2ft2lv6crd>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
 <20230418-earthlike-estrogen-a8ca785b382a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418-earthlike-estrogen-a8ca785b382a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_012431_301426_72172499 
X-CRM114-Status: GOOD (  24.20  )
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

On Tue, Apr 18, 2023 at 08:02:06PM +0100, Conor Dooley wrote:
> On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:
> 
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
> 
> I'm not really a fan of this -1s without an explanation of what passing
> -1 to the ecall does.
> 
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
> 
> Call me a bit anal, but should we yoink your:
> | The supervisor-mode software MUST check this field
> | before and after reading the `steal` field, and
> | repeat the read if they are different or odd
> and add it here so that is it immediately obvious without reading the
> SBI spec what is going on here? Or it is a case of "go read the SBI spec
> if you have questions about what the kernel is doing w/ SBI stuff?
> 
> (sidenote, s/they are/it is/?)

Thanks, I updated the spec for its v3 posting. Before posting v3,
I'd be happy to take more comments on it over on its v2 posting.

> 
> Guess both of my comments are in the same vein, but would make
> at-a-glance understanding easier IMO.

I'm inclined to say "go read the spec" for everything, since the KVM
implementation would otherwise also require several comments which
duplicate the spec, but I'm also OK with adding the comments you've
suggested here. I'll do that for rfc-v2.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
