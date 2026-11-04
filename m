Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B53606A33F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wage2y5b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1Cgq4l7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GAhbSc9nvUZBNBckfBd3B7hUGyHkPB0pDtaCT3Btxvo=; b=Wage2y5bhOIToLvEjdpb8thbXK
	XC/PnpR/n13uka8NFjtKzDvBC9O6Fg4YTCgPQRELqZyPz2dtDjgelMMSrBt+NHpEo1n4VvXGBVHtO
	lYafnUecpotyxQknrcBtxAWcKdAQA2vwEy2jluPmjioliKb5GdB7EavYXpAPGSjPW9IRGc/vIfQcp
	HNI1Y8EBC6SPSiWYuNB1MNIttA4D2jugZNIcEO2Gk8QKBzLmePYQv8PLiprg/4Rgtf87/7Amm+WNm
	cRL3czS1/9plV4T+icsiSVSZlpksOUzY/3/3tgo3HD2nUTv9KVNGiHilBMuBSgabhxIjdeRWj5GqE
	INY7CsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObgD-00000005aEx-1cc1;
	Wed, 04 Nov 2026 14:09:33 +0000
Received: from mail-wm2-x08.google.com ([2a00:1450:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObgB-00000005aEP-0GbG
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:09:32 +0000
Received: by mail-wm2-x08.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so3093865e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 06:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801369; x=1794406169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
        b=s1Cgq4l7P9cTc0WwSZB++T6uk1U9PGFI/UcUsexymY63y49VKuX0VFjoSodW8+1Mqw
         iXGhpTtYThedB5WVT6K5+n20me5XgGlM6Z8npU/zdSWh3mKwZr3onT7BJuXURHHoa2gF
         fVMGy7TkjLdzexEvlcE/T3vxyiswlTxxSeTJsOrg0dwMQSl4FAzgpXzsqysxF4ciJL/b
         TBjTAk8HG6nIKUsRCigK26mmxwNUrPD20ONQySBW8J1/HkhGZb2I1BgnSaSlAPNNBdXx
         OV30KPtvV0Fj52Q8kQeqQ4dazgLTDRc+i+OCL2ma7lB5SRtkpwtPW/gWBqotfKrRLyk1
         oVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801369; x=1794406169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
        b=xVhXsaDw/E4lrtVF3Ss7Zni+T6KrNDd58MWPYXheFB3t3K2ROoxLME40rFbotMjsUB
         HBCBmkJj6UYzpAlclaulokjutR/yzVXoSuuV4nEhINgXS7kPb0mPMkScJIw0N98aogaR
         QCz9dXHvKZFSD8d0F7pjbDP0u3lExNIY3ikzxtqQiTiR83c7c8rb12NGfxWNEqcCGRax
         MXiMEMvyr2vKXO0ayf21pbaTW0qsOLjnLhexTGWnircBI0KQTTug39GTLKYvI6nmSqCU
         SqodDNDEJuBHpItTUdFNQDZYwfJwrQM2kgTUi5VkN9Rza5MmAiv524P0b46/gpvZYJxy
         NnhA==
X-Forwarded-Encrypted: i=1; AKwUvByQK0sAIiWbO+eldU7lNyVfkA9TGhSO2uROBjiWR7CmmLGVewjRsP9WRhOaLzRuroKB3ZIdQ4MKGAS14w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8YshlmpSVqv96+T1yTZ2TZbsS5Qq7drULARe8taIYjuzkwFzfc
	JDJfmi4Sxa8NpHQZ7snwcK94zMa+3GupAiN3h2oNZiW34mjGBs2XQo+fgg7iuR88
X-Gm-Gg: AYBFou0NGZQ56nE7d+aYDHZAkz+vxvmegE9YW9SnixTGNsFJGqq55fr+TJYawl56Yaa
	/hT6NafuuaZKoBNKfwqt6N0NSRzKpxD1p9+DmERrZxQkXiibqQ/BI4OH4LBWazOZxG6atGuuC4s
	YBS3BsYbBGI+cvpu220FicEtpXfVcWTXsp4QIVfc0MoUTeE3unD87V4dg3RCTZ6nSmSjNNmUbYm
	1JxRZBa+jNhkpKnq0ixCApl3XqCcYOMeSrzTNSdY9OI/pQLsIwDuCFL2hCM12oboqSK+lOCdFIW
	lEnRRekI5BZ+5vfXRwagcJSLyIK72PD1fyf97vRFRwfuEa1OpmzDyUidSSGOtaz8FxU69DspXuk
	TEpxWTjwDHkbgvD1EYTiAcM2aW6r/bY0Z2DjhRcuNnPUMcRbtgNdI9nT37IDYoC28PGS4p9tn6y
	tdUZ9SvMNKtjAL9EgL0ZJvXfRlX8vrj/EO16N6S+dLphJ9vHjT3pQiP9X8Q+hCvHxjpbR2bHYE/
	UlfO9ZVRwfQ8Z7QQSG7+rBQiupK3jQJAVUT13sMegYP9x4jMKjudA2v0iQvzuKumBWRfwoxhPLh
	Yr627gcDGHzQWa6cs+WNhZkmUKQGDpu2TVXtQydvcm/L9L8rMkOXFA==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr177944795e9.29.1793801368473;
        Wed, 04 Nov 2026 06:09:28 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm40977605e9.0.2026.11.04.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:09:27 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-pci@vger.kernel.org
Cc: Ali Tariq <alitariq45892@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Alex Elder <elder@riscstar.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
Date: Wed,  4 Nov 2026 19:07:45 +0500
Message-Id: <20261104140750.761330-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060931_120337_C01D8AA6 
X-CRM114-Status: GOOD (  11.15  )
X-Spam-Score: 1.5 (+)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
control logic register, which causes controller to reset itself once
PERST# signal is asserted even when acting as host.
On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
runs again, its first DBI access hangs the CPU.

Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
in k1_pcie_init() before enabling resources so controllers
dont end up resetting themselves when PERST# signal is asserted.

Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Hang log: https://kernelci.cloud-v.co/scheduler/job/420
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac3..af6028e8825a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -47,6 +47,7 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
 
 struct k1_pcie {
 	struct dw_pcie pci;
@@ -131,11 +132,19 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
 	u32 reset_ctrl;
+	u32 ctrl_logic;
 	u32 val;
 	int ret;
 
 	k1_pcie_toggle_soft_reset(k1);
 
+	/*
+	 * Ignore the PERST# signal so the controller does not reset
+	 * itself when it pulls PERST# low.
+	 */
+	ctrl_logic = k1->pmu_off + PCIE_CONTROL_LOGIC;
+	regmap_set_bits(k1->pmu, ctrl_logic, PCIE_IGNORE_PERSTN);
+
 	ret = k1_pcie_enable_resources(k1);
 	if (ret)
 		return ret;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
