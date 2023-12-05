Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4730C10F05
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3YqXfNpPqHcYWFTLSZuJzUyEQeuQDAbUimKBnlLjuI=; b=H00ylYUf+Jpipz
	c7Q2Qd/Za+3jt37BHwFV9L/8ojbv1vxvTWc4CoLhgXMIklOnESO6Z8q/sGGx23Gsrh4JKK3vEUGOX
	tFAsFL03rK6A6pW1YbPVLlEJmR78kRqQQJJAxp2db73c1hvAcTJ3bfz1U6eddRfK4161h7bOEoO6d
	bZmR7IRkMbUh4LBzicwpA8UIloHvh/TinL0h11VccCpNuN0SkoC9/6FPQYX4l6P/J7aFAKMNmeYIZ
	GVmMJrURHnxTVBAvo80bsLuZZR5xV7vMXBRZ1R02EjbcuO5i6Ecb95YJgcHWJGQ9rCPcriE9+6hpT
	BecHTbbhEgK7y/bNW5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtN-0086mk-0F;
	Tue, 05 Dec 2023 18:11:33 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtK-0086if-0p
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54d0ae6cf20so1600164a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799886; x=1702404686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0OmI3qPlz0+qT63geWVDLkAyW7X1IhJLuWTK1eJmuY=;
        b=g46Nr+tP/SoiQF72ZuzFffxeN/pEOWbsaCZwn/CubaOycn27FqbcKf05VP3bO+MvuF
         6TicRD4PaTZYDCN0fHTp2W4i60qAZY/ybzrfCw7YM/qkudFqWIsQMoMyRis/2Kz8J130
         SKfgFODgVAlo+wMFE6p6BMqH5yfZYtxhvmanxF2uZ6aKlOdaqpfEXNjB5iOwnsJzN9jE
         rKjDhAY+ZsWgTkDRdvG1cL6t8mbtChb1dqWuO3Fr5MbivHlPJXYy+0jyTw/qyWmBTvuu
         qt4qyheDWnohA47H5fUeIQKq8ehc8p0mt/K4ZJ7xv8BqU+D0QWFAvk1aRbEM/0z+24Jm
         8MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799886; x=1702404686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0OmI3qPlz0+qT63geWVDLkAyW7X1IhJLuWTK1eJmuY=;
        b=D13HYGJiYUpF79uKW+vRtP4JOJ7dB2aCTwG1lJhU1BJgQqAOtyUkeohrmfcHRBNaZa
         NwOYE4S6qXTlEm/o2hdbzI5yTZ6pHKC6aZVoAjhIA7Z0HTuWqF3lm/aGLf55surxnmBY
         fnY6FGU+fOvab0MQU8aW6SiH7DLPdozwbQIOW/oNHc19cqJHb+zAgx7MCFXRQTMDQnZX
         NuEX0a7Q9xJg8rNHuERROKw2/C/jdueo/iVu5YHmAYrdanWLkMQh/9RiKMQk1gvE9eyW
         kVkFY8WYKQrhsfwcHBFcwepxpeL1mju131TfUS/mKT+VjrpiiFjcI9jQcgdUPEIJmUgV
         Fa2g==
X-Gm-Message-State: AOJu0YzJUBIkCR2ii8e1Saw2YkfjO2M9ora6quccR69O/DcsRfysIw5C
	l700p0Q89auk9gQYx8Qcs4or9UJT7PQ5Sx7sNRE=
X-Google-Smtp-Source: AGHT+IE/yuKOo9WSdx/SzvpE3H4wlV+8/v1fI1MTPtBMgFwY2hcTrHqFjyG/lMGWAoD3qGeq3g18HQ==
X-Received: by 2002:a50:c316:0:b0:54c:c6ce:ccbd with SMTP id a22-20020a50c316000000b0054cc6ceccbdmr2279355edb.65.1701799886465;
        Tue, 05 Dec 2023 10:11:26 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s24-20020aa7d798000000b0054c9211021csm1391169edq.69.2023.12.05.10.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:26 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 04/14] RISC-V: paravirt: Add kconfigs
Date: Tue,  5 Dec 2023 19:11:24 +0100
Message-ID: <20231205181119.207204-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101130_309448_4ABDA577 
X-CRM114-Status: UNSURE (   7.95  )
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

Now that we can support steal-time accounting, add the kconfig
knobs allowing it to be enabled.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 29f0f8fcb5c2..caf6f5ea578b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -726,6 +726,25 @@ config COMPAT
 
 	  If you want to execute 32-bit userspace applications, say Y.
 
+config PARAVIRT
+	bool "Enable paravirtualization code"
+	depends on RISCV_SBI
+	help
+	  This changes the kernel so it can modify itself when it is run
+	  under a hypervisor, potentially improving performance significantly
+	  over full virtualization.
+
+config PARAVIRT_TIME_ACCOUNTING
+	bool "Paravirtual steal time accounting"
+	depends on PARAVIRT
+	help
+	  Select this option to enable fine granularity task steal time
+	  accounting. Time spent executing other tasks in parallel with
+	  the current vCPU is discounted from the vCPU power. To account for
+	  that, there can be a small performance impact.
+
+	  If in doubt, say N here.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on MMU && 64BIT && !XIP_KERNEL
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
