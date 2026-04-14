Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF91F9D0D3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0E6lEzG2Rh5js9DYgPFEX0nsbJh84Q1R+H0CpqLA4E=; b=ZI2DHgd7RVcdUN
	XcU9StzH1pv4EI5X5EX+++lJolFW2Osqq4zyDyqk6zWohRMgaIU4PQPv9j3cTSyC2K6E0+YB7WhdY
	RnWUrr02gAVU2Ll9QLDRcly6xTr7QEedDSab9buqstVMEZaCYauW501m8tDQAHVn/hqbXc/rLKaQr
	HUJyc+LwwcR8Dv8fNOfHZhwdM21v9eDGZUg1iScSGMH2IFdCRzW0o+NeGzGq3jGk6oZ/JHzRQc9vc
	vPmOYuZdIVpfWrrrDCC1a+kw8CY6hgMc+9AMQvTd9GF46aZ3wwpUEa+vBL3ujVgu9hrgmLSMQS7I3
	Sroq16U0oH7FGcnkvO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelW-0000000HSE7-2DMB;
	Tue, 14 Apr 2026 14:29:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelU-0000000HSCv-3pZt
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 14:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF6B560125;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEB9C2BCB7;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=JimhZhRJY96vdcz9LeR/EJHpqBN9VZ+PqSjKJTaNYlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7tKJbx1Pr2kj4vmriqUjgGjCYSqkR7/frq87vV74FFG4SBYc/AxzP3fmteopy0NO
	 RmfkhrE+ErqtMeG2qyd3CcrOLb5hIfkJayEKWpjyq4L/NxuCLYpmuSkLuI2ngRoBuK
	 YWNBpvkbDJoga6mc3hCXlHKm7z4mSlgHX9vCJ1BMMHBAWg7G1UraJrY8+BIsETj9NY
	 nKTWD5327yaN+swymUrFW5zhahdXzpApMLEuDsnXQKE6paZEDjb96gnam9PJPWvWFt
	 tqcXTh40Uz34Ro1/xHDBtdwbyV967MrMcmzUHVM0qUCwikdYvaFjLvOU4vwM83MDkP
	 1ghsZslQEt7pA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelR-00000007oMd-2Q0p;
	Tue, 14 Apr 2026 16:29:17 +0200
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
Subject: [PATCH RFC 1/4] docs: maintainers_include: auto-generate maintainer profile TOC
Date: Tue, 14 Apr 2026 16:29:04 +0200
Message-ID: <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
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

Add a feature to allow auto-generating media entry profiles from the
corresponding field inside MAINTAINERS file(s).

Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
