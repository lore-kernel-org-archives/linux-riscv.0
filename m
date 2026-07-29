Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8146C54FCD
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWNy/BZp96HnyzYKUm/vcDG3uiM9TkL4yOdchUdpJnU=; b=WRifDz5PhzMmiG
	8ssM5zHqoDgOgmVWyGhIMavcNZ7qtNdUhVv9+4I86Y8o7yQngiqDHD//TeDqB3/RolNUvA3e4fhVY
	MRnDihbdQi+9etuooFqc/TuvJKCPeYvESnKUwYnkohJh2CizxsHQBv4lpffNMrvUEzU30Z2KiF2RF
	XD8Mj6UrdeOiKWyiIbvqWLyt4Kvr3j7KBhb+bF5g3hoMLcFuZBTT9qATbl2Ptv3fufSQgueTXLByB
	qv3GABP5iN62nJQFSogR/ZKrNyDv0l924YCg7QEtfk3QGP6UtBQqEyzdQl5riEJPkxomUmBDuegst
	MRH9B6Eu59XLfBmkxbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDen-000000096zh-09rW;
	Wed, 29 Jul 2026 23:25:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDek-000000096x8-1CTX
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so152543a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367545; x=1785972345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig1ihYaIcCdMTQNvyfvc5KxHcD85RFL0JcLOryGs+LA=;
        b=a3CJDA8AWRM6oLscxY4XUwyIK/5DJsxTUqHYxLx1v03901qQOCkuBd6ceL5MY/FWnj
         yTrbGlNuplWX35g2Bn3Q1iqwjHQdUBmxnhX7TZ1dFv5oKfbwwhUBdIPUsoXz8upYG7I8
         ZogofafVu90cX4KmcmsDklm11mlXzjMA5t6pLC1JYyVu3YlIdij6f2+9kZWlGetKnkD7
         ouQBt/wyb6RNX2VzWnbeiLYoqaz1AEjT6mzXDs7/p5tcfiLAEBby+DVTIEcxSlES+07U
         zR47DH8YTjJPXF1riNcY5svrx0sG+i4lNsh/MLtuNonLSfyodY9gAisRwie+R2itKuv5
         1m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367545; x=1785972345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ig1ihYaIcCdMTQNvyfvc5KxHcD85RFL0JcLOryGs+LA=;
        b=B9u0hQG8kBFPKWuqbYOrEF5GRjP3QT5YyryTmVW9tHfzqKxQuNZ734edONaZcFBBtT
         maZDXC/IF/pM+mmMcCx7D2uMBbgw7rYPia/scH2vhSpI6YfoyDpgyhakTPRL9eF8tTZc
         s8j7sGj8wMgJfturMXT3yRs43o0sp1bh1ceO/7GV6eKb6JevRjgshp92CHeQzA/RLrZh
         nQTASmwLvAH/ImgZRtooMwNA5nSX4wy2WaKsDvU+8W6mF8fP4VMcvQECfZrzsjtd5Zuw
         qdGxUz/AjgiiNWXZj45SCJ4Pbl9PjLDO8ehEbr+yHBHa8UA5j5yRI7p4PS5f7bKDjpvq
         C9Ww==
X-Forwarded-Encrypted: i=1; AHgh+RqOwHE2J/Gd7bwkKoSRUxoLR/k9uS/ZdKLHTuWxirtPN3sXECX+Cr0BJmh6twOY2dUnlFDwjwA+0xqaFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS08lBlPfOoe2uBvq9zhfkpzEsfaJR8ykWBbHqQYRB3yPNsXbC
	OOuNDh2EENlNUTPmen5fixm+LWs2/ltEI8hYpeh7mXQwmNBdR9g7LMvr
X-Gm-Gg: AR+sD12ZTatFQjSUC4AHAcKD/I73hhXArt7FIbkeVWAx3L2vvJ3ge+PO+sH+QnwnONg
	IEEpip26YfIpaUZSbcECwffZIE5u4SHCZn8zHx3HlWR6uOTuxCIW7UIkKZUqcYWj/9+lM27Au6O
	vtPafY0/bihUZwoigaceaLo9e0TMap3ZCWkI0HaqBjLO7F+NLjW9g1EBPCA98w6dXvQZQSqr2JI
	CIsRqrxyiWC8OjyRMOdAI4RXlGu/168by26B7R07fnFO60WylJpQSIMI+GToEqCfLd0Xy6o1Z7b
	qN6/+qR0FD1WppzboZSmcHqSZZ5+ANkszo8LrgE1IoaRi7hjIfoHswvGPl/3DbwIjl2QoI0LPEK
	QMDwznPJ2MfDGGObiwlv8ZIX8SdX/tCDrha6/WhZurg0cPWbSpA0Li+najx6uSSjxlA+vTCC7G9
	QtGtZ+52FeNadk7fqg22HU2Qc6DoF6H0IbkQy/3B7Y4sy/dr7ruu3mZ6cvGsU=
X-Received: by 2002:a17:90b:2b4e:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-38f9bb15cd4mr230876a91.13.1785367545337;
        Wed, 29 Jul 2026 16:25:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b770e54sm90102a91.13.2026.07.29.16.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 2/4] RISC-V: KVM: Add SBI FWFT validation support
Date: Thu, 30 Jul 2026 07:25:23 +0800
Message-ID: <20260729232527.139183-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
References: <20260729232527.139183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162546_359153_DADCF1E1 
X-CRM114-Status: GOOD (  11.96  )
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

Since the KVM SBI has extension parameters validation support,
implement it for the SBI FWFT support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 03153fd8d15f..56fb59afe02a 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -603,6 +603,30 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void kvm_sbi_ext_fwft_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		feature = &features[i];
+		conf = &fwft->configs[i];
+		if (!conf->supported)
+			continue;
+
+		if (!feature->supported || feature->supported(vcpu))
+			continue;
+
+		conf->enabled = false;
+		conf->flags = 0;
+
+		if (feature->reset)
+			feature->reset(vcpu);
+	}
+}
+
 static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 {
 	unsigned long max_reg_count = sizeof(struct kvm_riscv_sbi_fwft) / sizeof(unsigned long);
@@ -755,6 +779,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
 	.init = kvm_sbi_ext_fwft_init,
 	.deinit = kvm_sbi_ext_fwft_deinit,
 	.reset = kvm_sbi_ext_fwft_reset,
+	.validate = kvm_sbi_ext_fwft_validate,
 	.state_reg_subtype = KVM_REG_RISCV_SBI_FWFT,
 	.get_state_reg_count = kvm_sbi_ext_fwft_get_reg_count,
 	.get_state_reg_id = kvm_sbi_ext_fwft_get_reg_id,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
