Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8E0C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX3MGKp3vLVREl6ADP2VdwblNVHtv3ERR9rnfXR++xQ=; b=4exXB+XFJrBSHTbkEHaNBqUbRG
	HYCe8dXQp3QTfT+IXxV7i9o4e1bTmFDUG/DgqRkMqEBrZiDx3t7RwlJs0Q6aqVoQXS93jZ9qbmpCB
	48kiBZCVHjUZ0lVYts/p3TbAg7wErVDaIPJrm9enWqWsCLF95AvvQEBHAhuDCpoIjz6NwzTOZtIOk
	njjXvcu9479+69Xe0j6vBaDgk5m9bPcyd4ri7d7fmxgKMVzzzGJm/jCPw1ok6wx3bMiTimrENXgde
	rhdL4xLyF0sHjaUd4Lt21lTFSHIUBiWnUQmKxGPawlvQWeo4ikH1+bAZ2utgzEjqz0SrCGQuXq15U
	1ohxmLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRaM-0000000F5w3-3u9f;
	Mon, 28 Jul 2025 17:24:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQrA-0000000EzxW-1vBH
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:37:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-24049d1643aso5263925ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753720658; x=1754325458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5q5M+CpT+5kwmRPJ46tyAoXGVagM73LO6ZWHv96bYmU=;
        b=cA2O5J0jmgIbNwTdaGu5EXE5pY3RqbjbLkIxMdoy5xKgZtDmSuQyovpEQ14Q5bkgRW
         fFmnXYVJrJgXIHCm0EZRoU85QLZHOq9lVAXGa3YGR5JiukVkexQ3CT81OGf9ZR1WGoJ7
         bZ4J6ytqVsFq2UUH9gr/5jHsu+qZyjxcMM27lhRpDRC9j5UwRV3PXTZd+75TxC/1FA6N
         mNpmCJt8KixNcRVOhGPqeUAsTkCb29TTAf7N1ICMsHXh9gHTZz7kNzpFv25JYaWnlPXc
         tq7kb5d5LPYHdIfViXMcfCHPD/hfex2i0DLbssC17Ag6uA9gRmnQzK+s9HoFbS69la5I
         oGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753720659; x=1754325459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5M+CpT+5kwmRPJ46tyAoXGVagM73LO6ZWHv96bYmU=;
        b=oX6K3SOw9Mouo10MfKKZ8Q9bLbI1I1D3Ab8LvykaUE6XX62bqBfjkyVZB5rQrgpkwL
         uPcq4o6g9JYzSzGEZFefZ+k/c6/o0/sMS53vIGFEZSI+DW36fQm+2wjQ/cXEqWV5UwmR
         CISDtFvRmvyU9A2+cGFPkU2Wt+QshRc7ws4hszzIdimFZ5kR/B8Htqs96fl10iph/MUn
         wvx9DvkiYj4uQThI6AfhBx5bKzEGT1uZ4lgVCgjE40/PgJH/rDGdszDOzYJ3dSAnDsnN
         AAvXt49JEdTtHi6UUQyFlnQ5KgTsdoHls0sjluaFUzRGYfS5+mpm07p4SIxPhkCDh1ui
         LHJw==
X-Forwarded-Encrypted: i=1; AJvYcCVp9BZB3XEwk/hEkIqb4aK/rNXWMdV8uY8bUdUKLji+uPXx4Wuxk1Tq6PDIVcAX4nidhMvjdk0gUWLiKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx55PS/4g258C99MtprJReO5K5elmVevsQCrGhivGkdluiU5f7d
	4hlSkeUJ5ZEfWwlJ1Qee8aMbMfFbyDeIZBoCuzZ1YPF7PxLjN+KvbS1a3YUX52bQ4E8=
X-Gm-Gg: ASbGncs4BVr2sHS4erI2V0NAfXH+J/KNKHZMkzloDsnDv5gY7cGMEAfv3cKS/nu8msS
	gzeOAKeqFSSdXi8qfZJN5baUdzyi8MLg7FEnUD2iA2gW/yO0EAHug/UrhHS2hMB8SM009olzsij
	DVOXL3SSsyeGahwwEPE8fRHAUk/XOZPunK1wrE6FatMOytTkWPpJ8q5r+Ugej6ddZhvaiZzGKQB
	F2/62rfQ3wO/HmLo66IC1hNr3/9rarngm2I/fuqi2sfOpvuo+G6t/qlQjNFVMuxWftUAuOm9bAB
	qDLgkna00AOJSP2Xp0creniiJQXmkgEHbGN3A+q+/qUGyt9s+CERrtlxqxUH2F/vQf1uekyf1bi
	OQ6OpyPqcuJ26Q9Jnbic6ypKxf64+JMts
X-Google-Smtp-Source: AGHT+IG8PkXREALt2B41+CkCZk4vD0+tX/pzcMfIzczJ6dwSMXqtKdHnRzA6w8eQHSP6Yq5Aix/U2Q==
X-Received: by 2002:a17:903:1111:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-23fb30cd1f9mr182480625ad.35.1753720658505;
        Mon, 28 Jul 2025 09:37:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ff3ea7547sm40412335ad.149.2025.07.28.09.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:37:37 -0700 (PDT)
Date: Mon, 28 Jul 2025 09:37:34 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Will Deacon <will@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIenTs_D4l414isp@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
 <aIdxUpSc-Co8wLYE@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIdxUpSc-Co8wLYE@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_093744_495534_9BA917E5 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 28, 2025 at 01:47:14PM +0100, Will Deacon wrote:
>On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
>> On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
>> > diff --git a/include/linux/scs.h b/include/linux/scs.h
>> > index 4ab5bdc898cf..6ceee07c2d1a 100644
>> > --- a/include/linux/scs.h
>> > +++ b/include/linux/scs.h
>> > @@ -12,6 +12,7 @@
>> >  #include <linux/poison.h>
>> >  #include <linux/sched.h>
>> >  #include <linux/sizes.h>
>> > +#include <asm/scs.h>
>> >
>> >  #ifdef CONFIG_SHADOW_CALL_STACK
>> >
>> > @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>> >  	 * Reset the shadow stack to the base address in case the task
>> >  	 * is reused.
>> >  	 */
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
>> > +#else
>> >  	task_scs_sp(tsk) = task_scs(tsk);
>> > +#endif
>> >  }
>> >
>> >  static inline unsigned long *__scs_magic(void *s)
>> >  {
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	return (unsigned long *)(s);
>> > +#else
>> >  	return (unsigned long *)(s + SCS_SIZE) - 1;
>> > +#endif
>> >  }
>> >
>> >  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>> >  {
>> >  	unsigned long *magic = __scs_magic(task_scs(tsk));
>> > -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
>> > +	unsigned long sz;
>> > +
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
>> > +#else
>> > +	sz = task_scs_sp(tsk) - task_scs(tsk);
>> > +#endif
>> >
>> >  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>> >  }
>> >
>> > +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
>> > +{
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	arch_scs_store(s, magic_val);
>> > +#else
>> > +	*__scs_magic(s) = magic_val;
>> > +#endif
>> > +}
>> > +
>>
>> I'm not a huge fan of all the ifdefs. We could clean this up by
>> allowing architectures to simply override some these functions, or at
>> least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
>> this?
>
>Yeah, I agree that allowing architectures to provide overrides makes
>sense, however I also suspect that some of this needs to be a runtime
>decision because not all CPUs will support the hardware-accelerated
>feature and will presumably want to fall back on the software
>implementation.

Hmm runtime fallback is an important point. Thanks. I'll munch on it a
bit.

>
>Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
