Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CFBFF8869
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yp/qtyPqxuaIuFUwNnnGF6hh0xovdWW5aPqv+fgRaQ=; b=GZLSJwD9pu7NQt
	zMtadY1vO8OUURLG4Phwo4pduwn8hYhgAnLMge5FlMqORM2BHJFL59FixB0oej2TukNWelJSgpWOd
	IzloNsO3HNfSSCBMzhay5hSWTYKO77eG88qRAu43i9AWEpK/E9UkKiSUrBmoEnHXfPGrmIfIKzMzv
	kJtdEY1nl4R8DR6EqSNy51zTYa3ENtoiVSZjL1ULLfB9+e+R5nS4SFo2VHTlARYg+tYBNr5kAHE93
	/fGlxe9yxDkYu9buqtpttBX26PkdjiroiKxcYjr7NISIhfvVS/5m4AJ5hABtgPGSEeA85iFV7/NFf
	W2/ecodIA3H53CB62fWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrJ-0000000H4vY-0QqB;
	Mon, 27 Apr 2026 14:22:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrC-0000000H4r2-3nP1
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=w3JYdp5+5n6wLs5DDE/83iz0C3k4Zb8buzcy6R3OQb0=; b=UvEAbZwzFbh1abHZLLppvy9kOn
	BbIKXM5MRG4AK4XIaEVEQ3DXWqYON8MM5KrLX+L/A23enThmqRGPcsVbPHg7k+LiLjiMBNMNtcEyS
	w35f68PaHITubvkwSAD530v1isjboWwe5SA1ir3ac1eg5Pr7Z9uFAu4hF4SpkXuoEP7CxhAIHRqZe
	h53ntm7OsM7aDsHGcf1vwEagV/xoUy4fCViLnJ49LruyE0JcvpUyUuw7cr2UCX4eQzMZEFGkhR5XR
	OkZr2YNxKOxMYvCvII0pmkXFHo981RhDg+6Fgrq7wbE0sbIGI5w1xYxBOBpF1TxZuS9IaUxehBH3X
	Pi8MtW3g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr9-00000000myX-0S1G
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2F63445AD;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A19C2BCFA;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=TwW+kGBiliF/Ei1obwlR1vu04Y0GBFL6iuNTaetPprg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mSTMxd4ToDGCw3AxRUTma98KSYjRKZe53RGL9TAtSIEZtuWS2RmKM8qWcPvWm/24C
	 ULgkySwstM1BDHcLs1onK2XyEdh0eNVKSLbQIhzOxKNGwyJsHjKidR8MN4vomVLsLa
	 xuSft7SpOwXeVyGvpxYinrZ9TKPMmG38Jc0FJ6xviwPo9vi74dgrZ+3lGW780trybI
	 OxRnioRbLzTkr5CM2xAlSrnoB+w3rQe6mgO5j/36BKx0NQNBWY0If7aFI9U6KxvNkM
	 11xsXjZ6oLHy22AofaeV4izPXnoort71M92uIa7bhaO8+eFCqEWyHeX26oN2tteAms
	 0OO6WlKFGKTQQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8XO-2lV7;
	Mon, 27 Apr 2026 16:22:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 07/10] docs: maintainers_include: Only show main entry for profiles
Date: Mon, 27 Apr 2026 16:22:25 +0200
Message-ID: <387b42c523e7b9f33e61cdff6fadb1df265cf71d.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_152239_335451_8C10B9C2 
X-CRM114-Status: GOOD (  10.70  )
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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
