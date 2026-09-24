Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC5C9830D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 02:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nb6bDvQcmz1Jqx6SscWo+OUSGtDCFpoDNgI6YHVs8jI=; b=bgV05L4rYx4FQ7
	uw4v8uNz0zC8cEOk10e7HS0Ke4cZuJpnM+GHcXhoHVVL1PA5q7IABk/TkMV7fEJL4l6yGq/lOoeYa
	H2VHcIAcRufJNN8QErwqIv69jE5WJU/EOb2DAJAhZz7mzJE8wxERXMflt5JGB9/6nsmW9vgpbg8am
	+VN/Lb0BElov7+SLMWkdyzF4BxA0SCFyBS1qadC6uuo4QfHAMScO5aiXQA+r1y0zPEpIgzLmnTUb0
	XQequwaHkx8CxtVdSJ8Kg2enM6BexhB2KO79lFcIrHA9TwC88uWZ2KSJ6sH+8zKRAQ6G5B009XNuy
	F0xq1e41iT5JkhH7Quww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YoY-00000009pxK-2pcZ;
	Thu, 24 Sep 2026 02:03:58 +0000
Received: from bg1.exmail.qq.com ([114.132.58.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YoV-00000009pwm-0W9X
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 02:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790215414;
	bh=s3CNAx4BQMr4l63eYxA4KnmxnUvSjG39QNEvmt1VyIo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=vnoHjDAGxgfkFD6r5IQQmytgxMGem+RVl/ys3MXcczSrFlJV2P1Fa6TK32OI+t+Hj
	 1163pLE1jLGvly9iBtDEezqtA8bRfnI0QomRwmKS/0awcl9mKl6sqTbnj4jzg87MSc
	 GF4qRRFzQJun2DIWjD70ihe+weU1oHaLvF2BRzLs=
X-QQ-mid: zesmtpgz3t1790215407tb9e7a6b9
X-QQ-Originating-IP: BYfzCy6nTypQWy08C5EApOMYUoFWUOLwIQk4cKlrwzY=
Received: from snode1.dc.com ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 10:03:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7833649255534898788
EX-QQ-RecipientCnt: 12
From: Encrow Thorne <encrow.thorne@linux.spacemit.com>
Date: Thu, 24 Sep 2026 10:04:48 +0800
Subject: [PATCH] PCI: spacemit: Ignore link partner PERST on K1
MIME-Version: 1.0
Message-Id: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAD+FtGoC/x2MQQqAIBAAvxJ7bkE3Cusr0UF0rSUq0Ygg+nvSc
 QZmHsichDMM1QOJL8ly7AV0XYFb7D4zii8MpKhTPWnM0Tre5MRVY3TCGORGarsQrPGNIQ8ljYm
 L/rfj9L4fooo5lWYAAAA=
X-Change-ID: 20260921-spacemit-k1-pcie-fix-256ffa8d382d
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <encrow.thorne@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790215510; l=1795;
 i=encrow.thorne@linux.spacemit.com; s=20260922; h=from:subject:message-id;
 bh=Sq/Bmk4yORgByR9DGnLLTWgLehmQZuZU/1N+/ooi0u0=;
 b=z6eP620CfxXQFP6H0sQF3XjlLbwrhD3S+Yj68RfV5mBp3vFjolWOnArwjsMW3/k9Q7sLWpVEX
 mppB6MoCTSMBQbrhKewQknqWhxrVafjqqaXtP3G3GEDKaum/+OzPyzI
X-Developer-Key: i=encrow.thorne@linux.spacemit.com; a=ed25519;
 pk=2pmSCQKuWBw48bo9mVmWM77uEWdezu/geF0k1YMFzN4=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MLnLowx4CbXMyRItrYTYw0ia9VMa1QZ78XK1oqMQXmDL0Gebm+FjxCz5
	0QmkuQYHM3IuZo9Ip66Af/lo/8hzvQMtKOhAWRrjltH9LSEE0cgazxk7dSGwWljrYzLS8fd
	sGfki5bIVBVQSybiPqVZjaetblWM/Q4chnpAMkD+hG4EqT66AHHa94NOElOTAJrhrvg6Vl3
	gYL0BtHFhqMtBmUsjMXiyXbui2CoY/vpuIR9W7fX49IrvGBlGblobnolnxOWphTAp0HPj7Y
	PGMcqyJxGxUHzz3swAICUcaewCAiRHIFu+2j3ur9oxPgO8+zITZECsjsHZVhbQOOaECGcWJ
	DFQWFV9QILM68AQLxoioQeNPPTaxNey0gwDb2/94c85upqnXa0R9C94+mCdoDbdoES5SY40
	2IHEPzkF0/jbU71pxCufKDYxODG24WXZTHvOLrLn3eXEVoWyB+eEUfbwC1hqKWksQAZ1DY1
	MKwT5HGTQZbibqMN5fYU933bYX6fXd+4E8VwMf7nY9hvoIqm9gsEH9CJwL/sFgXNUFRnoPI
	ExkphLArWhEq9mW/UY1nnMrADeRTfboTMvflCyloncx/1v1H/A7F3qK3l4XrJBOnxf9Ulfw
	IwOYvciAqLkabpJG5US7Nl5lQThrnocqdP2JuZMSmAGKjGuK9VETG0y6l3d16lxxV6K0dSl
	/klzBqKTzOgkhAAOGbi1jcwesPlkw07a0dPdCWyIPwHNrT3kU6CQP5SmcfDBs1pA2F5c3Lb
	aZ8aDVauPzPiKXcts1O7rjLnXg/bW87THHJ/qWSBnwgTR20aa1LSblJqmh3TvbIc+XqE28y
	fe/rWF/ITt3zAc6TdXZyr7uvspj3zaTGPf5vLG0NavdDitMeN2E4zEta+JTBqj061JHtCQN
	a1Cpf/8BLNeqpw0+UyH1eu5yoyTQd8ZsmYU6zzQkQHitHTJKs3btr/LMsX6kIwbUeSzQnfp
	EZ7TaIZLlB6ixn7rPV67sUm4UElK8KFIqtE6clCBnmYfiqS2VnonJU7XoyB0cCkgfkkwx4u
	xKaBDTDkXNxZ0qD9j4AizNLKZQl2HXVwKjXWHfltpDCWTM1IKOm4NuLGSTQjSRNpllLK62n
	E7COiYvj03Jz1AmDunNdjWQxS0gA/EACQyunEPudrWiK1ZddkJ9JMtbMDE42v7BJhpfGKjR
	4PUk
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_190355_836953_CDEE2A9A 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The K1 PCIe controller and PHY are affected by the PERST signal from
the link partner during initialization. With some devices connected,
this can prevent host initialization from progressing and cause the
system to hang while probing the PCIe controller.

Set PCIE_IGNORE_PERSTN before accessing the DBI registers. When set,
this bit makes both the PCIe controller and PHY ignore the PERST
signal from the link partner.

This allows host initialization to complete without being affected by
the link partner's PERST state.

Signed-off-by: Encrow Thorne <encrow.thorne@linux.spacemit.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 0564c46e2f48..98f067e1ba81 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -44,6 +44,7 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_IGNORE_PERSTN			BIT(2)
 
 struct k1_pcie {
 	struct dw_pcie pci;
@@ -137,6 +138,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	/*
+	 * When set to 1, the PCIe controller and PHY ignore the PERST signal
+	 * from the link partner in both RC and EP modes.
+	 */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_IGNORE_PERSTN);
+
 	/* Set the PCI vendor and device ID */
 	dw_pcie_dbi_ro_wr_en(pci);
 	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260921-spacemit-k1-pcie-fix-256ffa8d382d

Best regards,
-- 
Encrow Thorne <encrow.thorne@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
