Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D54C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JsSNMXhEXmNjUEmaYOwkMjw0U8ZJ/0Je+2c01P89iY=; b=vz0NLwxeXk6w0B
	uy4IDQdllssMg5kjsYXIODq+Ya2GWdfvn3KtnNT0GcbWG9M4U5WWGpLRJBOxuzIAbAhKO9LD38OBh
	bJ+X34lmmCRke5lUYtqFPRw4rB6Mh1Goa4Z9sdVLWde0Ku4hV5h60qmD6PCtzCUGlxGctETZGzabh
	uAfeHQqA0lL7x/InY3nUTr8VUu91QWw5IWl5XR626fUIVCRzGqeB8GG/vsJFG7f8L4GBppPaGaiW+
	VLStesCpcdMsiXU2WjEEsNevXDerUYx61OdapldccHf3eFrAElSXW0dX+3CySN02A4vxf6wZBK+de
	2qitbSpLC7EtHJeTNj4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8CQ-00544D-5j; Wed, 16 Feb 2022 00:29:38 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8CI-0053yj-91
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:29:31 +0000
Received: by mail-qk1-x729.google.com with SMTP id g24so391602qkl.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XiHWj5DVw0A6uknKnudKc4wLSuqR5J1NlVwPb2L6GW0=;
 b=n41wMt8sojwGlqC6Z7nUtCycjyWC9vz1LIB3RrVB9l+PleChAXiYN3rYZtcgXv68r5
 lwMgO6gQ9r4c9m9dBG2ChZ6+7Uc/pJthcMbEg/wqTpBYisTP3m0Aw7avgPCSMuO67EEt
 vtvHg5u2ZDi5R2rgf1u7Mym2krHmO8WLxKvRU8hs//5a5q2CKJwPy+LwwJh/dfFONNUX
 ojJPH2rsitVm4zCAtXU8dtpDC2IPupmM7FTu+DV3w0JCiXshD78B05T9K1CtUmwP6MRL
 1P9qhO1k+GBAjy3Vl01uo7JhQu/fYas/p5uKvlA5XcWPzzUMIFWxzR3AuisW3sApDN8x
 8L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XiHWj5DVw0A6uknKnudKc4wLSuqR5J1NlVwPb2L6GW0=;
 b=3IbrlOPS5kbmKFoOBS+jqp3+YNDW71hpKplzZN2iGEqNP8C+hWU3a5OcB/2GzJJowP
 hF8X1s9NmxUI2N5lYcs0wBPS32cw1g/WA8NmfM99IqdozFY70UdK3KIrV0B3c7mPECUf
 PsiDF+r3mIyYkUf9WRnVRtlRRuj5XjuINqJLyxXSc1rdPmH6eUQ/jJ+HU1TG7gxm6tOj
 zjI/DN/1VzPPPOIoEzSaENqa1yThzg5E/D5XvG31rEUqL1mGN2Lbkr4PnN95/Ezwphxt
 EM/DQAcS4XBlW7afqg0Bz8yNIFtwJkMh8R2jq6Pf4IXxa/8F3Y47HFr6MLUzyIyzBFYC
 Awzw==
X-Gm-Message-State: AOAM532VlU8D28PmUMfEH/gURQHTxzbYaaWDdltLYDOFTNcS2iNAQlIY
 W2++NwlcJbx5XabffDn3mXwJSA==
X-Google-Smtp-Source: ABdhPJy11Z9r73cJwDFvGnyYg0cympD4CllJQkjIKWB04SZc9QKH7SjSeG/2wPtAFwGR5kdzxKZNdA==
X-Received: by 2002:a05:620a:1708:b0:47b:ad8e:a33f with SMTP id
 az8-20020a05620a170800b0047bad8ea33fmr190865qkb.553.1644971369510; 
 Tue, 15 Feb 2022 16:29:29 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id g21sm20882584qtb.70.2022.02.15.16.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:29:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, heiko@sntech.de,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
Date: Tue, 15 Feb 2022 16:29:10 -0800
Message-Id: <20220216002911.1219593-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216002911.1219593-1-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_162930_366255_28F30BCB 
X-CRM114-Status: GOOD (  10.62  )
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

The isa string should begin with either rv64 or rv32. Otherwise, it is
an incorrect isa string. Currently, the string parsing continues even if
it doesnot begin with current XLEN.

Fix this by checking if it found "rv64" or "rv32" in the beginning.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59c70c104256..cb9c9e0aab31 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+		const char *temp;
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
+		temp = isa;
 #if IS_ENABLED(CONFIG_32BIT)
 		if (!strncmp(isa, "rv32", 4))
 			isa += 4;
@@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
 		if (!strncmp(isa, "rv64", 4))
 			isa += 4;
 #endif
+		/* The riscv,isa DT property must start with rv64 or rv32 */
+		if (temp == isa)
+			continue;
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
