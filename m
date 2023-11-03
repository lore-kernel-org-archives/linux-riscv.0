Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321AEC4167D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDaXLJrVUrJHYx0+B8N/nUMo+d1YEnnvd5Q7flknT+I=; b=FcfypRtmNFWf27
	MJH6rgZdA7D9KUmvisXWVWi8xdT4NxM9K7vDl7ig5Uf4V3sRW2Fn0+jzsb9xO1JCRg0LXjxHZ65c9
	2cvyMKqVoOLFf3aDRsj/PdAg3iUNakxpv4c5trC/6nqeG+Xv9IiT55Ukcsw+Og9Lw4nCHomzQmios
	BPpZunobfO1avlKFa/nPMg5SOeQNDVa9hGOtEa1xXAyJZ1JGaKBOnzpF0M6W9lquBoyV1Yznjh5ko
	jpdYNZgiMbkcrHK9e6/FLq/fGM0HYrvaRWW+dNtCJ5uc0qmro2lJTd+QJorqtRQ/NARwp8Cd9orGz
	mtTwnsJdbqoAb2f94pfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywap-00Bjgy-1a;
	Fri, 03 Nov 2023 16:00:19 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywam-00Bjfw-2J
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:00:18 +0000
X-QQ-mid: bizesmtp89t1699027199tr6cexfv
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Nov 2023 23:59:56 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: J5JfekO1WsiW/sSK9b0/2SRgOwgztbvJaqippsUrhkBT0nfPERe3CiBmcwtjz
	QpzvzTaAyarFENK22g18sd4WrJtroYvGBndfc+80wj7YD8GXTPFE63PYdZfssoaggn37JF1
	CeT4asgR6uqXE743WuMFyc0x2/w6p5rmPS5RdVkWpq1wdgAirUOvzdxBnfp/BH/yVAOG+VK
	nuqwGFmYsfi5b7WwIDnPQEhZN6hZb6/eGcz4PwK7TFD10lDLnMuVyHe9WS6+GDJ8RvQ2t0+
	CRr+zifxj6GjZOuv7Gm2iGWovRvgRTB53/KK2DBFh1siV3bXj3z8JS2Obvsu+/t7oibKU9q
	0uW9Al7Boxi073MJVkzuvWKDvgsnA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6517666058283072593
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 05/14] DCE/DSE: add HAVE_SECTION_SHF_LINK_ORDER_SUPPORT option
Date: Fri,  3 Nov 2023 23:59:54 +0800
Message-Id: <141030de2b3d470251d1588b39cb041ec505d84f.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090017_070443_3AE74D1A 
X-CRM114-Status: UNSURE (   6.99  )
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

SHF_LINK_ORDER requires ld >= 2.35.

LLD supports SHF_LINK_ORDER to, but it does not support riscv
HAVE_LD_DEAD_CODE_DATA_ELIMINATION. Therefore, I haven't tested the
minimum compatible version yet.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 init/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index aa648ce8bca1..1ef5b19918e5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1462,6 +1462,11 @@ config HAVE_TRIM_UNUSED_SYSCALLS
 	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	default n
 
+config HAVE_SECTION_SHF_LINK_ORDER_SUPPORT
+	bool
+	depends on AS_IS_GNU && AS_VERSION >= 23500
+	default y
+
 menuconfig EXPERT
 	bool "Configure standard kernel features (expert users)"
 	# Unhide debug options, to make the on-by-default options visible
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
