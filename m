Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F836CD4F54
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFw+2Omwk2FcD1w20ItjQy/PJhINcra1TNmU3iKdL2Q=; b=Qi3ERT79RRwxGf
	ZnJBE/Cn4cJjlamA5fmd0Mizv7LLLaPoBv7c+Pe7DpGbk6o1pAxgB/1fsNrJs2XWw16d9Lsji3nZb
	3jVksQNgpTKb+vg0UkkbTHGxWmlbJdfxiE+nTF70NHQ2jhj3kN2C4pxecOMpzXW5WAWzMpUZ05XW4
	tjiqDd4PAeP2Ai9bhpq1lcwtbW0xtQjFsnCkoj6KwnfiRMjDwTKvK534cn4wCtoMljWLIH4H0Bt+Q
	AjIgTYowy87Flgu56eF4WSnBzwOYIDrT0muvQSmBaTjd8IYNHlXZ2PIIWTO/IUt5Rx+GjWyiQKAX5
	SK9oHHWNM0mgUaHeGEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbXT-00000005phz-3ZWI;
	Thu, 28 May 2026 14:16:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbXS-00000005pgX-0UiF
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 14:16:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b941cd869cso83614185ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779977802; x=1780582602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7DBp+km+vMy/tgM5SqyvdKOwwrmagswDo8ANngHZxCc=;
        b=GfxYn5QLKrzdb8ESMZ6E4+5WprxTNNFEiHOcw1uqGS9QkIHNBNDrubDgCuEHfRPcFs
         Rd5PpbeX+bsg3PudcnHSfHhyKnqkr2TC92qTMDVvGzwTHkK0JZI3HxVkST8et3hsn4lC
         flUoO9DYrGUh7RsDpMCpjrov0CazNiqE2j2Ht6I30H3xtUaP5No3BGLv5msWF5G+4Cxy
         w6lHZuEGiwLgSeW3jqByTIgyxlVxwt9f4Q+oaDzpwDrkvIcbBPPIX5MUlU5D9sdT1VWc
         GQDzdH/aVD737M6etMRMu+QzeHkg8pFNVhtF3xzNVu6411QBe4MPAWBOWdMahYAgvd5a
         iiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977802; x=1780582602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DBp+km+vMy/tgM5SqyvdKOwwrmagswDo8ANngHZxCc=;
        b=ms/kw7UwyuZ0o9ZUBeU/q4xo8K/92VshXH0RepC+fsibrEIzNY7gYe7BYvpz/a/dSd
         qa1a2rAZZKhpUrMipH0rZAxVVYUXHIPvv7kLm8DuMTHCWE/Gg9SO4q7VqBUgiO+TAsBW
         03mxhNxzWpM5TO/O/ED0TnwxBWDZsAYbNpn/JULEgUoGrPwI4KdCdmMwTO2RURScE5ue
         8poJd5HcEVGHKV+q9B5stoGDe1B0m11+bOV6fRGCGrnYwrU2gRS4KkL3lXlbwktwAiCT
         asVR1//CWqbKo88jJYsrnobWVDEtaK2g20Cytld23SuCHWxFGb4Ep69qLONaBv0GhdnR
         z80g==
X-Gm-Message-State: AOJu0Yx7FMoUkAmCfFRpmOXmob9hByETs6hjG/fgzGaDTcC9X1stmqXi
	UohF08xIS2mbGBITe1V+ZW9Le81PXVkXP/P17ijznCjpWobigm2ZjTjZNKbTx/tT4S9he8Di1ok
	096oC+LoWmw==
X-Gm-Gg: Acq92OH6tmEt6gE3xA8P++vHjeWIUViqy8TgwYo6c3wnSEaF7WxHmXk5SAlzh2zXvo2
	9IeqwUd0Dlu3aLSib4ncaG4+biJq0YucbLY2GFBgGX+XbxWu3wtNac2yhQKvTsz+3vViR3jlspV
	+gIqxoroos7WOhOwwPLek+UeslHF3WUHg0oeGqXaXLaGQjsQEzZT5Lni5/q3yE92Q2bhuPckAig
	XykfAbAJTh2Akiczz/adKLFbb73q/J3Qg4dew1XLm6to45ayJaDny+/Mi15QnCPstb7DsZnqU2F
	X5roQzsQyg4d46sQ3e+oWiMJdcZzh8g2jTEWvlaO/gX+eQRwvblhluxPCI4loKgHmLcSQNrjMnk
	1uWsigKMAWTHw6vc5WlsBNOCCH71kZo2eB0tIyofqgyXd+tSpcc5Vb6U43greudNT9PFA/FG1u6
	Vxg9fW7vyZz0JL+csGwP95DXy5yo2b5bdXT/G8cPOrPedhbS4mQyFM
X-Received: by 2002:a17:903:2446:b0:2bd:2439:25e9 with SMTP id d9443c01a7336-2beb073a217mr288109195ad.40.1779977801394;
        Thu, 28 May 2026 07:16:41 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm188188135ad.52.2026.05.28.07.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:16:40 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Hui Wang <hui.wang@canonical.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v1] riscv: cpufeature: Add Zic64b ISA extension support
Date: Thu, 28 May 2026 22:16:25 +0800
Message-Id: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_071646_163932_5A8C93D7 
X-CRM114-Status: GOOD (  12.02  )
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

Zic64b describes a platform with 64-byte cache block sizes. It is a
mandatory part of RVA23U64, but a system may provide 64-byte CMO block
sizes without satisfying all profile requirements.

The ISA string parser currently ignores Zic64b because the extension is
not present in the cpufeature table. Add an ISA extension ID and table
entry for Zic64b so it can be reported in /proc/cpuinfo when firmware
advertises it.

Validate the entry against the CBO block sizes discovered from firmware.
Only check CBO block sizes that are present, since Zic64b constrains
implemented CBO extensions to use 64-byte blocks but does not require all
CBO extensions to exist.

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 7ef8e5f55c8d..b17cae75c295 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZIC64B		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..510ea6aa66ae 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,19 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a present CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -499,6 +512,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),

base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
