Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B3C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qH+SG670VpFanVzC9nKRFZxdYBtBfpT37ZmtFU+T2KY=; b=5FXy38qZP1Msut
	95hIH5U+uSXZhVEP6b1wlDdqxnEs7VamrPhzS94qLxnK8bIuIi+DpqjcMkg6oS458yJNqCw/bK40s
	7azUOxpanp0w9oU+FV3IpTS0USke2Rlfok6Azvxad67cTJ/wDC5OTnbel7DhMrz4WjVHRy2ARC1DI
	QkEomuZNucSe7xSVsCAkAx9Mfqjqrl/P+shGgi3JpLGRJl353Sutm0llj+3yjCWXCXrpUrlWIL1hn
	Rgm4pjNSYbysXaqzg6xgTPFV8Ug1YxTOFtNCOdCi3T5MxrHK+790UaOIV+2b8R1rSu4IMtX+i+kRq
	5tbKMdbPZLCy6X6TtvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qW-00000007IEb-1S5B;
	Tue, 12 Mar 2024 19:31:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XU-00000006iwc-3C7E;
	Tue, 12 Mar 2024 17:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UNfBGF7ZRB5gRY5ju3ZTnVyluuI6d4pIMWMvwwDFCuc=; b=JgKRMqWIw32269Y6KBgK4ZpUpJ
	C2Z0P3CnOfKqVBHS6nRkx9IOuskpQkVHTm4+pHhw8eGlkPdidM2F0Vm26bxNxqs7Y2qKQJUaW4W65
	EhH2AoQY3oCcIBhxHhOxbOpP9Gz53TTjbs1TY+HDQ6rmq6lxPZgCMIu3bg88QENRVA0r6x7bISFc9
	MyFhnHUlTSHvdmIBJaQuTkIOLu6fuaaIhyJ6/6TElnVWVi4XhPxrfDdX073vPa1goYPOAgU02Z0Ls
	7KukknjLwXRVT9LWholUmJ/lSdtLPfS+PgIc/KdMfriehovDFW0TWCzSz+hSc1Ks2cfdtIJQ+TiKp
	7zmTrWEQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XQ-00000009Yfh-3UU9;
	Tue, 12 Mar 2024 17:03:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc1ff3ba1aso958285ad.3;
        Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263019; x=1710867819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNfBGF7ZRB5gRY5ju3ZTnVyluuI6d4pIMWMvwwDFCuc=;
        b=FC3fMRgreRmeb1TrfxZMEVWrYqiqmZ9lFg2GhZuoGnMJSYIUayW9MjVgARsD+witAv
         FC8PDooH10P4AY2B6d8FVMhgXZ8Jwxb0+qdfQtOHEMAi4riNxnUWX4XKlIJ9WO1g8rdr
         Bf+Kqx7trYLyPrwCZm2/YhErAwolT72ACMRRVGPsPBwBhVottq85LU+6ormAG7xDy7Ht
         hJABVPso4qS32Ga/VubAcgVxhNxkExnLvbZVNdjuDwupRSkd/Lgx1/JtLjJQXIorXH1w
         VWrUU4ftmuMaCoPphFHs+8bkXeimVkzO37pHNWQPhyToSEzeWC/RyXQaOtcQx9YBE3Vh
         5uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263019; x=1710867819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNfBGF7ZRB5gRY5ju3ZTnVyluuI6d4pIMWMvwwDFCuc=;
        b=XO0Q5y77RnG3G7aJTGTNMV/DMYWuxEBsUVt/CQDab62dA0FMvieEKjzL/BpZ5mTUum
         qmo7JmJBBlhLgTn06wUcRS8COBFkiVk/zGdPcWB5244TXXOXMzylj8HV6jDwI8DTvCJl
         C3hQeR6d9nnD4wqvx88a2rRNxrCaOLs8VEtiWnOSjRdVXU/rbETX3MT4CcN4RGn6e8Lf
         p059926YM9zYpYn9N70YrNOhI1/W8cw2OlXeM82zhwUuAxLtlhP26PtZ02mqy72LOfxq
         h+Vtz899BByVnljwz8ZzLe6aYc8GHch8FH12LSn62KngN6UtYXpuHTECTN0H5zr7WIsV
         u9bA==
X-Forwarded-Encrypted: i=1; AJvYcCUfoj3rG261+hF5ZwkVXn7HRZFeOfB78v7viDlXwTdYr5vh2FGmGj1YZn1DVlEs0siOd9Mz3Y3aWzJOzpjhl3bYqx5D7Q6kraRtzlqqQh6C09DzzF0ijv6FER5qyo1k0rPeMZ13o4h8sxh1mCeADMbw1ScQOhU=
X-Gm-Message-State: AOJu0YxASoKOHDAgbVTb2Evk8KlzxIrXNbsCeSSbI9wn3pXQ0Rdd5FJj
	1VGjVigsLv+/o4G36C2v6JbtBWueWETk1JOObvWJEHylcakuR5sk
X-Google-Smtp-Source: AGHT+IGjcPO5G+GnCGVDj4Jcw0R4zzS4LNLUn52exaX20Pa+MrIRq7GoxtzdXir/jkag847FtE7VIQ==
X-Received: by 2002:a17:902:cec8:b0:1dd:7d6a:de4f with SMTP id d8-20020a170902cec800b001dd7d6ade4fmr939106plg.2.1710263018703;
        Tue, 12 Mar 2024 10:03:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k17-20020a170902c41100b001d9edac54b1sm6398555plk.171.2024.03.12.10.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:38 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/14] s390: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:06 -0700
Message-Id: <20240312170309.2546362-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_170341_000691_03BF65CC 
X-CRM114-Status: GOOD (  11.36  )
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/s390/include/asm/bug.h | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index aebe1e22c7be..01e2aa4069d7 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,19 +8,30 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section .rodata.str,\"aMS\",@progbits,1\n"	\
 		"1:	.asciz	\""__FILE__"\"\n"		\
 		".previous\n"					\
-		".section __bug_table,\"awM\",@progbits,%2\n"	\
+		".section __bug_table,\"awM\",@progbits,%3\n"	\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
