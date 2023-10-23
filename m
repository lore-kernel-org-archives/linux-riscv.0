Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6995EC25B48
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0/advgDImAUm1TIKn0MHtl3pXE08/RKQtDVAhlwAaQ=; b=Dq8+rv4dxnHPiU
	5lsFhGlKG+1FOZBpJ+Lw7d8oikcBWlNIE0h4Q78bIWqPlBZLBBrzxQ6Q9tuttMjcTx7VeqF7WhB8v
	na3kDemOETzR31WCM0jSNm1a95uc+UpTGKd9sYvLnu7Od7guBlNUCd7NTO5Rr+BjLG5x/5R4qAort
	sS9ldrMPdARXnOloXcbCdhMOZU6p79UrCFmxQFOok7w421//G2N1i4VUm4AOEkZEH+sxKItN5ZpYR
	yaW+LBA8WZRgWJbHpis5neOhCvenXfT/c0uGOxzbfK/dFbmJNdoR10H9/HEf7RvwcwnvtOzH+lI8g
	F8O7QU6qfl6uWibP88Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28p-008HUQ-27;
	Mon, 23 Oct 2023 21:07:15 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28n-008HRe-0c
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:07:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso3071470b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095230; x=1698700030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l++Rbeq1YJ0LFMw4HKx/yirX8siQghzI93qQn3u3z5E=;
        b=WYfd/bgbt3pfE0by3FC5uTXijuyGK1cXM25MFmOMgld1k6SMhiqTTsCdHsDyWmcevr
         b9z22s+YcHoqhP4thRefyTigk5yBV9ZoC17qFx5CgapReltnRqTehpeY3cDjKM7PApbg
         7ORixRDm4LV+zmkW71WdLlNCR+hJQz+bOuN7QR79AyN7YC8sHVlVgJtnJCvM9BaeVoGr
         oT4U2rJS9Dk2g/TK41+A4PlCbhdnjA6DumGlYcuY+wvhS8egfbc8hKf9T8dPvbhuroxp
         ddRkcCa4MgnfcoTc86/zvVNPLKt6NBg9Couw0g9CsC6cM4K//oSh169HNATcg15Sfuvv
         TcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095230; x=1698700030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l++Rbeq1YJ0LFMw4HKx/yirX8siQghzI93qQn3u3z5E=;
        b=V71ENqBF2BORexRYsEQLuGK4/ckccBF5YrPXpZHbDMtqFgLyygcc/UhG6/0JldfYqY
         rE6MfE9nJ46s263iivM3at1zWvNyMfsQK8EwzoNWdCBH8KKxGuJ4Sw5nxlfqX0btYDhQ
         1aulUqilvr9LjdpnV1/nhApeI6MWWOOrVISeYCU9/JxfsULBvHrsv7joBwxH5w9QlsAv
         5dQZLS0lSpmd1KMXNTvg4GM7j3vZGSU3Aj84Sqqk7u9q64XawtuW3NpV64WglYyEIVYQ
         180MWE0FJ+cb2Ar7FjjlPc7lDkAEza+gz4fKnzmq0pU5mgUYBPHqFpaoDetZccQK43Ye
         rJtw==
X-Gm-Message-State: AOJu0YzjQvZKAiYHWuADEZ1GjimiUTkzPgU+8XVlzxQ2EU3kItDKXiNe
	Mk6ToTYeWwGo3IX1sd6dHqxUUg==
X-Google-Smtp-Source: AGHT+IGAhx10DMyaJYgFkIRGTBp7l5c3emEnut4iVOb1UIkrslhLtaOGQkiMZF/TZbUBX06uTTid2A==
X-Received: by 2002:a05:6a00:134b:b0:690:422f:4f17 with SMTP id k11-20020a056a00134b00b00690422f4f17mr9329657pfu.4.1698095230237;
        Mon, 23 Oct 2023 14:07:10 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b006bde2480806sm6573066pfp.47.2023.10.23.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:07:10 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 23 Oct 2023 14:07:03 -0700
Subject: [PATCH v3 2/7] mmc: sdhci: add __sdhci_execute_tuning() to header
MIME-Version: 1.0
Message-Id: <20231023-th1520-mmc-v3-2-abc5e7491166@baylibre.com>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
In-Reply-To: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698095224; l=2057;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=O0pl7kPWnknxTc+1ciCix3vi2PmSyK8UTzQqhv8rZP0=;
 b=2M/0RlZn/69xiXATrzBfiSFScyxwOg2KlSuXzWRniQ5zD9O5bgp0P38TJusbwZ8FFlU4Swp9/
 0oC2SozqlS+D21SOjAte8vQCnRMpvZqWnzDIIfnnaSe57pXae58DgD5
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_140713_233522_0DFEEC3D 
X-CRM114-Status: GOOD (  11.41  )
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
