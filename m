Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CC6C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKEpZ6PXCIIn/xfVSOOYu2Hf+Xt5gQXxKjfifTE64BY=; b=W9Wc/OeqRquNWu
	OMz8jk6UwoYVNUc++Cc8+MvJpFM1kKumFpGU7QEY0gEJJUhGbkU+MgllhYflPDnruUzrAJLxmGC6g
	co5dGNJkytN63Wzb8zYZfnsNtSNdw/vaqEoN2Z0w9jEi6WOX/M7dbye6neWPPyLkSs8KAawdvVKWu
	zkVmrsEYJcXW60veDIwmp/64iQRdJZ1ONgEWJ1oNIv3qE7Rvu/72Sd63a29G7nZ6jSHbWAZlnJZyx
	xHFrhvP393KYYuwRKu3RoV/3K9PlatX4gPGYP2QXUQlrQUVWMWHXdhcTs27xrEP7lWDujdqYAjkSC
	JEV8rtCUUs+yTCoqeojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaf5-00BHqR-5t; Thu, 21 Jul 2022 18:12:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaf1-00BHiO-1x
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 18:12:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id f11so2567168plr.4
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z3XlA8t9TDZtl4uJYv9cJwWL/SPmBlhXJhsAi+NFr/o=;
        b=GtaROVH6xLNFe7Zt86i4dGHacmXliXAJ+jJ5NtiNtpXOdKGq5Wi/W1tWudXPPjPhn1
         m0WFChGHEZMBukYbZ0DoyDoddePkAohw06EUPzmYlwXgyflgQhLTz9TrabJUWdOUdxcW
         W79guXjajscHP2hNeVNzaGsNRDHU7Sl4Rb4VTOx2toedbRxGUqxFJ6k78dj+rRdWJZqK
         1mFREVmwu4rxsebqhPXl+4Djtv52pG55bPaACi70S/EfuIEaQGytAnpq9FB+gpozzpTu
         dPyyrXSrZTSR4lKIpiHSm4j1S2Ts66ARlqhSCx4XdtyCnn55BoUwMKnYcXb+rx7LSRuk
         JvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3XlA8t9TDZtl4uJYv9cJwWL/SPmBlhXJhsAi+NFr/o=;
        b=HmWjGxWJunGtRJYooLtuCxY6uEuZ6oJ6xb6vOVrJoYMoUIrlJBPnGjbBoFOlsFxrDn
         bTLXCR/mNOt62pgFEDD3zGn+prJJpDFQpvz4uPidFgWfflPXHAwaQMTonyzvCLERB2Wn
         uJRvfAayalE2jtWXptH4Zb5zw2s6J3SH0HwrD5jgR63mf7B4c+B771LcJJkwtiMkufDW
         855HJZxGj+JMrTsDimMIR1LVy3sUSO9idzUXBNYk1oI5bDG18I67B2dD0fl+xgJlC9AV
         2CoH1vFtOg1XDF69bl42VDARmKUxSRWnXtsEO2YtlAiMIvUWlnCYOnjbJ3kpbC+WU4uH
         RviA==
X-Gm-Message-State: AJIora/QZbqIO0bSTZiumVONpto/hW1i1DbMvNSWZPDhITBS7mAqrQGM
	2WXjTALhgz60PkPIS+o6LY91Gw==
X-Google-Smtp-Source: AGRyM1sLmCNHB6ZRJMx1svZh7gpfJhld21Y8gtdIzvTWghKGcfXD4XoqTqvJKRLL+Of38AF1zX9oXw==
X-Received: by 2002:a17:902:e841:b0:16c:3053:c7e6 with SMTP id t1-20020a170902e84100b0016c3053c7e6mr44852245plg.163.1658427144286;
        Thu, 21 Jul 2022 11:12:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b12-20020a1709027e0c00b0016d3a354cffsm617358plm.89.2022.07.21.11.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 11:12:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v6 1/4] RISC-V: Add SSTC extension CSR details
Date: Thu, 21 Jul 2022 11:12:09 -0700
Message-Id: <20220721181212.3705138-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721181212.3705138-1-atishp@rivosinc.com>
References: <20220721181212.3705138-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_111231_117165_E8C328AD 
X-CRM114-Status: UNSURE (   8.42  )
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

This patch just introduces the required CSR fields related to the
SSTC extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 17516afc389a..0e571f6483d9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -247,6 +247,9 @@
 #define CSR_SIP			0x144
 #define CSR_SATP		0x180
 
+#define CSR_STIMECMP		0x14D
+#define CSR_STIMECMPH		0x15D
+
 #define CSR_VSSTATUS		0x200
 #define CSR_VSIE		0x204
 #define CSR_VSTVEC		0x205
@@ -256,6 +259,8 @@
 #define CSR_VSTVAL		0x243
 #define CSR_VSIP		0x244
 #define CSR_VSATP		0x280
+#define CSR_VSTIMECMP		0x24D
+#define CSR_VSTIMECMPH		0x25D
 
 #define CSR_HSTATUS		0x600
 #define CSR_HEDELEG		0x602
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
