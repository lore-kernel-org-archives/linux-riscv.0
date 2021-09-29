Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29967C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A10613D3
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6A10613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaRQ0/o8T6ZYBfeumcBB4bly8Pn/7VjMd+SR/cK8TFM=; b=qiwGM8imcpprr3
	QdMrQWjKMrBI07CbH9rj06NbFDZObkBB5OGMe/bwm9+oIr/BwNcGePMUk1xbteUoJG7Z1AEA34mdl
	7hsNYZ3Ydnzh4W0NtLTmBYfiMdmb+TKND9ISCeGCIt8CXDOvjeaYh6KDffDXO6346OCpe4uuY4if6
	q0hUfqDenVElGXgYOOw1BnuZPuxf9wUGZU7zfmmqWp+tdRv2jfa51iGu9cVD1i6FHkZTpQDfl50ac
	D0LnnV2BQ4zoQv7IOccl9XyvnrkV3/Zp6nVo5ZzCw8wqdqEIk220Bymha1e7xYsKyUCAhXSuyxR6x
	p/YBApD+WhDSOO0z2cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb3u-00BRc0-JW; Wed, 29 Sep 2021 14:59:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb3i-00BRXS-Um
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 14:59:48 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB62140255
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927585;
 bh=3cu0sC+0/nYKnIJicRvpKscpuwOhF+7jr6vCCwWJtCY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=UbQk0DZVWmXt0WTDHbR7rTh79aIJDo8e2I4bI8rBymq0KqxjoHVH/ZXVmMCYApfZM
 s+15BFrfwVYB+CMMu9Bph2x4VhXxfwM8dncoaLGL6XTKvWKW/pEK5SrLfIZZKGVZhb
 mayHeLo9k0IjgNJ4bl2QEJupdJ/EaefqflhOQeLZDTdx9GxZEXQKQpXCTlaJiXTSmw
 TzzWg2Y5Fju/8a+wjjgp9j+y56rZFP4buRu+IHOArKBWchXh2+FiVgpFPM4Z3qhVYX
 ChlbPvXUO7vy+WXctQyUe8bRToAeGLZi/hG8w0Ml/e9KgzgRHpQF7fbhrcmfM3Vg7X
 N4WtiOtE/A8ag==
Received: by mail-wm1-f71.google.com with SMTP id
 v5-20020a1cac05000000b0030b85d2d479so1336351wme.9
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 07:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3cu0sC+0/nYKnIJicRvpKscpuwOhF+7jr6vCCwWJtCY=;
 b=zfiiirYneSTMIgJ7y+BWWpAl9hsjdEiK5Yol8T7iZltf5Eeo/FagLt3WZ9CSZOycI/
 /K3810076GilXIzflf1Lxrik3K1+7U/xXdOOXLC7ofF53xvn03B2NL4I0TPu3gg70sLo
 atlUaeDyRzN5t1yZXl+jGK3CiJGBkciE8yidfCp5Ox72UlYM0/4SvXSLnTboz72fCXCz
 nGXLL9xn6nWSq31ugzoJCBsNdNvQay1za0uLhqMKNEgJJngq0oXgnCrFZlpRkddILqjG
 t2hqn6VnvIhpiKXHA6KZVChZ9AdD6LcqI4Iu5h6WezVZ4/suwZ8eL7gsA24EM+vkvNYJ
 yXOw==
X-Gm-Message-State: AOAM5308K1pzzdUTVJNtw4/6tzvgclHfrEnxlYrwdIgiFHFdZpVRmP0l
 DX8TEyUufHfww5wlPe/O7Ynlf/J3wAezlW/1k1kwSOrPJ+5koLRBlJQ/3u5by1ONcbLEcQp2Vyx
 PDkpfl+MzdEVfWmFSioE+zF8tAXbWAVF5Vt5BlpyQb+k+Cg==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr340927wrs.404.1632927585420;
 Wed, 29 Sep 2021 07:59:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz15onekdEY2IjZrEU//1FAWV4fNkSUiHcnuIembEtiBE3MlubprxTIgEM4Jdpb37mujcxXYQ==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr340890wrs.404.1632927585227;
 Wed, 29 Sep 2021 07:59:45 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id l16sm81418wmj.33.2021.09.29.07.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:59:44 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 08/10] Documentation: riscv: Add sv48 description to VM
 layout
Date: Wed, 29 Sep 2021 16:51:11 +0200
Message-Id: <20210929145113.1935778-9-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075947_210348_24E85412 
X-CRM114-Status: GOOD (  12.71  )
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

sv48 was just introduced, so add its virtual memory layout to the
documentation.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index b7f98930d38d..f10128e0a95f 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -61,3 +61,39 @@ RISC-V Linux Kernel SV39
    ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+RISC-V Linux Kernel SV48
+------------------------
+
+::
+
+ ========================================================================================================================
+      Start addr    |   Offset   |     End addr     |  Size   | VM area description
+ ========================================================================================================================
+                    |            |                  |         |
+   0000000000000000 |    0       | 00007fffffffffff |  128 TB | user-space virtual memory, different per mm
+  __________________|____________|__________________|_________|___________________________________________________________
+                    |            |                  |         |
+   0000800000000000 | +128    TB | ffff7fffffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical
+                    |            |                  |         | virtual memory addresses up to the -128 TB
+                    |            |                  |         | starting offset of kernel mappings.
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | Kernel-space virtual memory, shared between all processes:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+   ffff800000000000 | -128    TB | ffff8fffffffffff |   16 TB | kasan
+   ffff9dfffee00000 |  -94    TB | ffff9dfffeffffff |    2 MB | fixmap
+   ffff9dffff000000 |  -94    TB | ffff9dffffffffff |   16 MB | PCI io
+   ffff9e0000000000 |  -94    TB | ffff9fffffffffff |    2 TB | vmemmap
+   ffffa00000000000 |  -92    TB | ffffbfffffffffff |   32 TB | vmalloc/ioremap space
+   ffffc00000000000 |  -64    TB | fffffffeffffffff |   64 TB | direct mapping of all physical memory
+  __________________|____________|__________________|_________|____________________________________________________________
+                                                              |
+                                                              | Identical layout to the 39-bit one from here on:
+  ____________________________________________________________|____________________________________________________________
+                    |            |                  |         |
+   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
+   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
+  __________________|____________|__________________|_________|____________________________________________________________
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
