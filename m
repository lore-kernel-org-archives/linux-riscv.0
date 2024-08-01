Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DADC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7FRIwffH7+Drp+Uu0dquJg0zuYshmo7SffnbMHPHTc=; b=3lZ9jAur/uMfIt
	WS/EeDb5BIj+ydEMpTNqEISlkbXn9ms3XoQK/aXOArLi8YaF1W9MmaWjKvVCbuA43eVyDkZkityoD
	AnQre7ItQNzB/1GkLmPphUmb6fQ/Qeq7CPUZW5ieGI8Faqq/AmlegBG3ayrFZ24jtV9CsSGmQQB/N
	bOZLfT2vSO2rhUPfNyHXnJ9W7xZBts5LZGK1WDTeDz66MRSFPMQLykGls8Unlr7I09KcmpFobyfFj
	2E74gz+4Y/A837HIIwGO+pSenMNtya30nKgU9o0n+vLT2DGpAEYO8Hc0RqqL/Ee3GI3I3Sa8Oax+s
	dNlS/5u707AhmvRNvu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZPDY-00000003yqe-2cl4;
	Thu, 01 Aug 2024 06:23:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP4R-00000003uJA-2xND;
	Thu, 01 Aug 2024 06:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E980462769;
	Thu,  1 Aug 2024 06:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97316C4AF0E;
	Thu,  1 Aug 2024 06:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492830;
	bh=2z4bHnWIWcvxAiFTLgSYfPcGY4CSFltdU+BtR9hEENA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Krg1nriO+eqnJw/SwdbuG3fCazMoLJlQMveWlRkHWmGKjUeBAV7SPEb3qpYrtisDR
	 zcMTZ9ucUhsZWHm5P0W+e7OwiQbmCzYDNW0O0KB9bpGyPbYgbomgp6evmqSqJK760o
	 G3tlRtfaCIlHRTSAxX+B6jfurNE/P42/ILnPuKFYuvjt2jr3XDTpBGpJgTe69srkyE
	 T7HP4P7RrEbKkHv+Z2WcA38kANShZuYnsFLoO9R+x/ze0wRTfzDScZQnHsTT0bkqEp
	 r3/pInPgL1sn+CE/kAYEoSxGqH/IFD6WOJQ4wImNEhfM2qe3oPpI8DAV+mZ7uJVllq
	 swnBD4lW/yIiw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 26/26] docs: move numa=fake description to kernel-parameters.txt
Date: Thu,  1 Aug 2024 09:08:26 +0300
Message-ID: <20240801060826.559858-27-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_231351_953790_50894A58 
X-CRM114-Status: GOOD (  12.28  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

NUMA emulation can be now enabled on arm64 and riscv in addition to x86.

Move description of numa=fake parameters from x86 documentation of
admin-guide/kernel-parameters.txt

Suggested-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 15 +++++++++++++++
 Documentation/arch/x86/x86_64/boot-options.rst  | 12 ------------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1384c7b59c9..bcdee8984e1f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4123,6 +4123,21 @@
 			Disable NUMA, Only set up a single NUMA node
 			spanning all memory.
 
+	numa=fake=<size>[MG]
+			[KNL, ARM64, RISCV, X86, EARLY]
+			If given as a memory unit, fills all system RAM with
+			nodes of size interleaved over physical nodes.
+
+	numa=fake=<N>
+			[KNL, ARM64, RISCV, X86, EARLY]
+			If given as an integer, fills all system RAM with N
+			fake nodes interleaved over physical nodes.
+
+	numa=fake=<N>U
+			[KNL, ARM64, RISCV, X86, EARLY]
+			If given as an integer followed by 'U', it will
+			divide each physical node into N emulated nodes.
+
 	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
 			NUMA balancing.
 			Allowed values are enable and disable
diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
index 137432d34109..98d4805f0823 100644
--- a/Documentation/arch/x86/x86_64/boot-options.rst
+++ b/Documentation/arch/x86/x86_64/boot-options.rst
@@ -170,18 +170,6 @@ NUMA
     Don't parse the HMAT table for NUMA setup, or soft-reserved memory
     partitioning.
 
-  numa=fake=<size>[MG]
-    If given as a memory unit, fills all system RAM with nodes of
-    size interleaved over physical nodes.
-
-  numa=fake=<N>
-    If given as an integer, fills all system RAM with N fake nodes
-    interleaved over physical nodes.
-
-  numa=fake=<N>U
-    If given as an integer followed by 'U', it will divide each
-    physical node into N emulated nodes.
-
 ACPI
 ====
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
