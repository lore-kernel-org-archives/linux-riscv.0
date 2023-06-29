Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBA8EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 03:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UJdqV5gEAaXxRaPXhcz5biBv6G4OHPRQsngn6BC5/mA=; b=A1sAUXp7QXqtsU
	JmoB6cXCDjwH9ErKfrscxC+/7GE3fG1lx7Cp/LDeqiOUG4Wq+6nh171rqqpA9+nUsRDASB1TZlV+S
	0QAQKTqSZc9JyD9m7C8Q+e4FClrz1LtGrixbWFJ0pOuPW53puGxPhIY43Gat04bf3jETgnj/An2f0
	xPFL3Vl11UA/afEici38iV+CIrbzXYvw7E+DUOh2/600zSnmt5l9MrIKd9lYWTSqa3vFEdps016qg
	PKD24vjswMlUDsjkDxWM+dgb9uVHLzu357UytWc8NfMqRl0w7FSl8FD8X5ZTBaR07hoCk5S4GhTUW
	tg2uzDU98otOhWRwupyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEiC7-00HPSa-18;
	Thu, 29 Jun 2023 03:19:43 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEiC3-00HPRg-1P
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 03:19:42 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-39ca120c103so162629b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 20:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688008777; x=1690600777;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xjEUc9SXvWReFvBjh1oVWmOPuD7ckdojkKsCyYaJ6OQ=;
        b=sCyjFs7xnkmXhyI9R9i06oGgLy4K3j8QOye/Rpqz1HCnDhMCSQVSzc/yPoxy3pOW1h
         Jeh2/vrP9P2BMEgnZANab+bG1nS9TQwQVq2Uzh1MuKfGgqLLPcmn4U0f3hKvZMU/AGJc
         wHetlqDL5iU/aWRHu2alu41OtDeBf9U98E9UXPI8SbDXIgho1tjFnoKal0Db4sfAXjiJ
         hfdUO+8FTPsxb+kt3AehUAkLINDjuZTjju4B/bVod/mtz4vZebEIdtuXYmgAPr6JR5so
         qo36WQV0NAp0PmQiu7FEzwtkkeG24WLUgGRFtOVGsNG2VpH7TzUh51qhDos5kPPna5Nb
         1aHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688008777; x=1690600777;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjEUc9SXvWReFvBjh1oVWmOPuD7ckdojkKsCyYaJ6OQ=;
        b=LU6MjyOtsAhta+XXi2HZ11oUFSQi2C/KRZWw3YUa8LoKc3RBv9uher1zBJ4q68xlPp
         CfyVVA+tMh9ZGZn6FC1BAtpFek8BAEjXgsqO9WV+bAX5yx8CDz/9Ouuh3uxXJYKICpEv
         jB2xWUmWdlMyXx+AdxrkN93i59LMY2NmeyaH5E7HlKQQGkvH9WQItLVGTZxDQtO6cVJ9
         bvph0jNbATKISrSqhDnzAiI0on3tJ8bCS/qqpiJhl1RbETUBr7KUbh25Rr1STNGsyy35
         PNed9pJPQN2lPXtf9a168tmeiLsny+/wUqiSec5XubKXWyu6DiTqmS7RHI7tGtKSgzdz
         p1pw==
X-Gm-Message-State: AC+VfDw7kPBKZLFYeU6ARDLTftskC2nxhVYhzIE2k1Ml61TIBrxU4Hq4
	Ex0lE713ZutpC4NnLJD+O0DwUw==
X-Google-Smtp-Source: ACHHUZ4jtOOXfn45E1dGbYDTTymmIJ8dzPxncvW5k8pEiv378IVD+4F8YjnJuMV1Rk9I4Q6vOnmgOQ==
X-Received: by 2002:a05:6808:1583:b0:3a1:dcba:ed7b with SMTP id t3-20020a056808158300b003a1dcbaed7bmr13802235oiw.53.1688008777516;
        Wed, 28 Jun 2023 20:19:37 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id v8-20020a62a508000000b0066684d8115bsm7811050pfm.178.2023.06.28.20.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 20:19:36 -0700 (PDT)
Subject: [PATCH] RISC-V: Document the ISA string parsing rules for ACPI
Date: Wed, 28 Jun 2023 20:17:05 -0700
Message-ID: <20230629031705.15575-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_201939_688205_B6BA764D 
X-CRM114-Status: GOOD (  13.43  )
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

We've had a ton of issues around the ISA string parsing rules elsewhere
in RISC-V, so let's at least be clear about what the rules are so we can
try and avoid more issues.

Link: https://lore.kernel.org/r/CAK9=C2Vy-4V9kgnga98tiC3TeHkR2LFPakyBbS8s_h3_Z=ieyQ@mail.gmail.com/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I'm not sure if there's a better place to put this, but I figure it doesn't
hurt to have it duplicated in the kernel docs so it's easier to find.
---
 Documentation/riscv/acpi.rst  | 10 ++++++++++
 Documentation/riscv/index.rst |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 Documentation/riscv/acpi.rst

diff --git a/Documentation/riscv/acpi.rst b/Documentation/riscv/acpi.rst
new file mode 100644
index 000000000000..9870a282815b
--- /dev/null
+++ b/Documentation/riscv/acpi.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
+ACPI on RISC-V
+==============
+
+The ISA string parsing rules for ACPI are defined by `Version ASCIIDOC
+Conversion, 12/2022 of the RISC-V specifications, as defined by tag
+"riscv-isa-release-1239329-2023-05-23" (commit 1239329
+) <https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-1239329-2023-05-23>`_
diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index 95cf9c1e1da1..81cf6e616476 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -5,6 +5,7 @@ RISC-V architecture
 .. toctree::
     :maxdepth: 1
 
+    acpi
     boot-image-header
     vm-layout
     hwprobe
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
