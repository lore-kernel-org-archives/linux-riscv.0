Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D6DC47088
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 03:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37oz2XAhHKl/sPhsIcgdxjU5hlCzhVSbHLWQSaCp3jk=; b=XC2OfUa4puzumG
	v5/Ae9h6017vUVikXGdSWs9424TDytN9oKtgzch4eb/4pqqvkS7fmpqwomidWirxTjS/Zsp4boVyG
	yGEIMrYsHY0FdmiXL0R6fCWbZeAYU2xxenKH5rUgHcfPsQwITaLmPS9BoAC9oqAcgACO91bTxtWT5
	tuTYEZlLN4HNVR9sLrujirneINrBs5qlPPLWgavVyABnazlGUv3yLYycmasQ2ZEwu0pnkJcVB+07g
	C8Kyd9bqx2AqaTkwfhvBX0HZVRnOpo8y5X1SRTXUWVvhezFcvLGozLyVK+2dypWP45YLeqqmcq5p3
	j+5lcki2ao8MZBJ72Mwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1IrX-002B79-9k; Sat, 03 Dec 2022 03:06:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Iqa-002Afn-0u
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 03:05:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id s7so6285595plk.5
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 19:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSVgH09qEnpbMDCTLASqX2OMVKXLGyPI/rjfeHRIKu4=;
        b=wrC9Di4g/FkQry/CsUbIzu4ShoQtDm632rHMb1y98183Vkm7GE+1KgGiQeiqPRu746
         EpOqc9dOuSYQ+KgbsAL0f0eaO3YxXVARb1Qy/aZlLGx5xT8FJkymkARbubJV3UJhsZIH
         X0s2m87BWl0Nk7Bcfhw39dO5P0B7WZR3xG8jCR7ylvOfUZJOlQHN0djD0b5b36wlrQxo
         jgkGiA62CEcQWD//xV7j8pXqM1WcnxGbE2honL5gHULuNRyMkT1dxPj0xOx1vMDLAewW
         AXdhismtJx65svzL/lahWs98kLQcqmbFwviKntKjqxOCAmGqWokX22ZxG9BANL1F6/V3
         RqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSVgH09qEnpbMDCTLASqX2OMVKXLGyPI/rjfeHRIKu4=;
        b=YcjaOBwAH0IJPRDL72E+rIe7qWEag95Weg9Qv/RxcuRiLZAJElbz2xchjLBN7kEDfH
         qBHwxLb7nsSK18Rs7I7qUc7wx4u3tqWrPVaEtRg6q6mBh0jxzGtPGJvrCPRMIEkdu/6Z
         CDDHIslOFWcbs9QQMIBDuBtGAIDB//VZ7b43dsZ+Hz2w9ZMqDObeYZnLJ9gqYSM3W2wj
         YEBhZkiFbT6CCo6c+GrNv1vHPvD/d2NFl/wHDzFgcGZz3diqlo9rvM717SynhJT53qD/
         TjfeNKROszCTD+6yozBoQii6XV0z9bvaSSngtqI3bTDE3TANQYNPoNVoLazvbeE/naDP
         sx6w==
X-Gm-Message-State: ANoB5pltJvmAH3p0L/OkU78NsVNmI+zMzgpMVZiuJwLTqMugrFSQWpi3
	AotCbl5CivvNu0xA7D9l2+vrUg==
X-Google-Smtp-Source: AA0mqf4XSUxHT34o8cfUz81MqLg2uR3iZhKmjmdLNRSRwmN3btpX4jv5Kh1mNew10ARt+0Rl1idwLg==
X-Received: by 2002:a17:90a:2b88:b0:219:a1e4:20e2 with SMTP id u8-20020a17090a2b8800b00219a1e420e2mr2146067pjd.182.1670036747139;
        Fri, 02 Dec 2022 19:05:47 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z27-20020aa7949b000000b00575fbe1cf31sm4894634pfk.67.2022.12.02.19.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:05:46 -0800 (PST)
Subject: [PATCH 5/5] RISC-V: fault: Convert to VM_FAULT_ARCH_* codes
Date: Fri,  2 Dec 2022 19:03:56 -0800
Message-Id: <20221203030356.3917-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203030356.3917-1-palmer@rivosinc.com>
References: <20221203030356.3917-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_190548_073694_73F44546 
X-CRM114-Status: UNSURE (   9.15  )
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

These conflict with VM_FAULT_HINDEX_MASK, so move to some designated
arch-specific values.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/fault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 3fdc2eebdd36..bd990735aa90 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -202,8 +202,8 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 	return false;
 }
 
-#define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
-#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
+#define VM_FAULT_BADMAP		VM_FAULT_ARCH_0
+#define VM_FAULT_BADACCESS	VM_FAULT_ARCH_1
 
 static vm_fault_t __do_page_fault(struct mm_struct *mm, unsigned long addr,
 				unsigned int mm_flags, struct pt_regs *regs)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
