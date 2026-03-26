Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553FA10A1E7D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgY0QVYaiAJiqz1tzcZMiF569BxUw8zSE3azzAU3XCs=; b=4oxd3pCeuq8NdG
	c6NlUPCEg9TlviK8aCvStUevEcUlYFuyIKKf5xct6t266cXvnKhF7CQnd406Li4pMx9Zk7T0VNaCK
	8mPcBYM+tVV39sxaEmpIUHVUnaiqQiznWibhruCV0A6QDeUSGn2BAVnBX7iMxFnYgP4xWE6JGfAEx
	niWpZ1qMxPGBFKPFCju5WiprUoqJ2FpyagnRwD/ZANPMO+QA24c2wv646tRJ+yL6Xzmuhe/TWsiHg
	7qVPg4UtHPn+e98u0OhEy4GvFbhSA368ROG32Yth9qcSdOyfHY4umDNJ91IHstJnYO+NV/nzee0vH
	anTktRgs/xYdC6fkgs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jAY-00000005NY0-0CeF;
	Thu, 26 Mar 2026 11:46:34 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jAV-00000005NXf-1ki5
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 11:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774525591; x=1806061591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ofJzlAWKgixcp4+wTysf5ew1gWizcxE8ZddUuSZ46FE=;
  b=BMt103CBBCF7zYDc97UdIfy550Y/UZpwa/DJ3+f1L79jlddcZU/Ay8c/
   Np1qt/2/A+fdGF7VR0gHV68af6lhuxGUEPvWu6hp/8MZq+h+quLD3LHeJ
   cKZ9Hn6rveMvTeFJkLRqbXjZhCIyPLfMt5vxJvjGzjjLP0QLMFCtZMthI
   FBfZwWjTxxmwka4KgCqroPzEMyByVU3JIwxj/srJqJK6I3BQVxENMY6vE
   NBBULLAK/DqrvGVdenl5CNjbXsMhJlWOZhIvrw3SgQxccbf1vRoc5fWyo
   0mLYaFDxjTmkUNr15YrX+R9zJMagJwy511KQ2Pkpe0vu8PY62nTcrZ9ea
   A==;
X-CSE-ConnectionGUID: tOSiodueR2OR70uG9fFyQQ==
X-CSE-MsgGUID: EhAeirpkSa+RS8SCW32C5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75469570"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75469570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 04:46:29 -0700
X-CSE-ConnectionGUID: ljPFRTexQ8ye6RJur4lN3A==
X-CSE-MsgGUID: AiWrJJphTGGDsFLxII67gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="229052926"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Mar 2026 04:46:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5jAI-000000008oL-3xnO;
	Thu, 26 Mar 2026 11:46:18 +0000
Date: Thu, 26 Mar 2026 19:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v4 08/10] gpu: nova-core: convert falcon registers to
 kernel register macro
Message-ID: <202603261919.gCMgXdPS-lkp@intel.com>
References: <20260325-b4-nova-register-v4-8-bdf172f0f6ca@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325-b4-nova-register-v4-8-bdf172f0f6ca@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_044631_529822_45F7FA6D 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dff8302ca1d0e773c90dbeeb05e759f995c95482]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/gpu-nova-core-introduce-bounded_enum-macro/20260326-064653
base:   dff8302ca1d0e773c90dbeeb05e759f995c95482
patch link:    https://lore.kernel.org/r/20260325-b4-nova-register-v4-8-bdf172f0f6ca%40nvidia.com
patch subject: [PATCH v4 08/10] gpu: nova-core: convert falcon registers to kernel register macro
config: loongarch-randconfig-001-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261919.gCMgXdPS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261919.gCMgXdPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261919.gCMgXdPS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `num::Bounded`
   --> drivers/gpu/nova-core/falcon.rs:24:5
   |
   24 |     num::Bounded,
   |     ^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
