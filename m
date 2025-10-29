Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC1BCCF9F1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjym6VVZXee39xV2AXmzOzcKr3lHGdnuhZKDnVVP/Ys=; b=A1Nt7LYQOqFru2
	dCeftKrfovTgORWMCMCsH7AjHs95GfQZU+nn2jxlATLydeIt1i5l4BwCcKuQN8g+5gQS9FC61O9MR
	6fJmaa4mK8tCPADHfeCnneEp6e0IK2FffpyVHmD4YlXaGB/wXAXAQZB2J19FrinbwqMHpopOE0TnD
	GeONdSxLLoCynr3V9x4UgkMCT0qgtx56WIB/K522fObnjYMz8KKhX/HNje8o8QUBA+bn7M/7W5bJP
	L0FGLpaQSSpg4negA5C1Ju/00egQMJg7dkuF++i/lJ3k3iKbDfDOoNBBvBXNEESRmRHlFbRsxZ+oc
	DedBbI8YFSWwQtsXdFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97l-000000021mm-3I81;
	Wed, 29 Oct 2025 16:34:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97Y-000000021WF-0VtW
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 16:34:01 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so13906776a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755638; x=1762360438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=S7CERXMdcsEqJPa4CvbWVp4nRU2TMR8d29XvrDPGFSk6oDNX2Dh0La5pefAuEJuiRk
         Mv12cScIxl8uu+iPkC1DqCYr24wD0CRaOSRBgIsmzvNddaCxbeapTaXqmrv/XCxx/QAn
         8VmMkPKllYCtUeH7AzsmRFg7/4Nv6KqjyLWlCvr1IFy0xOZ1tUdrat+2ePytF23nh7Fl
         pFTjvy9JEK2KwH98g69g79eoXTS+mOfE7+ZbItg2RgozpbNNn4tn7u/VldXrBovAHYcW
         MnHPXAgszg9EBM9BO0ncvXkhS1Jfwc/0otFi5t/ylG1OT04zVvkN49xq60ZdCrUHHg4d
         Y6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755638; x=1762360438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=lyziPxbgMAO812DdoisEP1mgQBKFxTUNB0dbe7A7ClPcb+UvS0G4RKwgvmkDRXAUNO
         6a7DcCDvQbaA20BUct2tQQgsENED7etxFdzdKlIBzFUlR1kqpJTKNugWCR/zjR1qRxEN
         e1JIQ8DLcIseMp+VbEUgmeobPlGwoBUWwHIcXoweSY/EUPHQG3mEHy745GAL5LIMYOmi
         KQNBDxGnge3cihDO1+5TjE2pYYNKBvhvhY5PCDvZFhEQaHseVuFgRs7o+xEczcaO5n82
         gd7q6qgWvA3FnIKNxZJOsycdPyacA67VDLNg5lvw/4PVoALvvIp1fdGme2ywX3ZULZCt
         vU8g==
X-Forwarded-Encrypted: i=1; AJvYcCUNyDdbS9EH/nAQyM+axstzTwJLzIpl4Fj2huCzb9vGk0eFcli0XHoDvUxqQDhazStujJZSQ8Qm9fCTrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW9HB18P6ereji9qGnR6eUXqXJwrLkttoFImeQME25/Ic/6ExG
	RJAVoWzVZcHT2DLm3NI8VRFbnirEN1l6WroJH/jqPxzcNEhL14OF3LEq
X-Gm-Gg: ASbGncswzUI9Whf5y9DvO9QbBmYBN1zesxpTSu+BCOxxSte5UmFukrCuaPG0Wl8LjWY
	spLfjopyaL+fG6KY9SQnh1iop7FheYZnmFs82Qr08Ul7aKooFZ87TE6nmNhH5o6wydx764A0bm2
	YREsEKUuFHG4EQskvhhKJ1Rgd/J84hixBqsQJtVNIjBmsQihDI9nUNuVYhIeIAXv/jauXwh/Lgl
	ip/2tNCTt4zgKS5fP5QwBRiKpcUMSxmZFo0lmRumONu0npbkHev2JCmtx+GDjRTZ321sfz7kLzc
	1JrkNWVgIwVkl1p4nmsyLrSNgpiBQguoGV+k/FBRlcnN9oEbamtMnQoy8VzDL7FNZMUq0SBxdbX
	Fc+ociINTQUgM+SQWhY28IAaJpMcB5gwyiThQAAGcDNRpjuHlqdhbj58VvcR/Iz9yzOenh2zMhG
	ALNtAg6YAEuJaZLgL3q5FvTRWkivHyA+WBmw1xstcCr4EkQ0rI570ewdq9XrBWeRbAFoKh
X-Google-Smtp-Source: AGHT+IHnWRqBehOWBCyuY7cscNzDJLcQ8Q1/xskpkrSKjJiOMcliraM9J9uBI/ZGi7u/t3zd09QFLA==
X-Received: by 2002:a05:6402:e9b:b0:634:544b:a740 with SMTP id 4fb4d7f45d1cf-64044255cf2mr2554809a12.22.1761755638150;
        Wed, 29 Oct 2025 09:33:58 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e86c6d7d3sm12474615a12.27.2025.10.29.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] soc/tegra: pmc: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:36 +0100
Message-ID: <20251029163336.2785270-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_093400_180501_86FF7936 
X-CRM114-Status: GOOD (  11.98  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/soc/tegra/pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f57e5a4b4d96..6e0ae0ede263 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3150,6 +3150,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(void *data)
 {
+	struct tegra_pmc *pmc = data;
 	u32 status, mask;
 	unsigned int i;
 
@@ -3163,6 +3164,8 @@ static void tegra186_pmc_wake_syscore_resume(void *data)
 
 static int tegra186_pmc_wake_syscore_suspend(void *data)
 {
+	struct tegra_pmc *pmc = data;
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
@@ -3836,6 +3839,7 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
 static void tegra186_pmc_init(struct tegra_pmc *pmc)
 {
 	pmc->syscore.ops = &tegra186_pmc_wake_syscore_ops;
+	pmc->syscore.data = pmc;
 	register_syscore(&pmc->syscore);
 }
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
