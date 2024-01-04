Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DCAC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6UugQGkRELBb3DilGH79DDQB1y/PmCng3m7Jsi1Sobg=; b=2bbXLZe4BAAB/d
	bMH+ZRx6fyrCaev8Djj1HqlsTnJq7OKWkRfIsFW7o+GogR8fGQjjfQE/6G42aVa3wiIUNg5xVao60
	OSRmfPw1mqyXUq8lDHYauet7kthpwZ/GskuB6Qn6hUaegC4rJMTdLwep5gMItU27x6WWpGK0Boa1G
	PWtzlzDLqUNwkoCY0mymugs/BMmCnlG4UmhPGKDGJtfcIszldfVjZ07ahA7nRjCZPXx3Z0jOeyIEW
	Ohyir5nu3cgukSqLNl1gUsEu0eOg1wqvnjJUS2TWRAfON+3H2RPFHOt159zOMHDHp/kM4JSf1rqT4
	wWgxOzk1J/O/du2TJUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMyg-00DzNq-1M;
	Thu, 04 Jan 2024 12:37:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMyd-00DzKR-0b
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:37:36 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a2888d65f1fso54905966b.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704371848; x=1704976648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0YjTQ6DAdt/2c3mL0l6eIgN8OTkE75G1dsO8pPOomQ=;
        b=XZLNM2D+ZN10KUrM1JgAfYK1x4Rd39Igjuwnxq9elxxR6nTxBNw/LGBlHR2NLF/kAh
         2BPUo7L6zUsiwCzIsjXK5v8yf0L1Uih8HbuDuyxHdPCixldT9tasz1GpYB+eRtjnPpEl
         wD1cm1qljnCszx5Tw6TcXnoVtu8+VEIoQwX1135p49J0nc8cZXEKzbgcs5poX7MUeS5C
         G6xh+uHV10p166lmn4BFEYeEUBGJhKB5ma2GFKBx1PLCmjmjIO3jFGAnLnFjsvfY+n7A
         qpKFRqVeEL++zMxZ2cQyd+7nuYW4WsDuEjosAQkFmAo94SzKmgGrS3jdRSCmNCP8W45r
         +4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371848; x=1704976648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0YjTQ6DAdt/2c3mL0l6eIgN8OTkE75G1dsO8pPOomQ=;
        b=XGx4Y/JtPF3mKLo97xIVli7HznK53SAZ/BDGCpX0qtWVfjpKFilU+2nqKhT7qgt6rK
         f8+TVxfFwGdmYZoy7QClBnWKHXkl3sXkeAIQBycLEiddUS4RqEHqRNj+wOf7JQVvFR5l
         /k+o9uS8ASfTP/sZENUiHoIQTeWy1lCHsJvr/OEG4QEiCcdtLHToLBoIIyHdrT3zBDn1
         OR1/pePFdc/+FXydYNOTUUYE4TVWhk747ZOsn1crvWsWJ7Z8ZOsVkoMK1CudiYw1mvOm
         EYLPgrBwFwWRXj6bBLLMH++ULD61bw6UANE0S4MAesYCpB4w2rIPmsTE8WYKDFBeHNfc
         TPmg==
X-Gm-Message-State: AOJu0YwYsGVdtPmJn9Onz5xmhd5ej/wHCGOUYmFoBnUjIu5mOJHyGlcM
	29w2jx8myiw0RSI7Mtv0lH7UIf9SQB1s0bqlXnDzxdFugow=
X-Google-Smtp-Source: AGHT+IGuKrfQ1OvlUk+ZEceVcHij9CYGgADtdAxpjxUb2xwkyYhUHJZIQ7mR+ZBuQE0/8F7kowQcIw==
X-Received: by 2002:a17:906:fa90:b0:a26:b71e:f75 with SMTP id lt16-20020a170906fa9000b00a26b71e0f75mr299486ejb.5.1704371848691;
        Thu, 04 Jan 2024 04:37:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gh33-20020a1709073c2100b00a26b3f29f3dsm12649478ejc.43.2024.01.04.04.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:37:28 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	atishp@atishpatra.org,
	rdunlap@infradead.org,
	sfr@canb.auug.org.au,
	alex@ghiti.fr,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	pbonzini@redhat.com
Subject: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
Date: Thu,  4 Jan 2024 13:37:28 +0100
Message-ID: <20240104123727.76987-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_043735_223517_547871FE 
X-CRM114-Status: UNSURE (   9.72  )
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

KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
supporting architectures select HAVE_KVM and then their KVM
Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
consistent with that approach which fixes configs which have KVM
but not EVENTFD, as was discovered with a randconfig test.

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

v2:
 - Added Fixes tag and -fixes prefix [Alexandre/Anup]

 arch/riscv/Kconfig     | 1 +
 arch/riscv/kvm/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a935a5f736b9..daba06a3b76f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -128,6 +128,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_KVM
 	# https://github.com/ClangBuiltLinux/linux/issues/1881
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 1fd76aee3b71..36fa8ec9e5ba 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -19,7 +19,7 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
-	depends on RISCV_SBI && MMU
+	depends on HAVE_KVM && RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
