Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07C4F8E4AB
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 06:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AAlKN6d7vN/CNQF23nuYIy8XxNJeeG/WYfEF0Nj1vk=; b=Os751XcmiKmcD7
	RpYWdXiY4y/WF+L9xDUSxOGHGXJ2/JEb0zB7k7nIji46pogPlYSHONyPSCuFOAJekqW3zw1bdEBLe
	pxJ1wqgzVS5acdeEHkH2Ot4NcQy26IQiklEW3Vnb3zYtPvQCf7KOi94vZx2UD7JvVLEM6q135TVEK
	y5iIHZi3IMPv5aKFWSU31X7o1Q0anwSzNO+Vh3Va3F2h629V9JU8bo7VzHF4j7qg3I/wSU7CUTEZG
	2G48VEBAYgN2xr8gDdWKq8hLJV8Vk00pQf9d0bJUqHc9PwzfzTy7EF2mb5jhBMC8Fe7sHTrjxQhg2
	7KGIzvySSr4LNhS1HReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQQ-00000003VXt-2r9h;
	Fri, 17 Apr 2026 06:11:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQK-00000003VQr-3C5V
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 06:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE95544566;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637AAC2BCB7;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eETLWqvcFCC9Jaoj/5wsjHi9kiPxfIumXuUpdjrF9nilO9r8rGjD2BTka3Rni4Wj5
	 IlqECqNhQdIQUzL+I9bSnbKzGJkclMXG0wh3n1hdBY146/90U1a4N7mns6sSPF6AdU
	 23eBx29wRb2nxrxKzY3cD3cTfregYH7cdORdKxGPFmEZrv3F6PgRxybbW76mbCnx3N
	 x9ABfov82Bu5S5p7lWRvNPJjO9Sc8F0kexQcIjQm6a3hBXLu3FNVV6CVfE9hhgYWal
	 oJDVUHiFriz3T8AJdQvFIfnAcf3S4egZu+uIuKV0gpVsxUNhxq6BvgZqAeKPGeCaRc
	 x6T+IAvWbLXoQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8st-2ifG;
	Fri, 17 Apr 2026 08:11:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 08/11] docs: maintainers_include: Only show main entry for profiles
Date: Fri, 17 Apr 2026 08:11:18 +0200
Message-ID: <47a539808bb4bf754f36b4fe8d0aa7aa209b63aa.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_231128_819220_36743405 
X-CRM114-Status: GOOD (  10.85  )
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

Instead of showing as a "Contents:" with 2 identation levels,
drop its title and show profiles as a list of entries.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainer-handbooks.rst | 2 --
 Documentation/sphinx/maintainers_include.py    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 531985a0fae8..3821e78aefc0 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -16,6 +16,4 @@ For maintainers, consider documenting additional requirements and
 expectations if submissions routinely overlook specific submission
 criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
 
-Contents:
-
 .. maintainers-profile-toc::
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 948746b998a3..7ab921820612 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -235,7 +235,7 @@ class MaintainersProfile(Include):
         maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
-        output += "   :maxdepth: 2\n\n"
+        output += "   :maxdepth: 1\n\n"
 
         items = sorted(maint.profiles.items(),
                        key=lambda kv: (kv[1] or "", kv[0]))
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
