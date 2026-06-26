Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD78CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IEMfw/xPOgYeXmwtaN+EPETrRIfnyPpN7nsV4lzYlY=; b=W8dFmU/kghetva
	OFnFBKCckZZNe7dDpboHG+a7vRczKaLcsnc6RtmWXiwQck4vRbwLzWNIXxkvef+fIGHJX/o6DaI9d
	YpZSDTKztIe9tsa13qaqMjYXEQwnvbG2bhvLljO5mebo/X1GFgUwXpRT6SrfN+8NqZRm185Ec2m5H
	2/w8ObJYRTiGr++3DYfpkjBlnGXfe/jZy07XiVQF0EzHg7Q5uOr29RDr5oO+S+eVqNsZ9x2N6qPOJ
	uZHWWjFYrC8UEWXO+z0GHcjbB7HrwAjxNal6rqDN8nl450CmHWT51gO3kqdEvHxC+Ak4khRXu6ws1
	9XfY8aCdW0auD7KpZ8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1r2-0000000AqkI-3m7J;
	Fri, 26 Jun 2026 08:24:04 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qz-0000000AqhC-1jO5
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:24:03 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1384ebe7a10so529158c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782462241; x=1783067041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=iVKTR/6BBSxVsdFuf1uPVtw/2kFU6Wlj3pnQFGN9sbzcbABlJgF6VObRu2If1MSOM3
         Kxz5OPf4sXlmeLw+Cj0W8v73B9rmO52oLg3h71uc+aug8VTp1TGeek5ZUMeuRBHxXPwe
         0Tg0vVVV74mHFrxssrQUBMAVj3B6eGR8gIWEXQsYSNUhI6xl+S25REMTOYqBgFU4meej
         YcZ3vDUmh7ndfCX1nzuSsCmX3qDJSyozJy82OPV0bC7CT9TINtsxSchRrUYKGoPh+njH
         WU/VVlnhneiYhi0XENdmLUstw5I7HFYx+UIp6aIrvlUuk2yEgce2UK3jrFB02UXICV0i
         /7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462241; x=1783067041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=Qm1TD+P5+noCE9J40rxuvcI6vo/264yNdJzwI2mC/Z61rJs7kxoAlry1ITLpnCahmm
         GsBiaXCie8m0/U6L5vSRVdvGIpaNu0TFV4fW2RleRJYe3gOpdDz+JgCS15EBbXI3Q4Sf
         na97QfNq1C2a5p5g463Im3IFdoyUJ8euSBa513y2qRhPD/0+acCtS3EI+d7J0adpDzkL
         rHflndByTKAQU8FU0O8M9MJZvWyfWQK4n/kmb7iW5FUVd1BgjaXwwJmQ3QHOqSAKHgd9
         wQhOWlHmtkltrk8uIOJVa0C+RMULK7yLNihJIzXyZfkjSvmIJiM3eiBlNOSRISFSAKIA
         1gaA==
X-Forwarded-Encrypted: i=1; AFNElJ8Lg1G7NGek7CiJ6HtDgxQyqrKWzJ0Cvb1blZiLI0LcheQfXvmfubngvnV2lJSkeKLOI0Tx5asksy5LFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy+wfe9+2IfQEZrLUV12qo9bsB31wK0eP8ME7AuewTjrzK73rB
	JieqqxzwKsVHW/Ntni1XXiEGYmaCrqvpnZtXE3NQwgHjk3FObT+rhNoRh6gjJASf2uY=
X-Gm-Gg: AfdE7cmedd1mNQM9NJSjtJXZ86epDDMX2DHPc/lzgRtidvwEFOtI6TGGysTY8tsHc0n
	iV2tuXad1fyKAbpXR7ebGtLMNvHxHkFZsMnUkJ4+IbVZa9TOQ9KA7X5kt7NoJIZxYguWwbVosZ9
	aEwmC+r16KK/ALi1C+8iRXuKgNH85D2T/v/QO3mKXqUs02tGGSFtvW2jnl6skxunAtmlUzEfdOK
	WNoOdijaDDW3bsSuksWefWYf/wysxMxdJRlz/ytP23UlZ1+4O/nyDNEC2tQMRCedkOy7f5tcPtG
	TQ0cH9FbjcGL4zPQOh82RbFJqnNxD7hWHugNG8kbV+VVEklUzn5hE9jx/rUqK0UXe9uuz0Wb0Bt
	2JBIGDwqlT7uzRMdAUj8OSOYMyrG3IqprbqxeUw5OYdxQ5cPmiz6Qyf1dzGTinmbi23qJy9G+h8
	e8w4WLMNe+ZEZK6OtaoJch7f65sVnIZadV
X-Received: by 2002:a05:7022:ebc5:b0:137:feeb:3fc9 with SMTP id a92af1059eb24-139dbb5b2d9mr6090271c88.18.1782462240516;
        Fri, 26 Jun 2026 01:24:00 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm15557199c88.3.2026.06.26.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:59 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 26 Jun 2026 01:23:21 -0700
Subject: [PATCH v2 1/2] KVM: RISC-V: Clear former VCPU cache on
 virtualization disable
MIME-Version: 1.0
Message-Id: <20260626-kvm-cpu-pm-v2-1-478e5ef8dc9b@sifive.com>
References: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
In-Reply-To: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782462237; l=2593;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=VCtdpA7YF5advtu0bupY3qxS+FfCYS20j33S3YKJEL0=;
 b=PLsuyWmTEcgztSc4jAigjlQNrBKATP06+H1C5DMVQ6nyjljp9p0vtpvzJiWdtN2jkenD9DYIc
 v2Jc5qMTS2+D+On88Jk0ju4NdP5P1vHLUHdxSAETIrJn4I7SmX333Ra
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012401_467788_FAAB303E 
X-CRM114-Status: GOOD (  11.68  )
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
