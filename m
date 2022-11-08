Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE6C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 11:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5UrcwsaI0ekiAYhpHemFbSKsSdGhHNW5E5FnHvckqX4=; b=tsnjLF0wh0c/u1
	bLoYst4zUWh3V35KPBoaqq7z/u4IHbGV8Cf7TlhzMj/Srnv0K/iQ1R1AH+sbMKlunGk07wKUVk413
	LUPc36sua5y+8e0heJrKHxCeJlqB29M+n5k03HoRBWBMVqSDZDylQhI0xXUAcKJ8TqGuFJmgb9eNb
	pe1j7lqTpZCn8l0Ihnh15Y1l98jl1LAMasCN1zuZLtl/kNwAnQQiCk9LD+uGeRp1JOH9eyaae7qz3
	N+nZqIjrEi8Zrs7ERVasggSXIU2HAgsZnSwlD78K2N0PbIqapyA887c4qN+LmhjkhcxOTdB6V3gx+
	UuT9eg2qlIGs0EKbDgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNDe-004yke-K6; Tue, 08 Nov 2022 11:56:42 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNDS-004yJS-Pc
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 11:56:33 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so15981447fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 03:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3IdGuVwuT9z55p1UOI8oOZYWHzgZr+lWq+tH4C3SKY=;
        b=i0yF7bg6ex4RKXikfrJ5zdJSayot1X2Lb0r694qbt0EYamWx6caup3VyriwtQQiy1d
         BABWfEwcAXH3CZnoS4IY9lpH6Jkq4WYJYSsi11NU5BCG1/7f4zdtqNzWbfN2Aps3p7Nh
         gXtqMZQgB9I/Yx984R9BSO84TsMBHgI8hSoLBQphrNk8ZOzIh/ue/Ehcu9tSkh0/IV5l
         I7/g5ctr1Hjlfk4p1zgtw6Ai1wn57Ymdt5nm/cnnjsqUrgs9XPXmAf/jwn+1bPWz9Tvm
         klJWYAalUb/0AZCW3xDoO6xiy1qoS08Ah9rPbG+nZjabfMG2sDJY+Qvgvne2ga+3Oslt
         9TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3IdGuVwuT9z55p1UOI8oOZYWHzgZr+lWq+tH4C3SKY=;
        b=nPsKRlhCPYTMJgfCAYVCV7IFwjwUFTk44Fl0LuQTfT5RgF1zFnLZc9tuhaV+AnpdkJ
         JX4P5mXEyCWFHLcyoLOL5qkd7u/BV1PMykmFKeZP8AewGf/Zub6qa/HUxxVxYXrFMIP9
         PO1Wwfg2h+i04W1QpKlNNlsZJRh+Qv12ncs3/2FEc+CX3oGQOgdqRFGcXYbgX07vx/cK
         3aeWnM+beeB8NAQjHWanVq2Z/4F5HUlhZs341thLyxajisnUYbosjX0Um4JGL3Ljj/Ll
         hZ6BrQT1zuzaAhNFrj/oLOMxltsHIDktP5jABUCFEnz426uI3m6SBKlfdoNAOXRKmCqr
         RcyA==
X-Gm-Message-State: ACrzQf2P4vyE6oAQFjjoaU8FUHzedlXkeXhLDaEkAPOtcJnf00404oi9
	DHyS0BS2oYcdL7gvyXSdtQN7PA==
X-Google-Smtp-Source: AMsMyM4kIRsBmrnl+RCP4gY1RKpg4ZErcblTVHcUHo3/UFVmRe6v2bNdNzQ70TixhA7jRnbwMNrwiQ==
X-Received: by 2002:a05:6870:64a9:b0:13c:673e:3313 with SMTP id cz41-20020a05687064a900b0013c673e3313mr37326532oab.128.1667908586671;
        Tue, 08 Nov 2022 03:56:26 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id s205-20020acadbd6000000b0034d9042758fsm3376199oig.24.2022.11.08.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 03:56:26 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
Date: Tue,  8 Nov 2022 17:25:43 +0530
Message-Id: <20221108115543.1425199-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_035630_856638_0BE0C095 
X-CRM114-Status: GOOD (  10.36  )
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

If xfer_to_guest_mode_handle_work() fails in the run-loop then exit
the run-loop immediately instead of doing it after some more work.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 71ebbc4821f0..17d5b3f8c2ee 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -984,8 +984,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	while (ret > 0) {
 		/* Check conditions before entering the guest */
 		ret = xfer_to_guest_mode_handle_work(vcpu);
-		if (!ret)
-			ret = 1;
+		if (ret)
+			continue;
+		ret = 1;
 
 		kvm_riscv_gstage_vmid_update(vcpu);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
