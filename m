Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30196EF8FEB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuYIMUAPfRZ2gkfEn2bA0kLXvt2Or5eQ53DleHXwO+4=; b=qgtO3bAY0fpkuS
	nM6dqyJVEzbrWJQoqUt41g6i40MHTCTne8nULU8yIDHU6GjR8pH8FHClV2RcwLvq9LRd+j78AvRJd
	ni2GbLpP2cHH+DV30NVPyfYG/pyek5gycs2A9DvDP1u18G0dkIQ9fl7VO7iTvSWykj11ns81fWGxO
	/VKhtfpZb7+LFmVNE4ZLUMqI5fevRDWDbGb9lIexInNBPAGixS8ZoNeLDODApw2zJ6hOXwWte00gg
	VDMRw3pH+J6p1EUcY5+N2Ali6j0jkUzPmRFqCs2hN4tAAknE2g7tMLHfzc0NbDr12789OA6Gzj4WP
	jLj788Qxtj+fRVMv5TEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmx8-0000000HLhn-1z2C;
	Wed, 04 Mar 2026 14:11:54 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmx5-0000000HLgI-39op
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:11:52 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2070271a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633511; x=1773238311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=NdaVw8oO9/2cSGpDRogqHKc1iaRojaFxJluk7ZXvPxFYrPynjJd0wCq//h+EpGQdqS
         ybgl2+dgszVmH3ThDkWDPyqsgxUniEYYNFFDzsqE/Xw51BeuHDqGQDsbHz/J191Ze+S0
         NBAeZzddszo4l0bm4e5DubokncJ42Gg6qBFzLXiZJGxIAIQf/8XPwLTxR0r9tvx7jdNv
         WoWWMB7I7F2GRcLYdxWsNwnvclut+6WlZAeQXashhqsYqqSrrxIHRcQV2vkbhtVC7Oyw
         GBxo2QothNW/mqByL1gnPAVcPjpFY5cJvT528l9+YQo1Eq07xRMojGSTHnG1viuy9E+p
         z0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633511; x=1773238311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=UFSenNVzhQe1BcYs6X7RMLnpJ7zYXtFkyYpXxvm7zSb7rOM/QT26SlVaqGlj/INgyX
         WBUrFH8dzPOS3XsIAXAjAqIxTOoCT51ezvxX4ngiGixw61Ddfq5rXTX1032BKQMjI987
         eNuicuHWJZHh0hf4gY2edGiHXekP0NTqBecuFrAiDiLAO7rq0m1XFJ2F7Tla2oBJBcMF
         EXdIO8AqM4gKjbg5tWuQCjqXzxp4eQLhOsxvPEcvQ9tMyN5YR7rqMAXaisaOcjO06vPl
         DiI1tRR1YULvbw4vQ/ePUbgA+5MeED4NZg2GA9MuqEZajOWg5d18vsKUoXhduEvwa98F
         dyjw==
X-Forwarded-Encrypted: i=1; AJvYcCXVsfntLhiSDC8zSN1owJxDru9izZNRgy2+HtE+5l/OytpAPid4eqrL8c4etNcWENAO0JQyY1J2SySAPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3JZWmTD8UGPaaQcLfjEqUDpwP/grhq4EdmfIF5aQ/uL1vLXb
	o4jubhP0mi+TVEYZy5/TiPfwdVyftgKUWoxXvOh2PmyD0rSl0UpnURit
X-Gm-Gg: ATEYQzxsLo9M2CN97J+7o1jv0IxfgTQNfVnStGAm5aGsWPzVwcMJHkkaAeoClPIq+e9
	tkysdr6ngTuoKTDfCMltoMcdZCBSnEDHe/YfdgXJBJloTX+FP5CEL/xtHklpEb6msV+E4n5pZlv
	q7P4gieLJsb5dURXWxPMottWivsoPToD2R6/+m+NeKAWv68K1ILWBzhujaGVzJr0QUia8PcMsJl
	XHlJjys6jQdyZzjQXmbYIU30Cu8QtwfdYMrydGNGaaDEcwd+r6jtpwvhAhaut9ymTcz3mQEz2Xw
	2BO5p/2YAvm8nidkNdzVi79ciHxMcwUeoysCKrtl7kv6HlVOVWT9DKxT6xUCSEe34bU0NjYXUzk
	klIP5MyCGRznbuaabyGg9uN+dHwlTMRd+IotRyGg1TSETlC3L7xz2sn47an28+0tABCM62vOPkk
	btqG+sgTNkUfFLjrCIDXIBS9gLHP40XpE=
X-Received: by 2002:a17:90b:4e84:b0:359:7eb:d91d with SMTP id 98e67ed59e1d1-359a6a575e7mr2125758a91.26.1772633510992;
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 10/18] PCI: keystone: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:53 +0530
Message-ID: <20260304140329.7089-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061151_787031_11BD273A 
X-CRM114-Status: GOOD (  11.27  )
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
 drivers/pci/controller/dwc/pci-keystone.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..b5c0c690593e 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1351,6 +1351,7 @@ static struct platform_driver ks_pcie_driver = {
 	.driver = {
 		.name	= "keystone-pcie",
 		.of_match_table = ks_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
