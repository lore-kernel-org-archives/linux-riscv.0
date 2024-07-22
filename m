Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F581C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=01QxTg+eUflE71AR5ZUYSXds/vA0BgmYE2ngPc6DJcE=; b=2sUG32oGPRl/4o
	FwqB+ItSsO6KRgXu7f82en07qBDkvEiMuwRD9BJouwPBWATpttVi1+XzgOUQYQ8p/5hPRVc1vjSlR
	LTQOkptIE9q+WHC9acW9c3Am4tr6+99c2dlTEQISZBmPLz+LNTWrneIsxXdZrXHMabZuzEnyIo0X5
	9B3GNtQkoJo2rGHPQKNvBY3y5/64sXKuqAXpPnUgEw6/+TYfotCVhrJKNCvgFNm7reYGCXgGsnN8p
	c74mQNKGFCZLhcZT9btqcxkmHD6iSrPkwChqL7xxlKUkerI1HDwTybtPZvqWvEY3GpiutRuMjRH41
	Id7CyaeqGLBiTdU1dphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvFi-00000009znj-3GP7;
	Mon, 22 Jul 2024 15:47:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvFe-00000009zm1-0Q2y
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 15:47:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso26571195ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721663220; x=1722268020; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=qFsD8P56tt4tzwUvq3CqBdSHL92rhAxRHlnzX+/Z2KY=;
        b=KrTpMw2JUnzw2IFO/xylfuxH0CKubqUKzPP4f/zHTxmaq6in8vfSGNIUNR5hMovw5f
         ixiSnMmfQVkAdCHAQXmBflLPlbI2hnYlXxrxKnocb2qBWfvX0m/wS0S4VPueXAwv7Wjm
         OJbA10A2G/HATPC5peiTFg8uiaMgPUzxwRPtqVW7ZC4hQU0DMn3PFMQAGbcQ313kR0Kq
         K5omP0Zsu9GABa+FxefjzNH3oW+rgY5qynE4Q4RCfICgqkpWuHKREW1QeQ8T+1bWkuIa
         8r99BypLoCKBD0PenDg4S9daiS4KfYzZbQjBtgQRZxq0vnDV00hmUr4W+J1y5LMYqyOi
         yXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721663220; x=1722268020;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFsD8P56tt4tzwUvq3CqBdSHL92rhAxRHlnzX+/Z2KY=;
        b=MLm2ciiXgUx05OzzXED79q9H2l9WXTdguFMSBxU17T5j/mZ8Sm5dUmW5O+C3+tGFEI
         t/d8RQnvuRj0BxaKojgBHZv6P28eGYqsrpKiSyMMPkYGDH064nS2XiOl51SbEnsFc86s
         ocCbLbFxTkLb2xyRJa7jeQ1UHKBd+ud2xOUWaPAbTmqcscrI56Yi6d2ueVorkCked2F/
         Q7NPYzwkDqRIRIhOo9bnH/Hr1ixTnBVWKRwSZSkVSbdeupi5LwSCOZjcvP9Ql7d7bKM1
         mMXCTePuK5Afl3Q95voJBmD5NfEMr3u0cAv09zCpYjigj5AotDWhnpi+E00+qugjrkKP
         fKaA==
X-Forwarded-Encrypted: i=1; AJvYcCUvav8gFgLoT+i8FVhkIE+y/8BoAmCq+LfmCqf0vXtPNER1lBCMDJ479B1KVBqEtoJE4p91pM1uVNEUAG2qa4uLnH0tDYIg4ZPc7RyZHY7r
X-Gm-Message-State: AOJu0YznHbu9s/PSbBok7vN6LkZ+dSWbgAge0cdo+fhiBIa+L2F98wgk
	DsyixY/DhbXkO2YjDZR+vHzGVHb2x/sZxyMlYFQgN+hIFaF6ehhCmo42oREctDhrW1aqVRjrUmy
	C
X-Google-Smtp-Source: AGHT+IFPGavVgezBjaiJSW9/MTpsmyBqfw6HVevGo8Pxdxe7DzmjhIH1eDdDiCNeVyONE21ZhTaYug==
X-Received: by 2002:a17:902:ec86:b0:1fd:88d2:47f6 with SMTP id d9443c01a7336-1fd88d24ae9mr36782385ad.38.1721663220183;
        Mon, 22 Jul 2024 08:47:00 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f25aa4csm56031345ad.30.2024.07.22.08.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 08:46:59 -0700 (PDT)
Subject: [PATCH v2] cache: StarFive: Require a 64-bit system
Date: Mon, 22 Jul 2024 08:45:20 -0700
Message-ID: <20240722154519.25375-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_084702_423201_C9555967 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This has a bunch of {read,write}q() calls, so it won't work on 32-bit
systems.  I don't think there's any 32-bit StarFive systems, so for now
just require 64-bit.

Fixes: cabff60ca77d ("cache: Add StarFive StarLink cache management")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes since v1 <20240719163841.19018-1-palmer@rivosinc.com>:

* Drop the STARLINK_CACHE_ADDRESS_RANGE_MASK chunk, it's meaningless
  without 32-bit support (as Emil pointed out on IRC).
---
 drivers/cache/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 94abd8f632a7..db51386c663a 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -18,6 +18,7 @@ config STARFIVE_STARLINK_CACHE
 	bool "StarFive StarLink Cache controller"
 	depends on RISCV
 	depends on ARCH_STARFIVE
+	depends on 64BIT
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
