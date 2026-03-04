Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98197EF8FE7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHHuH1JOnFFsmksBW885ilq5NUSA0KSJZM4BVmXn3Zk=; b=gywPMQZ9hwIp3s
	SS406e8bHcwFd0AMKgkxdufZqjGU/G05E74DaFOGpzhW80wwA3fVZX85dgvg5rdNnC3VeyLAnVZOk
	8NJpa4QyvCTAI9fVqSKQzBqBDTyyzycUO5Uft/yY5jyN5mE4mtqeygYrbo4F4ApCs6Qf1NsZOCm4W
	1cLu951+V3CbWHLYmNnqtRUx/psO0JU/FoFjjSbs9FQMAqhW5LzZuDwyNstc0aWzz+SBKdfpitNtH
	BMHboqu2gwyzW9JlcK2fs7mx6cXLjPIkJhqhhPcvWFezSmfNWaGqYD7ikLnAkPJ2hPUUdjhwO6i6l
	nz1nt3tmLeU48WoJ+UOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmzT-0000000HMHG-1Wgx;
	Wed, 04 Mar 2026 14:14:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmzQ-0000000HMFc-3joh
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:14:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-359863611faso1503736a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633656; x=1773238456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=Z7+7afPWYVnURsiBzpJX9G1fZ2Xmr2WEjucKGgqcmRkBx3pbXrtfqjPxfWICmF6q51
         oKhhyWwI7hhM3fW2Uf8kovys4iVVFV6jpWo8UO5JkJn/1wLN/e94bUaDNgPY3AG+1D3g
         O1qyzTP8uAOZDGzlSPenPgmz/HuYce/qwUWxw9omiT+U96htxmIRcSnnd4KXapnbdphJ
         tl9418donqkhK719P2+1G8zo95S8rKkQHlphT9E7xTP+vrkYYYuuv38IpDdv4+MGcl4x
         AjR4uuNJuK53bmbLROx/AbLxZJTPeXyz2M844gO8G3l7CZdqP3YR2lCvRBcVwtuLZpu4
         cnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633656; x=1773238456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=rXxpE/+mVH5WJ5ZOYNq1q1l6JLXsoG7vPRFeoiTzteN6NvYGrZBnpxN5cdBtCivnRp
         YIwh4d9hqmGUcseHAOvE2tFnRKAaAdT0HkK6+GII4+uIMY3iecEF+0D0LMga0wF7TiCu
         wlafcaRIRmQlzgraOxIqxROcbmGlM+WnOSTIk5dTJmGrvZqlZYGfzjOTfKmn6gf6TK75
         tFdwR1BnM+HrW6vWuiHR/I+HpN75P14bbSwBg/QgANOI8vednAWdadS+ySuS5RNom6ef
         XRNpWEG6R0z+j5tYaTUUN7iNJxX03zMcuC+EqjyIU8BDHTpDPa6PX1/zX8dSrOPYp/gx
         AUDA==
X-Forwarded-Encrypted: i=1; AJvYcCXFzhEBB499J7gXdA/lF8caXo7fIkGt1V8o+VsbeB25X3fN39k8DwHbHDxAymXven+lAbiwFEaXbrUNoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycznPRxm72UwAqzcL8I9KHq6di9/gAtqmFoAcMP5GWGAHPuROc
	1Zv0EcBQNQbBvZdABmH3+oQsPCxm2EJgVj6ytIalek59sLg4cXgyAoV6
X-Gm-Gg: ATEYQzzHRZ5AGmXqg1xWxinadCUnPDppBeCyLfH0DrKAoOkh7fmnss/cEYfcdpFwkFC
	Zf/qrUVV2n6DnU3YplHt/QSk1r2ovqqJYKwM/spoLgCs7fpyxlaoRmWRon5KKkyUdzR0x6wuF4X
	CfB6dLZQSJFIZA8t/ZI2jo26rg5RT3u7YLZXtDngf5pFJUKYwS978Kgxb4ElCOhgyvZUaBWWK8f
	I7ilNy+ZkW0wfrDTIJb26LT7yxzT0tKDOyBODC8dWzxutRpunLv5rSDBb60GOsp84rw22EA84yV
	D7IO5sGC2DGv8xgQN24g8u8/2nMgNLrULfM9MDel8pGgj1xn8QrFFgzqXMuq2CCC3JtW2B0QCAK
	5R97jiF5GGcf+dOgbKDLfVlnqOaEnxyyhDReIyYT33H4v8UbA6qVglufhZpyPadZF/6Vm0lVzG/
	ZHaDUf0vnL7vtVYJamzBEn
X-Received: by 2002:a17:90b:278e:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359a69adc3dmr1844903a91.5.1772633655971;
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
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
Subject: [RFC v1 13/18] PCI: layerscape: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:56 +0530
Message-ID: <20260304140329.7089-14-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061416_925578_0BF944C5 
X-CRM114-Status: GOOD (  10.75  )
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
 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index a44b5c256d6e..43a28d9ea7b0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -410,6 +410,7 @@ static struct platform_driver ls_pcie_driver = {
 		.of_match_table = ls_pcie_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &ls_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(ls_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
