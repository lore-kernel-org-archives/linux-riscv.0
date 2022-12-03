Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF20C47089
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 03:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9D1AGTa7Ue/IdH5gUZ+L7tv1DR3ihFGl3hlHspBFxpI=; b=y1GRgQS/ZnKgej
	oJqSuIgzvRkiX/4xKnjll04pBeQfFiLJ7EQKoNEzTnL2GpjczirUuWELLFxDFDMlz3j8Ukg8EX8kW
	Jxcec4Q4Vu3ztVPyOBiOaehPnPNbyyBAzvUndpYljKIsTXaTi4lWjbuRDsa4nYzhZNbDK3HRxtcP3
	SeKg4sAHYOZb0SEiXbhB5uqhJxN1E255Ff9v1ELohRotDshaPWysqNjuR11QTqp86kzwy/NfUXhUJ
	eaosU01D9t/rgTObhgtJSIBNXjCGN36APNJ6boHamj6NWuRGXgl/25Dk2+4MDeKRPRhdBInBnFY3r
	t7u7NRFu/Udzvk4hMUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1IqZ-002AfF-BC; Sat, 03 Dec 2022 03:05:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1IqV-002AdV-Ib
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 03:05:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id a9so6277428pld.7
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 19:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0od2UA8BjfVP9H3ox8w77ADIivJIw8By1NOK2zw+FrE=;
        b=KE60HFRJtajGozkhN1G07j7c4EziYG6716Pa6R9qKsnbLrhO3hCPHcTangQUHJQ3GY
         X2rbnjn7S4+RLLyhk83PlpuLOfyJhKoBVtlxnkZuvLLT1Dy0XXbzHJO+Zb1syJAyiJwK
         1HzKJ8H9/hEF3GYwFmyWk0Q0HJt299gtgQDCfvuWmd4WQ04k7q85X+2UiGbQp6C3N8eC
         JB+LwQRi4zg/FQlDJbAjSfuyM8ImcVmPJAoCvFAWZxvGbIfyu5saspnbFUHqAR9GovKz
         bu7+YMpT1y/VmhmBNOg6RXvDyiXtw3R2OK3M9Gt60B1+AIpI/MivGoMygnXM/C8pBqnw
         RD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0od2UA8BjfVP9H3ox8w77ADIivJIw8By1NOK2zw+FrE=;
        b=dbOfZnNRUkuMlRjyAl3S4tsydPmxRXD/U5a8KaME51dfaj72a5QMXLT3z5yT1B4+9D
         Eh8UtDZLfrETu1sWWurlUzyC4pY1+Wm+JWYJvMGqeBBfc68qxV91S3QHTMzaZ0RmpVsQ
         MtW+41/pmYfJ8Y7T1bNn6m6PgPrD486tUxFXFHCobSRaU0HSPl9JMJrcURTX9rN+CGbp
         l2XRA2ZA4rqe17X4+r+BNCfBH8KrZ4Wukyo+CUnRzpYDs+fmmDVnRHLx85tdT4W1DjOW
         IGWIigsRWoFS14/QneSTAVtW8+iKu+hOyHUgeuFnCsJZuGNlQ3kY+6xLweFMh2WefBQe
         JmCA==
X-Gm-Message-State: ANoB5pnvDUe+QDogI2JxbHr94tvak4twVMMJKHzpmLXzqhoG7w3XIueT
	Vhz0XIdtbrQBliX+LCQHc4wYuPS4TQD/MlR3
X-Google-Smtp-Source: AA0mqf7I3UiJ8c0sc3B4EdMW1XbN/zXhNbb6fQTziUJ0tB9x01rO25QtP9NFuONupmrWTY1OWyBuOA==
X-Received: by 2002:a17:90a:be02:b0:219:8199:ef57 with SMTP id a2-20020a17090abe0200b002198199ef57mr9335059pjs.129.1670036742753;
        Fri, 02 Dec 2022 19:05:42 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001873aa85e1fsm6182904pli.305.2022.12.02.19.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:05:42 -0800 (PST)
Subject: [PATCH 1/5] mm: Add a leading 0 to the VM_FAULT_* types
Date: Fri,  2 Dec 2022 19:03:52 -0800
Message-Id: <20221203030356.3917-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203030356.3917-1-palmer@rivosinc.com>
References: <20221203030356.3917-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_190543_629801_1291D829 
X-CRM114-Status: UNSURE (   9.48  )
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

The next patch will add enough codes to need another character, this
adds the 0 to all the existing codes to keep alignment.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/linux/mm_types.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 500e536796ca..758eb70829cb 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -862,24 +862,24 @@ typedef __bitwise unsigned int vm_fault_t;
  *				in DAX)
  * @VM_FAULT_COMPLETED:		->fault completed, meanwhile mmap lock released
  * @VM_FAULT_HINDEX_MASK:	mask HINDEX value
- *
+ * @VM_FAULT_ARCH_*:		Architecture-specific VM fault codes.
  */
 enum vm_fault_reason {
-	VM_FAULT_OOM            = (__force vm_fault_t)0x000001,
-	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x000002,
-	VM_FAULT_MAJOR          = (__force vm_fault_t)0x000004,
-	VM_FAULT_WRITE          = (__force vm_fault_t)0x000008,
-	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
-	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
-	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
-	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
-	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
-	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
-	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
-	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
-	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
-	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
-	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
+	VM_FAULT_OOM            = (__force vm_fault_t)0x0000001,
+	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x0000002,
+	VM_FAULT_MAJOR          = (__force vm_fault_t)0x0000004,
+	VM_FAULT_WRITE          = (__force vm_fault_t)0x0000008,
+	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x0000010,
+	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x0000020,
+	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x0000040,
+	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x0000100,
+	VM_FAULT_LOCKED         = (__force vm_fault_t)0x0000200,
+	VM_FAULT_RETRY          = (__force vm_fault_t)0x0000400,
+	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x0000800,
+	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x0001000,
+	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x0002000,
+	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x0004000,
+	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x00f0000,
 };
 
 /* Encode hstate index for a hwpoisoned large page */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
