Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB79C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt7TDor2V8+i+0uLrI5Q0DY2HOyGX82IWXecX1Plj+s=; b=wtx4eVAXhKLCVN
	k/TkQbytphRMsHiAvgIxBDnU1/5yD8BSCK0VYjW2UfIs5uHK3rsX+vCxT5jSbWvDcJx/YQJO3YGUk
	MwnHsAIyISi3jNeF7NfxJQySSjfeMUTG3bBbTuxUyFMIRJWrObAp3PRFYgazxOdaIpciQDksIx+9p
	j63gAjJF6i9O4IGeyEcfvRzHa+ooKPvORYEiy8znKD/XWnSBeDL+X1fP7AZxZETPc2MkNM6TQJg9R
	W50LYCRd0Wiu9Ybkr/TOqjv+xjyxrCoAGjwgyLHacIs0K9y6XJpl+ynz9ugZaP8JCz8+mCpTFMvKm
	yLUsEv3gU5A+c8MxOHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOP-00DsZG-1f;
	Wed, 30 Aug 2023 16:50:09 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOJ-00DsWR-0Z
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:50:04 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-40037db2fe7so54970325e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414201; x=1694019001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=ZaK9oxYq8+w776AR44+FAKIVRbNelSvD5Wqf236F6LYXEE0IX4zmHro+Ud05icX0nk
         O45ir0qkxlYjPTW2w1EkegkTm0YYfbv1B2kvvglh0Y2pUiHeqz9A15lN212CfAcO2Ami
         V7IH5BCiTrhqQSonf6qbgA2/Fv2NXXrfJj3iUMsxFdBKqNDWmI6Brakhs0BsX5cJp06f
         o3Ia3nR42mxbBeFp7h+fzCz34aRh1LIyhvXhbGAd3MdCBtJI535glsL4WwHi9HVfxlEj
         q7EpmSm6+1OW0Lv2TnH1W5+brnq78BrSLpGW98Vk45okQqVL6GDTJ7DrZQ3UrwMk5WOl
         Y5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414201; x=1694019001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=in1nxYeUjJNR8fNgZxJXjo/j/u9x06CR9iWWH0Gb+RkYSQ9ltFepmCm8ahqtpfQatU
         OqhhM4kWA0FeLMAWI3AQG76Y99ckXQX2acYlt2uBeAfN17oHKJieBR2/Zb/Kf3tvvZIr
         zCDnxD+Om2OsHNeEs9KXabn0wqAeEPJuO2zre7DHFSwABXh3BmfO0X9GvPcfMWM7CITp
         /wxxlBDkHo5VhIDt2+tePL9WpjlwMRSr+MBgQmjW2Et/jGkwmnrpOQpRRoWdtD845Rvi
         Sg9nw0OvYi7/Sh27mcNppGIZrsvo+JPuqJjn0LHY00HfY0cKDQxBak2vlcxagYmvXk6K
         binQ==
X-Gm-Message-State: AOJu0YxipyTQQFguYt0EAKU0sk/86OXD1A5OzIaHUYrrh3QspBmSLKOd
	Wp36FPVb+9EPOPgUWc17MjV/ZUkYUrgp5/oLTfXNgpDp
X-Google-Smtp-Source: AGHT+IF7lhaR64SGHV2ErSNkQHepdAlpWwBvDnGaDCGM5z7wLW0Aeaxe4hl2FKvlkRWAn9fRZIKreQ==
X-Received: by 2002:a05:600c:228e:b0:3fe:ef11:d79f with SMTP id 14-20020a05600c228e00b003feef11d79fmr2506606wmf.36.1693414201729;
        Wed, 30 Aug 2023 09:50:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p21-20020a1c7415000000b003fed1ba0b8esm2808294wmc.8.2023.08.30.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:50:01 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 4/6] RISC-V: selftests: Statically link hwprobe test
Date: Wed, 30 Aug 2023 18:49:59 +0200
Message-ID: <20230830164954.91987-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830164954.91987-8-ajones@ventanamicro.com>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_095003_215535_E5E74D16 
X-CRM114-Status: UNSURE (   8.66  )
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
