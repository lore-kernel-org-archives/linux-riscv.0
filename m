Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E3CFF886B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0f41B1HsizwOkH2Nl2Pv62r5CGkgxaqVIuZBekZGQI=; b=gbjczIIrOnNBso
	/NMx+SNP5xjlBgiLliaXyWVukv28V2fnCo4QM477iu4RzWs8hfWsnkjZjdBL9lgtvbaYRdKvkZVhH
	eNgPHkSgGZV2GySreGIoY1Kr//pZLMu7bz27kVaBN1OvE2OUsV45YUd4QYI4a3xc9ZSzjQLgNP2Ke
	AQU1KrxrgaDLtL2AoWiz8hSicHgOoC1XlLMNdSBEkchumd73PLhYnzFNM1y6VdMFBEgmevfiWjRG6
	HSOGXczxHoVHD5/okBArgcTiOsbZmAYyiCDrfxvw/Yg4/tqStVXK6xPL3hr0eaRilh6MrflYe0zvh
	1ty/J249kpYtXF8ZNLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZa-0000000GwvN-2IOI;
	Mon, 27 Apr 2026 13:00:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZT-0000000GwoT-2p4Z
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D4FC44212;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09108C19425;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294818;
	bh=etykI6PjHqrvsDMvEbWFzTQyXVYcIo7uusJigHM5MX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zx9BT0wlxngKZjI3y5VcJopmuEnB3Eqp+/fvPqzrJJHuKMPatosDWg3jfsttdMwup
	 VaCv782lIQqTt6oCpfTnaAQ/KfNVhDV6dZr4lkGBCeDslcKP7btKzx7IIi2/XouXn/
	 xd8KvyXUBLLRnU0QiEjPKjJo+yYXHvxcwA0M1SxxYqOI2++eljogWP7zgDfvgS451v
	 sURn1WbYU50BWH2V5jHA2fvhOTXvKyaqlhk47xtxo/CedI8owHLXQx5cg93lB66TNs
	 RMO/GJSXlroYV4/FZ95/Ae8QSinCdMvB+SAXJVVBK/cLtnXB/Ahv1JPByUj0tAQdWa
	 gFinKJ0UqDvCg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZQ-0000000Bx7G-1Jfu;
	Mon, 27 Apr 2026 15:00:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dan Williams <djbw@kernel.org>
Subject: [PATCH v3 05/12] docs: auto-generate maintainer entry profile links
Date: Mon, 27 Apr 2026 15:00:05 +0200
Message-ID: <e2fe361d9a48ee1cecf2c064d08970c09235c426.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060019_772268_C9652A46 
X-CRM114-Status: GOOD (  12.01  )
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

Instead of manually creating a TOC tree for them, use the new
tag to auto-generate its TOC.

Co-developed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
---
 .../maintainer/maintainer-entry-profile.rst   | 24 ++++---------------
 .../process/maintainer-handbooks.rst          | 19 ++++++++-------
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 6020d188e13d..58e2af333692 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -92,24 +92,8 @@ full series, or privately send a reminder email. This section might also
 list how review works for this code area and methods to get feedback
 that are not directly from the maintainer.
 
-Existing profiles
------------------
+Maintainer Handbooks
+--------------------
 
-For now, existing maintainer profiles are listed here; we will likely want
-to do something different in the near future.
-
-.. toctree::
-   :maxdepth: 1
-
-   ../doc-guide/maintainer-profile
-   ../nvdimm/maintainer-entry-profile
-   ../arch/riscv/patch-acceptance
-   ../process/maintainer-soc
-   ../process/maintainer-soc-clean-dts
-   ../driver-api/media/maintainer-entry-profile
-   ../process/maintainer-netdev
-   ../driver-api/vfio-pci-device-specific-driver-acceptance
-   ../nvme/feature-and-quirk-policy
-   ../filesystems/nfs/nfsd-maintainer-entry-profile
-   ../filesystems/xfs/xfs-maintainer-entry-profile
-   ../mm/damon/maintainer-profile
+For examples of other subsystem handbooks see
+Documentation/process/maintainer-handbooks.rst.
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 3d72ad25fc6a..531985a0fae8 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -7,14 +7,15 @@ The purpose of this document is to provide subsystem specific information
 which is supplementary to the general development process handbook
 :ref:`Documentation/process <development_process_main>`.
 
+For developers, see below for all the known subsystem specific guides.
+If the subsystem you are contributing to does not have a guide listed
+here, it is fair to seek clarification of questions raised in
+Documentation/maintainer/maintainer-entry-profile.rst.
+
+For maintainers, consider documenting additional requirements and
+expectations if submissions routinely overlook specific submission
+criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
+
 Contents:
 
-.. toctree::
-   :numbered:
-   :maxdepth: 2
-
-   maintainer-netdev
-   maintainer-soc
-   maintainer-soc-clean-dts
-   maintainer-tip
-   maintainer-kvm-x86
+.. maintainers-profile-toc::
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
