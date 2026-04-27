Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD37FF886C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iT7RPbf+DCJaJI0iAqlVQ/4ctDytgV7EWjjsPi7Too=; b=ek/0vTF6/t5tDE
	TyyQAKSo/XOyeEHwBl8Ps1bO915sHriYFTma3O7Ixl1V6GOgZ0nexuwZhwE2Rjx1Pj9/HMkRYevys
	xRAsdkn8KrH4ST3Poi9WHh8eUMY44q/7DrCMnMGowlc1grGwf3M/+tSYo4ceCVbHjVEdpzGRJY34I
	b74GdBLECkj6szqm7tQQV7zkF6aIx8imTjYZaakyuI8A/khUOsdAFqWt32Xqn1/wZyOC9F+wiCO6f
	vAwZ7G5XNwEt+9VTSFl4gL11cRAlzlFQVNwTz/TWsi2P6ThvjBXP6dNYUq4nAu9eaRx84NPbLhjn9
	cZWz8Hx0dexlJ+3N9UlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZe-0000000GwzT-0kky;
	Mon, 27 Apr 2026 13:00:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZV-0000000GwrK-1zti
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C8340468;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3139C2BCB4;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294819;
	bh=2EHIpNiSQOvDao9ENEGwgn3WieRzrgdPXVweOZ5ti+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XoHzOXytyzqgCwFjACv78UpHahmHq9v2mqJUBZP9+jZKzRWTtm77kC1qU7nmEgmAg
	 ZeiVxMV3f6oqjYUUDdiWofAPvmDWK+1Zp8c2ZiQcUf709pbwlaM5UXuY0rE7mdoncr
	 rAzvSu38KQErdiu/bdm0Ns6ZnaM5v9gRSca5KOA+ywzbMev558uOr1bjn1eqxYhadX
	 yzH0BVOfGnfCP+V3CWMpNK7N/EqPGFFJ7mRKfsEojLzI9xym981qPLJ/Cn5cRffiGd
	 JHN2er1e9U6aBuDn8lANTLXg6tYrQClE/v70il4uQAqIhi7NEERmqVanHErXQwjO87
	 GGV8Q0rmj/dwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZR-0000000BxG6-4Afv;
	Mon, 27 Apr 2026 15:00:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 12/12] docs: maintainers_include: parse MAINTAINERS just once
Date: Mon, 27 Apr 2026 15:00:12 +0200
Message-ID: <3a01afc58defa4eb92df709b517392ef550f81b2.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060021_819268_5A282160 
X-CRM114-Status: GOOD (  11.85  )
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
