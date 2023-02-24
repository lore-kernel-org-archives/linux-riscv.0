Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D89AC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5Wf1eFvy/cBKawu2msDS4aiETqxCDi/aLGvVNfeZmE=; b=JbModVjpbM2pne
	FHTszTldDbz9apjRpj8JLtnNZYnXXvRi1pzphQCpR+VU2vUMuMKOqLjE4KX/DuJkyHKbfgxSoqOQI
	cLaQyHk227h1/SxvkrQ7Dazy/DM0gNwjb1f5UYH7Dcy5XpPD+ZFA4i6L2THxwzevcWr92C1gX0EtI
	/hcvo7Hks0CWU5ZUWtczTK7q5a5ftGwoMds2HynoNTYDW9CeIjeFc6mtP6cakdWFU1hVnzbPpmOwa
	cZlx1A9BXHNEuYi+hmihTjjhNbt4WjJKamgXwrGyrXBbe8DkMELR7fhECB6hBw67nrXSBJnfv7cdZ
	4Jfpx7qnbCwseAEgumIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSE-003DFb-Im; Fri, 24 Feb 2023 17:01:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSC-003DD4-OH
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:01:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e5so121732plg.8
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6oiv3GoujeROo2FqQ+/nZWilhp/M74Q6K5tii11K258=;
        b=LzukB1Ftb+M5MWrggVI5waWvR8vdX9YlggE3kHxi8SvIjlY0WBOiK4Qk3G3OqOlO+f
         o5iaGOv+Jk2u8xArSYJs6lcf60wopis1zkgscxl32hQGXXj6NznYuElTTliv6eE6WFtX
         vYCEzbORkh7x72EFmJlHoWNak1fiIhIExMW6ok0bp6YEHwqHZmOAc+JXJKkT1oU+sgvP
         mqQocNe0SaEEwYe3sAIKO0aobzHcm653wN7DvJhk29olHwR0DG+X5KL0mgzPHbUHsFcy
         9Spe6QGK7lxIRlAN2q77nG4M3PRMa3rM4YlNmqNXuW+fZ1ewL6TxFYBhefbMENXnJm2M
         vCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oiv3GoujeROo2FqQ+/nZWilhp/M74Q6K5tii11K258=;
        b=tmESaOt5cMytNF2h1OhoZHBBXKBJYeqAshInj/RPS8CS1apbWik0vBWchGRsK8hNgF
         SHvVd6zeKiKytvTy2eEN5mhWOpp0DxXLg82ec87soIAUOE6OfHEpylaIFb75VdfeP6XH
         MsPL/s9vuBK0Vz3tYVEr37cp7fnpay7w3icQZILimfw9gxR/SdP23F8PLRrY+Au9xohr
         0ArkniBIWTKKm7qpFE3WmNt6xGgLhDdh2d9vWup9D1+/Nbppy+vzaT7ecVb9gfC8tgq2
         S6XyZaQgBrtOrxbzxQqF8wyIZ2bjy2N4BEgAPEmvfC2SXlDjfkrA0g9b2Lezo0143HjA
         adUQ==
X-Gm-Message-State: AO0yUKX6qgHCwpsYOrH1cIwh/u0o/IFLJdZxNQmnqGdnPrljW+F9URT4
	Gzm78MTWWagZu7C7efie1LMQI2RYAZ/utnmeov6Sf15oOaJcHa1FTFxDUAS/uTtWGJzpjfgw3Tp
	pB8+UGvBHzeuRnVfDBV2o7pumuRExEI57M84al0sfL8/62WPDwVGT2mtzb2LW+GqjfDg4Sda4J6
	bWZXLAZGEoAA==
X-Google-Smtp-Source: AK7set9y+i1eXYSbsemD/Nfvo8qLXh5WeFiF1PxWHM/91G0NMz9WVkIIPYNpAJsYETY0ho8DaVVAOg==
X-Received: by 2002:a17:902:c40d:b0:198:e13e:e73e with SMTP id k13-20020a170902c40d00b00198e13ee73emr20251145plk.53.1677258110286;
        Fri, 24 Feb 2023 09:01:50 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:01:48 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v14 03/19] riscv: Add new csr defines related to vector extension
Date: Fri, 24 Feb 2023 17:01:02 +0000
Message-Id: <20230224170118.16766-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090152_811426_01D36C69 
X-CRM114-Status: UNSURE (   7.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Follow the riscv vector spec to add new csr numbers.

[guoren@linux.alibaba.com: first porting for new vector related csr]
Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
[andyc: added SR_FS_VS]
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 0e571f6483d9..add51662b7c3 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,16 +24,24 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF       _AC(0x00000000, UL)
+#define SR_VS_INITIAL   _AC(0x00000200, UL)
+#define SR_VS_CLEAN     _AC(0x00000400, UL)
+#define SR_VS_DIRTY     _AC(0x00000600, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
 #define SR_XS_CLEAN	_AC(0x00010000, UL)
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
+#define SR_FS_VS	(SR_FS | SR_VS) /* Vector and Floating-Point Unit */
+
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 #ifdef CONFIG_64BIT
@@ -297,6 +305,12 @@
 #define CSR_MIMPID		0xf13
 #define CSR_MHARTID		0xf14
 
+#define CSR_VSTART		0x8
+#define CSR_VCSR		0xf
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
