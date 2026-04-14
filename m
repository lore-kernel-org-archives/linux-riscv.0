Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A75F9D0D3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCwUp/bCyGM2aRXcNImngtrrGG/pKrrjvw73ZjcKIxI=; b=sx2IU6qUhFqDvf
	kSyegFT59mMetR1K6PuYJLeDquCyWwDVSI2bjwOp7HSONDZgDdbLZT12s7/ip5zYG8d+/JHtc6h+b
	o2cuzMwIbNohkUoLdwHmxbWTMZ6nFuX7hZ1jCIte6GoEl7qUleOsnMKJ5PZ0m5gO8ccafx1VmWiki
	wf7TVA5yZAmgimuc4cFFJZVU18jSI28EC4SodfwJTKSwfXVMxR5XYt4DZiXHY9TtbxdgOJMEdrFoP
	rz0nqMqaXJz+w96BB2fdy8HyfGXXxSIqKlWSdHjvtTqLYAvZjl8HyBV7NJJlIQSUJe2cg5E6i97oF
	tg/JGireTKsnp5kstoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelZ-0000000HSEs-1qPD;
	Tue, 14 Apr 2026 14:29:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelU-0000000HSCw-3L1H
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 14:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F4E24458A;
	Tue, 14 Apr 2026 14:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4F5C2BCF6;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=Z8dBubfNQTKwauxpT0B6VmQJ1X/r3l3qLS1pZ26urKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KUKTBJHKkWW28+VWVgifj6x2B5B6vGxTjXLsTW/Kj56TWARFKsThWcBxF77C8KC1M
	 KyawJvB3faPLRYXbeaZC1747CBRk59rhhw2qsrHLD4rks028s89k2AYBUkCTZ3gjzN
	 hxudgGXsgjVLtmboXSHY8e4kn27bW5RKvUK2nO4QsZPP3swfV1fxcdHAceKrsgrvl9
	 NdjCM1A0eNiq6hVGsGjsoAadnSuGFAgBnJO8HTwlteMm/krqtScHgj+XrlY66nw9ip
	 GhIG5a5mXOaNY4Jowa1ss3YHJwogrB4UTYsJMdb3GFUimRD6B0Tzesfisdu7We7TEj
	 FSZeHjqINHZtg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelS-00000007oQG-0mGQ;
	Tue, 14 Apr 2026 16:29:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dan Williams <djbw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH RFC 4/4] docs: auto-generate maintainer entry profile links
Date: Tue, 14 Apr 2026 16:29:07 +0200
Message-ID: <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_072920_874026_BA4EE0DD 
X-CRM114-Status: UNSURE (   9.71  )
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

Instead of manually creating a TOC tree for them, use the new
tag to auto-generate its TOC.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../maintainer/maintainer-entry-profile.rst     | 17 ++---------------
 Documentation/process/maintainer-handbooks.rst  | 10 +---------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 6020d188e13d..48ecabd4ce13 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -98,18 +98,5 @@ Existing profiles
 For now, existing maintainer profiles are listed here; we will likely want
 to do something different in the near future.
 
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
+See Documentation/process/maintainer-handbooks.rst for subsystem-specific
+profiles.
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 3d72ad25fc6a..d3d74c719018 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -9,12 +9,4 @@ which is supplementary to the general development process handbook
 
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
