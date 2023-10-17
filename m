Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31E8CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0/advgDImAUm1TIKn0MHtl3pXE08/RKQtDVAhlwAaQ=; b=ABY6jd0T1E2Qig
	KnzBwQ9WJH2V/hin2e9sVndDp1owWRkpfRugkKgtgrlsuQmTnU4v/C0yE41JA3r4Uyeg6PYbG96fH
	qL2ZRPupPMkOH67rGpQxW6nnZ7qGfrwU/uhy8fpyYAPITT7fq3YZjkoiPVuOX9oCL4/jo7x32HX+i
	kKmQ5HbIxBktlkRd/bOgQdOzzGJbHChxJ0OKcGpMaOmNpUCNcOIJpT9Pclr8M53vYe/uGrTuhhBVI
	9f9OLuXdNCOckvZhpW1GX3S+QMKhOAIlQXJBGwxp7viUdqhR1u41UcgM2TXGrxarRvU+/kMnFtZZV
	VnK5YBF9lcYu+7dqgCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwU-00DE1J-0g;
	Tue, 17 Oct 2023 20:45:30 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwO-00DDxf-0G
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 20:45:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5aa481d53e5so2917581a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 13:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697575522; x=1698180322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l++Rbeq1YJ0LFMw4HKx/yirX8siQghzI93qQn3u3z5E=;
        b=OCMHghWzWYNZXGDPHTEPeo1tHNKHDkS7w8Ujn5g6Gi8+TV4ZSeHE3E2yXxAc81c2gV
         Ofs03098AI7CN331aC7VaXnoDRo/cIfTps8oMeKm3uOY+sBqsNgY9xTBM/p5XRsFDdm7
         IHWzScYhctXH6CJsElsZeRBm1TET7lDnTAOgjaYYLrmQPMbQHBeIdpN4EjZuu6WybX6L
         CAvwuN/jVlLSyXIdbMr4cOypNwau/aE1H7rRXzqReNQIJ6pWw2G5u/e9Dz2MbhL6zgb2
         wkfjudNG7R4/PBTMY1GrsDcHjqdz2tJ90RfZAr2UBHjWHNZ+uIGRgV5OpgE16Dd3BjJU
         hShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575522; x=1698180322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l++Rbeq1YJ0LFMw4HKx/yirX8siQghzI93qQn3u3z5E=;
        b=uA4WZSFtD8cSyhrEGgJ3rNXoU/UaHfEnfvBTNEIfxKlbxhS8lPSVWQiHduop6UX3K6
         xFi3Bwf8hPoYy+YYsX5l7uJyjRxdy6/QMVGnccQ7v1qQE4vS9pXCuIVxBUH7Srx2Yih0
         CznhCCTVJSoMmtAqkHGuylGk4vy5QZrprIuA+ZrPcAm7r5I1QPvbMZytjfJhgZiN7hMO
         wgiF/XMzpM9W8Yz3u0OK8lCiuQ7JmxOwmyhdOzOd3Z7ND7wMp91azaptl8H9ap7euv9F
         uk2BaD7Iqy1Cnym0fEAmi7qCwbuAkWbfY4Kl7O14IHPW4A6pPLzei8vR0g5bWvDT7LRs
         27Vw==
X-Gm-Message-State: AOJu0YyRuQhlao59+BXJWO0ZnpNrlAkobhNTNJ5Z4MDEvJKbJSrJMSod
	/E7qFIZeBbedrlBDREDpoooW1Q==
X-Google-Smtp-Source: AGHT+IH2HIA6RrygyCLHn+pnH/xzYDgYUhE7gBrRmb+swqKkRH2PL2gIr28xi6sn4VY6/H8Hua8htQ==
X-Received: by 2002:a17:90b:1097:b0:27d:24d6:7343 with SMTP id gj23-20020a17090b109700b0027d24d67343mr3378879pjb.19.1697575522030;
        Tue, 17 Oct 2023 13:45:22 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:51d6:dcd6:63ef:52e9])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a6b8300b0027b168cb011sm1906553pjj.56.2023.10.17.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:45:21 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 17 Oct 2023 13:43:48 -0700
Subject: [PATCH v2 2/7] mmc: sdhci: add __sdhci_execute_tuning() to header
MIME-Version: 1.0
Message-Id: <20231017-th1520-mmc-v2-2-4678c8cc4048@baylibre.com>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697575515; l=2057;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=O0pl7kPWnknxTc+1ciCix3vi2PmSyK8UTzQqhv8rZP0=;
 b=c6MNN19+LVa+YXw8BVIwdqx0H9tnKqK0U5fbdhUSgz7AcvpDWhHyDwOlUig3M0ucf+4RwI6E4
 UqlGbcLac7HAbSsrCd3MB60tM6ZE9sf10n3goXEu6+eNFsYQiMZJghN
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_134524_119556_F2ED0FE8 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Expose __sdhci_execute_tuning() so that it can be called from the
mmc host controller drivers.

In the sdhci-of-dwcmshc driver, sdhci_dwcmshc_th1520_ops sets
platform_execute_tuning to th1520_execute_tuning(). That function has
to manipulate phy registers before tuning can be performed. To avoid
copying the code verbatim from __sdhci_execute_tuning() into
th1520_execute_tuning(), make it possible for __sdhci_execute_tuning()
to be called from sdhci-of-dwcmshc.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 drivers/mmc/host/sdhci.c | 3 ++-
 drivers/mmc/host/sdhci.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index ff41aa56564e..c79f73459915 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2841,7 +2841,7 @@ void sdhci_send_tuning(struct sdhci_host *host, u32 opcode)
 }
 EXPORT_SYMBOL_GPL(sdhci_send_tuning);
 
-static int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
+int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 {
 	int i;
 
@@ -2879,6 +2879,7 @@ static int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 	sdhci_reset_tuning(host);
 	return -EAGAIN;
 }
+EXPORT_SYMBOL_GPL(__sdhci_execute_tuning);
 
 int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index f219bdea8f28..a20864fc0641 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -793,6 +793,7 @@ void sdhci_set_bus_width(struct sdhci_host *host, int width);
 void sdhci_reset(struct sdhci_host *host, u8 mask);
 void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing);
 int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode);
+int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode);
 void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios);
 int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 				      struct mmc_ios *ios);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
