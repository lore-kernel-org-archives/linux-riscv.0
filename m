Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31EEC04A94
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 17:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaJTshUvUVBloNNk53t5mELjQ40mbo2cczWvdbLprdY=; b=DuNqNoN5nUrgFf
	Xo8UOYOYxY+udU6NDggMWStTyVQUSSzdouuYh/hfzI9fthw4sq/I+poPupUMUMBXFVhJyeFaqerWh
	V1/ggiIKWLQ3jj6GgUig8Y0LVSThZUvyB+Pwmz5/xSAJbX/b4+BD00y+LuuuD7jDU1sl4ERb+uIsz
	12dz18Q9ggQgysW/5C6rWdAwbcjnrp9yCXGHuaH8QGuqv/IVFohmb9m2xCWft1pifvp9btkgKZL90
	qrB3OHbD8Gzf4A+FGV822TcdH6BKPiIh8EJuhwYIUMHUWaFX8Z68Y+uB49bbG+v2HOgYNGbj5EWLp
	pntWeE3xE6VUkdTFqElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWW-00BCS3-3B;
	Wed, 26 Jul 2023 17:42:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWS-00BCPM-35
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 17:42:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2114161ADD;
	Wed, 26 Jul 2023 17:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2CAC433C8;
	Wed, 26 Jul 2023 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690393323;
	bh=fOYigNePlsrUb3dRqIC3/Ob7Qzi/aiqzn31+xV+bzaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K+M6E067FfjPCZKuJZ9lNLLwnZz6jYodnhLy8yF03C92zX0IDO+m+B0T3XW7vgkWO
	 ohRoqa0nqbgJGOpOmKbL4G/WsqqPzBga43sKWCQuGiNdPONCwZR2FpotNJJF+VoDsG
	 GecnymJv0fJbCrZ8cig1QeUA390l7lo07iri5hS+3Dd+IgmGCQ7+pMhqBTaMwwUqY+
	 bviq+VCCP4wowizlnlhzQcmp9Jkjq8YeCwvKbxVjEQysKW6NxMCTvnjLSsmtp+3a7g
	 WYuiCHaG+Z9eK1oFo7F+f9RxSRMzM9YMqwuWgzSjTI540Z3RGbmbPFFycCmpgJ2Rgc
	 tJeSD92FmJhXQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: vdso.lds.S: merge .data section into .rodata section
Date: Thu, 27 Jul 2023 01:30:23 +0800
Message-Id: <20230726173024.3684-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230726173024.3684-1-jszhang@kernel.org>
References: <20230726173024.3684-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_104205_034922_4FF68278 
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

The .data section doesn't need to be separate from .rodata section,
they are both readonly.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index d43fd7c7dd11..671aa21769bc 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -29,7 +29,13 @@ SECTIONS
 	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
 	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
 
-	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
+	.rodata		: {
+		*(.rodata .rodata.* .gnu.linkonce.r.*)
+		*(.got.plt) *(.got)
+		*(.data .data.* .gnu.linkonce.d.*)
+		*(.dynbss)
+		*(.bss .bss.* .gnu.linkonce.b.*)
+	}
 
 	/*
 	 * This linker script is used both with -r and with -shared.
@@ -44,13 +50,6 @@ SECTIONS
 	.alternative : {
 		*(.alternative)
 	}
-
-	.data		: {
-		*(.got.plt) *(.got)
-		*(.data .data.* .gnu.linkonce.d.*)
-		*(.dynbss)
-		*(.bss .bss.* .gnu.linkonce.b.*)
-	}
 }
 
 /*
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
