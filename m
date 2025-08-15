Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3C5CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lfKkwmwPw7MgbaxzoQKVC6GjjtfGFcob47yr6SRbQu8=; b=aaHR//8Md5KDFn3j0jRMeytI4F
	kWVfXme8XvoCRAS63xtEnVfLBp+LWFA4sMqn0iicJxeFmlLL6sYe8xgebcDRQZK0OeavAZTr469M3
	UqNjRGmiWGXfTiJ4F+zTT/xY0dV3jmBZ4bX7irMgRa3sW0e49XpBHvuvjRWV21E4DXWMcFrE1izN5
	a2Yzn2hAMR95UqatFOpNVKcYybnNBT3vJLq5XdnMZEposBeEdljkWpfHfym3RDIOTV4JE/ZDf60Mx
	0r5DW/o2nQHPnQ4Qg+vDa1nA8WPOYkjl4ly5ozRQ8NEGS9gT8K6PM0NZtd1fcXyNCXY5h494pohqz
	cUlPKGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyAu-000000036uy-0JWh;
	Fri, 15 Aug 2025 17:25:08 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwiR-00000002t3g-0hKC
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 15:51:40 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b47156acca5so1613475a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755273098; x=1755877898; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLuuQdqXBRGyu60+ieS//bbxP+3AVwFN22YqAdloirM=;
        b=F4mzm3Lxw/Tj8v2La2Id+HmSTCUEITsVpZi32bBnyjpIBebdPlU4fT8Ei1WvnQMSs/
         wmXg2SxAFecEnUZ7KM8IXVTMbq2GJzg7285Mb4HOEr4n7sI79RWP5lDvf/PYweY+jg8f
         Cuc2uaIqyMfettuUw5WngL23J98ptqJE3SpyUIc/Bq0iBw4RXLqXqOpQ7McpdD2Di6KS
         CJZXzbTNgp2BKpDDsIFygBjNp1Li7c67Z1482vnyoYPdrh5nRZXa6lJOmmqqxAIWtuAz
         YDYQfNOqsiEqf4/pSMNnhBkz7EofKh7t9T5Oli6aMbuabLVENjxDJcesVfut1GP9e4LZ
         lMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755273098; x=1755877898;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLuuQdqXBRGyu60+ieS//bbxP+3AVwFN22YqAdloirM=;
        b=dz666FLL7vuxmF7SkXXLkeo4rMv7bZgZlgozoJHU9yqbgFNpio6YTD/TfUBCAmAZim
         pLi2Xbc8M+aNdA8xwq6hz0xtj5Ct+KrYmsWnIFvM0dD8d5lcGphkTXAtwFM1VwZLoiwf
         34QQk2cQGj9Ldw7YVjoVHH+w78kSYpuQ4VcgvdgLPHrh69q8LzRigiWgDOEbJxCMoPvH
         jib2/E37LJqPaq4zaUyxhAAn0uej8EZWzxGwemfs+q3DTOuIX3EMF8SWOFIev8CPouyo
         eHA8ET7rH+SX9wgVxk2GpKU+UFPkGt08ubU0Vk/N+hVB03mT0mBmK/Pxaii4bXlZMTCi
         CtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzw4WWdoYo6Yza/sBL+k3blycHxtDjPNi5YzIw+3ePsqNCad+BMHCWQ4mKAhJEMP5KGP2APAaqcaa/iA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwakU+GkF7y2TUefxCOW7uX4W6MKwyJDmlEjwFpCbzX04Ikci/x
	bxJnnWv7J8iRe8CqrzSNmK9PlkevxMVyXVhZSyWAcDwNZ8zaDoj41QdpmXSVbmLFQO+Ah6Qq56P
	LrJOkXg==
X-Google-Smtp-Source: AGHT+IEixUUF/+ontXG1UvvxuaP113HP3iSlTpnTS0Og0gwZnRo8djp+nSrKI0cvN3mMbDgB4JtBQNij17k=
X-Received: from pjee7.prod.google.com ([2002:a17:90b:5787:b0:321:c2d6:d1c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec3:b0:244:5aa5:a8b
 with SMTP id d9443c01a7336-2445aa50e20mr99042625ad.27.1755273098085; Fri, 15
 Aug 2025 08:51:38 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:51:36 -0700
In-Reply-To: <20250815130436.GA3289052@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815130436.GA3289052@noisy.programming.kicks-ass.net>
Message-ID: <aJ9XiAa58oMs55Ky@google.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_085139_209759_6B25F7EE 
X-CRM114-Status: GOOD (  13.22  )
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

On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> On Wed, Aug 06, 2025 at 12:56:31PM -0700, Sean Christopherson wrote:
> 
> > @@ -2727,6 +2739,21 @@ static struct pmu pmu = {
> >  	.filter			= x86_pmu_filter,
> >  };
> >  
> > +void arch_perf_load_guest_context(unsigned long data)
> > +{
> > +	u32 masked = data & APIC_LVT_MASKED;
> > +
> > +	apic_write(APIC_LVTPC,
> > +		   APIC_DM_FIXED | PERF_GUEST_MEDIATED_PMI_VECTOR | masked);
> > +	this_cpu_write(x86_guest_ctx_loaded, true);
> > +}
> 
> I'm further confused, why would this ever be masked?

The idea is to match the guest's LVTPC state so that KVM doesn't trigger IRQ
VM-Exits on counter overflow when the guest's LVTPC is masked.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
