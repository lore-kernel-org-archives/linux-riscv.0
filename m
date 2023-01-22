Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AA2C54E94
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRJLsVqhH4GQHLw137sC3gDYc69II7gkyHi4EtSKKSM=; b=Yd0ps1GOqnlVoq
	ZzJ/rdjtM9+uaqq86JEmbOjI3pWmUSGhrkqKpql89QloHU6lzSYyqOFlteoiQS+vKlD5R73Xvggwi
	yT+LXxpC/biO8W+E02voDg7a7Eu8Uon/HyE69zY93HXbuNBx08NHYSEnM9TllHHMrnD1t/q+ks2RY
	xqHOPyu7oFgdZQhuUGt+lmesdtDmFHtnGnqabZMWSmC0AMlyCxYxLWvIFM06XIdAihz/aL5fr5pSO
	z7BvvyeAUdy69T/iqPB6akER2xz6F3kYFQmGqqLZpdDdgFRYz+nc62io1N819ddbqfbr1mYPtzPjW
	IsEHEwwY538Xcu+B/NXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmn-00FiK5-W4; Sun, 22 Jan 2023 19:13:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmd-00FiDZ-JF
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 19:13:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id mg12so25589592ejc.5
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 11:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POaDL4CkNt5Bp5lTG/itrHZaXx1ESV7Beplk4iXfiSI=;
        b=NEnaCXppZ2cl9yPKEjOKjrZt3VJpBLYBm7O686EtUXya/SxFi9JBJAl8AUoBte61UZ
         KQcME9tZ72y4oQDGxNXQFoVosUIjUjd+Gqz21a0gFVg673D5Ya6O5/ioSjcOgFcl/ocN
         ZVguTjSrR5LfNsUTHJwdxnAlgx4J6GS8hqROhCIayg0gnKf+gc9t5EL2hdD2p35YQrPH
         ee2sYBUUYT8/7NVorJfi2lrfIj541wHDp0InyVASg5e8kzHCO0d1L2ObC0JVIg/5kaXd
         aXmChJs+DqpnCD17NaIrySYkkXQReIzTwXzCGIdl0hIFWK2VYsdzkLlqDCHjAD3OuUJg
         jppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POaDL4CkNt5Bp5lTG/itrHZaXx1ESV7Beplk4iXfiSI=;
        b=LLsUmTbcQ4M/3j2F7OICFVn9TVZNu/0WOGe9JivVqjXmuCdBCJNrt9JpuBIVXtNOsH
         FnrzPFodCikzxhtUQBiREd6rFYcPg4gi1m2PdiARPsN/PT7CHCrI3yTfP/4AbtRH3JP2
         C3nB4SQ8kBLkSk2lInzieCt9Ssljrwrr+6zAsUOMnsKPZUYaMjGDVFOySAzvvgEJ7z3N
         0FIsGHNL6cS3Rc9HrfCMx1BbteYgyLzmrKJFmF0/koLeXtX34Y3+CjhmL1BjfTtTYD6f
         5fEaFd+5E+Au0qSQ6mKaPA14PZVGkTPlyiOEWsSBmfbdfdB+aOJ1rds8gdHFfP/7danL
         zpuw==
X-Gm-Message-State: AFqh2kqXqOADUz+tUnMNnYHU7ST5oRBdxwLWSTNcQRV7BAJAlDTszOn6
	xXY941UlUj3Wp9pAdnRsy3vitvZtNNvCkRiB
X-Google-Smtp-Source: AMrXdXuuAvNzYRt+X3qufA56W/p/utXkKoId7FJvOPy9PrlRmUPIv6QxPtHMUY/kHn84VwJLnq6XTA==
X-Received: by 2002:a17:907:989c:b0:86f:cdb1:ea00 with SMTP id ja28-20020a170907989c00b0086fcdb1ea00mr23612539ejc.65.1674414818289;
        Sun, 22 Jan 2023 11:13:38 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id la17-20020a170907781100b0084d3f3f9984sm19402758ejc.114.2023.01.22.11.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 11:13:37 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Atish Patra ' <atishp@rivosinc.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 6/6] RISC-V: KVM: Expose Zicboz to the guest
Date: Sun, 22 Jan 2023 20:13:28 +0100
Message-Id: <20230122191328.1193885-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122191328.1193885-1-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_111339_651257_24DC4D95 
X-CRM114-Status: UNSURE (   9.23  )
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
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
