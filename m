Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E792C55184
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cHIiinRAWpgA7BMI+GhO6x6h8xWcHOaClrdglWqtPoY=; b=eXEbx62ZGqLZwA
	Pw28pHHhJeaKuOeg6saP4ZRCS16plsCBx7aMjzu9p2lxQgazz8RqR7hWofQ+SEJfPrqHItj5feX7X
	hLriTEdZsanpTpY6k41FBPPVZ0c2UH4t1QVWplCeiJBRQUde12DfYoZsvxPUXJz4Zveena7UQoHwb
	oroHWpE17nQqcI458rVEzxfleuuwh5DZTDrLBGQjyZ/FhPDsBk5Y0VprHehruByJO3PQtEVJtrxuG
	bhRqXeZW0r6/MZeb4FwP5KRgHsocvUaxfrNC0/7UFtqlYeQtq5sDVCx5nJRelVrPFhVWLwuZkubHv
	lsCdMHw0MibNK0CFGjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJI-0000000332r-0OPn;
	Wed, 05 Aug 2026 01:20:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJF-0000000332Q-0fRk
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 01:20:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2CFD40558;
	Wed,  5 Aug 2026 01:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560311F000E9;
	Wed,  5 Aug 2026 01:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785892839;
	bh=Sm9+MeVjKgoXfw3OUvNP9GFUgc2NU4I4+UIJFYjr2Zk=;
	h=From:To:Cc:Subject:Date;
	b=KgHsB0RUoTVGW0su/n/WDUk7dUFZ+OrD6VVTIUfOei+gL63pCEfH9EkOYEPLAh+W/
	 8NUzA7tWBNz7lKEsTK2nkjp4FaLNsxpt5Xkv1kSYnmApAymbvlgZAjxSOcMDhIo5V6
	 LOBAhV8GQjxqDJcjZAhT/1uYzpd7PvbEWj1c/0xG9+uTDu+IEs2GSVICfnszks5Q7y
	 WkzdkbWbbbdSMdq1DT/H01ELS4CEKzWKBnPwSTxJE7jB3ignbZZ6Yz175Gxz5Ocfds
	 6PEfqAiuAmH0D+W/UxtivdVEFekOXJccBiLalFsbEAfE69JSrtJ71XukJxyHvIK6Ii
	 vhOFOnxKNrepA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: unexport satp_mode
Date: Wed,  5 Aug 2026 09:01:05 +0800
Message-ID: <20260805010105.13934-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Since satp_mode introduction, it is only utilized by built-in kernel
code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3e450890be07..727083d046b9 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -49,7 +49,6 @@ u64 satp_mode __ro_after_init = SATP_MODE_57;
 #else
 u64 satp_mode __ro_after_init = SATP_MODE_32;
 #endif
-EXPORT_SYMBOL(satp_mode);
 
 #ifdef CONFIG_64BIT
 bool pgtable_l4_enabled __ro_after_init = true;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
