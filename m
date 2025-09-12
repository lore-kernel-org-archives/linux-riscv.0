Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B405CAC58E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDC/34S7lQvLGtIqFcjMV7jz6P464vtBIc3CKVnLVEY=; b=0yPfvIzBneKXKe
	k7rpaYbCVKwwSfWVaFlANIC5u1cQ+idRcQWLFIjFzSUsFf0qfXcw5uYYaaRRj0RGsFAt/HtAn3l1O
	C9qIpjGO4WvetfyMO8cFwhGY4riQw3uj3JCiQaTMgWNCeBzQuEejyi8oG9ofjwAdFYiJfb6T5M1FP
	zGzpqKOyFk64njFjM0jlQxTboSjYmUFELQrebrqGU6y8cEV09cV/F54eYt0Uq1abQ90B3fD7Gj2qL
	bjIoZcLhaCxGUVnDiPPZLnAyxyf57R9JEfdzuHvxrSWJrn5UOszOB6ElD9+DZQu96mgresDoYKYXf
	bA6IpQEVhWdTm3aLJmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtfr-00000006YeX-2HF6;
	Fri, 12 Sep 2025 02:38:07 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtfo-00000006YcP-2bqo
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:38:05 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-74572fb94b3so1381989a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644683; x=1758249483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=FHpvLMX8kqI6u6pU8K+JfW3AOL/DXL9gixY0zfZu5mogKCnvQtX/HS5o2jCGxbRCIN
         V6j+L2MfkwxvnDb4hf2l9+BgxOj7QZ55cPGN2W/IpdygdpA7mHuMLpxW1FC0rcc1IyP7
         JeZB4g6LqPuGlqyl0ii3cOM0Dcf7BVmCr9KxIcBQGiQPpvAOeeQwbcKhocf76DmvnezL
         L6pV4BFdYpbw7fDLgrvy+S3M1mh3htPEUFs8rKd9/pt6RwynxhWaaQCWB8Vs6b8FgtlZ
         EEInbShUysXY/reRdeG2Wy4l0dn7170BYA9Au6e+AneX3da8bH8LG/x1TuAcmqy/gzYc
         C8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644683; x=1758249483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=YDI+eC2InhzRMSot4vYiNrIJSfQDolPp+PVDMPE2YUmEz76humNUNNcqR2tFBfxFY5
         GEpBMog6O7uvEj/MPDjRirQNn7gj8P2OcYbJlSB2vLoRohXkQ5vJfcaEsGCvH7oj62IG
         8Cr/oxDUXh9rpWFRPkzaQvsni8rgTXHCfDnx39wEXcJRln+kic35KVrvw7Vm9SOQc37X
         ShUYPT0891itZXW3QKP5RFWMMc5wCj75Q6tWtXBmh+MNX0UjEFaoGjew0pd5KGpOnJNr
         8XpPZtpGfLNEVIexTIPHPMSFqt2RPPDz44nFOH0o4rpHPmjSHSRg0ycOROD7RITwT1Z/
         7qIw==
X-Forwarded-Encrypted: i=1; AJvYcCUHs9xn+PX4E3WF8qOUBXaGjUeiTqzLps941ysXawnzQ5hiyCMtzs97nD0Vaa2YdcbJRyGTCKKIXK5P8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDYS7rWGDJAzV1T06AzBTXZuHxKtYkgTO99mVou6mGM69obVeg
	RXOIM7UPLS2JybZYNIXB+mizmwc+EOA88d3zgp1RZd80wCXz+fHMOO8B
X-Gm-Gg: ASbGnctzNF63lnSJpehjqMAa7eZVgfg8cV9sNUmrWG3/RP8nxQJT4+lQjKllNTf3ZcJ
	YhLmMiTzlRj93rYfU3XVmHfhDKJVvkAIIF4ycErXksB3hIQFaQ6OXymTJu1qicrtrVfhtX9ne0a
	u/FdETk4yD2kMRwPUT84mBy4nLYTAzxVqZ2cBONFpTKwApWDasQ5oJsyuHs58OOIjUiBp7lnnTH
	lQ6lBZnSBn6Ogqo2GxdVTxjgKu3cff+ixUjhra+ReMhx0MCbglSrZzV78uAHsO6A2BivhLgF7nO
	FDdbzjUUrurouQepSOdoushME2oWSW9XS2K/bITU9lX8bGGzp84Ox54VWubBvqGwLbViMX+6WNy
	X8O7NtvqOA2H1BLNokHzPOvAV0PWmFqOB
X-Google-Smtp-Source: AGHT+IETqLmXYZmyiMH+mKY1KPo6Sff/q9RyP4s68oN/ZgPUPkjihsjoo2nIbRNYpa7WwZvbeHu73A==
X-Received: by 2002:a05:6808:470a:b0:439:b198:23c7 with SMTP id 5614622812f47-43b8da0c548mr626312b6e.31.1757644683591;
        Thu, 11 Sep 2025 19:38:03 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b8293163csm565701b6e.12.2025.09.11.19.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:38:02 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 7/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
Date: Fri, 12 Sep 2025 10:37:54 +0800
Message-Id: <16831a3277a6c8c19436a17ac199d2f9b80f9ce5.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193804_674198_5A852967 
X-CRM114-Status: UNSURE (   8.02  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for Sophgo SG2042_EVB_V2.0 board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886..0cd0dc0f537c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -152,6 +152,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
