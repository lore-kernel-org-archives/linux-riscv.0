Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE45CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaKwAGqdMUTZttcyK7WJRSjKYhhFcu7lvZql8xeY0aE=; b=GV9Z1xHerMMDSN
	EL7tzYhzlPEs1TzdxJ9SqE9pnjGsHyC3GIoUZKfrWA5OFi5RsCmrWOCuCsxKIVq471uqYiJzrVoZd
	6jQecyCH8Hx2VZYJD/BMJ0GDXr7MhbF6RoFd5lHAZ86CoC7nkWoPPJaZPrA1Utvz0+rEbanJSh7BE
	NW7IgSBPN8lPcgTQ0Uht4nMYsZkqdl+bG1D8iegSyBK0oi1Z+tiwz+KWNuCz4bdzOXfztf105ur5+
	js/HElKWGj23qU1ET3XCCMPH+1x151DsEsgngDjV5xEzZkgermq4qdVAf7KmSdzd9cJcYMgDBpjg9
	lN706/V7kKPSfOiz59hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFr-0000000AOOs-2pYe;
	Mon, 01 Jun 2026 08:44:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFo-0000000AOKm-3b9v
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:14 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bf30d530bdso24807625ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303452; x=1780908252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RmuO/Bh/pyYNP3lYnfVLduBl3NGvkZrBTGIwUHKLT0=;
        b=kDZyxP1TD2Sh8RMI920b5WGCMpQr4etjLtKw2pRxkdgBXeRK7hmqcvSJnaSh+BaX8B
         yU3xFqG013Ig//IISKcphhdp8XIXyGULyRGq5XdcjvSs39ehesegJ/Ylxlmjfpq4LWLa
         jFLHPyi/4p5AKZQtJ6C7Pmo0eGJVYOts2L1LwohhZVWC0Iu16FChDfAUknKozLu5xdwP
         ktlVjK4+1Ak0cKumvWGLybYzuY+WWXlAejiDnDNwOXIF7ivDsXdNg7TvmNTG3wCfdTDX
         XM9Smj/t9yrtjT1gwQ9X7i7a4muaIcCyT9yvTgR0NaESS8chSPaQ9FTVGMFSfXL5kSNw
         Dh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303452; x=1780908252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RmuO/Bh/pyYNP3lYnfVLduBl3NGvkZrBTGIwUHKLT0=;
        b=LZn29dpPtfJpAkSmIz7gqt9RbiOHX4iEp7E9X5Fz0gQh354vJ1CCx5YtQN36BCt7nl
         CCeJBTEBeF7Ost/SXeyVvG6QO8FvwttDUCxLSsyO4tR++Os2xi/BkiuHbHdRYxWZXdHw
         BL+Un0Vwwo3oJ7/UAfyG3rnJFO2RigZl2VsJcfF+45hVLy2ISgNEaV/le5QklYt+yZRR
         YQnn5DMFq9v0Mf3tTN4LQxKzAJVhR7op9Pwm+buFWjo7EdsgJdVL1aFa+FRZqiag3oRN
         uBDkGOiz3H4NWfWeAwrzn785XAHQcW43sppS30C7OqE71LI4R9W32nQi7csEqLaPWQzN
         FTpA==
X-Gm-Message-State: AOJu0YzNVzGjyHHOGAsVg7HIQQQM4W+YOJhtYZwPB6E3GkfMAmRdRJuQ
	og7hacVugGHufpg/e//RYBmAUQtApHy5pMdVJmtPUGfY7xIB481IObzd
X-Gm-Gg: Acq92OFACvlMDtmMifkhzX1AAjcaxsMfcYTq/deuxJQK9rCr8wL74z6pM9U51r+S6Um
	JKvjXbdGV8El3HctktLazh33oECw27RiGDj9tRKvavKlgJjLjkx4aRiFonWKPoXoBeclfebZ7vK
	H2yLxKvCYDfQdN+B4ksNxcen826GZgK6UbpMpLSok+YjLXD6F5LKxiP4f8LXna3DOmJyR8oapBl
	YwiFF3FC9klGU+acMRAnIpwRYGqHmKwhCeX9jAq4xZmGSvdgr/cDrzdvODJGhOO3zhHScqQRrpO
	UfXIDMeeSYwe3mWgJV7HZTctt98Zl2ulkpdWVVW0BWH5itmrSFaQcFMQ31eJRfdA9hkAwkdK6Yd
	3bjU9rgWcba+A2+kmLzztrmNw2f9iZtqmfEpImEH+mSX8ioYBsY/+KCdE2XhG/DCBMezg7nM5DA
	XQie6VmBuy+Egkz0ASV3POfj0dlZOTj9GOkhAHXokOsahN
X-Received: by 2002:a17:903:41ce:b0:2c0:bcff:e198 with SMTP id d9443c01a7336-2c0bcffe31cmr77989875ad.41.1780303451867;
        Mon, 01 Jun 2026 01:44:11 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd8dbsm101815365ad.21.2026.06.01.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 5/7] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon,  1 Jun 2026 16:43:33 +0800
Message-ID: <20260601084336.2601675-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014412_937951_BF549622 
X-CRM114-Status: GOOD (  10.55  )
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

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode so
the CFI violations in VU/VS could be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_config.c | 4 ++++
 arch/riscv/kvm/vcpu_exit.c   | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..224af9facf1f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_SOFTWARE_CHECK		18
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
 #define EXC_VIRTUAL_INST_FAULT		22
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index b2a1028106d5..dbe4167ac4f1 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -65,6 +65,10 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
+
+	if (riscv_isa_extension_available(isa, ZICFILP) ||
+	    riscv_isa_extension_available(isa, ZICFISS))
+		cfg->hedeleg |= BIT(EXC_SOFTWARE_CHECK);
 }
 
 void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..5ab8e87ed248 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,9 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
