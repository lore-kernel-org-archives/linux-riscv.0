Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB85C43460
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B25A861154
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B25A861154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6d4P6QZ4v0z3/hxcS46nfSJC79g/xoG0jT9S41oLpc=; b=SWHRp7sKVo4e+Yf4d7+fYhF3CF
	H3UUZvfuozyNdKPRkJX5Ak46O7wyb+GQLf/l2zofuwPjjpaW6MyehP+rAV2j3lbDKpn4iPBCpICOq
	gt/6DKPYHKAk2eBPd79rD2hZ+NN9vhay7htNfE/zz5s79e/kW/C84w1WFSgGT8Nw5hx9AC7Iwn5Ja
	Mlc7tNYd0w8lRpxx4bUDMj5PPXIsQqE8WlYtIoru2M21cojONXESTC3GBudD1NkSb6aRxWtZwm2Nq
	pok3XjTYodrrHeJRsVr34AqTzv0mvo9XEBLRU0Vot/3U1kyqNXQipfN25KTR7uU9BXVEaOrhCTaLY
	NE2tlC0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqZs-00CFGi-Bb; Tue, 20 Apr 2021 13:38:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqZl-00CFEs-5j
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 13:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O4xyLNJXcs+rntHgTQU1tdLfhI2rgfm0nawz4hQ/hbY=; b=pspPvsmGml8ZfpLb4L+oiMuU7/
 AKo+CbUQw8Q2wzVg+EqhpzX3X/Pb8uvwEIzAs7ZxAVo0qtfejhlk+NoD1+DNcMD1PUVnyt24rgz3V
 Ih/dwVUf4J63zMXZ/0h6PtWxRYPCNGVL52UFoC4kTvczTQa/HH00fKSyniAKPD3TbGG+E2MYdeEr1
 0dPIXY6jnMMpETPyGFqXM0QyyWKOuewAJe8dzOCy3Y0nm1jfW1NRW9l5D5Vu2myXDtlc/EI7PoFGK
 jEbnn2gI2qEoeBih0923ZLWlO+x+5OSdAyTpObTDu2yKshoGGjyKlSJn1XULP2guin73XO85k3UUA
 YsbvyWUQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqZi-00C9kF-MC
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 13:37:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEC3161264;
 Tue, 20 Apr 2021 13:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618925878;
 bh=O9z7efZKEjE4x4pfxgdpmovrUqTVtXeSt4LE2x0L458=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lWIY+sGZ5nyAwM8GWk0ey+jjoUR/nt8JI1rzXETzBGmjEGW8sIyCW+5DU6Bl7w7Gn
 T6IlsOnDVECBr3qcGhdPsRhWNljUrCoXVSzXG/pLnmjtHgTllLqQ1QpM3jUj7tgbSQ
 WdJY5UhyJX2T9g/ywtzOaQRPqaWVx+wEiADN7HKxvQkYIOL/Ps+dYYEL1I8EOPDwVW
 kQRFFuGbJJzz5LQhcvXsHj1NuyHrpwn7MuGi/mcWRCPTUXjppcnoomyOrNA9dUXAwv
 +BMIK2wUqyLWLkxkv4g9gr+7z8epYRNluujk8v0q4lZxr3ykjAWi0r8f3hx5o2Qtaf
 AZSeI+5FcvPfQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/3] nios2: Cleanup deprecated function strlen_user
Date: Tue, 20 Apr 2021 13:37:08 +0000
Message-Id: <1618925829-90071-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618925829-90071-1-git-send-email-guoren@kernel.org>
References: <1618925829-90071-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_063758_770986_E5B02831 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

$ grep strlen_user * -r
arch/csky/include/asm/uaccess.h:#define strlen_user(str) strnlen_user(str, 32767)
arch/csky/lib/usercopy.c: * strlen_user: - Get the size of a string in user space.
arch/ia64/lib/strlen.S: // Please note that in the case of strlen() as opposed to strlen_user()
arch/mips/lib/strnlen_user.S: *  make strlen_user and strnlen_user access the first few KSEG0
arch/nds32/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user * str);
arch/nios2/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user *str);
arch/riscv/include/asm/uaccess.h:extern long __must_check strlen_user(const char __user *str);
kernel/trace/trace_probe_tmpl.h:static nokprobe_inline int fetch_store_strlen_user(unsigned long addr);
kernel/trace/trace_probe_tmpl.h:                        ret += fetch_store_strlen_user(val + code->offset);
kernel/trace/trace_uprobe.c:fetch_store_strlen_user(unsigned long addr)
kernel/trace/trace_kprobe.c:fetch_store_strlen_user(unsigned long addr)
kernel/trace/trace_kprobe.c:            return fetch_store_strlen_user(addr);

See grep result, nobody uses it.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/nios2/include/asm/uaccess.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/nios2/include/asm/uaccess.h b/arch/nios2/include/asm/uaccess.h
index a741abb..ba9340e 100644
--- a/arch/nios2/include/asm/uaccess.h
+++ b/arch/nios2/include/asm/uaccess.h
@@ -83,7 +83,6 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n);
 
 extern long strncpy_from_user(char *__to, const char __user *__from,
 			      long __len);
-extern __must_check long strlen_user(const char __user *str);
 extern __must_check long strnlen_user(const char __user *s, long n);
 
 /* Optimized macros */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
