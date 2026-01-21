Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493C6C4450D
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 11:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwRIsLAHpFNTon8FOIVeU4EvhnJ80MQLe9nLxAYuz4c=; b=X8lKo+4XKoq6Em
	K2zlI2x0q/M0W94OKPOzTrsvMZ4U21wDdvyQjk8ImZT1iOSvrMWUHGuPWaNrWzAjrqeP20WPO1BEU
	Bdv9PJvit0ONOxvPk+9QNvlN9+r8Sz30d8dBFHIHUISKz062nE3sFioRsSWXDVlnfWGE4cK9RVM6K
	w8dwDS+lmcdYcM9QW4Sz3AmPynmpYZ6fCFzRlOfDJ9Lov8Ovy4mm3K4myJzoL0kzJMS4EeppCVLqY
	o/4vzfie6yY/SeRWx5Esat0StIFogarTABhSXRVfPQbV03VZeIW1sQSdK0HUv8ACs49qoiRt2M5fv
	UKXQ/HTM+S1Mp9JqFtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWqU-00000005NQd-2CJH;
	Wed, 21 Jan 2026 11:57:58 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWqR-00000005NQC-1Ph2
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 11:57:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59dd4b602bfso363466e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 03:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768996673; x=1769601473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=j948YR8uXO6CUjLJMSmhj8B7LsYbHptyMtcbtAtT2wwEI5/YGLmzwZlN5b6kL0MTf8
         YvlOaazJVJAqfRCnUFxh2CP3mUwfrUZ91M+vp+hTxOO47MB7oLMgsgjDl5PmgXOa5l8N
         giEdXvn0UOn9qICqUIsaTiivY3mxqGfiokweDshaBUKV+sNafiXODIAopjMVVXHuu2K3
         zq7KTfD18COdhvdcjpB1fPbPOMtKRyub/TZLIDcmRdKbmYFBdnK6pp06yDaKQ39GczSM
         7gtDXUdlluUf74MpPKdFirGYlORqgvOGvvUKf0SssviETTHWoG9CepiQ1NDlTWaraGwi
         Ctag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768996673; x=1769601473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=a/8OAi9XqOef3xTXpZjYRbf/RiY8gwFCVOdIxYVGkb/86s7GG4jFO4L3gqbqQiMYDM
         zie6R5K65W/mGH1MK75eaFoykMncjaP7yIFzJ5tKdDo4miKc8TZ3jko/jHcYUn5Uzg2K
         oaaj08HR62Zc8FccdNF8QVe7tL1nwz+bES7jzPFyDKpwDPTEZoMyf7rz6LwPghmGnz/A
         hhUqZTDj9+9vO92KAjWeM2BKwQon48vrHUefFArEn0UCLJ89laRzlI7gCRiDSHtVxjls
         YruofvlDWiUriRyRrEDNIEy1bTlvVhohW6BzTInY2Sg7QqzLjIxwEW+GwLz2KW4lMcCo
         EFkw==
X-Forwarded-Encrypted: i=1; AJvYcCX0bVrcWuqXAj5uxM77CbT5MqC6KpHsOtjx63hTbLanUk7xlrfTP3dkQ7++aOoSK00IphLaHQ42NwCkDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPSdzaA3VIdRH2u6U1xutgx3+rWcN28CZ4HbAMbRMvX+mhgosb
	+2aLk9KVteU8/gwINUXahri9BPRBlU5eg4hVcP88/IFKhElqZVdPIv0IXtHVMA==
X-Gm-Gg: AZuq6aLH7Q2KhbDg/L2BN0snO1vo7t+qVVS/7ThKWPu7WBqOoZ4UqaPUNHQNOYZFmvx
	csJ49X3bUPoRUPJZP0CvaDjti6cD/SaGMjT6UfyYqwC6lhondACoez92g3vAr+kR5ebWtSZMFvP
	beiy8OBXDMWDzJAvDmC6lN/Por6y1GEWRH1PdyFnYXAJ3Pnfj8to98vZYzRA6FYkQnDJfym54L+
	VSmuiArDkIKyXa3/bLsrlLjhXrIhfVHTDW0xiFSWO71LkLhiuZcl9++txB/VbEW+9q3YDQsBdGT
	jdx//4+a24fxNWl5KjsTiShEOxC1LCHn+SccL7N+U+EXtXPvfql/7j7Iu06v1j/HGd34jqpy7ra
	P2uREJRHB+uA+nBB1fh8Esd/xT/AhZgek7SPr34StRq7mA0UtMKi5d1LpL99ZL6s/1g0mfeiiio
	J7SJ6rZCDo9Ay7aHpQyfV610b1T59RXpfw/ETLvafaUrmaRIzJjizX
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr238692885e9.1.1768990819461;
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm306630785e9.14.2026.01.21.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Date: Wed, 21 Jan 2026 10:20:17 +0000
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
Message-ID: <20260121102017.539b5531@pumpkin>
In-Reply-To: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_035755_402404_41ABB78D 
X-CRM114-Status: GOOD (  17.34  )
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

On Wed, 21 Jan 2026 07:50:16 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section  
> 

When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
become real functions.

Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
