Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CD9C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyJ44Wk/Z3AZwJ7mezKGYSIx9wQ0v16ZOgR6kmEHeBw=; b=Tj6ckX4ZuIgTOF
	RTY0e82hSaFeBEdeepglBE6LzGeGRxjd7PuE0jLze08av2pAdaVl7nBoWnmzBOQB6KOTcGFmewDpQ
	va4Ox+ukuD3CpJZ8h+/EuOmKjmj5roQxtG1WuAFgD+Lz0ki1nHGn18cR5wpa+csBJvwgB5MVpB03O
	LIHAAXJq6h4yr/2RyaUXJu+ups2EOKpc3ezivefPtab4vpp2hDgNRFdlAHKbJcnO4gkpRrAtMSeC4
	H2BA5v+9MBQYWlk7MroqQsEK1Ixdu65AevLRXDqDvRuds0eT8MjiLnccka7euUUAyxUJlbGdJ+8JJ
	hfe79FxDC+bJrAuYKDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnon-0000000DNHS-2sft;
	Tue, 16 Apr 2024 18:46:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnp-0000000DMUx-4246
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qvJukw934GuSrXeFuup9ak7dnmqxN0Lb+FQnvb7sFPo=; b=jVPY7LGMbGiCTxsXqvw2HCmFiT
	dq1alqb+xdaJBk9uLTEc0hBWa8yOP/pSLLEs38gwN9PbRmIl9dGZO9FAjXuqqEKz6GhU+vBWJjwNi
	QVzsYb30iQ93AZej83stpGc/ARolZrAGFKv02f8PCWHwQ7J6lrwUYO15BSKL+p3RNg4oT55cmBBdf
	OmLVAztTsNGvAXuYxYA6fKjbjez2QNM+exxkxyEY0oHwOsDYMUvM3H/Ftae5JkdHS7nGkJzvlQDm/
	BK/wvO6pI/FJ88wVKzmLGyYgARM/tW9swCZNNcsCcvpRpOsIvimWOC0JxysRsZxy8Y8cnBUMByJC1
	2PutpumQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnl-0000000BCJr-3JHB
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:08 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ead4093f85so3960475b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293104; x=1713897904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvJukw934GuSrXeFuup9ak7dnmqxN0Lb+FQnvb7sFPo=;
        b=0+MJyCFmaQ0augpRLdVlLZA92c45kbxM8mgkMNV9m2wJsZ+3HGBarA51tttXv7Cfri
         2t6HwIEFcDU/Vz19+ZMHybOPF1LPg9Iv+qRgOGv8D1xu7qD8d4KpzaOXkk7kUdZ7/kHf
         h+nzFSCgEceYkA4fznoOApPFZkNbfKAXBQ62qStcbJ6eWZ1ymHTDIVRvwmwmr13sacSa
         ScHk2zTHga0fT3RwSfUnaXknv1Og6jkDb6C9O6y+cIdiQF/cMO/UTyam77Dr99ujYbCt
         GnVns23c8UVl6HWY3JlUAI2kpRs3Ms4H8teJ0cLEkve1gbnFW3pnD5tHGUNDgq2OWhKQ
         KeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293104; x=1713897904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvJukw934GuSrXeFuup9ak7dnmqxN0Lb+FQnvb7sFPo=;
        b=vLk7NpRND63s3U7840ucjzms9F3Upfzo9a+iZyT1lvpLEycGXC5OvwoN2zRwatdJgr
         JS/aOlQtPtwKSooxNT3mutifLuCuMoEskoNGCQl0zI0gxqhUjazpTiDsvH8SRseLTJcL
         fSJ7LxTwLPJB3TX0TvbtteQKWqLwqfWf0zYhyMW/yEwan+tqJl7tVipTozNRxW0Pklfq
         xGw3HBwHapQaewe4EsT0/W/sHvybWiimFxt7yDBCfM4YpxtS3Pj/pHcQcHhCL18hWycJ
         uDujriSYZcNn/XWEBm13lzgAAa2ABgCAYA9qblyXaMCiyW5/cL+AsMl+MHpuRp5laiDx
         L+3w==
X-Forwarded-Encrypted: i=1; AJvYcCX+Qxv4w7pylfaxr+ow9bRuKHm658gLTvGYOZ2QGYslJIwIC1qeQcC9r4FjWsNj9C7lkRn2JwUkMZOhaGwnJruWTSatiXq3x7ASKw8S1Y2b
X-Gm-Message-State: AOJu0Yxsg+ey5gWtYSZ84XyDbmEZrtJ5DNvmYEIZSgxnHU7WVBmJg2rj
	wlzwgVM5K+hsRk2eRXT3KodVCyEARMxhWdn+rX4jAxi82UEdEZyFrtfXlqjZcVI=
X-Google-Smtp-Source: AGHT+IEzkuVs13Wd8oWq41fr6Cm4Cf2ZRXqAps1equR8HRaWNn24PI2u5SFf2jAeIUGzEw8b8iUdrw==
X-Received: by 2002:a05:6a21:2d8e:b0:1a9:dd82:a42a with SMTP id ty14-20020a056a212d8e00b001a9dd82a42amr9766403pzb.31.1713293104126;
        Tue, 16 Apr 2024 11:45:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:45:03 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 16/24] RISC-V: KVM: Improve firmware counter read function
Date: Tue, 16 Apr 2024 11:44:13 -0700
Message-Id: <20240416184421.3693802-17-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194505_988103_E806CA11 
X-CRM114-Status: GOOD (  12.09  )
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

Rename the function to indicate that it is meant for firmware
counter read. While at it, add a range sanity check for it as
well.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 2 +-
 arch/riscv/kvm/vcpu_pmu.c             | 7 ++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 55861b5d3382..fa0f535bbbf0 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -89,7 +89,7 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long ctr_mask, unsigned long flags,
 				     unsigned long eidx, u64 evtdata,
 				     struct kvm_vcpu_sbi_return *retdata);
-int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
 int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
 				      struct kvm_vcpu_sbi_return *retdata);
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e1409ec9afc0..04db1f993c47 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -235,6 +235,11 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 	u64 enabled, running;
 	int fevent_code;
 
+	if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
+		pr_warn("Invalid counter id [%ld] during read\n", cidx);
+		return -EINVAL;
+	}
+
 	pmc = &kvpmu->pmc[cidx];
 
 	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
@@ -747,7 +752,7 @@ int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
 	return 0;
 }
 
-int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata)
 {
 	int ret;
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index cf111de51bdb..e4be34e03e83 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -62,7 +62,7 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ:
-		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
+		ret = kvm_riscv_vcpu_pmu_fw_ctr_read(vcpu, cp->a0, retdata);
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
 		if (IS_ENABLED(CONFIG_32BIT))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
