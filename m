Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29844C54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pR66w3NC6GctslN3L0/fQWZ0X/VwlztDOQTjcmwpUUQ=; b=AS4WT/yuX6b+FP
	22HrE79lc9VRbGzjWdne3g/3hzRjy/Sa5/b/1XQtjHpwG4xELiBXh4w2FozX2kz6So6JOtY1VAtBa
	2+zXLzyAdaEIW/8D1P+GSfD8oeHCAjxzgae4bhOMMmOFfjgY3KBu1mQdQp7VtChbsfRAAkF0cRW5i
	4mk6eUKVvcoyrEProl3JMuDXHMl9yB2YYiA2kIceeUAud54bQaWJ3g893N5t9ss42z0B2fmC2K1jr
	Zbom8dvWjV7Lg02imHnUJpCN9/NokeDA2Z/Prn2VGDhZMzRgv8SZliSr3ITmvvZIv87HaIxkU+b/9
	8qtcF0e4lK/0dyshG7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1NL-00000005li2-0P10;
	Tue, 12 Mar 2024 12:36:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1NG-00000005lfe-452o
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:36:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-29bc1c64a98so2347131a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710247014; x=1710851814; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=haIZRuO8oeLB+hreLY4ZYg91OuqIQN5ycB/ybHboNyM=;
        b=kdLH4Q5Lv00QHiwjjKsvSbnhY1dDDGyUnexcVDlQjS9IrAgFeGOjPYm/vUylhvqxx1
         x3hdA35v2Ne/NRYyjTkq+rI2llpbdVpvfYu4Xqv3ZIIbHVGkE2D3yauzD31/eL2fQLZX
         kUAEXqfd15ho8H/irG8uimYiB0LQkuDrrS04rSXgHdjfq7jOoKvpp2XdiMDVZXjEf7P4
         nIUGyfTakETG8Ma2PEvbEl4Cpi95Xv+2KWUj7jF+2bK0E44RJDbcGOSrxkOd3ay4snPX
         0Pewtn/VDx5Fjlnq4B6KhGkFFfY6QoSxmzpc4bKMBPZoBwMKV7cmr8HIly9c33qRixKe
         voyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247014; x=1710851814;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haIZRuO8oeLB+hreLY4ZYg91OuqIQN5ycB/ybHboNyM=;
        b=HX1nr+E7pmvoBbEjcZnd2LVdfGjVE7QeynyiEave0Vk7GOV9ZjtgGU7toYx9VJR29B
         sJ+8YPjA2Z4tnJcIC9ozbS0phwHsjpZE07KpsBBYKfaNv8yjOAEdOw6o123krh3Fpl4C
         fjO7ewZ3jDSbE/a2Jz64cF4mevCWpVRb8Gw5U8oecfhpJuDAZvc5vziDiLlGRFU9oSMa
         wbAn+Mo+E4pUhdbJDrCKdpAWmzD3rYPZJ4WAXNr1xU2ONd7dmW2koT8fVMoxiAqz3SN/
         3BJcKTCa9t1axSX3RA5OqVbcaG0CZ0AJCeXxr1N4yULOODrmkIb9ssxc9x2iwSM7jT7F
         Cg/Q==
X-Gm-Message-State: AOJu0Yw3cXMKPFOR616WhL1VNbfYiSG8lv3EBY+XY4MC0cH2uZcyYJqf
	DFd/LuiMorbM7cVgHsFIG5npd14PelMfjTpbNVuhcDBior4UVw7KUIk4FdgqhDNaOLtpTci7vXz
	/it5tZPsqv4p+3vlwL243AdAzC+CuE7ZJm30y2xJG9uun8CO1+BotYgV9gLQTsyrapv2ZhGPKHm
	PjDb2r6m3BCYZzlCiorzWEj+5uvn7BEiqLF5TFM0OW3FklyqfeIsja
X-Google-Smtp-Source: AGHT+IFQspCzlLhyTwV3ehc47yXxVRGeJ7yOHhOvSzrp7Srl3t6loVzVKEmIqkv0xBNK7GDcZgY6KQ==
X-Received: by 2002:a17:90a:c7d0:b0:29b:9bb0:ef26 with SMTP id gf16-20020a17090ac7d000b0029b9bb0ef26mr6515189pjb.3.1710247013553;
        Tue, 12 Mar 2024 05:36:53 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id hk13-20020a17090b224d00b0029c2794d3f7sm1804233pjb.7.2024.03.12.05.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:36:53 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [v1, 4/6] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
Date: Tue, 12 Mar 2024 20:36:25 +0800
Message-Id: <20240312123627.9285-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240312123627.9285-1-andy.chiu@sifive.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_053655_054976_C8129A24 
X-CRM114-Status: GOOD (  12.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Multiple Vector subextensions are added. Also, the patch takes care of
the dependencies of Vector subextensions by macro expansions. So, if
some "embedded" platform only reports "zve64f" on the ISA string, the
parser is able to expand it to zve32x zve32f zve64x and zve64f.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h |  5 +++++
 arch/riscv/kernel/cpufeature.c | 41 +++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5340f818746b..24efea44f1ab 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,11 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_ZVE32X		74
+#define RISCV_ISA_EXT_ZVE32F		75
+#define RISCV_ISA_EXT_ZVE64X		76
+#define RISCV_ISA_EXT_ZVE64F		77
+#define RISCV_ISA_EXT_ZVE64D		78
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8986ceb58188..3aa0df3f3b41 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -201,6 +201,40 @@ static const unsigned int riscv_zvbb_exts[] = {
 	RISCV_ISA_EXT_ZVKB
 };
 
+#define RISCV_ISA_EXT_ZVE32F_IMPLY_LIST	\
+	RISCV_ISA_EXT_ZVE32F,		\
+	RISCV_ISA_EXT_ZVE32X,
+
+#define RISCV_ISA_EXT_ZVE64F_IMPLY_LIST	\
+	RISCV_ISA_EXT_ZVE64F,		\
+	RISCV_ISA_EXT_ZVE64X,		\
+	RISCV_ISA_EXT_ZVE32F_IMPLY_LIST
+
+#define RISCV_ISA_EXT_ZVE64D_IMPLY_LIST	\
+	RISCV_ISA_EXT_ZVE64D,		\
+	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
+
+static const unsigned int riscv_zve32f_exts[] = {
+	RISCV_ISA_EXT_ZVE32F_IMPLY_LIST
+};
+
+static const unsigned int riscv_zve64f_exts[] = {
+	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
+};
+
+static const unsigned int riscv_zve64d_exts[] = {
+	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
+};
+
+static const unsigned int riscv_zve64x_exts[] = {
+	RISCV_ISA_EXT_ZVE32X,
+	RISCV_ISA_EXT_ZVE64X
+};
+
+static const unsigned int riscv_v_exts[] = {
+	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -248,7 +282,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
-	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
+	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
@@ -283,6 +317,11 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
 	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
 	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
+	__RISCV_ISA_EXT_SUPERSET(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts),
+	__RISCV_ISA_EXT_DATA(zve32x, RISCV_ISA_EXT_ZVE32X),
+	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
+	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
+	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
 	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
