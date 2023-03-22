Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1721FC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 19:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0edWujnyKX61MSEV1iErn3CL1tfzMFVmcpl6ng9lu8c=; b=AtIbc5Tb5tgE+L
	+9jaK/4A4cOAjRjcb59TG85r+opC438wGhVLAN1KhhbcjfMZjxWmY7wHdkrdGmuVuh2kCxtYtipp5
	ukW62MQwnlfT9w3vgXTGXeThZKvGjbrWUtBnONh+f2E/AO1TN/zJA84idoa/4w3lyoPQ/khqIHBZE
	p6Vz1/5uTB3gKqRMc4qqjCqhQ1ft3UJwLRJX00R8F5DMFIj/UTkzNN/aGVBwAj4vSOsnEHLb25ALg
	3/13LCfyXK8heF0d7DHYwPoQQ71NQMQ6Xwt4P1D8/AVhrFThM9w5ncLjNOVPI1/o/DGqR56/HBpmw
	T9tdJwmLd9V2rGy/lOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf48v-00HBkW-1q;
	Wed, 22 Mar 2023 19:29:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf48s-00HBie-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 19:29:04 +0000
Received: by mail-ed1-x532.google.com with SMTP id x3so77308900edb.10
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679513341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hopP1R0AXiFZm6agfXnPbGpShat6oMC4L3WeWAPgxCc=;
        b=JNteigioI4fDBeH1TeXhVfPygNOe3KlJLrSj+M94c592fPGpRbo4hYrHFijZE3FLNH
         AJX7NjPvNNxr9vQCjl+7d9TJFT8t1D2L4Xj5+YsbCr/5GOj3NYOesWn+uYM1iaz3jDm/
         eHNBr2kcOTzP3UHM65YwIqyeif3mSDXq2nGvpZ+gB2oykDGFLDFixAqsxTUoINo2O65u
         cnK1ZL6H+7cD0/Huzq82U9fCTDFxERnzvzhUaZklckHaOP5MvwVpoey6WNsLHwryfETT
         JgS3sCW7DlXKMhQf7oDeAsgeHvXcYc9LyyCgim42FOfze65JqM+ER7zEn+KjWdU3uLBe
         Rg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hopP1R0AXiFZm6agfXnPbGpShat6oMC4L3WeWAPgxCc=;
        b=4DDg5QonrJI+4gU0/7gll4w0dYOslbVOVRabOA5xGj8WK4wuB+v/5et0hxoHvkxOZG
         00jSJx7e81cLXhGFcPxhzUGZw2yZomkj40uPOVHUH0vmDsjaHT0S/U2YmCX4SMJRcpYD
         xAjsLyYEZOIH3o+j/xcUSatswCGnnJZ9tJ1LJYwD+WUDbVzfiVu3ZPzbx6diylyIkGLf
         LYu3MCW3vpVaArH4gzMFJN1vnf30WMw/XGP/OPTicxWLMffLLDmHPuPJt8GZjEf1OtCR
         OIC2duh3Yi7y6yzTUPhZPGu8TYQIisz1IeJ6MoRas02/Hb6uE6eTxGzgyRmYkvHFEKtS
         wJMQ==
X-Gm-Message-State: AO0yUKVWhxF1zP3hAFawQu3ryQFpcqXQrDm0iY0FjGH7Fwg+T4svUKd3
	Q13wsGTSQ5I2/7wbpAEkzq6KsL5CK1hniIPgJaw=
X-Google-Smtp-Source: AK7set8/OJM7J6aBWHP9V23+w2NzIxWQtKLQibzxqbwFzv7vyaJhdQZQXXjN/EFDVM8aLfa3Y2aD3w==
X-Received: by 2002:a17:907:d48e:b0:879:bff:55c with SMTP id vj14-20020a170907d48e00b008790bff055cmr10260656ejc.1.1679513341309;
        Wed, 22 Mar 2023 12:29:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x23-20020a50d617000000b004fa268da13esm8345283edi.56.2023.03.22.12.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:29:00 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 1/2] RISC-V: KVM: Alphabetize selects
Date: Wed, 22 Mar 2023 20:28:57 +0100
Message-Id: <20230322192858.1189272-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322192858.1189272-1-ajones@ventanamicro.com>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_122902_828036_F1CEE3E6 
X-CRM114-Status: UNSURE (   8.99  )
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

While alphabetized lists tend to become unalphabetized almost
as quickly as they get fixed up, it is preferred to keep select
lists in Kconfigs in order. Let's fix KVM's up.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index d5a658a047a7..5bcb2d519b95 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -20,14 +20,14 @@ if VIRTUALIZATION
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
+	select HAVE_KVM_EVENTFD
+	select HAVE_KVM_VCPU_ASYNC_IOCTL
+	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
-	select MMU_NOTIFIER
-	select PREEMPT_NOTIFIERS
 	select KVM_MMIO
-	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_XFER_TO_GUEST_WORK
-	select HAVE_KVM_VCPU_ASYNC_IOCTL
-	select HAVE_KVM_EVENTFD
+	select MMU_NOTIFIER
+	select PREEMPT_NOTIFIERS
 	select SRCU
 	help
 	  Support hosting virtualized guest machines.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
