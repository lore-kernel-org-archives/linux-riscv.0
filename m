Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE1DC43612
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F16F20883
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LN+OpDJg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F16F20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRS5KlBQHHV3zAjcgc32xUBu3pLnREmBmvkUgbwUPyQ=; b=LN+OpDJgL5sFsq
	9kH4ZQ+5+WePKgbyn4fhaEKuOqtiqMRRizis+EEfeSqxpoLF/18UwCYQ/E8xZh34+uy9+32dn1QPS
	Wj8f2spBTYHUmU32MgBmASroIifMBwFA+6gAl1eY6hZMv2rKexRiWt4jGpxlW25aeCrqjnPRPqA/8
	7iiqCLM8ksjmcGmxuIYlIzWWohZPZJqoZjRGMrqymOvtaj2mCKgmUtDsf8wSD+KCEsLJNEmqcdHgp
	90giQfKR1cYgizBVr/jZzP4qU4rdHCyGyCybJRtXJ5k3TkOB9kI86ebVPks5ZzHuKFhgL+bj9c0Ah
	aF5/kzR1ID4ws1WVR9XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUlJ-0004ku-8P; Fri, 18 Jan 2019 14:04:45 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUlF-0004dy-KD
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 14:04:42 +0000
Received: by mail-lf1-f68.google.com with SMTP id a8so10575082lfk.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 06:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cmUXM58BMaiJjpGLA3Yxvgez8I0gKgtgs8JTbgTggBI=;
 b=YacGNW4JNhykNGcExqfk0k1S2DSDkd0RwB5tBxfmI9JkJXDMIeIrdR9etTOE41sn3T
 yHB7r39DrE5ps9mkr3DlKTawTVa74z+/F6zj9MPhAUZA42eL9mgLJl2NMe/G9RACTA52
 Xkj6VOFa5HA5UlPExLNczyuR9pikMntslJCl+MyX8RABx+P1QNLT0oTgebgFgcEt6Bj1
 k8SD2gQB6uH1FKyRYJw/cQrADRakCekekqI++ILu9EVHcQqMN9++XrqHal1t0dRbgMQK
 fknfeDir8yyfRvFQT2oiKSkPkFoo6xOVbgs6pZdXNJvnRGP5lOgYMynTDZSyIO5XIMMa
 HXww==
X-Gm-Message-State: AJcUukdg35KlrjsC79zSaklg5U76CMlJud8D5zYIYm5OuP268AvvREz+
 alQKKTvVJs8kqQz6d0zh5+4=
X-Google-Smtp-Source: ALg8bN6ZyIQtwvoCv4X5xICG4zkSKseDpH/7qfL0DfctUWNjTB5g2KO/0iF3NGF1XRY/SSz28BzQUg==
X-Received: by 2002:ac2:4194:: with SMTP id z20mr7107719lfh.74.1547820276099; 
 Fri, 18 Jan 2019 06:04:36 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id g85-v6sm765405lji.17.2019.01.18.06.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 06:04:35 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@xi.terra>)
 id 1gkUlB-0002Vv-8r; Fri, 18 Jan 2019 15:04:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 2/5] riscv: use pr_info and friends
Date: Fri, 18 Jan 2019 15:03:05 +0100
Message-Id: <20190118140308.9599-3-johan@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118140308.9599-1-johan@kernel.org>
References: <20190118140308.9599-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_060441_668517_A46A0D98 
X-CRM114-Status: GOOD (  10.13  )
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

Use the pr_info and pr_err macros instead of printk with explicit log
levels.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/riscv/kernel/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 6e079e94b638..5c15bb0560ee 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -76,11 +76,11 @@ static void __init setup_initrd(void)
 	unsigned long size;
 
 	if (initrd_start >= initrd_end) {
-		printk(KERN_INFO "initrd not found or empty");
+		pr_info("initrd not found or empty");
 		goto disable;
 	}
 	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
-		printk(KERN_ERR "initrd extends beyond end of memory");
+		pr_err("initrd extends beyond end of memory");
 		goto disable;
 	}
 
@@ -88,7 +88,7 @@ static void __init setup_initrd(void)
 	memblock_reserve(__pa(initrd_start), size);
 	initrd_below_start_ok = 1;
 
-	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
+	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
 		(void *)(initrd_start), size);
 	return;
 disable:
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
