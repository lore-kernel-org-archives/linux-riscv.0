Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2369CC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6GFbqX2458SyTJDO9J25h/w0Wt40zvExchTuTSrfuw=; b=h9cjM6ZTdeXZNC
	0S43Ybt6+ZTXGK/WfnLFMli5hz1EUGHksRsZvYuk4r8L2i9IruAhwJBVrL2MiiE8raA81HCo2pcLr
	nbBorI2ZL/uI6SrdT7sP5Ys0uGAqtf6Adi0M1FF92KzbmwW/2DFIs2W8zOAYdozR3I75qJCzpteWV
	AewlmC66+U/0wj+EFw/Ax2dlV88JZM6Mmuhj5fQUl+KCC2LtGfe7wPe1XpY63AqgjAXhjJnEqGlvt
	W1bb0vHZZRxNNgpZ8omdoyUE8zrx95Lq4b2/TLeCEzNgQdd4eE2on4Zlazm6Nyt0pNjj0I3wqcPPd
	iSyuBiOBAHZWo4xKdldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPc-005pzJ-RJ; Thu, 19 Jan 2023 16:05:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXP8-005pmK-Ln
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 16:04:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45B2161B5D;
	Thu, 19 Jan 2023 16:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DD0C433D2;
	Thu, 19 Jan 2023 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144281;
	bh=JVI55/ivlZ2TxoJHk0X2NO1E9dymbfoLXWzO4tbPtjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sb/IuKp0gRLNHotZEmSEUC5VIcFKvFDct3mmUFbR/RgMiNz4w6hsFeLsqIRKBxs8C
	 SVXmwwejCWXXx9vxIj0okNKj9s9nXgMDRqz8pM/8I/GxVGChP6BGEhZE/0NpaU0OZJ
	 cWnOmQ6gTLwfeU7TLmG8uXy9apHLMCIN3feZd77krFdI3QM7+VTln48Qd4Ahs1o1eJ
	 CQWzdokDLVZw/3ZLwLJAV+Z42Yn3++93GRXVXXzJbr+WmZ8w2fVTpHa1mk/RKUh2YH
	 8ct/q8JlLqoczfUQ4aTZhYBWCiKj761uH8aPsleUEILO0lJBavjg1fLAxvKgrFvDt8
	 /NrYA+SchZ3Lg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] riscv: vmlinux.lds.S: explicitly catch .rela.dyn symbols
Date: Thu, 19 Jan 2023 23:54:14 +0800
Message-Id: <20230119155417.2600-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119155417.2600-1-jszhang@kernel.org>
References: <20230119155417.2600-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_080442_980477_0370B1CC 
X-CRM114-Status: UNSURE (   9.85  )
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
