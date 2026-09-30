Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B02ACA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poCaD9laZs84P2jc8tvIFX0QVeB269PbomVambpQAl4=; b=xDJacq6b8oFCtI
	IbWZtAk1cCiF6RDiw3IRHRnM0BvURAZ1Ca2iLMvBITtTbsBME1Gw9zXhBWE6D/QAdE1fhy70sHCEJ
	PyIPiHhFCGNyTEmQNXqEodPZ7ef+s7gkUkVZQ9QryKJRMUQSpxUPrjoJtg6rIhHrwX4J86S7Gcht9
	qd3z62VM6osbiegxGQUzen/Qft29lz9Pht88twEhKIPp0JpZmBXJ1LO7VGqTeN1mcvX+PigGmodZ3
	g4GrWywXvsDsBe3ypynkcvB19b//bDisyrW8dRBEoqpkk3s1PxiSZgrOXmFhifcH7cCXY8vYNIjD8
	IXEiMBBqTmKzLZjkjN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBunm-00000006CGy-3sd8;
	Wed, 30 Sep 2026 13:56:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBund-00000006CCT-3pqd
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 13:56:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8E81406F9;
	Wed, 30 Sep 2026 13:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E9A1F008A0;
	Wed, 30 Sep 2026 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776605;
	bh=pWhYf/PBAlBJrtYtS9eILNv9A1vD0y9OBe4mhmHYg8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aeg1cmdi3VgXmX9OCLFYzSH59oaZ/Lk+n2NBk27OzbLo/3yQ5K8PmD/36wosfsK8J
	 oxDemdVUmiM92kzmeln3/sR8pmMEgCpfrTfNp7I7BCRmIkQKLFG0ECpf2eZkOddd+0
	 TsM7Lb0LpeXqzItE6FFO81KmZrHTkV6bAXsn5VnvGSydjRMnRXT7tI3PTr3WV6IclI
	 jOh4H9n+RBWdnqb1OiPpbQqQYQjgFBhIHk4kwUIxnpf2IF2U5HoWDOsC60KjZuOQUa
	 Az1PS3GSTj6dVCrWb4pSMF7jlquspW5d8O4qzubgcKdcx56MzpeLQrLBuYZ640vgqp
	 sExTtpSbZolKQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled
Date: Wed, 30 Sep 2026 21:36:28 +0800
Message-ID: <20260930133628.22093-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930133628.22093-1-jszhang@kernel.org>
References: <20260930133628.22093-1-jszhang@kernel.org>
MIME-Version: 1.0
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

Now, these two vars are only used by kernel itself, especially the code
before MMU on. No modules users any more, unexport them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6f51f265fb85..0d409acf9be0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -59,8 +59,6 @@ EXPORT_SYMBOL(satp_mode);
 #ifdef CONFIG_64BIT
 bool _pgtable_l4_enabled __ro_after_init = true;
 bool _pgtable_l5_enabled __ro_after_init = true;
-EXPORT_SYMBOL(_pgtable_l4_enabled);
-EXPORT_SYMBOL(_pgtable_l5_enabled);
 #endif
 
 phys_addr_t phys_ram_base __ro_after_init;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
