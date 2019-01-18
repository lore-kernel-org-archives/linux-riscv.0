Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B37C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEFF20652
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u8bzkmHG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FEFF20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpAY7cwKXfaw+S0AmJ+0mSKCUuJGqMG3Djk3uT8j2bM=; b=u8bzkmHG0HmvTO
	SeouETJpcpTw0IiD4DaKG/Z+wnqwyxVfksOIlke6VHzKaWJqoeTzsCkfgcOixeVrT+a14dFTsLuHM
	CMAyCmxwkhfX61SiLnocyxQSLn/LThBZbcDEDkN0JaAJmc500aLSkQ7a6C6jRTK6IZe9qc5wxqGBT
	01E2KmNWs6T6QeIJeVV5Eb13lh0vBXbzLxG4MvHbzavvv1Tz9zN4C5KS7Fp67h9RRttCzNc2LYRX0
	tX6nZULg8kLD6GPbdyxPLEZ7Ul0l6O0C/FaxwPfONIbo88hEamEXieZXUJhi1rLR8NY/5MzbOoU+I
	qNoiDERvhKpld/nfI76w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUlR-0004rY-6k; Fri, 18 Jan 2019 14:04:53 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUlH-0004iu-VZ
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 14:04:45 +0000
Received: by mail-lf1-f67.google.com with SMTP id e26so10580611lfc.2
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 06:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edUxdz3ce3gWnciU4XX+2JLaYdCsYRbrNsJxn6e+a2w=;
 b=bYtSp8Bcr6ietBdYfrfvJUqfAt9kMCK9ybnmQI6A4hjYQbtfjdlzq+SFWViXPHUwsC
 AVBuvTPV94x43cF3pJSmQUX6xg+zt0AePUHR5CAHrNRYl9TT6vBx138sUNfa77ZvkfV+
 fZRdnUxuuFrQzDpJokyh0GBbALT3s/jHOYC9l7DX5h6oAtFCqF3vvOusIQ6/Nwp2sYeK
 MbM/Eq3jbrfG0s9G8HyupPZH5HMa8LLVqKxrV1SAUugDCpN7TWyQbRRYLLvBwKnDHFW2
 ecVpEDli4RqqLL89DHpBiz7vAi8pqzYp61VUJ2e0+eDcPro5/K5b6hQILQmPC75CSXnj
 UYAA==
X-Gm-Message-State: AJcUukdVhBV3PwLCAFQuMtFqJw7Dq5sf/lyFSHAT7+AwXyFwfHhZ9U1x
 5eJygbGoqihDyAdbMWeCiN0=
X-Google-Smtp-Source: ALg8bN4Y0esAGk6MK7TV6Wmr5WDkdlU1+vuYa3x5Df7EzCNJYZeGRXCIBufLugzWN9j0rwsKUUrAyw==
X-Received: by 2002:a19:4287:: with SMTP id
 p129mr13239723lfa.135.1547820281776; 
 Fri, 18 Jan 2019 06:04:41 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id z9sm797530lfj.79.2019.01.18.06.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 06:04:39 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@xi.terra>)
 id 1gkUlB-0002W0-BQ; Fri, 18 Jan 2019 15:04:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 3/5] riscv: fix riscv_of_processor_hartid() comment
Date: Fri, 18 Jan 2019 15:03:06 +0100
Message-Id: <20190118140308.9599-4-johan@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118140308.9599-1-johan@kernel.org>
References: <20190118140308.9599-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_060444_014573_A114E592 
X-CRM114-Status: GOOD (  10.51  )
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

The riscv_of_processor_hartid() helper returns -ENODEV when the
specified node isn't an enabled and valid RISC-V hart node.

Also drop the unnecessary parenthesis around errno defines.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/riscv/kernel/cpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 11ba67f010e7..974d374fd36b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -17,8 +17,8 @@
 #include <asm/smp.h>
 
 /*
- * Returns the hart ID of the given device tree node, or -1 if the device tree
- * node isn't a RISC-V hart.
+ * Returns the hart ID of the given device tree node, or -ENODEV if the node
+ * isn't an enabled and valid RISC-V hart node.
  */
 int riscv_of_processor_hartid(struct device_node *node)
 {
@@ -27,34 +27,34 @@ int riscv_of_processor_hartid(struct device_node *node)
 
 	if (!of_device_is_compatible(node, "riscv")) {
 		pr_warn("Found incompatible CPU\n");
-		return -(ENODEV);
+		return -ENODEV;
 	}
 
 	if (of_property_read_u32(node, "reg", &hart)) {
 		pr_warn("Found CPU without hart ID\n");
-		return -(ENODEV);
+		return -ENODEV;
 	}
 	if (hart >= NR_CPUS) {
 		pr_info("Found hart ID %d, which is above NR_CPUs.  Disabling this hart\n", hart);
-		return -(ENODEV);
+		return -ENODEV;
 	}
 
 	if (of_property_read_string(node, "status", &status)) {
 		pr_warn("CPU with hartid=%d has no \"status\" property\n", hart);
-		return -(ENODEV);
+		return -ENODEV;
 	}
 	if (strcmp(status, "okay")) {
 		pr_info("CPU with hartid=%d has a non-okay status of \"%s\"\n", hart, status);
-		return -(ENODEV);
+		return -ENODEV;
 	}
 
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warn("CPU with hartid=%d has no \"riscv,isa\" property\n", hart);
-		return -(ENODEV);
+		return -ENODEV;
 	}
 	if (isa[0] != 'r' || isa[1] != 'v') {
 		pr_warn("CPU with hartid=%d has an invalid ISA of \"%s\"\n", hart, isa);
-		return -(ENODEV);
+		return -ENODEV;
 	}
 
 	return hart;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
