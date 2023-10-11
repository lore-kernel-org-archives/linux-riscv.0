Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A584ECD6E75
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt7TDor2V8+i+0uLrI5Q0DY2HOyGX82IWXecX1Plj+s=; b=xq/tGZPUIVG0qM
	QpMHqtGkur56fxeR3Se3a+FlPmlBl4c61CXB/R7yJXB1z4wSCgtGGd/UnPrwuK3fp/7DR07ynFdc1
	a4xBkcjNlB0/m1XzxXvAeDrqJhHaLz7J+NZFOOwdPpUGENLb1DzqIoclUv2kTOJNBYr4Kq9NR5cYU
	hyKfj3psnXgfDMS5IWAZ8zFnFuaOOY9G9ye1MpmyVV90Z7K/0uUhMprk3WEwTkgF40+plMJFX0FFj
	o7BIWQ9yHE2D79K8a98gQAf75oLMTduotd4QQV2zEmiSe3kO1J0hvoBxAZ7ad8mZ1pxx8jnR/zCeT
	jqXV5cPv0mxz7bG9NHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhI-00G212-1s;
	Wed, 11 Oct 2023 13:56:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhF-00G1x8-0n
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:56:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-405497850dbso63606965e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697032576; x=1697637376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=OVYZodzgj1c6FeX+exYyG9FNUlqwofFCJkTNgjXhdAzI9pRzY7QFSmY4bH9sVheuVL
         iu27zAvFzHP/kUuzHZpkhxgRmJ8Y8sm9AAqZuwINtYYfv771oZaw9UugJIqNdFvGHv94
         W6rjZZo/XENaYrW3iK1Pvs7ntCx/wKnpWd+3fIOAdHj1Ev0/ze8visijE/9kxpQfxcDo
         wertQ0GGkuK0pH9F7HB/JXTWuEWtMvZxzoccogOOepUtZlWYWR5i2RThR6WZ8X/mLNWj
         9hOkp6dJ58wrI1Z7pllkIf8KxCpvCCI4EqFhhpcimYKMn7NJupHGVyhfqPbP/+rsSxx5
         BwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032576; x=1697637376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=bplgOBcV2oZU5uKTFIA87blmCznT3f64KYfemG4i8t9yJl2nuNpbmMfq2TM3EBxsa4
         u9o5kJ/SIiZHW4l/uxbLavDoeYL0yybM4BDfzvyEUGvHzK526MW6uycq8ksvXDafq2Pq
         k6Fp9yLJsdoicEUxOLJaUtVVHOR9mVd+iZA2CokvRoYzF3hN0nhuYLdjvzKltz5SJ4ly
         i7+g/neBa3pEtmuT/1Kmz6ryCcbNHKoRVDuD4BZrEiO3x+A9DNPS6UD8ZFbiYAqK6uFU
         P46KznMStd74YiGwRsoG3lEQ/BKHKwOHcnZvMR/eY28wZkksGiUk1wUJyftd9miOw7qs
         YSnQ==
X-Gm-Message-State: AOJu0Ywez4RvvdcmiBDGIw1cqCju2gfT8Bzu5jBWjEfofGx/oHdgpE/j
	rnNbwsmwsaEZ8Zy99SD/LldNytuFnFgQOBi+w7I=
X-Google-Smtp-Source: AGHT+IESaRiR0m7jw5i9Kz3TxMSSy7siluwMTNfH4C3i/Fw9Y27j1J/QlowKEDjcEKVMHKCybOGwbQ==
X-Received: by 2002:a7b:c451:0:b0:401:aa8f:7562 with SMTP id l17-20020a7bc451000000b00401aa8f7562mr19541108wmi.11.1697032576742;
        Wed, 11 Oct 2023 06:56:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b004060f0a0fdbsm19326687wmi.41.2023.10.11.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:56:16 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v1 4/6] RISC-V: selftests: Statically link hwprobe test
Date: Wed, 11 Oct 2023 15:56:15 +0200
Message-ID: <20231011135610.122850-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011135610.122850-8-ajones@ventanamicro.com>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_065621_310217_213ECE95 
X-CRM114-Status: UNSURE (   8.04  )
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

Statically linking makes it more convenient to copy the test to a
minimal busybox environment.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 tools/testing/selftests/riscv/hwprobe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index ebdbb3c22e54..5f614c3ba598 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -7,4 +7,4 @@ TEST_GEN_PROGS := hwprobe
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
-	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
