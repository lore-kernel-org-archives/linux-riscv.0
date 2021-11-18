Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB15C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 13:45:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232AB61502
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 13:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 232AB61502
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kFbITOUZr6XILO+scNbd+9y9iz36wQ/wnljsf0iNTFo=; b=yJ1bQdMmNOvoXd
	kiDD5QGpe0q4TEd9/2FYH++ZNEbcrkUdw2NowLF6T9B836FCJNo1KMjOrDcqkH9VwMTCafxwJgpBa
	lYNIhD0lGEBUt8pg8uYjXeLn249Cha19vmivE8qn1EfsxNcxRHH8sc0ze0n1FmyXYyoJ6gW8R2m1L
	0UVa+HLe8fni56Xd3GgbWOYdGy2vbTjh5/V4SfJ+lBoUDb43otBtBX7ylulySxlVgrBG0V943c2a0
	YBtyuWE1laGfXKtW4zqmsmGreA8b9Mwc38/PVgvR8tKQvUZKoBMWcgOEP5HFN7jge7ByhkfOCL2pE
	IRhLAa0TNlZvRFrXtFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnhjY-007wwK-Bp; Thu, 18 Nov 2021 13:45:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnhjV-007wvG-N7
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 13:45:47 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 041723F197
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637243143;
 bh=E5afg8WmlGtk4nlRrcUCYbfcd8G0y9QjJNdLIwaQXOs=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=QoHd4VKUQPXrhO7GBo8HJuFBacp3o9uvzS+UJbAY4Xj9lrthlOzxiTze0YD9Sfc0k
 SRcfJpx0e+zfdUvf3E3qB6i8iW5G9Qfe3rV/NoGCvzQFbjq5BXf3VRFmLc2D9vW27a
 WRYTYoqbXQFMXUdNTox0JvB62fIvbif3ujPfQfaEQJwCUSu6qMXeJN5BI7Mp6C3bFA
 O2SE3LmaQ+1bo1Op+YLWFWkNPhf0Hkld45TelXFl/bm7uglIt5ArvXIiWMSPX+9AaD
 nhWqJG+RedYLua1S53zAW7vGUgjX2XWjEPYARzEu8EneOFsg5uoMwlD7CVx9CA7UtQ
 s64MZXjbaY9jA==
Received: by mail-wm1-f72.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so3139691wmb.4
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 05:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5afg8WmlGtk4nlRrcUCYbfcd8G0y9QjJNdLIwaQXOs=;
 b=rJm31HV7BUpCn0r7Fukalwt1YzTraAKUJCCGyjgjqz9SnhCo/6jLWXNOov8DVBedmN
 q6iTTcJ8hDlYuJjy5c/iYqSzBmBgfGyM216hxr2NHGO9hm6dUWZ85kp0yvUTWmh5D3Hj
 Z540QQgIj+YPiELvBOW1mPCE5aC5g94AJhPARW3w01fsI0D1DtbTDcgn+B9rGJ1AOPsk
 bRF0aN+YBE4P1ISXR1rHMsToeB404CxNa0221wTBUTeVI/5vfRGa0anhj6KgcN8yKuwj
 2ertdnKcF9YVj30bE6mp/z43kiNRlnI4Nd2sYS6hM1dhfaOL1oXYOaKnjfMfv7eOk2bJ
 lCZA==
X-Gm-Message-State: AOAM531ql4SubIKBzx0W6GpwboNaH2YZxD6z3qWWFkceFJv/Gs4ya4wN
 sJJ/8HhwwZBOEBEaMuCxy7sGM2F1EYPkSBWWx0chgLtv93a8iz7/tOjo6/Ob10hA/Yogv4qS7TX
 zfaLQjn+c+RhQUxz+sp6HoJnOQTRP3MOQjlxl6JL6ZXwcpA==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr31013731wri.382.1637243142157; 
 Thu, 18 Nov 2021 05:45:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrUjKxkyIXJibXWfGPfPjjB4sv+qvr6o+Qli9e3LePqiDavDp4jzO0IjGcGoUVGkj+CxhYIw==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr31013696wri.382.1637243141978; 
 Thu, 18 Nov 2021 05:45:41 -0800 (PST)
Received: from alex.. (11.169.185.81.rev.sfr.net. [81.185.169.11])
 by smtp.gmail.com with ESMTPSA id t8sm3087064wrv.30.2021.11.18.05.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 05:45:41 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH] riscv: Make vmalloc/vmemmap end equal to the start of the
 next region
Date: Thu, 18 Nov 2021 14:45:39 +0100
Message-Id: <20211118134539.137212-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_054545_934537_14CE721B 
X-CRM114-Status: GOOD (  13.80  )
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

We used to define VMALLOC_END equal to the start of the next region
*minus one* which is inconsistent with the use of this define in the
core code (for example, see the definitions of VMALLOC_TOTAL and
is_vmalloc_addr).

And then make the definition of VMEMMAP_END consistent with VMALLOC_END
and all other regions actually.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/pgtable.h | 4 ++--
 arch/riscv/mm/fault.c            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d34f3a7a9701..5155048274c2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -25,7 +25,7 @@
 #endif
 
 #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
-#define VMALLOC_END      (PAGE_OFFSET - 1)
+#define VMALLOC_END      PAGE_OFFSET
 #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
 
 #define BPF_JIT_REGION_SIZE	(SZ_128M)
@@ -53,7 +53,7 @@
 #define VMEMMAP_SHIFT \
 	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
 #define VMEMMAP_SIZE	BIT(VMEMMAP_SHIFT)
-#define VMEMMAP_END	(VMALLOC_START - 1)
+#define VMEMMAP_END	VMALLOC_START
 #define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
 
 /*
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index aa08dd2f8fae..41ae0aa8f2b8 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -235,7 +235,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * only copy the information from the master page table,
 	 * nothing more.
 	 */
-	if (unlikely((addr >= VMALLOC_START) && (addr <= VMALLOC_END))) {
+	if (unlikely((addr >= VMALLOC_START) && (addr < VMALLOC_END))) {
 		vmalloc_fault(regs, code, addr);
 		return;
 	}
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
