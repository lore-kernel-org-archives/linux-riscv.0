Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC0CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RYCv4zNaeo1/rAuJ/DU5ZSsZfJ3jUYgxxqQZ7C5Cklk=; b=DIQYiCGENIU0MU
	ojkFEHrEaQn3ieBxx1OOg1xZIIC8swFiWYWFSLw9nCrb9cLtXsGwpDfYlax/Z9RzGCRFgkMmq08Ke
	0GiN1s5/oYMOWZ99UnONhyNXxGj26wBWAx4REhZUAhBOo5x7bVECVE6/NFPX1+ngVy+BZdNns4ZUV
	1uwjwCFpPtYZccyB62KWCI91+30ke5C3aZhnz/zEUjiJKVyTWvs+OP8/imKhK+7rIHBIy1rY/nUAj
	e45BdxodU89MbRAzgVaDp2Brx7heWWlHxlQrgROPlIuJ5uuMrXJQzaKYT5/+Uz9yCUqpoQgTVPjRf
	ZvUDiVdBMKWJB6YhsoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxqWa-005erA-UT; Thu, 16 Dec 2021 13:10:21 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxpzC-005T1m-Th
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 12:35:52 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BB6C73FFD8; 
 Thu, 16 Dec 2021 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639658145;
 bh=onBIMAuw6mLm03QoeN/nW0ZWBvVmeZ7hMRD9CvUNps0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=OLpjXtShMiRPjeMzVNhApo+LTBy2HkwCP9A/24L1WUusYWpN0tRjlYFAtVduXnLpT
 1nMlwpSUl++weEhyqtNv8cEwjW3Iy2FbziViUWWCR8/4xAHfSDBWMX9zYJ4wxLX4ub
 JJ++OBcn4MIDsC7+aaKXrp7dTdchoN7eNZ8dNZ8mqfBlPyFdlMtaF8PMXY+3Jo+8Sp
 3uALn1f5PslC6COrjhpPHe2l7mvYqzTODyBq2hhncoQFnT6j15//6uUM0qGUllGg81
 9Mb+YzvyCkStZN8GQOUhjfKgV+YkdJesGN4FCtzGPW6eRt5I0mRxpnyCfjEwg525Wp
 0AGR4Lz20bE2g==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
Date: Thu, 16 Dec 2021 13:35:38 +0100
Message-Id: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_043551_214071_5D182020 
X-CRM114-Status: UNSURE (   9.01  )
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

The SBI 0.1 specification is obsolete. The current version is 0.3.
Hence we should not rely by default on SBI 0.1 being implemented.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 09abf62ae0ad..f177ad3bee0f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -396,7 +396,6 @@ source "kernel/Kconfig.hz"
 
 config RISCV_SBI_V01
 	bool "SBI v0.1 support"
-	default y
 	depends on RISCV_SBI
 	help
 	  This config allows kernel to use SBI v0.1 APIs. This will be
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
