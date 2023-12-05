Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0094C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNjU/cQzC//FvHXifhEF5yoiMuCg5GpWRnop6DvRzvU=; b=zNwuO6EsAY+Lic
	jc5+VGQa0Rg08KShwzQ1sihvnggjBn8RwOGt4gjwBHLvLDaHGNJWdAEw0iGFXGnWTzPBwBh5zShMX
	HuWj/ERed2OuTyxzM3HP2elrMN4+w+hH9QbVCxxLL1wXIsc+AKDT8z1xXuL57SXKbYkALgGsfp7GQ
	otbzMORx//55W878Cx3VgZ3tw+ZomVteMtsVNpyfWRCtJx8QxRz/ISvinHGJAeGr8S3E7vK8V+K67
	J9S9AIQh5wWMTNbGX37gQPSZJCQRpA3wd6NgUkWZ4TAfopg8gN4NATDJBo8EPztEqlVggdG1T8CWC
	H0Xns3J/QYU1tbQUVzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtV-0086vY-1y;
	Tue, 05 Dec 2023 18:11:41 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtN-0086l3-2k
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:36 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ca0d14976aso26298921fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799891; x=1702404691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VCd6O823a8CT11v1c1Pjh6+abowcBe1J6OGxvMERwU=;
        b=AvKJwogUZMteX492B6wv31pGx3uy9dmAEKUBmNpM3biR/+TsEnM1sRBZhdpZa4FLhV
         b2BF+Ft53CYzXZ9BIVtvHkBFmYwlP7lnXhNcQsMfGXTYM2reYShBAtDI74Uyc6+K1RXR
         IY5mVsctX3mLfbKknEfVH4lZQ1EF0WUm53PNSzKerNGPXGfl25y+bJS26cOo02f8GRn9
         fghwLRzIwxqqnvGb9mRGQPjm0NW5l04vZkWl2F0tEAAno/TNTrZPl+my2VMRfERUyr9k
         qHhAsx3s04eyftsH+tsMGjeHs+7k3LgRToSLUs04/HVfK7IxXh5LcPP65asyhT2G2RTF
         AjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799891; x=1702404691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VCd6O823a8CT11v1c1Pjh6+abowcBe1J6OGxvMERwU=;
        b=SF/+l8pt2qQapkFLAHpAC7ZfzJ/pyos+421VnL6I/6U7ukEwe6dv5GqZ8lPgoViKSE
         H7+05pBPVaPFSdrsMKhlkAZgP8Ax6M/Ihq5/+auFIDknM7fqU3NaowaDoSze59JFi/uA
         r/hYXzm6LTgEL735SZjsLEDQNSz6bG3K3u1MjDsKcAC11Q3893g5HJJhx/3EkI/IO+Fg
         6NLPpJMHU9GiYOUaRa5T+Uch7IvgfUeEw5u34v7Kp6P4nia34y/AT6vdlsyKKFeqJP7A
         VtZbEygmJhdkfrccy0CQ9TcS/8QK0uFYUIgXQm5qRjIUOv+2hOpcdEmN87NGIIuwiLuG
         1URA==
X-Gm-Message-State: AOJu0Ywh+FNtMfRes/tasViKbQZ6MDD+IJ/UifYsU6v9SutH43IMm/sb
	ZWhnOO7eFnd7Yp+Tsd9+rMVmdg==
X-Google-Smtp-Source: AGHT+IHG/g/V/zf2T/gBSVHY7HqbqYKhGPhbz56/hnwhvj2VNdYwjdJtLDBvDlcLHQY+8Zqep5EvlQ==
X-Received: by 2002:a05:651c:1053:b0:2c9:f59b:79e with SMTP id x19-20020a05651c105300b002c9f59b079emr2837980ljm.16.1701799890845;
        Tue, 05 Dec 2023 10:11:30 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gs7-20020a170906f18700b00a090b36d618sm7104264ejb.60.2023.12.05.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:30 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org
Subject: [PATCH v1 07/14] RISC-V: KVM: Add SBI STA info to vcpu_arch
Date: Tue,  5 Dec 2023 19:11:27 +0100
Message-ID: <20231205181119.207204-23-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101133_928430_854FE5D9 
X-CRM114-Status: GOOD (  12.43  )
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

KVM's implementation of SBI STA needs to track the address of each
VCPU's steal-time shared memory region as well as the amount of
stolen time. Add a structure to vcpu_arch to contain this state
and make sure that the address is always set to INVALID_GPA on
vcpu reset. And, of course, ensure KVM won't try to update steal-
time when the shared memory address is invalid.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 6 ++++++
 arch/riscv/kvm/vcpu.c             | 2 ++
 arch/riscv/kvm/vcpu_sbi_sta.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 230b82c3118d..b10026fb6412 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -263,6 +263,12 @@ struct kvm_vcpu_arch {
 
 	/* 'static' configurations which are set only once */
 	struct kvm_vcpu_config cfg;
+
+	/* SBI steal-time accounting */
+	struct {
+		gpa_t shmem;
+		u64 last_steal;
+	} sta;
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b77f585879b7..fb13a05d7ec5 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -83,6 +83,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfence_tail = 0;
 	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
 
+	vcpu->arch.sta.shmem = INVALID_GPA;
+
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index e28351c9488b..157c199be0b4 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -10,6 +10,10 @@
 
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 {
+	gpa_t shmem = vcpu->arch.sta.shmem;
+
+	if (shmem == INVALID_GPA)
+		return;
 }
 
 static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
