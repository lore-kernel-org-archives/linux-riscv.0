Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C16CECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RImhohm1UwW1Tqei9Zv94Dte2SsGS2w8gvtXYPNxcM=; b=hbAZoAnbOzpOy4
	1CqLoXEL0i4t62CdpcbrAFZ+3fOnPTWLaR6jrIQILwulresu9nll8szmaH3Ig8NLxbr0ynKIu/pXv
	6pZwT3ozsrSRaAXoT5fc3VUaiY8i8MTiHstUYPi59oLd+dA0fxbIvo9LAXgWL/EtNtJFziyDMUB5U
	VyCBhpcA5B91Aqy5DjkD7F/QMMI9D95MGCsnVbkbdHczjIP70EYq2y+OJ2ZzIgmSWnUkNZphGPdIr
	YGkXN2vmbOuBfjeEHaFAw4vzrx31tZmC6ED55RTH8rG6e2JTlFW7iNl2UtQRguXz6YtBBBM8t6Va1
	Pw/5hH72twE52JPyMIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaoe-00Ezxa-Or; Tue, 06 Sep 2022 15:48:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVa2K-00EVji-KM
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 14:58:51 +0000
Received: by mail-ej1-x632.google.com with SMTP id fg1so1802771ejc.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=K0PbgrG3aEce+RNqVBrfv7es9LlST45m+grejWUOs6U=;
        b=JjVBKPmn12+WFYE+LrXqeM9337vgaN/GQQeV4Wz9ORmbmIVy02DBR9Roez2rI1BRyF
         sUitYJ5ACuRSvUxR+48IM8pGvI5ecrAVwcGHp0RB//jl/HBIGptfHY0uxz54CNsStYEk
         D1dAcBY59m+xR++uGNu6p3Xym0t/rGRDQx7NBAu90hToQfO2aFlwQl+u3he/7DLevMQL
         kFRgyJfOw23cl9Wj6m6YfPtrr4e1h79jI57b8Zzff02i2zJjkSvhKgEqWN7fy9oDN+Rl
         6sQH2H3ql0T7Mkbo9mIBf0xdTTQ5RnaNBELBmEzt4DHIKeTHOBZKXkqF++runpH4XUUH
         pAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=K0PbgrG3aEce+RNqVBrfv7es9LlST45m+grejWUOs6U=;
        b=ui9y/Q37JpZY2pOCFkhcpfL0PUQ20psY7/fVezqI8mwRljY86YZCYbPBaylNTPkZob
         v3x42RGdejtUTYnun32z4SlsyNl955h/xItfiFKfesGt5MSKZzDuvB7T9yXyc+aiS2Vy
         u+qPla8uLoWDP9bgUam9sBvke08K069XoWjN/hHlGzw41CCC48dZcs9wg4r+L2tLv/at
         L3MjPdyPaxOwtVQqgqI0FpLjmKmQ83GyafHyKq88iD9xCeoEO9CsijMrmt2LOepIzq/Q
         uXatvfAxz+kJdMTSHwmM0jY8JMRppOYsBhmrtvL99Fkez0nnhMihLwNZf1SJbDWWaOrH
         N+6g==
X-Gm-Message-State: ACgBeo0C5lsciPFXXlQ6z9ShVEN3N0l11kovAyk5GryKMfaegPVuQiYY
	6tIHmSApBetkBoIakkptT9KynHbtIeK0Kw==
X-Google-Smtp-Source: AA6agR4Db4cFEVGFNcMKQiUQ+MDMQvoWvwC+xL5nYeSHLY3i/2oSffAP5d3J2FqzuRJuHEVwDReswQ==
X-Received: by 2002:a17:906:974a:b0:74f:e8b1:afbe with SMTP id o10-20020a170906974a00b0074fe8b1afbemr15271848ejy.38.1662476327010;
        Tue, 06 Sep 2022 07:58:47 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id h10-20020a1709060f4a00b0072af4af2f46sm6764613ejj.74.2022.09.06.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:58:46 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v2 2/2] RISC-V: KVM: Expose Zicbom to the guest
Date: Tue,  6 Sep 2022 16:58:42 +0200
Message-Id: <20220906145842.965488-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906145842.965488-1-ajones@ventanamicro.com>
References: <20220906145842.965488-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_075848_706962_42E0CE5E 
X-CRM114-Status: UNSURE (   9.86  )
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

Guests may use the cbo.inval,clean,flush instructions when the
CPU has the Zicbom extension and the hypervisor sets henvcfg.CBIE
(for cbo.inval) and henvcfg.CBCFE (for cbo.clean,flush).

Add Zicbom support for KVM guests which may be enabled and
disabled from KVM userspace using the ISA extension ONE_REG API.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b9a4cf36be4b..ed37a4a6e5cf 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_M,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
+	KVM_RISCV_ISA_EXT_ZICBOM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3f36e79876e7..3ce4f1c11b4c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_m,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_ZICBOM,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -795,6 +796,10 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 
 	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
 		henvcfg |= ENVCFG_STCE;
+
+	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_ZICBOM))
+		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
