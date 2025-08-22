Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516F3CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9P6utyJIdXeEAXtY5l3p5fh/FSWvrPBZT9hfHHAZmic=; b=YgfdZMuA/7TVQH
	zHwT9sTRM1yuxRxKATSJ77PzgI2x6M5kKjGpXqfzrGvkVHPXa/FnuEZL+lE9dIMjGw6D0uJuT4fln
	2ItrzBqJ+PtzoWOZl+fqnRoM0i29VoPPsOYchQrfpia+24ncZ1kJyj3YJsoy2mfdDWxv6wXgTWXAZ
	hYrwTdgYe8f7VvyurDNcPQiI14VmQackHVc/WBKe+KevZJVjiDBfvn67j7FJWN9/Ox8LWgI/Kq9qL
	aEQRnBZvp4CDFiGiL6YG1j4scA/FZR23+6SUEdM9T2l7kFLmzUCy3KsXQ/OUsR5cQJSsYSh9sd0+X
	goIkA26pbJ1TOo/r7caA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphv9-00000004Bbz-1rKm;
	Sat, 23 Aug 2025 06:40:11 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0c-00000003CVx-2TGI
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l4iP/RlFtYntypXCwTaJzhDv89qlJ3qiHOtDZFZNSvU=; b=ukIc7/gqLBSmyrfcJeoWTWZZR5
	JLjqS9EIopBVo5MdokY0pOakuEtz1IkqMbOaCISknXkHYhe6BLly/AdYX9gegEK2/KQv8gEiJrB/I
	fz+W8QKOvwCK2XN7QxXvkU9c/coCUAYqpMZo9hUNcaA+He2xhHFrdiunkcOCkgULEgSxlYzonU10v
	p3ZJJ9zUlV1jdf2iSfM2NNr6q0iGi/LbLlUO3z2jPZsIei5TEtGRNTNXbZKlEvE+HKCnopUy1i2XE
	8BEVPzWKrWIR+M37wjEGdgG2BGD/mnJdKphV3hOp6Uh/+dW1DDo1qvgs0+EAnitpZentQkUoqoPgF
	ShUROIYw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGp-Bv; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DP0-1tLi;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 02/18] riscv: update byteorder.h for big-endian
Date: Fri, 22 Aug 2025 17:52:32 +0100
Message-Id: <20250822165248.289802-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095258_625000_3F06AC4A 
X-CRM114-Status: UNSURE (   8.73  )
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

Add checks for big-endian, using BYTE_ORDER as
modern compilers should define this and anything
that isn't is probably too old to build a system.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
- rewritten to add better __BYTE_ORDER check
---
 arch/riscv/include/uapi/asm/byteorder.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/byteorder.h b/arch/riscv/include/uapi/asm/byteorder.h
index f671e16bf6af..88be4af063fb 100644
--- a/arch/riscv/include/uapi/asm/byteorder.h
+++ b/arch/riscv/include/uapi/asm/byteorder.h
@@ -7,6 +7,10 @@
 #ifndef _UAPI_ASM_RISCV_BYTEORDER_H
 #define _UAPI_ASM_RISCV_BYTEORDER_H
 
+#if defined(__RISCVEB__) || (defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
+#include <linux/byteorder/big_endian.h>
+#else
 #include <linux/byteorder/little_endian.h>
+#endif
 
 #endif /* _UAPI_ASM_RISCV_BYTEORDER_H */
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
