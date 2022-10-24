Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D6ECDFA1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ekk/e2uFEdBaC4Ox6aePzsDH8Dy9vsayMjtLROVa/Fc=; b=3VS+Lt5BPeJTWl
	6Qn32W1Ow7WxlbqX5rY7kwkREKEvMtwVkBmBiQ+E3688jfLW4bPb6KuZWq7m8S7sGr4qyxf3YzYBW
	rKGwEqPuqmiybuOUtSqJbM/0wLXrTgkwQAadP8tO4JwXUPN5zjrbRjAKz+kcrdzNCUnwUMOp2sM6/
	Yi8VCAVgimmCT0kNG8n2gzo+u6rLT3YlncJUENShBMcw0yoPv3W/ItIXdP5DwP4UuwsaH8dey6t0g
	pvBfYboz1xPSvsrOo+5uCbFpkiBZ96sLmqSX2kGr8NoEMkHO8pXDJqlvvx/J2CEk6ElFh/1tJ3tV2
	+6OFSOKThiQ8cnE4OIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtWY-000L21-HB; Mon, 24 Oct 2022 09:13:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtWH-000Kqb-Ci
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 09:13:19 +0000
Received: by mail-ed1-x532.google.com with SMTP id b12so28787907edd.6
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WUEAPPU2SbhVsifxSwCtF8o58i9JytjAsOOCwRIu1o=;
        b=LWVLdBYdfI/DFjLJyyebAQK2/RJkZmA0/V195a+MRFtMht3M/x6u9Dh1rd+z3DvMX9
         GPpt7akf0ek3ZstVvgSQTJ9GClyZpn4wvF5Nr9UfC+eRDUTFG2ahLVdEUun5FCOClab0
         hetFjH94N72XGg7G1MzW1FGZFniblYy7iw5RI6lwK30FShnXY6FqUMz0xq7pZymXY+/5
         rrzumU5iER/7dYtoHRpZ013NOFAFnThfPQvu3dGSh+7sEZsBUw7SEfwJMaG6qYaCFZaW
         GpclIrOKPwXRq30sFa/rr29in+EL7oul+ahJmas2mMLnAdveuqaPBNoSHlmNepVyB0rB
         3eVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WUEAPPU2SbhVsifxSwCtF8o58i9JytjAsOOCwRIu1o=;
        b=iPH5XsENTwer6m4qr6a71gkSJuK4fBHXSiTp+F33VQInlEyCrdmSBi5ZPjbc4CpQOp
         3zFNk2F5l0f7iax1Pl8eorqu5x1X4SNdf5dJOVADR5OCJdNJ5uDleMtyGaoQPWoQ4PJ2
         HrqTgHUphXLAaaGJgoamJOM5sQ1l3y4o04G7HDDNdcDDrVIgVRlk3Ll4diyLZ8ZFzc1l
         W80/duINsK1komBSYzBAlKK1ApZ3x0Mz9GGuzvKCjAeB5bZQ22nUXhLSt2hGUT8Zs1m+
         tihnRXaHIkyaLFUIdYr0R9iIVwrO1KU7kG2FsuvSBzw2oOpzRSJeGkFDLHjlmJ98UV6t
         0LTw==
X-Gm-Message-State: ACrzQf0aIJs9Kuc3QJ0E0kauk3rZAh4uGgxsjE05+RgXo+EsIC1GTXY5
	UESyoiYEmzV722mSLNdCO8EZGv0SQIIOCg==
X-Google-Smtp-Source: AMsMyM7W0fSQNZiiWFBKfp1xmBOLi9UbDfKEhFtvD9PA/CadAqcIlrQNdRCimujbvsTJqFo9+gRFPg==
X-Received: by 2002:a05:6402:27c6:b0:461:e426:dc8b with SMTP id c6-20020a05640227c600b00461e426dc8bmr1378376ede.403.1666602793667;
        Mon, 24 Oct 2022 02:13:13 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b0078a543e9301sm14909298ejf.200.2022.10.24.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 02:13:13 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 2/3] RISC-V: Introduce riscv_isa_extension_check
Date: Mon, 24 Oct 2022 11:13:08 +0200
Message-Id: <20221024091309.406906-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024091309.406906-1-ajones@ventanamicro.com>
References: <20221024091309.406906-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_021317_501364_AD66C5FD 
X-CRM114-Status: GOOD (  14.09  )
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

Currently any isa extension found in the isa string is set in the
isa bitmap. An isa extension set in the bitmap indicates that the
extension is present and may be used (a.k.a is enabled). However,
when an extension cannot be used due to missing dependencies or
errata it should not be added to the bitmap. Introduce a function
where additional checks may be placed in order to determine if an
extension should be enabled or not.

Note, the checks may simply indicate an issue with the DT, but,
since extensions may be used in early boot, it's not always possible
to simply produce an error at the point the issue is determined.
It's best to keep the extension disabled and produce an error.

No functional change intended, as the function is only introduced
and always returns true. A later patch will provide checks for an
isa extension.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4677320d7e31..220be7222129 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -68,6 +68,11 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+static bool riscv_isa_extension_check(int id)
+{
+	return true;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
@@ -189,7 +194,8 @@ void __init riscv_fill_hwcap(void)
 #define SET_ISA_EXT_MAP(name, bit)						\
 			do {							\
 				if ((ext_end - ext == sizeof(name) - 1) &&	\
-				     !memcmp(ext, name, sizeof(name) - 1))	\
+				     !memcmp(ext, name, sizeof(name) - 1) &&	\
+				     riscv_isa_extension_check(bit))		\
 					set_bit(bit, this_isa);			\
 			} while (false)						\
 
@@ -198,8 +204,10 @@ void __init riscv_fill_hwcap(void)
 			if (!ext_long) {
 				int nr = *ext - 'a';
 
-				this_hwcap |= isa2hwcap[nr];
-				set_bit(nr, this_isa);
+				if (riscv_isa_extension_check(nr)) {
+					this_hwcap |= isa2hwcap[nr];
+					set_bit(nr, this_isa);
+				}
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
