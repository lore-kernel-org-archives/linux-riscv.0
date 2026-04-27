Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9E3FF886B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AAlKN6d7vN/CNQF23nuYIy8XxNJeeG/WYfEF0Nj1vk=; b=gtF9mcgyvh3M6h
	Ds3I5+u9nQTeUhqYm+WrSguFsmex6IEDKEX7puhh4n7JauNnnk2SZJadReABvco4gcveAbCYIXNlQ
	iai+fhL2wfARe6JpByWzcALSyosy3UQQNH9/4PoIWX+7jM9JIqdPhr03jI90moOgUL01wG+YC6p0F
	jLSrTPDrd2tS8Shm0AHQEKqKBWm/fiobKlBgxITO9tDkKWwkL0sDX25EJAKguhUJ3094bq1Nkynnk
	tPrIQzgTWvgngYj/3pdb89cLNmxddPcODFYdjFGuTZ3770l1fNnKMbgDQYcWSFOcOdOAXwqz4J5gW
	LYabqMJEHP1uMZ3WFCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZc-0000000Gwx2-0CVV;
	Mon, 27 Apr 2026 13:00:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZV-0000000Gwqo-0Nx8
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5625244706;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349A4C2BCB4;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294819;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gzkqsMhjuF/OjfSGRMS2/YtvqWJONB+/N9KHoHvaPqowbgBX/C+ohdS4PcckRp0lK
	 1TcjU518b5FbwkmQhpKhnKegNIGfg1hWKVUToSQnruMEMdlxdfzPOxatyB1Eb/IQ95
	 QeJSKwmQ2kffONun4FpfnG++ADf3cZsSB7LEfuAB7CCyXKVbH57lVcB5pWSsOv85W+
	 gS9oR4f4MlV06uk8HFRhaJOlN/1ed56DCk4xZD6KdEKDU0jT/A+43NqeKFi4NIf8XF
	 xt1tV914NnJ3S4HaVOImVa/cY/1mwMg8QVlKPo60f8v8O4efbOuhSDqpBh3iS6QLoT
	 PFGBd3SwBQxtQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZR-0000000BxCQ-1y3B;
	Mon, 27 Apr 2026 15:00:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 09/12] docs: maintainers_include: Only show main entry for profiles
Date: Mon, 27 Apr 2026 15:00:09 +0200
Message-ID: <b724657f114b3cc63ff9d0e1115d8c2e439b81c5.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060021_219288_7130908C 
X-CRM114-Status: GOOD (  11.26  )
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
