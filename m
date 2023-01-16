Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C68C677F1
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6GFbqX2458SyTJDO9J25h/w0Wt40zvExchTuTSrfuw=; b=GafYVTIpWs9ehe
	ML/TbohoHbh0rhcuYW/DR9Dp6ws2xa2bovZPiKFFzSxlK5cq5R524C1Nv5eWXNkCboa5POHIyNXoU
	L7o3HwQEY9JHp2xsjX1eXJQ+YtvGxIZW7+SejsRzbxNVZIUyOZAYEKgPyvyWAM+KcgcgHwUcpJDAL
	F51OCV0Q4spP59R8o9ZR5nT4/FpAIYw+G8wN8UWF7oBXbKAUigoEjFXrHT5Qg9DLi4y5KMv7KdwtX
	uaiBBUCgxodNkD0VcV29zwAaPjIA03yCpsW+5LG7xmdB5rqjLWWt2vC5WxxMPdXmy0uCRqmF/sUsh
	B5AxVWzqraGflv1sstkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsQ-00BAyL-5g; Mon, 16 Jan 2023 15:58:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsM-00BAwu-Eu
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 15:58:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A559E61040;
	Mon, 16 Jan 2023 15:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C310EC43396;
	Mon, 16 Jan 2023 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673884701;
	bh=JVI55/ivlZ2TxoJHk0X2NO1E9dymbfoLXWzO4tbPtjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hQLGWPWQBowTdfDg/CAki4MZcAg5/oB3PXLLPX88Fnba5bARdbE1+3SIw6lMIpexo
	 158RFZEXuUbxPysfc9lf9HngMpxyxhvWhtr8iNeazmKvbXLi2Ou6toHL074DAHNap8
	 C8/T3PPt6zAG0XEAUaociWBjoQP+nn4QB1AlC3xS1nru4qIbz/Wug10e3x09Vdn+Tr
	 WnndwNlS89nIB5ayBvcVqWQxlJCaU8lhsxbnLP5n3VHtETNQXTxQelSSX2UtPRQVwQ
	 AWSNBRAK6fZw+izOcSz7VW5ZZ7BTAHkP4rOBZcaUUbjiivigRGcf2aKfn3OH6kWZDX
	 l124xXCOsW7zQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH 2/4] riscv: vmlinux.lds.S: explicitly catch .rela.dyn symbols
Date: Mon, 16 Jan 2023 23:47:58 +0800
Message-Id: <20230116154800.2396-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116154800.2396-1-jszhang@kernel.org>
References: <20230116154800.2396-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_075822_561008_716C52B1 
X-CRM114-Status: UNSURE (   9.28  )
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

When enabling linker orphan section warning, I got warnings similar as
below:
riscv64-linux-gnu-ld: warning: orphan section `.rela.text' from
`init/main.o' being placed in section `.rela.dyn'

Use the approach similar as ARM64 does and declare it in vmlinux.lds.S

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 07c19f2a288c..6a250313b752 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -97,6 +97,10 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
+	.rela.dyn : {
+		*(.rela*)
+	}
+
 	__init_data_end = .;
 
 	. = ALIGN(8);
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
