Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9638FFF8860
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHo7sRZBMwXtCJVmV9Slp/D1FWXEgfCN214eAZ+/dYQ=; b=Pug0BcFMcO+zGc
	AE5ZBuy7Z6y98bbkcoaotdjS++ZTGa3FD7tBI9KaDh5hpZlWVA15nFhxYhawz6rqElG4c7TiugKqj
	6xbhbAhIhT3MvuDcOZyxu8JqXXnvy/nW0+xcby872AuRvuqFDY6hGgOngNe5eRrAwAzxhvXD1qVYf
	PGTSP+ImN9rIrZesMGZCOR+uKyDcMXXhKkeM9vbxqyruOTpytxQR9mRIvG1CiHL+RGWcPqvgdm0SU
	muHUOjI7n/8illMcWvbQFmqDykN12jULgJRBRHZsXSqkgH2YSMYOKK3h7WJiOpFA4P3PgWVDoA0UT
	XF2rbHBlfKVf2c3PlZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZZ-0000000Gwum-34ZI;
	Mon, 27 Apr 2026 13:00:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZT-0000000GwoO-2RSZ
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE56A443B9;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8F2C2BCC9;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294817;
	bh=oCSFDjePyMaj2tf0ATqd8TtAxNzPuU0qXsi2GNKPtg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oySn7+FCcN5qOKEJWRR/IPvZYWjwWsoyKy2nv2kxiOkA3EnXYlHHRkq5y7Z0u/TQq
	 m3CsLFU7hADLzfgawL3/XRmaOW4PYgEkrt19482CxOdZAE7k2pIvoH+uTAQWqK2n+M
	 JzWNf69uhLBLtGm2kVYAxnjXwbxgLdFPVi8lX/M+CStkkBsSC7W87MRljkmArkiYYj
	 kBijZJHWh8LeNk297oa/Ox8RztwuVIf9uW7snv1W5bqb27KT19xXiJBAH5mss8JD5+
	 E++9oZwxXOczfMeb+CQayKNNTcUIobw1wZdEiJDylNOtn3N+LJKZM8i96GXk4lMAWK
	 OlaT09682coKQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZP-0000000Bx4q-45Ck;
	Mon, 27 Apr 2026 15:00:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 03/12] docs: maintainers: add SPDX license to the file
Date: Mon, 27 Apr 2026 15:00:03 +0200
Message-ID: <527f6ebe5c0831e92b26a63d3f9b06ed735bb62a.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060019_687298_26945322 
X-CRM114-Status: UNSURE (   8.86  )
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

While this file is really trivial, add a SPDX license line on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainers.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/maintainers.rst b/Documentation/process/maintainers.rst
index 6174cfb4138f..5d1b1464c3ae 100644
--- a/Documentation/process/maintainers.rst
+++ b/Documentation/process/maintainers.rst
@@ -1 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. maintainers-include::
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
