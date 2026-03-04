Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80864EF8FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iY4IuffWs9lj/zNcRIhZmaOuLUDmoxtHJSQNd86lcw=; b=NKV+M0UXhcOiVc
	0gP4vmut4es3RVZL/yEP0M6maiDdOxpCpVt4c2RwJxDEdjr6mV2XRLDzN/Us/dyLfnIiZYHmKqqKC
	yzhjylGzic+r/XfrJ4lXDekl4jjQFeJq9xE81MPPbDjeIrZxZwlX1Mm3VmkWkeONeOIl09EFKnPym
	7sqiDBeCiM3EV9sobJQ9sKRzghnhv6gWVZww+n8jLbnmeZWUcajLYSdiAFdIa5WWZ3RuSLqzhFdPX
	X9BsjGEErDpruSN+6zQyH8mnjUsYPS1kYVixcmXReZr1XuSucb5CS6RTzQoeMHG1p0sRgzWECs2gL
	W1E9J1tujZJdVN16syLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmtD-0000000HKX2-1fHY;
	Wed, 04 Mar 2026 14:07:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmtB-0000000HKVi-0bGx
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:07:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3599019ae92so1774203a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633268; x=1773238068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=Rku4GAgn7qpVK3KgvWGdsbjW6DcdFqn74XuxoKULuT4fL3aw8V8NdPKKmSCuJIjYk8
         w2mF0p4LQcpLcidvH80B/0ec1z8p8IqZjRQFs3PuHEKs6KiSUUR2UJA1NGyDZxNFEL/O
         eNdNy45mBtBVfiarzNh5wHMW6jgagM9UlCJRJpki2AQncyHLnOKkGz5EkAR/OjkB7HmN
         kjynPGuAU9LyzerCu/+cuIheIGomRORjiUFFFTcAkdNbR8F9j8R3Lx+V0/2Z4OmKjpiz
         vLEIynkIRkCeAu48c132sLyE8zzqf4ppj2L387OMp6rI8KizmxIaPu3TxVIqvINkHxsC
         8JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633268; x=1773238068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=QBFZjeWjokYHGAhm0UqUKgvKti8pBuLPHb8z/+4zi1JIzSy0cu17MJTyV8PUCKGKj7
         hHuXKzU50kRuqdh0N1jZWMhIyLlo09Y/OM0QPfrkVlacAyXr/UjuxsZf6ZRLk+Wox+Vx
         JRqG/T4bxkiWwfSH6dBD6poUyVLQwqwjsmdeNnuzLfhFWgn2w/L3Od3wxvujO9jme+gW
         +8EqHwtRHwdHBvEEx8HucPMsSNpwEw0WONcOvOod5WK/IeuGNYMcYgrpeMsNBNB6dWHf
         4J4QXhDpKkGdDg31V/qVgYyHqx8oo1yyECYP64HYLlYMvglbRdliy2WlfUP4CR6CAkrM
         XojA==
X-Forwarded-Encrypted: i=1; AJvYcCWGd9wyv3srY/ZGAq1Kxqv7KNTA55rnN/aqFVj/RVxNdXIS6KmgTRZ/rRQOzVSqgyPh9HOLza5neQ/kDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPhrERIfgevWOibH8FwMyyZfqIyXpJBNpafIjPE+0QaVPHxVNx
	mXfC7KqUTIfbaM7NBCHMEDJCjyb4lDT4l12RNeGSXHP+wR4ft6csGEB/
X-Gm-Gg: ATEYQzy3Qit2uwWUPopF9tHS5d8iHLr85ezo4EZw5gXArWwy5Nj2CnmouhD/TulC2Yv
	Qv3Gz+RPwOKy6yYBw/Ro2MKGSfmAlwFfrGqUwA/262S8/Fs/NN5gzoRCHkghFJueSJ9Q8lQwn67
	VecCRVCbPw4mOD3u02f5XmYsvqKz2L+dl7ZXMm99rJG+VOXB9ju3VyaA+bxbT/S3oTquehuuNIR
	ykRbn5ZfHf1lMyAibl+7M2N7CfE2Q6iCkQTHlvW2dzI/fwe5bipDrFv7yM5/hkA79u5mODP2F9b
	PACgvpoR7K3oP2/6Kzj32/b7GkcYFaP1e2zSAHsXePMYAad+tvN2tCyuh/fdDnuM+zs2eWPKSg0
	qLImmwmHsSopbkdy6hG2OL41CkeAfEf1miDC8OND4X6+F7D88ItB46Rr/Q8yxi+PpaEUrBmLhy6
	AWupCeQiXjkVPDHW+aPSMC
X-Received: by 2002:a17:90b:3f83:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-359a6a4a2fbmr1903833a91.21.1772633267856;
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Thomas Gleixner <tglx@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 05/18] PCI: bt1: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:48 +0530
Message-ID: <20260304140329.7089-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060749_174597_B77B833B 
X-CRM114-Status: GOOD (  11.50  )
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

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-bt1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-bt1.c b/drivers/pci/controller/dwc/pcie-bt1.c
index 1340edc18d12..ef6a3c7fa279 100644
--- a/drivers/pci/controller/dwc/pcie-bt1.c
+++ b/drivers/pci/controller/dwc/pcie-bt1.c
@@ -636,6 +636,7 @@ static struct platform_driver bt1_pcie_driver = {
 	.driver = {
 		.name	= "bt1-pcie",
 		.of_match_table = bt1_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(bt1_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
