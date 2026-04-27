Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB799FF8869
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bb662lJEXEiMHmYszwDWBWIJYXanQ/dz4tpkOgnR+cQ=; b=XKuX/fHMpwMdYe
	IXgBJ20BNLSoTPuODBWH4cpAJpdZDmOOmlLfEuyZ4ckGWPJccb7c+d31ZO33kznXSEvOTq8ZsGf8Z
	51IYtl7v8R6jfjTz+VWY5lFt8+tVVkyh6XI6Hg771lh+WHdaTOV1O1lGSCDFQeR7T5CfSIoyFOXGK
	Qt8po4RpGojEsojVM0IulS5D1vwXXRCRj/Akk2L35S1EKtQVyo04CZsqxMPaA3OXPu7S5IjgcfJfP
	/apenTef+LB55LCxYg7qpY3vFQoYLYKwiyCJfCFHz9CjPuURLv1kpTO4eKQQbw0cBxh1yxCN8rTVl
	ZRSfGakmJZSaA/5EJMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrD-0000000H4rx-1eSW;
	Mon, 27 Apr 2026 14:22:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr6-0000000H4n7-26o9
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1DE0401C3;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F96BC2BCB7;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=yDbfJtWAfvQ/qhk2RPsW8RGaJCDeeTNMtQ/iIuIjsIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mz1ODkevkS59ZL/Qj3MnHx1QPKpMvCimI0lPx3/AITa2C88Ll99AX9eIVgptSFKxt
	 0SXMGaMcxCTIA/RBDDrkYLK2lmD2Sc5Z3TzH+/07trUaV+GFns6NbJd1qQlpLLzRl6
	 sIEm+PmJFYZn11iJnhqIU+c+tjUcuJWLmaBrpJSNI+250R1k+a80xfzRzfi+m0Zljn
	 Grj7v9UzerlRN402+lmg2Gtsn3+ULQ0I3QS3qTL00lmRRM3RIUyUchF+bMzfczZzSh
	 GjZEJl046o3yqiPhb8GMtrSQ2XpnxkDhDDVB7ouzRNUB/wSesuc9w+BKVy9baVZGsC
	 83YAcZCVaSXIA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr3-0000000C8RI-3LGz;
	Mon, 27 Apr 2026 16:22:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 02/10] docs: maintainers_include: auto-generate maintainer profile TOC
Date: Mon, 27 Apr 2026 16:22:20 +0200
Message-ID: <eac5fb166bcbf0f267e762d72b150bbf248ff057.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_072236_584349_6282871B 
X-CRM114-Status: GOOD (  12.60  )
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
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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
