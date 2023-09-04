Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FC8C83F33
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt7TDor2V8+i+0uLrI5Q0DY2HOyGX82IWXecX1Plj+s=; b=sqKppqeSJOTyvi
	eV1OEMFUDws/aVaOIoR6nL4lNpDGVdiQWtakAGCwGmVM8omAbRPBHtht9YpALZDgxnHvsyCTCZKA7
	euw/TfyIiniHwXKfoGgJfBta954SS8b8JKquBWueDHVo2ynsGB0zhKofW32y4zQHauVfPuzXGkcSl
	I9lc+3JWmTmZwiNuMjLbbgNxcCkD7uq+NSdH2P6yMYxZTCccI+eDxhF3h8RW5ArCNdUQYjYWpeAlR
	SVZ00R1bFuXMb3EL15NHULyNbZrrCdqOfAPcBOZE7fdCQ/yiYC7p2IGl2WHeWWNffZLGRWDT9I8tu
	ueVY2p8a842ZmlZDF7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCyA-004UVS-0n;
	Mon, 04 Sep 2023 17:02:34 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy7-004UU6-0Q
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:02:32 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-99bed101b70so255645266b.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693846947; x=1694451747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=l8yAhxSyqAIXfd6cjQqaTJXBjGoVW4hIVRpOo/dPE8cbyVx0tUdwRofpvBZEi4K8eb
         5ULZukSHKovyexaRz2usnEruz/K7K9ElPedf/oX7FcB6PiQm1GNPoHEZnIju7+I3S7mZ
         bayQoWpuLodrcw5WiHMjA44Pr3tdLp2MvhBjOJ3Ck8n3tP7otlEurwN1jFTxXwsF6pg5
         elw2fNYMfGaeHRjz5AwqInAuaLKUOQuNzNTfPUiuueelBaWGGNwWGmAbyC61Lgb/W8e+
         lvQl3si+rjxq4HYHnumY0uYn4CVo0sgRlDVxRvQ7AmcNm5Dr9NkdQpNeH3v9wSlXdAlk
         EUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846947; x=1694451747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=ZJAhjeSSN9HqgiPo0o+aQY4EGiVE/THF7M6uRn3R2gji9bIB68VcTBQ9uvV/LVHF5L
         28W8Y22ZwNg4U7pi3ttdJ5217uRS7DYOJAW+kEsseUCH8HzzX7Hl+Z5lLb11En0byv7l
         wUD6Fuhgd8SAjGhTFGm0+kszd9Ay+QJv5raLO07irHV45YIeivvozRaLQZoIvkLU4m6c
         ogrNa7EomX4KbE8a2O00lkmR7tbr8mlTWXiC9iC1eudi9KFAiS4PSXUpYPL5Ea+sIuJc
         hCIpXu6w7MCpgbKFsIuFC0959szw+A2iU24ms8x/LS8RnRBldDmvCnZyGNBESfS0SyuH
         BK5w==
X-Gm-Message-State: AOJu0Yxr4F5yMg1itjceJBZ5lJCgC24hIhXofIXl9O2pjg2T8kkJq46z
	u+OOtyxittQXXtzOYK9dgFk3sKldniXx658AMK3HQC5s
X-Google-Smtp-Source: AGHT+IF5s2k+HGjU4FsueRE5WzDEuB36glUeYvU4wYrSHodZFp24nTRx2arapxHYzdKf6X/PS9jw5A==
X-Received: by 2002:a17:907:a0c6:b0:992:b3a3:81f9 with SMTP id hw6-20020a170907a0c600b00992b3a381f9mr8580075ejc.71.1693846947559;
        Mon, 04 Sep 2023 10:02:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lj17-20020a170906f9d100b009829dc0f2a0sm6411313ejb.111.2023.09.04.10.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:02:27 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 4/6] RISC-V: selftests: Statically link hwprobe test
Date: Mon,  4 Sep 2023 19:02:25 +0200
Message-ID: <20230904170220.167816-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904170220.167816-8-ajones@ventanamicro.com>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_100231_168320_498D40D6 
X-CRM114-Status: UNSURE (   8.88  )
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
