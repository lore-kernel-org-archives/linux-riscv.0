Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EC3C4361A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 19:12:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03954221E7
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 19:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03954221E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IKnBVYRUJ6dSWyW31NfEbwl1gvc6OQeUYNR88xROYEs=; b=xzogxJG4VFQOjjbUvb7MFEAEN5
	WCWsusonG/yYr/MOMydpIcZH5P5Mq9hYaaVZYnB/Ew15Yv8SWuzz9BIMMd2fowPcL0MgJ/eTn4sit
	ov8SLbngiiLNSzgXeX7iyh9Clcg1THR98/kx5wq6ixZVyBYCNQ6VybWkj5U17OOp9pWZdtE3Wze3I
	mpzXNEy3MwutfeUuyrNPe74VH6W9Y3KgJjKVgNEryEGDVnwHA5+t//JNowiHyHeJoIMQ5tX1dli/K
	a7UESC0284RAqyqqlGqlhrSL4Pg04vd0yhLPwEmeW2fQikMUdZZ3gkkZoo1jALpYlb3wYFOZh4qQH
	fgP5QSdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kku19-0000L7-13; Thu, 03 Dec 2020 19:11:51 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kku16-0000Kk-Fb
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 19:11:49 +0000
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MRSZX-1kYaKc2hyn-00NQ2q; Thu, 03 Dec 2020 20:11:39 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their own
 submenu
Date: Thu,  3 Dec 2020 20:11:34 +0100
Message-Id: <20201203191135.21576-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:aD2+iVIcNpdQrY5wIXXIxV+rDmOoUKKtGmWxyejH/O01QJPlfrj
 iIB0sjkq/sX52TijJKkNSNyPwjiEsDN9x2Xct60/y47lyMmIjEcUrejRHgOxS/zACxqwqAW
 87tm74VqQCuPrBriOEfU1hZ+wIB7nd17P9MQkkgHrAcZKsYGTv0t7FCBTN0FvogpzjN58df
 jm7RFZwxj7eyUjZfUuVOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vFKWEtG98l0=:OBqv3UErgUCfsvx7zfIhCR
 CVtTjpJuaH3WIGsywghkvmCKrvGMX0p7T7ql07bCjayhSKaCXAXLnSV893ijZeXayKxajmrUP
 Jx9yMK6ITOZwNGix9kfyLlrhnJdn/6m/DfJobcJfeSjFKlEvYjV7Zh51jtswjAjvclDpvO7XX
 1wzWrZTARq4n1RX/AC1T0Sz1cCjFXFjpo1wKipjjssUFS0KK5qNYodIwYTx4lGj1rX7FfLQgE
 U8KhlGQCTjvsACSCVhpsXrKy2KHTuVN+/DRUV3IYuX9rkM/h00w1e1C2Kx3XhtEBvT5qswOnv
 Yc1Jp11Ws70SpIA/5SMueO1zK7b/z/01RQXsu/f3MBV6iuF+4ky/w2WbiQMHMrL8b7bJHj8NV
 is9SFUTvq4FiFUmzkZGO4ZNGl5JscX36WH0wLvZ+Omnbtv8Umb0hMl/ZK4iIF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_141148_742173_F9CBC211 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mst@redhat.com, linus.walleij@linaro.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, info@metux.net, jasowang@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since we already have a few virtual gpio devices, and more to come,
this category deserves its own submenu.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..01619eb58396 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+menu "Virtual GPIO devices"
+
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
 	help
@@ -1613,4 +1615,6 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+endmenu
+
 endif
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
