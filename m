Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39095C48286
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 04:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VKIN4WwCtlVEjF8AQuReXEGg4XpzWhEib+Dw6c06kZk=; b=dvxZ77MOV/saTf
	P8ovX1RORBOVl9Dwurs8tt1VYPEAJQjpV/o3P/Qu/rHDZNvR4WLveLYPa+mLEVln7y6Rabr8jTp+N
	rsnG9A7h9orwMH8e7XbwjpRprCYgbjUYiT1K5eb49Y30t1E7CqJJ5av4/o3hWeJ1nBojw6hmLQqbO
	XI8ey9QWdc68NK4l6M+cVuhtSdtaDiGWk18y+fTvrJuIBT45iwL3NEqDrX42zRy9pan5ThUIgj360
	TGYrtO/Hbh2f8UHXhg1Cam9lpG7TJsYt6z8UEaqJ6HSEEvcmlV23qeQ3ZV3fsQEKE6uIauvETY4fn
	Ew7AcmBM3lzGo12PeCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXDID-000000063Tf-1uxx;
	Tue, 06 Feb 2024 04:42:45 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXDIA-000000063PJ-2sWY
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 04:42:44 +0000
X-QQ-mid: bizesmtp91t1707194541t9xd589g
X-QQ-Originating-IP: pMzahIqg6H5dlPo+vAhyxexMUr3RLOXUZCog16Pyj2M=
Received: from ubuntu1.. ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Feb 2024 12:42:19 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: 0vfWcIgh24yhEjsGKgTjDSuqmFqO91+wU93WDdBJmkdGhNU+EQTKp6T9wFfHE
	olJfbkXSl/UD1IDL1lpyYWuZoBKR2L2POs7sSK6FcxK1VX9S/a9GHCXPvGihUkjQxrXQfpL
	qqUVUzZFca0MGPliNtXrVYcMSvNVHq1WbP7lxKqLNyR21PSIi+AvS/32OST/Zj+5jt7DNng
	nkRODrT+5JhpFwTTafFJEzFmj8NBCOWbaZbY/46bYa6LWKMFSg+SHcf6JqYY42pj7QRkH05
	2tjOmG/3g55LOROKes7bYsuSxZL5+VMzrCv+1pZ8JOSc4NB7xBzPbWZPV/Kv7JkxRBo6hon
	lcEUggmWI7xYFQel30=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11924492051614252062
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
Subject: [PATCH] riscv: vector: Fix a typo of preempt_v
Date: Tue,  6 Feb 2024 12:42:17 +0800
Message-Id: <20240206044217.1283849-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_204243_074507_EB4AC97C 
X-CRM114-Status: UNSURE (   9.76  )
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

The term "preempt_v" represents the RISCV_PREEMPT_V field of riscv_v_flags
and is used in lots of comments.

Here corrects the miss-spelling "prempt_v".

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/include/asm/simd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index 54efbf523d49..04baee713eff 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -36,7 +36,7 @@ static __must_check inline bool may_use_simd(void)
 	/*
 	 * Nesting is acheived in preempt_v by spreading the control for
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
