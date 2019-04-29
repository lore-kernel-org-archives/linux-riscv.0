Return-Path: <SRS0=9XXM=S7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B9EC004C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2019 21:28:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0531217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2019 21:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tfJimpTV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oLhGoXHl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0531217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6m+z4ZzbhaDnaG2XTUm9HkwTIMgzx45h2DFb1TY+UY=; b=tfJimpTVLDCjel
	L2Vm+8KNbb0SU8CkxMP5Jm6dBWqvpEBtj2fSyW/oH2sK2gzNDD1jwdP16J1pvlRrQJbb+BU3GDFlB
	dpcyeUnU9TWtI5CGAIGOX3iq8DUqypQE0FdfVAYTZK5AJAlYrFa81UTPKr7i5cbdRdo4TjpG13UnL
	IXCwjb+Yre8KwAtpzCk4iVDER7eeW8eYYX5ghUHcmzj8QwkoVXtt6zV6molfOh5YbCYC1Zf4/O3lG
	Zm5fU1UKfzAuooxIqXdFrNs3NZmec58+K8pNYGs6LMdi4owzuwljZHzAKfNxHswtAOeLlrMqkh8AH
	FndBUNDnd7qQ+Ova7mfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLDof-0000xI-Oa; Mon, 29 Apr 2019 21:28:01 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLDoc-0000vm-Fy
 for linux-riscv@lists.infradead.org; Mon, 29 Apr 2019 21:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556573279; x=1588109279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tR6tu/boLUZjadiHISW1+7oshhH05ZDXJ3aIDITiz8w=;
 b=oLhGoXHlQ2EjQWL4hJ1b5lrbOirm5wP6rm8fniu1hMTirGX7bS4oNKE9
 ezYJe/dFEVyn37h6QobIHdYIDHmL2m1P3XR0RpaSdg/svBggnYc2GRr3g
 qpCtsUe18bGtbUKRD9nH0LWVCHVb5kij0WtlHIJEK7Frq6h9l8LUdIIZX
 /NhBNBljmi/YqQ1kNJNJRUVyvxQDXsQCE4jy+4LgDItBVCQJue1yrLmOl
 R+4OvKSC5jB6LIy0JVqVLU4kSobS+Ae4ct5LV8mdkBkkCMIiPVjyw8QMi
 XPBbmTEUWO9zjTZ7ay8Bi6pgCJ06UQ0Aqy/KY3jNiIRkwXKB4B9/Gyvqd Q==;
X-IronPort-AV: E=Sophos;i="5.60,411,1549900800"; d="scan'208";a="107107926"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2019 05:27:56 +0800
IronPort-SDR: mSLoDWMfPBCtwjKHzrn6IhLKpF8NdMLqpW63Hqzl+IP+Q6TJiFp8xA98yB3OHPnepgPo50VEpa
 pFELQB3DggG3bqgYHAVaC1DLStrfvCuGl1U4iFXzqZKdPQGIji6jA/KFuzfO4iS3kXXF4kVCCj
 1jX7IxU4Azwa3/AIEm8lq76htWwqCKCWH6aKPLMW1FFtQfTvCR04I5YACoRuBRikpPjoQSgQJI
 16hZ6KymsGy95cZQiDq2GHMlW5mcTSU3Bm3CxXSOL4Gv06wd+RK/s1Rsgf+3ygj1CFxJJRfPBh
 QD+Jhc/5aRkCPqdZId1+QXo6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 29 Apr 2019 14:06:27 -0700
IronPort-SDR: vbYbPQo4JkJT9Bw0pHc9exinGYDWPnbSJXW9OLyStr6Ikua7imsg7WGL9OFLdpmqGZYjTYx4JR
 SlQ0ebyX4o3dktLi0pIW6wZ572FFPS4eEpARRdDJ5E6EgXE9NuAFcgQ6LmSZMAeAsKsw3A1pol
 Z6mvT2BqJX45lL9lr9CS67zyQFTC61d6y2n2mWaugkXK+yxgesD/SEzWnHXi11nISjMimlDbwv
 J+yaXneSbTiDtMFpy97ZI5749qNhEvodmfVdlmVrU50MSSmw2w40zd0YHjYCC3ZZISmvcb5/Ci
 WGc=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Apr 2019 14:27:56 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] x86: Move DEBUG_TLBFLUSH option.
Date: Mon, 29 Apr 2019 14:27:48 -0700
Message-Id: <20190429212750.26165-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429212750.26165-1-atish.patra@wdc.com>
References: <20190429212750.26165-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_142758_600817_C251F87A 
X-CRM114-Status: GOOD (  14.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Changbin Du <changbin.du@intel.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 linux-mm@kvack.org, Atish Patra <atish.patra@wdc.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Vlastimil Babka <vbabka@suse.cz>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-riscv@lists.infradead.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CONFIG_DEBUG_TLBFLUSH was added in

'commit 3df3212f9722 ("x86/tlb: add tlb_flushall_shift knob into debugfs")'
to support tlb_flushall_shift knob. The knob was removed in

'commit e9f4e0a9fe27 ("x86/mm: Rip out complicated, out-of-date, buggy
TLB flushing")'.
However, the debug option was never removed from Kconfig. It was reused
in commit

'9824cf9753ec ("mm: vmstats: tlb flush counters")'
but the commit text was never updated accordingly.

Update the Kconfig option description as per its current usage.

Take this opportunity to make this kconfig option a common option as it
touches the common vmstat code. Introduce another arch specific config
HAVE_ARCH_DEBUG_TLBFLUSH that can be selected to enable this config.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/x86/Kconfig       |  1 +
 arch/x86/Kconfig.debug | 19 -------------------
 mm/Kconfig.debug       | 13 +++++++++++++
 3 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 62fc3fda1a05..4c59f59e9491 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -132,6 +132,7 @@ config X86
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD if X86_64
 	select HAVE_ARCH_VMAP_STACK		if X86_64
 	select HAVE_ARCH_WITHIN_STACK_FRAMES
+	select HAVE_ARCH_DEBUG_TLBFLUSH		if DEBUG_KERNEL
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING		if X86_64
diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 15d0fbe27872..0c8f9931e901 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -124,25 +124,6 @@ config DOUBLEFAULT
 	  option saves about 4k and might cause you much additional grey
 	  hair.
 
-config DEBUG_TLBFLUSH
-	bool "Set upper limit of TLB entries to flush one-by-one"
-	depends on DEBUG_KERNEL
-	---help---
-
-	X86-only for now.
-
-	This option allows the user to tune the amount of TLB entries the
-	kernel flushes one-by-one instead of doing a full TLB flush. In
-	certain situations, the former is cheaper. This is controlled by the
-	tlb_flushall_shift knob under /sys/kernel/debug/x86. If you set it
-	to -1, the code flushes the whole TLB unconditionally. Otherwise,
-	for positive values of it, the kernel will use single TLB entry
-	invalidating instructions according to the following formula:
-
-	flush_entries <= active_tlb_entries / 2^tlb_flushall_shift
-
-	If in doubt, say "N".
-
 config IOMMU_DEBUG
 	bool "Enable IOMMU debugging"
 	depends on GART_IOMMU && DEBUG_KERNEL
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index e3df921208c0..e8622b26f0c2 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -111,3 +111,16 @@ config DEBUG_RODATA_TEST
     depends on STRICT_KERNEL_RWX
     ---help---
       This option enables a testcase for the setting rodata read-only.
+
+config HAVE_ARCH_DEBUG_TLBFLUSH
+	bool
+	depends on DEBUG_KERNEL
+
+config DEBUG_TLBFLUSH
+	bool "Save tlb flush statistics to vmstat"
+	depends on HAVE_ARCH_DEBUG_TLBFLUSH
+	help
+
+	Add tlbflush statistics to vmstat. It is really helpful understand tlbflush
+	performance and behavior. It should be enabled only for debugging purpose
+	by individual architectures explicitly by selecting HAVE_ARCH_DEBUG_TLBFLUSH.
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
