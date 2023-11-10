Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD80EC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fDZQCNEQwHERkS9CCsTRr62wN48SJm30QA4DPUmKAU=; b=GjV/B0lk2CRLn3
	aZ4wVNI7kqCIDZ18hqNoUYKelXS0MFGotUQ5Kd+xp58yETPZaKwE9aiMjdnfcgb80TcAvVOYlCR7W
	KUPUMdPY2LoA52OE8BoYhDj9mgc7QYEWMjWI6nic4Vj8hM2RBCE9qG1yOT/uDmT3WYgVwnv1fD0YI
	7K3dnm423rKnpuwoz4xchA3CJvGTfpHZJleCSrBVZc/J+bUAlXxA+Tqenu4ahpC4ObUEHP5+wzaDp
	k3Bt0nusLSPxeGWVJ+3rOTHNPQEVEhV7bqzbq0pdYdvxAA8vQ6BUhcXlrFrClTa2EBI1Lz53YCeid
	gUD9ay5NQy634CJB/W0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHq-007u5w-1a;
	Fri, 10 Nov 2023 05:42:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHm-007u4W-1P
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:42:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc3216b2a1so14377895ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 21:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699594949; x=1700199749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uci5Rd8hU8lrREOeKMYxmj/9fXU4uXy75tEQ4ik3o2A=;
        b=eoqhm015CBMt/RW6jvEAHyMenTIUNmxUGgCFqSlewK7OUlpecj+ca3a6gVVz/GDguY
         Aj2x2AUUlSSIE4ZABxKoSIZiQ9v5suI1Zytirp8L5szXEJrdQD+S+JoYtD6Qz3H4geLh
         hcLS+9UHUUCHbX5/sYI7vD8qiPctDtZfurUtA/vfYxWxC5M+9/9yd/LJpKb9EynL8Den
         sm4R7aEQUWjKRUhGWZWqFCCd6aBqAoI3VGRW0rJPJiswL0nFxIy00WBAgLbVTqIBwZxi
         p8U/V26e5sPGKDTiEuLDJOg/L7KwR+2f9Yfs4zGYLOehSiz1VBf3lrGNwzLc8XPNliNi
         +7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699594949; x=1700199749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uci5Rd8hU8lrREOeKMYxmj/9fXU4uXy75tEQ4ik3o2A=;
        b=TZ8AMpYafS6FG7oe4+7HgV6zOy4+HZO1AKU1pqMHHRwulLa4uW2t9iH5UMS6hyVtJN
         HW+31rW09clFUNyIcGqZJux/VY/0ivOx+Sv2dPxt7PNsQX+lvibQO6gvWprSUuomxxVu
         C93lDaXJCf5S6qcdABgDkBipyWZ95MSQgZ/vMWWwP4ui8s7sT4fDbOLW6hmiCyCXmcMK
         kG1914voW+lEf4Gu4t35d+rB/o42fjtwl+y0mH+OzrHrMqJUiIXHaXS0FFMCvKYGDOrG
         EOzh39itDpgb18qKGXQXN6QW6YeDIdHinRrPXPzbb2bDo2LO0xPvZ3PFIMuiSzDiZpuF
         xfRA==
X-Gm-Message-State: AOJu0YzFkLa64bCEyc3RMn9P6JtebhvWWSFNjD7gHUvxc9KTE1XpH0ya
	NUdMLsC2+RZYEukZA1bdXGDBNw==
X-Google-Smtp-Source: AGHT+IEm6KXk26L3ye2gZwOvNYVy1AjnP5ci3hCfE3ga9E1mFtlkQmutISdGpl9sbvobplDpccZsqw==
X-Received: by 2002:a17:902:d506:b0:1cc:3825:7ba2 with SMTP id b6-20020a170902d50600b001cc38257ba2mr8168039plg.4.1699594949041;
        Thu, 09 Nov 2023 21:42:29 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2071:4479:98b8:cc69])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b8a00d4f7asm4498845plb.9.2023.11.09.21.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 21:42:28 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 09 Nov 2023 21:41:12 -0800
Subject: [PATCH v5 2/7] mmc: sdhci: add __sdhci_execute_tuning() to header
MIME-Version: 1.0
Message-Id: <20231109-th1520-mmc-v5-2-018bd039cf17@baylibre.com>
References: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
In-Reply-To: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699594943; l=2108;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vV7D9g0JyI+aykknduEYFaEeV4K8xwyLfp1qBkgVUvA=;
 b=wiXFL4D9Q3411BhcGKUB1ePUooVyFCo6lIXJGCjVRVhgVo/MthWkxzFvbNGGV91mDj8tIZhb9
 3ad00+5H/oQC96F88xLLDDeHjyQTU7R4MEvXiEmQLL2+zlo1saaRuND
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214230_473789_A9E5A908 
X-CRM114-Status: GOOD (  11.48  )
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
