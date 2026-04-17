Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D7BF8E491
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 06:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8LxIUwkxlMbG9gM3H/hw0/eKws3HREdvc0XhxsOBd0=; b=1KYU19IfibfEVG
	rB2CuolQsyt0EHjQMK1NiWmsAvf27sRawppyO1SERaWaapF+U0JdoU2c0ajH+01eYPlC2GRYVM0FN
	NGc4j2VTwVfD3PArTcgf51H/cFB6dNN2F5Tzxnx4LVcWl5hse2HSTqSbCrrZcB8sEdr581xi4HD6C
	qvLEEx+qzKPin/UpM0197snj07ftR1PsOv9U1SjMvZwnZQlmW1aSxrG598+sL17EjJsKaJ9wTpSIU
	bBpcRM6S09YFLvTKlLyQrc1LqBZqKp3rEWJX6KU5wtWmzUfi3+xBpfcFkHfxRHb1Cr08XPxlVHTkc
	VzD3OQ8spyUVCw0A9KVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQS-00000003Vbg-3PLv;
	Fri, 17 Apr 2026 06:11:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQM-00000003VT1-142Q
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 06:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA277446AC;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696E9C2BCC6;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=9WClNhud4aDzY0l2t1PwxaLHqFpthSUfn2BKHY4i39Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F+HpgrRTpRMSRql/fia/gKDen8vl6CIllj0WRRMBvkvc1+uIGnNblZm3K+v8tO9Hb
	 wfOqqfGlL29weLL/QH0fXrM3H5O5wI7oYspxwWO6fprh4Khww8M0P75N4DtDSPb3VZ
	 nUM2ECviGuw+XUKQFRXLEUFgV/Z7VHLmCjJIJIOSFapDbr6Fhjg3OAUBgjZ2J2a83B
	 ea0GyrbsIsOTWp/DUB0QoJZ+lt0DZEKLEaIunghz22/n8Jlx1lOsC71WrMKTCTGTZj
	 qZUYyDBf68bLa76i3eSEDOxASndJ8tJyJMkmNZRMDzPscNzShDg1TgtAGGZbJTxCbX
	 W4l7xn1FrAq7g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8t1-2wzi;
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
Subject: [PATCH v2 10/11] docs: maintainers_include: fix support for O=dir
Date: Fri, 17 Apr 2026 08:11:20 +0200
Message-ID: <45d21c9d47c82471b4e35ea743b87bfcd279902f.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_231130_340101_C8D5B33E 
X-CRM114-Status: GOOD (  15.63  )
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

os.path.relpath() will do the wrong thing with O=dir, as the build
system uses "cd <dir>" internally.

Solve it by using app.srcdir, which, on normal cases, point to
Documentation/, or, when SPHINXDIRS=process, it will be set with
Documentation/process.

While here, remove a dead code while writing maintainer profiles,
as now all entries should have both profile and entry.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-doc/88335220-3527-4b1f-9500-417f7ebb7a02@infradead.org/T/#m6854cbd8d30e2c5d3e8c4173bae1c3d6922ff970
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 71 +++++++++++++++------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 5413c1350bba..ae52e8198750 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -27,15 +27,24 @@ from docutils import statemachine
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
 
+#
+# Base URL for intersphinx-like links to maintainer profiles
+#
+KERNELDOC_URL = "https://docs.kernel.org/"
+
 def ErrorString(exc):  # Shamelessly stolen from docutils
     return f'{exc.__class__.__name}: {exc}'
 
 __version__  = '1.0'
 
+app_dir = "."
+
 class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
-    def __init__(self, base_path, path):
+    def __init__(self, path):
+        global app_dir
+
         self.profile_toc = set()
         self.profile_entries = {}
 
@@ -57,6 +66,9 @@ class MaintainersParser:
         field_content = ""
         subsystem_name = None
 
+        base_dir, doc_dir, sphinx_dir = app_dir.partition("Documentation")
+        print("BASE DIR", base_dir)
+
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
             if descriptions and line.startswith('Maintainers'):
@@ -76,9 +88,25 @@ class MaintainersParser:
             #
             # Handle profile entries - either as files or as https refs
             #
-            match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
+            match = re.match(rf"P:\s*({doc_dir})(/\S+)\.rst", line)
             if match:
-                entry = os.path.relpath(match.group(1), base_path)
+                name = "".join(match.groups())
+                entry = os.path.relpath(base_dir + name, app_dir)
+
+                full_name = os.path.join(base_dir, name)
+                path = os.path.relpath(full_name, app_dir)
+                #
+                # When SPHINXDIRS is used, it will try to reference files
+                # outside srctree, causing warnings. To avoid that, point
+                # to the latest official documentation
+                #
+                if path.startswith("../"):
+                    entry = KERNELDOC_URL + match.group(2) + ".html"
+                else:
+                    entry = "/" + entry
+
+                print(f"{name}: entry: {entry} FULL: {full_name} path: {path}")
+
                 if "*" in entry:
                     for e in glob(entry):
                         self.profile_toc.add(e)
@@ -189,10 +217,10 @@ class MaintainersInclude(Include):
     """MaintainersInclude (``maintainers-include``) directive"""
     required_arguments = 0
 
-    def emit(self, base_path, path):
+    def emit(self, path):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
 
-        output = MaintainersParser(base_path, path).output
+        output = MaintainersParser(path).output
 
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
@@ -213,11 +241,10 @@ class MaintainersInclude(Include):
 
         # Append "MAINTAINERS"
         path = os.path.join(path, "MAINTAINERS")
-        base_path = os.path.dirname(self.state.document.document.current_source)
 
         try:
             self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(base_path, path)
+            lines = self.emit(path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -227,27 +254,20 @@ class MaintainersInclude(Include):
 class MaintainersProfile(Include):
     required_arguments = 0
 
-    def emit(self, base_path, path):
+    def emit(self, path):
         """Parse all the MAINTAINERS lines looking for profile entries"""
 
-        maint = MaintainersParser(base_path, path)
+        maint = MaintainersParser(path)
 
         #
         # Produce a list with all maintainer profiles, sorted by subsystem name
         #
         output = ""
-
-        for profile, entry in maint.profile_entries.items():
+        for profile, entry in sorted(maint.profile_entries.items()):
             if entry.startswith("http"):
-                if profile:
-                    output += f"- `{profile} <{entry}>`_\n"
-                else:
-                    output += f"- `<{entry}>_`\n"
+                output += f"- `{profile} <{entry}>`_\n"
             else:
-                if profile:
-                    output += f"- :doc:`{profile} <{entry}>`\n"
-                else:
-                    output += f"- :doc:`<{entry}>`\n"
+                output += f"- :doc:`{profile} <{entry}>`\n"
 
         #
         # Create a hidden TOC table with all profiles. That allows adding
@@ -261,6 +281,8 @@ class MaintainersProfile(Include):
 
         output += "\n"
 
+        print(output)
+
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -277,11 +299,10 @@ class MaintainersProfile(Include):
 
         # Append "MAINTAINERS"
         path = os.path.join(path, "MAINTAINERS")
-        base_path = os.path.dirname(self.state.document.document.current_source)
 
         try:
             self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(base_path, path)
+            lines = self.emit(path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -289,6 +310,14 @@ class MaintainersProfile(Include):
         return []
 
 def setup(app):
+    global app_dir
+
+    #
+    # NOTE: we're using os.fspath() here because of a Sphinx warning:
+    #   RemovedInSphinx90Warning: Sphinx 9 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
+    #
+    app_dir = os.fspath(app.srcdir)
+
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
     return dict(
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
