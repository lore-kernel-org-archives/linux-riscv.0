Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EC3C32773
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTLToXMiaQU1/KHm6XOAKOAUa6fWUO868vx1mL+tCbQ=; b=vMtbvJ4hEgCreT
	exoVJ4mmqvhTXK6S3hXk5xYrSBcrn2Tk9+cXi48cldbeNnZ6QbANUvV9iIfB8H7uc0r/FwhdCc371
	dbIrFxWFrXhPXJ5YwdhaFfmjlvkr2qrMqeKuc3B9H7BPDnGTzD+iEfKfWrIx+OZcPasGsYFkSir22
	b6b9pHkJ8/ML6Z89m7hDXQx9sSj4Vr8Ybi9luMX/VeI+M2OP9QFlnk5uuIPOysZ9n82iS7VjRo+0T
	o/NrfRHFSFeSqpu9SSJr0+7ZrBDuWWTj5/aJZMfBMtiRq3LDqbFN4kY8V7DiXFDEpTr9FtYHTyfeA
	uNM66dP7etrh8KMDOY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2ac-009Kkx-FM; Fri, 19 Aug 2022 14:03:10 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aU-009KZl-45
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:03:03 +0000
Received: by mail-ed1-x531.google.com with SMTP id r4so5779303edi.8
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LcgnJW6ojeblPsIc6aD4dBYb9kEDQlJtOgpSlsoKicM=;
        b=F80xmYw+kiDUqtNmrzbNRu3AMt+mM4KWjQ42y9dE39l2VAObAeVzJz7WOy3CaH+xqJ
         HjQFKbjRP8H95Cvp1amKY4+bgkO+Q8ezZA+n36ktinonyBVDGWqseyAiMkVn3ZjlVSRU
         OP2ZTa5gEjM4qkWsbUpzVjW7WPsIyZVoo3CpxIG5oJTwBzb5T6HbH9MiPSERJmZ4gJc7
         nGydDtHDyOQLS8xuX35EzecVSa5Ps8oRsWygtCnzFyt08+Zft1JWq+rS+91NapwOe8Cb
         mw+eaxgcOx7tSnsIWtEuxjnhXC+7Mm7R7XTz9ra9Cq/hWcYlAy/buYnqh9byFUMouQ9T
         a3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LcgnJW6ojeblPsIc6aD4dBYb9kEDQlJtOgpSlsoKicM=;
        b=bSPjvA783C2gu0mqth7UM0i9AH0aNxZBAcqcb9zi/6kYWfRd+mWZWFMDD2Qd3atuOi
         ROfNAP+POXuoQCRwNlPEgFWxhfTwxtU2QRyafDb0hyLTQUoEDwYB0xzH8B9NHQENwvef
         7gsrpMG+R6tCjwVHYZAYG1XE5cRCEsWEi8Q0f8TI4mUCNVgiGXqc4wYdsZSojOtCcvL9
         QTFu1Tkh6L1Z7piUAOry8r34aO2mBQP3SCsZkmAf7SzNoe04pAoEy12ihu46P7U2TC8G
         g99V5EzevulMx6jaN35KUcng2pmHlyGfCT9+/FeM/+Ty1DZuaBwRu/zpo1DTAFhR45NE
         R5zg==
X-Gm-Message-State: ACgBeo23sxoXfID/BwvjZkhKFv6awCVr62eT+X2+ShGhWhxgaMoKoRoB
	9b1n8Xu6AmGduP+ly3FqqnxYeRcLvfk3yg==
X-Google-Smtp-Source: AA6agR4EFqr57fc4jUDyesvyg8veXZkmFiKZWBlvKiMpyMHLIIftipgiufj4xlvJJhTBKrr1NYctcg==
X-Received: by 2002:aa7:d513:0:b0:43d:5c81:4f71 with SMTP id y19-20020aa7d513000000b0043d5c814f71mr6235776edq.308.1660917778037;
        Fri, 19 Aug 2022 07:02:58 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id p4-20020a17090653c400b0073bdb2f6f28sm2271393ejo.217.2022.08.19.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:02:57 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	heiko@sntech.de
Subject: [PATCH 4/4] riscv: KVM: Apply insn-def to hlv encodings
Date: Fri, 19 Aug 2022 16:02:50 +0200
Message-Id: <20220819140250.3892995-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819140250.3892995-1-ajones@ventanamicro.com>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_070302_195287_8BF45F67 
X-CRM114-Status: UNSURE (   8.82  )
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

Introduce hlv instruction encodings and apply them to KVM's use.
We're careful not to introduce hlv.d to 32-bit builds. Indeed,
we ensure the build fails if someone tries to use it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/insn-def.h | 14 ++++++++++++++
 arch/riscv/kvm/vcpu_exit.c        | 29 +++++------------------------
 2 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index cd1c0d365f47..c66d5745c5b4 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -87,4 +87,18 @@
 #define HFENCE_GVMA(gaddr, vmid)	\
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
 
+#define HLVX_HU(dest, addr)	\
+	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(50), dest, addr, RS2(3))
+
+#define HLV_W(dest, addr)	\
+	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(52), dest, addr, RS2(0))
+
+#ifdef CONFIG_64BIT
+#define HLV_D(dest, addr)	\
+	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(54), dest, addr, RS2(0))
+#else
+#define HLV_D(dest, addr)	\
+	__ASM_STR(.error "hlv.d requires 64-bit support")
+#endif
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index d5c36386878a..9cb075e72799 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -8,6 +8,7 @@
 
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/insn-def.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -82,22 +83,12 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 			".option push\n"
 			".option norvc\n"
 			"add %[ttmp], %[taddr], 0\n"
-			/*
-			 * HLVX.HU %[val], (%[addr])
-			 * HLVX.HU t0, (t2)
-			 * 0110010 00011 00111 100 00101 1110011
-			 */
-			".word 0x6433c2f3\n"
+			HLVX_HU("%[val]", "%[addr]")
 			"andi %[tmp], %[val], 3\n"
 			"addi %[tmp], %[tmp], -3\n"
 			"bne %[tmp], zero, 2f\n"
 			"addi %[addr], %[addr], 2\n"
-			/*
-			 * HLVX.HU %[tmp], (%[addr])
-			 * HLVX.HU t1, (t2)
-			 * 0110010 00011 00111 100 00110 1110011
-			 */
-			".word 0x6433c373\n"
+			HLVX_HU("%[tmp]", "%[addr]")
 			"sll %[tmp], %[tmp], 16\n"
 			"add %[val], %[val], %[tmp]\n"
 			"2:\n"
@@ -121,19 +112,9 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 			".option norvc\n"
 			"add %[ttmp], %[taddr], 0\n"
 #ifdef CONFIG_64BIT
-			/*
-			 * HLV.D %[val], (%[addr])
-			 * HLV.D t0, (t2)
-			 * 0110110 00000 00111 100 00101 1110011
-			 */
-			".word 0x6c03c2f3\n"
+			HLV_D("%[val]", "%[addr]")
 #else
-			/*
-			 * HLV.W %[val], (%[addr])
-			 * HLV.W t0, (t2)
-			 * 0110100 00000 00111 100 00101 1110011
-			 */
-			".word 0x6803c2f3\n"
+			HLV_W("%[val]", "%[addr]")
 #endif
 			".option pop"
 		: [val] "=&r" (val),
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
