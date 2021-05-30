Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B9FC47092
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 13:23:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82155610C8
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 13:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82155610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SVQohJub0OoNueI0AdXGHfoC35CdOyW44U+shIZnuT8=; b=DutSrGdygWlxdn
	ycqvZ4rDitMysFhjYv2BBeQEyTDu06J26MWzdCI66JlCVHHTLPeiBPp+ZGZmNE83fotJvt0ze2AI6
	x+CjoqW/r7ztCdckQoX0S1hQp27v5HWSGBRqQ7ju8vwwzciUK6OAa+oagWTRX3JgvOl8lzTOxEqzN
	2g7/Fkg+VznM984Hh7FX6goywuL9BdqHW6PhGKuWhcyfrU6E+x4AHUIjtAn/fu4te/r88jdZvTGqO
	0YQypcxfC93GrDk85lmGqteBDX1lgmyIkBS5vMsiIhBnSs6MNd3UpWw9uVFl3UJFJHYIG1Fa49zwc
	qGh6fNi2+zOt5sEhqd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnLOo-009goP-Eg; Sun, 30 May 2021 13:22:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnLOg-009gnc-5s
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 13:22:33 +0000
Received: by mail-ej1-x62e.google.com with SMTP id qq22so4174838ejb.9
 for <linux-riscv@lists.infradead.org>; Sun, 30 May 2021 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jNq7jRw74YTrmktGVVgUaeZphWbs7T9GsPL9ks1JQc4=;
 b=LiSwTd3hwKHUwMvF3VJXYNxCH/PpOqUsU0AasPhI5gu1tkyQMDigMPEiAjLnUz/Dwe
 6/fxLjqxDrQPLPJBTqzl1vc5ynfHZCefWRdmKC7tic/skvcSqfXFlUHi7M58Yg8L6Ww3
 xX6V/Acy01o1cwLG4IEw5zXN2TYnO7t/KMI7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jNq7jRw74YTrmktGVVgUaeZphWbs7T9GsPL9ks1JQc4=;
 b=eUXlNk2BfrHiEKPr224QdbboRQf9SKtGj1ztgKEU2AKELEfmBkCDL2nSzWhQ+TtcSu
 Z5LSIaZP9hjb9tnj1TlD6Xw1Lc8INYBJKDNg1uBl6ApVvcQS9LgbqwDxpA7xdMYwwypu
 ru3HoHeSGn47/CNR56M2wHAloZf+eU8ZbeLv3JjzVUBU1rCigOhkPyj4yIn8nPbRPi8J
 2o9/IEpLI3Juntq8b/MRa4Cr609Fetxyu8/YtdituJg5EEhnsOCNgd+7rQQeGIy63SlW
 DtOWp5nasLOWI1xR5xv4E/anLHCSEI+Z5Z7VOefkZlPDrgs4Up123oA/hL8aP+oDtHjL
 VHfw==
X-Gm-Message-State: AOAM53075qZrmfIBuOCAklCpwMRPn3OWuvKPIvUwF5ve0ojcnHu+LGVo
 IT1fZWbtIIzvWNTXKIMkGwx97eGnHyQnP6fa
X-Google-Smtp-Source: ABdhPJwit5Xijapk3jepufl9HH6gFHwuAhJWjEuvd5rzdTAyrVp/fBR6/GhqY/I+8VLmDxclj9unGg==
X-Received: by 2002:a17:906:f8d0:: with SMTP id
 lh16mr9794021ejb.331.1622380942929; 
 Sun, 30 May 2021 06:22:22 -0700 (PDT)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id g19sm4744085ejw.79.2021.05.30.06.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 06:22:22 -0700 (PDT)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH] riscv: fix typo in init.c
Date: Sun, 30 May 2021 16:22:17 +0300
Message-Id: <20210530132217.7851-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_062230_261374_D5CED918 
X-CRM114-Status: UNSURE (   9.20  )
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

Commit 010623568222 introduced a typo in "__initdata" spelling
which led to build breakage for XIP. Fix that.

Fixes: 010623568222bd144eb73aa9f3b46c79b63d7676
Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ae32f78207f0..e7b136abf90c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -451,7 +451,7 @@ static uintptr_t load_sz __initdata;
 #endif
 
 #ifdef CONFIG_XIP_KERNEL
-static uintptr_t xiprom __inidata;
+static uintptr_t xiprom __initdata;
 static uintptr_t xiprom_sz __initdata;
 #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
 #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
