Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E5EC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pO8R9CMOMonR7R/aeQo4VujlLiuJ4R5uXr10lIXJUjk=; b=pWq8KitRKKoz7s
	r01AGLbQuMMlY8N5YkYq9lQrJhA1PGMLvhLd5x8V9KXnhLq7Zjg9gu1/+3lUL6oFTaaYjIy5ENKGw
	JwB3anuoCTsZ6JOZqhT1P+3GKhW2OPltU3oUDPoPhjWLF6NQsV9/Lf/ohCIwt9Ai8wVBGaBXnkYpK
	0hutf0jhW/k7NqDTcSbOZ2Q6amhWhgvh05AOJCZoM+VtqFwwmc8scJJxb/OnS/e9oawnUDCpxBjdA
	nsU9VFhPds6TxswffmVW5Ktjrv7B9h1XBT3JSBr5lkm9q8Ki9geU3d8pDm1CzykcJFyapHnPKA05m
	XpBgrDaF74Y52Ni8MqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib4c-00000005nWb-3i65;
	Wed, 21 Jan 2026 16:28:50 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib4Z-00000005nW6-2wFM
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 16:28:49 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso36005a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 08:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769012925; x=1769617725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=l6l8+tLptVzgwbbjq/4ENLY5O36C7XoUVMMOWk8Q9T2isAxaJLk0KeQk+Cmaod8/hn
         +2TN3RZErO4ZHUYcD1o2U7CTRKwG5j2MS7xvyodBUeJTNq2XhGl0ALfAjaOIDldbGMDw
         8dIvRmIIhapcncPr8xrMgSLmOVNH6h5SQek6VOHJj5YJHSfHc61Qs+lA7JcdK3ni3ISH
         pwpoH9JHBUkuJl68v6gXC0r+jitT1gMN/ipJh0JGnzLbMkxQLHDiNR2vcpQAWkpyQ8nz
         kVWHkQtIpWnajbQCXMFFI7Bmqg4PRnB7vpWb+qWmtaiPPEKhLBMCPfWCXWU5hXDJbjn3
         DODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012925; x=1769617725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=MFpvqUMXEEDMi0oHWAnYr74A4KG5qOoZSRU5H4YidagHmtXDFSCu28ZNHGQpvaqOWS
         DVIN5SnVqXvhXFLxTFF2XQTQjIKG3606XHT0Xx+33n1bCU3dcs7NTzFmN5GxIz51sROc
         YIKSA6gBBVWrKJbUoqqrg5fzeLvIVauyH1LmUxFV5a9Nc8s0tR9IynMiTxq4AS0BDWhX
         QbsrXpibftN4VrweKkoBSuzDjwIKUyWfNroh7nkEi1LW/zy2LXfivrdponjJvo4kMSNs
         xiT9CWo4L2wF2mUrWOnDsjYEabzxvFjyq5OhXEcLGjkyt/KXXhJpYc9B0UkxRI3bjfW0
         QOBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgo7xUCIPOIROAkHUWRqjglcgFqijmPoic28CUBxDRtSaIwPf9g+wkMW7r975O2wWq7Mv1gw+GeWPsDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0C93prsiJDVpyHRaOSfAe3bsLJlOC1djd20TcASvDP9cNmPqa
	BGCaNPz8M1Gj0HiHjZsOlw94bU7D5DCIjixQvrdrOVIa/c0zpEHC/5SUiTSUyw==
X-Gm-Gg: AZuq6aIm+eYyq2yptu8DoRLe/zrZv9DYhYEAgIsTV2kfRhkswllewfAyjzKrF0aTDsC
	umZFT7rTLkcEfbyWlFjzE1Qn3/1qO9IcesIivkmY3VPZwKYNeJLmrGw5m6+rTsR2njmV3r2oEI9
	qFY15ckoEppuc1aY8jJLLsNQzFO/x/H3SjQfnnnMpC07VqZkH8i3MRH5Z8aNhzPVQaaHS3m3RTA
	ktrqFNB1o1oqmMJALhnwH7OCEdWCHziN2o4wmSWRvTvNlsMfqhA4c9Phb4C0tHvo/QuCu50SsxK
	ZnVWjbLiuqNvMNYZaZy1lr8HjFpMmv0z+14MSKGZ4VLt6Xqpd7P5d3PzCrG4ltFOmQRMxzTNowR
	I+WQzUlVoshdmCmuE1P7U3rAMTd6MHpGUPT8w+4PIfRijZ9CCm42FbaqRSBXOkQJtDnme0TbJRg
	XReWuSjIOqoL5TmD56MxMMMRzKZWMetjnn6mr2rFJ4ARaW9/7oJyp5DgK+ZtoX8U8=
X-Received: by 2002:a05:600c:4fc7:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-48042f7e0e0mr38897745e9.25.1769006884109;
        Wed, 21 Jan 2026 06:48:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm274897235e9.7.2026.01.21.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:48:03 -0800 (PST)
Date: Wed, 21 Jan 2026 14:48:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260121144802.1287ce3e@pumpkin>
In-Reply-To: <20260121102017.539b5531@pumpkin>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
	<20260121102017.539b5531@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_082847_776871_487C70CA 
X-CRM114-Status: GOOD (  25.97  )
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

On Wed, 21 Jan 2026 10:20:17 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 21 Jan 2026 07:50:16 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ryan,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> > [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> > patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> > config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> >   
> > >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> > >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section    
> >   
> 
> When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
> the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
> become real functions.
> 
> Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

Or the code could just use the per-cpu data without disabling preemption.
Usually that isn't a good idea at all, but it can't matter in this case.
Might give a noticeable performance gain, disabling preemption is
non-trivial and/or an atomic operation on some architectures.

If anyone is worried about preemption causing the output be repeated, that
would be (mostly) mitigated by checking that s[1234] haven't changed prior
to writing the new values.
I think a 'not locked at all' compare of two of the four values will
stop everything except two threads doing system calls at the same time
getting the same output from the prng.

The whole thing is very unlikely and there will be much easier ways
to break the prng.
Provided s[1234] are only written with valid values (ie ones which aren't
effectively zero) it will continue generating numbers.

	David


> 
> 	David
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
