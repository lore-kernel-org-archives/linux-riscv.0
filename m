Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD24C48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yE7CVDqiOMTuLDwhARMTDomgeoQOKiwGvRifD9YleDA=; b=GIdzEBlJpS0kaF
	HXywIu1Q6hFo/Rs29RE686qYp9OQoeNM8cZbQTeVbcUP3LkAwyG3HBB+WWCwAS7sZzC4/6J96HcsA
	9SJxbEZOzy3gYl4V7zlGpskds1k5nboXKG2Z2apGSG45yj+GLoOsNtQhIndu0u9gopE1TLXk0eAUs
	VO6L1/gjqzqgV+PELuNBVUm4um5mBr4cT9BMGRVWMfK1pAIYYw2yAzB80hhfKCliRqpwM9EcVRi+o
	zdWym6/MkFOt2/GZkRGjGHGEXJLdCyPhReOhjExiJay3JGM6B42oA/gz1ipF0bocYBccb38DFVkrs
	uit8UQrza9dNdV/ltaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjRw-00000000QB8-3TKD;
	Wed, 21 Feb 2024 10:03:36 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjRt-00000000QAb-3tMW
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 10:03:36 +0000
X-QQ-mid: bizesmtp79t1708509791tffdlfxc
X-QQ-Originating-IP: hZ5w7OPc1Pp86+CkyB3tl09awzp4C34FMga0zrF7TLo=
Received: from ubuntu1.. ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Feb 2024 18:03:09 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: C46Rb8GPIEdPMTROtMOZN6nemes7t5ZwikAXs3JSN5ZREdpnZoH+yMSsiy3X3
	2zkr3jRvn/gzVABgxzc3QJkIk2UKXHjs9d/ZCOMC4IgwFRvy294Bt3lvNmR2us87eGtjrMk
	qKKWrSgIcXajT/Yp4RVc8Um9sEdBp7Sey+bwv7O394Q0bP0UJlE6TgC5OcFD3V/3DzRCMJ3
	jr3NvicWNxtebFmxdyrqnzq4hQB9KnLHju69ppHjDO7C1erx0qdWC4B6hO9+gtaQCrGS+aY
	L9tKwiT4xqDqRC7aruaYwsWTP31kfo6UvMtJH+PwbkfPFk1r8MdN4L8t/dxLnJYlvJaaaMi
	/9eDaaE88b3I+cyZPpXbMpZ8Lg90g==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3370517727250236861
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	ebiggers@google.com,
	vincent.chen@sifive.com,
	songshuaishuai@tinylab.org,
	greentime.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andy Chiu <andybnac@gmail.com>
Subject: [PATCH V2] riscv: vector: Fix a typo of preempt_v
Date: Wed, 21 Feb 2024 18:02:52 +0800
Message-Id: <20240221100252.3990445-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_020334_314966_760946C0 
X-CRM114-Status: GOOD (  10.29  )
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

The term "preempt_v" represents the RISCV_PREEMPT_V field of riscv_v_flags
and is used in lots of comments.

Here corrects the miss-spelling "prempt_v". And s/acheived/achieved/.

Reviewed-by: Andy Chiu <andybnac@gmail.com>
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
Changes since V1:
https://lore.kernel.org/linux-riscv/20240206044217.1283849-1-songshuaishuai@tinylab.org/
- s/acheived/achieved/ 
- Add Reviewed-by from Andy
---
 arch/riscv/include/asm/simd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index 54efbf523d49..adb50f3ec205 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -34,9 +34,9 @@ static __must_check inline bool may_use_simd(void)
 		return false;
 
 	/*
-	 * Nesting is acheived in preempt_v by spreading the control for
+	 * Nesting is achieved in preempt_v by spreading the control for
 	 * preemptible and non-preemptible kernel-mode Vector into two fields.
-	 * Always try to match with prempt_v if kernel V-context exists. Then,
+	 * Always try to match with preempt_v if kernel V-context exists. Then,
 	 * fallback to check non preempt_v if nesting happens, or if the config
 	 * is not set.
 	 */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
