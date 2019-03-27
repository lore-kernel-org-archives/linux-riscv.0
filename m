Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885EDC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570B62075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p+wixM+7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570B62075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wP00uY9elCinZxP1SJohKIJFQCrIK8klIrgKgNq/8m0=; b=p+wixM+7jLyJDt
	UnYvO/wwDGO/k3curgb5Hg0GQsuXEh79cklFoM1lNqNcliCWXSHlBch2I9a2qrZdqTJyR5vKLv+oM
	DnPlIGLs9+x9WKULbl/cK5omLpWFFbmfryhAwu3+YyL9jz5tDpyaEq5g2Q9x6lFfSYjKVwJ6wT4sD
	IK+onLnUZdb3AcanwpdQNMSlUDIpQUGiSGwVOGh3Z+vuCgPCOHiIHlRMmYg8O1u2WuE3qG+fjdjlF
	d5rVJA75OazktRckUYzKa3eVHmiPu50U2VYttVqlpO7OluqZJ6LF3QJWZ4+n8Hsvl5akjc1JL+blX
	5q9nWkCLbFVDPyCIq+Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GEO-0001Qa-Sy; Wed, 27 Mar 2019 21:37:08 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GEC-0001GN-O7
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 21:37:02 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE3-0006DI-51; Wed, 27 Mar 2019 15:36:47 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE2-0006Cb-0t; Wed, 27 Mar 2019 15:36:46 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed, 27 Mar 2019 15:36:38 -0600
Message-Id: <20190327213643.23789-3-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327213643.23789-1-logang@deltatee.com>
References: <20190327213643.23789-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, palmer@sifive.com,
 hch@lst.de, aou@eecs.berkeley.edu, logang@deltatee.com, corbet@lwn.net
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 2/7] RISC-V: doc: Add file describing the virtual memory map
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_143657_325339_CD746873 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This file is similar to the x86_64 equivalent (in
Documentation/x86/x86_64/mm.txt) and describes the virtuas address space
usage for RISC-V.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 Documentation/riscv/mm.txt | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/riscv/mm.txt

diff --git a/Documentation/riscv/mm.txt b/Documentation/riscv/mm.txt
new file mode 100644
index 000000000000..725dc85f2c65
--- /dev/null
+++ b/Documentation/riscv/mm.txt
@@ -0,0 +1,24 @@
+Sv32:
+
+00000000 - 7fffffff   user space, different per mm (2G)
+80000000 - 81ffffff   virtual memory map (32MB)
+82000000 - bfffffff   vmalloc/ioremap space (1GB - 32MB)
+c0000000 - ffffffff   direct mapping of lower phys. memory (1GB)
+
+Sv39:
+
+0000000000000000 - 0000003fffffffff  user space, different per mm (256GB)
+hole caused by [38:63] sign extension
+ffffffc000000000 - ffffffc0ffffffff  virtual memory map (4GB)
+ffffffc100000000 - ffffffd0ffffffff  vmalloc/ioremap spac (64GB)
+ffffffd100000000 - ffffffffffffffff  linear mapping of physical space (188GB)
+  ffffffd200000000 - 0xfffffff200000000 linear mapping of all physical memory
+
+The RISC-V architecture defines virtual address bits in multiples of nine
+starting from 39. These are referred to as Sv39, Sv48, Sv57 and Sv64.
+Currently only Sv39 is supported. Bits 63 through to the most-significant
+implemented bit are sign extended. This causes a hole between user space
+and kernel addresses if you interpret them as unsigned.
+
+The direct mapping covers as much of the physical memory space as
+possible so that it may cover some IO memory.
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
