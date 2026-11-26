Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B013606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1eKHqodg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzgtvDcA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IforSgXumbgnGDqDWfyfQvdsa6BohmetnSVS+px/lmE=; b=1eKHqodg8fdgpWkZQs9TEt0sb8
	dgV6TQ77905U67+GP8CEW4UBPk87KDP6+VdObkDZh34nHWdIXiGxE1th6ar2yJNadJJH9A2mGxQW4
	VjwfUhVzKnLcWg+VRX80PqmaxQbtQ+8lLOKhgTndiiony96WqbWgp7rlcquWGi731TbXpcBRJrZZ+
	Iofi4gdBibTzqaKWr4TZi8Cigu+RX/1z0Rc8kshMIVhGW0Yxb1SG8ZvzSllu4zmc9ldEslA47YEoi
	06ssMOv1FVvOKfT1Wfc1ipxOMl/V4LRAgteFzVe//X3+FB9BOeWAv59yuwMtAQ/HRV1vU1JaO0v1k
	QetV9rHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXWo-0000000Cvlm-2fIr;
	Thu, 26 Nov 2026 11:20:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXVr-0000000Cul1-1GSQ;
	Thu, 26 Nov 2026 11:19:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51F8C62D47;
	Thu, 26 Nov 2026 11:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D211F00A03;
	Thu, 26 Nov 2026 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691977;
	bh=6IUAESVFtsidcpD6OicOHeScwyTIg4rQEjzbtezfzqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PzgtvDcA4yy/D2Uepj3A4ekmgkoMVvK8vCHb6UdANFhGAR3OBnrXkvAS3r9CqvP2I
	 eDmwCIrTD3P98wMkVnY3W85BeGo+ZeBhcoHLlCd12HdFjujk8Zaf5uhR8BV51AOM9P
	 oW6Xtzx0AUymGG49kFi+8vJRbIFAGKIoVzVQwMCXSTZexmCClqXB7irUaJOvnH7AT5
	 H8yglHbC98pbN4quyuAGcNaw3RNs1KOwrdkUjWO3r1r/5ZIYpv9vJVR16CKt6bfdWC
	 KH8ca4HCAeD7eXntGrPQqRIQieHY1E0JUb0HMs7NmNLeElY0r6qD2n6VSHz7fdgu6N
	 3KyI5zsbNkYeQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:45 +0200
Subject: [PATCH RFC v2 32/54] asm-generic: add an empty pageattr.h
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-32-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

linux/pageattr.h includes asm/pageattr.h for the overrides of the CPA
hooks. An architecture that is fine with all the defaults has nothing to
put there.

Add an empty asm-generic/pageattr.h and make it mandatory, so that such an
architecture does not need an empty header of its own.

LoongArch, ARM and powerpc will pick up the asm-generic/pageattr.h when
they switch to the CPA core.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/asm-generic/Kbuild     | 1 +
 include/asm-generic/pageattr.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index b7a388bef6ea..fd9fb2c3260b 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -42,6 +42,7 @@ mandatory-y += mmu_context.h
 mandatory-y += module.h
 mandatory-y += module.lds.h
 mandatory-y += msi.h
+mandatory-y += pageattr.h
 mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += percpu_types.h
diff --git a/include/asm-generic/pageattr.h b/include/asm-generic/pageattr.h
new file mode 100644
index 000000000000..07bf3b0e84a0
--- /dev/null
+++ b/include/asm-generic/pageattr.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_PAGEATTR_H
+#define __ASM_GENERIC_PAGEATTR_H
+
+#endif /* __ASM_GENERIC_PAGEATTR_H */

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
