Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF772C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQk6qd+iF6V8tC9SnMkFjKFNDYcAvgQkJ++02YM4Egw=; b=uemXZahwCO7zyv
	YNQ5Ex9x7XXO5h9RgNBSn0c/bR497fZhGiHgXbY0/TQ6ewax7OMHx8UOmoJklZNE2DoVzGqWhKiHc
	l0quUh4fPAwJAMrzxSM2CKBIk7ug8L/aj/WbjeKFpN+z/LJHLRRstAOrUI7oX1x/r0ISXzsRp3rC4
	W9KruUpVAk8mI+zTeGR7Zvgd4xozwAk3m5dax/U3CU3VIvOtGyZw8JSzn/4oHk1iEXzdKk80kIQCu
	/md1g7isCpBvF8CpA6GTBCDSvZTRfoZyUSlxQb6K+H2cjYCTlHoQoFmId50eWfgNE38gESxIyA8ql
	0TArv3lSpytnVd+dXMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqD-000000017Lw-1x9q;
	Tue, 04 Feb 2025 17:36:05 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqA-000000017IT-3WJk;
	Tue, 04 Feb 2025 17:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690563; x=1770226563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PewXt3mq2ZzovNzL7I8Fp3xpOP5/pryHgDbcA5gr/7A=;
  b=Kpt7Oki/BH29+IUz11Gk2Vv+HZLsVTdbAl71awZMdoS5WYrrbXDqVh53
   V+K2DsSI8oZkTLg3OUxpurrXKh72SOT5bkxHo5f4pLY7UEE3V6ts7xc5D
   BiDxzdLvAesTf6XwNgavX/NLgTcVLwUU4fEYPGf1mcXE0eEvbZ/BTVzbU
   uPckAl4hhHlyYXZMjDREq3QxApXakRFXu1GwMlt2QPUk4BnPZg48eHBkJ
   gfF9/8e3Y721P5KruO4rpT5OHWFuP/E0mcm94vaWCwMa1U6uG+EKGQ3rn
   MF5mxDXd9tnv9+9LqmWdtGuh/WCWxYoz05tS+pnGIXKk1WBcuSPWypuOK
   A==;
X-CSE-ConnectionGUID: QE41qNROTei65Ibwqfu1Dg==
X-CSE-MsgGUID: xaTlgVK8SUeqm97vBTcokQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930686"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930686"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:02 -0800
X-CSE-ConnectionGUID: PpX6VWM3RaGBO1JoNfSfGA==
X-CSE-MsgGUID: vYDFTil1TqeMDIrSmNQ1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866647"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:35:50 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 07/15] mm: Pcpu chunk address tag reset
Date: Tue,  4 Feb 2025 18:33:48 +0100
Message-ID: <e7e04692866d02e6d3b32bb43b998e5d17092ba4.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_093602_947419_BC6DF3D4 
X-CRM114-Status: GOOD (  13.98  )
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

The problem presented here is related to NUMA systems and tag-based
KASAN mode. Getting to it can be explained in the following points:

	1. A new chunk is created with pcpu_create_chunk() and
	   vm_structs are allocated. On systems with one NUMA node only
	   one is allocated, but with more NUMA nodes at least a second
	   one will be allocated too.

	2. chunk->base_addr is assigned the modified value of
	   vms[0]->addr and thus inherits the tag of this allocated
	   structure.

	3. In pcpu_alloc() for each possible cpu pcpu_chunk_addr() is
	   executed which calculates per cpu pointers that correspond to
	   the vms structure addresses. The calculations are based on
	   adding an offset from a table to chunk->base_addr.

Here the problem presents itself since for addresses based on vms[1] and
up, the tag will be different than the ones based on vms[0] (base_addr).
The tag mismatch happens and an error is reported.

Reset the base_addr tag, since it will disable tag checks for pointers
derived arithmetically from base_addr that would inherit its tag.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 mm/percpu-vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
index cd69caf6aa8d..e13750d804f7 100644
--- a/mm/percpu-vm.c
+++ b/mm/percpu-vm.c
@@ -347,7 +347,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	}
 
 	chunk->data = vms;
-	chunk->base_addr = vms[0]->addr - pcpu_group_offsets[0];
+	chunk->base_addr = kasan_reset_tag(vms[0]->addr) - pcpu_group_offsets[0];
 
 	pcpu_stats_chunk_alloc();
 	trace_percpu_create_chunk(chunk->base_addr);
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
