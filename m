Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36203C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gbpfkZFWrmBjM4YzzLJ1aW+d4fLyH++6aH28FWimP4I=; b=KU2/a1DaotWlMZ
	FRHN7PlymJw5bjvaWSec6MG8PJX73XJbfMIGaXWfzWLMEZo3CfSA3nEwl/fL5W+FbYOUzSffIABM1
	ktKMbFjEJwy1lphS0t9JxxevPjstggtvtgATjU1kFsyEm3xUOW7/ZVnFwzVtByqppdNtiQBOjArYQ
	oUMA1bWn+a0B+lCWLnV2Edv9fmdq/reguSPIF8iXTVemYPiIGiMNhWrTW5Cr0GaY4yxqebsaPIPw7
	cXd5KRfVDzQz9Dkis7ZQROx1sFd67s1SdEIwpaMGHQpl9matNQa6z0uvZKmaurteDyjlhvT7ProqC
	u/jLcL1oG2AzYrzjXD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrP7-00GmHt-2S;
	Thu, 11 Jan 2024 09:31:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrP5-00GmG4-0e
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 09:31:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d54b765414so28360525ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 01:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704965467; x=1705570267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0u2ZqaYTukKS/ErfsgIWqLBT0BekDb7tY/EUWordXcQ=;
        b=Y3DqP8tF7XO9oSaw0i+VHR+w3QeQhHqxHWtJBWo+OauZ/t6fdxFOlco9sO0T/+heEH
         /uOIsUgHGu0/siL6Qe38d2FytNSq8Tcin4qg8VWhuxv1OF9n6jgdX2duJjE8LeUpXxG/
         u7v6LbgVknhMGVrgjU8+baW20xk7Uzyc7NKYo70wFfs55WNMiWV40m1NeromcEEpVhIX
         GONhreDl0vqBFV235kzgEb5Nkz63elESE8me6B5pAgXsx9GaEQyhZ2+U9gfqgU1xQ0Kf
         5irJq25vEgw1LGBjpOWFmoqMx3iBrIbfepi7lwfIixaaAd8kSl60LDd+R0IEz7a8kxSv
         DbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704965467; x=1705570267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0u2ZqaYTukKS/ErfsgIWqLBT0BekDb7tY/EUWordXcQ=;
        b=BI2BXiHNFuox5cP0q541x0Pi4tErhZo4wW/aEWzl2d7pPCGQ28M+xxLBTBFPlLBkEo
         3wMwZwrixzk9syPSX8Xcmaj5uFoanixx917sDAfOQE1eT9o+0DWyU3duXQK1fVjfDRJf
         Bz5JrR0ImPK6p+/Ocdd/am8wPP4oDOU+XDO9bYkoOZ2eFyvqtK4u3DlcV/8NAgBa1Vn0
         WmJilD43fYOVNwNaCl9hd6SbhmeusEyoFj3/8YLgdl149uPAduECxXsGltfNDyc2Whmy
         hiXT0Z0HqMgSpXUWhDdESkhbRzfmw9xLSsC8smKvZz9POgSLUjwVDsRhQQgVcL7UN4m/
         Fosw==
X-Gm-Message-State: AOJu0YxlLNF0nUStoKqkL4rCiq6WeyyvuOr7JcOG2MhAnjWpTQrV4BVD
	GFCBxiNdr/jh9EqqDeevheGZNnu1HQTmyQ==
X-Google-Smtp-Source: AGHT+IFdmA3NHb1ER4UFaUxR1jSr/olfCSoHwNY32G7qcH3iYgX8OKA4O85XbeUboGgxDYYmHv1L3Q==
X-Received: by 2002:a17:902:bb16:b0:1d4:e208:9b0 with SMTP id im22-20020a170902bb1600b001d4e20809b0mr880703plb.44.1704965466610;
        Thu, 11 Jan 2024 01:31:06 -0800 (PST)
Received: from sunil-laptop.. ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id jd2-20020a170903260200b001d4a7cf0673sm730566plb.117.2024.01.11.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 01:31:06 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next 0/2] RISC-V: ACPI: Add LPI support
Date: Thu, 11 Jan 2024 15:00:56 +0530
Message-Id: <20240111093058.121838-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_013111_240787_EFFDB972 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for Low Power Idle (LPI) on ACPI based
platforms. 

LPI is described in the ACPI spec [1]. RISC-V FFH spec required to
enable this is available at [2].

[1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#lpi-low-power-idle-states 
[2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v/riscv-ffh.pdf

Sunil V L (2):
  ACPI: Enable ACPI_PROCESSOR for RISC-V
  cpuidle: RISC-V: Add ACPI LPI support

 drivers/acpi/Kconfig                |  2 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c | 78 +++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
