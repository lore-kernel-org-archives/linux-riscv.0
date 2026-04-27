Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1793FF886D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpbpT36DWpA0z4ChE9/Z7Dcq6MatBSGgrrw+cNojvs8=; b=wVlofnUAO0FTO9
	SQsi0vTcLtMIEYmIQykfd4LKcE+XWL6ciVeIexjWaSKyucbpJWzugBVgMHlyxfWhv5SxMtLz+q7V9
	FkpwKFjGoQ5OsOZah2cWjXdDatBAh5DR4jJBQ2YZvSdsFF8DQWoPS0qzhaBEVlPDPnIiQ/lfgL6nQ
	q7bNR5b8y15C93fBLT98//cxWQizlIHSGcfTGJkMi1nhlHHCYEvDplXktTKsYhHhNgrGUL5LeRsaW
	n/ilTV/mkgPebQ0SCyLPDxxpLjQyPLGIUXWVoFw5aduQSgm8h0ma78Tt9tLD8roy2t0rIP//mjO/3
	vQXeSZ2Q3lgUWRW6qn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZT-0000000Gwpw-3SON;
	Mon, 27 Apr 2026 13:00:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZS-0000000GwoS-3LjK
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C4C760138;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A927AC2BCB7;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294817;
	bh=0/HTY/j+rmONwTz1eYmFn0WIHlokjtE9NUEt4Mkvjgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAQj93gU9gv34gCWYtb+46HC164jS3Pwxjkh3KDzL0QLYF4OHM7CeLKz/24t6pjIP
	 u+ADvE4XQNKCuFyN2UZ9I4wwdgZpUnO6tM2rLUI/gcUnZD/RR3vzj9j8KnS6PGDGVU
	 5bpHW2BQpBIfeshvd9r5w77kdPxTNW/JIy4b4xQ9UOlnFi8s/HsUKj6t43tPUC4hYj
	 0wYlp0IL2fq0Ay9zJF4CArWOEQXoKUanKSaQ271IV+gbDP9gEYBGfnvPukbdv4zrIa
	 oosOoAn/bmpfiOamjAw7pyg3HInwZ6KhhlAZJlzb/cpf4p/3rnBAnaYJq/FLLxUxu2
	 nLWCdLEbtWonQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZP-0000000Bx3c-3MzY;
	Mon, 27 Apr 2026 15:00:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <djbw@kernel.org>
Subject: [PATCH v3 02/12] MAINTAINERS: add maintainer-tip.rst to X86
Date: Mon, 27 Apr 2026 15:00:02 +0200
Message-ID: <35abbf65385910c4c69d571dbf0d10b2a75b6fa9.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
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

The X86 subsystem has a maintainers entry profile, but its entry
is missing at MAINTAINERS.

Add it.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f52ec50f6d10..a00d4ba61c2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28808,6 +28808,7 @@ M:	Ingo Molnar <mingo@redhat.com>
 M:	Borislav Petkov <bp@alien8.de>
 M:	Dave Hansen <dave.hansen@linux.intel.com>
 M:	x86@kernel.org
+P:	Documentation/process/maintainer-tip.rst
 R:	"H. Peter Anvin" <hpa@zytor.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
