Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A7CC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fDZQCNEQwHERkS9CCsTRr62wN48SJm30QA4DPUmKAU=; b=rUITRgUpwE/t9X
	rVBm0prjvsDUGbSvuVLdjhk6Sp32GBr+A1XTRln1SwhdhP7EpKz5BLaWFhHLrMyuuzk37AJAiuaUH
	37VmmRAL2LTtAyfvkiEaZkJyKzl6eo8xV33Cp42JYaADcAbg2fcnCRoD3ThdHEFSxUI4JrbWkwiOA
	0xur8P9SevIgOtlgxLWCawLtJLlZ5KCLQxQRDowOGZrRmP91lK0K4OtYmpyRGYKX3JrV+rzvSdgDL
	O5k640ZK3e/M5f2f3u5MjZgSQ1DZHRiihNUYAfsKrQp7N3yR2BjDjyMl8/8rtjzYCmVDkksw7P3eX
	IyDivPFgeGhBGTtw64gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30dr-00Go2d-24;
	Tue, 14 Nov 2023 21:08:15 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30dn-00Go0d-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:08:13 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-41e58a33ec9so36625761cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699996089; x=1700600889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uci5Rd8hU8lrREOeKMYxmj/9fXU4uXy75tEQ4ik3o2A=;
        b=fF4M8GeMa/48Ew8OOt2B4yJ6byUZOm46m6Qt0nSeTmU/wbpTYp86V3RoyV5O4l0PzP
         jrR+gH7DrjCjl54r6zTkippoKJ/83wdkBG2BsNTasAT5jq7N/jJiL0VfQjse8FyTv6kg
         QezirZ1vCjEl/+a+7tO43as9hZ8wfLRsZNdndj5KxphO8i7XgZicYXtwgUQrqVfalcvJ
         Wa7WuEV353jTa1CayM4hXd3DZjyi9WNT3rJgaSJVfExfYEF2aJ6+NUNqxlIoCTqUe2Ho
         gtpSkhcXNQqmO4pBW5ONvkFj5a3M8/g5wTgjiJsqBV69Hsn+z8fonuNL+yMJvYUtaxMZ
         Ea8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699996089; x=1700600889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uci5Rd8hU8lrREOeKMYxmj/9fXU4uXy75tEQ4ik3o2A=;
        b=sIC4mj6csfrB3mno8FLb/Agf4839CUpT2Ar8ZQSU2wkDzfM5ALH8JvcXxu0urm0rOM
         QWiaHyO2EEKBazhzW0e+S/GNB3RPkYo46uxvCHi0PhMUF2Uuq2BelAz6deTq7G20GsNe
         2aanxUFEcXmJGLsXNADu/CEPiOATwTEVIxIwGlDpvCprdkjxkwNFSMXeCAxtevV/9OQx
         zRzEw9tLBDr02VyCQF5S00XjcmdedktuROpowSEdgdB7I0xvf8Kovgeh2KBaN9w9/UyU
         Ex37CBYR4WHYxsKwdW5e/iMfXthtRFFJtuVfOkA7R0Bgt/QwkgM5uq82FvaLz47gY3kw
         oSZw==
X-Gm-Message-State: AOJu0YyChDDO1TWGFWZoW5QhrO+G/oVc9tMJhDxVhYpVWpEux4D8GpWU
	6wH/A1Mbh137CTdMsgfg+htU0g==
X-Google-Smtp-Source: AGHT+IELtqGcseH9KGtg5Xky3bC4PfTr1MH+ebRmkZREUQ7jadX9iY5D5h/57CmyMzuvsnZQd+4kcg==
X-Received: by 2002:a05:622a:1ba2:b0:418:1059:dfb9 with SMTP id bp34-20020a05622a1ba200b004181059dfb9mr3732919qtb.1.1699996089212;
        Tue, 14 Nov 2023 13:08:09 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id x16-20020ac85390000000b004198d026be6sm3027549qtp.35.2023.11.14.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:08:08 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 14 Nov 2023 16:07:56 -0500
Subject: [PATCH v6 2/7] mmc: sdhci: add __sdhci_execute_tuning() to header
MIME-Version: 1.0
Message-Id: <20231114-th1520-mmc-v6-2-3273c661a571@baylibre.com>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
In-Reply-To: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699996085; l=2108;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vV7D9g0JyI+aykknduEYFaEeV4K8xwyLfp1qBkgVUvA=;
 b=s3dUn2Hh07UVvYFGxNma4xcng0hYj7RWmtp2h1rfXLw99h7dYdaL/Q4EakZFW3TOJ0DyhdBUC
 ig7y03po7UOAsJW3fKAM449ixnj2l7tl2CDRB9Y2jlFoxPYweKmd06/
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_130811_799212_AB98E8C7 
X-CRM114-Status: GOOD (  11.37  )
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

Expose __sdhci_execute_tuning() so that it can be called from the
mmc host controller drivers.

In the sdhci-of-dwcmshc driver, sdhci_dwcmshc_th1520_ops sets
platform_execute_tuning to th1520_execute_tuning(). That function has
to manipulate phy registers before tuning can be performed. To avoid
copying the code verbatim from __sdhci_execute_tuning() into
th1520_execute_tuning(), make it possible for __sdhci_execute_tuning()
to be called from sdhci-of-dwcmshc.

Acked-by: Adrian Hunter <adrian.hunter@intel.com>
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
