Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE7FC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2DF6113C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2DF6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3e5JTzOeetBkXlOOcIPnrUIhoDKe6DS5pYlxrsN6JIc=; b=BBSPvzVyA3YTZogzlPnxyOqONI
	dKWMhMquyHB0TV4+qUJXs+dDAxCD3a+FoyzxSzBo5I0SeOK9kbS8q/ORk1Qjz6j0/2jgPX1lwo8DS
	LssLrsG0SSoM5ThRKAsmuBrrFjveDp1/SOJQcopXkNJ4I0F46o4J2hCMzUXBGrY00ru8GZEARtkko
	nXmle1rTlqBZrjRnAZZewEp/P+ik/ueaW7JGooXzpvAt8D76Tr0BmIL68eNbFyc2E8GA4nqKOTz3E
	n6VzNzzcyVfvmkBdtS2kKQ+50QZEBeZyHda97h4uve5Ea5aEiSn+gkmbhWnRJQqvn/C64XKJtQnQM
	kEUHho4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqZt-00CFH5-Uf; Tue, 20 Apr 2021 13:38:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqZn-00CFFD-Aa
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 13:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VDyI4yKxevUYlLpn/474aJC8pGGv2F5K0zpk402oVhk=; b=rZqfN6VRXhjskTQyZPz9UryGdk
 NBdzNhh1WEKeV9NO15aqytGDv7oe0M5pb98JDoeORCguwWBWFfEZLPhO1cvrsY3ihccP/bxSlEvN8
 lCZAGyh4BVHAqkujpSf188cbEsL6UduGMtsAMU5lMM5tOx6qSG0+wK+MPvwBboA+MILHimayrsXF3
 tVcLAe/zRwPoxdJPVithe7TUrAfjf/oUTwQUjUOoq1O8OImZCRcbS/+B1dv9Dbw4eaRSBGqO8kQGR
 doezwyf47lAsdWPkzVq2KP+ltQ4G2GTEu5/0ACeqRy/oxKS/j4oMJnJSTmk+B/6GjQclsxU9al64u
 gXzXK8FA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqZk-00C9ka-Pq
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 13:38:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C162A613B2;
 Tue, 20 Apr 2021 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618925880;
 bh=VFw9ONtxEh8n9vqM/Or+LuOw1+hn0em8H5ATOgbnS+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hlmJ9oUnOaUG0SKy86JB8b13UBIIrh1HY/j/mviNQgtGUxvEbLNvz8lRSWXfDJ55M
 jWVxrSXIah/JpxNM/O7Uz71jcVqyM7i/4c4O3k/m2Oom8Sc/3vvFehmKzLGMnV+q/m
 rYeKXk5y8J3VEaavpJw1kV31DypinrMAPUWQhazQ/h8N/QlGzM9x1uu4GWwsLZ/Wcr
 kdQVDSFpznwem3nzBQBz5pCowdRrrshTnwnAZgngera/PHMh21+EmZ/Nw5Q4c658bu
 MttwyRAOghh1R/loUHqtxD21C3bZMkZrKGN4NG0NTD64ltZGK6W10mO4/ZTfka2fxs
 JNoOhPla7dT+Q==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 3/3] riscv: Cleanup deprecated function strlen_user
Date: Tue, 20 Apr 2021 13:37:09 +0000
Message-Id: <1618925829-90071-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618925829-90071-1-git-send-email-guoren@kernel.org>
References: <1618925829-90071-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_063800_894010_BE22AA29 
X-CRM114-Status: UNSURE (   8.26  )
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
 arch/riscv/include/asm/uaccess.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 824b2c9..4297f43 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -372,7 +372,6 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
 
-extern long __must_check strlen_user(const char __user *str);
 extern long __must_check strnlen_user(const char __user *str, long n);
 
 extern
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
