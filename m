Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D659C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQkSMNfEL2G3mbvZaVeNZJo+wbRCwdmkipu/cw4rpLM=; b=PwyvezZ5vMrN39
	c+EYkY+JiEmUhsdAuYGosMezLAQ79SQLOr00vxthyZnDR4cIFmZlAizRtCRpUvHNR4Wgm9Xk1HNLq
	dFFee4jiMS3SLvIUCT3xAD7Gf+aRQbd/brV/n6LGquk30tFq4UK67eoLe9s64oRbeLnVLke/chuaM
	KjEDjt696nSmB1TCSGemWUbN6tC/7yQt6Bu57HCNFC+hfMebkZyaVbTKkVpaQFwXguODLrOWU784R
	9J19PxbC/dvn6PE7jJU47sJ8b7g8aulsh2cFfINZC9SaKv2LeCHeBj2MM8/7Mknt5RDDR752crEZY
	uAznRfHbAls/B+/TF3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp7-0000000BMcC-2ahW;
	Mon, 06 Jul 2026 02:12:41 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp5-0000000BMZN-0DMp
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:12:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3260023a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303958; x=1783908758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SEkM1NCzGGDiH3CjwqUYg+RpOTMUxR/dI++pF9WMd4=;
        b=QR7PoGqIy9jFOfNCWXWRujOisL+g2GLNZpPMJn72ilsRsQmWyqcDvtM73frepWpYX5
         6hVodVPmwPJiKZdB40XvZy8GMM24a4utwVwE9EfPBc87cLIPeb2Fvl7tujGiufbU+H9j
         OsZyaNFf9voXTYXCwVfvuqGpjRs+d6V5s5bZhFLCRuEBH0rkr0E74u9h4xeydQ8m4H5V
         Mvbdiew/mzNwf/yAUSFkj04nmFfXMNQbL4gZuEzvuZv7F3QuleZ9Hmm5g3HjtHFjrWLd
         quQXdVDGwWP37LA9MdH1zR0jVbt+fzib8SMcj74iLneYjjLwezzgxt2vjEmUokbwlhpp
         2LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303958; x=1783908758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SEkM1NCzGGDiH3CjwqUYg+RpOTMUxR/dI++pF9WMd4=;
        b=MTRUKb+82c1cgCnZU0mBDHJ1hjjw9VlleuOHQSaIdRAgT0g2dkD0IzWExAN8vKh9Db
         P4iiA0BilgHeJKiAEo17vZ0GXTwrXffk6gg/mV1e5GMMVdxIkqfd6gxDViRUrWqXVkuf
         LUrUh0mNlbs3vCOKnV5PAEfH+qFQI4b/sDVZhgJRROq7PHtdmEyddCaT3cJK0CzGYu75
         G11EgFIeZm+Tkh5LSt/JpNpPP3BOQZ/JNNzV6SYam5eeoNOAU+Rl+2P9Tfm9nenx7cHX
         qJF/HD/hiflvoTuUQ8Fpf+KBjxiWvaekWq9K21VS/ZnhQpfT1tsIEDQZnZwmAk1yKuig
         INmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5SrC/8j4DnMHRtCD1oGF8hJE9ZlR3umzZu+ELoqVWVgzcqlOMqEdhDle6nlqqE+iHRHQHYIiFq+cs+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXzby33IrKyhTzgmY5vqvkm4mhFQbzUjJKZks2yelbJ6dVPuJe
	+vmCow0uupuG8sgFNevEXLSe5QExnbH+PBZ0mp414nUu2+bTtXIYhq3U
X-Gm-Gg: AfdE7cmuEPdtG4ZTuWQczrz2K4v7NgsDGipJgDbOei3+IAmJCIZ85ifkQ5EdxAZv/BZ
	UP8xSyi6M1NCrS52VykRQQkKhTz4VdVDjy6Vo84b1AhmAGf/SYHRcsycUdQbR5WI7aJq/bsbh/I
	95f8+kfhAqtlWke+BpaSVRLmhIs9kF1fWOgxKTK9WQroHsjNTE7PIoiDf+nV1G5RXXPu9zvkevf
	IgiYDvmYNffVTQ5flrxPx0Dq8u8SRUaPlqvNNoTf5dl4rrmxJjFxFMKIcfuMiyK1K/p+OBfEuI/
	baWPTKp1tehHOA+2d0CAY6ra24CGEh3Xof9fe0aMbb1IBTUahV07+ijBc0veZVZbi0G3V/1Qh7h
	zHpA0KPx9Z1ByfT/kCnC3LCybwlnrgHOzF4uWdwiD16Cgc6UFg+4G9BiU7/7BzP0v
X-Received: by 2002:a17:90b:4d0f:b0:381:21c1:75c0 with SMTP id 98e67ed59e1d1-38280e98e25mr8543507a91.15.1783303958078;
        Sun, 05 Jul 2026 19:12:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c1c68bsm4006978a91.7.2026.07.05.19.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:12:37 -0700 (PDT)
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
Subject: [PATCH v2 2/3] RISC-V: KVM: Add SBI FWFT validation support
Date: Mon,  6 Jul 2026 10:11:51 +0800
Message-ID: <20260706021154.210289-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706021154.210289-1-inochiama@gmail.com>
References: <20260706021154.210289-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_191239_084900_3506F3DC 
X-CRM114-Status: GOOD (  11.75  )
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
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index bc514ae6521d..0aa1f9a57c90 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -604,6 +604,30 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
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
@@ -756,6 +780,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
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
