Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2115FCD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8zWgtMfOv4vC3GuU4aAiGRM0dxUp7bgHhGECRS4dzo=; b=094hEVqkGx4lHz
	MQAmDCwbhnNTYIDptoKvJ40jHLD9yS0HJavWrZluKrZod6V7n0b+HEU2qaTBEYN5SmNwCQqiW+Slk
	yhwPMkHHiQ/xxXjV/ST/E401KD4+Jv5J5MHv8BPzXO/IiWqPk/z17kpR0sqWiCJh9pO/shknOWFE3
	vTncdPcEdH92ZwC7xtoRNPpy+uSx4V25NDMnFD5w78L6XIIpWNuVr9YwTng9F1HR30KZLCt5XfDGv
	PxSDhGLNRJb8hpKhyYQbX2DKq2hTkCZoqsTMB6JIVvrKEI1pYwWnF/t2sQlBRtb5TC59qnLWJCio1
	KOYnKQaczT6NQTDw/4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYs-00000005Pua-1kRy;
	Wed, 10 Apr 2024 06:35:58 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYo-00000005PkU-0f9J
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:35:56 +0000
X-QQ-mid: bizesmtp86t1712730902t5w2xg72
X-QQ-Originating-IP: 11WQUV0r5zeVO1AoN22iVtolLSL58diAT6MAVG6NtKQ=
Received: from HX01040082.powercore.com.cn ( [14.19.197.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Apr 2024 14:34:58 +0800 (CST)
X-QQ-SSF: 01400000000000B09000000A0000000
X-QQ-FEAT: 5x8Sgf4S6/ibmGyV3WobG9KCGSh3CfJOt5MS70mBYmRNDkCu/CLpXhQakp5Oe
	foHkHFQ1Xb62EDUYBvSRqWRKlrXc7moIGe8iNUnjxQKslMyV8YQCBcaGCOiKN72aLhnkb9s
	qNBcKElaSgGw8eK1Nbg9TW54oX0kJKLmJ8SyGcJiZc7LN/WMbDkysH3TowkGKuVqHU6AJf1
	TYjI62P5c24MuSiQtir9YxixB4NvUopOkYEibXf8t3Lt0uc0GN87tZogJaE3W1IdwghmFxk
	hhxcKuRf8YDztHPEySvI6UzYdBhu4PwrfPMQ4CCuDkJtK0XQKTnFDDQtDD8ypNIj5YhN0mH
	9WhpuUyxrla5J1CssyEBPGPLczjMHHJFTsvpxDbDMOwE687rH6VyqHNv4N19U5fyff5++lE
	P0eZmeeSJvRVNpBLaMYAgGZSpm8ogdtr
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 4090882819559728776
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	atishp@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: [PATCH 3/3] riscv: Add information for MAINTAINERS
Date: Wed, 10 Apr 2024 14:34:32 +0800
Message-Id: <20240410063432.23058-4-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
References: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_233554_760731_20D14C70 
X-CRM114-Status: UNSURE (   6.10  )
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

Add the description of the RISC-V early console to
MAINTAINERS.

Signed-off-by: Jinglin Wen <jinglin.wen@shingroup.cn>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..bdc013ac4e75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18936,6 +18936,12 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V EARLY CONSOLE SUPPORT
+M:	Jinglin Wen <jinglin.wen@shingroup.cn>
+S:	Supported
+F:	arch/riscv/include/asm/early_console.h
+F:	arch/riscv/kernel/early_console.c
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
