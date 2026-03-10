Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E7AFCC9A8
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 01:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Erjw6AjEE8B2VgTfirv75dSCdOa0zRlTwSKColkMx4=; b=MH6FNTfu+O6bBw
	E3PPfOD9lTPWdc30a/oSP2jUVDflB1KnmW8xQUvJLWuEp/nwsIyRufc3aNJMzwhmZ6PASiBpoRO+5
	9IFZ4s5XNQW+BSFfYH2nD2mty2xFdCPGW4eLCTabtxqY1OIN44GhUMcwu9GAPReCdQFfgYwDC3eU9
	tBMGmvI+UWuYMO8w6tsuDyYbrAezNA1Bm6w1aQuT1ePnK98GkPiXxdIAmfrVZ3aSZWIwdiywDxymq
	eyHhSBi7kWnAJy/GZ/1vbtJkTNGFa6WOTYIjQZQDAXOe3MEqXJopVEe30Eqq3bR5q2x6haYmbZZhN
	futo25wjftzoRLSAyUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGl-00000008VXe-15Z8;
	Tue, 10 Mar 2026 01:52:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGi-00000008VWY-2Q5l
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 01:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F2BF4457E;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E4A6C4AF09;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=nnM2zjvYkKOyj9s5ooMFB4/ffFs14ySMOoYr/6UGGu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PmRqzGS3nVJNyRGPSH3I6kRkp2fevQtU8tdhZ7011PZxc3DDMvst1VN2ZvfpAXkdF
	 z2hbwE6uqhF8ac8S9I7JRR/V5V9UdFn385CKXvyK+6DHnhGRJZptjAwHJMgQcKrAzZ
	 jQf4/k2+EMFzGH9LRP2j0XF+A9OwjwtHwLAvgvrAX8AUgX0UMLVJsZ55VyCfipgsYR
	 6VKPYah9V1+iCX7Td+8TXlylyp0ZQfRZ6gGApuJRk+YnlpjQnXVFbdxrAwUfnU+xLM
	 XjImXn8dOA7HKXT9U3xSiWRa9fGkVbsDll/jYVaqhB75yYqU8tsKz+fPA5ZKMpOV2L
	 qgU0eUIar6MzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F93FCC9AD;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 09 Mar 2026 18:52:13 -0700
Subject: [PATCH v2 4/4] selftests: riscv: Add license to cfi selftest
MIME-Version: 1.0
Message-Id: <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=597;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=BASghyhUbPQR3TaCTFC1Bxb1DJuKTtAvjw5yHhn6X94=;
 b=Q1YWdbYniiYp8cgRpgsURgdzBnJ/OsKXk/gnzUPByK9XWSKpz0qoRkkEuNQ3SNyndKtXe33L+
 0bCI6SQLOQGBvJ5CYNkAcWBJFmsTquFN8xfgNg5XVa0/EgKdC5ItG2a
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_185220_651142_AA0C1480 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

The cfi selftest was missing a license so add it.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 96a4dc4b69c3..93b4738c0e2e 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 CFLAGS += $(KHDR_INCLUDES)
 CFLAGS += -I$(top_srcdir)/tools/include
 

-- 
2.52.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
