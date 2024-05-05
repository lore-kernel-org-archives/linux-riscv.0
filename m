Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E52C4345F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYUvmlruGahry/VTQBXwYcxeY8pL8awslsz1iRtQnrs=; b=vTbQjKijfsSjvi
	90n/pWLMpCBpmVZrF48FWG9ddSXVgnjPnyS7wNmIHKjySrj+HIfLuLKYif3RXsZeFiZMrkl+VQ84H
	nzNEkEBYCDfB565BIT/e7JiWn0SRc5oLNKnlbm4mkvVRRIaJzneR/hcsYP4eV5UzgtaMNauZIi/af
	UBTOOTQXi6X/3PvbYNcgZn4d4pv+dbWACFvAZhEkT6P0b5rDrZ8NMalJc4JgIwkGf2XTdi/kUZTid
	8/T43TDUg8S6+f4PzYqAy/l3fHL6/T69NZQRhsdQGhl9T8AQagp0it6RzwsuVbWkefJdvb99m3AaP
	+mawBCoWEZVSE6aHcY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3don-00000004cVW-0xFK;
	Sun, 05 May 2024 15:30:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3cs7-00000004UQG-2FNa;
	Sun, 05 May 2024 14:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 818A360C4F;
	Sun,  5 May 2024 14:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF5DC4AF67;
	Sun,  5 May 2024 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714919386;
	bh=jltW+mxex+RltLVmEvdEIXvbtM9OL57nIYiRLA2L7XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8RBPZLaWniIrQ3iX1xRzq7LYGRguu4TjAeVU5ImeurmYjKnTMgH7LC1fVS/xPaWG
	 Ei1rxYohyvJ4MvBnrpxNLXXdhHkPuqcjyx1mPgPPT/hmr8EU7DlkiqiMBUgBBwiRfO
	 YGJqd/rv6So6su7wmo1rrAUGVmw+z+TWjSnUQQrxzllurDPeBLUKNx5WhjcSc8GE9+
	 7C5MxR9hNoqJ51TJU+A6sQLEM7Xeu44i9pZBrgUQwNnBdrtHeh9Wv9jfIuM27SN/xQ
	 0BXXwSLIKlwsoHlL6lW14hzPaBfJMAG5xJSM5Uo7xDZ+JvAqnIMimG/VkxiafIgGD6
	 3QLqoThL3dX5Q==
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
Subject: [PATCH v8 17/17] fixup: convert remaining archs: defaults handling
Date: Sun,  5 May 2024 17:26:00 +0300
Message-ID: <20240505142600.2322517-18-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240505142600.2322517-1-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_072947_930944_35AADFE2 
X-CRM114-Status: GOOD (  10.85  )
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

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 mm/execmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/execmem.c b/mm/execmem.c
index f6dc3fabc1ca..0c4b36bc6d10 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -118,7 +118,6 @@ static void __init __execmem_init(void)
 		info->ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
 		info->ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL_EXEC;
 		info->ranges[EXECMEM_DEFAULT].alignment = 1;
-		return;
 	}
 
 	if (!execmem_validate(info))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
