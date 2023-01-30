Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4B9C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzg+zjYmGfgoGBgAlX3H7UvyCOjLWje4QqQm79UWgiI=; b=wGWXNHNjEva3g/
	dEbheSZrMm9GEYVm2eFc6p7Sfpy0z88fUlnbOpOOKoEowL2c9xkjprN4iIK8Gudk3Yx561yriVTqE
	/2JrQNqnbUR6f10cC2IprLzhsYsCpuFCpKuV19YTz5FGGreYYImUcnS7Y/pmDNFfALOnKIPw9hS9V
	m6ar3iiNcHxDxL2hglB1JLuRNYAGWikW4Yxo2z+0vrE305OVFqIhSXaEBrlXHYOiWq1gAcjzJg6mD
	GKvQl0Cr0qhdHLQwNg5bwptVNhmjpG0WKVwXkmdExHMeUUzEg14sbgVNWxs5IFzu4sC+3l60pJE8D
	2joxJinFIF+5ARGWkB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSrA-003PKT-MO; Mon, 30 Jan 2023 12:01:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSr0-003PA2-Df
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:01:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso5146859wms.4
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=FBBCrHDLcZIwpZIFFr23Mw6NZdyt7URvQ6mOEb0h2FYiZsvQJgl3+AE4V4xyw+bTgf
         JQW1v9G41RZsd+wR61Fi7GA3ZzX8bdqHEFwOihptCL/FAWL7DfbzAFtX3t9lXFe6e69w
         2tN7o5ouc0CU9252QUVHBHwoi2nXS2FHkd/fhsfBmehZU5ZPQyKgbj56O4e/rM/Lvib2
         OH82e2PfnY8huMSX069AwLyR0Zwt2oV5MVY6RgPcTkSU1BCoJkB7zA/LLTtKgp38cuKP
         jGuTZhVZa3vYRH6KWPfyCGQ3lPh/ggl17vpBgCIHsCnxOZ9YK8H/Tec7qcjre5pSSbCh
         wGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=lwoTO7aE+HjWOodtwqR5a0JMMT1UnC0rv9yspdjgXfJJT+v9ziyFsaO58O8VyYGGhK
         R07WC1BEh1N22dpWVI7l5uhztTlBaj7uR+q+Wh0q3XNVk7/uRoNz8d9P/Qof4+RX20hX
         l0ZolsfTQW/GIe4aMZXLrFPsv574H13okhirU0ychofJhbscnR8hv/eRiUuccK3BgY3j
         PyaPUtG7lnzsmoCr4aIMYY7oPOlKoCCkHsYgMwifiCNnLlh2SmwwVIqn1rMS/rV853kJ
         56p4gzEndYqLm+aeMHkV32bkrGQgmnGQjvyYTRq0PtS+7x7ey4l88V0Kd71tAczSTILt
         9/sg==
X-Gm-Message-State: AO0yUKU4IUdIC6Psyfx4i2Y/9JXzj3TF4YFGp6YPdPWFa9W6WoEgx0uF
	BiV2tOfeivueFkRVH5tsBVRhwEOV2HLGE+4i
X-Google-Smtp-Source: AK7set+vlIXaacxs8ZtFvZu5Wuo3OckV4hDJBqZ0iP3d/rZxsjNJoGharDe6eDWMLFzJIvp9qqkgaQ==
X-Received: by 2002:a05:600c:3ca3:b0:3dc:1687:9ba2 with SMTP id bg35-20020a05600c3ca300b003dc16879ba2mr22946325wmb.35.1675080098179;
        Mon, 30 Jan 2023 04:01:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003dc521f336esm5652568wme.14.2023.01.30.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 04:01:37 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Heiko Stuebner ' <heiko@sntech.de>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v3 6/6] RISC-V: KVM: Expose Zicboz to the guest
Date: Mon, 30 Jan 2023 13:01:28 +0100
Message-Id: <20230130120128.1349464-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040142_482223_F600AD75 
X-CRM114-Status: UNSURE (   9.87  )
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
