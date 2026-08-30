Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805BEC61DE1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXYNJxsHWN/8LyyqUL2U09tBl2iGdet1SOgxCvZb/+0=; b=YtvAyGBq/DVhzv
	vtiJnoUGrGZZhYn4t+CGqEMW7ElifoOH0EgruKLcIwYZl+QlpKKiDDBaeiqzYk/iXgLjdU63lY8zs
	pYj75xlzt4z0ZiAgdcYjAtsPdwtsVjlblPstxbGrteKrB6h428F+EKOKdI0lcoSMNhDqTH/uh3oEJ
	XoWctk2AoSoKVofOOYnB0PLkjgQhy8XuFbgohSbyDCHapQWNO6zj7oZ80Ql+wyh62Zcgj2E2SbeMs
	JoCXalH3D39jaoXj0vEaj125akn0e0O6lQDJeqHIHZn6/mc783fGhEpd8Kc78cpG5CpOb69pKLkt3
	oFxdlU09JMc5TlXOoMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i93-00000007tus-15TW;
	Sun, 30 Aug 2026 16:12:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i90-00000007tu8-29zL
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 16:12:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1084390a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2026 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106349; x=1788711149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oPpwMsCahf6JtLGhYR2mgNDmu982ouZaUg+WHl9e+M=;
        b=EK7CSHLFPApTRdatdPTcMF58rp5KAu9WixzLxL9hwjtQex/BuG1Ht742nYwlOsQkID
         zzK9cXjRNAMc03o81JqlwdNC07PhKJmET+NPhAJ3IbQOpzfWsDjW1Tiq9gWh8X/9TM0a
         pIEZxlcLr3AjfhBGpyEB1matwu/OAnuyhSNAQ24EdTngjqxoS8qfked456+TLN6iV57Y
         e5vKS52XMQoQIiOJ1fl935PyDkoFsk6A0X2WamF3/QH7haucyb5MzafxkzKFzJBO4RIL
         0DRRytStxKY3GMq+shj0Fl/nN6AbbEiA5kbcAjPEfp2Sts6fd4VtLVqUv5JDTRrSgsgl
         OpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106349; x=1788711149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oPpwMsCahf6JtLGhYR2mgNDmu982ouZaUg+WHl9e+M=;
        b=S1cDuJWNYS2nw9IgR+NBHpjw+2hrEmh3WP4Dgm57bvP3QS53b4YYxXupnx6L8JX1Uk
         KZE22sMMqwhhO/bAHjvjjvTRUWSrwGe8HYWVtsgavOpUXBpv7AWZu0KwTpCFV2OLyMA4
         o86tRn7g86eyeCDVKsTPDX35mIUz038rc3OC5wBLEVHZaG4PwuQZziQWeX8ZXGUGJthI
         6lPS3O6bDfcO4vteHQLb3ezmO50M06uOe/ntjyBdmtXw6HaWlC2CIcnH2mqWfZ4RHGl9
         kP+2FIyVrYICoQgsoXYsn5sE56GIy3WRbTzPVMUwyI1iY/ak2IDkZH5Q8uVhfVoDju7w
         jcyQ==
X-Gm-Message-State: AFuF++m5Slo4XvYc5g2Q4PWtI9PPuOwHyZEVndvtkUfpSDSNn1J+dZ6P
	zMdfzoAayLZaCnZNgSSYyh8YvrvU9SD4yRryo+wl0hoD1nE/eskAyrU9FP6s6WclK5dRkw==
X-Gm-Gg: AYBFou0zwgj5uD2zV4EsWErCjTYIHlnr0OgvMyPRUhJR5t6xOzBwvZRNDNNyMPRfA6T
	auhND7JUeDdcJEDeHhmhil30GdZLFtxBvjbq8om3rSTr1Hxwo9nL7epXBB8Zcv7QFrURU356Pmb
	uXvsS9pZabq2xRdemN8R09sCOG/6pGDOf0NAH4YlCoChLQSNn0YPKVi8vcHzN82RVrEroGwuwD6
	NIWVpdsooBwuYUL5LWQ1GGNSdx86wtODhNoB06LFPBY9j2KapqrVNLACcPoT8EHnTtkq/DOYLSG
	rxSjeykEMlHxVmPiocL//wEEvKNZhKPbrsffMBCDH4wiLvBgyFjkbiMuTABxardJlrwMYy6llIT
	3rNgKp/qP7ZyLlxybMksJJySsn1f6ZhsjlgPw5NaLC0/OY6peEzLVSSlNY/ZKvzR7vYOwbnO9bj
	Q+U9cASlwe6U4U50VcrRvc/DruVIM5w4EUwg5KVntgCR5pBcyZZrUU5Zr5/QUmvBxd3duHyjCWV
	ouBPixVOScivUuCDQU0JkrXe5vdiIRw7eQ=
X-Received: by 2002:a17:90b:3ec1:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396d0f2dcd8mr23466138a91.10.1788106349495;
        Sun, 30 Aug 2026 09:12:29 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:28 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 1/2] docs: riscv: document the Sv32 virtual memory layout
Date: Mon, 31 Aug 2026 00:12:04 +0800
Message-ID: <20260830161205.80162-2-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830161205.80162-1-lambda.jinyu@gmail.com>
References: <20260830161205.80162-1-lambda.jinyu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_091230_571131_2645C886 
X-CRM114-Status: GOOD (  13.81  )
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

The RISC-V virtual memory layout documentation describes the 64-bit
paging modes but leaves the Sv32 section as a TODO.

Document the rv32_defconfig layout and clarify which boundaries depend
on the configured size of struct page. Distinguish the maximum direct-map
range from the portion backed by physical memory. Also explain why the
34-bit physical addresses encoded by Sv32 page table entries do not make
all of that address space usable as RAM by the current RV32 kernel.

Signed-off-by: Yu Jin <lambda.jinyu@gmail.com>
---
 Documentation/arch/riscv/vm-layout.rst | 28 +++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index eabec99b5852..8e1447cf574e 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -16,7 +16,33 @@ RISC-V Linux Kernel 32bit
 RISC-V Linux Kernel SV32
 ------------------------
 
-TODO
+Sv32 provides a 4GB virtual address space, with the upper part used by the
+kernel. Unlike the 64-bit layouts, the kernel image is part of the direct
+mapping. The following layout is produced by ``rv32_defconfig``.
+
+::
+
+  ========================================================================================================================
+      Start addr    |   Offset   |     End addr     |  Size   | VM area description
+  ========================================================================================================================
+                    |            |                  |         |
+           00000000 |    0       |         9c7fffff | 2504 MB | user-space virtual memory, different per mm
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | Kernel-space virtual memory, shared between all processes:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+           9c800000 | -1592   MB |         9cffffff |    8 MB | fixmap
+           9d000000 | -1584   MB |         9dffffff |   16 MB | PCI io
+           9e000000 | -1568   MB |         9fffffff |   32 MB | vmemmap-sized reserved area
+           a0000000 |   -1.5  GB |         bfffffff |  512 MB | vmalloc/ioremap/modules; BPF JIT uses the last 128 MB
+           c0000000 |   -1    GB |         ffffffff |    1 GB | direct mapping of physical memory
+  __________________|____________|__________________|_________|___________________________________________________________
+
+The layout before ``VMALLOC_START`` depends on the configured size of
+``struct page``. The direct mapping row shows its maximum range; usable RAM is
+limited by its mapped portion and the 32-bit ``phys_addr_t``, despite the
+34-bit physical addresses encoded by Sv32 page table entries.
 
 RISC-V Linux Kernel 64bit
 =========================
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
