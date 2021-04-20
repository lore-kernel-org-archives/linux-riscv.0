Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445B8C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E453161264
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E453161264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCL0BxZsleBivXBsKBge1sp6UwP0+0ZjQED5gikXD2s=; b=rBRicnMEUWZDULMXpgGsst6Izf
	OMnxV3kVpsIKf7ftCAWG8MfyblWEjhQPjQX6bz8gqpwD3d423VlrD5PscKc8iQaHMFJQEDmT1ldhf
	3MvLMAcgUCwG98eTeht1G8aZSvpn5W2Z+vAK+AEj/PMiUEsP9qj6uat2A1ndM2LhGCLm2PDqDxtXk
	RArF+6tvzLnYo9mJ31NJsg8IveLTNFUvnktbO7fxrCnJ+HbmhR2qoijan5dpYbWYIADs15dziDHbt
	0JQrpbxrQfo2SDyVHZZpDxeWdFTS57MxdR3Pa3sLK5y3M4Whp5PKe9ZywTeB/ZtFbp8P17GQTdUoI
	bBuD4UZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqZp-00CFGC-Az; Tue, 20 Apr 2021 13:38:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqZj-00CFEd-6W
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 13:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=iOtDFxy3I8KUJ4bNGsG6t/w9Ueyh3CWc0v1tTGJ8oJM=; b=N/sV3/n4dh4J2/WvQ2wvpLgri/
 Ti1J+7uWd+6FnEaFMIQy6LbTTGeqGi+U0vHvPj85zd8plvuZbr6/FSUH4w0K951KkXSE5JOSALS0f
 33/6izQPTt6P3AEPJ6Dkn3ds8FsrwLMkyqr5CIvmNmhvlfVZiubPJF2Ni4S/7W0ntxNMCqIjkK6A4
 Hbr1odOVThiY5z4PvZEhU+mi2nLk+pGxF8XE7ZguocgIVxP67j+VYulbZVfmD9g0OFwkFMLJhKpPy
 DS3peh8RByyW9JrTjj2EkMdSmF1FGCmMDAHZXe1ZdoWDddspbNDHTq6heRsdTm5jo/qnw1Q4gI6iY
 HrDvtNiw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqZg-00C9jz-O9
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 13:37:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A69B6113C;
 Tue, 20 Apr 2021 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618925876;
 bh=UlQ0FBFsDr4ODbTFSXPy69eUKK+0YYAXdTX//RlJ41c=;
 h=From:To:Cc:Subject:Date:From;
 b=gwcM3ibBCh9KFA73MXiOekuiNcAJLtZFiZqnuCXM7m/SyRz+JvbVUSiWpYeNJshRx
 mMTv9sF1eGfonecI2ub7KcXqAf1i+YfE/PZI449ys8zG2iJPTDNlJ0t83r1gZKts4h
 pQwbO+lfQbMqlpnEmIgYdV6+mAXfy+OwGidHNLEMRnRE+d2xs256/wkv8UC0ZKFyPz
 ENxdYXUxv60+kDtUYWI+iG5X2qSsZOMh3Kav9VrIShcO6eAGScREe9mUZ5Tcpl5yYh
 AmvpRlar+6k/ahU6qWU9yQv3tDAElujPXLqogCxCOeklmel/0z/kV2qs3L14daZHnY
 nrgwPUPsELP0A==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 1/3] nds32: Cleanup deprecated function strlen_user
Date: Tue, 20 Apr 2021 13:37:07 +0000
Message-Id: <1618925829-90071-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_063756_838731_30D350A6 
X-CRM114-Status: UNSURE (   7.93  )
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
 arch/nds32/include/asm/uaccess.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/nds32/include/asm/uaccess.h b/arch/nds32/include/asm/uaccess.h
index 010ba5f..d4cbf06 100644
--- a/arch/nds32/include/asm/uaccess.h
+++ b/arch/nds32/include/asm/uaccess.h
@@ -260,7 +260,6 @@ do {									\
 
 extern unsigned long __arch_clear_user(void __user * addr, unsigned long n);
 extern long strncpy_from_user(char *dest, const char __user * src, long count);
-extern __must_check long strlen_user(const char __user * str);
 extern __must_check long strnlen_user(const char __user * str, long n);
 extern unsigned long __arch_copy_from_user(void *to, const void __user * from,
                                            unsigned long n);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
