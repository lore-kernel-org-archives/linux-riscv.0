Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E55CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X40n02qOYGzxxiPkBkBGiQaT/EpF6bpC+RzvznZ7YPY=; b=H70AOeBPIU7yDy
	r7tNh+bMt/VYtj/0eRE2zBWltdZcvhnnvmc/oKy/zGkSTpMuDn4xjkS3BKqfNeWh8hMuyBtbWAoSR
	uwAbKPs0wOP5qE5FkdjdkvcZOxXOQcUghlgqx6IYcwSZ4X1ULm3shkgPgUsPIf4FIBby96GcSIRzt
	6SiKH2/YHmaTjDPgCN3JqRRraSwZp6WVDnWpJ5hA2Md6/RcZcV2nWDhwFR6DnBCwqFuIInOfpwZgp
	cB3Th/2nfS/ob6i5BAYdH/+/o3ccKcLyTYbDe5m+qG+8MlaAMs66dN3fZdcDI8OO1gJj8VIh+YTve
	3ld5xkxa1BCkLw6xX77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvu-00000004zR5-0KII;
	Thu, 09 Oct 2025 01:59:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvr-00000004zOK-3eqa
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:59:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-28a5b8b12a1so4203285ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975143; x=1760579943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BAMdYf9jYg430LRuIQ/78MgeGFhJjBTPRUD+PdvqOQ=;
        b=LAw1ogGWNRFrW8aulU9ausqsnH+Qsqz+BI5Bfp+mr1EZgo5tpobeq01+g/Pd5Uylg9
         hVoQD//o/LjSlDY52d+WQXXAyabvBb/MwDjl4Jgjz9T10ilChHoFR9bHNCtXl9D+FIGe
         9+JmKDbWObIGDM5nyxc1xpzW7rBZfS1yHemO0LB9G0/SMG7d4Vijj0CSqlJo0IzpNA9F
         RD2LdQZlMbAh3VwB7ClCxNmXSUk16THsfJ/3BB6hDGL99EbH/hpGfGgc5YqOgtEutp6g
         mlKgsj1hOT8AE/mEUHn907EYbzpCUTvTRIJeV9rUR88UA6yxYqV2F5ZuiSGPz3za2N2D
         Ihhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975143; x=1760579943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BAMdYf9jYg430LRuIQ/78MgeGFhJjBTPRUD+PdvqOQ=;
        b=SYFW9V1ewtZeM7cpf45hu5jsRzsvTqcm767BNow6bQOwVKOzaYbmDA0WiV7Vydfaqc
         Q7d+EYyjoWAz2RSdbsCufx8QOoQlKdM8IzCEJO259xkRKQUXuRhX7ZtwBx6N2WzRQyPp
         gTdV5zIUCK9MYOFQAUd8c9JHeVJx4/n7ZxmBJUDs2vd9oRCpGZB3PlLCMOcm9jDK9Px6
         qtJY+1cAWf9Au9D5fRWcpHIyD6vSpNSB12sJ1hHIrgZChQiFy1yW3f/7cDlKBYxvFNeY
         8m9gxOLT8rjUDUmSzB+usbKyw9Qs81pGJjli2BYlchQEFDL2DzoVoB/igeR3pTgvMrzy
         vjjg==
X-Forwarded-Encrypted: i=1; AJvYcCXEpkyLn4JbqWBuyURH49P8dIB0pLPw+Hf2GJjAA2idxB2vMQ7TEfdt9i11+iIbKtCTTGZP/2ph+kacHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNekYT5KqdpH8NT+D587FwDmvUZC5KOPvanKASwDW9K65wA43N
	mkwBGQJGxCUShyugKxv9yFCDjFMUxaiQg122q5J7Dl0UZFlVBF2uHgi6CrnUpLXvx6o=
X-Gm-Gg: ASbGncu6wvdA0V4j04a22q8oSiSU+x6VsIaONkL7FnHdmkAHFY0rzGzgoz+1zYsUfDB
	mTVwj7QRtBWdN1hZpsDbLEhIWJFtaxvWI0Vsbl+mnCT/8PTk/ZbtFTALHO0QmvuHxowh7j3T+K9
	OO6LbggEmZem2dlx2FvQGizqcLy9tcQwqXT4f0ZoEi+BhUa5fcHZbtUaETa7hfDcDYvzvJRqZRq
	1d8VqOqDzQUywx1VK+Dygd7hvg8TCLt5AvOSjFD8KPyDde9kX2zA9Rpo0SYBG52pFrccQQo3hUp
	3b31GoxWDcKxT9BO9oztFNRGihV4j+jXLBydc2mwhQB9R/7xvUeGaCgGuHUJXxARa0GgrTSU0pn
	R7tPJiaV+xOLycgJCmy0GKtfEVIawzdg16QQOGrVV2H6a4sP/7wTPJJWIOni4Z2qvBGZZlphX01
	/OW9s=
X-Google-Smtp-Source: AGHT+IFH8AKgqsZnk4E4iyKT3yuRTpeHrZ3gNSsclL9XuJ0PoMWOCXT4FRimy04nwWVVyn2iJvf1+Q==
X-Received: by 2002:a17:903:910:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-290273eddc4mr77201595ad.38.1759975143155;
        Wed, 08 Oct 2025 18:59:03 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:59:02 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 18/18] riscv: dts: eswin: eic7700: Use physical memory ranges for DMA
Date: Wed,  8 Oct 2025 18:57:54 -0700
Message-ID: <20251009015839.3460231-19-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185903_913292_15A60276 
X-CRM114-Status: GOOD (  10.89  )
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

EIC7700 provides a physical memory region which is a noncached alias of
normal cacheable DRAM. Declare this alias in the devicetree so Linux can
allocate noncached pages for noncoherent DMA, and M-mode firmware can
protect the noncached alias with PMPs.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/Kconfig.socs                | 2 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index a8950206fb750..df3ed1d322fe7 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -9,6 +9,8 @@ config ARCH_ANDES
 
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
+	select RISCV_DMA_NONCOHERENT
+	select RISCV_NONSTANDARD_CACHE_OPS
 	help
 	  This enables support for ESWIN SoC platform hardware,
 	  including the ESWIN EIC7700 SoC.
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c3ed93008bca1..09292910065b2 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -5,9 +5,14 @@
 
 /dts-v1/;
 
+#include <dt-bindings/riscv/physical-memory.h>
+
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
+	riscv,physical-memory-regions =
+		<0x000 0x80000000 0x00f 0x80000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
+		<0x0c0 0x00000000 0x010 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(1)) 0x0>;
 
 	cpus {
 		#address-cells = <1>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
