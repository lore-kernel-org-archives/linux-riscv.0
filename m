Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEADC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=es67yM/wX4nc0jmRFnYPCRVXjEx4rBQvRgqEtQ9e7RU=; b=hIba2jqVv4pqa+
	GT4SIqFQu/g8Y9IB49bgkXYWE+W8Z/0LQ5sXItyKgATyzAARsLe9K7oRS45Y3drhA1EPkKBzlv3iX
	RGUnBVdj+PhB1CAN9bFFrryqp0m6tiOduNrJbGWuVVNQb/kknR19CxlYrhwY+sYcUrcxij4xMe8e2
	4cPzCTv4ECg3BhxcP0EMPwpKlT/+Qfgj7aw3jGpXgJ5mCazA1QKY38wwzwEYfKkdGUxX+IpNstfME
	9WWw5ZyQj1M/5Psth0udnNXDldy6flKcUaz7HkHQKGDd7Nvzi1gbbvbKf4zspxxZXao8DQS9dLJ1k
	GD8MQGtTLNROpJ2zIOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqr-00000004Wri-3GnL;
	Tue, 01 Jul 2025 09:00:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnn-00000004Vwx-24s7
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3389261443;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD135C4AF09;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360237;
	bh=dEWKHLfVWADiu1QnYIwVkFpHz0JRRQExXjCQUaLKIu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ReaEsB3EaPR8rmbNzY8yX+QZaDj8KFP9YwWt92J1LaIkjgdPF2joJJ0QeLHWp9uP5
	 v+H+0DEBvxu3K2lonwCt/eYovGH0SrCgpRLdZIrnfthA3CT0KneF4Wq8FBsfKj7Y25
	 8NVZqQ/IaNXs/DDDXECVu2UYSJEk1lioARIzJfnYN3csGsd43ZcNP5LjJ3AU7yf4th
	 1JN7A9Cu4RDHqsfz1NQs7+juNduFCA2rLlJqFpgZyrkDosJyJo372su50rMvGoXUZs
	 bO/70xbzatLXMYAvtx4rN7pyobwzuivuhqDs5naqeANKdDXTGEBye3yRAkdsW1jt2v
	 amJG+//KqUXMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29A4C7EE30;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Date: Tue, 01 Jul 2025 10:56:44 +0200
Subject: [PATCH 3/6] docs: Add awk section for ucount sysctl entries
MIME-Version: 1.0
Message-Id: <20250701-jag-sysctldoc-v1-3-936912553f58@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=dEWKHLfVWADiu1QnYIwVkFpHz0JRRQExXjCQUaLKIu4=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGhjoup1BoiQAVRdV9XfCUFoG/uF/frNFIkXC
 i+CR4U02T0/dYkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJoY6LqAAoJELqXzVK3
 lkFPVIAL/0vcTuIFspDtPyHHqoflZX6qS//pVY7/KpYONXZz54qbFsOYcvHsalOcGGRbEyeFThS
 KJkmT1iH2UU8KpuV8wdyHxS7BuJkSGBSCI06dqU1E7NuggI1xdSqJzpj3aj65vbrlVSF/Fw4ysg
 m+ooQgPBmxB2EjAFIL5ymNSvmEeLOtXCj8tpZf992bh3HlVjEWT0I76FstxyqDEDuKAZoeB32vC
 sre7GB8OXb8ePKNLeiICC7ntminZexu5r6dm1FWu2RRfiwx172eK9+/mKSKGfIqXJDe96/zEgC/
 Ml3+i5C5zmoqqfjW8lgE/2Ey7ipB0efkUsUJvJNg40jcITxfeIhDSs8Tj3fzqPpCSdttwqc9DPk
 E8ScOJWN71+ny43P1VI7brgjJbjWztK8I/IPYJfuqATg7tOoDH6lEP5wH/V2xM3pNIRWQMMb3NY
 Hqs/UfkRALjcAXdH/gnssypUCpgQYVLzUM89LnLP3wx67tTwqi2o1ENGRLrQaVG7hk5Cjg37hS6
 Yc=
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

Adjust the sysctl table detection to include the macro pattern used for
the ucount ctl_tables. This prevents falsly assigning them as
non-documented ctl_tables

Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
 scripts/check-sysctl-docs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/check-sysctl-docs b/scripts/check-sysctl-docs
index 568197cb1c0a84147785f05aabbbc6ab9dd896bc..3166012b9c6ea4435dc77afaadcff3a4944b1ca8 100755
--- a/scripts/check-sysctl-docs
+++ b/scripts/check-sysctl-docs
@@ -130,6 +130,14 @@ curtable && /\.procname[\t ]*=[\t ]*".+"/ {
     file[curentry] = FILENAME
 }
 
+curtable && /UCOUNT_ENTRY.*/ {
+    match($0, /UCOUNT_ENTRY\("([^"]+)"\)/, names)
+    curentry = names[1]
+    if (debug) print "Adding entry " curentry " to table " curtable
+    entries[curtable][curentry]++
+    file[curentry] = FILENAME
+}
+
 /register_sysctl.*/ {
     match($0, /register_sysctl(|_init|_sz)\("([^"]+)" *, *([^,)]+)/, tables)
     if (debug) print "Registering table " tables[3] " at " tables[2]

-- 
2.47.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
