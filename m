Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE47C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNph/fNS7Soa9UKGnFsv4ZyXvblHBz1/YW6RzIW7ges=; b=OuvuKOk277r+m5
	sCroumazg2EXIPGWCkuDdr/XLI4JEBkK1gP5gFf//ilMV8b1oKmuRA8YhFiyzcFrCsLv5fExiH0Zh
	5aYNdSDf2uSneVt1vRGRp9+e0N1Hg8V6PcMHH0s6jKnVrZumzGkzY1qHpRv94Ch5vdEo1DmpPa4e+
	PCzJoiNZhqsAbXbVPUhR2QFunDfMniOXsXO0MYuDJRnaNfCllcNXI0Agi1kAIKhc/Av8UfqJNZ6bf
	rD0WVk4cg7jKK9OnAkXqoHkudus4xqB0ZxiR625OssTgvHo0VpInzh3k/zsgwwunylH/qYzU7Ts7m
	GIy+G2FG5l9O5yN9NdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqv-00000004WuI-1v8p;
	Tue, 01 Jul 2025 09:00:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnt-00000004Vz7-0Mer
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3Z9loxoOzfAEecUgiXSRjkNq2/wt/HRgnj0MonqE6PY=; b=D1qpVzpxTNTnkUKRqBlFEppXhx
	hSWbCyjvR2yMYKk1W5nUQft5p1/031Wnc106mtC9oA/paDQ5WSyt7AG08vYCd2sPyZY2ds+M7eORw
	yCpXtvFREGBaSS2fjlDAvxNH4uaZw5nzIRq8sr2T/B6VfDHbHNxz1uZh9Mt8YZK3mvwHmYLvLAHTZ
	ESaZi11SI3eg1KigwbT7MSySlumamFe8Uv+sCuEe7m/zJ3LZ8nAXS1Kyw099bRaZDE5uomJ42m4uh
	JAlRBF4zapQbGB1qHNSH5Zuhr6B33iiuSn1eW5FPvIfFpGsqEFArT/rBsE5v/PjMxRFVa5cuAdDwo
	D7NxXkKQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnp-000000070dt-3tRh
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82103A5212B;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06881C4CEFB;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360238;
	bh=WZgQ14D22dPLNcKEi9IjqUPAXlhupD02zXCi6Noet+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J2ODeEEgPNRDu9oYlBwdaulZ8f/3Ww5Kk8nUVcACl0lyxIWOq+C/F3UiWDFWJMfEs
	 qmMj5jjkM5McIu4DeeV+9/Wdmg3f6Fe1JUKFpu10Fp0gVuCFe+ToHWKZbe8sVawX1w
	 byhS/y3cnV0ir+h0ZV1cP1cD4on9v0P6HM4oCiqMRgKHqWcf673UHhTDoz2tTVrCnw
	 76BI6mYQtpnl3aa6hrEq/84gz2YEsTPXjzGjxDszyjBuMAivuPWvsUal1uY2alEabK
	 obhrKcGhqsdLTTN0cpBcJ2Vxb7WcK6JzG8m9gigEnRkOeUqC6iJh3de3iM1k+0KEC2
	 OUWyGX7N4ilgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F045BC8303D;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Date: Tue, 01 Jul 2025 10:56:46 +0200
Subject: [PATCH 5/6] docs: Replace spaces with tabs in check-sysctl-docs
MIME-Version: 1.0
Message-Id: <20250701-jag-sysctldoc-v1-5-936912553f58@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6467;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=WZgQ14D22dPLNcKEi9IjqUPAXlhupD02zXCi6Noet+Y=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGhjouvcIQVcgTjcMwYVUzjN9clCy+sHEF9p5
 hcxDDX/MlPGXokBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJoY6LrAAoJELqXzVK3
 lkFPCLgL/0lRvZ0dCLUwkAUFUrId8D+HSxIbi5ts9LpkVtQN+/aLjDaApT5YXFq0LvXbe7+mGXF
 chBdiVr0jGNHhpELcWG5iXprYpknA2Ef0xPSNy/FEjuAymi4UFZuxSHwzfUZmytK/dyrodTb8oM
 j84G7XarKoIMoD8owzE8lI8n6O8BZ3u4C83ry8tepNb3DPYLA5HO7Dc/wcxTdrpc+sat11Vyg3S
 egynAQEAPwKaWvl2jkiZs7yJ8abu1jBagkLlFkcHi1K0r4TDeYl2GsjM7lu7aRNKcYXo8kXdPhu
 o0JiBR/V3vn4kmxpBX/sKDEHSfymiLrg2cGF28Q82vUVQod/lFPmLv9YijvgXRQt3jrurLAvQOy
 0CFHlL1pTRaGINjgYDR74msCNjQtwWQ4OWAXAMaZNiCqcXu4w2dQfpo292e8loG23FwWq7Onte1
 Iocgogu1KdbcEKBPjlPLGqh1AsbOCxy70cbzHq+vPwncrQDhzJUas7/ADAPU6oCpH9zLfx1r6F6
 kU=
X-Developer-Key: i=joel.granados@kernel.org; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for joel.granados@kernel.org/default with
 auth_id=239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095722_351110_579A3D4D 
X-CRM114-Status: GOOD (  15.41  )
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

Remove the combination of spaces and tabs in favor of just tabs.

Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
 scripts/check-sysctl-docs | 163 +++++++++++++++++++++++-----------------------
 1 file changed, 81 insertions(+), 82 deletions(-)

diff --git a/scripts/check-sysctl-docs b/scripts/check-sysctl-docs
index 3166012b9c6ea4435dc77afaadcff3a4944b1ca8..910fd8a9a2684aa709c1572e24fc94d52b093381 100755
--- a/scripts/check-sysctl-docs
+++ b/scripts/check-sysctl-docs
@@ -13,10 +13,10 @@
 # Specify -vdebug=1 to see debugging information
 
 BEGIN {
-    if (!table) {
+	if (!table) {
 	print "Please specify the table to look for using the table variable" > "/dev/stderr"
 	exit 1
-    }
+	}
 
 	# Documentation title skiplist
 	skiplist[0] = "^Documentation for"
@@ -43,23 +43,23 @@ BEGIN {
 
 # Remove punctuation from the given value
 function trimpunct(value) {
-    while (value ~ /^["&]/) {
-	value = substr(value, 2)
-    }
-    while (value ~ /[]["&,}]$/) {
-	value = substr(value, 1, length(value) - 1)
-    }
-    return value
+	while (value ~ /^["&]/) {
+		value = substr(value, 2)
+	}
+	while (value ~ /[]["&,}]$/) {
+		value = substr(value, 1, length(value) - 1)
+	}
+	return value
 }
 
 # Print the information for the given entry
 function printentry(entry) {
-    seen[entry]++
-    printf "* %s from %s", entry, file[entry]
-    if (documented[entry]) {
-	printf " (documented)"
-    }
-    print ""
+	seen[entry]++
+	printf "* %s from %s", entry, file[entry]
+	if (documented[entry]) {
+		printf " (documented)"
+	}
+	print ""
 }
 
 
@@ -71,105 +71,104 @@ FNR == NR && /^=+$/ {
 		}
 	}
 
-    # The previous line is a section title, parse it
-    $0 = prevline
-    if (debug) print "Parsing " $0
-    inbrackets = 0
-    for (i = 1; i <= NF; i++) {
-	if (length($i) == 0) {
-	    continue
+	# The previous line is a section title, parse it
+	$0 = prevline
+	if (debug) print "Parsing " $0
+	inbrackets = 0
+	for (i = 1; i <= NF; i++) {
+		if (length($i) == 0) {
+			continue
+		}
+		if (!inbrackets && substr($i, 1, 1) == "(") {
+			inbrackets = 1
+		}
+		if (!inbrackets) {
+			token = trimpunct($i)
+			if (length(token) > 0 && token != "and") {
+				if (debug) print trimpunct($i)
+					documented[trimpunct($i)]++
+			}
+		}
+		if (inbrackets && substr($i, length($i), 1) == ")") {
+			inbrackets = 0
+		}
 	}
-	if (!inbrackets && substr($i, 1, 1) == "(") {
-	    inbrackets = 1
-	}
-	if (!inbrackets) {
-	    token = trimpunct($i)
-	    if (length(token) > 0 && token != "and") {
-		if (debug) print trimpunct($i)
-		documented[trimpunct($i)]++
-	    }
-	}
-	if (inbrackets && substr($i, length($i), 1) == ")") {
-	    inbrackets = 0
-	}
-    }
 }
 
 FNR == NR {
-    prevline = $0
-    next
+	prevline = $0
+	next
 }
 
 
 # Stage 2: process each file and find all sysctl tables
 BEGINFILE {
-    delete entries
-    curtable = ""
-    curentry = ""
-    delete vars
-    if (debug) print "Processing file " FILENAME
+	delete entries
+	curtable = ""
+	curentry = ""
+	delete vars
+	if (debug) print "Processing file " FILENAME
 }
 
 /^static( const)? struct ctl_table/ {
-    match($0, /static( const)? struct ctl_table ([^][]+)/, tables)
-    curtable = tables[2]
-    if (debug) print "Processing table " curtable
+	match($0, /static( const)? struct ctl_table ([^][]+)/, tables)
+	curtable = tables[2]
+	if (debug) print "Processing table " curtable
 }
 
 /^};$/ {
-    curtable = ""
-    curentry = ""
-    delete vars
+	curtable = ""
+	curentry = ""
+	delete vars
 }
 
 curtable && /\.procname[\t ]*=[\t ]*".+"/ {
-    match($0, /.procname[\t ]*=[\t ]*"([^"]+)"/, names)
-    curentry = names[1]
-    if (debug) print "Adding entry " curentry " to table " curtable
-    entries[curtable][curentry]++
-    file[curentry] = FILENAME
+	match($0, /.procname[\t ]*=[\t ]*"([^"]+)"/, names)
+	curentry = names[1]
+	if (debug) print "Adding entry " curentry " to table " curtable
+	entries[curtable][curentry]++
+	file[curentry] = FILENAME
 }
 
 curtable && /UCOUNT_ENTRY.*/ {
-    match($0, /UCOUNT_ENTRY\("([^"]+)"\)/, names)
-    curentry = names[1]
-    if (debug) print "Adding entry " curentry " to table " curtable
-    entries[curtable][curentry]++
-    file[curentry] = FILENAME
+	match($0, /UCOUNT_ENTRY\("([^"]+)"\)/, names)
+	curentry = names[1]
+	if (debug) print "Adding entry " curentry " to table " curtable
+	entries[curtable][curentry]++
+	file[curentry] = FILENAME
 }
 
 /register_sysctl.*/ {
-    match($0, /register_sysctl(|_init|_sz)\("([^"]+)" *, *([^,)]+)/, tables)
-    if (debug) print "Registering table " tables[3] " at " tables[2]
-    if (tables[2] == table) {
-        for (entry in entries[tables[3]]) {
-            printentry(entry)
-        }
-    }
+	match($0, /register_sysctl(|_init|_sz)\("([^"]+)" *, *([^,)]+)/, tables)
+	if (debug) print "Registering table " tables[3] " at " tables[2]
+	if (tables[2] == table) {
+		for (entry in entries[tables[3]]) {
+			printentry(entry)
+		}
+	}
 }
 
 /kmemdup.*/ {
-    match($0, /([^ \t]+) *= *kmemdup\(([^,]+) *,/, names)
-    if (debug) print "Found variable " names[1] " for table " names[2]
-    if (names[2] in entries) {
-        vars[names[1]] = names[2]
-    }
+	match($0, /([^ \t]+) *= *kmemdup\(([^,]+) *,/, names)
+	if (debug) print "Found variable " names[1] " for table " names[2]
+	if (names[2] in entries) {
+		vars[names[1]] = names[2]
+	}
 }
 
 /__register_sysctl_table.*/ {
-    match($0, /__register_sysctl_table\([^,]+, *"([^"]+)" *, *([^,]+)/, tables)
-    if (debug) print "Registering variable table " tables[2] " at " tables[1]
-    if (tables[1] == table && tables[2] in vars) {
-        for (entry in entries[vars[tables[2]]]) {
-            printentry(entry)
-        }
-    }
+	match($0, /__register_sysctl_table\([^,]+, *"([^"]+)" *, *([^,]+)/, tables)
+	if (debug) print "Registering variable table " tables[2] " at " tables[1]
+	if (tables[1] == table && tables[2] in vars) {
+		for (entry in entries[vars[tables[2]]]) {
+			printentry(entry)
+		}
+	}
 }
 
 END {
-    for (entry in documented) {
-	if (!seen[entry]) {
-	    print "No implementation for " entry
+	for (entry in documented) {
+		if (!seen[entry])
+			print "No implementation for " entry
 	}
-    }
 }

-- 
2.47.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
