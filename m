Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B039CCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=m7B/HrSKToE4CgNP35AuEI5jt8C79He93SqjzgP6W0c=; b=LrVurHfz78F2gg
	6m1uYZzKA4h3hnBhOBCw7mhmpJQq5ebYcngreUnNOPhW1/UpHY6Sl1jV4qCdUVSO+m3XYpfrKFklB
	ULO1+NHl8tClhrfFH+14CrMyCJkRLJDnR4Oncs/MdOBOVSj/wmiPggHO35Et93nbh9HRHZ0GLo2Jk
	/rii0Qjg2e8+UIG4FNd7+10anWkHykM+81nhAjFu27BV3+Byk31R0DWwzpIUr0FN8NRomBuS0wPZL
	vCb7pQ2RpBERouxsiKtcUTRHEVv1OdmMXY1vIwEQ/BEOe/3kInrFTn5HlBR8/F9GA1GtbTf8K+oJX
	avwA1G7PizcYGq/nAWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIq1-0000000DOet-2csB;
	Mon, 27 Oct 2025 08:44:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpX-0000000DO2n-1bnK;
	Mon, 27 Oct 2025 08:44:00 +0000
Message-ID: <20251027083745.483079889@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=FNPRKTae+LjL38iEukoJJJeJEzdmx+2M9xnDzgu4YJA=;
	b=IcvIXSV9t45rrEEtw03twVZVH+Cf5EExRyy1qZwgGd2Y2K9M7co7XW96jp6EmLrClLh++l
	jr3dOdZVz1fQF1UNp8c66r8mpb686vf7ljbpmrb4etjJUNfu0WZ0tNmwXYxy6Mqvw48chQ
	teHdD8NcqJ5t4brSX2XHKi1D2UTR2iN7lsnmZZ5QHAxZR754VjOvZIWlkyZixDFJBBtlSn
	Um78y/D6hLteYGeICRmVsulOuNKGt4ISc1DU1WFAeDKeAEgUMCqb72WarbJcppE/J9tA40
	R9d2T/O1gaT0zAdoPYZIGb4dytqpU0iVWXNI3iuLN6NYCVVOnAwoWQUxmw21lA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=FNPRKTae+LjL38iEukoJJJeJEzdmx+2M9xnDzgu4YJA=;
	b=Vmmptw8EZHTXIjSgtQJjhgReiceqLlCamqWreAYU9B/vuJ6P+xL9UOF2A8pB7gfIWhGfee
	YyXsaFaxl4ENOxCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V5 06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
References: <20251027083700.573016505@linutronix.de>
MIME-Version: 1.0
Date: Mon, 27 Oct 2025 09:43:52 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014355_591215_5407E72F 
X-CRM114-Status: GOOD (  11.16  )
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

ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:

bool foo(u32 __user *p, u32 val)
{
	scoped_guard(pagefault)
		unsafe_put_user(val, p, efault);
	return true;
efault:
	return false;
}

It ends up leaking the pagefault disable counter in the fault path. clang
at least fails the build.

S390 is not affected for unsafe_*_user() as it uses it's own local label
already, but __get/put_kernel_nofault() lack that.

Rename them to arch_*_kernel_nofault() which makes the generic uaccess
header wrap it with a local label that makes both compilers emit correct
code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/uaccess.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/s390/include/asm/uaccess.h
+++ b/arch/s390/include/asm/uaccess.h
@@ -468,8 +468,8 @@ do {									\
 
 #endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT && CONFIG_CC_HAS_ASM_AOR_FORMAT_FLAGS */
 
-#define __get_kernel_nofault __mvc_kernel_nofault
-#define __put_kernel_nofault __mvc_kernel_nofault
+#define arch_get_kernel_nofault __mvc_kernel_nofault
+#define arch_put_kernel_nofault __mvc_kernel_nofault
 
 void __cmpxchg_user_key_called_with_bad_pointer(void);
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
