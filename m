Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9C5C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJh3LiD4Mc4mnFyWyZK3NMWnNBomU78K4U8EIJgqNcM=; b=hD8Cmwckg9tFqM
	8nfQ8IPE9MsRoAVsnMx8ngHIDgw/CX9BugNAqpTfE1S47ZLFO5mksz54TWdl2WzkRFgit2KvIAHun
	v7iWuxKEaaCVnJ8aH60ezKg0NVxluY32mqOSBH7fmfED1bPQE9Z+L8E8AZHGSXDqmCbocSDkXil8i
	O3vxQZOW8Rh4Cy6cTny8tqiRei7acUxW56shWxxfL9/vE3Y+FeW5JVZddT5Wdi/jmlMuzPxGZbu7K
	kY817LWNN6XNjV95qpN5kwxSMCGjGnrQyg5E53tJhODx/EFM61J2/WfpwPObbtPyNpLvZBgYtDB2Z
	nGFMy1hOri51EbyjKj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6W-00000001SZ1-465i;
	Tue, 04 Feb 2025 20:01:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMrH-0000000181S-1iFo;
	Tue, 04 Feb 2025 17:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9cP48FhwOS/LMk0h6akqBPktUCXlskOxYu2pQkbZsrI=; b=f7oqf4QA7cXpitqRj0ovRiqFlc
	yfAL9Sr9eUvmCBnqtQY7sJXn9N7kUSyLHjZAWRgmbkf33hHrXTPKQFYbOpmPqWLnKNlyuyzusiXvD
	7isGVTYOjDVTfBvicroBFEeZe5/KAM+8dWtrMehiW3rhuV3CleFMwzGXoiTev8oQzwRPd0qXzNb+c
	vjhtiferBvO032y8cCXDdErBd5wB3dm2AZouTh3+OUi10oMLGHCCiQkjY5WTVYCugEWq/bMeu1z9N
	TOfqZ+3qiNXdKbeCfGDltGa9REaSCMh5QSsD5XMkq327mU82kgzKYEcbOn85TsVftj1sSdTIAgbkf
	jxD/kudA==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMrE-0000000GM5X-0DI9;
	Tue, 04 Feb 2025 17:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690628; x=1770226628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r2iiDiPZOS4/QANoocz7hbq1LBuYUYYysQaiQVX4JUg=;
  b=UxkB6hmdCi7+ILCyMdNoOh9xn4RYjZLedgVTY2PTsSehUmTXn/ndY2h6
   rWAOVs+LM0m/SLZUOivDMZqR/zRFgSSxDjuTY010rk0rUAqHiYELB7uM8
   hYnf9AjRsxOTccRnrwvh9s9VpKy810Zq2XZY/ztI/4jM/IDP3jLV5oku6
   CbOB0KJdbfpkPTTkAwMnyN7pg1+SN9oo2SY/NlUbTvXL7ZxhAu7ejKxMn
   gS918diin6BiHK0sfKqx/BTSzkPiHrYy+fcpBSaHGlmOv25bCwgRZyuXz
   sWeDVB0EP31rRSpqM8JIeHlqtAp9o4FHsJ9a8sC7Rh2dyniZEHPGJUL32
   A==;
X-CSE-ConnectionGUID: MgYdJRj/TlSdR1/855aFCQ==
X-CSE-MsgGUID: /XaAUMDsQ+e/HE+eshLT7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38931050"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38931050"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:04 -0800
X-CSE-ConnectionGUID: F7WrZE34TJC30qp8xAUvrQ==
X-CSE-MsgGUID: 1Ko21FfoQgSOsBU65eanYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866985"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:51 -0800
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
Subject: [PATCH 12/15] x86: Minimal SLAB alignment
Date: Tue,  4 Feb 2025 18:33:53 +0100
Message-ID: <162610a0af3e04e2f42872401461b1d62ec78fbd.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173708_488519_1617A277 
X-CRM114-Status: UNSURE (   6.71  )
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

Adjust x86 minimal SLAB alignment to match KASAN granularity size. In
tag-based mode the size changes to 16 bytes so the value needs to be 4.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/include/asm/kasan.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 8829337a75fa..f7a8d3763615 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -36,6 +36,8 @@
 
 #ifdef CONFIG_KASAN_SW_TAGS
 
+#define ARCH_SLAB_MINALIGN (1ULL << KASAN_GRANULE_SHIFT)
+
 #define __tag_shifted(tag)		FIELD_PREP(GENMASK_ULL(60, 57), tag)
 #define __tag_reset(addr)		(sign_extend64((u64)(addr), 56))
 #define __tag_get(addr)			((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)addr))
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
