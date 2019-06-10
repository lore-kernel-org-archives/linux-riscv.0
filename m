Return-Path: <SRS0=mVFr=UJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D263DC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 21:25:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76AE2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 21:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SZwLhgm2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76AE2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZUqOz7nrXU4CDxLbkVsuJMJEjXMbdeOs8ngiFLbmow=; b=SZwLhgm22olwkl
	ml/tvgtg7RlYjxe8jVE+oKMLDIqAzCfFJMeXBfyColt8Yl0t16nFnXl7nBEEqdFk4/0RUhWRPuZVL
	CosvCX/g0n31atfASSAfMVM6NN//n+Ly4Kpe0QnDoc3gTFoO47EgeXy6/c8CgLAGPVspUJWjaTJs2
	2IJ8fmnrcanYEve46TuLeAWg9wEuJfJpFybL8JIo4LpSqA5zYNG0wnLnhn8jQCrrNxt8Das3BataA
	H1bxdVuv8A/dWbNl/ciHWrxV4Dh1SPPXEKnC5eeIR7JCCXfh4JsvK9RdZV/aOWuGylt35uTJuA3Cs
	6ZMj+de3FcB9SAp0tLDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haRnC-0005zZ-JI; Mon, 10 Jun 2019 21:25:26 +0000
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1haRin-0000mW-9m; Mon, 10 Jun 2019 21:20:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 13/15] binfmt_flat: move the MAX_SHARED_LIBS definition to
 binfmt_flat.c
Date: Mon, 10 Jun 2019 23:20:13 +0200
Message-Id: <20190610212015.9157-14-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610212015.9157-1-hch@lst.de>
References: <20190610212015.9157-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

MAX_SHARED_LIBS is an implementation detail of the kernel loader,
and should be kept away from the file format definition.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/binfmt_flat.c     | 6 ++++++
 include/linux/flat.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 114ea225c5a5..2c7f32d5435f 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -68,6 +68,12 @@
 #define RELOC_FAILED 0xff00ff01		/* Relocation incorrect somewhere */
 #define UNLOADED_LIB 0x7ff000ff		/* Placeholder for unused library */
 
+#ifdef CONFIG_BINFMT_SHARED_FLAT
+#define	MAX_SHARED_LIBS			(4)
+#else
+#define	MAX_SHARED_LIBS			(1)
+#endif
+
 struct lib_info {
 	struct {
 		unsigned long start_code;		/* Start of text segment */
diff --git a/include/linux/flat.h b/include/linux/flat.h
index 59e892d5fadb..a2232f1bd41b 100644
--- a/include/linux/flat.h
+++ b/include/linux/flat.h
@@ -12,12 +12,6 @@
 
 #define	FLAT_VERSION			0x00000004L
 
-#ifdef CONFIG_BINFMT_SHARED_FLAT
-#define	MAX_SHARED_LIBS			(4)
-#else
-#define	MAX_SHARED_LIBS			(1)
-#endif
-
 /*
  * To make everything easier to port and manage cross platform
  * development,  all fields are in network byte order.
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
