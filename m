Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C5FC4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nB3y16a6G6Ewujq3iSxWLQjNgukrBf0LSH/0Y1GCfpU=; b=uX0L4pv/LT7cEa
	Dn7PvQ+vQsksicQGZ/H7CwIrIyIzTT/XAKog3hnNIuCwEEHBPgkG3tBsm78XTmWEb3S3nQbhqUrK4
	6w9k/ParKdAUkdFx06SuCXF49wq0EZi+Bk9r1yf6UBqeyQrkZCRVYzKRcQPbJxn/ktDYJ4EFjQ6fh
	Db1L1cTYM4mHX5V3l21qdif1zZzX03o8j+R9oDVlexGNvsXErnQpir688eCJd4I1cv4al/rNBG9zL
	myYCh1d+aQHKXprlMUtffjgYQpSpt1aXMCb3aF1+u/hl4Hjwy/9CdOmOkUY5DCiyr0HSHleq1t/Ep
	AqbK+/ynlRDvw/0Hwnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralUL-00000000Vmg-1J15;
	Thu, 15 Feb 2024 23:49:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralUI-00000000VlO-2Tg2
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 23:49:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e1358dd3a1so458028b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 15:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708040990; x=1708645790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rifv2r9AYOj+Pzx28lr78UDT6/TFCnKPoGuCgecYqhQ=;
        b=iMMJ6g7+/tzTdnTrPzCc154Yp18PzxrHc1dRdhCxoVU6Bk08U0nDSbn9qAqEMkwVMl
         KhwGL2dvM1/L0yyc3FOKY3D8YfOrXTr+4KojlOJOsL8sJuSEoFhJ9v4uLIEu3nxbgZjO
         luTbFP990VUBJL+iWlhinarRF+a/B3/fVJ3x1n6BO2HqZd3eOWBUORgcLPHHju4lDznV
         sQigJ1X3FAi+CvStTZKDToIOknt87ztcMFv+exBbnNWjjnJQvZIBMHSVn6ALWW8cO6Pa
         wHaiqLbgon5JZIbkCNKYjbtmCjCu1a21WOQIjj5jnfi7+ypRvzD015E2pCJRbRuDwE/w
         YdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708040990; x=1708645790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rifv2r9AYOj+Pzx28lr78UDT6/TFCnKPoGuCgecYqhQ=;
        b=FfldH8zPX74maV0kWlRGWIrduA5NNzIwyorOS4MJXcFeRDyuybxlaLv/KBkvFykzN9
         DaYJ8xV6J4RRNx+r6ZzXKR2Eb1dOWJEBF4Q9XSyquGx7/sbvXxuc3rNg0x/qEywo3aP5
         bdQTJ6MbjFqIMKgXvoHtWa5X3nPWJNtmec1YMhVDGkmyLfDBNmWPSIL0zVBnrtsGUATw
         hhsSyky+9qE29D8Huc7lfHThivjcgLXANfwIeRSv2ppReCjuEi+HIJ4MRLJ//UbHoADS
         sD2BnaboIVIgoiP9ItRyR6rZURV8xZjxSdfqkJQR1YpXiJ8rWIZWh4YHzzXeHDVPnpVx
         AoHg==
X-Forwarded-Encrypted: i=1; AJvYcCXTHMWYq/RS9s5BJXdPnEHldYEbqZYYNrmXJn8MC98vgdXGivh6YTncrBwfXHgQfLwu/I0DOicKlmK+jU1++7fwFYpJdzM1Hheu3ivMpFsu
X-Gm-Message-State: AOJu0YwUg2YaVz3rjvdS8X0ZjuKTcctflociK/oKMf4htvO4dZQ4kKmW
	W0Y7smrH3QhfiiUfxPZhW2NGEm66iQHo4PPm/DK4hPaHXCxw3pJbP4nZuMuvV6A=
X-Google-Smtp-Source: AGHT+IFQ6beUFzBYt5s0oSfunWfGOxdy7IjhnlyCNClELPZW6125cIlESnuKiwnVj+4uUVw8TdTwMg==
X-Received: by 2002:a05:6a00:6c9f:b0:6e0:a30c:8c84 with SMTP id jc31-20020a056a006c9f00b006e0a30c8c84mr4257355pfb.1.1708040990183;
        Thu, 15 Feb 2024 15:49:50 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u8-20020aa78488000000b006e10bfd6a88sm1855529pfn.69.2024.02.15.15.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 15:49:49 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Greentime Hu <greentime.hu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Green Wan <green.wan@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update SiFive driver maintainers
Date: Thu, 15 Feb 2024 15:49:11 -0800
Message-ID: <20240215234941.1663791-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_154954_685526_74D58627 
X-CRM114-Status: GOOD (  11.03  )
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

Add myself as a maintainer for the various SiFive drivers, since I have
been performing cleanup activity on these drivers and reviewing patches
to them for a while now. Remove Palmer as a maintainer, as he is focused
on overall RISC-V architecture support.

Collapse some duplicate entries into the main SiFive drivers entry:
 - Conor is already maintainer of standalone cache drivers as a whole,
   and these files are also covered by the "sifive" file name regex.
 - Paul's git tree has not been updated since 2018, and all file names
   matching the "fu540" pattern also match the "sifive" pattern.
 - Green has not been active on the LKML for a couple of years.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 MAINTAINERS | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 73d898383e51..f1bbb0f82664 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1395,6 +1395,7 @@ F:	drivers/hwmon/max31760.c
 
 ANALOGBITS PLL LIBRARIES
 M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Samuel Holland <samuel.holland@sifive.com>
 S:	Supported
 F:	drivers/clk/analogbits/*
 F:	include/linux/clk/analogbits*
@@ -16725,6 +16726,7 @@ F:	drivers/pci/controller/dwc/*layerscape*
 PCI DRIVER FOR FU740
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Greentime Hu <greentime.hu@sifive.com>
+M:	Samuel Holland <samuel.holland@sifive.com>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -19968,36 +19970,15 @@ S:	Maintained
 F:	drivers/watchdog/simatic-ipc-wdt.c
 
 SIFIVE DRIVERS
-M:	Palmer Dabbelt <palmer@dabbelt.com>
 M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Samuel Holland <samuel.holland@sifive.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	drivers/dma/sf-pdma/
 N:	sifive
+K:	fu[57]40
 K:	[^@]sifive
 
-SIFIVE CACHE DRIVER
-M:	Conor Dooley <conor@kernel.org>
-L:	linux-riscv@lists.infradead.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
-F:	drivers/cache/sifive_ccache.c
-
-SIFIVE FU540 SYSTEM-ON-CHIP
-M:	Paul Walmsley <paul.walmsley@sifive.com>
-M:	Palmer Dabbelt <palmer@dabbelt.com>
-L:	linux-riscv@lists.infradead.org
-S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pjw/sifive.git
-N:	fu540
-K:	fu540
-
-SIFIVE PDMA DRIVER
-M:	Green Wan <green.wan@sifive.com>
-S:	Maintained
-F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
-F:	drivers/dma/sf-pdma/
-
-
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
