Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCBF8E4AD
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=li62HXy87TyAuBKNSUr9VvpuCGZuAjoHzLAnJGZOhaA=; b=XCL0jZ/LelCkOW
	P+Gr8lv4flT/KMG/19Tmf8CTDziHRJchCnAlKAXzhPuqoHT5ocI3d4EDxJ5/tWAfW2kWuSNPXwP5P
	FHguFOxWpwjrIyRxGqPtWHUjzX794HOtuiZWhxTqzwUuSWdaBvcWXLuBIrMsuWudy5rOdLbfRaqfD
	v2y6LjzjG0YAiZE7DmiYoUkaA5AzynVx+qDXoOCbNCoeSgtlUqe48brHZw9Xgn6+G1iyxGkic/cT/
	pWqa61BdbbVJrXfelDD5a7XQ8ooQqbCJy+rngcqDRHnXiuZy4pVbYBUR+SPjpwRBSluP1qmGEFQYx
	RbZ9sihZuzBS+065Odtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQR-00000003VYT-0025;
	Fri, 17 Apr 2026 06:11:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQK-00000003VQl-0oxv
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 06:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FF86419E9;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551E9C2BCB4;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=lpFijLl6DOvM61uAD6IUooTPFM8/pj/MpyljGy4dY4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHY1uT9NosBb/2dwmUGHX98luF3zEZhY/hJps+A4+PnRfToUlWvtIP7O8VaOvoXTc
	 PApGzrjZAYu4HPiaz/JDTsXhpCzBEiFI4GUDrWdKw+ckuTBrNxv2Gh9ENCuO+M+mUY
	 QKY0oT7ARpOGCkV/BapoE8Lf/LxAZO2zRky5ROf3Tsm2RfKU3jMVMeQMquZimoaUqU
	 8v9CVHc9dQOIRVygm0oht2rcAlgOP/EfcTO3IUTBsAPYaYh19tL0gI5VeXm7vNztPQ
	 mjZnJ1Uxn6k7QvLG7JFiasicpDVPoD1p8s2PmTecexWwHZQGdcRubXC0lTpHRyPDNa
	 6S2zoszcW0Pkw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sZ-28uc;
	Fri, 17 Apr 2026 08:11:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 03/11] docs: maintainers_include: auto-generate maintainer profile TOC
Date: Fri, 17 Apr 2026 08:11:13 +0200
Message-ID: <b54f1bd9687aef11dc9bae51ab409663b0ef7ccb.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_231128_276859_19865CC4 
X-CRM114-Status: GOOD (  12.44  )
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

Add a feature to allow auto-generating media entry profiles from the
corresponding field inside MAINTAINERS file(s).

Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
Acked-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 93 +++++++++++++++++----
 1 file changed, 76 insertions(+), 17 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 519ad18685b2..1dac83bf1a65 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -21,6 +21,8 @@ import sys
 import re
 import os.path
 
+from textwrap import indent
+
 from docutils import statemachine
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
@@ -30,20 +32,11 @@ def ErrorString(exc):  # Shamelessly stolen from docutils
 
 __version__  = '1.0'
 
-def setup(app):
-    app.add_directive("maintainers-include", MaintainersInclude)
-    return dict(
-        version = __version__,
-        parallel_read_safe = True,
-        parallel_write_safe = True
-    )
+class MaintainersParser:
+    """Parse MAINTAINERS file(s) content"""
 
-class MaintainersInclude(Include):
-    """MaintainersInclude (``maintainers-include``) directive"""
-    required_arguments = 0
-
-    def parse_maintainers(self, path):
-        """Parse all the MAINTAINERS lines into ReST for human-readability"""
+    def __init__(self, base_path, path):
+        self.profiles = list()
 
         result = list()
         result.append(".. _maintainers:")
@@ -78,6 +71,12 @@ class MaintainersInclude(Include):
             # Drop needless input whitespace.
             line = line.rstrip()
 
+            match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
+            if match:
+                fname = os.path.relpath(match.group(1), base_path)
+                if fname not in self.profiles:
+                    self.profiles.append(fname)
+
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
             m = re.search(pat, line)
@@ -165,12 +164,23 @@ class MaintainersInclude(Include):
             for separated in field_content.split('\n'):
                 result.append(separated)
 
-        output = "\n".join(result)
+        self.output = "\n".join(result)
+
+        # Create a TOC class
+
+class MaintainersInclude(Include):
+    """MaintainersInclude (``maintainers-include``) directive"""
+    required_arguments = 0
+
+    def emit(self, base_path, path):
+        """Parse all the MAINTAINERS lines into ReST for human-readability"""
+
+        output = MaintainersParser(base_path, path).output
+
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
 
-        self.state_machine.insert_input(
-          statemachine.string2lines(output), path)
+        self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
         """Include the MAINTAINERS file as part of this reST file."""
@@ -186,12 +196,61 @@ class MaintainersInclude(Include):
 
         # Append "MAINTAINERS"
         path = os.path.join(path, "MAINTAINERS")
+        base_path = os.path.dirname(self.state.document.document.current_source)
 
         try:
             self.state.document.settings.record_dependencies.add(path)
-            lines = self.parse_maintainers(path)
+            lines = self.emit(base_path, path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
 
         return []
+
+class MaintainersProfile(Include):
+    required_arguments = 0
+
+    def emit(self, base_path, path):
+        """Parse all the MAINTAINERS lines looking for profile entries"""
+
+        profiles = MaintainersParser(base_path, path).profiles
+
+        output  = ".. toctree::\n"
+        output += "   :maxdepth: 2\n\n"
+        output += indent("\n".join(profiles), "   ")
+
+        self.state_machine.insert_input(statemachine.string2lines(output), path)
+
+    def run(self):
+        """Include the MAINTAINERS file as part of this reST file."""
+        if not self.state.document.settings.file_insertion_enabled:
+            raise self.warning('"%s" directive disabled.' % self.name)
+
+        # Walk up source path directories to find Documentation/../
+        path = self.state_machine.document.attributes['source']
+        path = os.path.realpath(path)
+        tail = path
+        while tail != "Documentation" and tail != "":
+            (path, tail) = os.path.split(path)
+
+        # Append "MAINTAINERS"
+        path = os.path.join(path, "MAINTAINERS")
+        base_path = os.path.dirname(self.state.document.document.current_source)
+
+        try:
+            self.state.document.settings.record_dependencies.add(path)
+            lines = self.emit(base_path, path)
+        except IOError as error:
+            raise self.severe('Problems with "%s" directive path:\n%s.' %
+                      (self.name, ErrorString(error)))
+
+        return []
+
+def setup(app):
+    app.add_directive("maintainers-include", MaintainersInclude)
+    app.add_directive("maintainers-profile-toc", MaintainersProfile)
+    return dict(
+        version = __version__,
+        parallel_read_safe = True,
+        parallel_write_safe = True
+    )
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
