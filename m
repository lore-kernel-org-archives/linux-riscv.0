Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000B8D5B171
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 22:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxlbrqQYMBOkF357ZGIAfNO2arS8z9h4cvhdZrDO0BE=; b=ZuLQTR/cFZmlF8
	2gWbpRhcyuZEOKILKuOLgeF8saoTrUC9fCBl3dQ+BJnqhS+8mxmzmZRzKgECcL7u9kwYBQxBxdvh2
	G8vfzObQee5v8UyhzGijXo5QH9cGqlBACupE9hGmekiO7tXxqIOTbvfAaiyzPOYe8+3cEhfHmdsyl
	SDEG/8uGLxmWRXBFbbC7BjpQ2zEy9vrXNeuSHVekencVh5+UNpNOV9/8eV8eZTp4FhnElsfQsdwN6
	nxtIXnfmvYUHWu9UmTCjX8H39fwT9Fmw9vSlOHL4Hct39pbFvuYeVVcfEpzym2E0m0Ud/bqvJA5KX
	rTAKpSDn28uHICCc+H4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUus4-00000002oGC-2VfA;
	Sun, 14 Dec 2025 22:47:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUurz-00000002oFL-1yxy
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 22:47:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0bb2f093aso7731835ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 14:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752434; x=1766357234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=XEDUZYJO6I2RTxkKxds/H+VhpQMBxwe3yrpWWoJUVDSFykLMIO4ths+hm3hWB9JZEA
         tzc8+1v1FkxGLwOp6Who5bW9H+lJndAwOFlIhe63u6unqzUYapfAmmLJkqr4lS7bN+kH
         jlCn6Dj5nOwkSeC9UuwuVSKp7DMCavyUE3XIo3fb84g5FpQY7om45xiSaHg7MfzjId/R
         v95D/GV6UVzTkQDA0U+Tfv+k9u3SnpOWG1c918zWkAJtpbek7wCFnRLTXdCD2WZKVoit
         f1n7CBfKcp6ktJEn2O2QJUiJATpMwzR54aHTY8nxKuoMVWQVISGdrzXY7aJd7oiQbdzC
         gcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752434; x=1766357234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=Fx2v3/ntqI1Vw1NQqxkWsclrckMA4gkR9thatQqH1T7Z0XCKOV5T+9w8PCiWKWc3vl
         vkV9PCNAFS2hmHj3rmFb23VQ523YoxVmDxflmnX5vbSZZiTFMUASazT3bQF2MdzXeA36
         K5f50LIfRL9vK+8NBuxHEYC4QKEMHlzUmDuvID+YkuOwXNAjpJ/iIp2NSD4CrZsfNt/6
         NmXeVkk8qpHtr89DguAhnMmYNUAMt0G4Vn9MmqBXoK+m6j2oUikWrgGWUWiosyNvb/FH
         RrYZ0QaunWbvvr5fejvj7AEsF4cXAE835JXz6zCYbX9oTBN8kgh0r1C0H5N3QLX6eEVf
         akrw==
X-Forwarded-Encrypted: i=1; AJvYcCV4bXzCo7Al876TgxMFGeswwhKalLlU/Jza/VC5RqAwikfESwvEsRnLu9WWociMpah3dx8aIJ9LAiCg3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeez492z0SldFbfvntuyEyfXTssLzdO1gqBDmlj2ebnUW7BwPu
	zJ4soE/U2zzmZJPXEnnjQXJOyoYF1m1jXe2h1L9uxm0DM/RVZLSCEq8i
X-Gm-Gg: AY/fxX5BnWEK6oe5j5TWiCUMe7iKxhpcIaP+kR5euCWUuE7am/b2xNL7yhxFt7icbJ+
	pg0dqaFO5LO6amPjo88002F3p5eoQAPhHrvQV3fdOz2+zvYXbqlIGX+DiRRzy1pC8SAiEXzWIOF
	j3WxyOieg5x50NLsuVYDyNyADQ1dyO7OHn8fMmHWGyGywtzH5X2l0Uv9LKDfdxydBC5moJ8qL4I
	NdZPfLZPhfH6o9LUzRBCmaQZT6r6JaQyn3BBxtiAI0E7Gv34dbPILsmvrY7dpYF0/64xWyuBNOl
	QVtDrfPiFZWjMlB3SjJrcqT8g9ggt01hNm4rHs1UZ7AZ0TzRAC+D7l0HvCWUgz+qsGV4mGRaM/s
	RLj0slLzuTAw09s3pUtmYwlZbxRvQrKXlWMR3rl/JB4SWgGGShjWDq6t5a0hVNI5DSrUEdvNd/T
	q7CDW3n34kdg==
X-Google-Smtp-Source: AGHT+IHY+I6N505J8tBBxCiWTM4hXbMHovgZ3qawJ/YmUXRO/axk7y7nKaNrWFiQXdKScyMIfR120Q==
X-Received: by 2002:a05:7022:6184:b0:11b:8f3a:3e07 with SMTP id a92af1059eb24-11f34bee60emr7877296c88.11.1765752434409;
        Sun, 14 Dec 2025 14:47:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm39963363c88.11.2025.12.14.14.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Mon, 15 Dec 2025 06:46:00 +0800
Message-ID: <20251214224601.598358-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
References: <20251214224601.598358-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_144715_507486_20210116 
X-CRM114-Status: GOOD (  10.74  )
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

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 1b2b1969a648..e1b515b46466 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
