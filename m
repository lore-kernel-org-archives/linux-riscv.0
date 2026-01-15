Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DA8D3CCB2
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ux0Zv+CU70lgD95tmToEF5UxpqiWoQZkl2Xs5ERsq+c=; b=T7dxMysIiT5HWK
	DSm/r9c6kTvhFS5YJv2RArR5DYDHr5ynSXQbyPK7vMOT6Hh/cHV/b6o7mGcPi6hbZ13N+O7vmgIXQ
	eHMLEW/auerTulALLvtNLYk8wQlGGKxCcDw9yXWyAdVy7Wz5GmyyCtZ6ilSirmYwJlb4RJb/QxmBF
	ovR0fq5n/UVwMl8QfkNoEkmRqPY3lWoH/7M6KGVU4SAexgOP1u4v0lYaOTKMX7/s9J2hb3N6zJN0b
	mQVMsUM7oph+AZpGqyrsChBPLn5oouOwzh5pEEDcV7eu1zk23YMrVmeMLJrprjX6xIwdLJuXSgDxW
	vp2hGQdjB+7Sw6jzGQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHEN-0000000BtNO-411w;
	Thu, 15 Jan 2026 06:53:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHEJ-0000000BtLV-3Cps
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:53:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0d52768ccso3949865ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459995; x=1769064795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JN4w43030nBMnmCgDRIi09REyeuq/cQHIYBn+3h/zwU=;
        b=MusZ1qw6BfQPvzQdDjp0kAJIKKVuRLbxRvVGQOmPxtCUTfipAPMP+fXK7B+SDzsrMF
         qMNTqUpV9lJzIBt2bvaPSgYybLzShpubVCPHErsxXnN/xpT0uKYGq9Zd3E1EvKjz072k
         DIAI3TkwXIC37I5pbl02TNiD4/ccBDqKu+LGKPRsJA++S1PEcapXkGu1/bZiXGy5EcE1
         sm78z5CudZ3/hdMP5T1fBWF9NAr97FTYUyU8Jnt3YUTr8XO4K2Q2cYfG+O6ex2mLmfR2
         2IgQppDiEiqdzwumuuWNAnYArBL0tjLWFazYUT+9ifbmZISm9eYjI4waC+/ej2NfiPit
         7s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459995; x=1769064795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JN4w43030nBMnmCgDRIi09REyeuq/cQHIYBn+3h/zwU=;
        b=rs41vaZKMXWcEoicaFHHrels2gsifU1COfE1zUm59e0OUH6HZDyyzLEP0Z1jSs+Zgh
         7J9gQukoLvHC2lqmnojU4xszUteUREhS8SbwF09mWEan9rxsHfR2BxWoHpD7vivWwD2Z
         1PJf5Tt+VYAGhmghhtEVL+9qwmWAxxawnxkykGTb1m77iH73PM9JE70kuHjLjYyxJUtG
         z58tskCIwTorKSZHMlDKTWRWaJP3gOsrgPMOZi26nXuGWvaLpKjWD1pz58DjMtSpCD6n
         flNsFGZ44j7khPVLDSQ6jgZPjHRYYtvdTmeRr/iAKa7V2CbRd/ThszOEhUDr8uRe6fvJ
         o4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXTTOIidNBUX7w6PLpEHQKPngDVM3qQqxlmKz5CLuyi7kxvXojdONzl4iMUoNvTu0rkH8w/ep/PyP3VGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8wPxCuo4tSZoW/tQz8QL/Hmf9Jyb12uoQeSgXsjEFlUTUiIW
	T6y4FgkIdH7x4SUfvMR3+k//ndUDx2LlYBDMt8b9cSFMDEt1YAbgB+mh35HwDt/Rj8U=
X-Gm-Gg: AY/fxX4S8SVLXK8TuSakBdt5Px0NayJWLWchakDNjiNcNqsao8qS7Lubbfs/OSQTJR8
	3bq9uuuusONSSCbxhnuo/Mng6Eo7kM0De1oxBn+t09kyqXIeTvvNor8siYwhxaKPTIVZmJ4hLnL
	s89Vsu+w6f+X1FIiQXv3FbEG+hm6L3jRobzy5vcjKPGFdUTmj/RRddjunwf2COOKvWYhVQEY0PU
	LQgyn3KQZmuqw0gDdZWwcnBq0ZuaAPe8zoJSXfooeQWf86CcXce5V0L4XervhAMR8OMhQxjGbG5
	shdOe9y++F5pwtlX9f0+cITugpuG1pguOy1jCo6myOy5hIzucHvzlEJW0dVs1MquIbqpHgzLg60
	q6A0o8a/+IlpEcEAT6DJc95222ykYeXYbXfHXK0gSK+SKrwFjgeMMpoj3aKr6qPhX4Sp7oaId9L
	RRn3eemPxPcONtAOurJTt+tcYL8jF7kLCM42Cpv6Hptt8D7l/PJ9Qn4w==
X-Received: by 2002:a17:902:e94c:b0:2a0:c5b6:67de with SMTP id d9443c01a7336-2a59bc43586mr44946485ad.52.1768459994844;
        Wed, 14 Jan 2026 22:53:14 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:53:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:46 +0800
Subject: [PATCH v5 7/7] riscv: dts: spacemit: add K3 Pico-ITX board support
MIME-Version: 1.0
Message-Id: <20260115-k3-basic-dt-v5-7-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_225315_809244_5AD46567 
X-CRM114-Status: GOOD (  12.83  )
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

K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
K3 SoC.

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: Update the commit message subject per Yixun's suggestion.
    Remove the unused aliases.
    Update the copyright year to 2026.
v4: No change.
v3: No change.
v2: Add aliases node in this board DT.
    Update the memory node to reflect the hardware truth. Address
     starts at 0x100000000 (4G) boundary.
---
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 29 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1..7e2b87702571 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 000000000000..b691304d4b74
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
+ */
+
+#include "k3.dtsi"
+
+/ {
+	model = "SpacemiT K3 Pico-ITX";
+	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
