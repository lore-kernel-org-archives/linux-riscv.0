Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9951AC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH9vHv9cbQ4SXgntHu+iKhqWXYUusyfdZXQr4eQ1U3U=; b=KbKkpLrJst4If5
	zsqNw73I8Dijq8uyhFsSC/h60H8b8imU6AI4fY54Aajy12s7G5lWXufXjRep9jPsHk24rQlCcTlMF
	NmUQ3JjLY5oxP1X9HziVeOI+7jNHM2ooQF+fHJBZIGf6FgstSyUd0gNd5mxBNqIaYIo7maZuecCFu
	DZgOJ1kuc79R3V+RFBH8WXKdMk2wqGH6N1toxbCSVM9nAmPTBvT5tRBjvOxM9ev+rq8VIwWHsc1ZG
	cHlYjXGKpQEWG5NAg6sF9F6HgaVeF1kxrQJ5trHNBkoRfano334sythxLKPrZNbtB292UKdflwgVI
	bPv592XgWCcQ6Kmv9oYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGmbl-00GycE-Lr; Wed, 27 Jul 2022 19:22:13 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGmbg-00GyVP-EZ
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 19:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658949728; x=1690485728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Pg8McF+EQPdh2TTj558H2vAsfexiE1Xr/Yo/q96e0U=;
  b=Zi5Hc/Ui6V9LHpKp7HhEqzir+Al9tPInbiMjEULKZD68dT7WfiAj8Uxl
   VwxfqNyMS/Gyfw955YaljAmBe+eG4z9xg5pZd31V1Yq56hXE9boHltvpf
   EHLJj0EslqMHyIlZ9RDgCyukOgnerWG2Asy70iWL4cQTy/QMuzjZFka0U
   1wSv2R4e7nnXGFOYQPUDHR39d8H/HrIvlZrSfTZxRqql0qm9JURMIkr/U
   Vnx0yAytVAv6Zg/MeeJ+x1iNFJynk/6VCiiNPbLbcbJHT7lsLeP59K/TO
   taYQDYCMUBPs+a3wfZkKVKlQJMcR9WpGUM0EBw3BseadOiNkJOheJnq0u
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268708812"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="268708812"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 12:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="727040177"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jul 2022 12:21:51 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGmbP-00093y-0j;
	Wed, 27 Jul 2022 19:21:51 +0000
Date: Thu, 28 Jul 2022 03:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org, palmer@rivosinc.com, heiko@sntech.de,
	hch@infradead.org, arnd@arndb.de, peterz@infradead.org,
	will@kernel.org, boqun.feng@gmail.com, longman@redhat.com,
	mingo@redhat.com, philipp.tomsich@vrull.eu, cmuellner@linux.com,
	linux-kernel@vger.kernel.org, David.Laight@aculab.com
Cc: kbuild-all@lists.01.org, linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V8 02/10] asm-generic: ticket-lock: Use the same struct
 definitions with qspinlock
Message-ID: <202207280322.pBROaNWs-lkp@intel.com>
References: <20220724122517.1019187-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724122517.1019187-3-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_122208_548467_7BA949A6 
X-CRM114-Status: GOOD (  10.45  )
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

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on linus/master v5.19-rc8 next-20220727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/arch-Add-qspinlock-support-with-combo-style/20220724-202743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
config: riscv-randconfig-s032-20220726 (https://download.01.org/0day-ci/archive/20220728/202207280322.pBROaNWs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e6277b2b8d76d6b4568e4e6f8270d10e8591c383
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review guoren-kernel-org/arch-Add-qspinlock-support-with-combo-style/20220724-202743
        git checkout e6277b2b8d76d6b4568e4e6f8270d10e8591c383
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> kernel/seccomp.c:873:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:873:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:873:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:1371:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1371:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1371:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1383:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1383:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1383:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1812:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/seccomp.c:1812:9: sparse:     expected struct lockdep_map const *lock
   kernel/seccomp.c:1812:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/seccomp.c:1898:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1898:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1898:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1916:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1916:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1916:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:490:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:490:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:490:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:587:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:587:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:587:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:448:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:448:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:448:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:434:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:434:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:434:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:448:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:448:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:448:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:434:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:434:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:434:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/seccomp.c:448:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/seccomp.c:448:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/seccomp.c:448:9: sparse:     got struct qspinlock [noderef] __rcu *
--
   kernel/fork.c:1307:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *_x_ @@     got struct file *new_exe_file @@
   kernel/fork.c:1307:24: sparse:     expected struct file [noderef] __rcu *_x_
   kernel/fork.c:1307:24: sparse:     got struct file *new_exe_file
   kernel/fork.c:1307:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] old_exe_file @@     got struct file [noderef] __rcu * @@
   kernel/fork.c:1307:22: sparse:     expected struct file *[assigned] old_exe_file
   kernel/fork.c:1307:22: sparse:     got struct file [noderef] __rcu *
   kernel/fork.c:1638:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1638:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1638:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1647:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1647:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1647:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1648:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1648:36: sparse:     expected void const *
   kernel/fork.c:1648:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1649:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1649:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1649:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1742:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct qspinlock [usertype] *lock @@     got struct qspinlock [noderef] __rcu * @@
   kernel/fork.c:1742:9: sparse:     expected struct qspinlock [usertype] *lock
   kernel/fork.c:1742:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/fork.c:2061:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2061:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2061:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2065:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2065:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2065:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2385:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2385:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2385:32: sparse:     got struct task_struct *
   kernel/fork.c:2394:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2394:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2394:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2439:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2439:54: sparse:     expected struct list_head *head
   kernel/fork.c:2439:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2460:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2460:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2460:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2481:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2481:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2481:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2508:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2508:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2508:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2537:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2537:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2537:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2539:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2539:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2539:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2975:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2975:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2975:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3056:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3056:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3056:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:2106:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/ftrace.h, include/linux/perf_event.h, include/linux/trace_events.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2437:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2438:59: sparse: sparse: dereference of noderef expression

vim +873 kernel/seccomp.c

8e01b51a31a1e08 YiFei Zhu      2020-10-11  854  
c8bee430dc52cfc Kees Cook      2014-06-27  855  /**
c8bee430dc52cfc Kees Cook      2014-06-27  856   * seccomp_attach_filter: validate and attach filter
c8bee430dc52cfc Kees Cook      2014-06-27  857   * @flags:  flags to change filter behavior
c8bee430dc52cfc Kees Cook      2014-06-27  858   * @filter: seccomp filter to add to the current process
c8bee430dc52cfc Kees Cook      2014-06-27  859   *
dbd952127d11bb4 Kees Cook      2014-06-27  860   * Caller must be holding current->sighand->siglock lock.
dbd952127d11bb4 Kees Cook      2014-06-27  861   *
7a0df7fbc14505e Tycho Andersen 2019-03-06  862   * Returns 0 on success, -ve on error, or
7a0df7fbc14505e Tycho Andersen 2019-03-06  863   *   - in TSYNC mode: the pid of a thread which was either not in the correct
7a0df7fbc14505e Tycho Andersen 2019-03-06  864   *     seccomp mode or did not have an ancestral seccomp filter
7a0df7fbc14505e Tycho Andersen 2019-03-06  865   *   - in NEW_LISTENER mode: the fd of the new listener
c8bee430dc52cfc Kees Cook      2014-06-27  866   */
c8bee430dc52cfc Kees Cook      2014-06-27  867  static long seccomp_attach_filter(unsigned int flags,
c8bee430dc52cfc Kees Cook      2014-06-27  868  				  struct seccomp_filter *filter)
c8bee430dc52cfc Kees Cook      2014-06-27  869  {
c8bee430dc52cfc Kees Cook      2014-06-27  870  	unsigned long total_insns;
c8bee430dc52cfc Kees Cook      2014-06-27  871  	struct seccomp_filter *walker;
c8bee430dc52cfc Kees Cook      2014-06-27  872  
69f6a34bdeea4fe Guenter Roeck  2014-08-10 @873  	assert_spin_locked(&current->sighand->siglock);
dbd952127d11bb4 Kees Cook      2014-06-27  874  
c8bee430dc52cfc Kees Cook      2014-06-27  875  	/* Validate resulting filter length. */
c8bee430dc52cfc Kees Cook      2014-06-27  876  	total_insns = filter->prog->len;
c8bee430dc52cfc Kees Cook      2014-06-27  877  	for (walker = current->seccomp.filter; walker; walker = walker->prev)
c8bee430dc52cfc Kees Cook      2014-06-27  878  		total_insns += walker->prog->len + 4;  /* 4 instr penalty */
c8bee430dc52cfc Kees Cook      2014-06-27  879  	if (total_insns > MAX_INSNS_PER_PATH)
c8bee430dc52cfc Kees Cook      2014-06-27  880  		return -ENOMEM;
c8bee430dc52cfc Kees Cook      2014-06-27  881  
c2e1f2e30daa551 Kees Cook      2014-06-05  882  	/* If thread sync has been requested, check that it is possible. */
c2e1f2e30daa551 Kees Cook      2014-06-05  883  	if (flags & SECCOMP_FILTER_FLAG_TSYNC) {
c2e1f2e30daa551 Kees Cook      2014-06-05  884  		int ret;
c2e1f2e30daa551 Kees Cook      2014-06-05  885  
c2e1f2e30daa551 Kees Cook      2014-06-05  886  		ret = seccomp_can_sync_threads();
51891498f2da78e Tycho Andersen 2020-03-04  887  		if (ret) {
51891498f2da78e Tycho Andersen 2020-03-04  888  			if (flags & SECCOMP_FILTER_FLAG_TSYNC_ESRCH)
51891498f2da78e Tycho Andersen 2020-03-04  889  				return -ESRCH;
51891498f2da78e Tycho Andersen 2020-03-04  890  			else
c2e1f2e30daa551 Kees Cook      2014-06-05  891  				return ret;
c2e1f2e30daa551 Kees Cook      2014-06-05  892  		}
51891498f2da78e Tycho Andersen 2020-03-04  893  	}
c2e1f2e30daa551 Kees Cook      2014-06-05  894  
e66a39977985b1e Tyler Hicks    2017-08-11  895  	/* Set log flag, if present. */
e66a39977985b1e Tyler Hicks    2017-08-11  896  	if (flags & SECCOMP_FILTER_FLAG_LOG)
e66a39977985b1e Tyler Hicks    2017-08-11  897  		filter->log = true;
e66a39977985b1e Tyler Hicks    2017-08-11  898  
c2aa2dfef243efe Sargun Dhillon 2022-05-03  899  	/* Set wait killable flag, if present. */
c2aa2dfef243efe Sargun Dhillon 2022-05-03  900  	if (flags & SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV)
c2aa2dfef243efe Sargun Dhillon 2022-05-03  901  		filter->wait_killable_recv = true;
c2aa2dfef243efe Sargun Dhillon 2022-05-03  902  
c8bee430dc52cfc Kees Cook      2014-06-27  903  	/*
c8bee430dc52cfc Kees Cook      2014-06-27  904  	 * If there is an existing filter, make it the prev and don't drop its
c8bee430dc52cfc Kees Cook      2014-06-27  905  	 * task reference.
c8bee430dc52cfc Kees Cook      2014-06-27  906  	 */
c8bee430dc52cfc Kees Cook      2014-06-27  907  	filter->prev = current->seccomp.filter;
8e01b51a31a1e08 YiFei Zhu      2020-10-11  908  	seccomp_cache_prepare(filter);
c8bee430dc52cfc Kees Cook      2014-06-27  909  	current->seccomp.filter = filter;
c818c03b661cd76 Kees Cook      2020-05-13  910  	atomic_inc(&current->seccomp.filter_count);
c8bee430dc52cfc Kees Cook      2014-06-27  911  
c2e1f2e30daa551 Kees Cook      2014-06-05  912  	/* Now that the new filter is in place, synchronize to all threads. */
c2e1f2e30daa551 Kees Cook      2014-06-05  913  	if (flags & SECCOMP_FILTER_FLAG_TSYNC)
00a02d0c502a06d Kees Cook      2018-05-03  914  		seccomp_sync_threads(flags);
c2e1f2e30daa551 Kees Cook      2014-06-05  915  
c8bee430dc52cfc Kees Cook      2014-06-27  916  	return 0;
e2cfabdfd075648 Will Drewry    2012-04-12  917  }
e2cfabdfd075648 Will Drewry    2012-04-12  918  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
