Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6052ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JdJOBV9+SWX8x//4xDKFdKwC1mqDmk6OjLklSCf7mM=; b=SMekF4SGu929re
	+lADOslD/3MiwAWMsfMgxcFJ9L5V6g1lNRQSHzLxV7h2Ncax0JHNP3+5I178YkEmIALomOY/sNiXb
	fFiuXPjGuEQhP62qag39gmsjOIsBEzC82kJB2ZGhFFBGryEsba0NkZn8LU062cXp538u0pLob/0VP
	JG/BNFeoThsBikXIHKlZnCRWDpYG+4Wh8XySFxHc/d2doR1e+O6yLeSyPLuZ6QojqlBBhSXpbqgBA
	+dVvMuGNLXjgpaoaDVEL4uQ6sAVr/jcMmOhqlIL6tbSFfSs0P5Gehc+GHacqqxWi/zZ30uhg1Ksdx
	QzX5cKcXxGpOjAvhoD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cn-00ELxz-Id; Thu, 27 Oct 2022 17:25:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cd-00ELtk-Ui
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 17:24:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id y16so3371626wrt.12
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7NeWxY39D6gpui4HT/lAqbnVKpn+miTp6nPfE0ZYWY=;
        b=CTp2p2WgBaoVsEFJnIA9rxUN4F1JTFCtU1OjLCRmRucASpk7blPjcN9fHbX+QJAjv4
         adjAB6PjMikIMkk7aY+wXkZ784XGIRIvPIBxqzAdZ4P7QWWmJRcJNd9dido2dKmIFOkh
         6gqwTesNpSr4ve0IGtiunXA17YipGEz8X8ueZz0wLLfpevIKESe4D2DrKtKBuNZKTv1J
         W+G9ey5GsN/17XFZbKudxX6fwipwWKOap0eNvXOrPI9mXAHjRsPRP76L614e77S/hf1N
         nobTqw4ImAHmvtuCaueGbdlgMozI9l/mkXTe2KlKrx23EWmVUCAdE6MSge9UN4CWzx18
         UYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7NeWxY39D6gpui4HT/lAqbnVKpn+miTp6nPfE0ZYWY=;
        b=5cBfnI5UqpTTKNcabvyWT3fPmy1gKTxGjo1sXWNQ5JdV3wcDOIv5r+O4skboTJzzfA
         K1IlnubA1tstj+hYI5bjTksG+hfbETu6zIJar4/VzjXSem5Q9kWidv7eLF9ufvXs9zR/
         Cb/YFZVR6HNkQ+J36xCT2PDuToEE2+QqMcXv6qeF/th+SwLMNjWbMAZ5qzrHIot27T/Q
         YQJHbioLICdWhztyLJbYu25j4GodEFH/IbWdadgBzvjfsSX4sp6zP/yN8aT8SwyWcpvo
         n6Q8WoG0fJj84Ua4We45RKQWrvL13WwiBk75Lji45GvkQKExA36Ie+N00/EceaMlCHou
         yO3A==
X-Gm-Message-State: ACrzQf15PnVGL8B4gGhTlhZrtm0TrN1YVebtGeLrZ7pBtVVdLCCoeJWf
	HhFiqZ5ReuwH5/tRl+b+PRWJA/o9v7ZlCw==
X-Google-Smtp-Source: AMsMyM5IwrK+lEtUHlyILH/jE7cDKzLia9558OB8HY9wNMLUg6bztGQmCzp7Mh1BTblA48m3NgUPTw==
X-Received: by 2002:a5d:42c6:0:b0:235:1b3a:8d2e with SMTP id t6-20020a5d42c6000000b002351b3a8d2emr26828583wrr.689.1666891488275;
        Thu, 27 Oct 2022 10:24:48 -0700 (PDT)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c4f9300b003b4c979e6bcsm5766751wmq.10.2022.10.27.10.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 10:24:47 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH 4/4] RISC-V: enable dynamic ftrace for RV32I
Date: Thu, 27 Oct 2022 18:24:35 +0100
Message-Id: <20221027172435.2687118-5-jamie@jamieiles.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027172435.2687118-1-jamie@jamieiles.com>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_102452_158933_FAC6A9E1 
X-CRM114-Status: UNSURE (   9.93  )
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

The RISC-V mcount function is now capable of supporting RV32I so make it
available in the kernel config.

Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/riscv/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..5ae4f7ce2a05 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -129,6 +129,11 @@ config RISCV
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
+	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
+	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
+	select HAVE_FUNCTION_GRAPH_TRACER
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
@@ -274,11 +279,6 @@ config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
-	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
-	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
-	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
-	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select SWIOTLB if MMU
 
 endchoice
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
