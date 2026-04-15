Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD70DFA0C58
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gi+6juIubF/IRKQTaP3DTfkexjOgddNjTa5P6oGjS6Q=; b=vjbEneNVZ1ytQ2
	JIGrFBiZY2WtuHGS4ADiOrahKnznIv5NbuMa8GM00mVhZPuGIVdaQoyS7OhvUfuM41sDsSKq7BO8K
	lKkWaSL6iuoLaTZSSVhHr9Jy9DQseunqxbBbsFO3H9/2DTauyMNYB6FLr6u0c61jUw5lX/OAbsSVb
	vypo1cHfDE3S+Jww3ivpUrAfTj74h3k8RClUPmrgmhrumiU9ePkk1ZbUWNEE0K4vEjYBdLrwK7z9Z
	lok+aQE3r60oy/dv8nIkPvYZxKUkVW6A0czTxzadamg3t7ul8T8+Cz8xq/ZMJLOfCavutobnJq8E/
	zmw3A1W9uUwhJ0PmxpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvzB-00000000qkf-2J6w;
	Wed, 15 Apr 2026 08:52:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvz4-00000000qgX-3Eh2
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 08:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0111944585;
	Wed, 15 Apr 2026 08:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CEBC2BCB9;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=NuYk28Zg9NLnbQ4d/3en1YVQRZ/qBlcvUunSiLU9FFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEWG5QFJonCagHxjCwWmq3nQmc1vL8iCOclwp3pq4z6nNPhE2NunyZ1SPkj6TENde
	 356oWQ+8O5owQF7j67H6sTp49egpkmwgW0JfRDR//hYJ/LDbYx12SHtx5TnpuWFhCf
	 pqiTJgYOjCEfARxc6EO0KE4cRMQU4Z31a0A17sMPhZUlVbnXjovQYL10UHGyJ7uSa+
	 Dj1voZyznbNLT7RJ0veFvpMewM/7v1RcUQMicwo+7ExZ3WcaDjxH3J4pJWeJLkVXf6
	 OwXc709QcWmzt7ICXFWHwJBKhaIse6HZIFAQRTlo+O/N4+RGWcg4Y42HPjjUeT2EO6
	 VnYHf2b39YYxA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELw5-2kUJ;
	Wed, 15 Apr 2026 10:52:27 +0200
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
Subject: [PATCH 5/8] docs: maintainers_include: use a better title for profiles
Date: Wed, 15 Apr 2026 10:52:21 +0200
Message-ID: <c5b370f133b0fd90716b3f53ffaf396081fd58ec.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_015230_893721_FE3E462E 
X-CRM114-Status: GOOD (  11.94  )
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

As we're picking the name of the subsystem from MAINTAINERS,
also use its subsystem name for the titles.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 1dac83bf1a65..cf428db7599c 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -36,7 +36,7 @@ class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
     def __init__(self, base_path, path):
-        self.profiles = list()
+        self.profiles = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -54,6 +54,7 @@ class MaintainersParser:
         prev = None
         field_prev = ""
         field_content = ""
+        subsystem_name = None
 
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
@@ -75,7 +76,10 @@ class MaintainersParser:
             if match:
                 fname = os.path.relpath(match.group(1), base_path)
                 if fname not in self.profiles:
-                    self.profiles.append(fname)
+                    if self.profiles.get(fname) is None:
+                        self.profiles[fname] = subsystem_name
+                    else:
+                        self.profiles[fname] += f", {subsystem_name}"
 
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
@@ -112,6 +116,8 @@ class MaintainersParser:
                     output = field_content + "\n\n"
                     field_content = ""
 
+                    subsystem_name = line.title()
+
                     # Collapse whitespace in subsystem name.
                     heading = re.sub(r"\s+", " ", line)
                     output = output + "%s\n%s" % (heading, "~" * len(heading))
@@ -217,7 +223,13 @@ class MaintainersProfile(Include):
 
         output  = ".. toctree::\n"
         output += "   :maxdepth: 2\n\n"
-        output += indent("\n".join(profiles), "   ")
+
+        items = sorted(profiles.items(), key=lambda kv: (kv[1] or "", kv[0]))
+        for fname, profile in items:
+            if profile:
+                output += f"   {profile} <{fname}>\n"
+            else:
+                output += f"   {fname}\n"
 
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
