Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8420C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 02:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PoxcXr44drmxFUTEyhC15XWYm5q9k+uJ3fFbtYh4DQM=; b=fe2S7OoW818OyC
	p/p5Yr6gIBiPWLdraC+kIcfwSEDLliuqBKUQ5uRt7eDl0q3D4DNzsiL8NuSDWiZ+Y2jrMqs99ynzr
	Qp0ogdegH+kY8VC/uAqEE4IPPOwW3xlFdTZbHPNvSxkv4G+8znBf5brkZ2u1th9Rih+eH7AaJZx9J
	y7uxGsRGokwD0qs5TY7CuA6cLFCHSchu6neAs4upvvQUZt42IiRyI8TrkyPhhklquZQnbBOx6OrZo
	aTupKR+4eKzm1CsRmwBR9jAOTbBzcF3uH6ppr/2D0TATU9kfF2IeQ1YE7+ozOb4jTXMQc4YGfzEDg
	VfunoYUFjpTU6Aii8z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilIg-00000009W30-1149;
	Mon, 04 Aug 2025 02:51:46 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilId-00000009W1j-094b
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 02:51:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso3131072b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 Aug 2025 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1754275898; x=1754880698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kppyljle9MoC1RO3HWHQlYBE2gQj+CD/61kPvhIKZUU=;
        b=Nhk2bpHzGKP0pwcFLYFwajof0HZX0YQRLVi6LyEm0sdy8WnCTHwDmGF9EamRsdh6g7
         vo7e2/OouTHhyx3ZKS6mKXaM9FWsfGNbY6/NEbBoUO/ytb7KUHuOfIAN0VeZA3IeM//s
         N2WSzZjZpDPlscoDrtNbBO7JOhONPFbPREPJQdATjG+qL4bKmj5l3slphEJBN00hhacS
         VHlMvTnISyA1MpRolSTerx6MmjOdNUIPV1L+f1CTFExoFH4rRWcEnYFS7KlUcVxdwFmX
         tYsaBolns60ct2+yq5I7H/QWICPlRERNo+sre4Hcc5I3FIwAnakmlxvLiZtwYcZRPIHE
         PxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754275898; x=1754880698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kppyljle9MoC1RO3HWHQlYBE2gQj+CD/61kPvhIKZUU=;
        b=WxG2kotXFA0Z6q2a47NjGEK+pd7FiGuDypPnkqHbQ4tkUlMEvjZv1aOGjNzS/ZDPUl
         yFL557MzlFM/oP+r1xcqMC7JA33fBALeW2igwrYPgClO8RcTZqd2YWiEGrsM3XjBdAg7
         BkmGFp6aPlAs4VlOs7k6tDZaWHLmIOOGnxxkwBEACfEj/r3eoSm8WqqbEpC5pupdcbSN
         WaHq8zGbg7ykqloiLRuvdhL9L7z41cp2ZaEQ7QqQoTS/2fA8JWIUuaFIX9ciQwCC2+Mp
         QZ8tHB64BZBb0eZvtmrR4C3Noo0EFUt5QBpw+Ibyp3obbRtFTn75XLofj0zaoLg0Nmi7
         T9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVtHumFPjjm00qoqhRgQzNsrQx/004l0vV5BFhqcXtqjFOSsLKOaSKE83x3yAOTOCyRpRN2W8ED5Ayo9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6jaVxl/g/Mp7B5RHqVGtfu6GP52V5s/8+hgFrP0SeqJ7hJhc1
	0qkuJf8n4bIQPH3bkeADHOG9S2xkGw4R4us+kxv0qLzSy4EvHDxSO0EVWmVOvD3tCPI=
X-Gm-Gg: ASbGnctpIQoPGTr9WMq0rZ9jxcs/x5BrPGRjeC4DWoEtNDNY87sjB+pVcwVDLo+2PqW
	H1hYue+1joUEgUAWvwuHRChsn9ZG/5Tld+tV0Bdt6c4u4zcA0h30IvAtDR05juMQmflvu30LgcB
	SV3WuadZJWUS1ndA62D3b9/5NTFJSbWw3XXjywUKRIGZDBzac21O5+VvnCBTQ+bxfXzWanwrTXv
	Z+rOq46VZWGJogHs3VAkjUI2b9Rc6vxo2BkDmbT/i1+oHn3lPBtPORzUBrP+0FZUIvjEHU7Vkuc
	2LVBKHMdQUXomyNUu5/FQclSJfr9UYi9uLtUjfzyxPAMKj5wGg19jOJVfE1AM1kRbVMcEXSeTim
	NW0e15dnDRNTkf1Jh5nFiXm7g0lq4C4nYCBYg52rAPuJkUX+dVho4lqWfanjh8A==
X-Google-Smtp-Source: AGHT+IGnAJTT+IrbnsWZCRCk+YCd+3FYDN3fJPd3vuAU12BnpRFJPFCkmur1SehfCljyn2rk7N6/hA==
X-Received: by 2002:a05:6a00:9a5:b0:76b:c882:e0a with SMTP id d2e1a72fcca58-76bec30d23dmr8835977b3a.5.1754275898337;
        Sun, 03 Aug 2025 19:51:38 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143983sm5181960b3a.1.2025.08.03.19.51.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 03 Aug 2025 19:51:37 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH] perf: riscv: skip empty batches in counter start
Date: Mon,  4 Aug 2025 10:51:10 +0800
Message-Id: <20250804025110.11088-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_195143_229155_325FA26E 
X-CRM114-Status: UNSURE (   9.07  )
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

Avoid unnecessary SBI calls when starting non-overflowed counters
in pmu_sbi_start_ovf_ctrs_sbi() by checking ctr_start_mask.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/perf/riscv_pmu_sbi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895b..3977f7488e4ef 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -877,8 +877,10 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
 		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
 		/* Start all the counters that did not overflow in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG, ctr_start_mask,
-			0, 0, 0, 0);
+		if (ctr_start_mask) {
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
+				  ctr_start_mask, 0, 0, 0, 0);
+		}
 	}
 
 	/* Reinitialize and start all the counter that overflowed */
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
