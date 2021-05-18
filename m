Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF236C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 07:22:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2140C61166
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 07:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2140C61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=puJ58Mo3ts8D4bETs38nNg1IVUsGSZaUT48ufm6YCeU=; b=Eh6NsNiWpATUnbv660TUJLjA1
	UnLxzlv08SVi/0e33IhFV/0oNVdmPIcequnY/7MpKr12RQ7sSSL5Ulf7oafOQqHId9/gyO4y/6gl3
	De1ceiiPTRMZoVbeDfM2kJ9SGU3kCM9ZQyCuyP3J3KUA3bKx1MHdny1R6Q8eegH+DNRRWVyZ/WtP2
	HaWwo21J36zZqQ3g6FnvzYfS939H9AJcwnzRK3PrZo3I442TanFAePgJTbC/dEm6eckeA+8CH8iAQ
	zdB8BY1egsEaCcRLPUWJo6rO1NTfgJOu+4V+Ef7qkPbnaxNppVm+WhdeWCsxVFpC0pnISLB+5ANfk
	mmx631mRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liu3u-00HJ94-VL; Tue, 18 May 2021 07:22:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liu2c-00HIcZ-V0; Tue, 18 May 2021 07:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=s1tihprrndNEowLm5YgrQRX3PW5FVP8G7FOcYxdHinY=; b=1qwuK+74M5aQlFCGynHat2DdlL
 +QDNhEyBEau79zOAsd1NJLJdWIVZrlO7HHiVOTYEqGcLKB9vw2A+wmHIJ7lfjfs8o+Rdu0t7hKhF2
 KtbmxBkKAFfH7bvMw9LkaDNx7QDI9V2NlGvAxXpPhlfFrspeBIiFQIOAFGtGSr35JUbwPAgJCtbx3
 biymOEuMJPiT7WnlMQDNvMO9x4G1GECN90aQOyuSxVnb2Uhx6S/fvVh5rK9lMfWLZJe+nYCg9QLBW
 Q4Cy93p7TcX+A7U+QwtDMBwykx5Ni0oqWLRNKHWSGpKpOpywRAjkM/LiC0Fw17RR9cqnM1NgmfeEO
 iH6A6YAQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liu2V-00EP2L-0Y; Tue, 18 May 2021 07:21:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF8D661360;
 Tue, 18 May 2021 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621322474;
 bh=VPlgDYwLzrYfExLKq4qVF51gZCyV282lUs8rNsT8l0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5PwhRMD8bU2CDOmwnKDlaJHdTSqbGy94jnbyid+awVbgoi49NA2qX0lHna9rjEri
 HGWd24NXUy8nAnevipFFL71wTfg1bN5FDkc3mRxx1IA3VUAbMx9rezhrfVwGID5AvI
 i7VzPEd1EEPMRB4/1TBMgP1crvAe2gmJ7u0SLRoizKm8tj72NVPYRq9zQuIsrNCCHl
 tTd86MGJWlGdWWgZZavxtFO02uQ1kMiG5HRg471f+i+y5N+/hXW1MITKC1ZpemNaI3
 5HAuWd5vaYG/xOTSCuiw7I7DLoffN9emLRTI69Z/2qhVahAtWZW8ncGDSX4g4viYtu
 IYdJMq9UlwMnQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v20 2/7] riscv/Kconfig: make direct map manipulation options
 depend on MMU
Date: Tue, 18 May 2021 10:20:29 +0300
Message-Id: <20210518072034.31572-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210518072034.31572-1-rppt@kernel.org>
References: <20210518072034.31572-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_002115_117396_FF2F8D3D 
X-CRM114-Status: GOOD (  13.75  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

ARCH_HAS_SET_DIRECT_MAP and ARCH_HAS_SET_MEMORY configuration options have
no meaning when CONFIG_MMU is disabled and there is no point to enable
them for the nommu case.

Add an explicit dependency on MMU for these options.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..c426e7d20907 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -26,8 +26,8 @@ config RISCV
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_PTE_SPECIAL
-	select ARCH_HAS_SET_DIRECT_MAP
-	select ARCH_HAS_SET_MEMORY
+	select ARCH_HAS_SET_DIRECT_MAP if MMU
+	select ARCH_HAS_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
