Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA66C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6mAJZYQnbSuvi32ol2bG4TOyGqS30h/kgFbx8EqLdxM=; b=q8HNIYcudLtIdU
	IJfAOjAhQDi5RuDAzmSxid0IYOEVFb5jtq44vfHaKKD7O80RUZhqViUEn/408f6MoBvAVbLBvq+tn
	cHNqLEr7N6bPbd2t1OpakFn3rw9Xz1r+ObPK5EtVik4cZVFgrmmLas3C1q5VdUcc8JihkRVhH2Adc
	7QYnideXF+aaC59dm7DOf8FC0i+k8aBpXDqvKghoVrgccEVaKSXmXtRYrQRI2RqGatvsldmpvbJnX
	GEJJgkQLEsZcnqeazUoP8D4Bnkp0i180ZlLOQCOgtyVSycL6pc6CzU0tIcKoaR29fdcOqbKjd54ly
	GktzGkdUNP8oyG5BKYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNvbI-004RTz-0O;
	Mon, 24 Jul 2023 13:27:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNvbF-004RT9-1s
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 13:27:46 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-666e916b880so2440984b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690205262; x=1690810062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qe1WWOmOhwyGNUK/umivfemB/L6/ebTKyDycVpoI8eA=;
        b=YvdR+gZs+SBsvKp4JTeP+13nxYLoph3fZCusDTczzhYiUglTAz7SFT+bHHRkd5+Td3
         ouzaPB0MR9DMa5loZdmBYZv9OibL6SwWIJa0MzhT+AxqYV7VyMVsAaicBYX9nnxeVJFJ
         iud19b4IDh2b8VZJeThqo5Oj3+jUTtApVYjaQjskOp0mr53NjyuPXIz/NMClJk5U4eNv
         Q64iD2vHftwJ6+T0aFhNRrYBex2e8ehfQbtt1ZqINvfOGV/d5UGH5Lh7eRCvl8Mz2PWN
         lBiuR9RfxcITiPuBFD94tkk3NJjKej5jHaZpACo6ZuD6thAGgjgRDhyqky7mv/f5u3vt
         CTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690205262; x=1690810062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe1WWOmOhwyGNUK/umivfemB/L6/ebTKyDycVpoI8eA=;
        b=KQe1aj+7fPAxFB+9ldvy9+5M7e3hN4upaeQ7ZpajDVirZSjfnoklPNhfMfXaMyO6zP
         Lf02Tjxkm3iV5kYgkHHfrzAUHmmd9Bpu8kvDWThSYWFYvy58Iu4/BOj7oEmPC57qBAn+
         wjchVZnxV3xtULxOChUM2/ptqCvvFT9IZ1Iccyz5GE760ZRh3jtmojoQXNc+CX2CD39U
         D3LOEXLBk8FM0ZHbfZi1ezWBLV/xFZaoj8kdvVsQtYZcVATCrEs/HMk3wf7hlXUKkzD8
         3w4ms2jY3x/MGzLRo+WrsroQfe2TQ+5azEUJtVXDZxf6aNP32k4UvJMAyoaoYVBY0ph2
         Subg==
X-Gm-Message-State: ABy/qLbbQQF7/I2d8HXynjJarRgvET2Ewak9Q4FcN6YZBITTDT+1pYOy
	7l5bSF+hFyfnh2A/5Ay26sWj14LBhl/zCUMnCdU=
X-Google-Smtp-Source: APBJJlHgTYF3JtTeWGHx5BDlx5lH37dxbu8R1gftf3UNN0LgQ/rlyAJO2eA4MU2Gx7mXCMB+EtCQIA==
X-Received: by 2002:a05:6a20:1d0:b0:134:8b50:47cd with SMTP id 16-20020a056a2001d000b001348b5047cdmr8801634pzz.9.1690205262234;
        Mon, 24 Jul 2023 06:27:42 -0700 (PDT)
Received: from n26-073-040.byted.org ([106.38.226.194])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d70d00b001b9f032bb3dsm8945763ply.3.2023.07.24.06.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 06:27:41 -0700 (PDT)
From: "luxu.kernel" <luxujoy@gmail.com>
X-Google-Original-From: "luxu.kernel" <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	luxu.kernel@bytedance.com
Subject: [PATCH] riscv: Fix local irq restore when flags indicates irq disabled
Date: Mon, 24 Jul 2023 21:27:36 +0800
Message-Id: <20230724132736.124106-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_062745_641724_FF05F945 
X-CRM114-Status: GOOD (  11.25  )
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

When arch_local_irq_restore() is called with flags indicating irqs
disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
implementation based on csr_set() function only sets SR_IE bit of
CSR_STATUS when SR_IE bit of flags is high and does nothing when
SR_IE bit of flags is low.

This commit supplies csr clear operation when calling irq restore
function with flags indicating irq disabled.

Signed-off-by: luxu.kernel <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 08d4d6a5b7e9..7c31fc3c3559 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -49,7 +49,10 @@ static inline int arch_irqs_disabled(void)
 /* set interrupt enabled status */
 static inline void arch_local_irq_restore(unsigned long flags)
 {
-	csr_set(CSR_STATUS, flags & SR_IE);
+	if (flags & SR_IE)
+		csr_set(CSR_STATUS, SR_IE);
+	else
+		csr_clear(CSR_STATUS, SR_IE);
 }
 
 #endif /* _ASM_RISCV_IRQFLAGS_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
