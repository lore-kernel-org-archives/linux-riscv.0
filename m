Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ABDC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:11:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E045C6044F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E045C6044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QelQ+CI8uWuIhcxR/IEUA9nWhFK/dHXAdujunc5AEpA=; b=o+CDlGdnPGtC3k
	V5u26WdqJuG6y9W+lLdIZJY6Mc5OOrsbHu0lNwXY/wHoHNNVi7y71c/OaPM87WhwZHfZTL7UvHMoN
	tYMmpEJ40/QEQtL2VZcuL/b3HVlcolxK2EGgpAGIFJMqtUrBO6COeuzdJLLITeu5mm1mUxvTiUeZo
	YMGefC+9a0TAiZGVJUvMq2Go4ytp6vFQ/ehxuE0EY4ELv0wyk5abO/5+DyZ0z+s80ESox7t4zn5lt
	+Jpwyg+dNPuTu3BslY9rSAw5YamCzxG+5cRTqF08YF3sS/U3nu/MVbhzLKmY32KglxOl9NNmTs+Lc
	LFJUH7V+Pv6TH6s6076g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7Hw-005ZEN-85; Tue, 14 Sep 2021 12:11:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7H8-005You-NN; Tue, 14 Sep 2021 12:11:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCDDD60ED8;
 Tue, 14 Sep 2021 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621458;
 bh=6eta5IaVQyecbFieqH1slYSKBR/IBlo0wo4FWcGW+A0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N6PMg+sWDjuXVYOpHuiBJTnlf+P2umXdEtKmIi5OJ2aR2reaLlexXQ+BPFTYvAylb
 FGT0YjQHmGh3dGIlYYmBzqoSD54+cAEAAPF5fpPnUlkdtCjkYsyO2FQH+OngVLu5QW
 zjZ42wCUKiM4AfqGPvzRk2Y4+bmX5oKye50C8ybF71uM5ansUx/KNU37Apfn6nngWT
 N0D+mesAhaqSK9PoTvOGoHT+kyWZdG1kZFSs07USsnr/8n8pDqDGm3ZKGW6urjoJew
 h7lgbd80Wd6mMWq7N2dwW/0FEFfVxaKKW9ogZAu70f1G6C/NobToXYV9OCrPKF7WFc
 ZwWItb/PrKNDg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [RFC PATCH 2/8] x86: add CPU field to struct thread_info
Date: Tue, 14 Sep 2021 14:10:30 +0200
Message-Id: <20210914121036.3975026-3-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051058_860635_9B4250B0 
X-CRM114-Status: GOOD (  10.82  )
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

The CPU field will be moved back into thread_info even when
THREAD_INFO_IN_TASK is enabled, so add it back to x86's definition of
struct thread_info.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/thread_info.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index cf132663c219..ebec69c35e95 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -57,6 +57,9 @@ struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 	u32			status;		/* thread synchronous flags */
+#ifdef CONFIG_SMP
+	u32			cpu;		/* current CPU */
+#endif
 };
 
 #define INIT_THREAD_INFO(tsk)			\
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
