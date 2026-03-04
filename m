Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7703DEF8FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETtp/8TxVuhbb0dcml/QRMT9Dm5osbBLto41cmrX/6k=; b=zQstKY9+Vpibu5
	As6ieGwsxavuDN5tN+pir96m96IKZ8+HXFxCOu98eRRWrLXkVMrXViMBwWxmidRFcDfSkD38JoA/c
	kbaRESDh4wZ2dy9jTeOETYbAg/yQbY668msz0LAOG1Do30oMq5xEr99NySJbcwLPcQzb0+/svm34l
	q76E4hevK/Gm4QweePWwGNjxDa2HrtcpcbYhGhXDOsAthTaHfQHroXm6Neh1B852SxcM+X85KKscc
	d8lkkJqzoyBY7dF5LOsTvUwDr8fi+5vukk/eSpPJAOKghND2wXnS2DvRra0V3lMHXXJZFHUl5JZrI
	d/VeVu5Kufkxjz3BALVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmvc-0000000HLG8-3Vo2;
	Wed, 04 Mar 2026 14:10:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmvb-0000000HLFU-3FcS
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=; b=nP0gBu0wfx2O8adcbcTGIEVunH
	0BSQxca6fh9Zb9r/Cr6pDt2Vy7Hv88VgGTxyExs4zHZ6mBdFeqEYit9TfrQCs07Vdf1MoOGKtXDj7
	688xTfIG2asAkvyvHt6CYSxrLdQsPWNKLjD+pDzXnpMnrbt5MMCMAn9CCXdoIGLjXXarrON44vuHy
	STeR/EJAQ4jG3P6cWNaUeZP3Er5NCIyvKkfp1+3YKmrnYVYNXlBqQ+fNwS1AvA2b5LFFT1lay+rjx
	YM8aU6t1TjUIApYMQs72VaQHnbyTvKmPkuw4Z0duMCdg/zij+c90Qj9slKiyB/1rOMXKb3qbyuLrS
	J27BnWlw==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmvZ-00000004ioN-0Ypt
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:10:18 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3597c40a838so1561325a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633415; x=1773238215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=VLHdHvzXUUII8ysdcztEeofm4Xa2m6308uQ+nXKJ3rFHCA+YJjv6u9ReQZOfg35RJp
         Hxi0DdbJqhPvT05LBzF+212nBNi3vkCeM5ZjHm0orGcFQymp9t68kCxDUVWWDul25TcK
         /vE/0o5SVKRgpf1gk9umQOD7PWLl25DUU3cwAkKnS7PsvmrjtIlhxDQ8uoo7eGw95R6n
         QdNGT9hCG5n4yh+o9xVFVR2CaDW1lc1C65pvVgwQ58Oo/J2PPhiKZAwvfFqvldieRidK
         z54HNFlem3juJpdh2qsM/SEgiwymqY9cFNU7t/bhnsHXopRI5p2LD6T795wtKMUiDcKY
         AgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633415; x=1773238215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=rbjbOQ9kTfhpzpReXrLjWldx3YnVLQWg78lIZV7pxIvAll++RWaWcCJLEf7Ls1A/N8
         3+Ypqvyepgstk483xFAzKJHEoL5fJOvW4kdNXn13PA21MeuPMIDjtA41cSSKfO8irW8l
         AIOhLhCuStH8iVKXfMvYVc65YCmaOUxyi54ritmPI1Yimv2oZhD+IJ4mvofcqrNpzMee
         yeLfKRo+GIr+n8HH/DdJIZOyXXXQt0HLNLGb+6etCj8MOtHicvUwvp8tOtcsE3/nEF6n
         wogFlgASQasJSu0jNT/GMUTfPcvUVhSsbZZvtTFL8QDo7v6RxMzxK5N6GVeQRvRAlxWJ
         28wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKLv6WUuvcaiY1k0z01WftxGamdle/tC6bcLUIsoULIw/oJL/q1IIGp5OnnwRjb/EYCctgSfOrA+TRRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyujBcAuP7kAN1Qz0HDO4LWkx28v0Pn96jDm+M/lqrnjhF+sNyF
	n5Be5xFxFcMjFnTVJIDxaY9HzHYJ5Jljb/ecdmFXbAWUVMUJvqHIsFhD
X-Gm-Gg: ATEYQzwfR8SOL03dQSEfvz++X95kk5aug5VFvPE//YNKktGK/NNfkxOI1EdqDzf2pwD
	fa7kSQHlPn0dzxtgkbWwyIyWncPsEjos3DOWf+RXZF7dVTORvgn4A6jb8rMJJ0ZW4hCvZmkYlpg
	O+pQ4qMTYKiQEvvjYK3ZL82IrgREUfWCRxxW/6Po1ugr+MsdyYv/TbxND0+rDDCsEoMdrf2LDY0
	7qFbB6MvkLjtkARERxJX+WJPYkZs+ydvoohQmxXuiOVrgX0TlM3YNppXjNXnG05Qp0rdHFFFiT9
	OHLACrfPhUiBMnnlYKuYeElB2H6hXESmCzqIOpqpR/T/VS21vQD/TXXdhHKOx++7saBStL1K939
	lvDAQ4GttAWTYi6r/Kcw4QIgbF5w239/wLLpss5W2ILaXWwMk9I02xSCSKboCDmilTEoxrlf11h
	IZKlx6hv+rLplkoHu4NTS7
X-Received: by 2002:a17:90b:2e8c:b0:359:8c89:96e5 with SMTP id 98e67ed59e1d1-359a69caab4mr1729374a91.12.1772633414915;
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 08/18] PCI: fu740: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:51 +0530
Message-ID: <20260304140329.7089-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141017_230837_DEB0A760 
X-CRM114-Status: GOOD (  12.73  )
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

Fix the identation of the callback functions.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 66367252032b..aa6a15baf3fd 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -346,9 +346,10 @@ static const struct of_device_id fu740_pcie_of_match[] = {
 
 static struct platform_driver fu740_pcie_driver = {
 	.driver = {
-		   .name = "fu740-pcie",
-		   .of_match_table = fu740_pcie_of_match,
-		   .suppress_bind_attrs = true,
+		.name = "fu740-pcie",
+		.of_match_table = fu740_pcie_of_match,
+		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = fu740_pcie_probe,
 	.shutdown = fu740_pcie_shutdown,
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
