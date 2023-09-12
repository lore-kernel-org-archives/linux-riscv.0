Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E534FCA0ED3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VaUn2jzG330UTim7Roj2BqYcemrMy1q+zXjfHXUM+E=; b=WKmrph0tSQKVqh
	XIrU92mmK2okX2oIh/pTuUcWoFXTaejqnAt6VZa9AxrLgUX4VdtJF7MGkxqd/EKN19FByP/zoajny
	S7ZXg9W3LLdiD/uTkqd6iKK/sv+/u9vUHjNdChvMzxcbWI81jGjk6ufYlxYbjrXGL5WdGx+81AxqD
	vIz3+4LOP28A4OT+duS9o6Z+MhjN0OiZqPXJr5PhnWk0wz+1Qb4z4rsDmLZ4HvxxSUqePJLa6zzj8
	4ph6ZVaBc1KHSHmbdICaPjToVQ7YzaCIBv3jGGVAYeRQnm0bhaq5jxuukZl6Zz6eE422o9E19jIQT
	wBpLvghfXw4ngas+Z+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxsi-002PGB-00;
	Tue, 12 Sep 2023 07:32:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxsf-002PEC-0V
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:32:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 633F6CE0AC9;
	Tue, 12 Sep 2023 07:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC59AC433C8;
	Tue, 12 Sep 2023 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694503932;
	bh=HBWl5TsWAKAoTzbm8Bwf+YOEMz6NMlDFOMNBVCJ92PE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OvVipaHJZ3zN6VWZ13xySJscIIb9lQcwQwf2SKfyd22P78oZNNTLrW+qPfdhupd5j
	 1LH0ujc0/BogPiGdv044Ht/xolxVdwAg0WVA27P2R8L53y2TSDLR0j/rVGRW050or1
	 ktvn0XBB2FE3O5Vs52vpqCaPDsQNrLOj1aVUptRkuY1ezxJhGZiZFoVgBqbVF/uwZo
	 oBpMTx372X/0B4DbYcwOAxS+wBOuhAhQOqHVSZemrTrW8dQokYUXQNHIgj+TkprJPK
	 +alxjlXZPeMlumYoYHle6QTNRZlrHCkx1SYVzH1RX1AAinxnB91xL1TmlitQ2GkuqJ
	 BhoGw/P1VwzKQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [RESEND PATCH 1/3] riscv: vdso.lds.S: drop __alt_start and __alt_end symbols
Date: Tue, 12 Sep 2023 15:20:13 +0800
Message-Id: <20230912072015.2424-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230912072015.2424-1-jszhang@kernel.org>
References: <20230912072015.2424-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_003217_411536_8A4E5405 
X-CRM114-Status: UNSURE (   8.34  )
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

These two symbols are not used, remove them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 82ce64900f3d..d43fd7c7dd11 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -42,9 +42,7 @@ SECTIONS
 
 	. = ALIGN(4);
 	.alternative : {
-		__alt_start = .;
 		*(.alternative)
-		__alt_end = .;
 	}
 
 	.data		: {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
