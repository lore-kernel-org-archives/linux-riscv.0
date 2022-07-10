Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0B4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Vfh6gkS7S3BE5D7RzM4tcbyjprR+LVOnUrzFpoF3KU=; b=IsYEZYq6UnL7Vb
	kgmHZK7fVFWeXs6Zt41eDatQHFOeItGUvIRJXi5ZZ11TPNezG8ivwqMtRxYCafSi1t+SXkhQvIyFc
	CPZrD+TJn8ln4KI+1mIMCgjfV07Qm2lCef9f1pu67l8b0Mu4tC4U+Q7QQ8eZV47PTAvurqSSQC5i3
	DcRKpoZNPr1S5gDPe5RQHMzyQtSDp8W2zcI80SFlq3oxKqIVRZYd493rfLsxXdQSJKhFNxj19M9yq
	wl6gRQcwNRzvmgPqRzbrXQOSCqiMVGj2rAuCbeZqHKiRDT59LxWoSI4SdkoFq+x5GCKb3y4JMPjjJ
	zLLOz5IRly4KKcVKC6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAYb6-00CBtv-3s; Sun, 10 Jul 2022 15:11:48 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAYb3-00CBrn-GT
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 15:11:46 +0000
Received: by mail-pj1-x102e.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso6109218pjc.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiGKAq8E/61V/xfD2osUhAigUxFAGIjOAFkVRU11S5c=;
        b=SwASqhsqF/uwpbfqLellpCwOiSzS2k5/C73tZViHwi+wlDrtSvqy/CLZnD2QvQx14O
         05Hik6bMxgJLrqyo0hAR3hJVC2DjtGviASL9QpxRfJ2Mr7prJ0NLHiUeNc6BuYBZft4X
         ZTAqYVdhB8j7EjMsADYyuJSDB4RG6atPSLW3MPkjzoKYaSrWiG9MEd4+xUmzJ7pjW7n0
         v8/5ZFNEOPxeviRy8dbKLUM+VbcoYbCkWE78lVU+ATrf/m6cHHGj76Xk5hFSN2VmLNRw
         k84hTH7nPLuk9tK4wybq6iny6+lXDfG8UDKS9AImQNoG7IoP2xyJCGkMNzNNgc+CpBIZ
         UO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiGKAq8E/61V/xfD2osUhAigUxFAGIjOAFkVRU11S5c=;
        b=cwBtKIP0qiaE2EsDYOFyetFJNnaECoPFiY/GLIPSrdfdmCTrGP+qfAvuT2QGHDhDQC
         l3+nJW7nlgIX/9A5XzN6dcGh3tJfNpw0tkw3iaul6kqejLEBU/Jki2eIBbehxaj+pBat
         iftIaugdT85Cgq7U0hU0+JzaaRW9yIV0Kx19To2lSIGqc7nrcHpHojS9DIgfTlUqYHv9
         SgnUE+DQ9JjyqJjKSQqf2ZM/Jal6RxnI0S8PYAs7iBEpNaLq/3KOT4PLaZYJNQvDhFQy
         bRDa+X+FM4VE/oZdWTVCRX1kJJ2Q5WDrwmSohB/IB3z6KQm26kc1UlIs07kp5YGiIbEd
         9LAw==
X-Gm-Message-State: AJIora/MhXZKQtaMB3TilKHoRKwOT6jruJ8ohOUFvxEjSxtkpmXdwAYe
	TmtTDTWi50jEDxjoX2L9flHTyw==
X-Google-Smtp-Source: AGRyM1sR9ZDu/2Ia1wh+BMIiL0MAl4yRxaD0cHdlrNSxgTTfrD37Fazff0AZYrTaHIbPHcXWL6e9XQ==
X-Received: by 2002:a17:90b:1c86:b0:1ee:e795:a6a with SMTP id oo6-20020a17090b1c8600b001eee7950a6amr11794505pjb.205.1657465903563;
        Sun, 10 Jul 2022 08:11:43 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.98.167])
        by smtp.gmail.com with ESMTPSA id a200-20020a621ad1000000b0052ab37ef3absm3014756pfa.116.2022.07.10.08.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 08:11:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
Date: Sun, 10 Jul 2022 20:41:05 +0530
Message-Id: <20220710151105.687193-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_081145_568500_6ACED0BC 
X-CRM114-Status: UNSURE (   9.77  )
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

The kvm_riscv_check_vcpu_requests() is called with SRCU read lock held
and for KVM_REQ_SLEEP request it will block the VCPU without releasing
SRCU read lock. This causes KVM ioctls (such as KVM_IOEVENTFD) from
other VCPUs of the same Guest/VM to hang/deadlock if there is any
synchronize_srcu() or synchronize_srcu_expedited() in the path.

To fix the above in kvm_riscv_check_vcpu_requests(), we should do SRCU
read unlock before blocking the VCPU and do SRCU read lock after VCPU
wakeup.

Fixes: cce69aff689e ("RISC-V: KVM: Implement VCPU interrupts and
requests handling")
Reported-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b7a433c54d0f..5d271b597613 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -845,9 +845,11 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 
 	if (kvm_request_pending(vcpu)) {
 		if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
+			kvm_vcpu_srcu_read_unlock(vcpu);
 			rcuwait_wait_event(wait,
 				(!vcpu->arch.power_off) && (!vcpu->arch.pause),
 				TASK_INTERRUPTIBLE);
+			kvm_vcpu_srcu_read_lock(vcpu);
 
 			if (vcpu->arch.power_off || vcpu->arch.pause) {
 				/*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
