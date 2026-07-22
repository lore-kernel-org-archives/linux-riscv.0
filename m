Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CF8C4452D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 05:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IEMfw/xPOgYeXmwtaN+EPETrRIfnyPpN7nsV4lzYlY=; b=E2Jwa8YSprvQMv
	qS1H/COxrTBPeaKdpA/rtouwYvlfeIsmmXrXfHt52K8sJBhAPTZLV5e8/vhux4bbU/YhFkpQvlXBU
	Lo1X38qJHG42vy4MDbiSVeGOnVhYrD0c9gkWO5PiokyblyCjXJMG0/AbxlIhoBGw48CM7udGVxjBX
	gfJ7VXYC8zh9cqZ5rFGs9b6N+KSuQl9Vpi3R6Gx42Nij3m/kszO+xQCtoqwZ+OT4hMvH8Rod5T6Az
	4Tu2aXPWyAhgFeBsyoJ+Xl8csCLeoVKUfFjfcw019yJv3uSJfPc62qoOsG/5HyazoqMxkSOT/H9DZ
	BMn6B1jm31RA4l2OcB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPsM-0000000AwOU-2UY4;
	Wed, 22 Jul 2026 05:52:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPsG-0000000AwLW-1537
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 05:52:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so37178135ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784699527; x=1785304327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=mTYPAjxkMADpDyhVOACzo1u/h+mhA5C7q3mEDc0uqF4qjVMb40CvAtonMiwX2PQFmm
         0Oj+XdG3bKweiMxiP75DPVjZgrfCIuVsCIWz22gcI1M4/MBH48iQF6uVJaWZ+bvvxHdW
         y8QmrvuesaEYToFnMXW0+zGTCUTiWFOp7L3OeOBQAnY7g/dztBlxZcKVDLZruSabeKeM
         FLQb7d0Tm8byfKyTldW8t1ZUMTi/ZixFqJdFd/oFVjzds6qHWUDZLw+K8HmRaAlJvQ71
         NHrDgif1Lxh6XFLynJsuo4A4OcTs4F7tXMtWv4UJbHP+l/2MP1sD15uOFDqKD/03VlaE
         T7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699527; x=1785304327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=WmpYxYEyrdLotIrzJLHtdghnS6QhZ23Qg3Np38DX2Wgmn/xjH68zYb9WfiE5lEIbws
         S6VOewKl7xTzL2z+bebodyl+Z8DonIfVlDgPwivzy9V19AMeqLwcATZwEG3CBr688ewn
         lO3IjYAvO/KHfde8ibhVGJvci5BZGblJbxj04R0mlewExoeclhqMeFM1Q8Yhyqth40n4
         to0v+RaL4WgIxmKfX7deDMMmyBc2kHO/LJl/XY8QMEBWv/lslZ5cxNDnpzbfy//Ke+9X
         DWl/0S0uRaK1VsVd1b0LiQI7/xK1ZxlqbHCl14f9ZZMmAd9hZBcTYAzdefwAbrqhzOHT
         PvHg==
X-Forwarded-Encrypted: i=1; AHgh+RpEew1p0S9GJFjjZmhl9iqHfrnB/ZoNZzUs0ylVsb1uybxaZ2nxrdPMZMNmOjtZgKu1p/0cdJfRBhdmjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvgmvaKiQi5lF+Phov8aTBEy/UNh8wS1XAQHsSiUCiewCgWSsI
	qvgdfZGgJa4m+8gQbOKQUFNoKalgt6VnM95E3EDFXf3FP82mTTcwVl6BuRPU0nqwA/A=
X-Gm-Gg: AR+sD10rFnOFX0HCL8CqIAXUhlDRpF/TGNZwTmFqffUWASi47Pmp5m2M16IWYDIahPS
	fRmChpEb5ZwcFRYD6dvVoLDlHChNrjN9CbQR1+RVVlKOqZxblDdorWfuKkGpgW+FiSTKn+soplf
	0W1tQyavreJNZ9AcBfaOCabgsaUUpCFHh/iaze02WNRMrM+iaCikbEvn/kaWYceIeE+7ArEyyRQ
	qT+CDJ1zYpPXr5Iqp+fECShrLfUusrZJeSnZ/9obiRGyUcPykiT+w1pZDdi7BHZI6jysYI5lj7J
	nWhYYlcDhy+ZIDvJHlFXVgGf9kBfxruQMoViVZ2aVxG7hDPBvl1xeBdLyzFpCsOPiteBfaikb5/
	SckcYrvH49rLjk3iNVG2qMh1FIlZtNI3m2nCS8c7NTSgWRFY/I21Vt92hyMNA+5gsQzh4L5sYgU
	C7Fut0DTkg+fJBhStdpdsvfQ==
X-Received: by 2002:a05:6300:95:b0:3c3:75ff:95b6 with SMTP id adf61e73a8af0-3c3ad7a1c86mr22612818637.31.1784699527388;
        Tue, 21 Jul 2026 22:52:07 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm5133138eec.23.2026.07.21.22.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:52:06 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 21 Jul 2026 22:52:02 -0700
Subject: [PATCH v4 1/2] KVM: RISC-V: Clear former VCPU cache on
 virtualization disable
MIME-Version: 1.0
Message-Id: <20260721-kvm-cpu-pm-v4-1-146bf942547d@sifive.com>
References: <20260721-kvm-cpu-pm-v4-0-146bf942547d@sifive.com>
In-Reply-To: <20260721-kvm-cpu-pm-v4-0-146bf942547d@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784699525; l=2593;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=VCtdpA7YF5advtu0bupY3qxS+FfCYS20j33S3YKJEL0=;
 b=JVqpzramZxn2NBonw83b4SpU8QHsxBwc5n13yl9dz3mE7zfum5e6pHLRs/HTawKeBJnVx9mIq
 jRg8U/NpPlIAX207kgtiWv3SWtVQJ5M8q4R3IGkTs1fF02pBhi3t6i3
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_225208_310488_180B797C 
X-CRM114-Status: GOOD (  12.24  )
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

When a CPU is taken offline or enters deep idle states, hypervisor CSR
state is lost. The kvm_former_vcpu fast-path optimization caches the
last VCPU that ran on each CPU to avoid expensive CSR restoration when
the same VCPU is re-scheduled on the same CPU. However, if this cache
is not cleared when CSR state is lost, the next VCPU entry will
incorrectly skip CSR restoration, leading to corrupt hypervisor state.

Add kvm_riscv_clear_former_vcpu() to invalidate the per-CPU cache and
call it from kvm_arch_disable_virtualization_cpu() to ensure proper CSR
restoration after CPU offline or system suspend events.

Fixes: 1323a5cfe52c ("KVM: riscv: Skip CSR restore if VCPU is reloaded on the same core")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 ++
 arch/riscv/kvm/main.c             |  2 ++
 arch/riscv/kvm/vcpu.c             | 11 +++++++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60017ceec9d2..808b4ee1bd10 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -319,6 +319,8 @@ bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu);
 
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
 
+void kvm_riscv_clear_former_vcpu(void);
+
 /* Flags representing implementation specific details */
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 0924c75100a2..350e4f097d6e 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -69,6 +69,8 @@ void kvm_arch_disable_virtualization_cpu(void)
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 
+	kvm_riscv_clear_former_vcpu();
+
 	kvm_riscv_nacl_disable();
 }
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..e48338f907f4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -26,6 +26,17 @@
 
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
 
+void kvm_riscv_clear_former_vcpu(void)
+{
+	/*
+	 * Clear the per-CPU former VCPU pointer because hypervisor CSR state
+	 * will be lost. This ensures that the next VCPU entry will properly
+	 * restore all CSRs instead of incorrectly skipping CSR restoration
+	 * via the fast-path optimization.
+	 */
+	__this_cpu_write(kvm_former_vcpu, NULL);
+}
+
 const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
