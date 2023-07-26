Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69B8C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZAL5gbZtGWOw8M3EDeLV6ITIF6+6Ormd2nxAR8uO0Y=; b=EldZbP834NvcEu
	9KJYtEDD/SmPJ9BvFFRMnbVtXDDd5C+Ko+0b7cwKbe/9/EqTcrR8NHL+g5SsIi+ad0U7oTbxONXHD
	aUp5wK/9BRurE/19CBAXyb3iu7eKb0lPTEh+sSbr1ALlXtBb/5I4hMutZdOm0A756YXBqtJk/BBOz
	UF+8I4js0llx/TAGFUu7epN8n5ItBz+jpN2PjonB0LTykOePNyNUxeBqQhVZXrxUOm8aeHLtBxxBA
	WqfW7/LvttteE1EsTX9rabQJ+8nIpTFmlWhHWcJSv59g1fIQ6X51wbwgJQyUJ51KeZf+oQMfXi/me
	voQk+sn19vO1T/px5zSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa7x-009c4z-2P;
	Wed, 26 Jul 2023 08:44:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa7u-009c3K-2B
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b9ecf0cb4cso37312315ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361048; x=1690965848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O32qj0iS0CQ128y9LZa/4+ORdT9w9cMnSwkHBE7Wcdc=;
        b=BwAoUmgm2wTc+HtECOxsDTZZecU8XqE5Lj/ftd1WiZN8KOacImkkRn02sHX4nPT/Ir
         RdjUoPGoKdrTcNDuH/rqbWWiv5kTtrj27XMsX0YZyVX+E8S6RSqZOiZMA9G6ute6LzYu
         A6PUN/hKGe55DGYlhVMW18W2Gs4+FlAMn1CVU+y2cjGF7ecCMW7X76EQnJaFOjqyuuQz
         X1GR7owALu1erNetnr8Qc4ErP1J+0EJc8V8z2c9lykKRxjIaEoPQ2h2tczCR90E5M4++
         F/gYOKhV3Lx7YeGNCwX9FLOkQlU4Hn2F1QuWCHOgdb0c1wmP+cLPXOxbu7Xh6zvLLkOn
         8ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361048; x=1690965848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O32qj0iS0CQ128y9LZa/4+ORdT9w9cMnSwkHBE7Wcdc=;
        b=H8FsnxLOdhbnd3ZHPpWZ/505MsDpVJt1JHIIsP8q4aExXF3nJAkPPt4hFeiNXUFkLe
         z+qKt/UlUolo+q+2ut/YryTB+Bx2S5ZIm82NcTZkPeboVN3O3hf9LiU92bfvmRePiKXd
         1D7Ik+ePHKWk838iyje4Aa5qhg6HLGebqtf318MauOkr442mM3N4vJMg+ndy9SqPKT00
         BDqda3bWmlkRv5c1vU1xZJYDNutC5DJgfgH3dou9g3YyoD87yrmti2jwvLjlaNtu6uYd
         qJHrDh7VrE0/gNcibJltla0vZvJ4zZ77D+Dnlxh1MvyCYHVBZpBtsEvatHhwEF4W7ec4
         MKoA==
X-Gm-Message-State: ABy/qLaa09zsOda3VJqBraFG1XIVxU6xmLZ4wHdIdub0F2gwhtDaw9+m
	UYBVBKi7ZJ2P7ag9d9ORvcjhSg==
X-Google-Smtp-Source: APBJJlF1UcZfD4GtZQbExiDlryyarP7U0RVaiWEcRPCc9PBWbKK440mq/9FDPD6l/cW9TbDZY/oxaw==
X-Received: by 2002:a17:902:a40f:b0:1b8:28f6:20e6 with SMTP id p15-20020a170902a40f00b001b828f620e6mr1074573plq.34.1690361047695;
        Wed, 26 Jul 2023 01:44:07 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:07 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/7] RISC-V: Detect Smstateen extension
Date: Wed, 26 Jul 2023 14:13:46 +0530
Message-Id: <20230726084352.2136377-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014410_733896_521288D5 
X-CRM114-Status: GOOD (  10.98  )
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

Extend the ISA string parsing to detect the Smstateen extension. If the
extension is enabled then access to certain 'state' such as AIA CSRs in
VS mode is controlled by *stateen0 registers.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..fad1fd1fcd05 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_SMSTATEEN		43
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..fb0df651bc48 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -217,6 +217,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a8f66c015229..c3742a765f8b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -301,6 +301,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				/* sorted alphabetically */
 				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("smstateen", RISCV_ISA_EXT_SMSTATEEN);
 				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
