Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35036FF886E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H14Y5ynH2DFpdNh40Py0Zp+2EOent3ZlDWCl/DBvAzs=; b=GS0PB7/dQFbP2h
	JG3RMtTc0hpM7fDYo+Hx27yCREaiWRxlFlHLQN0bxG16nQDqbdTfY978hcBgfEDvPogj9UbyG/tRo
	Gw1NN7jp+4THDAPega29sAgg/hxg/TrhjsSRh+IUfQRxJX8YHc0OirZfvcjpuzJxM9RoH2Po+adcf
	zE5WwqUM3Cj8V7fS7ey2DfTnd7mxsFRK88oJ6vsM2hpIp6+z/j9wH3ZP9AIKDV6hNAu8dMA69qtOb
	TirsRlV6g1QywPZj8wpA6ox6pIi+jcS8Vy6dlDDQIyH29YdPD9xMYHY8m9lQJ6Tl/mWNBQ6SqqLBB
	N+cdQm3RSk0Jg+4D2scw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZc-0000000Gwy4-3NeO;
	Mon, 27 Apr 2026 13:00:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZV-0000000Gwqp-0O5e
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D0734477B;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B883C2BCC4;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294819;
	bh=foSitjGjVjWkt3FOsEjErrXwoSNFIILUN9JQwZDwqYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qvev6HLJuMayIpthungyNVUdSr2Z2XZPDzRo7epemBAJ5/RSlVHAa5TEp9LxOU8c2
	 la2K3OpTx3G/d9kIUrhtC5KyoHROHPddBfJqk1OyosBd8OGBRFmMVBftv8lEsdCk4E
	 83ZpBT8uRn/nDhicLaqZc5mw+jLzEWlBH8S1Qp7uwK4NOMuKTr1GPkvbFk/8Qoskxn
	 UyOZ5smkEZFq1pc9hiy0V4MW/iG0qqRvQFskGQBV411UT0r0AN2SExI2i9Gl0glpoL
	 Skl/brxwB1BfU/adurrwNa1ooEBTwxTXZtVVnBS1557ql3PInU8suRKLk7LFmfwnfG
	 n5Y251VWyMZAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZR-0000000BxDd-2hcX;
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
Subject: [PATCH v3 10/12] docs: maintainers_include: improve its output
Date: Mon, 27 Apr 2026 15:00:10 +0200
Message-ID: <b88c8e9681a90bcecbbf1121bf3c5cbb2cf82930.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060021_228628_116764F6 
X-CRM114-Status: GOOD (  14.11  )
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

There are three "types" of profiles:
1. Profiles already included inside subsystem-specific documentation.
   This is the most common case;
2. Profiles that are hosted externally;
3. Profiles that are at the same location as maintainer-handbooks.rst.

For (3), we need to create a TOC, as they don't exist elsewhere.

Change the logic to create TOC just for (3), prepending the
content of maintainer-handbooks with a sorted entry of all types,
before the TOC.

With such change, we can have an unique sorted list of profiles,
having the subsystem names used there listed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 76 +++++++++++----------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 7ab921820612..5413c1350bba 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -21,7 +21,7 @@ import sys
 import re
 import os.path
 
-from textwrap import indent
+from glob import glob
 
 from docutils import statemachine
 from docutils.parsers.rst import Directive
@@ -36,8 +36,8 @@ class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
     def __init__(self, base_path, path):
-        self.profiles = {}
-        self.profile_urls = {}
+        self.profile_toc = set()
+        self.profile_entries = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -73,26 +73,24 @@ class MaintainersParser:
             # Drop needless input whitespace.
             line = line.rstrip()
 
+            #
+            # Handle profile entries - either as files or as https refs
+            #
             match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
             if match:
-                fname = os.path.relpath(match.group(1), base_path)
-                if fname.startswith("../"):
-                    if self.profiles.get(fname) is None:
-                        self.profiles[fname] = subsystem_name
-                    else:
-                        self.profiles[fname] += f", {subsystem_name}"
+                entry = os.path.relpath(match.group(1), base_path)
+                if "*" in entry:
+                    for e in glob(entry):
+                        self.profile_toc.add(e)
+                        self.profile_entries[subsystem_name] = e
                 else:
-                    self.profiles[fname] = None
-
-            match = re.match(r"P:\s*(https?://.*)", line)
-            if match:
-                url = match.group(1).strip()
-                if url not in self.profile_urls:
-                    if self.profile_urls.get(url) is None:
-                        self.profile_urls[url] = subsystem_name
-                    else:
-                        self.profile_urls[url] += f", {subsystem_name}"
-
+                    self.profile_toc.add(entry)
+                    self.profile_entries[subsystem_name] = entry
+            else:
+                match = re.match(r"P:\s*(https?://.*)", line)
+                if match:
+                    entry = match.group(1).strip()
+                    self.profile_entries[subsystem_name] = entry
 
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
@@ -234,26 +232,32 @@ class MaintainersProfile(Include):
 
         maint = MaintainersParser(base_path, path)
 
-        output  = ".. toctree::\n"
-        output += "   :maxdepth: 1\n\n"
+        #
+        # Produce a list with all maintainer profiles, sorted by subsystem name
+        #
+        output = ""
 
-        items = sorted(maint.profiles.items(),
-                       key=lambda kv: (kv[1] or "", kv[0]))
-        for fname, profile in items:
-            if profile:
-                output += f"   {profile} <{fname}>\n"
+        for profile, entry in maint.profile_entries.items():
+            if entry.startswith("http"):
+                if profile:
+                    output += f"- `{profile} <{entry}>`_\n"
+                else:
+                    output += f"- `<{entry}>_`\n"
             else:
-                output += f"   {fname}\n"
+                if profile:
+                    output += f"- :doc:`{profile} <{entry}>`\n"
+                else:
+                    output += f"- :doc:`<{entry}>`\n"
 
-        output += "\n**External profiles**\n\n"
+        #
+        # Create a hidden TOC table with all profiles. That allows adding
+        # profiles without needing to add them on any index.rst file.
+        #
+        output += "\n.. toctree::\n"
+        output += "   :hidden:\n\n"
 
-        items = sorted(maint.profile_urls.items(),
-                       key=lambda kv: (kv[1] or "", kv[0]))
-        for url, profile in items:
-            if profile:
-                output += f"- {profile} <{url}>\n"
-            else:
-                output += f"- {url}\n"
+        for fname in maint.profile_toc:
+            output += f"   {fname}\n"
 
         output += "\n"
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
