Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB937C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wpvFwn7jZeab3FqSP/53O7w3KCzk/pNVwC2cABgVaI=; b=EHasqMb7FPUOze
	1FhVbS+f441lzIYFRI67Ai47ExNC/yVUbtS6HtnD20TkbPeENdr5gEKiapx1OAUhlm1ZQFtxQbHHB
	OFPWjysV1O8zicdASFXfxsS4T+2QlI3Ruo3QEvgdZ47qDcqpb7Bee6SIADMAgUZ/mxRt0MLGEJqv1
	67ITwj6wj7w5vznXNktvFMdGQizr0DeODZtQ7fVxbQZFUVxzJcGN0lYUvZsHtXekKtfwMSgLbSyY1
	XfHOejA/m8xrYGqL0s8K3/aXWhRPomYPK9MYmkuBLvzBDpHyMtu5N5fkpfumeIBx56c9oGnc551Sx
	vYtuk9JmntsptVZKgv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQJS-00FrGf-FF; Tue, 26 Apr 2022 18:53:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQJD-00Fr8H-B3
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 18:53:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d15so16635737plh.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KslgnjbYCZy+RC57ZlL0pYo5UT2utIjDNcmnyodLbb4=;
 b=mlb9fCc5rb7zG7mTZaJ0VEWPjisdXFLSvYf5s+ONK4bMBESNNjkC9LspUvLeDIH7qg
 KJWqNCNtmrDhGwSK8WWziE2vvMlKPHdrhOkxTNKqVrH4bzYAGPS3JOAcgn9uJq2U7GIc
 rqsSRnlpOfMuOq6EQMF6XQB3zL1qkroK77mrAmkPgolCGxAEvrggowjCIMTKALEz7O5L
 T0apibn7Lov23G7OW7GMaHKpIMQhO9kHaeUhCdh6NwztivMdV78PW8DemC/NYlrXYNCa
 Tbvw8tsT61VlPxpax/4JEuuCl543oeV9N3N8bh+s/UR7NZ4AcjNRTV5pmDrO2xmEU0Yu
 0vVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KslgnjbYCZy+RC57ZlL0pYo5UT2utIjDNcmnyodLbb4=;
 b=BlwYVEq8l/94vAmdYVt/hD5/Bt4ikZoFo/IYyiUY+a/dE1ipEiQ3kwVuRHkROOk/fk
 7LKRl+WsHtblDeIXyFCvbSGHlZB79g9xvjAsO24WUF0plV/QZYO6rJfMgtjChfdP0ZA+
 inOA7iFsFTR8bYaHfbNA6aLz6/uF3/zJ5tVxd7SqMUBGpPDXwGzo0I37ZFo7JGesD7/Z
 qDJdwSrJQOyUG7KNm3n67uRKx8nMS12o5k+ZRX8M2n7nN+H/+6bl/PFizBepaW+p9Yix
 O1UwTeA90aPugrOX1KQIWktAdjqxLqavj9U3JwJBZ2x1emkeYgbS0AqwVGW6ZMMBiB8W
 wAwA==
X-Gm-Message-State: AOAM530LIFEl2YI7z/rPsmfgmac00S0jmLbIdfHXlknojeGAdraw5tEe
 OPwbSuBudUkTD9IzNJD0U4aRcg==
X-Google-Smtp-Source: ABdhPJydAWW3DEffEILPWDD4OW996Ze0tqBY9UvoB/z8q/qtxrBuRCzG4CK+M8gIY/YrqzWEtsn8HQ==
X-Received: by 2002:a17:902:d645:b0:158:f267:83b1 with SMTP id
 y5-20020a170902d64500b00158f26783b1mr25064870plh.11.1650999190315; 
 Tue, 26 Apr 2022 11:53:10 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 cl18-20020a17090af69200b001cd4989ff5asm3839664pjb.33.2022.04.26.11.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:53:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/4] RISC-V: Enable sstc extension parsing from DT
Date: Tue, 26 Apr 2022 11:52:43 -0700
Message-Id: <20220426185245.281182-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426185245.281182-1-atishp@rivosinc.com>
References: <20220426185245.281182-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_115311_398137_3B6EC648 
X-CRM114-Status: GOOD (  10.73  )
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

The ISA extension framework now allows parsing any multi-letter
ISA extension.

Enable that for sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0734e42f74f2..25915eb60d61 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..ca0e4c0db17e 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -88,6 +88,7 @@ int riscv_of_parent_hartid(struct device_node *node)
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..a214537c22f1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -192,6 +192,7 @@ void __init riscv_fill_hwcap(void)
 				set_bit(*ext - 'a', this_isa);
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
