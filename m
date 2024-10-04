Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8572CF34DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 01:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmmuY3mM7ej5dXt0K6OkmuM+8+V589hmlNXWhQdJPOg=; b=jRMKbadAN3lm3l
	7WWt2FE+FbHcj9KMCkFltQ1hNoUmqHnt1y71NgOixl5NfioHwQRwJ10m4F+Le3vh4YoGrngBL2HZm
	evF+4EGg7yN4cgqrEnus9Kz1HdEwC1OctMzlIU1oXNm9pmxcqQhMSnHV5gPKjPPHGiNbi3/a6cxIA
	ZtyfrqkLo6ITFoZOSWSa9lzZFEJ2FStXjxHd8E5BpsjLoQh6ZxDfmznOI9fji61vLsIiw9Z+l+SAm
	4ekTu4rH90RlH6MthOxZ8gxz5kx3K2ofPVszXPcfiZbAGHyzm3NtBEs4orS7K7EMe2ys/SJRrEZqD
	uiz2pTtD/eZuuh9T1YRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swX0J-0000000Ank8-2JzT;
	Fri, 04 Oct 2024 01:21:11 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swX0F-0000000AnjP-25QP
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 01:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728004868; x=1759540868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XAwp1HajigedLWPNyvDA2B/OVsp5lSLx9eQxfxT3RdA=;
  b=MJv+bESAHC6mJ+Gg59Qr1gOI8AuLRmb8UYzMPz6LHyy9vm51rur09eOI
   0ufeoZETIy5TtE6fsSHBReVOpiYHk5H3t6WeQDoguTZFU1JdOQ04AVrgn
   +PRh9YisRiTc8KAO8/Ub6ifzPJuDvCjG1zF/vRwFLwdltnsL6I7yaHmQT
   mdDH3WaIBAvTM4st7nRB2EGWvNAEX8LlswxysPXkhDkv2I+KFnOPUw4r5
   /RDYOuMWNtgejp7lrYHMn2rFDldJpUS1sLHgj74rn1QtrB14YP0BQlqf+
   JR7ePeUvtNi/WWq+b43bzfw4z/yIGSppQjfCeJeMkAD1odv3ItGJExazB
   g==;
X-CSE-ConnectionGUID: 84YPZE0BRU+8x1riyF2bWg==
X-CSE-MsgGUID: DxLvar2VQ0GOz4MYUq4wDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26689240"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="26689240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 18:21:06 -0700
X-CSE-ConnectionGUID: 1PmMfVzDQZqzvxQvcU6udQ==
X-CSE-MsgGUID: fxKs9q26TUComuwqMFdUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74234010"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2024 18:20:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swX04-000160-07;
	Fri, 04 Oct 2024 01:20:56 +0000
Date: Fri, 4 Oct 2024 09:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 22/33] riscv: signal: abstract header saving for
 setup_sigcontext
Message-ID: <202410040912.4TpCD7iU-lkp@intel.com>
References: <20241001-v5_user_cfi_series-v1-22-3ba65b6e550f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001-v5_user_cfi_series-v1-22-3ba65b6e550f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_182107_614460_99DAA54B 
X-CRM114-Status: GOOD (  13.99  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-Intr=
oduce-ARCH_HAS_USER_SHADOW_STACK/20241002-000937
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241001-v5_user_cfi_series-v1-22-=
3ba65b6e550f%40rivosinc.com
patch subject: [PATCH 22/33] riscv: signal: abstract header saving for setu=
p_sigcontext
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20241004=
/202410040912.4TpCD7iU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241004/202410040912.4TpCD7iU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040912.4TpCD7iU-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/signal.c: In function 'save_v_state':
>> arch/riscv/kernel/signal.c:89:9: error: implicit declaration of function=
 'get_cpu_vector_context' [-Wimplicit-function-declaration]
      89 |         get_cpu_vector_context();
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/signal.c:91:9: error: implicit declaration of function=
 'put_cpu_vector_context' [-Wimplicit-function-declaration]
      91 |         put_cpu_vector_context();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c: In function '__restore_v_state':
>> arch/riscv/kernel/signal.c:123:9: error: implicit declaration of functio=
n 'riscv_v_vstate_set_restore'; did you mean 'riscv_v_vstate_restore'? [-Wi=
mplicit-function-declaration]
     123 |         riscv_v_vstate_set_restore(current, regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         riscv_v_vstate_restore


vim +/get_cpu_vector_context +89 arch/riscv/kernel/signal.c

e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   70  =

3fad3080e143f7 Andy Chiu      2024-10-01   71  static long save_v_state(str=
uct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu   2023-06-05   72  {
8ee0b41898fa26 Greentime Hu   2023-06-05   73  	struct __sc_riscv_v_state _=
_user *state;
8ee0b41898fa26 Greentime Hu   2023-06-05   74  	void __user *datap;
8ee0b41898fa26 Greentime Hu   2023-06-05   75  	long err;
8ee0b41898fa26 Greentime Hu   2023-06-05   76  =

3fad3080e143f7 Andy Chiu      2024-10-01   77  	if (!IS_ENABLED(CONFIG_RISC=
V_ISA_V) ||
3fad3080e143f7 Andy Chiu      2024-10-01   78  		!(has_vector() && riscv_v_=
vstate_query(regs)))
3fad3080e143f7 Andy Chiu      2024-10-01   79  		return 0;
3fad3080e143f7 Andy Chiu      2024-10-01   80  =

3fad3080e143f7 Andy Chiu      2024-10-01   81  	/* Place state to the user'=
s signal context spac */
3fad3080e143f7 Andy Chiu      2024-10-01   82  	state =3D (struct __sc_risc=
v_v_state __user *)sc_vec;
8ee0b41898fa26 Greentime Hu   2023-06-05   83  	/* Point datap right after =
the end of __sc_riscv_v_state */
8ee0b41898fa26 Greentime Hu   2023-06-05   84  	datap =3D state + 1;
8ee0b41898fa26 Greentime Hu   2023-06-05   85  =

8ee0b41898fa26 Greentime Hu   2023-06-05   86  	/* datap is designed to be =
16 byte aligned for better performance */
1d20e5d437cfeb Zhongqiu Han   2024-06-20   87  	WARN_ON(!IS_ALIGNED((unsign=
ed long)datap, 16));
8ee0b41898fa26 Greentime Hu   2023-06-05   88  =

7df56cbc27e423 Andy Chiu      2024-01-15  @89  	get_cpu_vector_context();
d6c78f1ca3e8ec Andy Chiu      2024-01-15   90  	riscv_v_vstate_save(&curren=
t->thread.vstate, regs);
7df56cbc27e423 Andy Chiu      2024-01-15  @91  	put_cpu_vector_context();
7df56cbc27e423 Andy Chiu      2024-01-15   92  =

8ee0b41898fa26 Greentime Hu   2023-06-05   93  	/* Copy everything of vstat=
e but datap. */
8ee0b41898fa26 Greentime Hu   2023-06-05   94  	err =3D __copy_to_user(&sta=
te->v_state, &current->thread.vstate,
8ee0b41898fa26 Greentime Hu   2023-06-05   95  			     offsetof(struct __ri=
scv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu   2023-06-05   96  	/* Copy the pointer datap i=
tself. */
869436dae72acf Ben Dooks      2023-11-23   97  	err |=3D __put_user((__forc=
e void *)datap, &state->v_state.datap);
8ee0b41898fa26 Greentime Hu   2023-06-05   98  	/* Copy the whole vector co=
ntent to user space datap. */
8ee0b41898fa26 Greentime Hu   2023-06-05   99  	err |=3D __copy_to_user(dat=
ap, current->thread.vstate.datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu   2023-06-05  100  	if (unlikely(err))
3fad3080e143f7 Andy Chiu      2024-10-01  101  		return -EFAULT;
8ee0b41898fa26 Greentime Hu   2023-06-05  102  =

3fad3080e143f7 Andy Chiu      2024-10-01  103  	/* Only return the size if =
everything has done successfully  */
3fad3080e143f7 Andy Chiu      2024-10-01  104  	return riscv_v_sc_size;
8ee0b41898fa26 Greentime Hu   2023-06-05  105  }
8ee0b41898fa26 Greentime Hu   2023-06-05  106  =

8ee0b41898fa26 Greentime Hu   2023-06-05  107  /*
8ee0b41898fa26 Greentime Hu   2023-06-05  108   * Restore Vector extension =
context from the user's signal frame. This function
8ee0b41898fa26 Greentime Hu   2023-06-05  109   * assumes a valid extension=
 header. So magic and size checking must be done by
8ee0b41898fa26 Greentime Hu   2023-06-05  110   * the caller.
8ee0b41898fa26 Greentime Hu   2023-06-05  111   */
8ee0b41898fa26 Greentime Hu   2023-06-05  112  static long __restore_v_stat=
e(struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu   2023-06-05  113  {
8ee0b41898fa26 Greentime Hu   2023-06-05  114  	long err;
8ee0b41898fa26 Greentime Hu   2023-06-05  115  	struct __sc_riscv_v_state _=
_user *state =3D sc_vec;
8ee0b41898fa26 Greentime Hu   2023-06-05  116  	void __user *datap;
8ee0b41898fa26 Greentime Hu   2023-06-05  117  =

c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03  118  	/*
c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03  119  	 * Mark the vstate as c=
lean prior performing the actual copy,
c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03  120  	 * to avoid getting the=
 vstate incorrectly clobbered by the
c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03  121  	 *  discarded vector st=
ate.
c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03  122  	 */
c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03 @123  	riscv_v_vstate_set_rest=
ore(current, regs);
c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03  124  =

8ee0b41898fa26 Greentime Hu   2023-06-05  125  	/* Copy everything of __sc_=
riscv_v_state except datap. */
8ee0b41898fa26 Greentime Hu   2023-06-05  126  	err =3D __copy_from_user(&c=
urrent->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu   2023-06-05  127  			       offsetof(struct __=
riscv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu   2023-06-05  128  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu   2023-06-05  129  		return err;
8ee0b41898fa26 Greentime Hu   2023-06-05  130  =

8ee0b41898fa26 Greentime Hu   2023-06-05  131  	/* Copy the pointer datap i=
tself. */
8ee0b41898fa26 Greentime Hu   2023-06-05  132  	err =3D __get_user(datap, &=
state->v_state.datap);
8ee0b41898fa26 Greentime Hu   2023-06-05  133  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu   2023-06-05  134  		return err;
8ee0b41898fa26 Greentime Hu   2023-06-05  135  	/*
8ee0b41898fa26 Greentime Hu   2023-06-05  136  	 * Copy the whole vector co=
ntent from user space datap. Use
8ee0b41898fa26 Greentime Hu   2023-06-05  137  	 * copy_from_user to preven=
t information leak.
8ee0b41898fa26 Greentime Hu   2023-06-05  138  	 */
c27fa53b858b4e Bj=F6rn T=F6pel    2024-04-03  139  	return copy_from_user(c=
urrent->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu   2023-06-05  140  }
3fad3080e143f7 Andy Chiu      2024-10-01  141  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
