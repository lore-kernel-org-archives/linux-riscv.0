Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A19C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWZf3rpeR2Fb7a0kTpjnUeFZTqAzOXZbBEr74mCo1n0=; b=EZb7aEOf7P8ifj
	z5aLvHJet2ID8s5f0HpUsVogN2D+oCvpWUJj95beKRDIeObBl+wZR9jGWpcA98K8njD99i8meHt2Z
	QQjnAcCW0FqCecpXZ0sqajQzTJZRftWpi+Hx6fiS1pY+CTHtNFA+qv5TqtxEXvkQQgJPsK1IY8GBN
	bRZs3qu+RY5+Ms7A28SApz+q11k01fkDkDtEcwPGtgLZPy6rQrHeM9wYO66+9xpTmC0zRVrhICvKe
	usB1w2jjvASFQruYtYN61HUAMoo+g1d2mTlxrOkf9ojXMVUA3oFOhaMM+HC3VM3ug/QktMfnpzTXt
	/r7dItvdWHwFRPruxLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfZ-00BWJQ-0N; Wed, 25 May 2022 15:11:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfV-00BWHJ-9x
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:11:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id a17so2763978plb.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bRYOEpeP8mCOnNEZuD4+iCUOqYnaouRYbges9HW9UzU=;
        b=fB7U5PYG4dbc2mUatzOeTVyMCW80Xn1V5J4gnethuZNXdHnYuttFdcoU/AEphupbov
         zUGFLG9Mz+1uQtzY+8NGIAiNJ0D8OgrbJsMASU26h3tP45Rweo+eTPyfXXabYZpPqqt6
         e1r7cajKXogHIIKNu1pM5zWSAUQt9oc1lFNfIYYghr5SdCvUNmGfxu5vuigKuuccNGaA
         uD9Ln7t1Y5xARYxWZaXXDJFKLCdnHi102CkaLnBAM9jb2TFz81aI735OVi0D3oC0HDDQ
         TtM3LRl9f+CGL1+gZSBvJ/SGRyaxfMxbfwIxwG19xqVPJkEzhEaMXn6E0y9BmGQS2x65
         Iz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bRYOEpeP8mCOnNEZuD4+iCUOqYnaouRYbges9HW9UzU=;
        b=LRD9AxKJDPcjWHENAYxPtIzuBd3AJMqYUOL3SUA2MBPwO2mxF0MVxs92icLTzBCYiQ
         +IYQZbEEukWGJhFI41tPANE+4EmvFpV6PUmGFmBk7ADtLu3PJdl8DinVvuMGO6BCKWiR
         9Hu6Kzum+42Vvg5aSkyOM+nmTeGm9V66hR2ZUMpWS0YlaozmQ6h+ScdCPwm0fu8lRLCb
         QhAhenlQ/Zzig9A0RncOW1lDWF4iuuHmJTNM2RSl1e5zDoqNGTmQgjYZw6RP7VfwSxZd
         5z7zLT/+Rc+3LieTjM0zdVqj0zGswpzRRTVG7qHMANcZ2wS1whgBtTey1zlKOeFZRbex
         W/wA==
X-Gm-Message-State: AOAM533IBUS8LK14JIOy+QNPUNGllhHBmQDhHkDPzQjWJnoZW437Ytug
	WgahmUH0YBRYWkJui440zduRxg==
X-Google-Smtp-Source: ABdhPJyvLJhZ25tdT27CnU0AAM2lFzx+JKOH7YUo/53c5dnjCKRLax1PKiPS3cY+JYL3ORleGvObXw==
X-Received: by 2002:a17:902:d154:b0:163:5b66:564a with SMTP id t20-20020a170902d15400b001635b66564amr3395194plt.37.1653491483527;
        Wed, 25 May 2022 08:11:23 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902eb9000b00161b50c3db4sm9383129plg.94.2022.05.25.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:11:23 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 1/5] riscv: cpu_ops_sbi: Support for 64bit hartid
Date: Wed, 25 May 2022 20:41:02 +0530
Message-Id: <20220525151106.2176147-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_081125_396923_65D32B88 
X-CRM114-Status: GOOD (  12.36  )
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

The hartid can be a 64bit value on RV64 platforms. This patch modifies
the hartid variable type to unsigned long so that it can hold 64bit
value on RV64 platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 4f5a6f84e2a4..efa0f0816634 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -65,7 +65,7 @@ static int sbi_hsm_hart_get_status(unsigned long hartid)
 static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 {
 	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 	unsigned long hsm_data;
 	struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
 
@@ -107,7 +107,7 @@ static void sbi_cpu_stop(void)
 static int sbi_cpu_is_stopped(unsigned int cpuid)
 {
 	int rc;
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
 	rc = sbi_hsm_hart_get_status(hartid);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
