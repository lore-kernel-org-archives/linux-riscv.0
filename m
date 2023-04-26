Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC5C77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrynfbVcz/8nmdBwXoBzSQEArqfwiC0RTkWcnGBwGGU=; b=MSibNn5in/hl1h
	zDUZjpp0UH8nMtbJ4jgE9oliuHtEHBZgqIRRYytyO1LZBPR4VlNAs9aPm9E/OAsfhRSZavm4pzY4U
	blW5bsv/hre68O9YJoNTF16OxDf0KfFVL5hAsqByF5sShDXTv627xUxZWJF3ilLktR4KC+qK0ntsE
	Jn0yVnZ/IipHebvKQIP1DAvszvx7W9iu8r8U8QMNsYUDRppI/edTa+nSOBAgEhniFt4jBmFWilXE/
	Wr1x0O1zAPQedIF5gdsXSvqnCZfkRMOEzXkL+2RLr04CfoeOxiBfjp3RWKN97W4bsdPmyjiXS0dFh
	KgYqjYeF+FNRSd55OD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prii4-004UKN-1u;
	Wed, 26 Apr 2023 17:13:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prii0-004UGE-0C
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 17:13:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-94f109b1808so1406232466b.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682529214; x=1685121214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2t91pIf4+2i19zzmmslCDmFjK0SYDa4k9dLFYZoUjk=;
        b=miOdfxuqHzMzoOSkqNvGdojuPUWOIKH2Kxse5V14s3UAUXAdYi2L/5m3AVhmZ+wgE7
         krJTdYYcc0aTAkzHTDkp7ZG+pVj3uhkUMgLfnlveUITXiEwPMFY0T7ZAqqV//nVHCjFe
         yiF16sZUCDfIkJ1XQWckQfmu4QgvKWd8vtKf5lwwO2U8h29+s7bcbT6ZmP4SZ/vME6D2
         VfVfUATDCkZ7F4GLfHNRKGN5v9q1dMJU2T6EUA1XwjcrVf+W5lqWxY7FCF7hm5ei/s7y
         XCIBAQQ04c0Rdw9MqqZQ1UX27dMpsYDZvkXP/KV4YhmIlq/mswPhG24RBQHzw9jmFbUa
         Mt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682529214; x=1685121214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2t91pIf4+2i19zzmmslCDmFjK0SYDa4k9dLFYZoUjk=;
        b=SHhyINg3hVIPGMC+FxTX9InebtmQLEff3ZRo3uS4N4dvopnaFivOS7sl0af/gzm497
         KCI1bo6u00zk+mV48DeCuJrX7VdcvI6wxtmhUR6mR8V5u8ZC/ygrf2BhqLT4z2z9cL7r
         XDZm7fCxMEfElyhqCvhHsuJ5IsXw4Eqr1wSOsg1ZBpaqYzqZAgDigHepbf4zWwdg9k8p
         3/YxGtraG8z2cpN1hUCmlUjzLxCo15C5dZyUsVah4xdDbLogZKr5k4LkcL977GQouKif
         Zfm1byplq6+rCWw4MVXPOHILYbKJP46ghJxfFpO/Szk7kpZR4mLPOrqSxHLu9tkfDNCc
         XxNw==
X-Gm-Message-State: AAQBX9cno0rFgjgW9SZUn1JbrPkrhAXdrqDaSc/sTQ4J5dba+hAjAKs9
	/EBqkLmJ/zDKE4cRBi1nKzP+/g==
X-Google-Smtp-Source: AKy350YfsT9n1WhH3XV2GYO9+nTVvkYji/9HQ59CGhxf7J6PypkpJr3BYCSgpe5A/uZnwCr2KLk4jw==
X-Received: by 2002:a17:907:8195:b0:94f:62a2:d1ab with SMTP id iy21-20020a170907819500b0094f62a2d1abmr13881545ejc.63.1682529214056;
        Wed, 26 Apr 2023 10:13:34 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z11-20020a170906074b00b0094f3c281b34sm8370863ejb.196.2023.04.26.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:13:33 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>
Subject: [PATCH 3/3] RISC-V: KVM: Introduce extension_enabled
Date: Wed, 26 Apr 2023 19:13:28 +0200
Message-Id: <20230426171328.69663-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426171328.69663-1-ajones@ventanamicro.com>
References: <20230426171328.69663-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_101336_103052_8EBBA1A3 
X-CRM114-Status: GOOD (  14.28  )
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

We need three SBI extension status values (uninitialized, enabled,
and disabled). Pairing another boolean array, extension_enabled[],
with the boolean array extension_disabled[] provides four states.
Using a pair of boolean arrays, which may eventually be changed to
a pair of bitmaps, is more space efficient than using one enum
status field. Apply the new (enabled=1,disabled=0) state, which
means either the extension doesn't have a probe function or that
its probe was successful, to avoid more than one probe of the
extension.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
 arch/riscv/kvm/vcpu_sbi.c             | 11 ++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4278125a38a5..e3c5e1d15e93 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -16,6 +16,15 @@
 
 struct kvm_vcpu_sbi_context {
 	int return_handled;
+	/*
+	 * extension_enabled[] and extension_disabled[] provide SBI
+	 * extensions four status values, of which we need three:
+	 * (0,0) uninitialized, (1,0) enabled, (0,1) disabled. Using
+	 * a pair of boolean arrays, which may eventually be changed
+	 * to a pair of bitmaps, is more space efficient than using
+	 * one enum status field.
+	 */
+	bool extension_enabled[KVM_RISCV_SBI_EXT_MAX];
 	bool extension_disabled[KVM_RISCV_SBI_EXT_MAX];
 };
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index a1a82f0fbad2..344d38bbe06a 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -155,6 +155,12 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
+	/*
+	 * We can't set scontext->extension_enabled[] to reg_val since the
+	 * extension may have a probe() function which needs to confirm
+	 * enablement first. Only set extension_disabled[] here and leave
+	 * the extension_enabled[] setting to kvm_vcpu_sbi_find_ext().
+	 */
 	scontext->extension_disabled[sext->ext_idx] = !reg_val;
 
 	return 0;
@@ -317,7 +323,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 		ext = entry->ext_ptr;
 
 		if (ext->extid_start <= extid && ext->extid_end >= extid) {
-			if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX)
+			if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX ||
+			    scontext->extension_enabled[entry->ext_idx])
 				return ext;
 			if (scontext->extension_disabled[entry->ext_idx])
 				return NULL;
@@ -325,6 +332,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				scontext->extension_disabled[entry->ext_idx] = true;
 				return NULL;
 			}
+
+			scontext->extension_enabled[entry->ext_idx] = true;
 			return ext;
 		}
 	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
