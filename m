Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB30C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F0B61B43
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24F0B61B43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zq+fBMM2N/5IPc4zhYF/wDg07wxJtJxqeU9nT/Sejek=; b=HvQux4eBtIoFph
	OttdYnRumfqU7VJ+gssQOzM9tHGTaezuzjSdIIS5O229N8c8XdqtJwjJA823p7/pDfh35UxrmEHd7
	Yx0tl1+v2VAcuZcEyQFlXpQKg2jHQwx4wfyb+QYHhqL/zY1R5GL6XhotdI0uXORGAyaRyiHbUcoJT
	9V9gXWCGfne6i0NYBqjbFSgSJt7XqRqdsFBb+fF5GmvLVXrx+2yfqQoHUxhPKCEeqXAh3lBx0SRCJ
	Ci9BL//hGGI2H+KZtu77d8tBp9/IF+E2QwbI23wa85zXBiaSb+V8CxndYBosHCKroN0804RTVINXp
	+8YsDRPLWyqBaVIuB3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70Q-00B5fj-3I; Fri, 19 Nov 2021 16:44:54 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70L-00B5dd-Nv
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:44:51 +0000
Received: by mail-pg1-x535.google.com with SMTP id g28so9132955pgg.3
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=SB6EgCTuUg8MJlUo+ml24NJI9nw+lDZjDHqU1EIISBQ=;
 b=xZBTX2fkClhsrAhAhHvzzo3gipmQJBe9KDtvFo2Al+JGruCpMlsfpmz+hHWMrOvMfv
 /CN0knlgAf9BQT/GfzTUnEpeNc+zQn6thds6pyjL/qxPhfTGCWm1TajlN3mY/hMKq3G1
 gbZy/bTOStCDE4xY7mN8NfhIwa49nLhVohe5Dtu56Y8EzjxkOus4igegCZM+ePXheS0U
 Y98Lac6ygTleo0oICOyMK/h8hDT5ayBcO5YwLn8al7NrFJQgymrth90UFq4ug6FB7HrZ
 Tk1G/fjf6w+EAGKJo1wChfVJcHIW/wTXacZUSPEScWlYuXufKzgXSx8NWcGvMGxfggsE
 uhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=SB6EgCTuUg8MJlUo+ml24NJI9nw+lDZjDHqU1EIISBQ=;
 b=5x27Bf1sjMmAlgVIU5x2KdMXnMXZf/8aFp0WnpaScfG+/6GUQX/3c1WQz3hlMfg0A1
 LWunW3tWlob0Q+ozbriJd8iTpyCovQwUoOsNh1+DKWxdren91Y/2I7hNAd+aO7LlwrKE
 dBFne7AFw7OqJVXeE+98ejyCKNO+bwYjdyU0OF4hqwhLGOU4hCDrsSy2M/nd/tRv6r66
 iHInesGsoo0JBZc8LeJdV2aRwyV2wTF/tdAUT1sDhdNl41sem6e020NNS//l6w42/UOt
 FCTy38tVuEorl8zw0XYCQanejBaCZ9ibBmvlt0C315RgcpWVOjGAZBJGKfHwrFo+D3V7
 883Q==
X-Gm-Message-State: AOAM530SMJQ616kLnLoNGEJfnCJxpc7va7Hb8FMv+Jr52Y4mkYg4LzfW
 fCKMkr63A47AfS2Odj6eTMQ4Aw==
X-Google-Smtp-Source: ABdhPJzh8J4KCx4EO8kuEnK1oVC5fTwdJ/I9PGqYQcKUN1CBeBpJvZzXndIvprNjCMgwhkZQgvDsMA==
X-Received: by 2002:aa7:9af6:0:b0:4a2:fa4a:714c with SMTP id
 y22-20020aa79af6000000b004a2fa4a714cmr23848682pfp.40.1637340285451; 
 Fri, 19 Nov 2021 08:44:45 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v10sm195914pfu.123.2021.11.19.08.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:44 -0800 (PST)
Subject: [PATCH 02/12] RISC-V: MAXPHYSMEM_2GB doesn't depend on CMODEL_MEDLOW
Date: Fri, 19 Nov 2021 08:44:03 -0800
Message-Id: <20211119164413.29052-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119164413.29052-1-palmer@rivosinc.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup.patel@wdc.com, heinrich.schuchardt@canonical.com,
 atish.patra@wdc.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084449_805378_717AE60D 
X-CRM114-Status: GOOD (  14.61  )
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

For non-relocatable kernels we need to be able to link the kernel at
approximately PAGE_OFFSET, thus requiring medany (as medlow requires the
code to be linked within 2GiB of 0).  The inverse doesn't apply, though:
since medany code can be linked anywhere it's fine to link it close to
0, so we can support the smaller memory config.

Fixes: de5f4b8f634b ("RISC-V: Define MAXPHYSMEM_1GB only for RV32")
Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

I found this when going through the savedefconfig diffs for the K210
defconfigs.  I'm not entirely sure they're doing the right thing here
(they should probably be setting CMODEL_LOW to take advantage of the
better code generation), but I don't have any way to test those
platforms so I don't want to change too much.
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 821252b65f89..61f64512dcde 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -280,7 +280,7 @@ choice
 		depends on 32BIT
 		bool "1GiB"
 	config MAXPHYSMEM_2GB
-		depends on 64BIT && CMODEL_MEDLOW
+		depends on 64BIT
 		bool "2GiB"
 	config MAXPHYSMEM_128GB
 		depends on 64BIT && CMODEL_MEDANY
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
