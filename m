Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58357C8303D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srSGnZiQESncwDRonyD6ydMVwIcGgXlQBVPzDZtbaRk=; b=SI6g7vwRlxWJaB
	Gm/jYzxjUFpCnEk9DjNoFhpXGgm7rl+wW4tL1MWStFYHtJtxDxdn553tNupF2vvxHWfE8Gf+ldwnA
	ShwcPhRo/xacHHjYiUvlO7VIs83MDwTVE/rMQ2CEDxpE0KndMvOuOWXdGJFuiNLceDasukDfidGz2
	//zxb47EUJUuAFUIymm6m1XN1rtvhni6Fs23O9R4YddY29r7rojufLT0WKwnH9q83TVRc/YGcUpzR
	Wpg1e+1unyGMNpKAu97Vj0TYcuW003LV80bI9sFbVSRP81yTorMxR6wlOWQDCNbQM779lQcGZFpj1
	BVsnm9TPIyzUN7tP7LAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqs-00000004Wrv-1gt5;
	Tue, 01 Jul 2025 09:00:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnn-00000004Vww-24xV
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3392F61444;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9B17C4CEEE;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360237;
	bh=4SwDv1lBWtZq4b3iXzi192DtKqn0vm08JtS+5Pq6gkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OEahNi7642nIp4UnaCb8lSgGAGeZUhZA0hiFBNsMu0en7mCQ4uCgta4ZflICPYR7N
	 uzpl2QSbTzOs8GpQIthBa4jYQsUU2w1Rhg68YCDToC9yX0SI5nHGnuzdfy74srHeTl
	 N8INFIBiWUifdP7Mnfit1GhTljpIjg4/8/iX/bvtlAEJ9eVRf7oGEp9jrQzMN+NzXk
	 wPxkCwfg2n/QjTC7e3/HTvMAl8Jbh5jVEznP9AwpZchMrKAb7AoFFXBJc5F23aZY3G
	 qWnFvrNMlGAnCdqnb2pSUdQ+NAyBHCgopW3xsWY6wo90WXT95ORAISFSzgnpvPs9Us
	 CKgXDmjM9+Sjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EBCC8303C;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Date: Tue, 01 Jul 2025 10:56:43 +0200
Subject: [PATCH 2/6] docs: Use skiplist when checking sysctl admin-guide
MIME-Version: 1.0
Message-Id: <20250701-jag-sysctldoc-v1-2-936912553f58@kernel.org>
References: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
In-Reply-To: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
To: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Joel Granados <joel.granados@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=4SwDv1lBWtZq4b3iXzi192DtKqn0vm08JtS+5Pq6gkE=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGhjouk395j9INJu6XGoPtLhnYLVRImz/idRJ
 Bw1XhnQJa7A9IkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJoY6LpAAoJELqXzVK3
 lkFPByAL/AhVuluFhQDaN1/+hYluKuL1g+JPOvAP4y4xv+4ypZ8F5drM1GN4DF5TmyoRLxXOSte
 Hk+Owhk8bCsbQqMwaFhnSyAoEP0OgJFGOClUi+dqj8sVzOrrGVn26h9cXIHZitUYwb1THgZY6b3
 Xn1k+BKUbkBU+jC34bUPBsHU5ikcShW6sVXGUTedVUutMDzCRknCEcEWDMPRIYtiboRU/FFY9cD
 cgNpkgw/IM3udgid7ijUOoYclmWebEdkcp3wJq0Aq/UVB2wJk0LXUQMomqlk6TeeulnBOOoS+6L
 u+h4pQ44Rw2zBEDS96IOrpN0RwHGaqVFVwzxj2GGQyxqk/BwxDjll1F3HcOpjhIHFC6M3ZsI89l
 6aykS9jwuHMXaAk1aycsIZHgJhkWvSQqyEiN6IEQ46wObE4ygQTjlcHFlqDjmOUxXr4G99RdwLx
 liuj2ppd7SGWMIkl0sOX3OW/3VdiPiZ/D/m+INYc5s50dxN6A8LQlzXDgcJbGtaptV28509kBi3
 WU=
X-Developer-Key: i=joel.granados@kernel.org; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for joel.granados@kernel.org/default with
 auth_id=239
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

Use a skiplist to "skip" the titles in the guide documentation
(Documentation/admin-guide/sysctl/*) that are not sysctls. This will
give a more accurate account of what sysctl are miss-documented.

Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
 scripts/check-sysctl-docs | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/scripts/check-sysctl-docs b/scripts/check-sysctl-docs
index 178dcf2888ffd21845e8464fc2595052c02ff4a3..568197cb1c0a84147785f05aabbbc6ab9dd896bc 100755
--- a/scripts/check-sysctl-docs
+++ b/scripts/check-sysctl-docs
@@ -17,6 +17,18 @@ BEGIN {
 	print "Please specify the table to look for using the table variable" > "/dev/stderr"
 	exit 1
     }
+
+	# Documentation title skiplist
+	skiplist[0] = "^Documentation for"
+	skiplist[1] = "Network core options$"
+	skiplist[2] = "POSIX message queues filesystem$"
+	skiplist[3] = "Configuration options"
+	skiplist[4] = ". /proc/sys/fs"
+	skiplist[5] = "^Introduction$"
+	skiplist[6] = "^seccomp$"
+	skiplist[7] = "^pty$"
+	skiplist[8] = "^firmware_config$"
+	skiplist[9] = "^random$"
 }
 
 # The following globals are used:
@@ -53,10 +65,11 @@ function printentry(entry) {
 
 # Stage 1: build the list of documented entries
 FNR == NR && /^=+$/ {
-    if (prevline ~ /Documentation for/) {
-	# This is the main title
-	next
-    }
+	for (i in skiplist) {
+		if (prevline ~ skiplist[i]) {
+			next
+		}
+	}
 
     # The previous line is a section title, parse it
     $0 = prevline

-- 
2.47.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
