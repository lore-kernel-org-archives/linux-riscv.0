Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8B3C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xcjbuBBmXnAtRIu/oyp0wmctMBN1UeEDEuQxlf3UgY=; b=lFvROPEVkzS25P
	gb8iH1qp6qSx+ifrmQ7/m5P34nZnZz/PktfwXyFwKV/z/e3ebAlf8en0FBvt9WvT15+ojHadAwmfb
	2j6mJajd1ADlSWNxmZJDqwrEMXnVaw4YNwI61urUTmmYPA5T3C65uOk5JD6oMwt5bmPr6pw2i33Qp
	7pk2OAzHefqfK8f3tqXIZVXTBjsm9tjNYcda0a2ewJSvwoNIJeHw/lxD2Qe5CYxZZObpJ4LTNdbRF
	I9xHpz6FvXG5xbSq4Z+MyNjcAZQd3+gsNgypQZl8DARtwOz7/i2GJboIawcQVZnUvMUmzfdDsyIxy
	dunYWSCeadGMXicAKmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1r-0043tu-46; Sun, 29 May 2022 14:36:27 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1o-0043sn-Re
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 14:36:26 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so1993514pjo.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 May 2022 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AnAg1YUxluA2WZ89eWwILfJ/wfOj/Nafr+mwcC1H9oc=;
        b=cKk1du3wHYp7fkmugt3HA7vXnSry2WyiYQG1h8I/bcmX9l/WeVq1sFV/dIxJ8neTsZ
         K0AjN8usWcjw2mU34AtZrzmU2goxVMxmnvQRuHVGoCHtfqBCdM6t9Ww/7qmZfp3njLq7
         YKG6t+usNDR013A+OG+ixgostaMDdug7aoTPYhyp3f9DRHAbjYW0Vv7BFeO+VwUYoB00
         hEpImW+dPpBbuU5EfUUb5/nVpi3TNL76d9ayXpA3+uQtP49tkXE5yIoYip0vsm2ROauo
         V+SPdzX8FPhzv/ZO/U27cuKQ300dDeQ2pKGY0SYa6cI+5Pi9AxdZTttQdEuoCRv57nEE
         ahTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AnAg1YUxluA2WZ89eWwILfJ/wfOj/Nafr+mwcC1H9oc=;
        b=74Lpni55WWGAO0OZ3MkIoE7nj6P2+ol3P1VjpkOROmjDI5XW2bLCHVSINyhtbHUcea
         H9Z+7uSWxv+eGjWp7VSZPlqCVRl6SRbV4Yn5YHZc26isfXtyJHsNBc26lULfbABPKfJl
         2gtG0XNP31mSU+ebx0Q9hxSEH610POwCv/xkz3yUAw5FolYZ+Lrqk45Xc2mfF4qRGFGl
         tHmEKeHA2ac6fgCYQNG0R5wjjeiiibRLW+t2KK/gcQs16ZevwWL/5J6FZ+zd+tdgyqxm
         p4EVsktWx2yFQ6XiUiEEt5sijwinSMjWWem9EhSbZ5pr7aXcix34qiG5vfJ9uzl7yd+M
         kjAg==
X-Gm-Message-State: AOAM532PjF6xaH+VtiasFdGq+lM1Rm6/lzOj7A0zk/X7oJUJnFl3IBKc
	zYdCuzFpGFFQ10D800dIqEY/oKHLpS7v4QtE
X-Google-Smtp-Source: ABdhPJw2N+nJBGtQN8MJtMYNqLGqIYMhszAeotlGhUigtWyBSdhaLYLG08WpD/x4BS1Q+BoVq98+NA==
X-Received: by 2002:a17:90b:3507:b0:1df:e162:ec55 with SMTP id ls7-20020a17090b350700b001dfe162ec55mr18699108pjb.159.1653834983109;
        Sun, 29 May 2022 07:36:23 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id h18-20020a056a00231200b005104c6d7941sm7066827pfh.31.2022.05.29.07.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 07:36:22 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	mingo@redhat.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org
Cc: guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH riscv/for-next 2/4] riscv: export patch_insn_write
Date: Sun, 29 May 2022 22:33:13 +0800
Message-Id: <20220529143315.3678563-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220529143315.3678563-1-andy.chiu@sifive.com>
References: <20220529143315.3678563-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_073624_934408_208A2E4C 
X-CRM114-Status: UNSURE (   9.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

So that we may patch code without issuing fence.i

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/patch.h | 1 +
 arch/riscv/kernel/patch.c      | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index 9a7d7346001e..327e99114d67 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_PATCH_H
 #define _ASM_RISCV_PATCH_H
 
+int patch_insn_write(void *addr, const void *insn, size_t len);
 int patch_text_nosync(void *addr, const void *insns, size_t len);
 int patch_text(void *addr, u32 insn);
 
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..834855cfd0fb 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -49,7 +49,7 @@ static void patch_unmap(int fixmap)
 }
 NOKPROBE_SYMBOL(patch_unmap);
 
-static int patch_insn_write(void *addr, const void *insn, size_t len)
+int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	void *waddr = addr;
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
@@ -78,7 +78,7 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 }
 NOKPROBE_SYMBOL(patch_insn_write);
 #else
-static int patch_insn_write(void *addr, const void *insn, size_t len)
+int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	return copy_to_kernel_nofault(addr, insn, len);
 }
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
