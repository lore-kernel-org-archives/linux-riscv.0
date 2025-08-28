Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B0CCA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 03:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wn/Wa1CqlKBBE1GMIZr29WRa3RZsRhYMBkw8hqWvIE=; b=QvC1Fll3dAYvZ8
	MJ+r1EwATzjklyF6/Mi6sKseB6HnBouPdRfAZcN9FQqLJYEt6f9JBZhsVihdP/GNHeoEbBaxSQHCs
	EUwhERVaagOhsyF+yuRZOOwmm6EfuS2/RRBoSIaw25rrLcOGEbngjbc9TyDlWtBVcixZ1PFGOHVSB
	9UXXZ0/r9L26+0M4l5lU9CvoNARjWY1S/ONJ33WDsb6hNG8Gx1jnLQzbBmPV5pAdBv2Y2aLuu91BL
	ch+8ZI8N8xS90In+PyXa4fkMfvAtnC1LqAb5/gH5CFbNvOxn2+upabYNcJ5ZyktkZouT7PSCxvRAG
	rPv1XwuLRwHUNcjG9GWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urTEg-0000000081g-45cV;
	Thu, 28 Aug 2025 03:23:38 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSDe-0000000Hau1-0SJB
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 02:18:31 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-61da7b78978so289720eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 19:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347509; x=1756952309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0G0wcA4QwYMRGmntWmLFL5l/S4VJ8/gFReFfYA7/kyM=;
        b=MJ6ZcrITaCEL6J7RM7y8Q8BSxdEpDcySV+tjZepkGllsJMbaKravC2KVNvJde9B6xF
         +3Fs/mzAZ6+bG8x7bf2gy077/bP73XOxEyCtNHRK9SbQkbz3Ju7NRHbH3YJr9L4peRY6
         wll6dZEkMu3Xs9589MWT/lAlfqX/pRvVrcL4ejR2Cigw72C6AefytvyvcM1564hy7J4v
         Iv+pWbXKI0C11QQ/6f1CpDzE8zUaFgu1zG4uy8nStyS4ilBAgbSc/DyZzuNTgSNtiv9x
         /OAIV9F/mJJcrMEskdQXAbr/MZZnBwZNGBYMopTsyEn/gaz6EenZZkgC0JGa6jJY6rkz
         ulaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347509; x=1756952309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0G0wcA4QwYMRGmntWmLFL5l/S4VJ8/gFReFfYA7/kyM=;
        b=EOVVhmz26MzLxZQFTLRBZJ7XRLZeqgNIAo2MsV8xyGbIGapwvElynU5dPn6vONkkLB
         KCJplhwp1cdMTcFenl7PjLbHrdPOW+TPlpb1KN2qRuMqLUVOV8wDJobWQWynG1ZSaeTw
         ORwiHp/RWvLe4d5L/mEwDEQESzwgJ0EmkXq/ivak0qN89ant2e+FPBOQfI1wjVXoBFsH
         4w3U1s6pe6MBlIBPMO5Ji0lgZkzwyLuGPoKi+NKj4ci/aocVGF4dc7c21y5mUddQGiFC
         pQhSRR48/aSSAsmQWB6fvXs5S8VoLt7EnTUULIx1U3uKQEuJjzRj6vLhzgWFU+4mR1rl
         wNgg==
X-Forwarded-Encrypted: i=1; AJvYcCUM3R9svR9Rx5lUDx4nu3SOB5yV+wHEWwJUVWI/5WLCokZL1n3IpV+MHgBVUZfAJFytErMdknhE2siXRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOuTWFB+c45tE1BelgqJ5MCsKhPnsnsyeVGwGEI/ThQ9X6PC86
	IENJUTtX8C5GWVUMHFmmFiIPFVVJPbnAiGtb20AbXiEwWzjVozu9lDL6
X-Gm-Gg: ASbGncswDGopCifaXh00qfEnCtOx3Fh3jMlOseyH2G4LklhT1TzjFKRLsv/x4ks2ZF/
	UINXAEo6dTUM2NWh8R35n7VBSroB1BsOnJ0xoLreYgT0niePumerQX6kpV8YcQVaD6xs6kj6Qf+
	8eWfJ6m9iLJA5NBMpFIOBgDw5lXuvoTQre3RhTHT2hnprTfG0dP4tDZHaZbJsmOMq+y1KGmn4m1
	fB17+OT6bmOZA/PaJfQ1c6rMUqK6lg/P/d7RP1PvbY0/xlJRcPPTk2kXorfuEYAe8NEMS4Gl9GW
	K+nBfefe4qJAS6m436tb2iP52lHVu60XQyiT0Uw0O9rsQcx3WYuM+38wGIlefdf72dABYkHMTeq
	5JzRvma9/VDiMxR0zp6JNBBnxqteH9tVoUzmHRW2RS1A=
X-Google-Smtp-Source: AGHT+IF/5cS+VdOAcxsOTaHXrHFbinFo1G+/jQXnldj08eaTRkfdS8GuJweSxJytLqtORzEjgcBxBQ==
X-Received: by 2002:a05:6808:690c:b0:40c:f220:67fd with SMTP id 5614622812f47-43785196da3mr10882798b6e.9.1756347509153;
        Wed, 27 Aug 2025 19:18:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7450e297684sm3494054a34.19.2025.08.27.19.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:18:28 -0700 (PDT)
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
	fengchun.li@sophgo.com
Subject: [PATCH 5/5] riscv: sophgo: dts: enable pcie for PioneerBox
Date: Thu, 28 Aug 2025 10:18:21 +0800
Message-Id: <3c2fef69e80a3e4dde47a9449b49f679211a0c2e.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_191830_149071_410E311F 
X-CRM114-Status: UNSURE (   7.89  )
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

Enable pcie controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1..6574d8e0b369 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -128,6 +128,18 @@ uart0-rx-pins {
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
 &sd {
 	pinctrl-0 = <&sd_cfg>;
 	pinctrl-names = "default";
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
