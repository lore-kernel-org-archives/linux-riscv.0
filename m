Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1F7EF8FE5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0sLo6/yDxpkqh+R+mjJTRsczQPy6zhKOFOD7+iRX2E=; b=UCPgjAPmCCbaA3
	fBVNh/e2BWJnBy2hvKQ0BoXvo/vKxUfrUwJSAKsFEQKCTxWXu+OQA6MFEdZbfZYfIvikcJEdjrn++
	cEQN/FNvLbbeFWVssikOHAyex3lJ2Thu5DpkXHlAonr2KiwIPanm+txso7+k45/NTHp+jZ12oC3/r
	thxTGXRy6X1iZ8xBUnq0fhaqNz/DtbMFUZGmof7HhYozGQeaCX6FkLmmEla6ufbljdEuhnEx4ijtv
	VFWUMu9bW5KwRMo7D8VkL2fCt4UwC6EVXHC5+gEcqPY4YZvZrAFK+4+BkQa66GEWhtOa+z8EjWlUs
	bI+3IuYwNqB30p+UXAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn16-0000000HMfN-06Du;
	Wed, 04 Mar 2026 14:16:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn14-0000000HMdt-0Rsb
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=; b=T8ODsr0uW588qlzjnO52pmQTb6
	FhgfzTlRrsVOlyNaoqcLFXYFIExobbVI5JSiAx7rA6PYQmFMCzXlXydyCde5aHGY5bkTt4mz+ejaM
	V/iS3hZ/skp5oOzi6Lc6HkKzeZ0ih8eIz2FYdXYzwhEFwfog3v1k4/WAw3jIYLVMKSS6Pbx2XGUe6
	EpAefeU4qi7tuE7LcTVl3TGcL3nouZp9hMNxxM7H9FFiUYwmzzEQF56x/ant5OF5UMhgurdWp48zN
	nORt88/aCvrv/UYie3lTX5TtybO98J1Dj7+Qej6b+og05eQD1I+JXoPW2rHHYgwpnepiY7Q9/N+LU
	yx4oCRXA==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn11-00000004jgQ-0t2E
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:15:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso1409798a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633753; x=1773238553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=cEdoUsu8lZZW9vUfHfLc54F2V+FXDqYUp7g6OomfEOdIit+Qz/0AMNqsgDlusHHUQk
         XqfERp9AAEwzZS9YQSeWxazFJT5q9A6HALtC9Xvv0CUC3BAlSQqIu9kLOlHTaLbMBcae
         Qr/tl8dH2Pq0hkRdQi9N5/qRj6bdjELNDwP9iHD+Cjqt4G09Ry95mZ0BvjX4voQAz1tU
         x1oJTO227eFjiGyCjUuzLO9eIIlffQXuxKcfFxUY0l58oW/zyOEwOHnUBD5tgFHYfEYs
         sktQ+hM74UoEUUg+dKmn7tdJ9X761OBfYA3ov2XLz/KSanCyANX+8P/vyhgkV11E0Q0Z
         jWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633753; x=1773238553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=eMkncG1oAZIyn5zyH5/lnSGtxNWqno2upJph6gZ3OYj9EtTqRH2G23Xu9vLzh95llv
         whdupYGVdDVsiAgHwQlHZRox12giOzE4ANWi04hJXDqUCnQCEL1rBHceoc66lCSBO9Sl
         F6mC+EpJ+V/C/77pmUhRqRL1vLM0Cx+sl9fI91NLxobr1XeQWqgw45cvQHovb7KItUnh
         KbAT+eHnFYs7B8pOv2apef5tC+iEf+XddfCPM0ZzT/O8uCI93Rnl1m4eaKmYNYcZmlrG
         2Trsffl+gAjn17qbacgkXMEBReflDUiXlh20kX9aftBu5UifWhsPL7fgyzRfHufeFNft
         XO2A==
X-Forwarded-Encrypted: i=1; AJvYcCWUffumWG6u91XwUkk6zPbJuS8DknjfzUdkZwnbhuoWLs0hVGZUrzMFap00pm7uCW1b65ygTIbo+F5vjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDh5KDjwjOuetvZh/2hFX8aVBj54QjKHgyz4GdgyfwA8l918UO
	fvhUktzwK14skF0hnbPvwXXifiL/UjXoWhzLvkfVW9GBXKemmmWHep4Q
X-Gm-Gg: ATEYQzz0PU5DHZE69Zbfkhj1GgIXuvDD6TE9n/FQbqgVe6hMxabBMZbZVtAZPp1eTwa
	lpm4IdosqtZBz6QCDBkHQ0g6foZf6sJnKjOwwHROsEZ48umWywm1fwjlaVx2QCWxl48MJKg4yfY
	DMJVqTuDYk3mYJteYiZ/QLMpXJ9T/GDugPhpERClB0h5YJJqGxjOAcKLQm71Kdm9DsMpknFpWvS
	BUMSBwFva90n8j8VtLNSWGuZl6flXkfjqnrgjUPO+9wN1kDr94M6zVnzivUHLgoqqNGsnzhTykt
	5uiGGYSfZH5biTbMZvNP17vPEGTPw8JJipNQZkPMJBRTMMBf0ZZVU8hIz8b3/ITkZkQ/wGhKM30
	TdAuG8iRQjcx1JU0qLmS1YCxBRhNFuGAaNCyR8Zui8ZBp7Z5SM/PwWtbqwLFQTzgtPZ/JJh4dFh
	NwrQarrzXYcWCdqPags7/M
X-Received: by 2002:a17:90b:3506:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-359a6a66b87mr2001714a91.24.1772633753114;
        Wed, 04 Mar 2026 06:15:53 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:52 -0800 (PST)
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
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 15/18] PCI: sophgo: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:58 +0530
Message-ID: <20260304140329.7089-16-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141555_304280_2B0688AF 
X-CRM114-Status: GOOD (  11.33  )
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
 drivers/pci/controller/dwc/pcie-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..0393f4b613de 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -269,6 +269,7 @@ static struct platform_driver sophgo_pcie_driver = {
 		.name = "sophgo-pcie",
 		.of_match_table = sophgo_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = sophgo_pcie_probe,
 };
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
