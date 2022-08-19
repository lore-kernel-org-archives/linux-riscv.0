Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ABCC32792
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqweT85amvdgp+P/l7eWSO00q5Mp1whKxPtUoKcogGU=; b=NHd1bpJAa7WBDt
	KAAZGDJrhNrWTYIMx0ec/ujb7l0DbDI6vJKDT/GxL/lzngBMdvgxY/iwtgHW0w53OMpXeYwO2eFUx
	YgmrnvmmFh+eV0J/1Fb5yVE4GSpAxvk5xSJqQnuZUDjP65FpLG/jehPu7/BEbOyNLrF4x8pfHfhxK
	JWHUSdyEten6LT9SIab9acMl1zRWlh200cJ4KBzf9a2aWoq2mVpaL0Nzs1wla+XsGVk/rly0AyI42
	22o93JTt0W9iiVIbTIXfLq0bNGbXNRVRE54FBPAFXtDTdhR36d+mTY5Yc/gYqplu6N08zHuiptZ3n
	TFGiV+mTDecKU6MfCK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCN-00DHgs-5i; Fri, 19 Aug 2022 23:14:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCC-00DHPQ-Hg
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id e20so6221763wri.13
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1zyqHrnqjTNMymEC/TbLOlsscOLg5SkRYxlyH7Tu2Ms=;
        b=Y8AD7r5Epuf9MXQ2+jv+dlo+KisSknvBlpvGlf/D+IiD9iTBxDKQ5D0kGW2ZkDBfJK
         TyKvVRquHMBJjPepEwyh7xDrU0VoGL94RietZ1RYfzka1+goKyIru/tmRTNC9ubgswY2
         7C+4K1MwwgAzWNLHphJlqXVL5a4rZqVQVlMOGYmmLzuhs1ZKtPsWUEDGofFP1sHIH/wY
         m95dlsgCLOt9UOfnchFoIXKKzh3nKQwdQkSWmwPvf2cOmUR3QNQAGQ3UwyDoWUSAvv7i
         9UY485pjhWoHEbFbH6nxyy8pgKz2+3vm2gTryx5AF6pby/lIBfQgg5AGPutVWiRKVOm1
         PhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1zyqHrnqjTNMymEC/TbLOlsscOLg5SkRYxlyH7Tu2Ms=;
        b=kYGoO7sQCPmCq3Ne4KHGv1rbjrtRHfOA4C57Fqz6qZW4sVyRrE5/MCp041hHnyy/Qu
         YW91FVpNGWL4PG4vdAoOrn8EHKB3WaZPcC4CkK8NsGIqccZ3h35Fxt91h5IYeeiMQbwA
         2LxeYskzlIq8VZ1q8nTnfhqBq1ljNo900tGHzJqsaH6b0cRKp1azWb8nhB68jv0jZpsf
         RMtpJwYu1naxkKHV48M0LQpeGdxgCgrjf2Qi8NfJ9hZjkLO+DLm1iUroCGDnu0NiBCT+
         8vtPGU0/QCV1ABPMcB9cm4ETfQI6Rs36CsRQyheoPJ4aEXJEueGa2AU0V1ZLOfU8T8dJ
         iD0w==
X-Gm-Message-State: ACgBeo2UISLX4YMAKItDjcSDqfRgQJ1zZKrVYaaA4WT080BabmK/EYU+
	B2JX35dVkP16EdYcXRTARm+QCA==
X-Google-Smtp-Source: AA6agR4jJTOrQBvLUsU3COfZPaxQ1oU8l4Hl4SO0D5oMAjRdbWZOcdKruN9mdEbg+eLcUTkfChoGKQ==
X-Received: by 2002:a5d:404c:0:b0:225:1a39:d69f with SMTP id w12-20020a5d404c000000b002251a39d69fmr5405015wrp.576.1660950872099;
        Fri, 19 Aug 2022 16:14:32 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:31 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 7/7] riscv: dts: microchip: mpfs: remove pci axi address translation property
Date: Sat, 20 Aug 2022 00:14:16 +0100
Message-Id: <20220819231415.3860210-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161432_650353_EBE06025 
X-CRM114-Status: GOOD (  13.07  )
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

From: Conor Dooley <conor.dooley@microchip.com>

An AXI master address translation table property was inadvertently
added to the device tree & this was not caught by dtbs_check at the
time. Remove the property - it should not be in mpfs.dtsi anyway as
it would be more suitable in -fabric.dtsi nor does it actually apply
to the version of the reference design we are using for upstream.

Link: https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide # Section 1.3.3
Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index e69322f56516..a1176260086a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -485,7 +485,6 @@ pcie: pcie@2000000000 {
 			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
 			msi-parent = <&pcie>;
 			msi-controller;
-			microchip,axi-m-atr0 = <0x10 0x0>;
 			status = "disabled";
 			pcie_intc: interrupt-controller {
 				#address-cells = <0>;
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
