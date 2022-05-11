Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9C4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 20:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dcejteReCU4xL4JypncxKIGjxdfPuAnzJZe+IZh8dKY=; b=RsqvFRwYYiIpOz
	b+5V4iq3Fg/rW325/e29gyFmek2taGuTAC9MXeMh5RRUd/3zFFz/tLWOOb+BA86Rb4FsCyr8JKrlp
	ODjtMR4cvGSfKv2db8Jtf3AOjGJtoybrZQyTvz1xfwPNaHBD1mP1wemQYuNGgBagFLAJqchMNPG17
	isc163TTHEuOUurFQA3vulvz+4IqIIlc/aGiFNQS8J4ht9XvIuxHc3bPcGFT00I9KI5OFOyTk5vUk
	EZIWSC8j79kd2LdqFvCzarVoWd2saDNsp9e/g9/VDeatSFi0+4B9LoTjCzyUlymHlz69m4MJCrmop
	KP9E5HWYvrrRqvx2t2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nosg2-008To9-75; Wed, 11 May 2022 20:11:18 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nosfy-008TnY-NF
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 20:11:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id a11so2931320pff.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uHI42L1gavukyJJ1KaKxOCH5Tc7LTCJwrgzmo7gt+ic=;
 b=CEnMlJz8RXwI1S1rRNYUHG8Wa9Fd9wdk3GcqUX3T6ZUKNP1zj6Bmc1A+yJqZswX752
 RqFVwmq5HfEaZdJ4WhyLAsjibiPeAkeBU1i0NWItqFrCO4QR2sfXQ1YpkyqCz+HXemLv
 GH1RZhqVGNf11iQygLdb3UoSuoJSgpztZscPBUZhUsDPh6KAjL+8YaL6fo2CzZEXClrE
 P+F8ulhEdJrmMXuGqfHTt5MU27wE3NF+LSzQS2hvtyESprlM1nUt2KJt43fNzqKuF/YM
 fUhILt1tkCXbj6Nj1W4JBnSz2rULdW0pbRqTKw9ZOYXtOCM1Ef3/e1Ukq3rgVBHEBw1y
 ShMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uHI42L1gavukyJJ1KaKxOCH5Tc7LTCJwrgzmo7gt+ic=;
 b=O4Bh4hBqxEU2IgA5XxrV2cOKTLXKM/+xzK3Zz/VwWnwzduTvNPLa56JzYz5teOk7EA
 ABzUiZmiTrbCNcOWs5oJ2mOQhNms+114Gf4Asl3IOYY6Ta1z5FRrvM4R/lpXAGaJr7fG
 8OGcE3MfQh7np/xaq4GlLmMMRW1ur5eDLacqcjsQRLpjvih3z0tGL9afh4EKwKzUOwjg
 LEXsEVat3u7rJ4qSdnInBoHWT8DQTccHq3cJ6ZhsdZo/oID5Ru+pwNKOm+rw+eqIbyz7
 f43y6AZ/eMqqMAU9l19Sp4726ubwuJefoMFUDPDQJkpya58DLjd/6MPVUCF+H+pPr2vU
 YBDA==
X-Gm-Message-State: AOAM532ldpDRIpfNvVaCJ0o/dqFZjE50n+oaFQlFgrp034G8bSp+UrEs
 dUF9qtcKHYAluZBOZJsTzWBCNg==
X-Google-Smtp-Source: ABdhPJxZo3l4QSHHKIjLb5Kep83BUBaCLt4ROcFAozCa4OPaPAafueGKZdyhwYYs+u+RkiK76fP3Ug==
X-Received: by 2002:a63:6886:0:b0:3c5:11f4:f055 with SMTP id
 d128-20020a636886000000b003c511f4f055mr22407664pgc.44.1652299872589; 
 Wed, 11 May 2022 13:11:12 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a170902c2cd00b0015e8d4eb2e5sm2259005pla.303.2022.05.11.13.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 13:11:12 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] RISC-V: Fix counter restart during overflow for RV32
Date: Wed, 11 May 2022 13:11:06 -0700
Message-Id: <20220511201107.2311757-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_131114_986737_D1D5551A 
X-CRM114-Status: UNSURE (   9.20  )
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

Pass the upper half of the initial value of the counter correctly
for RV32.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index a1317a483512..24cea59612be 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -526,7 +526,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
-				  flag, init_val, 0, 0);
+				  flag, init_val, init_val >> 32, 0);
 		}
 		ctr_ovf_mask = ctr_ovf_mask >> 1;
 		idx++;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
