Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D21C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C160720652
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sqrUt+Er"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C160720652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dfJpd83e3FiXZohR/5U4tNgbc101GZZH0v0g01vVP8=; b=sqrUt+ErYm+5b9
	rXthA0OvRSZPm/xXN3kWg+ZmYWzpKG35jMxN9kWL+A20pgxRax0pDDE2u5jBKG6VsDzhdDnTj0QSD
	KfPg77KpM5drkR0GNfN4TB5JaL4CNHkzRiFZu1XGzgWASgAhx1UeUghf0AmtU/X4qfhgM96N/6xh4
	xKm6ZCydw4rgujZ6tgUYyg2h+hQA3wvhvVT2MHHu1L0QEZhohFBSek62CfjNGgarBiUE5jFCcBmM/
	SnkWuUGZPHjnxjBzpQOdB2JNd7/Xu5VXj6PYKJ2kWwxBnsERoteu5FKxKHvoJtsoSieo4yDIjZ/0J
	pBVkZbYMLbjjbFbIDwiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUlT-0004tY-Ca; Fri, 18 Jan 2019 14:04:55 +0000
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUlI-0004hn-3e
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 14:04:47 +0000
Received: by mail-lf1-f65.google.com with SMTP id y14so10548337lfg.13
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 06:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVF/+rdzQVmDvcOxbIn7hLVP8/m/t64C/jXS8/amg08=;
 b=VpxiQbDCyywb6TypVz3rjfaffyt6P98xM3a0GszbiHUxrX4FyB5XWhPbV4jSIxCOY0
 vlmm35ls7dpq15tbQrOdCWV5ifWrEv//gLO7far5kuXMpa9+HXJMNY/Sm3g8rfdfoETz
 ds86Z3EtYl2elMHisqoHFqIlRex03eGRt4LtocvK4XEuJTNATzXAXSbCTBaFQvAc9fUf
 59xAtcwanUpZGJc3+9wCkUrtVcppCWZBxCyKxo/vnyUmWAuNqPJ9kT5h0WkzIdmn7nQH
 oM9AEEgURc+2pig3yNOr0LLoAUvw1nk3S6fbFUb+R0GXvJbXuaYXM01TnvYo7CV7GqB5
 kl8Q==
X-Gm-Message-State: AJcUukeLpD+p9u48jl7wEl23GCzJZRLWfOljlsBeTEaJ0g+rkz1lYupo
 gYAw0DUNv7pP7HvGWQGBquI=
X-Google-Smtp-Source: ALg8bN5VHtjHufGJDP70XS1DLwgcclDu4iucZkN6BBJ2OgpQrlnqRayI53u2/+HkbgEl4GhkgbfLrw==
X-Received: by 2002:a19:a9d2:: with SMTP id
 s201mr12312768lfe.154.1547820281063; 
 Fri, 18 Jan 2019 06:04:41 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id d10sm816549lfa.71.2019.01.18.06.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 06:04:39 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@xi.terra>)
 id 1gkUlB-0002WA-Gq; Fri, 18 Jan 2019 15:04:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 5/5] riscv: use for_each_of_cpu_node iterator
Date: Fri, 18 Jan 2019 15:03:08 +0100
Message-Id: <20190118140308.9599-6-johan@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118140308.9599-1-johan@kernel.org>
References: <20190118140308.9599-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_060444_226721_3B2F8C55 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Use the new for_each_of_cpu_node() helper to iterate over cpu nodes
instead of open coding. Note that this will allow matching also on the
node name instead of the (for FDT) deprecated device_type property.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/riscv/kernel/cpufeature.c | 5 +++--
 arch/riscv/kernel/smpboot.c    | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4891fd62b95e..e7a4701f0256 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,7 +28,7 @@ bool has_fpu __read_mostly;
 
 void riscv_fill_hwcap(void)
 {
-	struct device_node *node = NULL;
+	struct device_node *node;
 	const char *isa;
 	size_t i;
 	static unsigned long isa2hwcap[256] = {0};
@@ -46,9 +46,10 @@ void riscv_fill_hwcap(void)
 	 * We don't support running Linux on hertergenous ISA systems.  For
 	 * now, we just check the ISA of the first "okay" processor.
 	 */
-	while ((node = of_find_node_by_type(node, "cpu")))
+	for_each_of_cpu_node(node) {
 		if (riscv_of_processor_hartid(node) >= 0)
 			break;
+	}
 	if (!node) {
 		pr_warn("Unable to find \"cpu\" devicetree entry\n");
 		return;
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 18cda0e8cf94..6e2813257e03 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -50,12 +50,12 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 
 void __init setup_smp(void)
 {
-	struct device_node *dn = NULL;
+	struct device_node *dn;
 	int hart;
 	bool found_boot_cpu = false;
 	int cpuid = 1;
 
-	while ((dn = of_find_node_by_type(dn, "cpu"))) {
+	for_each_of_cpu_node(dn) {
 		hart = riscv_of_processor_hartid(dn);
 		if (hart < 0)
 			continue;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
