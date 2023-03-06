Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B63C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 22:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/B+SGO6SCCe5t9pylayKktaup69/gXnwNz7gSYTzUgk=; b=mGthBiPImWXr65
	1G8xo1QbbHNzLePnLKeWdiReY7vX3LU6tVHkLvTayGMgFnWF6wp8mkke6p3PshnOe3XjTT4v7zb4j
	BQ9AxXB/gY2FGiizcUKh0NVbuS7Jfb9XWKp5ipmi7zAm4EoQBIBDBnwKO7zGQKKF63BPPcb0t7cHH
	+YFev2feGrY3LtxJTCqS9Ufh4VEQnNtq6F2LbqIbi9L5lMnVY6cWxygUityKWmRGeL9a+jENywS3z
	q52lwa4LtM6AsLhSdIEcZ1fvQ8uLvI+3c42F3pLEHdKrLWRHdXSek6AyoICs/FJDzEQLzjOGJvFWY
	ESMKjliPDk/qyfk68MXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJF4-00FGAq-Ar; Mon, 06 Mar 2023 22:23:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJF0-00FG8r-Pa
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 22:23:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B026B81116;
	Mon,  6 Mar 2023 22:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E78C433D2;
	Mon,  6 Mar 2023 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678141412;
	bh=0ujwpBdDkTkrQ1BoCrcBZae0PDESaKbNQx1rzSbynJM=;
	h=From:To:Cc:Subject:Date:From;
	b=hOkvauOrLZgr4+yrS0NAKrC8yiFi7aK4vbptuUDsCXTf8VbEJ5LnN5kIaeMsPAZFI
	 3XfLgl9ufy025qK+RhxB+qtDktYYlHFToplz10lV78ZuaJgyZITvoz4SOHZeYvrSVy
	 wQ1Z4FYfm0Gjpj0fiaxKzAVg/m1GgWqRefcRZEc2ZfABM+c5eZuYzuYWZGvRKNokNy
	 r/Ek87fhE5MgLyhdxNhefxiFW66lZJDhqQ6E4ktoreqFcrsaGxIU9UnzU/Rha2y1Mp
	 v5lk4LKPhVFuvJSnAjscn+jNzsUWtQTu8MdhkOounYl5GE1wpQUdLH64aNXC1qPLOP
	 hGMCJ/MX4Zlsw==
From: Conor Dooley <conor@kernel.org>
To: linux-sparse@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	luc.vanoostenryck@gmail.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] RISC-V: Add basic support for the vector extension
Date: Mon,  6 Mar 2023 22:23:22 +0000
Message-Id: <20230306222321.1992900-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_142335_012855_7A83F4E1 
X-CRM114-Status: GOOD (  13.49  )
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

From: Conor Dooley <conor.dooley@microchip.com>

I've started hitting this in CI while testing Andy's vector enablement
series. I'm not entirely sure if there is more to do here, other than
squeezing in the duplicate of what has been done for other extensions.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This is based on top of patches already on the sparse list, adding
support for some multi-letter extensions for RISC-V:
https://lore.kernel.org/linux-sparse/20220811033138.20676-1-palmer@rivosinc.com/
https://lore.kernel.org/linux-sparse/20220811052957.16634-1-palmer@rivosinc.com/

CC: luc.vanoostenryck@gmail.com
CC: palmer@dabbelt.com
CC: linux-sparse@vger.kernel.org
CC: linux-riscv@lists.infradead.org
---
 target-riscv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-riscv.c b/target-riscv.c
index 8338d7a6..c8282814 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -21,6 +21,7 @@
 #define RISCV_ZIFENCEI		(1 << 11)
 #define RISCV_ZICBOM		(1 << 12)
 #define RISCV_ZIHINTPAUSE	(1 << 13)
+#define RISCV_VECTOR		(1 << 14)
 
 static unsigned int riscv_flags;
 
@@ -41,6 +42,7 @@ static void parse_march_riscv(const char *arg)
 		{ "f",			RISCV_FLOAT|RISCV_FDIV|RISCV_ZICSR },
 		{ "d",			RISCV_DOUBLE|RISCV_FDIV|RISCV_ZICSR },
 		{ "c",			RISCV_COMP },
+		{ "v",			RISCV_VECTOR },
 		{ "_zicsr",		RISCV_ZICSR },
 		{ "_zifencei",		RISCV_ZIFENCEI },
 		{ "_zicbom",		RISCV_ZICBOM },
@@ -147,6 +149,8 @@ static void predefine_riscv(const struct target *self)
 		predefine("__riscv_zicbom", 1, "1");
 	if (riscv_flags & RISCV_ZIHINTPAUSE)
 		predefine("__riscv_zihintpause", 1, "1");
+	if (riscv_flags & RISCV_VECTOR)
+		predefine("__riscv_vector", 1, "1");
 
 	if (cmodel)
 		predefine_strong("__riscv_cmodel_%s", cmodel);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
