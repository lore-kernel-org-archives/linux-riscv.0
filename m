Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AA4EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 21:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPVJANMvVzOawf59VcrWWr7jHKIgx8DDh8nD7jDfHIQ=; b=w0BbT/uONIE/qR
	tcihDOC12C9+LEbJCKgYoIRtemUTdtPe6GF6H1a79AU3xA4tG+tq1w3LY/SQ6IDSvYZTf+CDJ1dYp
	Rqku9uMXgc9TkWf1rEsOKxuJYx3lE8BUYwAEbLfOOhufT47A92e88CRuIbr0i3moZLpV9qRFN29OC
	wzudbFuOqow/QKg2eiW9HzDqWIANo03luRK9p2/Gniypv7/3u3/rkJ+Q3UJyQVYmrdGvgWkqpe8I8
	5IpETy8bBhnk/nQ5cfOJuD3a0YX+QQAqQTFk1kKC+2VRMqV+QQByauX8pSoq35RdDMwGnqKtlqFED
	4NfieV1vsXvAqzMbMwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8Vj-000c3c-2d;
	Thu, 27 Jul 2023 21:27:03 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8Vd-000bzG-0i
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 21:27:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-686f94328a4so634106b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690493216; x=1691098016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcvGxWKs0ioHSwaNFVtuDJQ1B/8SpZlsoy8QXz36r7I=;
        b=O0RhQf8KfE7AkPva40tWc9J+su1HI1UE2kEfdz7pkwxir6Zk97X4vA7+YDbYbExjNZ
         4RyRTkXeeZg8c5H4DsdkNwy5z0Oc/dOtYSntC5cuj+IHiZcJVOOl/pSPl7D3Ihdgfc6g
         IPIa1TkeHGbit0ypGybX6xXCaiyifj2oUvQhzSw14P8D1lwo9LkNq8obIlWu0dEXqnfq
         NOq9monYfeRcCg+StWnRJrEbiF6xrTEIpjpHi2DRzaZs15+pTwpPDnYlfAInaRS4UyKP
         klrItNmQI+SFf7u8/3WOJRIz/cZ031FyXJArV/48cx9URntu/5ar9hUBmNCWWhDXMrQw
         OqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690493216; x=1691098016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcvGxWKs0ioHSwaNFVtuDJQ1B/8SpZlsoy8QXz36r7I=;
        b=UoU6vsx71XKCuQLqC7iMWNPwax10rtW4qmLIK1RGZV/FecBbxD6Qqhb/4rDrgMTFTU
         /PqIP7vtZYXhsBVi7tJVtZpLihs/z/pnbWzUkz/l7VHDB3gPI6ww4oXWEcSaXEZav/uQ
         h+ByGH+XQS1Vdb0jRTYDH+TLMlxI/X3ZmxQwc0p4N+erxBAmQMbMikzWILOF025gnrXJ
         Ib8aCZmbqxy0gih3v2Glo6CZ7EMGYcr4bdAfUql/U6jltyDeA/7nDBwEfTQKidwkGvk/
         FqAr1OZRdaZ1zRSNmFNbPTtVOU89yhyUfa2AoNhl0RsPU1rj73u9tN5j1xDbTKKoQZPp
         9GXQ==
X-Gm-Message-State: ABy/qLYfdAjrPz6YWQZ76xZoicC5F1GWtrrU4DzUTAsbUgqkTKUowu+s
	0K7UCkMZbkWqYQWHnTfRLTSsdiHPQBykdDFJXkE=
X-Google-Smtp-Source: APBJJlFlY+9HLXpB5MOpoEilud+PtI86fX/t6QctT4gfhpPOy7817Igg+eQtg4O7iE22xtMxf1LQKw==
X-Received: by 2002:a05:6a21:3984:b0:12f:d350:8a12 with SMTP id ad4-20020a056a21398400b0012fd3508a12mr467624pzc.21.1690493216617;
        Thu, 27 Jul 2023 14:26:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c5-20020aa78c05000000b00682562b1549sm1912312pfd.24.2023.07.27.14.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:26:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v8 4/4] RISC-V: mm: Document mmap changes
Date: Thu, 27 Jul 2023 14:26:29 -0700
Message-ID: <20230727212647.4182407-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212647.4182407-1-charlie@rivosinc.com>
References: <20230727212647.4182407-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_142657_264037_53D07BB8 
X-CRM114-Status: GOOD (  12.25  )
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

The behavior of mmap is modified with this patch series, so explain the
changes to the mmap hint address behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5462c84f4723..69ff6da1dbf8 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
    ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+Userspace VAs
+--------------------
+To maintain compatibility with software that relies on the VA space with a
+maximum of 48 bits the kernel will, by default, return virtual addresses to
+userspace from a 48-bit range (sv48). This default behavior is achieved by
+passing 0 into the hint address parameter of mmap. On CPUs with an address space
+smaller than sv48, the CPU maximum supported address space will be the default.
+
+Software can "opt-in" to receiving VAs from another VA space by providing
+a hint address to mmap. A hint address passed to mmap will cause the largest
+address space that fits entirely into the hint to be used, unless there is no
+space left in the address space. If there is no space available in the requested
+address space, an address in the next smallest available address space will be
+returned.
+
+For example, in order to obtain 48-bit VA space, a hint address greater than
+:code:`1 << 47` must be provided. Note that this is 47 due to sv48 userspace
+ending at :code:`1 << 47` and the addresses beyond this are reserved for the
+kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
+than or equal to :code:`1 << 56` must be provided.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
