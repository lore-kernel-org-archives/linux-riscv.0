Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EDC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfRaaAA2JGZxTyANO2iEtKeMoNHK9OUdlzLRuIPtV+M=; b=lGbu3EZ+HaWH9h
	fQw6YWN5vKQDvMlk93XZo5SnOia0P7S+unoBUhAy/ApdmUOdzcRFryVVYqcsZLRZMamfbm1EpbL3t
	FWV9nLUAc6dhhlL8jTCDIxZOviBuy2X5rTrWu069oZYp1qJphIvtmKo5xK0paDmrVRJAraQmDQMoh
	kt+P83pD6KL8g3zPzUI+w3LSM4G2ZYVTRje3/vHHSL03u6umwiTmCbqSeyp1DtcNOLqrmDs8EyFN6
	LMNgVS0NDp5848z5hwWMiVWBoUt7KdvIGIWz2BDrqFuO4mriPXWEWVLv/yEg7kVx0Z4xHwOSbj+K5
	8VgpI6y2ajPNlerK0NEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjnKd-00000003HHS-2rkF;
	Mon, 11 Mar 2024 21:37:15 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjnKW-00000003HEP-0dRe;
	Mon, 11 Mar 2024 21:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710193028; x=1741729028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7/t73ebbv8sRVNFVm6dXGVP8Cy5gtlrNTZRWv0cey24=;
  b=RZQ+07adTOQ/ErMs+wf882j5eW36hS/hrPXuldSfcMthmOPahDVjJ61Q
   A7fcDotHLdC7pGAVOFXw4AdvQMg1QB6BdsRZLI2EU/2KUVIsMU1YCIT0T
   pRY3z1r8J92zPxPqtWMBiUeC+n2t3pd5wWnOE/WEfE3i/1hVdNBiYR4Gf
   PyOpJ2snrRYjMGJffMzI0PVnUpBYpbqkGPKuzCqGA0q8qfqvS8BGvpYOb
   tvpf8fpZ44M+DQANbfmmy9L9PP8oFx06sw6vWjN72YgeqmiuxNZhSYvF8
   Jd/89R65rmS4SMcvIboIwmW1gAkvoB7bsi4lkFskwlXxuHkGsnpij5mEK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8641372"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8641372"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 14:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11375550"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2024 14:37:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjnKM-0009Tt-0U;
	Mon, 11 Mar 2024 21:36:58 +0000
Date: Tue, 12 Mar 2024 05:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <dongmenglong.8@bytedance.com>, andrii@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, davem@davemloft.net, dsahern@kernel.org,
	dave.hansen@linux.intel.com, x86@kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, quentin@isovalent.com,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 6/9] bpf: tracing: add multi-link support
Message-ID: <202403120515.LMAOyTdG-lkp@intel.com>
References: <20240311093526.1010158-7-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240311093526.1010158-7-dongmenglong.8@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_143708_362092_10D8E8C2 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Menglong,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/bpf-tracing-add-support-to-record-and-check-the-accessed-args/20240311-173954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240311093526.1010158-7-dongmenglong.8%40bytedance.com
patch subject: [PATCH bpf-next v2 6/9] bpf: tracing: add multi-link support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240312/202403120515.LMAOyTdG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120515.LMAOyTdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120515.LMAOyTdG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_tracing_multi_link_release':
>> kernel/bpf/syscall.c:3538:9: error: implicit declaration of function 'bpf_trampoline_multi_unlink_prog'; did you mean 'bpf_trampoline_unlink_prog'? [-Werror=implicit-function-declaration]
    3538 |         bpf_trampoline_multi_unlink_prog(&multi_link->link);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         bpf_trampoline_unlink_prog
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach_multi':
>> kernel/bpf/syscall.c:3815:15: error: implicit declaration of function 'bpf_trampoline_multi_link_prog'; did you mean 'bpf_trampoline_unlink_prog'? [-Werror=implicit-function-declaration]
    3815 |         err = bpf_trampoline_multi_link_prog(&link->link);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               bpf_trampoline_unlink_prog
   cc1: some warnings being treated as errors


vim +3538 kernel/bpf/syscall.c

  3532	
  3533	static void bpf_tracing_multi_link_release(struct bpf_link *link)
  3534	{
  3535		struct bpf_tracing_multi_link *multi_link =
  3536			container_of(link, struct bpf_tracing_multi_link, link.link);
  3537	
> 3538		bpf_trampoline_multi_unlink_prog(&multi_link->link);
  3539		__bpf_tracing_multi_link_release(multi_link);
  3540	}
  3541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
