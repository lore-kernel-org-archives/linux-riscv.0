Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09009CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jlFW0wJStq9dKeK3Vtq+L+pVMZYCKj0qBnpTM9rSp70=; b=1riMC2MT+11qqn
	lwQMNX9/K8+akwKWOW0yhXVc5s6ejDl44hfbHm7Cgco46JVFzLqi84wMwCdm2ex9xoT8A9AEfb/PM
	95RoaLbAKGgQpqnEYfGphbcO3QgPthcg6k+PVD9r8gDsfM0L19bYziy9ilzvq3gJRHKas6Ur1B6bq
	wieYHmhho70//VzPlrD3qbZFFvV8qX+TjAWJdOAxiRQOpVUwFvck58jSheJ3Biqh09RdDazw0/d7D
	c7EbwKF2h5kCCYqx3oOSUzPsbNzVlnhic+LImOmR5RCD+FAPfDdBu96uhhruvFWY13yS3q7TMZnfv
	lPmUec2qRAQSyFofYu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmVz-0000000GiQ0-0UiF;
	Tue, 12 May 2026 12:47:11 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmVx-0000000GiOb-02VB
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 12:47:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778590023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=72v+6i2aPLMGvDKwXeJqu+cc9p2Lr8lwtpXy1lG7xAU=;
	b=pPhXqQ3WRZQsQ+IXVUCvsIRUCu6cSntT1iPGWLvprR0ATjHe+v+VKaZPIxw5pe0vs7amlt
	GV4V+svnb1wVJQQRxlPzSJblrcd/0hqePjSRaBSLucskfNyQgVXEj/gwdyG8p0Cqt8JhTw
	sFB///z5vqEzrOBXj+exvRxFQ+uQUDo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nam Cao <namcao@linutronix.de>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Klara Modin <klarasmodin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Pu Lehui <pulehui@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: propagate insert_resource result from add_resource
Date: Tue, 12 May 2026 14:46:28 +0200
Message-ID: <20260512124628.300360-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=thorsten.blum@linux.dev; h=from:subject; bh=PuUPcY5OMP5K1cBvSCks6HMg6sUOyK2ya4wyaOSaxoY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnMiipeapZrIzTd2803hBXukQhZcMpgkdanvV12StYmD HJXxUw7SlkYxLgYZMUUWR7M+jHDt7SmcpNJxE6YOaxMIEMYuDgFYCJXwhn+Kc9ZN0EjVMXgVPLU hg+1u69L8Uxi7Fmf+CK+/YSAQ8fDowz/s3/W/9kl++47N//rN0GXYpr/MxcJ6L/r4ZbZ+0iv9OQ qNgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_054709_253731_99D0A356 
X-CRM114-Status: UNSURE (   9.85  )
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

Currently, add_resource() returns 1 on success, even though its callers
only check for negative values. Instead, propagate the insert_resource()
result from add_resource() to align with standard kernel return-value
conventions (0 on success, negative errno on failure).

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/kernel/setup.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c89cc272440b..6e3d8acae71a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -71,16 +71,14 @@ static struct resource *standard_resources;
 static int __init add_resource(struct resource *parent,
 				struct resource *res)
 {
-	int ret = 0;
+	int ret;
 
 	ret = insert_resource(parent, res);
-	if (ret < 0) {
+	if (ret < 0)
 		pr_err("Failed to add a %s resource at %llx\n",
 			res->name, (unsigned long long) res->start);
-		return ret;
-	}
 
-	return 1;
+	return ret;
 }
 
 static int __init add_kernel_resources(void)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
