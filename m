Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738BD103E2F1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m2FOp/6DUdfjpHZ3TP6Vzy3Z0549KSG0KWyvzZjuzI0=; b=EvRmF+6jg/J+cI
	WujvkQYDThP8rSVC6yFbBJnQozk+uSuGrC8ZifsMTh36attvqmleOuQVMlI9BiKWF95hdHzjfPr3L
	C6eZSI4I5cPm3h1PdnVmzsrBgFHon1OpjJygW+zi9KZtsVZic2HXwoioKXG1vE7w5veXWbYgN+k+I
	mCIEwwacIoPTj2V3uzXHhlkMptNkEc+Mq5R3/JmZpxJn7EXSAWD5smYUHKVwdqeyFLWV/Lk+fw2Yt
	1867yu0bsNwy7U3z1C3ciikGoDIMz1q+c8Y3kGkbuyg4QQXC5vHRV0xHpydT5I6H+Cg3wE11U2fNe
	969qeAVgepyIxsBoaU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SpA-0000000CnXd-3TML;
	Wed, 11 Mar 2026 23:18:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Sp7-0000000CnW4-43Qi
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 23:18:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso3041915e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271120; x=1773875920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/PJeovjjoGLMcedyN4Hvdo++XuOQtv9Fm+hj7Ucl68=;
        b=YlhvLr0aMdTRb8/DStX05Sa0kF3Gd9L+mAbIrquZD7aqMr05CDq+ZMy1qM2Rva7dgi
         aTde5JbGhyMKojzdj7/2cmHIOCaS5Itn/sf9/IDo791C0TbhZ11IixtNkFP0CFW7gKsb
         qxneW6CWdgaTgHMvUn64o5DwdSqpLAJHAcB9jkzEjwAMoLYdiqrw8hpUD/nTzjX2icCG
         Hcs7K+yIR1CQBG0z7kK9gQLFUJGYvzRd4O1uM00FnIFLQS6QzhWwun8CSpW5Po5w5o8F
         wXIRZ9AUrjlv1XDcvLN71tFDjXkq2shl831Bf354iocd3DOQFZyOcq+v1ECNXzaUyrIq
         VTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271120; x=1773875920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/PJeovjjoGLMcedyN4Hvdo++XuOQtv9Fm+hj7Ucl68=;
        b=AOIW+lIPMUrYLYSLvwD9ehIxKeBY4Ficwg2Uv0ljfYLWStHoW0bAiVWYBIRCklr5h6
         t/7myLZzsyMEyUppziJ8wmb/fvQBIipTChZoOOzW92zZp+M6kPbzQQJMMlivvRdF6DNe
         9z4KuhnkK28kZoHNG9gdyP5VWiGewlNiV2891UHjir07CkCAfQKlSyv+eblNMsl7vdBU
         QMIOpW/U5FY/YYmOcgV1fCPolv5oWRP9kUBgPwAewlpCujbDWecE7dMcrVyFi5foy+qV
         P2x2Y/dcrC8KctNr+qqcnEWTNIdvCPoABFATdUgGnkXVcy0EyJIR8/aUxy9DhAIbX+S0
         ncxg==
X-Forwarded-Encrypted: i=1; AJvYcCXeb9RGoCSto4Pjb1OQB54usJMhdMACjHUpo8KMpwVpennYmhmoltc75WaVvTYFr7EG5fayzZbdQOLo/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBErOCfXLlZQ2O6JksMILtMxp88V7K62dOxzGq7G32wERZ9YIg
	Mvh//W02INIunRvN1j1xRhf2147xTUl7Za6C7f+jdZTRIfL5dpkONqt9
X-Gm-Gg: ATEYQzxBxqjEkfF8ldKOG5VW0NU+ffTORF3i8aLqUCfnucJSC0xsi7/K2EGx99ByOhX
	4WqPi7tLRs3YfUB3tTg2zwW3BFiVnBGppIlhGfjvNsNkF1Zqpm0OAt8wt7FPYbO1phrAjdYgfdu
	ftMfHhVJ6+Qh/g+vRTcaLcZEkOl8HqcTBtJdfAyv57y+d5ET6khAjC2JHmZUKEJ+ivfO53bRasv
	pOws4D+N/CVLZKjZMSoqNnwEzd5X5YG+K6xykpk2XotdAADYjaw+ega5FR6wb07rhEiXxvOFJ5X
	gF/adHJlkR8R+ASk2jnIc+VYDJUvG8c3wNROJBXByMS7Db5sN12KPsff48DpwTLwqVbo8nCCudV
	NQUNQT/moki9P8daeO0hkifnTCBVWSH4Pl52hwpkJgeJQ61NQlJOotRIIP/94MA74yUs7bm8hPP
	vLohSpBd8ypNmfHF2vrDUDlYoa+JD5chUXVtT9rfdj1SRl0KhBUu1IO6BVFU/c
X-Received: by 2002:a05:600c:1e8f:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-4854b0a6c39mr71236095e9.5.1773271119975;
        Wed, 11 Mar 2026 16:18:39 -0700 (PDT)
Received: from osama.. ([156.223.222.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6bb4sm83586675e9.4.2026.03.11.16.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:18:39 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: [PATCH v2] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Date: Thu, 12 Mar 2026 00:18:32 +0100
Message-ID: <20260311231833.13189-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_161842_052933_1F7D078E 
X-CRM114-Status: UNSURE (   9.18  )
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

When saddr_high != 0 on RV32, the goto out was unconditional, causing
valid 64-bit addresses to be rejected. Only goto out when the address
is invalid (64-bit host with saddr_high != 0).

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
v2:
- balance braces properly
---
 arch/riscv/kvm/vcpu_pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 4d8d5e9aa53d..ec0c15726da9 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -423,11 +423,12 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	saddr = saddr_low;
 
 	if (saddr_high != 0) {
-		if (IS_ENABLED(CONFIG_32BIT))
+		if (IS_ENABLED(CONFIG_32BIT)) {
 			saddr |= ((gpa_t)saddr_high << 32);
-		else
+		} else {
 			sbiret = SBI_ERR_INVALID_ADDRESS;
-		goto out;
+			goto out;
+		}
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
