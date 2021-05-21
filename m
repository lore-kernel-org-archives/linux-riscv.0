Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C12C04FF3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 23:40:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD7E6100C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 23:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD7E6100C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BzjWbmZYI7+7DciMhsyLUpKn9HnmaiVxpgMuOZHk5uI=; b=ISauHqkd4MoGRmGPAGbFMq7SlF
	brm6HULtCGmqzih3v2Fzpg6C1tb3esEbgQWT2pDWD2JPtiaAcobWJIRstIB0IaL/+GKrBezlTDFXx
	2s4T1zfgMD9T9/vuzGtIZlG4BIXMuv450T00MW7A+cNUNIqCm7tnhYxf5typ3VWGmqVxkp6i5EoHF
	vfDQCW2/RVcCWRitfhhR40GjPzfrU2vhF04/XzTzFJsX3c+pIAXO1c2jb2A/3btw1Zu85dOfiqWuF
	7eN/F7xWTgjeZ5jXfrc+y1cccqd9baWZxYhyrLsLef0WEhVGeRQoFokUTr9ldkrjObZNI/0Hscqxm
	o8T467Dg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkEkk-001MqY-9P; Fri, 21 May 2021 23:40:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkEkh-001Mq0-Jv
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 23:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=QPNEPMeEe3xE9g9EwhJj9uez3HAqm7pfx8k5lT3zTmo=; b=mQpTsN8KGCvpH7F6csXfCcoIwo
 E4rsAKFLA8LNq1soagW0NBcTF/Ms+FsNb6V5I7HvvEWFoEvz5TqbOg3WaaiPdasPBGhV8i6WCF7oV
 0iFcZyCYbpZMiJwiWa9CeT+WR1AbrdfftPO4Kpe8lkPQ/ZRcNutC4GULKBH/uulYk6piuiAjJ6ATT
 e7XTWbHo38lHQ6lAaaumd0DWkhoBaN/n1FTbBdNz87Nr6nBLz2O+OfCXAWcFjQX/QY1XH9FBnhK5S
 OfdP7uD39di6dDvlTTIj/fkxMbDVlS6/IDmszjvi/AUV5+ZHnbqxxPZ3RmWR05thWXM0S5MejpwCw
 V5PM0PVA==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkEkf-00HUyc-5r
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 23:40:22 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so6826412pjb.4
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 16:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=QPNEPMeEe3xE9g9EwhJj9uez3HAqm7pfx8k5lT3zTmo=;
 b=J7nxVMFvgBIsiz6IcEZjBmmm2GI/9CjXxEpHLedMLYKHsDCPmraX/MKEQWwjq7l3uK
 o8Qql6Hnn27aBPmIkQi3Se93xl+bn/9ReLPE9qk+5Rdbn8iimg8urFSA6OMBtSh9PJa2
 5a69ECqqVlE8WwbcwsKTkyytsWGYtLGclxY5hxQ5/gIczm3SHdYZ7ttiC9/MEW8MNVaQ
 gvV7Ej4ZQLEduYDYAgkmFnuouCpAae5Lp7mqiuP8l4MPeD0cSqcvzIMVlRWhi7j7DIsQ
 A+7hF1xOyTPKYBY4rylRbW4918oI7XQbSBc5vu6ARXLmes4P2WYDXFA9BkfBQENhOrYi
 lBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QPNEPMeEe3xE9g9EwhJj9uez3HAqm7pfx8k5lT3zTmo=;
 b=G8zyKjFGUA9D+OQ+tNPdubOrEKb43xi4bXdU4JjWi6Ba7/eqOGAbJWgt/3mIvNj/Ve
 d59nxYom0RewlDBFjLiN0hOELJnGpuBmir1DiA2jhl5Y0z9DgHLh9xhC3PxEQDp6vXVm
 DemtE0Kds2Xjdbii8amrxZM5M7W1C4vlMgHWAxHWL8lIKLH+gajoWr2/1U7RwIZxwUU4
 75TcbPTO15v8mg3Rkgl8h7rE10+PG04A/WLZlyM57K6w718HTok/F0QCxmqaSOMKrtMB
 deSSJhVPaFsiW4tQKZmLvgnwl+n1MOe2xHd/U1uQ19zeo+OMJQkmWMKX0bgOkgDM6P7S
 GZYQ==
X-Gm-Message-State: AOAM532nWggy05SuypBKKczwqLBxf0qL24oz+kolTtFb57NAa+AEmdnk
 MVOf0eLCkxtKHXZlUe+obRjOmA==
X-Google-Smtp-Source: ABdhPJwPHLG9iyB+aYpacJGoRqHYa2+2RjDDNnN4kimuvo5iN4nYceLAx98VcjSyosIUdQehkf/O+Q==
X-Received: by 2002:a17:902:8682:b029:ef:d2:4311 with SMTP id
 g2-20020a1709028682b02900ef00d24311mr14466302plo.4.1621640419439; 
 Fri, 21 May 2021 16:40:19 -0700 (PDT)
Received: from localhost.localdomain (114-44-1-239.dynamic-ip.hinet.net.
 [114.44.1.239])
 by smtp.gmail.com with ESMTPSA id w19sm4888442pfu.215.2021.05.21.16.40.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 May 2021 16:40:19 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: vincent.chen@sifive.com
Subject: [PATCH] riscv: skip errata_cip_453.o if CONFIG_ERRATA_SIFIVE_CIP_453
 is disabled
Date: Sat, 22 May 2021 07:40:15 +0800
Message-Id: <1621640415-24971-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_164021_268461_1D5DA570 
X-CRM114-Status: UNSURE (   9.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent <vincent.chen@sifive.com>

The errata_cip_453.o should be built only when the Kconfig
CONFIG_ERRATA_SIFIVE_CIP_453 is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vincent <vincent.chen@sifive.com>
Fixes: 0e0d4992517f ("riscv: enable SiFive errata CIP-453 and CIP-1200 Kconfig only if CONFIG_64BIT=y")
---
 arch/riscv/errata/sifive/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
index bdd5fc843b8e..2fde48db0619 100644
--- a/arch/riscv/errata/sifive/Makefile
+++ b/arch/riscv/errata/sifive/Makefile
@@ -1,2 +1,2 @@
-obj-y += errata_cip_453.o
+obj-$(CONFIG_ERRATA_SIFIVE_CIP_453) += errata_cip_453.o
 obj-y += errata.o
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
