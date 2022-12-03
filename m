Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D09C47089
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 03:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QALMMkQn3sNfGUmyclAobtTbe0/uP8KdlFXEIP2O6WQ=; b=Ob44778YNCx2AR
	FAqtiWROehd17jCcOytjmyKEGpLFw73fdsTeuPaq2yOqawDLO0IWCQSLO7bWizBLFCw65+vqnnOVT
	AjFhnbrZJyNj2pG9Od84ylv+HzIREoSVOznH/4o7hnb4uXK/e+hguU8mEY+m4crl+hYIXmAyHKdTK
	Xrl32StO9TkHhiup40jKSJRaMqr6CGUzRf6WHy4mjx9vhfd7aY/7Zx1C/a+AsRHaGTLbrrC/aOBcl
	65IGcvqYqo3tbz/a9sLmp3AofoHsbntyc8JjhMe6lIkgYRj5U4q4pCJ8pPN8ImBZOp0SDeOgXHIPL
	HK128OzGKtzzcKYmxHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Irc-002BAG-1U; Sat, 03 Dec 2022 03:06:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Iqb-002Aej-QU
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 03:05:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so6708449pjj.4
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 19:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXyyhDtl8c7AV1KDvPOaTLsEEraDYLnRgQTRKevMxLE=;
        b=J9nA5zFzEgIt8zsxxMPn+sGlIH86WVlgcK5M4y+MnARF9MADgB6h9QisIFpQgAX5Xc
         gT+JZZbSYIwNPr5lPusi+V73ZxiVkLhM81QZ6t8o4/bUs0p7dwivbSNGIto+U0W3vJje
         odd1RyOpgxE8uPgVe+OvIiemZQ8s/XdQJhhr+yDr90iN2d2hOZAsbJWqu8yYBosqrxer
         9lITxlUrsZAUjRZJKcN0IbJ2m0ZjxM8c9gapj57wHECA6g4hNRl0vKRmp3L5kzuNEkTN
         fw8pU5isxRHsgpJlmPJcoUscGfiLE65hETmvjd9z7oAjQb+boL6+grwCz+iNw1swFZvZ
         utXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXyyhDtl8c7AV1KDvPOaTLsEEraDYLnRgQTRKevMxLE=;
        b=a3jB/y1LyYkwzYZhl9JFaQJ+n7AKkHAsPvQfYywe148DZ3ne+MJNRM8OMajzWfTF0k
         ZgUtyLCivQHZoby/jHNeXUIahhTn9T9mPz0K5GBnxXG/N8qSGZ6WN87ZS9jQM5C0vjmP
         PzalRob8iYWuTS+UZUL5xHaPvzBIKmorgc0OGFkz3tVPZ11kUFOTqfYbYiiD53Udt18G
         jZ/urkHhZjpPUkiUw7r0fuliAWdPPXh5OhDd6HPsb5VS3dUr4rYLN7tJeJtV7z+7A6lm
         1MH2UZdvkBy3PJAe9p3mMrjCzNUDWVZRZPOp/SFw5BXa5d7kVFpnCEnNZ8OE8TspMVsO
         nvsg==
X-Gm-Message-State: ANoB5pnKCSsoMBd0J5fBUO7a/5wdnt/QkvqAKijSAJHpXmVHnkMnGhhv
	4N2cGREfTBPtzkkO46HOWvVgbQ==
X-Google-Smtp-Source: AA0mqf7g0g8qmEYMQvaaJVG+LEYazPjzCbvT60LuJ6AU8Q984Tt5DyiX5U2wTDFpAbMwx/ydl7UUTA==
X-Received: by 2002:a17:902:ce8e:b0:174:b537:266d with SMTP id f14-20020a170902ce8e00b00174b537266dmr54845874plg.144.1670036746128;
        Fri, 02 Dec 2022 19:05:46 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b12-20020a1709027e0c00b001886ff822ffsm6147005plm.186.2022.12.02.19.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:05:45 -0800 (PST)
Subject: [PATCH 4/5] s390: fault: Convert to VM_FAULT_ARCH_* codes
Date: Fri,  2 Dec 2022 19:03:55 -0800
Message-Id: <20221203030356.3917-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203030356.3917-1-palmer@rivosinc.com>
References: <20221203030356.3917-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_190549_887234_6F1C8965 
X-CRM114-Status: UNSURE (   9.12  )
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

These conflict with VM_FAULT_HINDEX_MASK, so move to some designated
arch-specific values.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/s390/mm/fault.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 9649d9382e0a..464a74e52465 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -46,11 +46,11 @@
 #define __SUBCODE_MASK 0x0600
 #define __PF_RES_FIELD 0x8000000000000000ULL
 
-#define VM_FAULT_BADCONTEXT	((__force vm_fault_t) 0x010000)
-#define VM_FAULT_BADMAP		((__force vm_fault_t) 0x020000)
-#define VM_FAULT_BADACCESS	((__force vm_fault_t) 0x040000)
-#define VM_FAULT_SIGNAL		((__force vm_fault_t) 0x080000)
-#define VM_FAULT_PFAULT		((__force vm_fault_t) 0x100000)
+#define VM_FAULT_BADCONTEXT	VM_FAULT_ARCH_0
+#define VM_FAULT_BADMAP		VM_FAULT_ARCH_1
+#define VM_FAULT_BADACCESS	VM_FAULT_ARCH_2
+#define VM_FAULT_SIGNAL		VM_FAULT_ARCH_3
+#define VM_FAULT_PFAULT		VM_FAULT_ARCH_4
 
 enum fault_type {
 	KERNEL_FAULT,
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
