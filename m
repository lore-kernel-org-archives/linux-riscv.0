Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BBF606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0HORqLKQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=LvVohRss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YlpWqh31lrFi0Xdu9VKW9BzR3BtJhrzcDJwG7/rFEHY=; b=0HORqLKQPt11fZ9neVtc2BQQ27
	7H0KDenMwGPEmq8N1Ez3UB5DvJOprIwjtY66zi1ec2l0m5aZn5oi1sL9eo9GWdibbTXm4Rb/t7ObN
	xXBPRnt0qM7abcJhqCkaOfkBD9aN2ZX//QlvEx1RIIZg5QgCmpXkq8Y6PAuoAW80VxSx6mDKzz5oS
	nBysSNH0oLvcV/+eANwmO3XJfCPIgjoKp3n8kNRVQ+sDv9vDaroJf4jxKj7TcmiXmsW/myydKGL+v
	RoP6Y/FijG73dkyCndByNK+rS2oCf9+jAJghAmuiaWpls+lmjVZhQrIhjRtMf56dxdWsK+bFPXQ49
	NyXcFgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQug2-00000005C2b-3lhT;
	Tue, 10 Nov 2026 22:50:54 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQug0-00000005C1x-0Znf
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 22:50:53 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b0d63f60bcso35105387b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 14:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794351051; x=1794955851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=utYvjE7iNRsUZ/B6nh6OsPwbfkj4nUS0czWF+kgYlnU=;
        b=LvVohRssGoKHV+v+dEpq2nkYHQXryAy/wFLRbDsy5QxOO3f+sjQCnbf66NMNTClLLQ
         7jBtzQB7lbtKmZouXZJCnURR2xB0kjk8t1fowAMAsgYyrhsaiHkgN7iwbNI3Rown6J+v
         hs8fp36OJWJz8txePg1Ett5q6R2b5oOxOeZzlWN8uXPaZ2TvtQW8uWcAmhVjnVdGxOLs
         c7A0gGwHhKr4RYuChnC//kZavpjJ8NPUR0bMbXQ4FQdT+Etk6LgFuXBgtjBFX3qM2Hy1
         XQC5RP3+pzQe0WV9lvEcxjVhrhzS/yYTEIXFctUNIjUuMtzGIGJdqe1zNTc96fQdbCAO
         PsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351051; x=1794955851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utYvjE7iNRsUZ/B6nh6OsPwbfkj4nUS0czWF+kgYlnU=;
        b=vs0OYVrThRxYXvR8wiYta9T0f0InnXNcWTzuDU755g3y4a93ovjO93Ljpei1A3ssg7
         PQpAyFbVspe2b4dbd7cJBPqo34dnu7MUnBtxHT9Bew19yZG1mv3uJBcYVHES7q0cPEVo
         cjMPOWTaVOK40XubIJCiadbJIzk68sLMUXFGyYGXtAKn/qzklhiYZTAZYmRBaMPO3Rq9
         eHNU3kSFRSoC2KLTMET6kHj6yE7SJFbRODVC3so09JtrMoXFgzNB2Jpn7bftkKdln13A
         nzG73ItxI89UsKUyOi9OT1XdHLo1+eV+ftWrfn5c9Q8wHsyGxhxO3BRCxX4TnU6EgTO+
         mDIQ==
X-Forwarded-Encrypted: i=1; AL+hErHXQFFxLE5q6Ncxh6lZlmjOJmngMXLljrF3kweukDNGyuRr+5TeRf69Q/ba1tadcSV2esbZg7xoK4ctAg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+rtI5SsWX4Jh17gdiIdUL1Ocxo5ZVAq1Shs2tV0D3Acj9Bg9Ry
	Yl/rCDu49cVI9GiBat653iR2+VZcbP9EK5o0V4EAvf52f3Qw+Uoi8yUXiCxbDyLJu5o=
X-Gm-Gg: AYBFou1jwzzPP55w9qq8ieirV+sUiOiy0tYf3fWaD9F/89/hUNsP0QPvehN7rU7If0h
	QG51RJGR/GJPuVJu2zkX/PEv/gIg4ANbjkmANi/f3wspqKxcYUXhBzeJ5/r3+vrLU5oiVQ1aRzQ
	X9kl5aBP9S/PzRhGpD98ABVSazpPuYRwoImYHPS0MSgLcbLgYRurQoDcZO1EyaldCWAgEb/NPcF
	8ct9W5mLLalaOSRXXJbuBDHRGVYh2TYQ+UBGvwBrPEWakWsXxQe4sVzK+cbwmjYJl916C6RMXlL
	47+7N+yPlTzQr9ArrGfo1STudSFKObLCg7i9wSxT8NsBRJ/R8JrNmU+ld/C8mDZLq39V+hPt5Zm
	EvjEXy/sTNPtunIz2pN+1SJgW9799NngVvvffSzXPzd7Ai4KmmxoDW/X5elI5r9ovClAKisuTD7
	9A3BPWAMseIEWUTDUVj0sgns9GHxl9sX8gmlJ/q2GX/lQYYJfjbla1ZWwUCn2bp2J6lyjWaBLMl
	eY2c51SEED0PDFtIeXXmJgIsrrPx8zHl+DlWMO5KapLw2ibDAxFQnt76shBtaPvwiCQYWMjzriB
	q/T0AKiy8KBW7z7Clgai5E2LopkATerBySoaZkjPSrroAxB1nvLXIJn4f3oyn3fZptaojpTWYIQ
	QmgM3e8+vDIaTkxo=
X-Received: by 2002:a05:690c:e195:b0:8b0:e7a0:ac5b with SMTP id 00721157ae682-8b3a7e3aed3mr3890957b3.1.1794351050759;
        Tue, 10 Nov 2026 14:50:50 -0800 (PST)
Received: from lima-default.tail89d63.ts.net ([108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933e0d01sm30795337b3.22.2026.11.10.14.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:50:49 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: mpe@oss.tenstorrent.com,
	andybnac@gmail.com,
	Anton Blanchard <antonb@tenstorrent.com>,
	Nicholas Piggin <npiggin@oss.tenstorrent.com>,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v1] riscv: irqflags: Conditionally enable interrupts in arch_local_irq_restore()
Date: Tue, 10 Nov 2026 16:50:38 -0600
Message-ID: <20261110225040.1146439-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145052_190397_7FECF19D 
X-CRM114-Status: GOOD (  10.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Anton Blanchard <antonb@tenstorrent.com>

The Tenstorrent Ascalon core has an optimization that reduces pipeline
synchronisation for immediate writes of SIE. This optimization does not
work with register-based CSR writes, which occur when restoring flags in
arch_local_irq_restore().

Refactor arch_local_irq_restore() to conditionally call
arch_local_irq_enable() only when saved flags indicate interrupts were
enabled.

On a simple nginx benchmark serving a small static HTML file this patch
improves performance by 4%.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
Co-developed-by: Nicholas Piggin <npiggin@oss.tenstorrent.com>
Signed-off-by: Nicholas Piggin <npiggin@oss.tenstorrent.com>
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/include/asm/irqflags.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 6fd8cbfcfcc7..5b1bca17bdc4 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -48,7 +48,8 @@ static inline int arch_irqs_disabled(void)
 /* set interrupt enabled status */
 static inline void arch_local_irq_restore(unsigned long flags)
 {
-	csr_set(CSR_STATUS, flags & SR_IE);
+	if (!arch_irqs_disabled_flags(flags))
+		arch_local_irq_enable();
 }
 
 #endif /* _ASM_RISCV_IRQFLAGS_H */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
