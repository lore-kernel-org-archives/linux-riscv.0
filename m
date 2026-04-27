Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3790AFF886B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZz/VmiJXxYW/XnZNMnjg3mYkiQRqhi9Y8Syz+5nrW8=; b=FnBr2YBpxJ/LXR
	sm+Ywgx3xYFteF9gdQLTdQZ7Pu1DxNqx71i3pDH7hWk2BdhM9nfmBAC3TVdAolqJcESVGXltd9Skh
	xtDJEBAO+mzKQDF6zoCVYf8RkhE23taseqXjZjVfKyf3Y1y/Nf1NE1PRRS+yomFxhiQzS8HunF829
	yahhen3qWaenGrwbEX7nfarP4R7ZKQt7v40/xa9lcLbATNUADXhnQ4a7k1QqoIGP6KxE5wRyPuw81
	i/GTqFPa7iMZAvysKoohEmlFAFyroxIjLO4CQim6xxPyt9D4ibXimGqgrH6Qi9B1Si7Sb7sSb4tAe
	Kd6PxTpF/I95VwOmawZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrF-0000000H4tf-15Bc;
	Mon, 27 Apr 2026 14:22:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrB-0000000H4qD-36VF
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=EjTY9/Kr5i5PCEiEXPuIN3HIktZTwB9mszC4HHnxbRY=; b=CGr24Yv0EDsYzY0/20kPEWoVQI
	vbbZcq/xgzQTRaRAPqrJHduIGUcM/ftdRMVEToRkJkiF2FZVCLXQXkRKSHR4ROPzttJGL8xgsVIQs
	sUiQuFHOXIKizidSaoxIOAq9CZkUYpP5H50Uj9Cfbdq+DuO/Fbq4yPBiZWHhHWMBDQ5r3lifIBAdJ
	5lajOSD6YRGPOlPZOqE7CAknSFBJ27D2Jc10nTuhfNcseivM46sjZj+oJbs2lJR5UbaT9Aeb+K17r
	RpFlfi1jkTipihaKk7r1IUcVhvRFsA0wjbUjatTdE4a9l1RJOGoRTv7Xhk9QlH6jmEEq9kJVjLhqf
	mrxfXXag==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr7-00000000mx2-1OMl
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09150445BF;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB0AC2BCB9;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=E3XaUZpwsbd6HDm3kWl1GEnwhRzHLxZQZYqA7/UzEm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOteI6RP2hQ5Z8VatsZNOi56HYMeReNNnUeCHpMNypzzBRNowIuk5Q8afZX9a9PuO
	 inRDkHUDgcbnLqyqZtlcSfqh385oY7p8gL7HPeMKCAGXbLLsWW8Zrv/w9JTrUsMiFk
	 UtN4rbfUJtOKV3ntu63AfKhdrOURcxVTzkKyihzDFDLs1Jj36eJc3mwhwGM+zBYTfj
	 NFn4knlPTflKCWqQigA8KnTSurceJAf7JKMFLBeRkyavSHY3yjObIRgLyDa8dtHGFI
	 3/jp1tdUMpjiR+Dnq7mU1oflgRB8F1V1PCRsId/w5nF3dxYcCP2NWBXmUOOdrk+pTv
	 EY8vQwRsQ/bQQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8Ti-0aGO;
	Mon, 27 Apr 2026 16:22:34 +0200
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
Subject: [PATCH v4 04/10] docs: maintainers_include: use a better title for profiles
Date: Mon, 27 Apr 2026 16:22:22 +0200
Message-ID: <8ce9c77c4d8c98e6bad37d838b0e359c8416040c.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_152237_847563_1E9B8BF9 
X-CRM114-Status: GOOD (  11.34  )
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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
