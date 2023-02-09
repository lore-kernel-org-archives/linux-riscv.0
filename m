Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CFFC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzg+zjYmGfgoGBgAlX3H7UvyCOjLWje4QqQm79UWgiI=; b=mbRNfxYHgJpmWQ
	dAqcVhq5wBZOvXCsL6lg8VPTgZijR8vEiNZ8/AQHyCEFuvymcoGv8mlhxpNeIgwFe2247+RpzuZyF
	e3YpuxBKCyOon5LVtzpRNqSPBc7FVeNMa0Ozyz1HpXxVadYnxowSwG8B32kBKHcstgqXDfL6AVTcd
	d0cf2eeSa/+bsRs7frKd6twCd5aDZglJ2IHAY/b8nLBh1zB4AViL6VtMz59C/t7yXsdiknyN6OoD/
	K6sGDSchcvztfHdmFTmxJPQOaaHlrrU+JXKtpLudAcLTeqQ9SNve0olE6G2t+KLyNBZE00nBVXP9C
	cAz0IetodeKHMYhkE8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8p0-002CmQ-Uw; Thu, 09 Feb 2023 15:26:51 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8ou-002CZV-Ox
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 15:26:46 +0000
Received: by mail-ej1-x633.google.com with SMTP id lu11so7448631ejb.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 07:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=nwYv73IBL76wvzePwxmU+aAO25GztHrjPvbBh84keW7by4vzfzJ424ns2dmlnegR66
         5pC8IqnKxRSWs7nW3K6Z3+0EfohmIPfimixNoTpDVF6kl/udJ5fEw7Wjxs89AQKNzpab
         BeJfGE3nWSdnXEIc7Xe40RS4cMYEmM+L/yKLj3QR7O0EgoHmr8YfV8rwHcdu0dAG6nZI
         LXEA9enjY1CLJ1bwRLY0t/vcdAGrFqYaTdUAVqXzNszI2X5NbvdO/h+A+NcivAgrN8hA
         u2qjvTZMiO4bSaXmNLmFdVPlmKaq1ha47VvV80+RqgZ1AGkcq6dONzQNHIGydjJ3SXO9
         JCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=CSlLK+GGNQK2nu6vUPq+EZbSB0NtxBB26GaK6ddEBYG61rLG+owYpADPm43pn4vcAZ
         YhlWxzppcoFRI+dHX3ezuLYgCG2hsipIHiXtXUWcGA7ZgDU+VkRxR24HwH10q/PQkH8o
         KKqD9qwg9JKpz5/dkzfUUPsIHGQ8/EETYYoSJ3bxkoD+9nrQ08oc2aHhxWaDZq8nIrAA
         7oiXHg3NIqOrD9MCwegZhYnRJR7BqJ5u5th7U1s0Vzz9ljh/qHG5krFyV0XHuKOYqPKG
         1CXtJ+9ibhhebAVfiIUEKbSYzf3rRXC1iDsqXTZybo5bN93/pvPzHp0MVwz2JCfaU/tB
         Y1jw==
X-Gm-Message-State: AO0yUKXdwqbdhG7hHHKzIwcOsTXvS9V9/jHCRPnQ2CgYNmUZq6aQmmFX
	v1vt+0uqY5aW3cRlc7MSTOLw/yD7mx+jBuI4
X-Google-Smtp-Source: AK7set+6etukwMom3zRz8gzDC7K5MVHmeyW0lzWdeuswVGlt8atxVizF3BtHxXdMuT9fZpzwcjkBrQ==
X-Received: by 2002:a17:906:69c6:b0:881:f614:44ed with SMTP id g6-20020a17090669c600b00881f61444edmr13899347ejs.30.1675956404230;
        Thu, 09 Feb 2023 07:26:44 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z22-20020a17090655d600b00871f66bf354sm976530ejp.204.2023.02.09.07.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:26:43 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v4 8/8] RISC-V: KVM: Expose Zicboz to the guest
Date: Thu,  9 Feb 2023 16:26:28 +0100
Message-Id: <20230209152628.129914-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_072644_897168_32811DE9 
X-CRM114-Status: UNSURE (   9.49  )
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

Guests may use the cbo.zero instruction when the CPU has the Zicboz
extension and the hypervisor sets henvcfg.CBZE.

Add Zicboz support for KVM guests which may be enabled and
disabled from KVM userspace using the ISA extension ONE_REG API.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index c1a1bb0fa91c..e44c1e90eaa7 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -106,6 +106,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_ZICBOZ,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e5126cefbc87..198ee86cad38 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -63,6 +63,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZICBOM),
+	KVM_ISA_EXT_ARR(ZICBOZ),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -865,6 +866,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 	if (riscv_isa_extension_available(isa, ZICBOM))
 		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
 
+	if (riscv_isa_extension_available(isa, ZICBOZ))
+		henvcfg |= ENVCFG_CBZE;
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
