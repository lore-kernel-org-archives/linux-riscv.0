Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE53C44500
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=om/Rb/KZ2HMm/PcQw4L4hVX8FoxMey0UIpjlP82NAck=; b=AaJnbYmcrxR26s
	cNZLAmbhocBCh0/HeWlABQa8szwl0XTAp90Iu3XbV6mL9lgKVLtc/3SnTAyQ+B+P+6ehjJkWfq861
	hr4v3JRgT/x0iaJfvfuPZ2nhvRpm3yHomF0uH7oTLq3EehUFUfdnBeI1Rbt9BaSvCGuhNh1T2U5n9
	85JGn6m64DkbDTh2twIJswt0PuZVWxu2b5VwRdrJSwsNJeKfybQqML33rkPrqItBmwPXpp7Y3bYTc
	gtoBPlJQcUiNcHYliN+6XOIJnN6CYRZP+xeUu+vSWpls/Tx5qxsm8o+sIzyH6kWP9evFoS6g6VmM8
	BwIwlygJ/7EewIh08OjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNR-00000000UyC-0MtP;
	Wed, 01 Jul 2026 02:08:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNI-00000000Uoe-3CMP
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:30 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c969ad04c1dso26067a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871708; x=1783476508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=mvuIYisp9VURLdyHXiaUIOXFm7qVHZ3TR8z+kZ/LxM0Zfa0u38u2ABdVcmcQLudUfO
         k4tj4oLbypeHigi136fZP5LQ83Ehx2MxvH5xAvJwYYf5ZLCfSyGdZKLA4zguubncTBpv
         O91NweQBSw1vEfQr8mxsSNf52JhPzWT+XZTBcppBwUvBmP4KCcnvrWCxrZrbVr+3EXBf
         tpOXC10mDpLaxl9L9iG5vVPO9VqgCQ1cFUPrMxkS57qeKlzPmeAWqXcxYApmQSm54DTd
         SlCL1npHTqsMP9Y9gtfDdZvc3HYhJuyTZZWO4zfmrvJtGZrLnhN3WKXoPPUcpg8V0Lue
         a+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871708; x=1783476508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=loMa+E2C8GaHY2RMsxeLtNWwBF+XuDrKALE5SDqhThM4wxDL9hBY1gXFOsgDUzWyuY
         cmMersaxDMe4pdpFP1OchNKkau0RP4/p8mvIeM0mpsjeiJEYwAc/UYDnRRrcOTYMn73K
         ubZ8PCw7HGFIWFQ8PeZq5HZN2zoiviS4/r8MCFbDL8Z6ofFhF1U6mobJsNv3PyDK+mF2
         PGs/IxGOJRWRaB07F2niW+bLfCUQrPK6Vq12SyCV2Qe2uCoW7JNfnd3FpeBdqzRc7bb8
         LiPSmo+qCxtc777egZpIbnPpjRd4vunr2GuqWd9HAAEK9WY67AlZxMvgaguQjhTF5h7z
         ZAgA==
X-Gm-Message-State: AOJu0Yw/l+Go6An00Yo8VxJw9vqEfkENw3UelSwTs5MhTSBw1WFvfBwQ
	l7KZk4EyrLdKBijH5e7wDdp3jQ2shAalFyUnj/95sqaixaKgJ8u4+NhB
X-Gm-Gg: AfdE7ckpt/LhZZzIxoWdNNU3J9WHov4Xjom5ripXhkOwI+tojbcWAggP1LyGSremm5V
	VS7soaE9PF15LumVhXc480KX9aMU8D+1AjkcadfDF6aIO2XzLHdh5Y3r+TEI8IEiEjViIYBJ2lK
	rddHh6d9RHPT8GVzVoH/QyGqQ9r5y4Ak5UmKUcUzMpxIxuxQ3zYQWIqJ/6e+BXvSd7xQzcOUiye
	LUsqSPQwJ/FCtWzyEjjy597m6yyKs+8FW1VnIf7HYdF1KogpvuOw4A+7U3oRvJNP9nogqlRVH+n
	lwYW4Oz53ToeXxIZtI52U8MmVf8bMEq2S8d4zNijxn2Fk536yDod44EvtaNE2uMDziL1sH6MDyU
	N3QrlzBhqXzW6mMEUjcIifSEAN/IhOrb4gsTbKneu/H1CwNBu1ZynjJ9T5kWhOhixCDBzZI1KRE
	8985T1HMx0kHk=
X-Received: by 2002:a05:6a00:988:b0:845:e44c:2e5 with SMTP id d2e1a72fcca58-847addb218amr2835089b3a.22.1782871708161;
        Tue, 30 Jun 2026 19:08:28 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm2957918b3a.33.2026.06.30.19.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:27 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Wed,  1 Jul 2026 10:07:42 +0800
Message-ID: <20260701020746.170157-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190828_974085_F5378821 
X-CRM114-Status: UNSURE (   9.67  )
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

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode
when vCPU enable Zicfiss/Zicfilp so the CFI violations in VU/VS could
be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_exit.c   | 4 ++++
 2 files changed, 5 insertions(+)

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
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..12eebeabdf14 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		if (vcpu->arch.cfg.henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+			ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
