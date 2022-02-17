Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D097C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sdbRi1H7le9q4MIbZUHoT2dIX7N4kr51EGYncEnbH4Y=; b=N5Ytzdin/ByftI
	Ov8U647mEbhazjUyP0d0ZyNzRz6rqxaOuCLycoCN2A3gcnRzxoPxmvCS/iScc4zjOzLl9dJfCAv/r
	sTa+sfpfnOnkGPGA49crqG7NQ+9InJxZki0q9/ky8L5La+B1vDYIS7z7euCEvxfiJld7c4C1CRFwU
	OTVyRlJCKpdXJk0O+W2qIPFX7YKThPHZWxWZVO4HuenYCvkVRP6ahBODwVwhYSbuMztO20IE84BEP
	5UBT++83O5V25je6K6HGM5i4RJfiMCFAhFxjnZxpyDyRbRnH+Qv+ck0c9uhbfjRffZPjp4Qpv4tMc
	g2VDB2IGyxHd/80q4cCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKeFd-009xDn-Qz; Thu, 17 Feb 2022 10:43:05 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKeFb-009xCk-0w
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 10:43:04 +0000
Received: by mail-pg1-x529.google.com with SMTP id r76so4628607pgr.10
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 02:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=u9umo66fHF2yd1HtaCsZqcHUsRHdasW6G82nqer3H8I=;
 b=j008ohHuMbYMr0PuHuaHa3Ilms5/+QDhDAgWawYq1c9YekHKnsOLWZbu1VZJ4V/0Fh
 W5R31DfQXR9EtnvBGqy5C3Ek2iJXqPU+JdI42+4wZKZbRDoOn0KWT0mPtadLCAmwyG3f
 SeSp2FonG3OtVbTc5clnlHVl+OZ8ScP4f2OSXy0spDfqpLtXB51nEnyAKPyGPpeehhNo
 LzpI/o6/JB4rWxqnhVAe5NSZqbpfkgExU3d5LOTtmfpMxwg4+yU4yOdW5etarhMIMTbr
 QNyJQAKYlIIZonl1VfAW/yni5nO+YB+w5WsGi8iXyEQt7gzk+vn3+oi6SnIkg1SviMOX
 6dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=u9umo66fHF2yd1HtaCsZqcHUsRHdasW6G82nqer3H8I=;
 b=0QVwd36U9Icyjt9D4FPuQLW/tLPDINCp2com5qqnVuGArch8ngosGbeDiOzg0NCyYa
 elFgTVZcJD3V9Dame5NXJr8I0HuJu+a5oWzFGU0HIaThLJBrQIUKRUXExwTawfrHMA1/
 ni1BxIx04QwelK/w9JQyZUhRqn3GDLAIJmUyG0aXrF572FVG0YcVTgU7iOeuSnMjEqK8
 74uDEVBeT+1RNADs1OfTfnHuCQhpmNoA7xn+wcnkLd6c54KS2uAj45Lg1L7NnouKXzLH
 /1VvtiNYAwsLijKUQZ4cvEMxDDkD615zFgeVNahE2eYw4tCNRCeTzp9xkOGnbQpNcr1b
 dr6w==
X-Gm-Message-State: AOAM532B/n4EdU6j3agVeLsjZ9mrCnF5dpM0ybYrAjzGQMfmeHFyz0RD
 NnyMmYI3VbsgfOMJkFimL2pAUg==
X-Google-Smtp-Source: ABdhPJy0uUyT/q2683xoISBUOf1Wi0kLBPwEdEUyto4HJXX19ssrHvV41pElEaYAsVLIhCbVT7mQtg==
X-Received: by 2002:a63:eb0c:0:b0:373:334d:c32f with SMTP id
 t12-20020a63eb0c000000b00373334dc32fmr1974640pgh.358.1645094581350; 
 Thu, 17 Feb 2022 02:43:01 -0800 (PST)
Received: from localhost.localdomain (36-226-224-9.dynamic-ip.hinet.net.
 [36.226.224.9])
 by smtp.gmail.com with ESMTPSA id z7sm47275355pfe.49.2022.02.17.02.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:43:01 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: anup@brainfault.org,
	atishp@atishpatra.org
Cc: vincent.chen@sifive.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 fu-ching.yang@sifive.com, hsinyi.lee@sifive.com
Subject: [PATCH] riscv: kvm: refine __kvm_riscv_switch_to and
 __kvm_riscv_switch_from function
Date: Thu, 17 Feb 2022 18:42:48 +0800
Message-Id: <20220217104248.30948-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_024303_257571_C8277AEA 
X-CRM114-Status: UNSURE (   8.51  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Kernel uses __kvm_riscv_switch_to() and __kvm_riscv_switch_from() to switch
the context of host kernel and guest kernel. Several CSRs belonging to the
context will be read and written during the context switch. To ensure
atomic read-modify-write control of CSR and ordering of CSR accesses, some
hardware blocks or flushes the pipeline when writing a CSR. In this
circumstance, grouping CSR executions together as much as possible can
reduce the performance impact of the pipeline. Therefore, this commit
reorders the CSR instructions to enhance the context switch performance..

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Suggested-by: Hsinyi Lee <hsinyi.lee@sifive.com>
Suggested-by: Fu-Ching Yang <fu-ching.yang@sifive.com>
---
 arch/riscv/kvm/vcpu_switch.S | 55 ++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 029a28a195c6..75cf21e5ed92 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -40,34 +40,35 @@ ENTRY(__kvm_riscv_switch_to)
 	REG_S	s9, (KVM_ARCH_HOST_S9)(a0)
 	REG_S	s10, (KVM_ARCH_HOST_S10)(a0)
 	REG_S	s11, (KVM_ARCH_HOST_S11)(a0)
+	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
+	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
+	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	la	t4, __kvm_switch_return
+	REG_L	t5, (KVM_ARCH_GUEST_SEPC)(a0)
 
 	/* Save Host and Restore Guest SSTATUS */
-	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
 	csrrw	t0, CSR_SSTATUS, t0
-	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
 
 	/* Save Host and Restore Guest HSTATUS */
-	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
 	csrrw	t1, CSR_HSTATUS, t1
-	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
 
 	/* Save Host and Restore Guest SCOUNTEREN */
-	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
 	csrrw	t2, CSR_SCOUNTEREN, t2
-	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
-
-	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
-	csrrw	t3, CSR_SSCRATCH, a0
-	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
 
 	/* Save Host STVEC and change it to return path */
-	la	t4, __kvm_switch_return
 	csrrw	t4, CSR_STVEC, t4
-	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
+
+	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
+	csrrw	t3, CSR_SSCRATCH, a0
 
 	/* Restore Guest SEPC */
-	REG_L	t0, (KVM_ARCH_GUEST_SEPC)(a0)
-	csrw	CSR_SEPC, t0
+	csrw	CSR_SEPC, t5
+
+	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
+	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
+	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
 
 	/* Restore Guest GPRs (except A0) */
 	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
@@ -144,35 +145,35 @@ __kvm_switch_return:
 	REG_S	t4, (KVM_ARCH_GUEST_T4)(a0)
 	REG_S	t5, (KVM_ARCH_GUEST_T5)(a0)
 	REG_S	t6, (KVM_ARCH_GUEST_T6)(a0)
+	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
+	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
+	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
 
 	/* Save Guest SEPC */
 	csrr	t0, CSR_SEPC
-	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
-
-	/* Restore Host STVEC */
-	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
-	csrw	CSR_STVEC, t1
 
 	/* Save Guest A0 and Restore Host SSCRATCH */
-	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
 	csrrw	t2, CSR_SSCRATCH, t2
-	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
+
+	/* Restore Host STVEC */
+	csrw	CSR_STVEC, t1
 
 	/* Save Guest and Restore Host SCOUNTEREN */
-	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
 	csrrw	t3, CSR_SCOUNTEREN, t3
-	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
 
 	/* Save Guest and Restore Host HSTATUS */
-	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
 	csrrw	t4, CSR_HSTATUS, t4
-	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
 
 	/* Save Guest and Restore Host SSTATUS */
-	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
 	csrrw	t5, CSR_SSTATUS, t5
-	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
 
+	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
+	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
+	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
+	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
 	/* Restore Host GPRs (except A0 and T0-T6) */
 	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
 	REG_L	sp, (KVM_ARCH_HOST_SP)(a0)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
