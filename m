Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6A8CA9ECA
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 23:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NP8c4u//UsADfAR1S4O3tHb+wXHF3WXFwHCBtDYPLx0=; b=K4iZrBfDf0mzqp
	0WIbsp9pLLi/mJw4tuAl1iH5clvZ4yuX+5hkXXvaRuX1c3fkAvI2KROfnm6ikKNZb982HKIejTOIK
	Xxj3iTJxv0c48XkzvKiIa1Pv+PVtGQwkd705CSojn35YUrtm1F8D/sTOxfetwBFQQbLGgH3n4W1xD
	qalUGrkIkIjsGi+2rarnVr/IcmaCoxfEpQhXNctTn+GOTQ8DoX3VGkakMmKPOHIiiG8w0GZzW0g9Z
	rYArbRIWU05N7jeAEY9Dl9kVwJtV+IGxd1MywIoV5AuQENb8f0z+RHKya2lwl7VBKurFrMB3D/MTh
	cNwzKsgE+exGrcOjAUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFgmF-00000008YdG-32Dl;
	Sat, 10 Oct 2026 23:46:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFgmC-00000008Ycr-03Gs
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 23:46:54 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AA8733F19A
	for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791676007;
	bh=pQvssHYBZZeCPq+XUhxAF5bUl+NBotKc8Bo70aaWCyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=IzTA7/Vf1/0N+9t2h+6/OwgKSN2rskBtFqQQi2wZjjnLYH4nACZsOrNpP/4fNih2y
	 /fw26622i6x6z0rpUKCpYT4/gkE5bx4Jdei5vTBu76uMjZ/9gpEfYlY9LyVdCJGI0r
	 zhA89dC5riH8yHcij7hQwrqIVeqMyuOQNPvPGofrJd7mh8950/C2Nz/9t5r2xRX65J
	 E9pBszcyeSwLZDnSXQJsQfT6jz8HwNuCRFnzR+M2oGb41aSY9Fy5hiQ25kcWz2oHVK
	 JKLa7RhodFvFDPB74B93BnS0TIhsE/1kIfD0s1Vyd5b0Be8v68wgOzkU599/hxFbC/
	 j2dYbc66cMkcvUsBQ1KjIl2vjo+y5Xc/yqf73XzUjP0r0NitDau2+vj3HU8ZbeLTk1
	 CHOJDtoMATOiLlZR4hjFL73Nxb17JYypxVn9xebec0oKB3GSUEd0/Zq3Yduhzj49zZ
	 8bTux80FK44MJvhJDZX0Sx7Pbn2Rx3kIdQM91EcvNZExTqcyWPmxSizd21vQ+A4Oy7
	 kkujupwwzcA5lU/i89Lns+bNoviKQJTL2OE+IpD6qKrTeoSR+KfCAZdzqTQJU5My6Y
	 y1pAu0Hqrhw1Tgm6jpnNQUbTLMb0kUkCSxO+IFV9awYBKWzUu7W7cMhWzQmtKJhog7
	 Ff/XIWNfGMi6Dq6R+m7YX4Cw=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so6797665e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 16:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791676007; x=1792280807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQvssHYBZZeCPq+XUhxAF5bUl+NBotKc8Bo70aaWCyo=;
        b=JRe4tCEQu393dEtS6xoih006OGPLrSsLxNbnPKHEcXr3pkhKYT1CUmf7MKKPepa2j/
         9WvxtuvmmWVDbH8DHoSkHYQGufNrjF6Zi8dycbLmrHxpemVmxxsBP3ngR86wEIdaG1Rw
         J8aoE9DsxlqSQf98qiFNRG/piujDZcnedYNdJrKlZTlZyvSjACA+4o12NEdOmonGKxl0
         QS1Q8KyHnqaocZWntzDkK3agqDHxOER41sNsAKwQ+nwpvauRqTMVlhSWnfW6DOUYpwOG
         vB6AsJnlJ5eqoo8IY4DqP3WWfSkv7rgfNyxQcAznUjNEl/saEXAa9nKxMs2/Eks29q7U
         8yng==
X-Forwarded-Encrypted: i=1; AKwUvBwTvUyqkx2Tu2ymPOyOcMtullBHIDWh93gYgZf16vfJrC0OV4s2xDXFcf2bGzOMUI6oJaH5BlCXnPM4Ww==@lists.infradead.org
X-Gm-Message-State: AFq9FYKYD+UbHuLPYmfblB+6vfhcc44SRik8V9z7SadyoPm5ZUuaPXEo
	CKd1VrDM+vEm4lz/+Wp5CuWMBAk4UUH+zOr84Hdgqghw9coOD+rNyj4Y7d77gAOblDjwkmbwJgY
	4RaMV75UZsGup7zU4NTtXPetLeSib56e2+vnI6E39ijEm+oPJxZalcY0NI/ID+g+uOZlQH1afTO
	vJf8WL81hfVQ==
X-Gm-Gg: AYBFou2MU/0CMS0OuAXAJmBc8LMp6jUnzkjAE+VJlFaR2qg58a3j48N72vICm4mjC8O
	m9QR2S4LRVitG5nbc4YQScHZIVPqmmRPnt3j8TTW8tmdFOCK6cHVdNMDm/XEGJ9u66nI7bulUzZ
	D0yDl2npIr7QqW705WNyVMB3CvSAhotTTAAIaReZIBIrzz64UOdJ0dXCh+hyCIjJTZZeEWLX+Dg
	cUs+9nZdJEl0Th8s71pNWpHEzbqbVTvtg3hvOkCZ/dnMeUpzVCA02iPSbFXC2jPHLkNa9AcK5vy
	m0Cr/tgIUWZR+woVn7jMDtylRmJSDeXWz+YeVRi+LHwZxpufhkyc5g3C9RAAN0fYLhF3bQ==
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr99936235e9.8.1791676007283;
        Sat, 10 Oct 2026 16:46:47 -0700 (PDT)
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr99936095e9.8.1791676006955;
        Sat, 10 Oct 2026 16:46:46 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm85743135e9.1.2026.10.10.16.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 16:46:46 -0700 (PDT)
From: Sarah Emery <sarah.emery@canonical.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Sarah Emery <sarah.emery@canonical.com>,
	Hui Wang <hui.wang@canonical.com>
Subject: [PATCH v2] selftests/ftrace: Account for 8-byte aligned trace_marker_raw events
Date: Sun, 11 Oct 2026 01:46:45 +0200
Message-ID: <20261010234645.173550-1-sarah.emery@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_164652_460502_240913B9 
X-CRM114-Status: GOOD (  15.72  )
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

trace_marker_raw.tc expects the length of each raw event to be rounded
up to a multiple of 4 bytes. That is not the case when the ring buffer
forces 8-byte alignment of events (CONFIG_HAVE_64BIT_ALIGNED_ACCESS):
the id plus the data is rounded up to a multiple of 8 bytes instead, so
trace_pipe shows 8 * N + 4 items. This was seen on riscv64.

Make the test accept either rounding.

Fixes: 37f46601383a ("selftests/tracing: Add basic test for trace_marker_raw file")
Reported-by: Hui Wang <hui.wang@canonical.com>
Closes: https://lore.kernel.org/all/20260607072431.125633-3-hui.wang@canonical.com/
Signed-off-by: Sarah Emery <sarah.emery@canonical.com>
---
Original v1 patch from Hui Wang was posted in June and only patch 1/2
was merged (commit c37e0a4b79a6).
This is a v2 for commit 2/2, addressing reviews.

Changes since v1:
 - Drop kconfig_enabled() and the CONFIG_HAVE_64BIT_ALIGNED_ACCESS
   lookup. The review of v1 objected that it depends on the kernel config
   being readable from the test environment. The test now accepts the
   4 and 8 byte roundings based on what trace_pipe prints.
 - The expected length for the 8 byte case is unchanged (8 * N + 4).
 - Rebase on 65f26d15f7db ("selftests/ftrace: Fix trace_marker_raw test
   on 64K page kernels"), which changed how the test writes its events.

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
index f985ff391463..dd2b94be0947 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
@@ -67,7 +67,8 @@ test_multiple_writes() {
 	# add a little buffer
 	echo stop > trace_marker
 
-	# Check to make sure the number of entries is the id (rounded up by 4)
+	# Check to make sure the number of entries is the id (rounded up by 4,
+	# or by 8 on architectures forcing 8 byte alignment of ring buffer events)
 	awk '/.*: # [0-9a-f]* / {
 			print;
 			cnt = -1;
@@ -77,9 +78,12 @@ test_multiple_writes() {
 					i++;
 					cnt = strtonum("0x" $i);
 					num = NF - (i + 1);
-					# The number of items is always rounded up by 4
+					# The number of items is rounded up by 4
-					cnt2 = int((cnt + 3) / 4) * 4;
+					cnt4 = int((cnt + 3) / 4) * 4;
-					if (cnt2 != num) {
+					# With forced 8 byte alignment, the id (4 bytes) plus the data
+					# is rounded up to a multiple of 8, and the id is not counted
+					cnt8 = int((cnt + 3) / 8) * 8 + 4;
+					if (num != cnt4 && num != cnt8) {
 						exit 1;
 					}
 					break;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
