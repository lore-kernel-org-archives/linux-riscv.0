Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25A6C43219
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 13:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E07skzgQGkNUwfxPNMrtvd+WCEoD/aVYSCRmCm7LImM=; b=Ky5lj7Uvbt24Ov
	qnnbHoANNibbvhV/loEjAnsPdJmx90PYhlFU7TQv2AZi7WTPOuUzMB8/gWv7uyin0HnJTjNbXOyED
	wK1fTY7YHYNcEXaJwG+9TlmuM3o0FppgaJg1QJKPjQaGe/3Y8r9npLYHQAtS/cWPdL8yChO6s+ztx
	CG1pOS2MJz6HqW8J4xTLoHyrSIYUJWv0Lb6cnkXqAMMRpMqF4A5WfEWZxR//7qXiZwByUcbf50Qdj
	KtCif5RAP1PMitUzPfBkBWyCKw8YfwBTwnFn3CsKB0cI3o9nifWznCey5h5p4mjh3PclYdlgGYnGz
	edW+17kcbF0RjYOE3/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMSQ-00F2Oi-Dn; Mon, 04 Apr 2022 13:09:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMSN-00F2Nm-Gk
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 13:09:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id w4so14383543wrg.12
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8bMiTlc9QLjxR82LwL/Ue57DBVVVkCRSusboB2YZExg=;
 b=dtExrfUweqJrOVONHzBJcZYWG/Mps2ZJ6xSorF50/4N7iFlhhdDySKK0CMVydLmkbx
 TyFf4bPYDThs+WfcBfgDIAjMlHiqdu88yIkZXIVa+qLZruqtQ23sWzpIZi+cmsOccMCW
 V1M/EYZC8cCeolq5Sjy3iU5eCZ89ePGYDUWOAla7tWKiY+Xe2EgN/V8Dx9kU7HtMoSzr
 82yF8XdJ+n1y3ZdOwA/HPvUoT7RVZi5v/IcjKWMWMiOnb4a5jHO8Ae4xodRm+4b/HCaJ
 +X2P/23icqleHpUeng5idAu82fXGj4TCSam3KGWbddKdzezpAQ44FAv+iUbtdXxOTN/r
 pONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8bMiTlc9QLjxR82LwL/Ue57DBVVVkCRSusboB2YZExg=;
 b=B9gqs5Ol39kXe983F+uC2V56MBED+CFbmktC3KS9arzPuowfiYbetKhrocNoTxgSr4
 bMeJ2+23e1QPJ1HXGl2HIjNUOzHy28PColnRxRcrElHX5ECrLe90pMRVvqnieirWd5yN
 kUtqS7rNfqXrxqiino5vzB+D5LGt1zxVpTWUpmlQcKDXUxl7+NYha/SvU40pcqY27NG+
 r7F/4PZBwttE5Ct4qxdLemt9FQE4QXbRskdO4/4j+/U73j/ck1cXpQh3BXtJGLxAEiKs
 L3i+KccUC66LTwCG+1iQCmRcARAngOmS4ZwCte0mCEySoWuwZ+DRSudGZhjVbQOZQXtc
 8PIA==
X-Gm-Message-State: AOAM532uUmq5KL2N/rraWKx+OqgddwBk99nWkkJTWg95tX9Y/7UBM7mC
 GVdgEDymogLAgNIs+fv8Onw=
X-Google-Smtp-Source: ABdhPJy7dpXV27Zlj7E5jGVLlqXHlveLKVS7wQ3+PXf6NPT9cWgZsZASQtsvdDRjxosA4SOnqN3+mw==
X-Received: by 2002:a05:6000:1ac9:b0:205:8461:5664 with SMTP id
 i9-20020a0560001ac900b0020584615664mr16979675wry.123.1649077756336; 
 Mon, 04 Apr 2022 06:09:16 -0700 (PDT)
Received: from BHD6QPUW.conti.de ([62.4.90.5])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm17424898wmc.22.2022.04.04.06.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:09:15 -0700 (PDT)
From: wafgo01@gmail.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH] Makefile: riscv: Remove duplicated -O binary objcopy flags
Date: Mon,  4 Apr 2022 15:08:35 +0200
Message-Id: <20220404130835.108828-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.29.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_060919_616653_B41B82BF 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Wadim Mueller <wafgo01@gmail.com>

In arch/riscv/Makefile the OBJCOPYFLAGS are already set to -O binary
so the duplicated flags for Image and xipImage generation can be
removed from arch/riscv/boot/Makefile.

The fact that the flags are indeed duplicated can be checked in
.Image.cmd which specifies -O binary twice

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 arch/riscv/boot/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index becd0621071c..c000a1fc8c56 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -16,8 +16,8 @@
 
 KCOV_INSTRUMENT := n
 
-OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
-OBJCOPYFLAGS_xipImage :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
+OBJCOPYFLAGS_Image :=-R .note -R .note.gnu.build-id -R .comment -S
+OBJCOPYFLAGS_xipImage :=-R .note -R .note.gnu.build-id -R .comment -S
 
 targets := Image Image.* loader loader.o loader.lds loader.bin
 targets := Image Image.* loader loader.o loader.lds loader.bin xipImage
-- 
2.29.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
