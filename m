Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F290C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QWG/FOnpOy8xg+7+AvmMKa02mFlXlyl3G0mK7VpCvAM=; b=ErOsUSaUBl5a3V
	YJ3v5TlYmp7ZFQvQiq8nzLDfg3Qafpp4myHm5SLYZi+mjsQ18DDWrGLRhcVJZ1u4qAHY3USsWT6Lp
	KvxcatvQTLWtqWhCUYxl4u6FQWKWBQQi1DoX/nwNkfFS1QB7CNEeVI1nspNM8NRSP6s5utZQ1XaDc
	dP/kGp/QcUzXiKr9b+PC2ASfvjM0PSeyir9O7HpW/nIMW6ANI+3hYZgfhJJfuBpBT4UF+5x977Szf
	ooekweQsrbVfH7MWHFirBMm7kW7lE1NfwcnYnSEzZBjZ+JEj1/onrNQzjwWZDc4r3SI1RP53K1pN+
	E0hpJQUFh4rns/p8DWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Il0-0000000AgRX-0lCr;
	Tue, 07 May 2024 11:13:14 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Ikx-0000000AgP3-0gli
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 11:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715080391; x=1746616391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vZwwfPun+jcrJFXKdn0WPiO85JreSPpf8VyM/d3hF3Q=;
  b=g/IOn3c4iTyhEAc/Wc/M9WgzuRJr89xwgP2+oRjug8qz1QS/Spi95LQI
   FonmanHLdWXlcrpgqMsxzHwWIMa/E7y6uj7dzmZCAapXS3dVh+iakQU1S
   KZTlTHTxbjcliNOjiB2SuMaGAej1llfVxebwAmrAeLQ71OqViMmGqd1Ps
   zgzXc2P2FQUKnylTe7TIy7EgqMhgjeNen/hnS0NZAhQ/N/pjzaazviGIz
   /1/R7Bmxk6CDmOiwxysb6ZzjWDp/QrtDopLib9yENNDQRiSq+EVidEfxO
   Cg9kECcAXtbpR0eLEl/TxHCm6MIlMJAdsOm3vHcsxOXfP7Gg0WdmSAygD
   Q==;
X-CSE-ConnectionGUID: rayr109vQIaoi+tE4EIgAA==
X-CSE-MsgGUID: mrxX76LrRV6nqDt7ZsHXcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10721236"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; 
   d="scan'208";a="10721236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 04:12:58 -0700
X-CSE-ConnectionGUID: shxD1AQuTimRHOLMV3dpFw==
X-CSE-MsgGUID: X6ObiS9hTta/WxyGh3BG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; 
   d="scan'208";a="28462880"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2024 04:12:53 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	bjorn@kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	pulehui@huawei.com,
	haicheng.li@intel.com,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv, bpf: Fix typo in comment
Date: Tue,  7 May 2024 19:16:18 +0800
Message-Id: <20240507111618.437121-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_041311_219782_2A67CE30 
X-CRM114-Status: UNSURE (   7.84  )
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

We can use either "instruction" or "insn" in the comment.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/net/bpf_jit.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 18a7885ba95e..c1b6b44a2f49 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -611,7 +611,7 @@ static inline u32 rv_nop(void)
 	return rv_i_insn(0, 0, 0, 0, 0x13);
 }
 
-/* RVC instrutions. */
+/* RVC instructions. */
 
 static inline u16 rvc_addi4spn(u8 rd, u32 imm10)
 {
@@ -740,7 +740,7 @@ static inline u16 rvc_swsp(u32 imm8, u8 rs2)
 	return rv_css_insn(0x6, imm, rs2, 0x2);
 }
 
-/* RVZBB instrutions. */
+/* RVZBB instructions. */
 static inline u32 rvzbb_sextb(u8 rd, u8 rs1)
 {
 	return rv_i_insn(0x604, rs1, 1, rd, 0x13);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
