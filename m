Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0380C021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 05:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3JKRgPrniwYe7JQ6sa1SJLwbbYm901Cce1wq4WdSh4=; b=q3LbWAsEM1VqWD
	v5/Q7v9fEtCuMA1KsnLMRnqwCBhMlMEh6yHs9mEB5IbYfNqaUyDn9dL3q7SBsBjhLtHP4R7KLmglF
	DWU+5RClkbYlPm4bsOGQdI9DGrwjGId+YKhniFrzQ91O5u3MczQaT2EX1HLoS6iocRW8X6D3aWw8C
	ilbQw/hwlD4pAaFRshLFO/rqu/7cRIqPR2V7aoBDF5ie2ls/Em6AqdtFWmfNxQPS2ADJp8EIPIYZN
	zIcDLdc92BtUUwvB1Z9Yloffkd6YUq3K82jHEMMCjKOg5tJzUL5yLQnEKnqQBLxYw4C7FvqdA1kF1
	kXjC/vDKcA97lt0bmG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLw3-00000004HVL-2fGt;
	Fri, 21 Feb 2025 05:50:51 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLw1-00000004HUV-2qgE
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 05:50:50 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5fcf21d7235so635416eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 21:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740117049; x=1740721849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHGavz6z1XAW16p7P/7q7QGD5LUvtpVWO2vRaC4bQT4=;
        b=jr3WI7HGB1FHKagxJYUfbJaNcPDcfzwLF9ixK01XLhNFuGx2/JOTfkRVagOVhdnHTS
         JmuGAkNBZzJYawb9Ldm+vK678dgqQHvkHQIpaeRtd82L98zwskSwFR1y8lNKIliF1UiO
         cTMKe94SdP5m6SWOChw1IFJuXqCjMhpxRt88qDPRr9WW+TrOPU0IR4HW9BpZKza2Bhrz
         Usi6gHLLVeKCMYABc/cbKMkCzdn3yQo8v3HaSTABZ87CP3vAFigRg40VheAzFJskfGoY
         ezDc2pHfLoTF454eH9QX85dIxM5e1LUbmOJqlnEkZAiNd6t3FqquIdu2e56+UroGatva
         jtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740117049; x=1740721849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHGavz6z1XAW16p7P/7q7QGD5LUvtpVWO2vRaC4bQT4=;
        b=lBT02mJ4E4keaMDauxIRtF739wAwi/LhwpSrQXuy3Ufi7fLcj0NLZZqdtorbtYLlyO
         bSjIaRn6nRPXp+JcWZ0XvHjgoy9DGOgU1c/Bhhok452iXQGDoPIqalBZ5lhaFsFQTG09
         Al0wrV1mtYEh03sW58TApV2+K7XXs3G6FdmBovj5DhH8IC102pIYwT6XRk58drEG6N7h
         nMGj1Mqd9KnZKaBynkaj9/sN4+qS43l++Ixw1vmSeGuqmSwELrZuQfN68YZxyn5vW+ji
         6CUZAWHGDSrIfOKlt+uhDUIB2Cr8iUgBx0UMq9hKHX5b4dlUmQarA6JKgpJ4vts/esIc
         yjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEXk0OCbd+W9sczHz/DY+ZXtlka6OtRq/IlVhf58cj4oTM3Cvmuv9k+MgPQ4xupGV5/a4Hv8vOaKwc0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfYuNG3hkGY9EsLyhXxVCN5RI8nhgKn4duyytVO5k0Z3c/IzVz
	z/Tf0LSHKT1rHErqUMPg5+UtR0M7WA7BvnXNdm1qZ/YwUfJNnfmE
X-Gm-Gg: ASbGncvXuKVHZqe155QVluP4S+ban6BkFqTJBQWFHGe8WXmGbr54Ypdwoi9TsNggKh8
	4LJAXLtoor60djWB3LaWgy9MlzyYiwPmiKJCxuHJvJI6CZFPhkKykTYgOCz9wYvL1Q0K0O6NCxg
	5YPKe5njvJMGCCx4xp8pNK+0L8vJUbji3bAqPQLCPpvPnUAlO045l0PAxWGOL9RrSqe3X1ZeBrj
	pKkfr3cB+iZ3VJKBgWFqkp/2ubmPny1UHccjglrMI5C1udGE7onJfrmH7NXEWA5zzpGs2gSlwtj
	7xvUNb/xL0txxql+HZJsuUGHysTkiUC8V0TH
X-Google-Smtp-Source: AGHT+IFwikgEbJWrEyp4vrUx8cx9RHZSejrAnFnvwxrUiLhFl9PU70edm1tzNRG0rhEUOQ1UVD5Lig==
X-Received: by 2002:a05:6820:8cc:b0:5fc:f9b4:7f49 with SMTP id 006d021491bc7-5fd1a9ab7e8mr984921eaf.5.1740117048687;
        Thu, 20 Feb 2025 21:50:48 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcdca274ecsm2553301eaf.0.2025.02.20.21.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:50:47 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v4 3/3] riscv: sophgo: dts: add msi controller for SG2042
Date: Fri, 21 Feb 2025 13:50:38 +0800
Message-Id: <9706541bcb87fca5331a085dc8e5f9a921ed5918.1740116190.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1740116190.git.unicorn_wang@outlook.com>
References: <cover.1740116190.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_215049_740384_29666F40 
X-CRM114-Status: UNSURE (   8.76  )
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

Add msi-controller node to dts for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..fef2a0e0f7a3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -173,6 +173,16 @@ pllclk: clock-controller@70300100c0 {
 			#clock-cells = <1>;
 		};
 
+		msi: msi-controller@7030010304 {
+			compatible = "sophgo,sg2042-msi";
+			reg = <0x70 0x30010304 0x0 0x4>,
+			      <0x70 0x30010300 0x0 0x4>;
+			reg-names = "clr", "doorbell";
+			msi-controller;
+			#msi-cells = <0>;
+			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+		};
+
 		rpgate: clock-controller@7030010368 {
 			compatible = "sophgo,sg2042-rpgate";
 			reg = <0x70 0x30010368 0x0 0x98>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
