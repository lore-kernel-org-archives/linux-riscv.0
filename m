Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60452C4167D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEYfm6wS2TWSUFQRLP/vQzaH4iz1ZcjCK8hm1V+jrtw=; b=3DPCnVgvfxyh6p
	aLRkhfl1iI9Lrju7f0P6QH+VHBSBiVfXgodmgLkOMHEL7QEEf4tqakS5GqV2w1skz6pveFuno5LfN
	4IRL9U/M1hf9neJrvRmMUlTXIEUnwxa2LBaHmD+V4z6ISlHPWco0L4ORsQbKuP25gGLUI2iNoIcN/
	sNd2Ug01oFu+N5XZ43c8ae13epQfeaIGUvXyjL+tKsWUkObm+egeLGFP2DwYPR49VVS6GsxSVuASi
	rhC9eQYL1x7mJ23c4PMztf0jt7+KW/WruAgnqXq14OS/5ybSwHXV/prGsc2i8vOLoHu5nwzU1gBUf
	JTAvwKnA5xgLlIjSqDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywbA-00BjmB-2L;
	Fri, 03 Nov 2023 16:00:40 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywb7-00BjlB-13
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:00:38 +0000
X-QQ-mid: bizesmtp87t1699027218tobnpga2
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:00:15 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: +ynUkgUhZJkQaK3UoZkl8UFfBrmOfnK/yegytHp4rc1pb7b3un2ZnJljIAZmQ
	SyXnHa++l4m7fRjBIwpFo2yvoE/z+Ce3xG96JEz4TUS94+884spbt6QK0ijO0pys/0ZRtXT
	yTJ4KdwcAqHHm5OmVSBQkAf2mXr2BFgZ8g576cDxArslhY/NINryQd/xWCqsDWIMikhIK5H
	F80QRPBTraDKtfwcPifb2vihwGdJnwe9t6tWh5K+jA32jgVR2NAE3gNY43CdkZKiUzIK/a2
	2z0Yjtc8JZajCom/XHmuU5CGRQIrP77qUPwshGoOPHCfrSCD//QjBQ3x/AqijADYI8wvpru
	bFuICpJ75TWkL/kTNaxMRL/UNMNcWL/Kyk4wkY2UyFKdKCjwzNjoUiJ1OI76g==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8486065313594138101
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
Subject: [PATCH v1 06/14] DCE/DSE: add HAVE_SECTION_SHF_GROUP_SUPPORT option
Date: Sat,  4 Nov 2023 00:00:14 +0800
Message-Id: <04271c1f3a4c3d369310146faefc0d05144276e9.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090037_674434_43835A6C 
X-CRM114-Status: UNSURE (   6.57  )
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

SHF_GROUP requires ld >= 2.36.

LLD supports SHF_GROUP too, but it does not support riscv
HAVE_LD_DEAD_CODE_DATA_ELIMINATION. Therefore, I haven't tested the
minimum compatible version yet.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 init/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 1ef5b19918e5..4296c97cfc84 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1467,6 +1467,11 @@ config HAVE_SECTION_SHF_LINK_ORDER_SUPPORT
 	depends on AS_IS_GNU && AS_VERSION >= 23500
 	default y
 
+config HAVE_SECTION_SHF_GROUP_SUPPORT
+	bool
+	depends on AS_IS_GNU && AS_VERSION >= 23600
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
