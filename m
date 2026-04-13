Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F552F34C4B
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVJUb8AZLndP0jhK9hjTmcqFGD4Ek+kvSZztUa3cwEQ=; b=oaQHilxRAOFV6D
	RAgJj+eVQocQgjXE1DpfzB+7pT42vbioo1Hoco5m3EnvrqZTycZIf2hrsBAvcqnyacn7OLGroWkwI
	dnUdB2YbBmBSmrHhsNlbh42BXBdRHqJ5O50YUGDrylSM502K3cgNWckDsw9Nv0fF4ZDv3PKUc/giQ
	MF4seFQDbg28tTOiI3SAWVefAy6aU8lSPOY7n1Mip7PNNBwIUDhx1QjiFl3+2lGbhz0qNmaF8LSLE
	O4edBB2yL0L+T0WEGl6/K59VSKant0JOe59KwsA99KmkxI3lARX2YJrqKNh6QAZkBihJQ0ompO6jP
	DqnVTbFMOwFfuycQ2cSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGVx-0000000FfAC-3YtQ;
	Mon, 13 Apr 2026 12:35:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGVv-0000000Ff9b-44re
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Apr 2026 12:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7Hlyy897FkIH88wO+9YzMLj1InHnS0uDojWiHpxYa40=; b=V+4y16hDHun/bUiU3lOQoLAjd7
	tzOb0saxGAC8hvpTl+1KpWLI1jXCjKX63LHKkKsULFVhY04Kq7EblKXAMQ5NriKZ7/LjutOwK5T8Y
	0/9DsQXW3dN4hr9QuJQ1gIbPP0jlQac/F6wknL3YteElPO9V6Ve+iaBU7IiQRWNPuzzD3wt98+Wgu
	3U8FMbmVTLwUFG5QFL27nW94LquiCCOTvfs5d28GQRD1pvl2eiOG1HoHOkLnFfWI3L8OxTGNuRPWx
	iy8ItjC1y9IdqYvN7FyloNGHCNr16Skl1mRy1pfgk2+DQLC597/8SAhDrQpgTFQSv8yXjtmRD+cOi
	vvGF0nWQ==;
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGVt-0000000GnIO-0pTo
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 12:35:38 +0000
Received: from hwang4-g16.. (unknown [183.241.38.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 5CF8F40D6E;
	Mon, 13 Apr 2026 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776083736;
	bh=7Hlyy897FkIH88wO+9YzMLj1InHnS0uDojWiHpxYa40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=ef+vFQRIDac91CFKGnACqrZD9pTUoiA8VuTwZWvrYfQdG+ZeU6jUQXO/TE+vSk1qB
	 AgzoEICg+lQFUUG7jf7D2uMKOBbqxW9ZUTUSlibcQ2dFmsYmLFTQ1ZppnI1nFr57nP
	 j+Se62xyW/Qo71hEzOqtpO+NNhqdM1NCnNGwD+AaV3Ta66zIW/9C/XtpwiOadMltXU
	 hPIuf8qeUSf+44nb5uTgAH3oH6qJMQqIL8IHXJY3Cywxdd+gDYUyOyeHTIcI+h7ZEp
	 choemBdaVg1qmpdGad0tEuSnlx55ja/IpC7TsxsaodV/NIRUMjS/7GoYSEA6MgW3PF
	 KXC7ssFegIpykcODkkUvnXbdbxRItF1zZEHlMMxgVER6ZenqtT9QAIwAfPP5bf0U5s
	 60j3QEUEQ2OTimFW3gve8KgCdkPhLlZ4tDAagS8vZdIPEIQlSzrKxC2D9wRBCpJ4jR
	 gO4BlFbQHngWgYDqjgWzY2TMTp4rgSgZlKZTsvvTdBwqzRuzSQGZeFOhE+t6hNEcWJ
	 EJFojBMtGvTSR4aJBoEMd3183RjXzw6T5HCKbHh43eyIjPPsJ4XmyYpwLgornz3xXm
	 Qrno1zhFtM1pqL9GbkbdFNvw+CNHLMzZmd3ui1bOJdnA1HhU6WJ5Pb1fTdQdIrbqEK
	 Z/vu67xRtQpXoawlXB/TSCkY=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	danil.skrebenkov@cloudbear.ru,
	ajones@ventanamicro.com,
	atish.patra@linux.dev
Cc: hui.wang@canonical.com
Subject: [PATCH v1 2/2] riscv: cpu_ops_sbi: No need to be bothered to check ret.error
Date: Mon, 13 Apr 2026 20:35:15 +0800
Message-ID: <20260413123515.48423-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413123515.48423-1-hui.wang@canonical.com>
References: <20260413123515.48423-1-hui.wang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_133537_358944_02174B78 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If the ret.error equals to 0, the sbi_err_map_linux_errno() can also
handle it, i.e. if ret.error is SBI_SUCCESS, it will return 0
immediately, so no need to be bothered to check ret.error here.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index b6de2b2f8deb..037ecf403a0a 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -30,10 +30,8 @@ static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START,
 			hartid, saddr, priv, 0, 0, 0);
-	if (ret.error)
-		return sbi_err_map_linux_errno(ret.error);
-	else
-		return 0;
+
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -43,10 +41,7 @@ static int sbi_hsm_hart_stop(void)
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STOP, 0, 0, 0, 0, 0, 0);
 
-	if (ret.error)
-		return sbi_err_map_linux_errno(ret.error);
-	else
-		return 0;
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 static int sbi_hsm_hart_get_status(unsigned long hartid)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
