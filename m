Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F60606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IaoiUG01;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTfgSNbg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VicxKqykta/jVX6VVmBkvsQCn4pDJAnKpcYSIx9hRGE=; b=IaoiUG01R2JI2UOeqo18MAtFp+
	QhwxmR7Se/gHArk9fg0oBBFbw4N3EIE7CcwV1pikPVUzK1DVIZo+ajTthAqIK/9qT/UCgvDlOF9Fo
	InMv8oxZKNbBaX8w/luczCVfx8Vp9WZem20oCTv/ZFESIXETVoD6+fMtCuR+FsRi+NspRrAZCbkDF
	zvi/TSsTI1HBwd2YM95llZnvyTinM7uh43yzf0lq0nbo5lWPs7vFdd/8I/6njcZJmwFYhZp6VZsWl
	UtA5thjdCekA0+mdJQKQ3idoKFy8S+lD/zh2Ph6pv7szGnHW1fqEQeH0EKsfbRK0Bo6wEy6xjS3mt
	X/7W+MhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3eD-00000003uOl-3zQb;
	Mon, 16 Nov 2026 20:49:53 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3eB-00000003uO7-0dYW
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 20:49:52 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3915272c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 12:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862190; x=1795466990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuEt++c/hh8n+6PRCKFVagfSRp6hOAJBlPen/z85MFY=;
        b=dTfgSNbgu26eG+9FDfdAkOw1HBiVvjj89zvkcXHjtrZwNEgyNqan4L9swy97HSTeAj
         8137F31EJDvyTbPuIHJcu1wa1DY91b/qhmItKKq2Ge+C4v4da1On5w4fetgwOV1zDeEc
         2co3lDdXkmwHrFwt76ncINsi9jZoxFR7Tu6zVlcJqInoMzIKPUzL4q5OazWLSTccGjTS
         fGJgJtC5BPw5tYLkCER07/fHFzUMl0OEoPz15VmLVlnRLeS+DXzNcOe0hnqu1rUPuR+E
         OJvywWVgZ+hlPAsPQtP5lEG5yeOyLSoYNwnut8eLKuALHh3zGms4CulgdZKuXWOxUM5f
         9iLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862190; x=1795466990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuEt++c/hh8n+6PRCKFVagfSRp6hOAJBlPen/z85MFY=;
        b=ZsrButu8AOOU2m5OFE+2K/62pErmjyaQ2xgwdH1eyFLOO06tshqyfJkAeKHn153I43
         sY4QW3zxWvHA8JQNSHvlQrcQUgCzl8V8018lF9EPwncEIfL5RxgM0Lz7dY0E5brZSPVw
         erbtMUnrOg+c3LawBni4vZHfvrVH/t5cQK4kzGwW6Vp5dAATjFIJTj28+SPkEoNjVFSG
         /hO2c5TFqfpsHmm89X1N02wJjOBLx6ow5+SJx4lHR3yIhw7q9GbPxFV14cUUDYevahua
         qUpeP48JQmcw0KZr3R0cCqwYFOo6oO2eAThryoK5H4at8Mu+BvjvzVVFLc43IEKUVzmL
         t6ng==
X-Forwarded-Encrypted: i=1; AL+hErHsX4/Eo31v7PrE/WATa72GyFQoxoQlDfWn9R4wZrMQk2JvLf9UEucIpu+IxqUXmBxCrHXi2DZZyNlVcQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Z319A0nmOj50+uHo9pGq2IHL11fmT7FRkBykl5dLNqViRvSC5
	Aaia2r3JHNemqGqzSmluNl7nU9/s6onw/HvYBTucpW/os+uDWb0/5SH+
X-Gm-Gg: AYBFou0SLamaeYM8gG3aTzpaKQc2JriL6on91LljnJy//jEgSN6nguxBOlDEirkGIlp
	B0nofSHGTEd+G8Aamlh3jIdwIoU3fcQD1y4MAfsQ0k21Q7Xh0ynPjkks789Qq5Vn18FXkHo9vU9
	v71kyFDtnUAWZAhDVCDMJYAS9uOrEsSj0Kdn2SuZQHzFr8HiM312Q/XP6XbDTjbGhAkwSF2n12+
	G5s2KMJvNlRz/LI1MgPXN2wykdVe/7Pk320dywlH+/d//PIEg3WGNwIgRRJhmjKRj0mHSQ/Xb/B
	7yKgRBQKw746ehS5tC8utmZZ7CyTygmNIW10d4sqcFQn3zZ0tKhVw93+vmfaDoga2RAQY9rsxV4
	JUDLrq2iXgYKueM6BHpOKtDs93xbnpYJ6mmlTkMubMa6D6H+tfBIBEuSiDNf6rhlnpWLa6VaZ0b
	Q1QeAcTrCSmlSfyPGA38O6P6H7QdmDkGlZg35Jnz3MB9WtzZ6ThKH8QiPapy+n+BSUvDvUGLYQj
	/2+rGmx1EzDEmnH/S6utis/QDrWS2p3Lo7trJaJXMe994mwOCd1ywHhqQ+0rpmRAjOIrn6YkEKM
	RIL327rFjtT/XB/Wc4iaSPpPKsGNV348uMyYgWeBhgnXzJTSMc+YK/8CLhMwaPbHQN8Vj04=
X-Received: by 2002:a05:7022:b886:b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b5030f29damr10878006c88.17.1794862189687;
        Mon, 16 Nov 2026 12:49:49 -0800 (PST)
Received: from hp-OMEN-Laptop-15-en0xxx.tailcef561.ts.net ([122.172.81.184])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm38153829eec.9.2026.11.16.12.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:49:49 -0800 (PST)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH] PCI: fu740: Check return value of clk_prepare_enable()
Date: Tue, 17 Nov 2026 02:19:22 +0530
Message-Id: <20261116204922.159384-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_124951_463271_5C0B8D8F 
X-CRM114-Status: GOOD (  10.57  )
X-Spam-Score: -2.1 (--)
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

fu740_pcie_host_init() ignores the return value of the second
clk_prepare_enable() call on pcie_aux, so a failure to enable the
clock is silently ignored and the controller is programmed anyway.

Check the return value and propagate the error.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 00ec69a09164..b2eded23b52c 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -270,7 +270,11 @@ static int fu740_pcie_host_init(struct dw_pcie_rp *pp)
 	/* Clear hold_phy_rst */
 	writel_relaxed(0x0, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
 	/* Enable pcieauxclk */
-	clk_prepare_enable(afp->pcie_aux);
+	ret = clk_prepare_enable(afp->pcie_aux);
+	if (ret) {
+		dev_err(dev, "unable to re-enable pcie_aux clock\n");
+		return ret;
+	}
 	/* Set RC mode */
 	writel_relaxed(0x4, afp->mgmt_base + PCIEX8MGMT_DEVICE_TYPE);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
