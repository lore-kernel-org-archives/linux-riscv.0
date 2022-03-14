Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E54C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MaF45oqg+8ZU68M5cK0i8E6SlYchJK7tQg1oAJhHRI=; b=SVCcck2unVh2bV
	VRy+b/Bxx018VtGHWpRXB5ouKiDNnKc/9IqNQJzIkCg9LNpMp2eUtYJ27xRiD1KsJHRsyNyupjHBJ
	/URXRfgwzXmYUcB4w4NcpU05D6m6ZLAK8SD5s4/mZU+otMwdzRPcirzc9PJ7f1ML0wbtaw8od0KhJ
	cRltqBEeTslu0OsSGHOQzUT1Pm0GLiDldPs1vY9n599P9vLpUdRnLEEBLDPrLMdlL/teXCZKOp7I/
	/zFbbegVej6xWNzj7sgFxFzydCvLYH+QpfCdVrz0MvaKYTgxwpQZsBuOl4/uWRtEUJ1hDpvcZM11M
	HnVZzA6Jo2V/4YTd4/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrTK-006oz6-EB; Mon, 14 Mar 2022 20:39:18 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrTI-006owy-7p
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 20:39:17 +0000
Received: by mail-qt1-x831.google.com with SMTP id f7so2020063qtk.1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgTLmxemvA5RpsS5hzlojOt5X/Q6y2vW3smx//7FUG4=;
 b=rI9ilCQoXDMPcdI5e3KE3tCaj9unCd0W8gFkj5TgK6hEXQM9EZu7PxpKTNyVmyhQP9
 pF1m+CpG/jYZ1Y5+QZ6CxGvHBQUW89QaBG0NVbWClNZL0lWMHYVb5Pcgsa4TAj0DdIK1
 M944/EYrj2VcJyt8FI3ZXqLQO4sNHcQX4h9ncniMhBqABXDWTxOpCqfzzlxcvg9IQFvJ
 TJkCKknbIvZeOKYF5RYNHgl1j8GsUBXjD0FYHTs0Zcl70XQ4zeTQMQ77dHNtocI1hDYJ
 oI4HaEgWRi6bS4Higi1553ea+9a983kbhmD+JIDWVQPiK5AqLcKquTGQ7n40+pk2fpXR
 9okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgTLmxemvA5RpsS5hzlojOt5X/Q6y2vW3smx//7FUG4=;
 b=AvU4D2s5g+eoF7pTusTR5oXbPF8uuolIq9ol3swWhi2M6LLMrruDi18NL1BGMrBoB3
 sr5sJCA262AqvFWRm6kP0M9SRPWKp0IOBDqkURBe8+V7VYJK7lK31lT7u96xb8Fcuq4T
 lodweMIX7gfsWfxyuqtPn2lXgEg3IbNCgV0FkNpU2t8drKXObqwDxabDlzxI/4xoU1Xr
 aEUqdKv/+myQ/bJ5F0xBaLsHAeLTZHIn56BBBEOwHY7LmOgjW83RajChkzOD0HwWt3X3
 WbBm6kOctBe0R1YP5p6n/Cw0g+5NH+V4UrteZ3Cm4oc+1oSSw0pYn3ud4wFy2V3DZCVP
 bb8w==
X-Gm-Message-State: AOAM533Ir82SmwPgY/Bc6Ju3CVjU1oeNp4mLn5ig95YiQA+QJPMRVu7u
 8nVkB2wP5NbNpGyYo0ryBgDl+A==
X-Google-Smtp-Source: ABdhPJw1s7/vVSEVbUrVNI0fNhrAihJJU4IfO00/Y3Ucz5pZvUI8ck5ViW9gRATQA9a0QOhDHWZeyw==
X-Received: by 2002:a05:622a:64a:b0:2e1:d8b4:c6a1 with SMTP id
 a10-20020a05622a064a00b002e1d8b4c6a1mr2944523qtb.0.1647290355232; 
 Mon, 14 Mar 2022 13:39:15 -0700 (PDT)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm8597023qkb.74.2022.03.14.13.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:39:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
Date: Mon, 14 Mar 2022 13:38:44 -0700
Message-Id: <20220314203845.832648-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314203845.832648-1-atishp@rivosinc.com>
References: <20220314203845.832648-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_133916_319628_942C08DC 
X-CRM114-Status: GOOD (  10.80  )
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

The isa string should begin with either rv64 or rv32. Otherwise, it is
an incorrect isa string. Currently, the string parsing continues even if
it doesnot begin with current XLEN.

Fix this by checking if it found "rv64" or "rv32" in the beginning.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3455fdfd680e..a43c08af5f4b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+		const char *temp;
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
+		temp = isa;
 #if IS_ENABLED(CONFIG_32BIT)
 		if (!strncmp(isa, "rv32", 4))
 			isa += 4;
@@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
 		if (!strncmp(isa, "rv64", 4))
 			isa += 4;
 #endif
+		/* The riscv,isa DT property must start with rv64 or rv32 */
+		if (temp == isa)
+			continue;
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
