Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE8D232DF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 05:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F67z7dSN2sMdAwOPYBmY0E5esw/Uf44WsEgPjdp+cAk=; b=zv6zIaLjboT3tP
	hWLM4BMecFTvnsNOrDXXE8+O2547awG73hWVF9qnXQaH2/ORazi1Fg7V5FV9Ts17FNOdAwwNSyIXe
	4tlL3ls9LbTEv/AlExsH1vpHt53DSrXtRV8Fmjmm3LeUKjnGOX2xWlio2BFPBBX+RvSwPVxyBvs4m
	rKQJ26SYxXz+JSmQ4oUjoM0rxerejrBopdp1ECVOZBbGrJAS8w6o7J7sHBh73b3nHGqN8AiKdtdc8
	8chVkedI+iaIXy76Fw6SGNNfmzMGBDnHn1t1tEB7hpWMsWWmxZJ2lG422zol3hTb40NP1S+A6rIIW
	1VOezHiP35JhyVRJ0R2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4n0-00000001OKW-0EK5;
	Fri, 09 Jan 2026 05:11:58 +0000
Received: from relay2.mymailcheap.com ([217.182.66.162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4my-00000001OIh-0C9w
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 05:11:57 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 434793E877;
	Fri,  9 Jan 2026 05:11:46 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 4B996400D4;
	Fri,  9 Jan 2026 05:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1767935504; bh=XUGcHWBeKsSGyKahv/f9EJ/2cAIemFw0hvMY1sSvpLA=;
	h=From:To:Cc:Subject:Date:From;
	b=MKmBQjpfw3rjzq1XIKddnhmvXl4W21WgFm7GKA2WJWuobYtzF5ETYkoBj70Jj8GhW
	 iPZfi6ThuPeUymAoQVr1kVKaGmROIxh/81TWsCWF0z0HTroQu+iKirfg0oJ1YwZ+Jl
	 jyEq0RexZEMVlx7+MKKp8jEhf5OYpr3p7c1h9ZVE=
Received: from Mir.wok.cipunited.com (unknown [130.162.235.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 3DAFC407DF;
	Fri,  9 Jan 2026 05:11:37 +0000 (UTC)
From: Lain Fearyncess Yang <fearyncess@aosc.io>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	"Lain \"Fearyncess\" Yang" <fearyncess@aosc.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] loongarch: wire up memfd_secret system call
Date: Fri,  9 Jan 2026 13:10:51 +0800
Message-ID: <20260109051054.188030-1-fearyncess@aosc.io>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4B996400D4
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[fearyncess.aosc.io:server fail];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_211156_341797_8710ACA2 
X-CRM114-Status: GOOD (  10.50  )
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

From: "Lain \"Fearyncess\" Yang" <fearyncess@aosc.io>

LoongArch supports ARCH_HAS_SET_DIRECT_MAP, therefore wire up the
memfd_secret system call, which depends on it.

Signed-off-by: Lain "Fearyncess" Yang <fearyncess@aosc.io>
---
 arch/loongarch/include/asm/unistd.h     | 1 +
 arch/loongarch/kernel/Makefile.syscalls | 6 +++---
 tools/testing/selftests/mm/Makefile     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/unistd.h b/arch/loongarch/include/asm/unistd.h
index e2c0f3d86c7bd..e7649c1582482 100644
--- a/arch/loongarch/include/asm/unistd.h
+++ b/arch/loongarch/include/asm/unistd.h
@@ -10,5 +10,6 @@
 
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_MEMFD_SECRET
 
 #define NR_syscalls (__NR_syscalls)
diff --git a/arch/loongarch/kernel/Makefile.syscalls b/arch/loongarch/kernel/Makefile.syscalls
index cd46c2b69c7fd..6360381baf931 100644
--- a/arch/loongarch/kernel/Makefile.syscalls
+++ b/arch/loongarch/kernel/Makefile.syscalls
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-# No special ABIs on loongarch so far
-syscall_abis_32 +=
-syscall_abis_64 +=
+# Add memfd_secret explictly for la64 and la32
+syscall_abis_32 += memfd_secret
+syscall_abis_64 += memfd_secret
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index eaf9312097f7b..79582438efc4d 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -72,7 +72,7 @@ TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
-ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64))
+ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64))
 TEST_GEN_FILES += memfd_secret
 endif
 TEST_GEN_FILES += migration
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
