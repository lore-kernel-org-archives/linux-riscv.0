Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630CFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A876103B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28A876103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bikxKL571DJ0dm3MOCRQSwsKncgdnxlk/gD8YEkS4SE=; b=YvkvXTZ4SPdR+B
	EwRBmiHdyEnU5W2Y2au1EubsM+miaEh32yflUhUU0ffzx9CnAztVhY7lUqL6kKXPtmWoH0AJO7A9l
	ii13N/bOWhKutCN/5S6lgTUvBL9SA0xmXZ/0N/94NkxKbiBSkSJaaAKCeP0nt21Cf4qMEl/TEOtYf
	KIe+xl/JjzDoQbKdeg+cqPcG3D57TVWg+Gi24GOOwOQ63C/XmBbhPbBHw4JYHBci5RPtaZx4zSyAS
	CjIiHXhlUTpSMADQP23v/umGkp46TDo+hN9k6ZN5MKv549SuaP+eEao9SvANvS8118ekPAY9v413W
	qExq+H4VRiHWdmQ4FZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7IP-005ZTu-Hq; Tue, 14 Sep 2021 12:12:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7HE-005Yr6-Nl; Tue, 14 Sep 2021 12:11:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAEC26113E;
 Tue, 14 Sep 2021 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621464;
 bh=wUEIWjCdyHLOP9Ajpbl5z4Hb5g6osFdwVI9Ed8pwrF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uo9xo1sSKmZ71oRJaftwe86egJ4+rak5RockonFicTeMsL5SQcQBsjVQllEHp2n5s
 RWXu8t9o7m1AjT+zzG7+6LReVKVoDgIF866xt2IBv6qol78pFbWfHldtcAHTWEcGtT
 jks41McZT5NQLTzzDcAYCaRoQPz/jcOnHoOGFyzdlXairXRB69QL/mknHg9B1AKuGB
 vDD92q62XEEhcISCgUKOX70HAbhZ8lSmTxis1mqbAqQMs5rX9FTXzVwiLn/w8KetaK
 2iA5VF9D8CKBjtqK+BcvQxuo3J6ZIxUMevMcCwXb205SGOD7DKMoATRoeFBc0gvwIY
 kZqoSak7m4Zhw==
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
Subject: [RFC PATCH 3/8] s390: add CPU field to struct thread_info
Date: Tue, 14 Sep 2021 14:10:31 +0200
Message-Id: <20210914121036.3975026-4-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051104_865686_23D2E30E 
X-CRM114-Status: GOOD (  11.23  )
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
THREAD_INFO_IN_TASK is enabled, so add it back to s390's definition of
struct thread_info.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/s390/include/asm/thread_info.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
index e6674796aa6f..b2ffcb4fe000 100644
--- a/arch/s390/include/asm/thread_info.h
+++ b/arch/s390/include/asm/thread_info.h
@@ -37,6 +37,7 @@
 struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned int		cpu;		/* current CPU */
 };
 
 /*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
