Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9243FC7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKOcMnMHHcwpjZGmiNgxW6YBbOKwFm7uO+zUPVq9Ad8=; b=DIveW1tfTta1c/
	hEUwb6YJ8FBalvMJE1m4p6ZJL79t2dj3C+6AtWOrFAT0Az3SLxHgj1QdLbnrYallBboT6+Wvl3iUW
	jkpceyOFDbLkoRWHRYfdXYxMLM/RA81G3FmVAG2o4FzZSFLw3jIwJnUuzcG/6JIiEUWJGNsUl9sSX
	23QqE3uuHZXWg6hb+HnZYw7KcvrwcBY0AuhKsxdwRU6/PdFrJfh2lnw7Q5LwvLAHxDFWKthsGAfJf
	yyCJWIeyaxa4SEiZaY4+5jsbBdzyrM3KcdO7riNe4WcFhQR903IQSFq2hNpOrnhZ3AGqYjUWv0Ukm
	62NKk8aY3G13Yy2PkfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSU-003DRf-Mi; Fri, 24 Feb 2023 17:02:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSR-003DPL-K2
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:02:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id i3so134100plg.6
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=koVyRaRqxsrDWUrYBU8SOpV584+iZ/LEAwINA8yYDNw=;
        b=gNJplNOUBbEPEsbUXzNCR/S7URO5fxtOMyxTHZNyo4yuJxk9N8FBXkdiHuVgPQsrS+
         NUD/gQo/p8OXfyhY5kl3CqFsxqeEnbh8hvNEYTFiQGQGDqJC8jVMAQILU+x0sUviRAaM
         B1aziI3RtiOJZv3GoFoyP2+TOVhBjTCJCLn70Hb7sRkiKt+bh6KRk9YtS/UEEBq8NJ/M
         KUVy/2Rk42caR8b6A9qzHRpOyQ/D3wTSdQLvyIRcNB30yxaElo8br98e355JAbJV+7vT
         ASTjQ+kObzzTjL1tIpsplGBgVFWSEF7L93/45e5gKu/v2OPKMEbNP+ZIYNMbDaLdR8Ml
         X3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koVyRaRqxsrDWUrYBU8SOpV584+iZ/LEAwINA8yYDNw=;
        b=ZhJpdkuwp2/161JKy32I5lwi6CIznLJ2+HZUpCj1NiV/ffB5AP+HTHnhxW5EQ5ml2l
         hk14/gAFb3t/+RWjAYzBDRY/l6DZOOC/P/4hJohkhOCmiaEH4jD/gzYsQsXKsHXPdn0y
         iX9kjoMg9yL+4y19O6b3M9OU9s3WlqxNasQg50evr8MXkkhDL7RCGln/RFbTYd259qab
         yN7lM7BJjUs7BsrRJqIGOJ+GjIw4gkYqAh38NVDigA+/jL05ZrniqCaq8Qud8KJlU0gD
         sNG9XEJ83k+SWFjNJXSSfKNox7WbmqjMPx65CmQ6VpacWjgi9EaEZO409e1GqxTsVHQX
         SI+A==
X-Gm-Message-State: AO0yUKU34kDOlqvGKJbOlhwSLWyj2CqR9GLePeF6WN96i6m3UwbpTzZp
	a7trYa48Ah+KfvI0Ae8WzovMNzDSrfyi59HBAb0LGDgYtEyL4RMMNjYrpHaUbIUnoN+6FheR0U4
	qs4NNBzY7i86jf02/BxtxbdXMdrWIkyoC6//ByOdzyBQ+B5q1ON573uKDu1YuCVMlrtpn2ukVrl
	g/hH6eWdyGFA==
X-Google-Smtp-Source: AK7set87gGJjD+nHWmm9FxzEE29v4LyYPmGs1/TwwamuxjFalRbTlle2D/CceQqh2G+WOHETlNFp4w==
X-Received: by 2002:a17:902:f988:b0:19c:e0fe:ed1e with SMTP id ky8-20020a170902f98800b0019ce0feed1emr886986plb.69.1677258126886;
        Fri, 24 Feb 2023 09:02:06 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:02:06 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v14 06/19] riscv: Introduce Vector enable/disable helpers
Date: Fri, 24 Feb 2023 17:01:05 +0000
Message-Id: <20230224170118.16766-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090207_700641_56E290EA 
X-CRM114-Status: UNSURE (   6.30  )
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

From: Greentime Hu <greentime.hu@sifive.com>

These are small and likely to be frequently called so implement as
inline routines (vs. function call).

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
[vineetg: create new patch from meshup, introduced asm variant]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
[andy.chiu: remove calls from asm thus remove asm vaiant]
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 427a3b51df72..dfe5a321b2b4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
+static __always_inline void riscv_v_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_VS);
+}
+
+static __always_inline void riscv_v_disable(void)
+{
+	csr_clear(CSR_SSTATUS, SR_VS);
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
