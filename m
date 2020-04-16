Return-Path: <SRS0=YukA=6A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F3CC352BE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 22:01:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 475D1221F7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 22:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RsiCBhcZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 475D1221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eAIqFXSDQFiyBAhlUDSnkB/PjfNj7n3kLMRm+bVFLI=; b=RsiCBhcZVAh4ZZ
	0N6tDVY3r4Yh+/JzGLubxzBbjB8xtRJmeTyuVSUzZ+Lh08csWOtjTOF2FLXCZhAnY06/wEdRHOHH9
	Bc6nsLi4VuKLglV0eaTVQa/QZEH5MxcGbOVfoEDgBIKQ/ornptBxUhObv+H6xUh7DLJPxH56vucFR
	bhxKSp9r47GNxsGdXDSQ9UEB1/jleJVlcTgh31h7Uqmk9OiRFO4LD8KkI05oW5J3M/BzM/Qf9QrIa
	ZLyG5wMADuHzl+4j8cqri+h9A43JKJSYeeVP+i+RxNpMHl9DxL/O6QMUbS4cljjpALMuL2WHO1gBq
	iWhnI8pO+aUT+kJUZ9Yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPCZj-0003Ws-IV; Thu, 16 Apr 2020 22:01:35 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jPCZg-0003UR-Hw; Thu, 16 Apr 2020 22:01:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 05/11] riscv: Add clear_bit_unlock_is_negative_byte
 implementation
Date: Thu, 16 Apr 2020 15:01:24 -0700
Message-Id: <20200416220130.13343-6-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200416220130.13343-1-willy@infradead.org>
References: <20200416220130.13343-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This is the generic implementation.  I can't figure out an optimised
implementation for riscv.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/bitops.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 396a3303c537..f2060c126a34 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -171,6 +171,13 @@ static inline void clear_bit_unlock(
 	__op_bit_ord(and, __NOT, nr, addr, .rl);
 }
 
+static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
+						volatile unsigned long *p)
+{
+	clear_bit_unlock(nr, p);
+	return test_bit(7, p);
+}
+
 /**
  * __clear_bit_unlock - Clear a bit in memory, for unlock
  * @nr: the bit to set
-- 
2.25.1


