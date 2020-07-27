Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03076C433E8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 16:31:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8842075A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 16:31:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FFG2R+tm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtM0Agb5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8842075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2ZFKQpCmIj8hsCOeVrlAiXKTaXq4SrFQclYJoVAHg+c=; b=FFG2R+tm5dEv0Ypk4f42RuzRK
	XWCOvbTryxp+8uJC2qscrqSUaLwKevI8IF+p2nUQsWx7JwtOTmFaMZ5K74rF5rVWVvlDQbgUFnMBi
	bA/1gu9GIyiaVP3+qGH21XG4NGmC58R4fb/HkSxgKy6Zk79JLRD8zK+B4la94eTA7RZ6w4KI5FB7o
	Xl3lz+8NJRFqI2C+qjismztwJjIiUNyLU1KlvJsCFaosgcQVmvtm6LlLUE/wbyAQsRpl0Gfpg9Iaz
	XZMoBsU7S5CoOB/hdApqLGUbSnfdSMRSw4p3V/Ws2NdgWFRzlzrUwZ7/lND3cYOhcFZlp2K4RQdTL
	pnv5/qj6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k062I-0007ZM-T2; Mon, 27 Jul 2020 16:31:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k061Y-0007Cn-3N; Mon, 27 Jul 2020 16:30:49 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 286AF2074F;
 Mon, 27 Jul 2020 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595867447;
 bh=/Qw/NeLTpR/6aCJ04huD3Mp72u1Bfe6uWLUqSL0Zn2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KtM0Agb5HnPUkY+CbqIdR37o127nhQKSy5Dq+iFtbhAZ5rXOrCF/TCi/y9dVBPJgG
 ESLcg0dYR67EEDk5MwOpPeS2zHrUXad+3m3RPRP3kklfQeu9q9pdGF6IS3dzaGLPnI
 xswjDrT4XhuX8HarB2l6OUZFzMfxbAPY98Qdg+hQ=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] mm: secretmem: add ability to reserve memory at boot
Date: Mon, 27 Jul 2020 19:29:35 +0300
Message-Id: <20200727162935.31714-8-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727162935.31714-1-rppt@kernel.org>
References: <20200727162935.31714-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_123048_336049_8A7C4F62 
X-CRM114-Status: GOOD (  16.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Taking pages out from the direct map and bringing them back may create
undesired fragmentation and usage of the smaller pages in the direct
mapping of the physical memory.

This can be avoided if a significantly large area of the physical memory
would be reserved for secretmem purposes at boot time.

Add ability to reserve physical memory for secretmem at boot time using
"secretmem" kernel parameter and then use that reserved memory as a global
pool for secret memory needs.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb95fad81c79..6f3c2f28160f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4548,6 +4548,10 @@
 			Format: integer between 0 and 10
 			Default is 0.
 
+	secretmem=n[KMG]
+			[KNL,BOOT] Reserve specified amount of memory to
+			back mappings of secret memory.
+
 	skew_tick=	[KNL] Offset the periodic timer tick per cpu to mitigate
 			xtime_lock contention on larger systems, and/or RCU lock
 			contention on all systems with CONFIG_MAXSMP set.
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
