Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C85FF8860
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0nJyo2RCP0mTYcGwc2VDCOLUhapXsgl9SwYFoKAp0Q=; b=3U8GSOcGImiKuK
	u2NpdMJedbLUlUHDufEiqCXpwnoT9VTLrQXOH8MfNlWwxnaajQhMFTiAUt70smPipGbtADgyObmRA
	fezbvmqk01TY2pMYmMzPEPj2aSCpi94H447jF5YVouW/CQ1cklPX10J0xXX5bIyeSZwv68wK2WXcU
	OulLYsedIr4GzxXDRPUAdrK0k7j8AyOybWrFlJVRxLSDKtig/iBxDIdXT0zhxawny8Nox7ZFwrzsG
	xsITBbBNb79sA84/zivCbI/Tg+6E8VsvCzhX3r88BvnuVjWQTBERsxP9KLhMF90OAMAiRATgMR3rM
	Y6ZZoGP3dqCz0HqWFrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZV-0000000Gwqz-0Rts;
	Mon, 27 Apr 2026 13:00:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZT-0000000Gwoe-1F0m
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADFAB61143;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7F0C2BCB7;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294818;
	bh=PN4FPVYRORp3XTpdvjjtDtB0ZIfuMMKyf0YVAqRdNAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f67TXgqg4zjIJXENGzkvz4GYvaiC4BnkIHchingFfznXrPsjIsst3PnS4JJM6TMU6
	 lr0I6L2NkyapP2M2oaEzOt4QAxLCsf6hMNffZdI/gk2xsoXJJd+/LyABHdtETjAZKz
	 CaetEIpb/VpaGEycmkr0WEXi13ALVnvNFxaCKM7IZS7uS3s4wNb5K4ITsU3rTNy3Db
	 rK7FxGyf+M3j9RLpinBI3pulSNPiC5XE/I/0AY04guqc7b4jA2zniQZaEPZOWYmNqe
	 X+yS3ZQE07hSdiQN/SDpWqd+jly9Vud05bLYqUyaYeVgvhsltb0LP+1LiDsM8hCJAr
	 M5UvBvigcK8kg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZQ-0000000Bx9g-2kW1;
	Mon, 27 Apr 2026 15:00:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 07/12] docs: maintainers_include: add external profile URLs
Date: Mon, 27 Apr 2026 15:00:07 +0200
Message-ID: <753dd27fbab209fc1b87862bd6204b2026a85313.1777294623.git.mchehab+huawei@kernel.org>
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

Some subsystem profiles are maintained elsewhere. Add them to
the output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 28 +++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index cf428db7599c..f1b8d4b00c2a 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -37,6 +37,7 @@ class MaintainersParser:
 
     def __init__(self, base_path, path):
         self.profiles = {}
+        self.profile_urls = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -81,6 +82,16 @@ class MaintainersParser:
                     else:
                         self.profiles[fname] += f", {subsystem_name}"
 
+            match = re.match(r"P:\s*(https?://.*)", line)
+            if match:
+                url = match.group(1).strip()
+                if url not in self.profile_urls:
+                    if self.profile_urls.get(url) is None:
+                        self.profile_urls[url] = subsystem_name
+                    else:
+                        self.profile_urls[url] += f", {subsystem_name}"
+
+
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
             m = re.search(pat, line)
@@ -219,18 +230,31 @@ class MaintainersProfile(Include):
     def emit(self, base_path, path):
         """Parse all the MAINTAINERS lines looking for profile entries"""
 
-        profiles = MaintainersParser(base_path, path).profiles
+        maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
         output += "   :maxdepth: 2\n\n"
 
-        items = sorted(profiles.items(), key=lambda kv: (kv[1] or "", kv[0]))
+        items = sorted(maint.profiles.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
         for fname, profile in items:
             if profile:
                 output += f"   {profile} <{fname}>\n"
             else:
                 output += f"   {fname}\n"
 
+        output += "\n**External profiles**\n\n"
+
+        items = sorted(maint.profile_urls.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
+        for url, profile in items:
+            if profile:
+                output += f"- {profile} <{url}>\n"
+            else:
+                output += f"- {url}\n"
+
+        output += "\n"
+
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
