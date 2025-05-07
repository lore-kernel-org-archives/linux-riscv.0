Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD6FC3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f0FktVp91mfkELBB6nDQqZyZkXNlMVRcKrVvxFLWLNA=; b=T2E1wKr9xt7ywj
	ex+THuv8POY3ZtedQnh8pOC5XDD+uo96CqgMO+PVX4vfyB9aMFkM8JweELFDa4xRf7lo6g4AXd7Lk
	AdsAHQxLNBjUsHfV1ELgQLk8IWlV9kHXsOasWWOKiuTeZUf7nO1K3tboRf2oS7h8kdRlyovDgYvJM
	0R8/2K4HFG1OCdwubcpUt3+r40wDdFj5lx6QXT3VBkTV+pL6X0QdCIm1Z5mcISEQRoTfPJXhK7b8b
	PfOK5qJM33Un/+RPiGq1kCz7rwYvH1k2RS2vgeEvWxKjIwFxWBD2HjRE1/XJMDKKt3U3QLwW/9HEF
	Fz991B1M2ffS7B9Ncwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgfj-0000000Fy0t-3k1A;
	Wed, 07 May 2025 15:26:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg8O-0000000FrKS-4BTv
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 14:52:34 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so10978b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746629552; x=1747234352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PbJx/2qf9yvQbSCx579VYOQTdqNTod1v7Nq4aCt4bM=;
        b=J4F6j2UONhjmqOHR0Vk0TFPT2a5uxZT4BMUGXwRW1bOdexTCOSf8z1syHq+IIQy1qk
         +42fFrRY6K9Z20Dp2G+MQv2UKx4RP5rrNp1w3bU1phzMKzD6HTBBNoZmboSaEfq3sqHu
         vUUUwQibPYIKcZijVnJ+o4fY0746FMJOHNB/4EDPEPZ3opgFOm6myXEodsPZxSWy5J+8
         1ASnSFqpwBBj8BfcU9/9nuCl7r7YaPIzIZ6Vj4FWoS2HIEMtJrI11b+uqTaHq+rFG1Pb
         Ew4xU/1heI0iw4PxfBViNT+RCBlOzmSJk+0fl+w5IRzg1Bv/VMei1X6UQJktLG0bdovh
         0bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629552; x=1747234352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PbJx/2qf9yvQbSCx579VYOQTdqNTod1v7Nq4aCt4bM=;
        b=ARoA3sjIxSBuXz/dKQ0e+fyRUQUKx4xv1pKwmbwgszB9PXVMEmg9CILKuaK+93CdgV
         Whn3o+C1cJ2ihmEPuLFsf6ksdmuXzkBHCYDwkHw718OkVLJdzebyllkUqHVxVBI0abFt
         +RMg8h4PbRkcVcVApEv+kdBDLmk+p37k9vLC1oeL3T8Srh8dY7SbdnAdQRANym4e5b9X
         Je/ClKB+7o/wrRAKBFp3/N674dxS/Z/2qQKbCPE/Mie2B1gYXjh0+3HV83S/pPDW62vA
         AH4wZHCI+f2JZ02Br7QuWW3sc1jMHnCzeckR/2CBmMetZGhTlQQM0fq2ydFEUwuEejiO
         ZlOg==
X-Forwarded-Encrypted: i=1; AJvYcCULxFoG5W2L14007Sfg3IUn2ufW1oLXs1Hhr2t2RQuwGRMpu8pG5TMo/sGMdKd6Gep+o3EoSvnmInlx7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyYk2pjY9qqSI8aSmJmd94E+d02G5UrwE6nx9pA0oZdESViplH
	m+772/bT9EUjKuNjQOyr7TTEbzX1Jzm2sK2+tl30zxaNfs0VM0xjJZMyDIOUYpba+CjmLkTfXPy
	E
X-Gm-Gg: ASbGncvvB8EwoUBOatUjJacR+6AssB3mHzt3289JUniLvALap2mW2vJ5LP+Rp32mSKo
	x1IMfT2mzA1df0sDGkcPRgkTC5eCrHMCFqgI1BWM4HxMCKELz7fGCdJZVV8Kkh+IsR/au50bNJP
	kH2o1pF9RyYTZRkVpKFSjH4Llps+aRcq0O0F9FDaNeC6SpDPRHOYYhQJJXjUthNR0mPnK5TXFVj
	MMjwKcEH5eLbRL+1Z6SH+/wgk077ttFWS9bbkta7JEmdeLqgZouReiLPeMo9Ale5FI4CS7IY2Ed
	EYNi6F8+Nso4HI521x3D/f6+tl8uzlmL/690kW55X3LVDsnHH+eGlQvPqWUXXsc=
X-Google-Smtp-Source: AGHT+IHOkasL2GgJwXCVGFoLHBna4znAj20AJ6lokVQBKyBAkWnLTqoNP4LTlIWxhlyr4ITOENOT+w==
X-Received: by 2002:a05:6a00:228f:b0:740:a85b:7554 with SMTP id d2e1a72fcca58-740a85b7598mr368218b3a.2.1746629552137;
        Wed, 07 May 2025 07:52:32 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020932sm11698928b3a.92.2025.05.07.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:52:31 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bill O'Donnell <bodonnel@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <joel.granados@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
Date: Wed,  7 May 2025 07:52:18 -0700
Message-ID: <20250507145230.2272871-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_075233_051727_E449E7B9 
X-CRM114-Status: GOOD (  11.06  )
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

When the prctl() interface for pointer masking was added, it did not
check that the pointer masking ISA extension was supported, only the
individual submodes. Userspace could still attempt to disable pointer
masking and query the pointer masking state. commit 81de1afb2dd1
("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
the former, as the senvcfg write could crash on older systems.
PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
kernel-internal state and not senvcfg, but it should still be disallowed
for consistency.

Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7c244de77180..f7a1a887ae68 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -330,6 +330,9 @@ long get_tagged_addr_ctrl(struct task_struct *task)
 	struct thread_info *ti = task_thread_info(task);
 	long ret = 0;
 
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+		return -EINVAL;
+
 	if (is_compat_thread(ti))
 		return -EINVAL;
 
-- 
2.47.2

base-commit: 5bc1018675ec28a8a60d83b378d8c3991faa5a27
branch: up/get-tagged-addr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
