Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE98DCA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 02:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DxLmkRnfF//eQ6OfKm5oU1nawoAUaUZtoNkycfBBIrE=; b=LiT9w3nlyNw6J/
	VfTfmB1Vmm5iWTQ5D2umFCgxcxFChW3aQII1mhpy9rntAnE/uAZOXy+moHEdNLdyVIqP24+UszVcw
	ltJ05y8pGcB9vAlvoerH8uWzhX1++jTUuFoPig7q2TX0hFA1l1ckQoSuEuZ7qDbZz23PlUOZtTTIf
	Cc7C03ta/jWsRpQcP02MkByIvsPN6KViRhy9UkHDwvK4tg2jugmpLPNxGv2M+F2TlKJWPBk2AhzqE
	FmcO1bNaMmVjApMElWqMb4flbNi3tZlHssC5YxAiVDiqpc+S6PGTNKbFEwYTtOgrfBsM/dG9crVXk
	m/LiJjpJopgTjbHN1H+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBx3-00000009C4d-2o4x;
	Tue, 19 Aug 2025 02:19:53 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBx2-00000009C4G-0UzZ
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 02:19:53 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323267adb81so5647115a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 19:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755569991; x=1756174791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4PS0eC2AqHTY+TwJpiamjzTws9ptPGz26xKGd5nRxQ=;
        b=McrpE+YciS9S3gKq25MhQYh62jfE+VO+jZ+JPht1uUUndDu58G9L3jjRL3SaoVb818
         NPgWTQoVKAC1Ju4DzO2Mq+kLnIyNfaun6FOiB7xu5MzXW3G/0+t1Z1tFIbxW3103ubEE
         JQte5a30JeQOTOu12uLRKLIiYm3+72s9qjKfclmUnM8IMezTa3FeThHVCz0p5aj/b3b+
         /+HM3OFhTqsrGOWqPsw4UKOMBn82RSqL5YQPUhNBI1AKpNCBoGZYSct52myJ6tJPcsby
         m4up2p0Na9Ri+QF/GyNcoUgpRlzXjsHNTN/7BtJfW38klF/SCx9zKvh44Jgjpxw94RyO
         N/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755569991; x=1756174791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4PS0eC2AqHTY+TwJpiamjzTws9ptPGz26xKGd5nRxQ=;
        b=rKx5BP1yHygQ1/o3m3r4keESUMy0VIWbCTKaBg7kW1gXlgUhYWbdeRs/oz5Of+wXCM
         I17UFLq45WuCwNsS1qiqZV0+3cgNVSEBVIyq++5wg/gvgXz+IQjGRxwryLZEg6k6uW1N
         qZ6p8WRqMQh2W0mqlRi9sbfIBZSNzkQ2SHmNwx+R6y0PTw0qmpupyeZrApG+fFqPfE0z
         WZUY1H6zkPSYVFHhy+eYSSV42vXlnF4PHRbK5cnUXjJCU9bO6KW7xV+rM7S150TKBSg1
         PJXCLmrBCe33xtYl+NKgl9eKElOZhdpen2JjFX5kQFjK2YXWfUkajCCCU98xVFY41gBq
         iErw==
X-Gm-Message-State: AOJu0YwX+7EL0QHfyP0TwcTDMLL/1L3Og76ifLT/KR2F4ZE+V3Za00en
	B2fs3skXn2liviWYWPlkRhDA/q1GXj6KOdnbM3tZXny/kYgzY9uozuM34rwWZxxR3QwErWTQsZ4
	nJgimM8cjUzq8C0KExP7jbiNRV/t6V5KdwU58fXKnPwiYml50Aao5YfAR20rn96Q7jsk/bxnW/D
	+zbe5w60bPlq8jMCVuNZrZpTeW6rbTrBoSQdi18kCmQW8QpIOIH+ehzYw=
X-Gm-Gg: ASbGncv9Qlkar5uAWI8vUiysRWGrXf8pc6sGaG6PhiJxD5ea2BcE1SD7/dRltdRVHK2
	vNTVlqrk+DemmLesMQxk10lDYNHK1I5x+Kf/pWbBSKHnm8wZeKcBgt5yz3t2tYU7W3EIcEUq8Uq
	vER9xW8McwSitQYiF+UGanAf9Zoaz8ebp/jAOaEqpnFBY6ESrKbZP2WvBZCLBlqgHXfUg+YlLws
	TVN+gf5OWcPlQ1yXMlydzcvrkfNdkzRevtYW7+VwUoBi2szJMirG/O1M1IXfQlyrRoD0HC3ycmU
	HEiK6poyqW6BYxZYgTPm7eVr8Jvm5XRArxL7jSal+lTY5SrOsAc+dn7lg8nhGN1Uq7HTFkNAIoC
	jGUMKk3vKE5n4W8Ndo9fJPylFMHcjR3qCOQ6lB0nEakbwsg==
X-Google-Smtp-Source: AGHT+IHWxvM98sDiuowUcpyFGuIrYZq49EK/uo9oADs6CGCF44k8IV1yH0AJVvIhczCfi2Wj+ZB+nw==
X-Received: by 2002:a17:90b:4b8d:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-3245e58f423mr1341313a91.13.1755569990659;
        Mon, 18 Aug 2025 19:19:50 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d19a02fsm9270780a12.0.2025.08.18.19.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 19:19:50 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com,
	Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH v2] riscv: fix using wrong load type
Date: Tue, 19 Aug 2025 10:19:31 +0800
Message-ID: <20250819021931.31935-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_191952_166542_5443F579 
X-CRM114-Status: UNSURE (   9.27  )
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

thread_info.cpu field is 32 bits wide,
but is accessed using an XLEN-bit load, which might be 64bit load, fix it

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>

Changes in v2:
- add a comment to explain why use lw instead of REG_L.
- correct commit message
---
 arch/riscv/kernel/entry.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3a0ec6fd5956..82306cecfdcb 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -45,8 +45,10 @@
 	 * Computes:
 	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
 	 * a1 = BIT_MASK(cpu)
+	 * 
+	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
 	 */
-	REG_L 	a2, TASK_TI_CPU(tp)
+	lw a2, TASK_TI_CPU(tp)
 	/*
 	 * Compute the new_vmalloc element position:
 	 * (cpu / 64) * 8 = (cpu >> 6) << 3
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
