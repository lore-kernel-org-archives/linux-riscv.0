Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BD1C61DB6
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdFKCUk7pHqQBvHtSXB9UUO+V6ecb+IdMVYGUNPWDUw=; b=oUfp62wkh+ct44
	dLaMZRgVW72+aG3z1o2EA2URQ/Ys2ryk+gUyU5Iye1lo9dKsKA/YtnOCtO7A5ZtpFoyJz1Mguxdks
	5pJJ70gGwtUpu9TuyEzGnqpwBVMvRkllnkZ0PtgbWGXSjP6XH1NWXZ77wjl32fZUL2SgovfKQwRUK
	GJ3J6kZbWIkcp7MCbdsLvm/wBzjL0RQb7Z0dH0dRKnrURUtnytdeZCwSrrQTqGAycuNKqlt0INe1J
	l09Jm5TLCF4dJzWsNu866JqPJJAOmXes/0mB3Pr60V00TjO8KLtLrmJFb5kxa40+figX7nB10C3Vg
	gjTAN9Mw5ht3zsSaUwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfI-00000000OtG-3Vxb;
	Tue, 25 Aug 2026 08:37:52 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfG-00000000Orx-37Wu
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:37:51 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso3073342a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647070; x=1788251870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlP9O0s11C5YW6Wj3Uolvqko6ksI3Exocfu05SFa8SI=;
        b=IvMZy+H60TyTglyt/evcUd4nhrPKIhYZutDasJuflz1uPWWV6z/9+bkXQNm3zVasjd
         NNLPj9zM6wJ95BQpW0Gb9ohYruDCkF0BI6RE4LapoUx7/V8vTsb4trADxQ0/vUDFwoIq
         dIk1HlOLL2Y6tTAP6rws10GA21V4aUucgBzUCAggIEw8Oi8jVwXUjYFAH+mcAT+J/1yR
         rUAtJRS9mOLjsOUOPKLUmx/Oe2CuVsJFwYsGcQYsQY6aQOPrlvIr1Y9w207ERrKWAH/4
         a8PyFgquB0sjDkBPBr8PX540p/Q6m+LMAb4sT2sLeTyn+MTpzdFlFg8gq87RYnJH87Nd
         Md3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647070; x=1788251870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlP9O0s11C5YW6Wj3Uolvqko6ksI3Exocfu05SFa8SI=;
        b=ZQkaOE9xWiDM0hclzgHFwJT3C9kQICswHhmHa0XYY+dnyBaE18D20g6S3eshzCF8LU
         p5FOjcwxe17W7IUeKDhvhU8SNfvEDhhuQSojMaCcjwrekQaMlaaJEXV1FWLaD2pldgpt
         C4K9Uw9W9Q2DlR+vm41eXBsbgJgl5EtS52MGTroswnLm5kk3a+UUpd2s3UNy5r3HX8XX
         0FlBdOLzG0v6ot6FTZcNh5UBQn30gaQEJtuEHnz46Qhc9zbctyjNf/mMjY4qpX3Mh2ZJ
         3/Fku82Dp9ZT23ycTBO9z9n+d1V8RL+yKZEq5io1rxzDO+0yi4ZY9l3hDo9P9H9eGtl/
         N1Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrteOf3WT6NQ+K0ZA0mYos9wo4G5edMhh5P0e8Em69RS3jjBpU3Rh+kXblfeWVnojLf5RXOm6xcEFg/zg==@lists.infradead.org
X-Gm-Message-State: AFuF++nJM07nWdLAteyVZVEDhN6kvrTS42aUwGSdhavAmq6beoHyGrOm
	A5obnY/DSQ2FApGtWyNsksp1niJVL0EkLr6yN+j4DP2sLj795tPapDl+
X-Gm-Gg: AR+sD11rZFG+RtG6qgZQuI72AbHsGAxqL+rE3DGFqC29ZwOD38H/NJo/CJagKXrtOwl
	qkmX8FMOH8gkdNNdtr2Mtduqr7BDLRfOe5TGuDJZ4lM+Q69ViPLGRgAUSYVxKUkcCiIvCH3QBA2
	cixKhTTh5wmuIIvZ2f07zgCF/vfcaF00U3Hl93E3I5YaXiCMCF34S1yG7wT7t45znTxP8+qiFwN
	KDCUPu4iaMZS5Pf+L6VttYuozGyIEx7Lwtz99s3IOe/yGievgz7apxNx/yx+Rp4kxiiwJmp3+qM
	uB0SXKF/9gTjsmohogN6CEm9l56sPuEbKT+YnOpkFOZPuQwLPo/EEPgSHWQp4N1OYw1uwOuFhg5
	YZrKlOvuh1p4KFNe51SWh0uQa9XvKwMnTJWiza25neUx+j5xdp2EWZLHZVjQ7qZowPvLtF2XkOD
	DTVrLe2+Xzh+9ihNO7+XMTJnlHN1q54m8cqOYbgEeYBp9McfFvVY2hUQH/IVGVfSBzSFcde8SYO
	u4vkXqVjAfV
X-Received: by 2002:a05:6300:6bc7:20b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3cd9f9933bamr400900637.0.1787647069755;
        Tue, 25 Aug 2026 01:37:49 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:48 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 2/3] RISC-V: KVM: Report snapshot write failure to the guest
Date: Tue, 25 Aug 2026 17:37:18 +0900
Message-ID: <20260825083719.643970-3-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
References: <20260825083719.643970-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013750_785066_477526DF 
X-CRM114-Status: UNSURE (   9.53  )
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

If kvm_vcpu_write_guest() fails while updating the PMU snapshot area
on counter stop, the guest may receive SBI_SUCCESS without the
snapshot being updated, leaving stale data in shared memory.

Return SBI_ERR_FAILURE when the snapshot write fails.

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 56dd5b1b2846..45dd5233340d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -723,9 +723,10 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 	}
 
-	if (shmem_needs_update)
-		kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
-					     sizeof(struct riscv_pmu_snapshot_data));
+	if (shmem_needs_update &&
+	    kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+				 sizeof(struct riscv_pmu_snapshot_data)))
+		sbiret = SBI_ERR_FAILURE;
 
 out:
 	retdata->err_val = sbiret;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
