Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A9FC43444
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76E120645
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ID9ztL+K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HoNDns9D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76E120645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RiLS1nDby1v29V0u1ktFYbOGXGjDYZd5z8yYtACVj0=; b=ID9ztL+Ke39soC
	eR5UcT7QbYmnJB5JKEwmOQABEuiVpwTdozJ8OdMwGo+Vc6/vbzSnAs4ODgCEo7NS4ixAj2rkYTY42
	vNhEpTe/16bP3lDQc6Fw2DvaFEIogu0SsnAJ6jqJSWO0EIC7vWJEKC/Oyh09lcjqtYjF+oYmuPDU+
	B5zi+Zl2usrKdwzqF/+JkgP9t0TZ+2J2jHp4X6qQW8pfu7XL4Feb5vaa/oH+iQPXH2FtCSwCP0kjL
	A+q7TV575ohnzyJWTAxA7rD03cXVKwYhUvNXIrHoimqFshnrXDMQeffkotPWZ7hPhaFJAUQSXna+v
	1lNtl/IC14ZcQcNzeavw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2PS-0004cd-4O; Sat, 15 Dec 2018 05:22:42 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PP-0004Xx-1H
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:40 +0000
Received: by mail-pf1-x442.google.com with SMTP id q1so3803097pfi.5
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1NoMrt07YnmAoRot0iG3Ze4/SAslanmuFjK56MTzqwk=;
 b=HoNDns9DTxGEqYkcTxzTtIyMuBzggaZGSJSR5BkGXe7L8u5mckollV3qSgK8mAD44b
 4iDmcgS3i1ebZ9L3IS1IBG04Y6Q2HCO4taMkOHu7KdPoZPYZacy9qpDpQ+A7FKNlK/Xn
 NXc1xgKTjkGxGD3q4vRHuIHkVfqBN1DuSlJFAcehOzCk4syCh0sEwRQWebqS+Sby1gpl
 CkoN5g/4mPuxtfZyW17EGax2auDo/fBjvW9fAnZRMqKw9K2XwoE5bJ1h01D3GAnQ6SPd
 og9zZ52Yp+JOx0t5umozxSfrFEZJikwPYgNhu2Z/8eLf6CjAEA2wST13y91WUKIqScFV
 t1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1NoMrt07YnmAoRot0iG3Ze4/SAslanmuFjK56MTzqwk=;
 b=bJLZnhWFWbLrRb1WKk3Vo/0SqqfsXvUwzXiaG8u2yC4Oebas/Xd5AaL/47rk18cz9A
 laRCWQ7gZ0kHCscneBrlvMDGghdmaUo5MINs/FN7Hz7kFCGnSRQSatCPXyXGHb/NReUr
 tbMYqjFeitujzIe7WQ1DAWhYwUZyz7YyTYYpchLUXUFIjqqdNvXmmFUOs8/zBgRMAoxn
 9G1rFQPzKawGsyzOQXU4sTY9htc0tIFhmvGy/M0yBrEie+5EPbxReJq9yKFvYNKBOfiw
 c2Iw4fOWvySpZscyC9OF5VDRzO0LDK1GUCUmIA/AlZM3bY/kIrCumvKD9k3Lot/OFH0B
 cslQ==
X-Gm-Message-State: AA+aEWYiPw4g8ca/ECsjWISjGTnmiy67VyPZV/5twhbplKWa7Ek/HoLk
 JnGXjK3G6bBoQsG75ysjzUTDXg==
X-Google-Smtp-Source: AFSGD/VQKLlEzrJZBZyQhnX6BTba9Y8g+LpF2AaT2R3uiD52OqwGnZ2pu2pTv1GKoGNNiZmcbN17Zg==
X-Received: by 2002:a63:f811:: with SMTP id n17mr5244556pgh.23.1544851348131; 
 Fri, 14 Dec 2018 21:22:28 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:27 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/7] arch: riscv: add support for building DTB files from DT
 source data
Date: Fri, 14 Dec 2018 21:21:48 -0800
Message-Id: <20181215052154.24347-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212239_444936_4CFF2810 
X-CRM114-Status: GOOD (  14.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Similar to what's implemented for ARM64, add support for building
DTB files from DT source data for RISC-V boards.

This patch starts with the infrastructure needed for SiFive boards.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 arch/riscv/Kconfig           | 2 ++
 arch/riscv/Kconfig.platforms | 8 ++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 arch/riscv/Kconfig.platforms

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..dc9f1afa4ad9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -121,6 +121,8 @@ config ARCH_RV64I
 
 endchoice
 
+source "arch/riscv/Kconfig.platforms"
+
 # We must be able to map all physical memory into the kernel, but the compiler
 # is still a bit more efficient when generating code if it's setup in a manner
 # such that it can only map 2GiB of memory.
diff --git a/arch/riscv/Kconfig.platforms b/arch/riscv/Kconfig.platforms
new file mode 100644
index 000000000000..bd3d2642bcff
--- /dev/null
+++ b/arch/riscv/Kconfig.platforms
@@ -0,0 +1,8 @@
+menu "Platform selection"
+
+config ARCH_SIFIVE
+        bool "SiFive platforms"
+        help
+          This enables direct support for SiFive SoC platform hardware.
+
+endmenu
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
