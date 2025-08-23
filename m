Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9805CCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgSRd+xKaKAxTndbqBwD61h9ef0KqqUSlv3mD+RCvig=; b=gGmAoh1GK5P4eW
	3TWiUeSAlA6WSOD1lgmQTN9wOALO7HNumMptyOSETpT3xMbEv5+4HWTIenp4ewzuYcCqmy3DK/tZq
	sbXlbpxzTU2QWhcXr6id0AVtERpR/8wEbYb59kszDu9baycdvDugWgPt7AmSy4WajFkdmJpHjGRQB
	NdgVr7o0xKejd3mGjy3+wbRAqm/3x/WX5jxLRuKeROsjdCz6PLAr+W/9BsxvlsrgZdpFCIFME7FCJ
	QU2JYIVk1GBaH56rCX0xX5Nq9P/FGvvSjMh9QeKqkxfl9ebsGIastztfd+crcfM1siTzU+mr7/B6m
	cJ20y5FDtALE52vhzPCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFb-000000052vM-2eqT;
	Sat, 23 Aug 2025 16:37:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqf1-00000004xPa-2LKz
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:08 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b474e8d6d04so2815580a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964807; x=1756569607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxIYjoD6qGJ2CFZvAXrDV0PDdB+JeyudOZZgvLWLYX8=;
        b=o3GePfqnArwIGJRIOmEI/19+dLgKkNKkSzJgfSRv7nb3mN0vbanlBTVPxtEEaE3HVs
         CDOtirJs+VXllqIEsZ9rqGApnlrDelYJUeqvClXuhkXFrXbQOcflIv884fOgo1nCF00M
         zrIukR94VPbXPyqRKMvwgwbGVqZiNS7Afqoeal8DCdVDDSi91YFOsTITYSLgLn6dwJ4q
         3rj/WP7aj4IJ9QcFuv1nBFWQ1mybGEz45yuP2HqX8mzZZHY0wy13eE0t3kJF2NswcdhN
         5NS/fozqBihN1MX3PeiceCKEr96zs1TJ83YN2PLA/P6PH8xBdfvAJg81US6XSgoVWIay
         yy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964807; x=1756569607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxIYjoD6qGJ2CFZvAXrDV0PDdB+JeyudOZZgvLWLYX8=;
        b=ulSyJH44i9j3VTKCDt16fjMJ1sXrh5UafTdS1SCADGXF4bJuKh+bJuo7jSfUWBC7mj
         mc3iMdxPn/RzvcZtJ7W3pJZSMrfaF3hV/+GGtzAt1b4Rli6bPfYmOXK//Ra5PjoWdhuo
         cYGicRkop81wJ9JSuixXV0FQANilu+SoO+v41aYr9FJh1k0SE50QKNdb3LHO1O0+wb8l
         gqrd0qUBY/EDbkeClPsYhySJKiwC025Vlb8OjGJwinoLVH0SJKVKTuVaHEZK2ltFGI4Q
         MERA8OsXLSHGPnKhWZ0sxXY4OesVNjlxefaLvwIDWmfcW90EZEGlFNsIbFPcn2crUV+J
         rgQg==
X-Forwarded-Encrypted: i=1; AJvYcCWxSkxqoKY7tLBEFHme6mY25H5j16jfUBMfsYQoDMX/jfydNoYCyU+8tK8KuaIVjJY0+8DcRziKgc4X5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX6ZJ025mtMHpYAjtuB5j5JKI2h2w7P1TGYd3YlpRXNuOD3Ea3
	uDoUHPmQsk2iKgCOqGoxqxW2fiPg3K/4S/lY4zr+xwaASO+AcI6V+4zfcl/1/lvFeiY=
X-Gm-Gg: ASbGncv4HZqpYtkZ5SjrMJsrYG6hPAH3d8NrLK4qvaBG0UHjCy5uBBxc39UoLs2QTZ+
	asvzDaOaF1xAEAP9+FVUHNhm+9hDPuWPY6jS75okFWNPRECyREKR82bCpXkM2oaSDQhD4+qshx2
	g3SgKX4XvCwVKYx8toxHj14kTKUZSvWT7VP/3EEL824Ky4Ieh5YiwhVfo2YUn8NfNBrdV+N5jIv
	2IFKPhpH2ETfHPWcNkaTuDdDN0EXxzD/UavJA0DroyvbxQ5Zn8aqpSIIjLDDtBWuc/p/MF/sfTp
	guH7Ond4w58qFjA4PszlWvN0nfnxgn1K8AwHYeeCLSa+9bVFQnNKXDNCknsNdY3GmpSQE4iFSQG
	5FFEukkLXtfTubrMzmvTzixfl3x+vnit1Fq+RhRYx2ljSM+OeovrQy+iWUPUORlTfgBY5LlZL
X-Google-Smtp-Source: AGHT+IH5FZJLOyfrOllB8g78rtlC90yaqO9Xq93Uvux/rEMgW/lp4f5ouiM5epDFAdg0M4MxVn/lXQ==
X-Received: by 2002:a05:6a20:1592:b0:23d:dd9b:b563 with SMTP id adf61e73a8af0-24340d15dcemr10004613637.39.1755964806710;
        Sat, 23 Aug 2025 09:00:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.09.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:06 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 1/6] RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
Date: Sat, 23 Aug 2025 21:29:42 +0530
Message-ID: <20250823155947.1354229-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090007_606024_8AA305DD 
X-CRM114-Status: UNSURE (   9.52  )
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

The hedeleg may be updated by ONE_REG interface before the VCPU
is run at least once hence set the initial value of hedeleg in
kvm_arch_vcpu_create() instead of kvm_riscv_vcpu_setup_config().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3ebcfffaa978..47bcf190ccc5 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -133,6 +133,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
+
+	vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
 
@@ -570,7 +572,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
 	}
 
-	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
