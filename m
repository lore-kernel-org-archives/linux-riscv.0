Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5C8C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C13720652
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gKnv6Or+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C13720652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FuVr3KrF1UZSLSA0Zak7FANasIxL4Omn3/q4RdCw+s=; b=gKnv6Or+rXV9WP
	CPEk2EHgJIjOdbr1+fBe3/aUI1NxAZe9QqjX4H3d2acjujfBBBsle4tcyzBoThrWS+R+Dnt+T2aSD
	8y5fBNrvP0WzCGquprH7S7MiIBKA66E0/kOrB+MnHITWci4L6trP3Qnw2YqsWMKHpubpSKqL1MqPH
	3uH098oUvL4oyJ8JLt4rmUjHOIEEMZe8TGNp/EjdFX00zS7Qfqrns0ohH96pwJ6ZP8QNdv98vd5cp
	hGdP7SN+CkorFrzwwFwB27z7q7xQd51wRP3F91zsB7FvznfYb2FvKRgqa7/OnR8mISBnTXXgXelRQ
	TdlVfDmlNJ+42mJtPEQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUlN-0004o4-G8; Fri, 18 Jan 2019 14:04:49 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUlF-0004fW-T7
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 14:04:44 +0000
Received: by mail-lj1-f196.google.com with SMTP id c19-v6so11739681lja.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 06:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cftGcUhp2hIXsQQzx8A/AHnCjsMjkAUMb50zkj+yZSs=;
 b=sMJcERjqMjk277j30KwBYK9SiCMUMN6YSncNf4RdFUkZl3INhIyWBj2PrB8M4DM8CA
 FbS5qh8SdPKpFIDeWWLYlhAHz1ZnVDcB+gjU7KZEHDbSBFdIlTi8Z+BfUPfq+yEuOUoZ
 Zea6dhVzyGDm72xoJODzIX+v1XiXlA1FbIzFEHUvEHMqd40muRyCPdoyZxeSZXZu1Y6L
 xRJYFHSJm89jufkmFykPfNsrCJUenApBNjsmcJAloMYVWQwn1ESqm7cnE9MD7BgEHGbG
 /gDKvUcziibyytXQ/kal25lm3epguYaCalcU6uhewfS9zn2Vhedh63ZWRGjAG5bEKN/T
 9ouw==
X-Gm-Message-State: AJcUukfcqH+7M6i7YQujLBDPpZCnTUDXfhb0C/T+rwS5TVDJcjczYciM
 tn9X2zfrqm72nEuUxKwoRQv6K7gy
X-Google-Smtp-Source: ALg8bN5tYIZ/UQG+zxGyHjxBCq4l7Z8pL9JfunFn8k77LKgh4w0vXxESS+zGGhrcpqPtWVyXzoHY3w==
X-Received: by 2002:a2e:6595:: with SMTP id
 e21-v6mr13144023ljf.123.1547820277864; 
 Fri, 18 Jan 2019 06:04:37 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id x21sm809550lfe.6.2019.01.18.06.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 06:04:35 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@xi.terra>)
 id 1gkUlB-0002W5-Dv; Fri, 18 Jan 2019 15:04:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 4/5] riscv: treat cpu devicetree nodes without status as
 enabled
Date: Fri, 18 Jan 2019 15:03:07 +0100
Message-Id: <20190118140308.9599-5-johan@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118140308.9599-1-johan@kernel.org>
References: <20190118140308.9599-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_060441_976872_8019AA0C 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Follow the Linux convention and treat devicetree nodes without a status
property as enabled rather than disabled, while also allowing "ok" as a
shorthand for "okay".

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/riscv/kernel/cpu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 974d374fd36b..d1d9bfd5a89f 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -22,7 +22,7 @@
  */
 int riscv_of_processor_hartid(struct device_node *node)
 {
-	const char *isa, *status;
+	const char *isa;
 	u32 hart;
 
 	if (!of_device_is_compatible(node, "riscv")) {
@@ -39,12 +39,8 @@ int riscv_of_processor_hartid(struct device_node *node)
 		return -ENODEV;
 	}
 
-	if (of_property_read_string(node, "status", &status)) {
-		pr_warn("CPU with hartid=%d has no \"status\" property\n", hart);
-		return -ENODEV;
-	}
-	if (strcmp(status, "okay")) {
-		pr_info("CPU with hartid=%d has a non-okay status of \"%s\"\n", hart, status);
+	if (!of_device_is_available(node)) {
+		pr_info("CPU with hartid=%d is not available\n", hart);
 		return -ENODEV;
 	}
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
