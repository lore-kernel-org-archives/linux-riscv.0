Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDA7C04FFE
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWa569Spl6eGxd51iOYucP6jjJkdg1FUAKEALKGmaic=; b=dVaOtGYI61HTQW
	AuZiEyTxujQ/AYQkxiWk0LPZ3c9gyGUvkdiPnx4az7TmaGWO1+kp8kcHu0bc1JH9o51Za62uzAxtX
	LOWzq04e0k+1X3OM4ymkBsmrEYhQrsK1LuMIPDCCdYbikl1zMIwC8vibxxTMNcBUDYfCXRVxU2Nkg
	CFFtD+CeHUfp2NJTMi6gqxZApSRCmRujzpMgcRf5gdxgZ2II2KlLs4eXHmoEPeAp5+ebbsVWWS7zm
	jU45bc8JThFChYubr2HZLcqb6PnPA4dqBvouBv0+DpLgXmmaK+D9YVg2yKs2emON5HlhQHVAxRHd+
	248xS4vOZIoOa6ZoR90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3cp6-00000004Rp6-1oQl;
	Sun, 05 May 2024 14:26:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3cp1-00000004Rkn-3Dvt;
	Sun, 05 May 2024 14:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B70B60C88;
	Sun,  5 May 2024 14:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC393C4DDE5;
	Sun,  5 May 2024 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714919193;
	bh=M6QQiy27Yx7cZTOC0617KB9Ln6pKKwikPWIcgenY/bM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NSPh68o6mPYr5fxxFtC2V72LTOuvr3yq8hW9zx6j+MQT2QTIBh9u0UYi6U60wKMQ8
	 4pUcdPzWIOrk786o1LPMCd95D81lUAiJdKTVxj1ZpL+gyGi8qYDPggeL2hw/UDWEMu
	 H8yR71nI/+PlLDzZBqTfTQ1Cie+RG4x5ncIdrHl8Seo9b772nXYthDV76uYlYsxO3e
	 wQYg6gU14o2i3rAa5QG/0f77H7ZldG9qTZa21eZgJY4qTNmIeZTc79JOB4S8iYpY/l
	 0cYrL/tkLY7wSmRuDhM/ExnpEYA0X6qhsgfUjZwCYRm6wHSDtLs/Jy026Jn90UZc9J
	 yhiYIU+MAPqGA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 01/17] arm64: module: remove unneeded call to kasan_alloc_module_shadow()
Date: Sun,  5 May 2024 17:25:44 +0300
Message-ID: <20240505142600.2322517-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240505142600.2322517-1-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_072635_921650_E1BAC1B9 
X-CRM114-Status: GOOD (  11.85  )
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

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Since commit f6f37d9320a1 ("arm64: select KASAN_VMALLOC for SW/HW_TAGS
modes") KASAN_VMALLOC is always enabled when KASAN is on. This means
that allocations in module_alloc() will be tracked by KASAN protection
for vmalloc() and that kasan_alloc_module_shadow() will be always an
empty inline and there is no point in calling it.

Drop meaningless call to kasan_alloc_module_shadow() from
module_alloc().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm64/kernel/module.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 47e0be610bb6..e92da4da1b2a 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -141,11 +141,6 @@ void *module_alloc(unsigned long size)
 				    __func__);
 	}
 
-	if (p && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
-		vfree(p);
-		return NULL;
-	}
-
 	/* Memory is intended to be executable, reset the pointer tag. */
 	return kasan_reset_tag(p);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
