Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C8CD11DF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HRAosq6fyh+ms0Ic5mZ9bLZbPhjFoIN7HVyck7gHn0s=; b=wRlV+5jJ8W6ZjD
	Drio3XkWvY0/mHSX3k2KjLSTGTwOZdfoHy7CrkCwJSexPyBzLJn6dZWIcgMJWCriByXHy444+kOTB
	VqLx60YJdtUEnp58vTDwgAPtgf39ONEWQfsrnXeBVWi35O8tw6i/JQupRo1mvwzidH0PhnUpZxBTj
	OBNEo6EHy5eBiCy8WeXxpmGzmUfT95NsFOz7t2CNA12vexPFYWKCR07whpKJ3y4LCQ9t/tJeys/8n
	jblsSf7Jder6Crc90KbxynzMmL5jKgHChzHrJhntT1KieM9bN1IWo9VM/mQtqYqBr2HEtanJso1n5
	NOET6nQJlx7SZ1HduSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp3lz-00000003z8m-3cn7;
	Tue, 26 Mar 2024 10:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp3lq-00000003z3e-1BDx
	for linux-riscv@bombadil.infradead.org;
	Tue, 26 Mar 2024 10:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=IiNYGBSxUvNgdPnHEJE/xU3metbwCHzJuKT0A3W7MYI=; b=TFbJtK2IHmXnPwRsPQD3iF7JDF
	99WKWSQJJb+5/i/EgBukogynMsecDeXyjybRVPMBl7vPJZzqcg7FPvOF8aXrbmOPre3/KQeZ8XAH5
	1hWEyPfWiRtXHvHgdIVgz4ZLl8GBe+Nc87hmXY1z2juHJgCXfoe50KP+Vd7+Sew2gsqYr67vCOd9W
	M6+6JXEXSw98OUEXoctdwwGyNmV4KAvCwHB5yXXImjNgxeKXLfWIV6S7h0IX9Kh2RgE0l/qXtb9m8
	IsAZ/18kpkWCAOeTgWKlxtpuos2MKa7qkM77EWMxK8LCw0c0v8DGjbhwNeDkKGaWAZuP4qRwoS1Pe
	znImh1hw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp3lm-0000000H6JQ-32EJ
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 10:11:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e0878b76f3so27408435ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 03:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711447860; x=1712052660; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiNYGBSxUvNgdPnHEJE/xU3metbwCHzJuKT0A3W7MYI=;
        b=d3Pol8KTB3CAowhtJInRB3Xf3ZgACBK5fEX1AglDRGjas9FC8FQzowBaFcURbOyD3v
         avo4T5wCISxsqftNiOm9Z4bUSCRFytFlOAgcS0dVZtyXjWIw2EFMxgFAM0XYkai4Z0v4
         yf7ZU2xcLqiVwkMjwt/zP5YRSGFKKJNu68Z6crSciBresWbJwBBN6GJniqNXJZmrg/1M
         NRjbRedivLyP3xho/w4uzi6I/jBGolKcRjGseIZ/4ZESMlh+biPxdmk/gJRFM8EW09rU
         v6X5mRutXpnUHYrwSxhXLAGVvzPxe9ljhf5ZtcM/OWZv400OLCXeDSGHfziPnxZEGyQ1
         KD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711447860; x=1712052660;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiNYGBSxUvNgdPnHEJE/xU3metbwCHzJuKT0A3W7MYI=;
        b=PCVS5RksbVA6Mw93PQJoS47PoGzg0ncN5u1T9C4JUUPX1sfK/YE5Cz8kWn5gwbkrJp
         MtJrFiFa5QK38V/9E6C1pXqu2lIa+9Zx1uVVM+GT1ZWLbI5bxzqU+XYTNHEXUsupqsKs
         DZDxCP2iHwp8ys0Cf6t9aOZU7b3WFDlh00AnONXZw95okuQtxml2gAI2qaazKjZGI5Gs
         R3SV6cBJHkY55YDVlOB9tRIhC+vCg8XDNy5kAY28QAePxEgaCcz2bZWaFsX2SdK86uVG
         6qNAQcueVCbRC7RmeZtf5usHskUJMMHRSR/Qwg6ONFtRlVlEhABobq6Js8kzxml+PbVp
         GHyA==
X-Gm-Message-State: AOJu0YzOG+Tc2CKtcW6gTAYam1WM19xWp5x+SJ0vgM/ag6TS0nGj/DFZ
	qiFlnifSLjG9ok1nLhMxeSInI6M4331rJ27h0RV5o9KDoCAN4peZq4CGssTcSLJp7ZafR2TQI23
	0Mdom56VIcexUxooylW0k91lp1lxbRh5Rv7ETZ1aFT7AWSMRxeDm8d8uU3zA4mW8LSO8FCjVx3A
	mPxP//SKA3UTIhkKbMEcdvpQaJKvnrWETwgEhd0PWd8Vy0D1FNXsB8vQA=
X-Google-Smtp-Source: AGHT+IEqMrxzRfAQyyX5BWY+o9kj4fYO6R0c9EdEEs+a7j40uL9Tbsf27ODXSAN5Mbodl3JqSYvUug==
X-Received: by 2002:a17:902:e842:b0:1e0:188c:ad4f with SMTP id t2-20020a170902e84200b001e0188cad4fmr1519731plg.26.1711447859767;
        Tue, 26 Mar 2024 03:10:59 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c7-20020a170903234700b001e0e2b848dbsm1633240plh.83.2024.03.26.03.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 03:10:59 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] RISC-V: KVM: Avoid lock inversion in SBI_EXT_HSM_HART_START
Date: Tue, 26 Mar 2024 18:10:52 +0800
Message-Id: <20240326101054.13088-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_101102_842294_42FC691C 
X-CRM114-Status: GOOD (  12.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Documentation/virt/kvm/locking.rst advises that kvm->lock should be
acquired outside vcpu->mutex and kvm->srcu. However, when KVM/RISC-V
handling SBI_EXT_HSM_HART_START, the lock ordering is vcpu->mutex,
kvm->srcu then kvm->lock.

Although the lockdep checking no longer complains about this after commit
f0f44752f5f6 ("rcu: Annotate SRCU's update-side lockdep dependencies"),
it's necessary to replace kvm->lock with a new dedicated lock to ensure
only one hart can execute the SBI_EXT_HSM_HART_START call for the target
hart simultaneously.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 5 ++---
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..537099413344 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -254,6 +254,7 @@ struct kvm_vcpu_arch {
 
 	/* VCPU power-off state */
 	bool power_off;
+	struct mutex hsm_start_lock;
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..4d89b5b5afbf 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -119,6 +119,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	spin_lock_init(&vcpu->arch.hfence_lock);
 
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
+	mutex_init(&vcpu->arch.hsm_start_lock);
 	cntx = &vcpu->arch.guest_reset_context;
 	cntx->sstatus = SR_SPP | SR_SPIE;
 	cntx->hstatus = 0;
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 7dca0e9381d9..b528f6e880ae 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -71,14 +71,13 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-	struct kvm *kvm = vcpu->kvm;
 	unsigned long funcid = cp->a6;
 
 	switch (funcid) {
 	case SBI_EXT_HSM_HART_START:
-		mutex_lock(&kvm->lock);
+		mutex_lock(&vcpu->arch.hsm_start_lock);
 		ret = kvm_sbi_hsm_vcpu_start(vcpu);
-		mutex_unlock(&kvm->lock);
+		mutex_unlock(&vcpu->arch.hsm_start_lock);
 		break;
 	case SBI_EXT_HSM_HART_STOP:
 		ret = kvm_sbi_hsm_vcpu_stop(vcpu);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
