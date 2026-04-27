Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4486FF8868
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBFrWMu2XPGyIYb9BY+8DZyeR6XN3IWryqFYU4UrPVQ=; b=sKtR4wMsg5lV/3
	3ga9HekI7gVSmcHwxUU10NZsWVRhSaFMhO/12e14FTpYi1o59BqJhZX1ki8t4vwrS7J8PnrYyG+Bq
	+752VWOl1tgYGJ6z5s/UsJfNlujlcHXQQr+QzgaxFAXSODd++VCVJvBGBURfj0mdGB01snEzcZBba
	OYs9ofh0si1OsTpQLy+cH32GL+Zw4zaFYFGRIELjKpfvjkNF+I3X1uc6S0kTgWGthubnuqvx5Bc7X
	B1jfnfTJHdRd0X7J2x5BjPvTXW1XvbdPzgPeF0WJ5ynr3KHUrUE3NRgzAzvTjA0g76Bapt3V4tQ0X
	Dhto3VYZfpiu+HzXEUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrE-0000000H4sw-1bGC;
	Mon, 27 Apr 2026 14:22:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr9-0000000H4ox-08nf
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 084AA44757;
	Mon, 27 Apr 2026 14:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50DFC2BCB4;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=eFz8XAM9SiBNlLtIZjPZ85JxZ3rANvBqFGiI57xq6pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDWrdDXhnM9SGHEd65ZvmkRefIelu7R38FBdiVDvQJ4yMfucw7PbvXY0nSEKnt2lS
	 nAQF3TgUG0UT0JvN01L5GLAQRko2eecfKcn9apqpgcfZCxnd973AaiV9W+27u1awe5
	 nWG+yEc86HL1I2D8H+Ow8Hrug38v3MMdPSk/Ve/qqcrI0v7wDTXaXV4+5TxU30F1+b
	 P/6NedC89m/nr1cvlyXuknfZ2d0QmRubot2bn6R9lLiOk41i5EGBhQdEkIkxRMJLXV
	 UmREdsu4vZtqdcmAjJLSSkWeYnt97EEUODYV9AHdiCVjwdEdnX/+qKtqdLRfwQmmo3
	 duMRagZlxRWcA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr5-0000000C8b1-0jdP;
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
Subject: [PATCH v4 10/10] docs: maintainers_include: parse MAINTAINERS just once
Date: Mon, 27 Apr 2026 16:22:28 +0200
Message-ID: <8060589074f54a276e563db8cad124d3f88346c7.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_072239_131476_676602A0 
X-CRM114-Status: GOOD (  11.45  )
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

Change the logic to parse MAINTAINERS file content just once,
while still allowing using it multiple times.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 61 +++++++--------------
 1 file changed, 21 insertions(+), 40 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index ae52e8198750..436e7ac42ffc 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -37,14 +37,13 @@ def ErrorString(exc):  # Shamelessly stolen from docutils
 
 __version__  = '1.0'
 
-app_dir = "."
+maint_parser = None
 
 class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
-    def __init__(self, path):
-        global app_dir
-
+    def __init__(self, app_dir, path):
+        self.path = path
         self.profile_toc = set()
         self.profile_entries = {}
 
@@ -67,7 +66,6 @@ class MaintainersParser:
         subsystem_name = None
 
         base_dir, doc_dir, sphinx_dir = app_dir.partition("Documentation")
-        print("BASE DIR", base_dir)
 
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
@@ -105,8 +103,6 @@ class MaintainersParser:
                 else:
                     entry = "/" + entry
 
-                print(f"{name}: entry: {entry} FULL: {full_name} path: {path}")
-
                 if "*" in entry:
                     for e in glob(entry):
                         self.profile_toc.add(e)
@@ -217,14 +213,17 @@ class MaintainersInclude(Include):
     """MaintainersInclude (``maintainers-include``) directive"""
     required_arguments = 0
 
-    def emit(self, path):
+    def emit(self):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
+        global maint_parser
 
-        output = MaintainersParser(path).output
+        path = maint_parser.path
+        output = maint_parser.output
 
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
 
+        self.state.document.settings.record_dependencies.add(path)
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -232,19 +231,8 @@ class MaintainersInclude(Include):
         if not self.state.document.settings.file_insertion_enabled:
             raise self.warning('"%s" directive disabled.' % self.name)
 
-        # Walk up source path directories to find Documentation/../
-        path = self.state_machine.document.attributes['source']
-        path = os.path.realpath(path)
-        tail = path
-        while tail != "Documentation" and tail != "":
-            (path, tail) = os.path.split(path)
-
-        # Append "MAINTAINERS"
-        path = os.path.join(path, "MAINTAINERS")
-
         try:
-            self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(path)
+            lines = self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -254,16 +242,17 @@ class MaintainersInclude(Include):
 class MaintainersProfile(Include):
     required_arguments = 0
 
-    def emit(self, path):
+    def emit(self):
         """Parse all the MAINTAINERS lines looking for profile entries"""
+        global maint_parser
 
-        maint = MaintainersParser(path)
+        path = maint_parser.path
 
         #
         # Produce a list with all maintainer profiles, sorted by subsystem name
         #
         output = ""
-        for profile, entry in sorted(maint.profile_entries.items()):
+        for profile, entry in sorted(maint_parser.profile_entries.items()):
             if entry.startswith("http"):
                 output += f"- `{profile} <{entry}>`_\n"
             else:
@@ -276,13 +265,12 @@ class MaintainersProfile(Include):
         output += "\n.. toctree::\n"
         output += "   :hidden:\n\n"
 
-        for fname in maint.profile_toc:
+        for fname in maint_parser.profile_toc:
             output += f"   {fname}\n"
 
         output += "\n"
 
-        print(output)
-
+        self.state.document.settings.record_dependencies.add(path)
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -290,19 +278,8 @@ class MaintainersProfile(Include):
         if not self.state.document.settings.file_insertion_enabled:
             raise self.warning('"%s" directive disabled.' % self.name)
 
-        # Walk up source path directories to find Documentation/../
-        path = self.state_machine.document.attributes['source']
-        path = os.path.realpath(path)
-        tail = path
-        while tail != "Documentation" and tail != "":
-            (path, tail) = os.path.split(path)
-
-        # Append "MAINTAINERS"
-        path = os.path.join(path, "MAINTAINERS")
-
         try:
-            self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(path)
+            lines = self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -310,13 +287,17 @@ class MaintainersProfile(Include):
         return []
 
 def setup(app):
-    global app_dir
+    global maint_parser
 
     #
     # NOTE: we're using os.fspath() here because of a Sphinx warning:
     #   RemovedInSphinx90Warning: Sphinx 9 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
     #
     app_dir = os.fspath(app.srcdir)
+    srctree = os.path.abspath(os.environ["srctree"])
+    path = os.path.join(srctree, "MAINTAINERS")
+
+    maint_parser = MaintainersParser(app_dir, path)
 
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
