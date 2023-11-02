Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BA3C4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0/advgDImAUm1TIKn0MHtl3pXE08/RKQtDVAhlwAaQ=; b=BdK+s1apXLHsuT
	XtVOsY046nSRCo6lY12dwIMmtVABzhTA7QhNg/VEwJvFIrIN+I/eN1e0j9I/eFBoqYoF2zi/XHJdF
	9xfH025t0ieiHDMDMqurZzzkH1Zclq146q7CYUjb8GxaBfG4WNU3k98RqgXPwY1JU3i1yxIgnAm1W
	i1UEIfHvyajm+p19uLCALHlEYJYoa+QaZL65R8t+XzWfH+lzQD31l84m+HxShUVAPzEW0utejfJYo
	bh46YnMo0bkhQBT10WgG93JZ/zhRdIbT3UKTWstDKB4lK3HIMhqQFOV/ddmPBVis5DLw3edhGYQuF
	Dcp6sQkjcoSY6pzHIiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNll-008a3A-1a;
	Thu, 02 Nov 2023 02:49:17 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlh-008a0g-0H
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 02:49:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5a9d8f4388bso337689a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 19:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698893352; x=1699498152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l++Rbeq1YJ0LFMw4HKx/yirX8siQghzI93qQn3u3z5E=;
        b=FVtj5W+hDFnHVXt7+44MMx0lj/I1p6cMbdh6L/+Bo+emDysG3FLeKQ81Cs7eu2L90y
         de1N1ZbBoqCItW9GOKBso3fAncKxyrdKxeOppcVO1W1VJ9iapmsjr+m4ZIH1/06XREbI
         OLmVaYW0zonfkj9zvpqnQNsuewuFY7155ax3qMAjPqqGUl5M+e+MTXD9vvJA9mttXJO6
         13w2QoXRasGWOd7hZ6OOrZFlmAxd+O8lf/7OH3DC6i5Vj+zxu45mPE84TINLmooCoY9I
         lunr0gaFUT7e25mZnGX6uVSf8UUpUA5sBC8Auvaz6NF//m2DD0fEYu6jKz3kxEd6eyGa
         0i/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698893352; x=1699498152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l++Rbeq1YJ0LFMw4HKx/yirX8siQghzI93qQn3u3z5E=;
        b=mJNP2hnVXl8xxtswlq/TY4sz3E/FtZ28EZ95nKalV1/SrL2OUzwYavh9svBviCYocW
         1x/qN/jnbGm/eXSDwNYMg1Hs6sbfmBx1u0IOQwxcvnnPzMUkQvs9F5Ji47gH9/2l0Zm1
         sjFEFl7mSIkelGOHM36Qair6EgJi0WDHaIdC3q0vfxoDLVJWhuu0937M2pb8zdGAgv5K
         AqRoSg8g+eUuHnXy3oxCj4SpeCed3RQywczTE13H1e9hglR51VQ0Y9ACGis1frqtIU6f
         1K+59HLPa0CpNAo+kcWZbM+JMzY75lSfVDtF6aY3+NV8fT+S2EpIkUKWnsTSO2/7Oy8V
         1omw==
X-Gm-Message-State: AOJu0YybNKajffMGounUeHNoI5RL998qAXD0+rr0sXHtwfDU75G/YHOd
	mN95p9Ij+AMErMACQJFQhulqbg==
X-Google-Smtp-Source: AGHT+IF6H7iALM4kXriivWJWeUhTUNwySvr9ZxIwWfw3Qv3hEFAdQDBio6I+smOxkk0K56iCSkXjuw==
X-Received: by 2002:a17:902:e28a:b0:1c6:2ae1:dc28 with SMTP id o10-20020a170902e28a00b001c62ae1dc28mr11966568plc.36.1698893351862;
        Wed, 01 Nov 2023 19:49:11 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:7e4c:4d4e:6943:bc0f])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001b850c9d7b3sm1925787plf.249.2023.11.01.19.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 19:49:11 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 01 Nov 2023 19:48:53 -0700
Subject: [PATCH v4 2/7] mmc: sdhci: add __sdhci_execute_tuning() to header
MIME-Version: 1.0
Message-Id: <20231101-th1520-mmc-v4-2-86e0216b5994@baylibre.com>
References: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
In-Reply-To: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698893345; l=2057;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=O0pl7kPWnknxTc+1ciCix3vi2PmSyK8UTzQqhv8rZP0=;
 b=5GZXJKYUX2PFkk79fptSj56AIJweFxSSLNmoeJAhqhhT1nEb/6DFj2Ax/BGJa/TaoghgrIX10
 cU1vL2QBWy9BYkEYSEo48YklZTTrxD2hSaGn6Vgf6Is+H9lAI4Fza/e
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_194913_120854_5EC65E66 
X-CRM114-Status: GOOD (  11.57  )
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
