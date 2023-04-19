Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CDDC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pDw/rPTC5RJLTp76vciku2Gjf8yhfCXkuhyDEJB3JU=; b=swRvSPqettBKDW
	XuwpVTJ6LsqObV48AG2n+ZAGYSbwrIuK5rhqQF/rwjqsoQHpqcuipNz67VkcNQS2P645MIjAj0GN1
	ZeHb+DVcNmMf7NJ7/d5nq7SrL8oKjok2HyJkRyJ+rErihA8X6S//0CQBN0VUQf20FOj/sG9Dn3YKt
	TKqZ+jWPljqiRgxzqv1K6f76vF+efCry/7XkI88Jdum4fbeiIcIjG0TJjuqRuruduCnFS7sga/AFE
	ay/xRtWJloPMffeG2JjM+cqugWvzh97qjChTeG/Qrn2WMsf4Aps5MI1tn3OLTZ3o8o63Kqn7gKEEC
	ChnPrfdit9KDyLjfAvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQi-006Wkk-2j;
	Wed, 19 Apr 2023 22:37:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQd-006WXV-3D
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K2nJhanY2RyrdzmZ5jdtnkafHRmAptwnMC5XRsCTn9I=; b=TNbWOSBVqkHVpbvLG3ZtrEaO4o
	QaMa77oL45WzjKichcoz/ywNOr30n9pI+0JyxrWabHHYbjvmW1pYCkviXpDOFEHvcVNL1pDsqUPfn
	REgU0MznW/VcLnC+4KTLFOLkGvqr2SFL8WqSAyAwq8e/BGHC+D+kCcxDshZv9w3UFslcPnw4MJKeA
	QXFx1Et1VwkmQX7k/h2adb1WfOQxoTKSQvmUHoBhJJPvUOPNUzufP7WJJMJeZ1HIP/rOCbaM36dhj
	BdpFGv+sdd6ZJrHJz7JF9Bmr89pqFKN4rlri1ZrIqjMnDq6xy4mahBUCXlaZDGAW3taMgiFw2I9y0
	+rSWCsdw==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG8O-00DeJ0-KH
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63b4dfead1bso376289b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942718; x=1684534718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2nJhanY2RyrdzmZ5jdtnkafHRmAptwnMC5XRsCTn9I=;
        b=JS7pXfcL0uZWhUdoeqJLjU0060h+zlTyFU4Xu6hWHx+bZXgxY7ubdU1X9NVau3JlX9
         +7CYbRRwlIc3Vqq9APC8BsBuJn4DTncbkzqKnldPV32jiP3HmMEO6Gpz0Jpg3E8ecp/b
         7UYaf07kCninwBHQ2YB/t4GOxc2RYZ1XD5frQZDPWtSV2zmt3BBqoNXrrBa8O/2uay1U
         9Q5+GXI2CSH6c4nCaey/IdmivSR/XDL19JFooIN8hV4UeXZUf4HW7Tq4P1XLc0glmzvp
         cJ6OAEWscVYWk70eywtGuEoxadALFsAZYFXB+jt15zlHvhhj3dquE05TC9qY1zNQuLog
         DNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942718; x=1684534718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2nJhanY2RyrdzmZ5jdtnkafHRmAptwnMC5XRsCTn9I=;
        b=jJcZ3XbROcHulEnswWHhPiItPUDq5wVGf0LjXHfTw7QaBANIF3u0NTJPHKC6f2UCiu
         8NDSkB4DioQCeV8mecquF5lCP2iU0z6mLwpaB+wLFftc9XrfpFn6Z4lOJDg7us4660J9
         +XICh3ZWjBXVVEVUuhgK5R8PHedUQeFWw69cMQzz7v02GvUH1liS8c3JI88flRZy5fuS
         ObrR8hmCqHzSK4sm7eGx2Ri10IGWpScVjGZ41te4uUDRLJSfOojq4K5jenvWQlZihgcW
         ciV4IY2hNka9v5iEbL/EO3y/nxvORGQ7Ku0JbySeHV9oWwCVS16joyMpYr/EfxZ/zzU8
         bHZg==
X-Gm-Message-State: AAQBX9dtqesfeesIInZeZVZV8ox7L+vgDiS0cUo/wApGC8PoDFhJOUq6
	/Q+aej1OxsOJ3loQ/5KXJSVuBA==
X-Google-Smtp-Source: AKy350Z7HNgpp/rz6oeri9oovBKao1xAaHX/MXTw46NfVQFmX/yVtIUB1ewCw+YJMzwOiUfVeGRvZQ==
X-Received: by 2002:a17:902:e0d3:b0:1a2:8770:bb17 with SMTP id e19-20020a170902e0d300b001a28770bb17mr5706306pla.9.1681942717994;
        Wed, 19 Apr 2023 15:18:37 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 31/48] RISC-V: KVM: Indicate no support user space emulated IRQCHIP
Date: Wed, 19 Apr 2023 15:16:59 -0700
Message-Id: <20230419221716.3603068-32-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231840_729973_2C4D4F8C 
X-CRM114-Status: GOOD (  11.37  )
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

The KVM_INTERRUPT IOCTL is used for the userspace emulated IRQCHIP.
The TEE use case do not support that yet. Return appropriate error
in case any VMM tries to invoke that operation.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 20d4800..65f87e1 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -716,6 +716,9 @@ long kvm_arch_vcpu_async_ioctl(struct file *filp,
 
 	if (ioctl == KVM_INTERRUPT) {
 		struct kvm_interrupt irq;
+		/* We do not support user space emulated IRQCHIP for TVMs yet */
+		if (is_cove_vcpu(vcpu))
+			return -ENXIO;
 
 		if (copy_from_user(&irq, argp, sizeof(irq)))
 			return -EFAULT;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
