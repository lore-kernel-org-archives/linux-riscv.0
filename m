Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F38E7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbJLVFld6Cg+IpVC8qH0urUznxdFcjuoppXmx/utw00=; b=h6LTrwpC0esjLS
	A5vapNwF8ituURaw7GGanEGPCy9r6/37ZjFLSWnR+fRPIh3PN3dXT3i9VC+kmVzL8466AN0tIiyCi
	OAiLYXj9oPQrQPMWf9AtVk0HOE+hU/bCLcqIgGkshMd85nT/MHb9IeyqwQfnIZP1y8ROrNuJiFA6R
	ALYo+7MXxPzErM2fc6NCMKb+xip/2+1aMDjaX/wV80fKjJVvXbH5OeksK4qToEhX0jtkHjjHSPGTw
	mbGZtxooro6DQp7XTp4npTZsOUHnLx5O8OMkRIYfZuDvO4cJg9PMivO5+ajUCNlDyffA1DsKfAT8O
	gwhX7bqCnKpXdC3WV+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo41C-000O3L-1j;
	Wed, 04 Oct 2023 15:42:34 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo41A-000O2i-06
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:42:33 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6bd04558784so1602341a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434151; x=1697038951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tD24LkujqQMbRRxB8/xrA8at3l30kwtwxAWKzy7MPw4=;
        b=OCbY/gStzJaI8BbgTIiQq09GXbIKWeeTILm+TvPrmYhr1ljlebmRHoG6p3xMbvkNxq
         9OUXSPqFNfTwKRlofDWE7PcrouLjSqwFaGvdvAlecBMX42OMjSLRyIRCLdib6miSRN08
         Jgsy1VdHZYbf0ZVAZ+dLDXfu7diJcCZwl3tRiBomJFeomO7vSsJ28YOwNlnM6aY5kyph
         TZA8m7sXQeIDQvDrouJeDy8T2A8J3EEkvizTmsm69HXfJcNn9NQH91k+GpG4HTC6jhFj
         5DpNQxkHlh7fi+sOWlMyrk1bi/533VQL6RhYrI3kd6DHckpBplgb9UZtCFNRM6zhs+40
         n8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434151; x=1697038951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tD24LkujqQMbRRxB8/xrA8at3l30kwtwxAWKzy7MPw4=;
        b=kHlnCl51XgV5ZYPgj4wDcD5DG4rdreZSg040r1V5XUabKKimFOFsqIiyEMO8YFwnf6
         gTwEfQmqa4CDSJm80N9iOQdNodP3qS0EsV6j3vPQ5fXhBfJjrq7l90RXBQBx0VDwNq1p
         IPwbPWEnrIUNQfDWBvpWSr6CKU1VYEMhw72V+m4qeYIzXclTvg47b39kLYVmBxqGGZzq
         LFkfBSETJKBniX5XexlWEIheGzy+wnYBy5R5InVDXB04jV/lKTy5uLWb+x4Tbv1sv79v
         BNTp757hqXwfgVyJIM/6UwdklY2MIXSrXyoMfyKof9IzDnplCsLzth96q7t+uBYHyGa0
         1AcA==
X-Gm-Message-State: AOJu0YwGDyIg2ledVnYOL3XCAMFufB1liVgu8E/dcK970VC04mC98XRA
	VrbibDP5A55mEJyTdW+Ib34=
X-Google-Smtp-Source: AGHT+IHiVCdVEpqi7jlc0CA8t+7KoZMRtaA+COKsbNFkbWk5l/6KEeiWVzvpQZZ9dEIXCy3vm2pBew==
X-Received: by 2002:a05:6870:f708:b0:1d5:bda7:130e with SMTP id ej8-20020a056870f70800b001d5bda7130emr2754434oab.18.1696434151284;
        Wed, 04 Oct 2023 08:42:31 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id n9-20020a0568301e8900b006b954f7f422sm486778otr.6.2023.10.04.08.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:42:31 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 04/10] dt-bindings: riscv: Add T-HEAD C920 compatibles
Date: Wed,  4 Oct 2023 23:42:23 +0800
Message-Id: <bd63ede60c5757af3d15a13d1259fc91589325ec.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084232_070794_ADED64CF 
X-CRM114-Status: UNSURE (   8.54  )
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

The C920 is RISC-V CPU cores from T-HEAD Semiconductor.
Notably, the C920 core is used in the SOPHGO's SG2042 SoC.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 38c0b5213736..185a0191bad6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74-mc
               - thead,c906
               - thead,c910
+              - thead,c920
           - const: riscv
       - items:
           - enum:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
