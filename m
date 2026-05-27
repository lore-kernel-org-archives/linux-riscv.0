Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C09CD5BDE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDYeHOiLImIzqRpxn90BojCnIfqogePMX2oqvZ/MzGA=; b=TEaKFJgqoOV35y
	4O35sGhOQk3hAzGEsgmPTG1Z43gHJU7GTKm8dmzj9c1SX0fDL3KcW6YMwJgUTDSEI1mxNHbZIv6uH
	QDOj4PuXRhoQft/PV2JykA1gV5P9igsjfKSnkelYwzylLxcENhncM0NM4tSVOewmupob8/uJ7WtZy
	BZayNK4JoRlGZVPAhwx/+XwOPIL/l2Zwq3uzLbzdSr1EzOcLT6dMXyZOziNGhnVf/UNUqyqpWHhTe
	9Xu5g5oMif2zAYBo6CWiF6hhgYvNOWt7uK1z7OeRFWoxB59BvrffMny47KCbO1mfEFU5SIqjNTS9C
	evB+QfeB6f6WwV2u3oFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CU-00000003Mls-2Til;
	Wed, 27 May 2026 05:53:06 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CQ-00000003Mis-40Bp
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 05:53:05 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-304545f5206so6951114eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 22:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779861182; x=1780465982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUn9PyzRfhMmuzwTZR0m7Cfkjy913gm4r/60L8bBEqo=;
        b=AHnjORfpLL914qgJKldxSEICTUSx5qONMHn8pH/bGV7VXOvImMfMl+YxwGUH92yWgl
         Uf+mn45AMpMZw5WxazmQdRqPXTJlw3WdW228tBNd4+F+zcYjx161I+lbouNjVqRhiIMv
         ZTS9GttJ6/LkBSM+SMAe5/jiKJEI7xDBNzrBF/j5+n1QmTRkvgzCb64j6uoT7ZAnCTsa
         I1hBEr42MAKJDelvTk5FYulaSGyOKJCSn0as39npVYq9Lz0IwnitVspYIeSN88Mw5/rW
         /HUS+dNNJw3so4TEmYizwwHz9ocORaNCs7sBHyNyYHqigPcuBLUiA217aormJCCoCYNC
         j8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861182; x=1780465982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUn9PyzRfhMmuzwTZR0m7Cfkjy913gm4r/60L8bBEqo=;
        b=V1UnQe3lftaLOCSkQGgRWgwFzdCg5zVaWThUh3C3PyuEpF6BbUCjvcu/qFn4gN15Ur
         62o5enP1F0KDag0Jwzi90baNbVLv2Zq6Uc52qf/Do1qitvzzORWf9hLssL/JodZPhFQF
         v9i47fXphabZaEbSmu/yFUb3iVv70Eyvh7VJQXSaRNaVTjUGR4KIZdQjKOS9+qJW1xBU
         zmoRZ90//KQ5zjTdmyx9f3gV4uVzWan0/ScN9MOnvGQlxgOZtULWzKtspXPzZpIbKPzX
         qsS4Vp8MT5VE4BzS3nMLlXNAbxYJD6HHMQM2XKGQwFLFcweMx8S++KF5cjWR/pbxkToY
         sXjg==
X-Forwarded-Encrypted: i=1; AFNElJ8e5jDfJVPkru0XhHCDJOcn0Hs4Tko7TGGLLZBf5dNYuDCYPfnF3hhNmoOAFanDU/50udGsRTVbzjLFhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu08w0A61VnWscmScUAslVWDkqvVB9DVP9DbEYzWzJZ+iL6YVU
	Xi/LdLvzEYzLJjuOfN5q9J3H3ciUdspWogWFeOtKLaAhQfHE/qvzkermGdjB18+OjPM=
X-Gm-Gg: Acq92OEw1iHJLOoDUeU3tkz+Ev2dEZ16QK8IpmVCoM64hLoVoA6yFQRPVHm8/e+v6B8
	bT1UhuXvx1dpX+6y/j0235Raro6A5z4ZOt2muDW+0EeYtSTanYnvCLNrh7XILqm8KLX97uZcFnS
	Stam1ff2s8liZYF7NF9z126sxPyLd40LDqzGHvvQOCjvpWQPUiwZhbDqEgMg4pUwq8T2klMhhGx
	HtDEPhKlbCZWd+D7Ds6HJhFQVJaDP1AmbNNVYP8IXUrc++hfPYIH3JICLS8J/kYRUB/h9kFaqG3
	jZNT3P8oPMupx1C7yCcz0k5WAnbFEimC71IMOXgC6cQtjdKWKL/hLaEHupBdSj88NU0ALYDNv9y
	4+Db76FyTKxPMdrXP2P5CEehUkuliDyBnq5DQJUAUt2ov+ReOQ9NsrpV0ei+kV/oi9zmQbJregD
	SfyKq4YaZlqxsH1cUDrCnPpxIEy0CH6pvFY3DyKZ6I7zE=
X-Received: by 2002:a05:693c:69ce:b0:304:6782:d596 with SMTP id 5a478bee46e88-3046782e6eamr3796621eec.4.1779861181594;
        Tue, 26 May 2026 22:53:01 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304be0851c9sm613202eec.23.2026.05.26.22.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:53:00 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 26 May 2026 22:52:38 -0700
Subject: [PATCH v2 1/3] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
MIME-Version: 1.0
Message-Id: <20260526-kvm-get_reg_list-v2-v2-1-7940a401454a@sifive.com>
References: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
In-Reply-To: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779861178; l=4044;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=8rCDNvc2TJDmq0o9jKD+SWttG8Vm4gJbAUgSdeBhahw=;
 b=AfhaUDr6EDvzRR8AckzFU4mLJnayFuZt//mAddpv5TFe16Wy03F28lBbX2zJK5NPIj/ZCUBLU
 sDKiVJUb++NDY3CurknxqrlxIaH+V8PPFsplhKxsEtPX1j0d3+NfVcx
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_225302_999399_9F3E038F 
X-CRM114-Status: GOOD (  15.50  )
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

Fix a bug where FWFT features could be incorrectly exposed to guests
after userspace disables their dependent ISA extensions at runtime.

The 'supported' field in kvm_sbi_fwft_config was set once during vCPU
initialization based on the initial hardware/extension availability.
However, when userspace subsequently disables ISA extensions  via the
KVM ONE_REG interface, the 'supported' field was not updated. This caused
the following issues:

1. FWFT features would remain visible and accessible to guests even
   after their prerequisite ISA extensions were disabled
2. Guests could configure FWFT features that depend on disabled
   extensions, leading to undefined behavior
3. The static 'supported' flag and the dynamic supported() callback
   could disagree about feature availability

Remove the redundant static 'supported' field from kvm_sbi_fwft_config
and replace all conf->supported checks with feature->supported(vcpu)
calls that check the current vCPU ISA extension state. This can ensure
the feature availability is always determined at runtime based on the
current configuration, not initialization-time snapshots.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  1 -
 arch/riscv/kvm/vcpu_sbi_fwft.c             | 17 ++++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
index 5604cec79902..837431867c6f 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
@@ -15,7 +15,6 @@ struct kvm_sbi_fwft_feature;
 
 struct kvm_sbi_fwft_config {
 	const struct kvm_sbi_fwft_feature *feature;
-	bool supported;
 	bool enabled;
 	unsigned long flags;
 };
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..d3be059c3822 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -279,8 +279,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 		return SBI_ERR_DENIED;
 	}
 
-	if (!tconf->supported || !tconf->enabled)
-		return SBI_ERR_NOT_SUPPORTED;
+	if (!tconf->feature->supported(vcpu))
+		return  SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
 
@@ -361,11 +361,10 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 		feature = &features[i];
 		conf = &fwft->configs[i];
 		if (feature->supported)
-			conf->supported = feature->supported(vcpu);
+			conf->enabled = feature->supported(vcpu);
 		else
-			conf->supported = true;
+			conf->enabled = true;
 
-		conf->enabled = conf->supported;
 		conf->feature = feature;
 	}
 
@@ -406,7 +405,7 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 			continue;
 
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-		if (!conf || !conf->supported)
+		if (!conf || !feature->supported(vcpu))
 			continue;
 
 		ret++;
@@ -428,7 +427,7 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *re
 			continue;
 
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-		if (!conf || !conf->supported)
+		if (!conf || !feature->supported(vcpu))
 			continue;
 
 		if (index == idx) {
@@ -463,7 +462,7 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 		return -ENOENT;
 
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-	if (!conf || !conf->supported)
+	if (!conf || !feature->supported(vcpu))
 		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
@@ -500,7 +499,7 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 		return -ENOENT;
 
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-	if (!conf || !conf->supported)
+	if (!conf || !feature->supported(vcpu))
 		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
