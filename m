Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06A1CA1005
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 01:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6GZ9eUKPi5TGbNL80bUciNzybwgxDeLuZZ6Ul+el0c=; b=D1MowksK+MWqZY
	8MX75RQRR4nGBFdibcLFpI2ngpt9XQaZtC+YokwWvjHm1lH7QJRhlTFqd/hTL8R2ezvKCDYywxqlw
	pZVhywawHeHoGNiyI7JKEcD/JlJb30ZiDn3OcAGlGUvUuZDirHurvwU1MUy/OQMEIChbWLzexJjDA
	DRmPOgpSYXQNhnn6ZTFUjBlGb1vqh07rDOe7h2vhh6Gq3F22rOUVXo7ymC57LAuqMroMb66STDt2R
	SenuoLbM5kAElNXWLZC5yYgvRelDIXqw/XAMgN8vN6PLIAKnVmsAoBw1cW7r2+coT96n9t7eswXVy
	f8GPKp1nc/JW4K3zP4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbxc-00000002z3x-0Sk1;
	Wed, 03 Sep 2025 01:06:52 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbxY-00000002z1J-29B3
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 01:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756861608; x=1788397608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ILyNxnX+zaviW9yPGTfGQQ78ljmYIOmhsBQzVdhrdR4=;
  b=nvgwxExl2QpQ7LeXxlGkoFxhW5BIGah+3r4SbB1uJIkJAH7+Gfwyrb2T
   DzA9bjNSBGXeRc/h4Ccea+efw0L2ASmOZ0Dt0Rr8+9lKKb836nSFqrHrs
   apQExf3FmuKUqOa8XdhzxfcxI7IgQSbORi9Y6aMvJpNZW2pZADCu9pw0F
   O/glCcjAGcaPkmq/sJKguaZVT0ppdM0XpzwTbdz/X2tq4lG27jxAaQtGi
   cS+NQm0d0YnRgqoy3E9LrvRGixpl7SDdoBQYG1O+Jl6E8UluQLKz8IRLq
   7Nyr14fNmXCQ3f+twx6unHcN33YFLqNJxDMGB0Mp2Kep39NoyBlduYljQ
   Q==;
X-CSE-ConnectionGUID: 1gV+AcfSTpmdmexs9mrAVw==
X-CSE-MsgGUID: LI06w8j7SlakUouAKnpKcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76764094"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="76764094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 18:06:47 -0700
X-CSE-ConnectionGUID: xW6JH8z7Tya6Zg9i3ibbzw==
X-CSE-MsgGUID: f/DzJgRLQ2q2c/PrXY15zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="176698876"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2025 18:06:43 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utbxM-0003DH-16;
	Wed, 03 Sep 2025 01:06:38 +0000
Date: Wed, 3 Sep 2025 09:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	apw@canonical.com, joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: [PATCH v2 4/4] riscv: Use Zalasr for
 smp_load_acquire/smp_store_release
Message-ID: <202509030832.0uHQ24ec-lkp@intel.com>
References: <20250902042432.78960-5-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902042432.78960-5-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_180648_614189_61C4C8AE 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Xu,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Lu/riscv-add-ISA-extension-parsing-for-Zalasr/20250902-123357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250902042432.78960-5-luxu.kernel%40bytedance.com
patch subject: [PATCH v2 4/4] riscv: Use Zalasr for smp_load_acquire/smp_store_release
config: riscv-randconfig-002-20250903 (https://download.01.org/0day-ci/archive/20250903/202509030832.0uHQ24ec-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030832.0uHQ24ec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030832.0uHQ24ec-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
   include/linux/list.h: In function 'list_empty_careful':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:409:27: note: in expansion of macro 'smp_load_acquire'
     409 |  struct list_head *next = smp_load_acquire(&head->next);
         |                           ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:409:27: note: in expansion of macro 'smp_load_acquire'
     409 |  struct list_head *next = smp_load_acquire(&head->next);
         |                           ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:409:27: note: in expansion of macro 'smp_load_acquire'
     409 |  struct list_head *next = smp_load_acquire(&head->next);
         |                           ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:409:27: note: in expansion of macro 'smp_load_acquire'
     409 |  struct list_head *next = smp_load_acquire(&head->next);
         |                           ^~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_read_acquire':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:479:9: note: in expansion of macro 'smp_load_acquire'
     479 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:479:9: note: in expansion of macro 'smp_load_acquire'
     479 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:479:9: note: in expansion of macro 'smp_load_acquire'
     479 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:479:9: note: in expansion of macro 'smp_load_acquire'
     479 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic64_read_acquire':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2605:9: note: in expansion of macro 'smp_load_acquire'
    2605 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2605:9: note: in expansion of macro 'smp_load_acquire'
    2605 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2605:9: note: in expansion of macro 'smp_load_acquire'
    2605 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2605:9: note: in expansion of macro 'smp_load_acquire'
    2605 |   ret = smp_load_acquire(&(v)->counter);
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_sequence':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:211:9: note: in expansion of macro 'smp_load_acquire'
     211 |  return smp_load_acquire(&s->sequence);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:211:9: note: in expansion of macro 'smp_load_acquire'
     211 |  return smp_load_acquire(&s->sequence);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:211:9: note: in expansion of macro 'smp_load_acquire'
     211 |  return smp_load_acquire(&s->sequence);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:211:9: note: in expansion of macro 'smp_load_acquire'
     211 |  return smp_load_acquire(&s->sequence);
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_raw_spinlock_sequence':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:226:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_spinlock_sequence':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:227:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_rwlock_sequence':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:228:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h: In function '__seqprop_mutex_sequence':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:160:17: note: in expansion of macro 'smp_load_acquire'
     160 |  unsigned seq = smp_load_acquire(&s->seqcount.sequence);  \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:173:9: note: in expansion of macro 'smp_load_acquire'
     173 |   seq = smp_load_acquire(&s->seqcount.sequence);  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:229:1: note: in expansion of macro 'SEQCOUNT_LOCKNAME'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
   include/linux/key.h: In function 'key_read_state':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/key.h:459:9: note: in expansion of macro 'smp_load_acquire'
     459 |  return smp_load_acquire(&key->state);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/key.h:459:9: note: in expansion of macro 'smp_load_acquire'
     459 |  return smp_load_acquire(&key->state);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/key.h:459:9: note: in expansion of macro 'smp_load_acquire'
     459 |  return smp_load_acquire(&key->state);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/key.h:459:9: note: in expansion of macro 'smp_load_acquire'
     459 |  return smp_load_acquire(&key->state);
         |         ^~~~~~~~~~~~~~~~
   include/linux/fs.h: In function 'i_size_read':
>> arch/riscv/include/asm/barrier.h:96:3: error: read-only variable 'val' used as 'asm' output
      96 |   asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/fs.h:988:9: note: in expansion of macro 'smp_load_acquire'
     988 |  return smp_load_acquire(&inode->i_size);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:102:3: error: read-only variable 'val' used as 'asm' output
     102 |   asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/fs.h:988:9: note: in expansion of macro 'smp_load_acquire'
     988 |  return smp_load_acquire(&inode->i_size);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:108:3: error: read-only variable 'val' used as 'asm' output
     108 |   asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/fs.h:988:9: note: in expansion of macro 'smp_load_acquire'
     988 |  return smp_load_acquire(&inode->i_size);
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/barrier.h:114:3: error: read-only variable 'val' used as 'asm' output
     114 |   asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n", \
         |   ^~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/fs.h:988:9: note: in expansion of macro 'smp_load_acquire'
     988 |  return smp_load_acquire(&inode->i_size);
         |         ^~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=1073380763
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=1073380763
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1073380763
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1073380763
   make: Target 'prepare' not remade because of errors.


vim +96 arch/riscv/include/asm/barrier.h

    89	
    90	#define __smp_load_acquire(p)							\
    91	({										\
    92		TYPEOF_UNQUAL(*p) val;							\
    93		compiletime_assert_atomic_type(*p);					\
    94		switch (sizeof(*p)) {							\
    95		case 1:									\
  > 96			asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n",	\
    97						 LB_AQ(%0, %1) "\t\nnop\t\n",		\
    98						 0, RISCV_ISA_EXT_ZALASR, 1)		\
    99						 : "=r" (val) : "r" (p) : "memory");	\
   100			break;								\
   101		case 2:									\
   102			asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n",	\
   103						 LH_AQ(%0, %1) "\t\nnop\t\n",		\
   104						 0, RISCV_ISA_EXT_ZALASR, 1)		\
   105						 : "=r" (val) : "r" (p) : "memory");	\
   106			break;								\
   107		case 4:									\
   108			asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n",	\
   109						 LW_AQ(%0, %1) "\t\nnop\t\n",		\
   110						 0, RISCV_ISA_EXT_ZALASR, 1)		\
   111						 : "=r" (val) : "r" (p) : "memory");	\
   112			break;								\
   113		case 8:									\
   114			asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n",	\
   115						 LD_AQ(%0, %1) "\t\nnop\t\n",		\
   116						 0, RISCV_ISA_EXT_ZALASR, 1)		\
   117						 : "=r" (val) : "r" (p) : "memory");	\
   118			break;								\
   119		default:								\
   120			__bad_size_call_parameter();					\
   121			break;								\
   122		}									\
   123		val;									\
   124	})
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
