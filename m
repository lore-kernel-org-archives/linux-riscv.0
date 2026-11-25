Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993F606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 04:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qq2tJ0rB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0RuvkrW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rSH9m01T/zT64OuhVGPhMGZnl7+RDdrtQa9Ej64Vbto=; b=qq2tJ0rB8UX1gieJ1c6XJPXtKq
	phryIftRUl4xWOk12Q23edWc8I6bLu2NGWOZ9gWALfkaS3w1Kb6UzrAA7jC3hFknEbj9T90ANlb30
	LGlwab6iggd+ROyfDugb0mJ7sfYnjOzliVy5Yg+6lVLYJY1lcobCjaCWMhgSeRhjASffFgbMwhCD2
	Zua/1O4E2OzwDttWlI24wMFB4Km7Zul6OaEfP2MP1Lon40Rdhfk1UKXVFp48dFjtO4mdCmuaspVk2
	QeVQX0iN0jMEIf/8esvNaXdYZ2PSwF0+fe51dQw6PPHRq8Bfx5GPhW95wuvI2gb4yKTcl9CoIDVY1
	ZtmKNUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Q6-00000008NBD-0eV6;
	Wed, 25 Nov 2026 04:15:46 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Q3-00000008N9c-2qLM
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 04:15:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdb9f760337so3113980a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 20:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580143; x=1796184943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
        b=J0RuvkrWCsL34jHjzpLM+ceBjQGTeaZlcKGWicyN2xgjYV96arYyyes78lujG8WCqr
         DPVIbxlP21P1H+ftFATVzwrGsbDi20V+1OkItTHrZ1KG68qCVsrteYyiXsS9f4vH9hy0
         x70P19MQFu8J1E/8BWn75EXnUS7DC50GxtO6FLzDlCc8XEMphJjxsCk+F+/sciAa/jdb
         NDXFDA4ya85PrY7fKPX8F2nLk87yamClEODx8wTvtgnq1E439FIL5YihKUmKWtu9lfno
         UubtTqnshPkExXJM2AO11EUqApPI0mBRUWfHizoUPqgeqkOrhVCivb7hFCqIhP1maBQ0
         3ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580143; x=1796184943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpG3C9sh88JfyNsM0V7xmO9UxxWA9lSYPUbiUsd72nw=;
        b=F2t8Q2yByYuCL/2IaouLtT80CPie01Mgt7eKu7wF8HrGHQqj5tA6epgYKhye/j6Heg
         YR71RBp/6cWiwZFoNFe8GGSbX8rC01Nr1lb7sUajkHQmCnp445RuU5UpoBhytAhuX/Y+
         Uz73USXWRX0Mq6a5lW3o426uTZmdFvKPDx8sKP+XaPr78ni5Jvskdlfx1hUSktSWJ3Dv
         z+2o9osZFtnsAkWUG5wC0wVbfC14HseyyWlVqFT2SQR6HdrY67r+kL/HQFqxdWxN2WJN
         SsUZOQNSrxUjfL49ZZJddoSh1fwSIzU11d8UsRjWZ48+Qjn/490atxi0IKtnCpNR8QcS
         dE3Q==
X-Forwarded-Encrypted: i=1; AL+hErHru18qDcfnDxfxOj4MEPZGD93tE7oiKcsX/aPlbt7MrP/NsyLAuZXckwhGzhjYWnP0inPmWXHF0lb5MA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8j/j+bucjFjaR9C9gpv9wcWFb7Dg0Z7DQMfmhtORKaBbeReMnF
	UsVDpWO8f210zQliBy9ihXriXmGuSouMOLZpAv3ycTtcG5DmMmIj914+
X-Gm-Gg: AZFdTZd80/rmnDQHdo4uYSwHRY82E8SsHKv5tRuMGUUseSIhb1RGdSmrWQFiBAjjcOG
	POncEiXZcenzs9PFI7afrhNtGSsXGrAliEsRugZMFnj1sXlABtv/fT7FAUA4hYmJ3iFTlEUspty
	4rb9sxOapXFi6e8SGPfJVyvJcSoVNtI7j/1gw6IxAvram5oRRT5q8xRLnW20DKjrQu4umTT8Fmu
	ixkq6toxv/ud2cbxAZuy0OC9HfVGH9gEOmhwU8G7V+u3fo7q5yxroyTMUqG9B/1vWOe1MXgWQh1
	6LHifF/Sb3eTHI5W71/ik+j2QIxeHha3P69oOzMokw3WAF3LZrU9QhSL47guhVkrIj+DXFSm1do
	nlTlO4pv4Ik0nz4q7db29X7sB8DyVogwq5/38I0+DWO7ilQijOCZ20kW5jxUjVarAiSSioR7BS1
	cwLyttWqFYsFb9VbQA274JGR/mXOzfZXRqDgkQcDPF3eLcNtX2tL5wH89g4yh3B6zlnO/2wFhVS
	MF9TEugioGYLXIjpt4R3Ymtpe9hLrvEwn6ObgTYa0cpN5GQssbHnL0VjyO0K+xe3u2ARUcH7Nne
	VVW9KH3CgEQLD/3kNPEaSCBoqYm0VPRH4o6eaVAU+knqogbo
X-Received: by 2002:a17:90b:3b8f:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b41c95f0e1mr11207523a91.34.1795580142737;
        Tue, 24 Nov 2026 20:15:42 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm27848549a91.13.2026.11.24.20.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:42 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 3/6] PCI: spacemit-k1: Add device id update helper
Date: Wed, 25 Nov 2026 12:15:17 +0800
Message-ID: <20261125041523.242588-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_201543_725386_ABACB830 
X-CRM114-Status: GOOD (  13.76  )
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

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 8a3cae32609f..f20c74eca73e 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -55,6 +55,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -156,6 +157,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -171,10 +182,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -384,6 +392,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
