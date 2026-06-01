Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49106CD6E56
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feiYdomIZbQi4kIb+PXxo/UNj2chbk8tycnhuTkJbtc=; b=sRdPkFs80O1yzW
	YcQao/VyRuTRen+qLqvMrvxxdWx/mEdIBebyxMYqErWg6zWa0kw2lIAcueNpdQwC9UMvHUkuBjtI2
	6SOPtSDkGfrnNTcn0+o8KnpPxdfFGz54ACpApbmvoOWcoR8CJvrvEMV/P/6S6I9MUyzBjUk7nL30k
	fpRz14CWZ2EqgBYTQ2iBosOAX4BRXjGj1PqMOJBPiNw4FLJOvIXHrxSs6me8chpE9oBkcTVfdWhbv
	zGebMjBF3u3JV0rjXRUN8gQqMf9ubNdTQos85BfdZmU9iIropDfll4qvc7mtqDXZBnYEGBBU+rZlV
	5Fz5Azdnw89gPlQIDDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqx-0000000Ac3K-3A3D;
	Mon, 01 Jun 2026 10:26:39 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqv-0000000Ac22-2oaf
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 10:26:38 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-304e6c6464dso6602057eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780309597; x=1780914397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc0yN1x4RucIm/MT/35mEk+RzjvwKXgES6zMS7u1Uaw=;
        b=WTQQf89UTjBeMSVU7SM0X7EutX+nmQJ2PZFsLc5aTEuYQausu7vdOgKGZGDz6aRUqp
         vb3qgK4CrJD3ILJN+hSXpDvYcWvwJq/aqBd3DCRezbXLctxS/2xrL2kDg9Cto39nolXo
         Uk6PdPy8pAkpQxJPcxN5Jhpxg+9dCSwCp2yVAyW9Ju7M54Q9fkh9NHgtqjbpFCABZPmg
         v2HrrGEJyjcRSgx6y4qxEfbObAcO3/xRLWnyg45IqAlZlJclIDXYlkluu6wGAL0SFB9R
         tGQ8nJA1pgvYoxrtB1iIYvJbfdTnpMA61Es3XmVpYseTOMD4wVhpXp/yoq5bcXKqMmrh
         H5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309597; x=1780914397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mc0yN1x4RucIm/MT/35mEk+RzjvwKXgES6zMS7u1Uaw=;
        b=n6lxtxRLCBU8zzx86q7J5Bs7nBJFb6t6pnZEA6110gueZoz1fQFUA11WGn5yfkBHm1
         CGNRwFRyVqRHwlbwihCGAVCYmiBuQ261xAq1n1hdiWlGr8p+CCkw2y2WohzTP2+IbxxY
         J7L8ROz7B9GLkz73GC6niVvECg6NL163TxhI3eBpUagIocGYx2nrg63naNbA3uzWVYUH
         gP31HUhZH2Sij/yvSSgPeAgvD5zQ+z40XKPQbLcDhHK1QxRn0yLibruQ9yuJzXdkwZDk
         L7gXrzVWoKM2JUh7nF+BVUNYUBsKG7MskNr42t6zm14rw5jNZVsijwDCV+oWHvGiukVo
         DAKw==
X-Forwarded-Encrypted: i=1; AFNElJ8vf1cGHopVNy8PENClbBV7VbBHubDnpzNjCy+OW4cW0mAoeJgOQ4pXa3rxa2wylp0lyV7zM9LYzvUofQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4/TCXMNt52QnYfcb4nsUedTCcT5azVVyFxyy7B9wgM2BebN9y
	aoDpqwBLCBePWf5+lZ++USPRHiWI9sjiUukhwIs0sxihv6v6ReaysNX22Q+lZ67O2C99CfZe7RU
	eYRIyko8=
X-Gm-Gg: Acq92OFrn735ZwAnMAtvi590NpaZ6Bniokv2lL1HKxLRI9w0/g12QJvsgrvVrV3y8Nu
	vS+inDLJYicN1g7fMkmbRbwXQVytH2iaZ8ntJblpY+U9xMneme2bdGir7sJHhXBIAvx9bEwLnv2
	T3niv9gW40wuUQTNVudtU5kPaPQDOLhKMoDPA4c06R07qgZxsnStYxZm/PZH3VrWs45k7r/Nihm
	921wmwBvs3lbsbKpG+PB7pIbQr5fnagKKHAEa+UgdyyOPaBUdJsuZI6+V2ZU1QzHi4402NQ4OJU
	o8N4WkpxUmnAHoYUtaYRAoT4cSfnak/KCmldIdv94/AxF4HRfmpg/2XHqXyFj50+bX51mSw8FAy
	mzmDJ4oNmw8jA5NG8wBMbiI2kQt6h7BdwTMDdo3AZA+aLpISZeATCycVvyYJbXmTD823goePqXu
	t+09C7b6TyY+E94tAfnG7uHNcajrLAN1A5rTVIm+yM+qaVWWir9dB6dg==
X-Received: by 2002:a05:7301:2926:b0:304:d82f:be10 with SMTP id 5a478bee46e88-304fa57301bmr4727218eec.11.1780309596786;
        Mon, 01 Jun 2026 03:26:36 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8176001eec.27.2026.06.01.03.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:26:35 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 03:26:23 -0700
Subject: [PATCH v5 2/5] KVM: RISC-V: SBI FWFT: Add optional init() callback
 for hardware probing
MIME-Version: 1.0
Message-Id: <20260601-kvm-get_reg_list-v2-v5-2-415d08a2813b@sifive.com>
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, inochiama@gmail.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780309592; l=3443;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=TXFt0DFSQdnCviWDHonLXEXWuSs4TELoJXTKnRITfIM=;
 b=qcEndV2CiUSg4lgHuYRsd5aA3etrfjNCxq7IkheXcAXYBJk1dZaQuK988NbgWu4xRLQDpVAvG
 BP0vZ9jMc8fAsWp8ehTJPS9CV54ctGBCq+yHf0goiUICI38bbjxLzLD
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_032637_726894_1531A922 
X-CRM114-Status: GOOD (  13.88  )
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

Add an optional init() callback to separate one-time hardware probing
from runtime availability checks. For pointer masking, this allows
probing supported PMM lengths during initialization while checking ISA
extension availability at runtime.

Fix try_to_set_pmm() to restore the previous HENVCFG.PMM value after
probing, preventing side effects from hardware detection. Add preemption
protection to ensure CSR probe sequences complete atomically on the same
CPU.

Fixes: 6f576fc0aeb9 ("RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKING_PMLEN")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 5e4aafb0cbf1..aee951f2b8e6 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -35,6 +35,16 @@ struct kvm_sbi_fwft_feature {
 	 */
 	bool (*supported)(struct kvm_vcpu *vcpu);
 
+	/**
+	 * @init: Probe and initialize the feature on the vcpu
+	 *
+	 * This callback is optional. If provided, it will be called during
+	 * vcpu initialization to probe the feature availability and perform
+	 * any necessary initialization. Returns true if the feature is supported
+	 * and initialized successfully, false otherwise.
+	 */
+	bool (*init)(struct kvm_vcpu *vcpu);
+
 	/**
 	 * @reset: Reset the feature value irrespective whether feature is supported or not
 	 *
@@ -131,19 +141,30 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 
 static bool try_to_set_pmm(unsigned long value)
 {
+	unsigned long prev;
+	bool ret;
+
+	prev = csr_read_clear(CSR_HENVCFG, ENVCFG_PMM);
 	csr_set(CSR_HENVCFG, value);
-	return (csr_read_clear(CSR_HENVCFG, ENVCFG_PMM) & ENVCFG_PMM) == value;
+	ret = (csr_read_clear(CSR_HENVCFG, ENVCFG_PMM) & ENVCFG_PMM) == value;
+	csr_write(CSR_HENVCFG, prev);
+
+	return ret;
 }
 
 static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 {
-	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	return riscv_isa_extension_available(vcpu->arch.isa, SMNPM);
+}
 
-	if (!riscv_isa_extension_available(vcpu->arch.isa, SMNPM))
-		return false;
+static bool kvm_sbi_fwft_pointer_masking_pmlen_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
 
+	preempt_disable();
 	fwft->have_vs_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
 	fwft->have_vs_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+	preempt_enable();
 
 	return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
 }
@@ -231,6 +252,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pointer_masking.enable) /
 				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.init = kvm_sbi_fwft_pointer_masking_pmlen_init,
 		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
 		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
@@ -365,6 +387,9 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 		else
 			conf->supported = true;
 
+		if (conf->supported && feature->init)
+			conf->supported = feature->init(vcpu);
+
 		conf->enabled = conf->supported;
 		conf->feature = feature;
 	}

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
