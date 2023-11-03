Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A20C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jso41RErdgCJIRvOCuC+QcE/wVLSGEBrdn8EZKt4o4A=; b=qvzI6gJAzTzKQ6
	6MEG6/Yd8KnWF84wh09EcVof6liuHAN/rKtPE6yv1aRsAYqnXp9rfVxJ4LdoOc66YC68eMJcpQEAr
	+xM/PW8vuwa9QOG7GHHp86kIq4XvEe8EVf5uqEm/Yk2Hb5XuYx1QlCBE7aDvsEIO+ab/rzyv3vWBH
	ywpcyg3/kWiLmwlCT4s8Kg2JUICKeK7rr6he+BoSRT8Tr/IcfHpVb+zDDuGhMNssW61ez3wts5Yta
	d5yGi9K7BDYNy9zjwzM+tMdNmlVVxWy//CpWVEhhr6f6+Y6Wx9eY3b/Q1bQi/B7GRXyTYGAY3k5Xq
	hHlEGTTP2xmh886cIHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywbP-00Bjqm-2J;
	Fri, 03 Nov 2023 16:00:55 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywbM-00BjpE-2n
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:00:54 +0000
X-QQ-mid: bizesmtp64t1699027236t5ijv5ky
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:00:33 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: rZJGTgY0+YOXiDRtSv5jrBH+Ok8Gp19fhcj4KioUSMpuqQklo5ZZQc/JPJ8NP
	EtrPZ1izysnRKGJpccJps5x7PACRlaGOgqrbhQsoXPYIL0wptOzTr59TlmxVaci9hDwmWW3
	p2AG5vAakwXzlGOvAVJVj+6geI4kiy35fnAl8Hxgjur7eOzsHK3fr/I5H8UeJZfgM66PbGn
	yeYjqTHLgymXpyzEuYFaXxOuqvZ/uCI5ZmMmOhTzMnqvs5W/vD7crDXrQQkhlJGtCD99gYw
	TlsX5JstKOh466iu7/6cBHsznx3S3ZdcSo34kwI/IMvXXT09A715opfHEEVuc05iI+uAU/L
	64Ij+YmTR0MwCKVFG9rPTnOMLXFsQg6LeXI01q9jVrDUx/zPUETEnoZ/zd554YXkD/vc5qy
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8259172485907225114
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
Subject: [PATCH v1 07/14] DCE/DSE: add HAVE_SECTION_NO_KEEP_SUPPORT option
Date: Sat,  4 Nov 2023 00:00:31 +0800
Message-Id: <494854689a6f6f91da151ae4bd9a7a6132092271.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090053_213959_DABBCE92 
X-CRM114-Status: UNSURE (   6.03  )
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

Once there's SECTION_SHF_LINK_ORDER_SUPPORT or
SECTION_SHF_GROUP_SUPPORT, there won't be any orphan section and won't
need KEEP() anymore.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 init/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 4296c97cfc84..9834dbb0ddae 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1462,6 +1462,11 @@ config HAVE_TRIM_UNUSED_SYSCALLS
 	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	default n
 
+config HAVE_SECTION_NO_KEEP_SUPPORT
+	bool
+	depends on HAVE_SECTION_SHF_LINK_ORDER_SUPPORT || HAVE_SECTION_SHF_GROUP_SUPPORT
+	default y
+
 config HAVE_SECTION_SHF_LINK_ORDER_SUPPORT
 	bool
 	depends on AS_IS_GNU && AS_VERSION >= 23500
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
