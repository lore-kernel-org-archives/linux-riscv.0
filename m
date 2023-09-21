Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29D0E71060
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kj+dVYScMrXDYvFgEqosJj2Ggyveq97ztuhD7b7D7M=; b=TuYZeevowL4znZ
	LCRZ0KSvycuvlE5r6nGTKxHtvBM/1kxRFMZQEsBZV8vjdDn8AqODHNwsKtv7NuSKCi8ISFIE0o3xO
	44rlSuSDxY482MTFECyLgcipoqeXjBEc5uiXcHz22C1PWQcoUWNY9vCkr+7yI4Flk5Qkm/7TTqSWz
	sMfgObKINsKHEuvFhSR4I8tKjhuwO4WnzwmEdnb67kbKZL+8IXqDbVWqQxOg2Cw5LywVybXrCalk7
	xzxN1XSp5rZhDBNvqX3oARqXw+LROLZf79aPF7qEQ1ssB6LCjqv6pqU0qAGypa7n6jVsSi7zvgCfY
	TqDXGa5nmqKvYHAIXVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDR-0064BJ-2h;
	Thu, 21 Sep 2023 12:55:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDP-0064AM-2A
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Sep 2023 12:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HBWEukU8pysMts0lHT6+zquJmQD4rCk4fxNwaw/9TfQ=; b=UBZROFtMu9gQgYsAuTY4ojV+4B
	GZrVug6M96rCVMGtyQt1L7lO15qrMigxFS/JWXqoKz3IW7AWixxQB7nF2beKOcmVeKzH0/aIZ6WTy
	pxb0klIjZDZlLyDCAhb6DJF2M4mtt95+29Dp0G1fMqTxJRTbKOf6fZ6+DGi9YC1Go2iCeG9SosavP
	2ApS0qt6Zt0BhXEYukxvV+zOyIDJrV5cSEtFMSxPfvtjILNwJDlww6UjhKpzFNJFgt1t8U8r13MIN
	UODvsgqE3HNrsv+5r9iwUUv8pVV6AITuywtPnc608WZTII6uO+qZFdblCY489hRPEbyCCJxW7M2uK
	EFk0hE1g==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDK-00FNnj-0E
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 12:55:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32179d3c167so784324f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695300923; x=1695905723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBWEukU8pysMts0lHT6+zquJmQD4rCk4fxNwaw/9TfQ=;
        b=L0ZSoLd8HXG+DzYYN+y2rZZdGpCPE8RbUMsldZnBV6ukitWImF9pf87XsxxKHiPQIw
         GRE/lytFx1u5g10nsf4g6PwyUN4RVfx1bNoUMm9EzFKu6TbzUiIUxeFl5HeZ0o5Y4uHt
         lDZP1OznFvNsyxU2wBNv/5f/NE7lJE1H/AIQSn8mlDgkwNB9WDarEW89eJdR5SXUmXTd
         ZYAKwCk1ZaTTtkwIlKqTUFolYg1Ggm+hKBIojXqmHTMC7M3x24wV2YiAtiuisqBgUyUs
         X9D14ORU/Dy9ADX7qMg1HdvJaP1W2QNC/Us8nLssgBWtuWUCZpPJfGsZd1x7KcXNE3yI
         tsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300923; x=1695905723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBWEukU8pysMts0lHT6+zquJmQD4rCk4fxNwaw/9TfQ=;
        b=ZbJlWL1/h11R1j3mFzcqXV2/n+1jIi+9f7XL55EcV5xlCW1Q22mOPwtVd3Iv+Fc7i+
         PBAix3uxlavKijqjHbWxUj/hSlwKec7sEG5Wbow5bJK6vaoMoCh1XSfmKoZK9rhKIN+R
         Mm6CJ6EBUJj1m2dLHBdJ40WsuRdLlEU0jbQs9pKuXYf1sFwNoGn1tq1Zl/i/Me40EWuA
         wPswEOilJDFiwg6JO2yAQ887+GFI2z2v/2paKRnduelxllmqkGd5cUO/4PyoJUD+/VV+
         5dcSOgDZ0bFAXx0K2U87A0hI1+djkHKoebv/1+Pfz71Tjw3yNFDZ/4rYfWSzPmK6rdX4
         oBLA==
X-Gm-Message-State: AOJu0Yw8oaJUNhSz044cnYIpTFzFAKZVhUuHtEmX51ToF/3yG5OhdHy+
	VsFCuyBXQ3k/EzaVAb+04MmSohJBotUfNen0XN0=
X-Google-Smtp-Source: AGHT+IEndVY7kUQ+ExGVNKOe/Em72/GAFSRt60ezxC+aMpr/G9eKrxdgwhWg84zb4uwp/qGK4CWhPg==
X-Received: by 2002:a05:6000:14b:b0:315:a043:5e0a with SMTP id r11-20020a056000014b00b00315a0435e0amr3986663wrx.56.1695300922615;
        Thu, 21 Sep 2023 05:55:22 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d608c000000b0031c6e1ea4c7sm1682378wrt.90.2023.09.21.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:55:22 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [RFC PATCH 2/5] RISC-V: selftests: Replace cpu_count with cpusetsize
Date: Thu, 21 Sep 2023 14:55:21 +0200
Message-ID: <20230921125518.175428-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921125518.175428-7-ajones@ventanamicro.com>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_135527_654206_2EE2D0DC 
X-CRM114-Status: UNSURE (   9.66  )
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

Use 'cpusetsize' instead of 'cpu_count' for the size of the cpu
set parameter of the hwprobe syscall.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/riscv/hwprobe/hwprobe.c     | 2 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.h     | 2 +-
 tools/testing/selftests/riscv/vector/vstate_prctl.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index c474891df307..d53e0889b59e 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -47,7 +47,7 @@ int main(int argc, char **argv)
 	ksft_test_result(out != 0, "Bad CPU set\n");
 
 	out = riscv_hwprobe(pairs, 8, 1, 0, 0);
-	ksft_test_result(out != 0, "NULL CPU set with non-zero count\n");
+	ksft_test_result(out != 0, "NULL CPU set with non-zero size\n");
 
 	pairs[0].key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR;
 	out = riscv_hwprobe(pairs, 1, 1, &cpus, 0);
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.h b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
index 721b0ce73a56..e3fccb390c4d 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.h
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
@@ -10,6 +10,6 @@
  * contain the call.
  */
 long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
+		   size_t cpusetsize, unsigned long *cpus, unsigned int flags);
 
 #endif
diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
index b348b475be57..540fe588e78f 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -13,7 +13,7 @@
  * contain the call.
  */
 long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
+		   size_t cpusetsize, unsigned long *cpus, unsigned int flags);
 
 #define NEXT_PROGRAM "./vstate_exec_nolibc"
 static int launch_test(int test_inherit)
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
