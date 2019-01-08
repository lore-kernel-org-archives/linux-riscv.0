Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9B5C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 19:45:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AAB2063F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 19:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHvRrYaw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZabD6gO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0AAB2063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FA5NbPLW1ZGac29kXhVl23UFEQF/sdrqvHg0eS0errI=; b=XHvRrYawoKXnWe
	5t3NFalTGDmFVHQ4i9a4NsSuuE8qY9UhzJsD21MeLCR2S3fgFvwu1v5nXYTAYGIg/SuKUFTdPlF9q
	5wI8UivlTQfdA2IL/TgHUufeBrC6g10L7579zFc4sPPzvenZyg7X4AbBTYlQb9aExgl2IE/J8/EvK
	fl3p6p0XJAf2U1sYDvLpC35y7ZHUqc5v78XT2LZUDbBvMB9CI7zd98zEquWIbOSe3o8Tbdbb4oZcC
	l0PaveI/hIAMU2SiHqNLFRLxN0MMzdBOXqMaw2uoaC0tlgBHF4nWsoTqVFsgdrzQfviwCtrk8YyZj
	Vp4MntfAYRosSmzIoEYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggxJw-00006B-4r; Tue, 08 Jan 2019 19:45:52 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggxJt-0008M7-AH
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 19:45:50 +0000
Received: by mail-lf1-x143.google.com with SMTP id n18so3863692lfh.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 11:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gIghfF521/EYB26iclunqxJpnJp4OvZ4e7ShOPjA2LQ=;
 b=bZabD6gOpDsiNKzUtqLoaPeNm2W9y0+N5VYbcGfVJ9N0m1JfEnRvi9sxWeygGyQw2x
 mxkbKVAsS+rnkKXq4CZpaJWTuhqB6u69QjVEd+OWbZfnqk7Jrb4baMKYg5l8DMpZMI7q
 a/hA1KmAaNtIPu9V58KQPJGp9YtQKXWktL0CHXN9zYnvE5uJy5187OBIH/4cCiWZt5Yj
 N8EXRhNlTt5XW98fbAIexipQztaRTHZMa2fVxrzLY7/ukvAlQA+92fHjZzcJGE1m0ME9
 Dt/yN82I/96ORW7f5QTR10lfIVQ6Uhb8pvEB/ByLXq4VWbzYMSd0zPpwSXSeWdcCRYEB
 Lk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gIghfF521/EYB26iclunqxJpnJp4OvZ4e7ShOPjA2LQ=;
 b=b1DIXijmBYa7uNC+XbUozZsKxM8yB1C8FFg1WWR5lyJ5rCw2/jX2UBzUBXUzIv2xwo
 x80UDyhsIpYJQwd2X+TkzeQF6kun9MuMO9cHxx0Q1re0eiFN9VFKIjrKXbHFKVY3Nwcj
 L41HaRqTHf3eEB7EfXB/lPk9jvpEbIIntwAhywzWA1uPx/GhNSR32bIJQ97cE0wkYRzS
 5pK4G5FVRlFhVe9K4VDPfC99z9KqmOIRMgqYToq6UeZnGUT431ncklfW4fniCPwmoky5
 CsV7RXrfRJL7Aujj4SsWaTOxB3ERVhuYJBe7s70XP/khk/2GH6gm4Z0wImKu+hBngqwO
 kEjw==
X-Gm-Message-State: AJcUukeMuPfrnwbihjwhDv9VPKC7Jh4xVrkU0jGhf+8OAPG32pjkjzv6
 GjR1SJHoxkie1PT1Jq5TJhZdLQo4Y/s=
X-Google-Smtp-Source: ALg8bN4oTMFfTun1/n8Imd1mgtO24nClQCzfhIYGH3fEMYjEe20K4SNndWJ3+ndJhPaN3/RgN0KcFQ==
X-Received: by 2002:a19:d9d6:: with SMTP id s83mr1887324lfi.57.1546976744665; 
 Tue, 08 Jan 2019 11:45:44 -0800 (PST)
Received: from localhost.localdomain ([109.252.109.195])
 by smtp.gmail.com with ESMTPSA id h3sm13461421lfb.49.2019.01.08.11.45.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jan 2019 11:45:43 -0800 (PST)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: asm/page.h: fix spelling mistake "CONFIG_64BITS" ->
 "CONFIG_64BIT"
Date: Tue,  8 Jan 2019 22:45:38 +0300
Message-Id: <20190108194538.28669-1-antonynpavlov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_114549_359189_05786FB2 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

There is no CONFIG_64BITS Kconfig macro.
Please see arch/riscv/Kconfig for details, e.g.

  linux$ git grep -HnA 1 "config 64BIT" arch/riscv/Kconfig
  arch/riscv/Kconfig:6:config 64BIT
  arch/riscv/Kconfig-7-        bool

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 06cfbb3aacbb0..2a546a52f02a0 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -80,7 +80,7 @@ typedef struct page *pgtable_t;
 #define __pgd(x)	((pgd_t) { (x) })
 #define __pgprot(x)	((pgprot_t) { (x) })
 
-#ifdef CONFIG_64BITS
+#ifdef CONFIG_64BIT
 #define PTE_FMT "%016lx"
 #else
 #define PTE_FMT "%08lx"
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
