Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B5FF886C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97CKgcgGaSD5SKjwcMeKxXttrGL1nsOEA50F6I+kX30=; b=vhgSRfmIUBU4Xt
	SD24seigZkKAaHhhcs3KF8R7Wy8oZuneLJE2gBX8JFrSHG2Rb2D7dcTiNDaDaM8LJsRbeWZPn/oAu
	0QAjEjRoiBalGJLOo7ca31tn+spUWSASVOjgPfxjdAkpAeNXJcIW8VSRcJLL+pHIsTxrnRbIcXRsL
	JVZjJOn6O4kPjW9hsAfeoOQ8I/6IZB3w+SIm7ieBIrBCrYV763QsppB6c/z497ZUAASlDeejVB5Hr
	RhXDB+4ArzW8RstpTITSSeF17tOmKjBZfPvbjKuddCmkV7ubGAaGA23sdZ0YG2ydmxlU14XbDsl/T
	HoO+fBXRw19RFmhu9LUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrE-0000000H4tJ-3H4l;
	Mon, 27 Apr 2026 14:22:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr9-0000000H4oy-0qHg
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02C4244752;
	Mon, 27 Apr 2026 14:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE85CC2BCB7;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=bli3EmeSILPYzmn9eMR6QOYwGG7x2r3ZAQx0Kn863sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uY5dv9eNpHSI3Yhtmx6RBg7/lUB9sKj4GhdjwAyO+qkSn1w1KJ1k50F0b5KTFn1Zx
	 ALcMbSdg7zz+lTH5Esyq10c8OTv1iQhqKnvKbhs0u1dTA54mr+Gd+Ofs4Bc/5pqSB6
	 JGpf2JlrTQ32vYlnDp6iPIkgnroILrviS2VQr7X/WwZIs+wd1YDknZb7X43Pz152BH
	 BGSsJz8P7EF4XnJKNSbCjTzT/xHVMV2MaHqQKwq2aK8lHPeERmsA+GPBSuEUW0EboY
	 rxUyOwF+xwRiiqGkzA5N1zKa5FrJH9DbFzg5NeMRGTm497ule6UsMdsJLVEwy/Ub/F
	 RxWhk5g8QTiqQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr5-0000000C8Zo-0106;
	Mon, 27 Apr 2026 16:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 09/10] docs: maintainers_include: fix support for O=dir
Date: Mon, 27 Apr 2026 16:22:27 +0200
Message-ID: <193792d73d08d9f8b9faa8b3df8a1a7439344a28.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_072239_447599_054B14D3 
X-CRM114-Status: GOOD (  15.73  )
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
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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
