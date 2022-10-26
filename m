Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96033C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFi5xP6nN+CnJKviO/jeU+BrwpuMo5vfWvx7+IpFgPk=; b=ntoZBjSyIOkpMJ
	c3B/aTlmY/8tLHwovlwxz5WNH7WiYVMQyHoBjGil4MesDRawEfVcqzs7ZhLT/xldNNnl3akkwo98r
	gW9fhnrBPK8fsNtwcqkMLsPNEhcZsUAV7YdH+Um5PCZGrjtV7DQYYi53MnxIQvbc7X56KLLRCvsRn
	7aXs2imROkQJ5XxNj55tsQdNGXKGXMX8J5+Ipg+skdM4U8yGc2CKbINyWqqB5JK0Q/9/XrLH0u6Pv
	9GnG2NDEj7zFfMiZyzs9vhT56EXLjVQzXDN9H1EUSJgVHz0TQPMfUKlariGOXVK0I9XIObPW6bOkc
	ABaqlqu5FXclJqTHVi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondrK-008wlH-Li; Wed, 26 Oct 2022 10:42:06 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondrF-008wf2-Sm
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 10:42:03 +0000
X-QQ-mid: bizesmtp72t1666780860thlpjusd
Received: from localhost.localdomain ( [101.6.93.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Oct 2022 18:40:46 +0800 (CST)
X-QQ-SSF: 0140000000000060B000000A0000000
X-QQ-FEAT: rGm7xzoh3hl3ya5sdSHuKGIIU47rr/fjDyiOLrmcLON1wIvSddcUSf+DDWDU6
	NACAphMLViC2kF9KRr/8fPaM9cG+p9AoXQtAfI/yZNMEcQt5G3zgMiOtXUG3OblLtxq2+b2
	bs6Aen9/b7YT8b1MIlWAHuIFvvTZFlQ+gOED3tByPWzVdNFEkBTjQA+9fVV5g2RZBfciQEp
	hdm8N7btrbiOzOzHqflybP6uY01MZjrMchRycFsc/a5GbTfz6n4uZcQK2lWT2IxfJUYEt4E
	M1n+M1rT5VlnH0yy/F1nwzBtxiGlHz5Jw6enyciIzBCbkp2EPvEEiOLMW6wshtOOFQ2QncE
	0x/NKiFIAsEJQtTllmhLBFWQpzN6QHVIYoRm269ADO9ovCNFc0FKtx431pFRzmFk3t9PR0+
	wgJjvPN4/e4=
X-QQ-GoodBg: 1
From: Wen Yao <haiwenyao@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dennis@kernel.org,
	tj@kernel.org,
	cl@linux.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Wen Yao <haiwenyao@uniontech.com>
Subject: [PATCH 2/2] riscv:kconfig:select HAVE_CMPXCHG_LOCAL
Date: Wed, 26 Oct 2022 18:40:15 +0800
Message-Id: <20221026104015.565468-3-haiwenyao@uniontech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026104015.565468-1-haiwenyao@uniontech.com>
References: <20221026104015.565468-1-haiwenyao@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_034202_452163_7739836E 
X-CRM114-Status: UNSURE (   5.74  )
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

We implement an optimised this_cpu_cmpxchg API,so select HAVE_CMPXCHG_LOCA
to open cmpxchg-local feature.

Signed-off-by: Wen Yao <haiwenyao@uniontech.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..8e19df5a8227 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -88,6 +88,7 @@ config RISCV
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
