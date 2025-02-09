Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F79C02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwZwE69TzK4bUS7MybKdSB8OOhDDaawc7lCtPJSxgyg=; b=gUeWzXoFN8ZcLX
	oxIojT6P3hF/peZRy725TItVV2tNo1lO1nN1KPhMfDNTIcynH7WwT4OwSTYzaNg8wpPR1aulkW8JQ
	L2+BsoIIeetqxlIbw8mQgIuREO3pr2wOFyVWyQArmHURcSuP4LftOLlkArQDjsoYJCYX7cYr7XoM8
	vRHwLZvH9sRGhRRLEf6HctAxaLO1adVirgfJP3SFgZM5RwkJfy9K/aYMntltgL23/GzvVORTyIdrF
	+2gC32efzZ28l44SO4uqcTePVUAPxMKz8gj8toC3KU1667c2fuZWt1TOpMblZT3zdPxl1vWKs9heg
	ibrJw5dsLUfOPCWLIKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyt9-0000000E3tj-2FWd;
	Sun, 09 Feb 2025 04:25:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgylh-0000000E2Ur-1z55
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:06 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fa1d9fb990so4654470a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074685; x=1739679485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=RyVhxtOk9yFTVa5fhH9FEoDTMNvWQ9pmZ45w9pGR8Pfa93CErKyNVQLdBwA2445bj7
         yAQ2kpr1hkVcMVRkHsn6+cGHFNX9ShC0KaxSH8U/tGv2HqZdtfIZwEaNB8zYXHaH3Gm2
         4hrhu5fIJN4/9aMLvCImleMkqs0bxjC5lPBucJjkdXki8lvw7kUKbpMsnFxDQauGVGDk
         EDGNhdqQWUSxqrXcvJdV7rC8Uum5aLEXP3QO/OT8hrsGoTFc9mHbvQ0BxIno5OqbnsqJ
         ryrKnjtoM47kQOjoX09qvXVTTOJJ11ONOovpC+x8PnPhx9/3wZt+2g6LI/7jwStLB9tF
         8Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074685; x=1739679485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=qeIcV4FHHksSCcQk88q2zJZki8qKb4EWB+J3UZ6QGXBlxaYxvQ76dit1mqlsnJDk6T
         KXPZVLVV2OlRdSSKLj53XicUWSeP5fQgFiJTboNqKogumcTU9mDciv9Lao1XLrvkHgFu
         6zsw3U2WBU0QFRoj2Hm1pE3eJqp9iiEDK9+JfmrARhwVNc/1uVZ/ZAthhOVJtXJ0apJ4
         jbT+NfO8g3e0mmDbU+6gGLSIO+8TTzAlt4hxXI6JjgVZQBz4nVoNxSkFkJkMGi4IZpNF
         UGxxiD7bEKuttrrL8VCu+htatu2328e023Em4m+nPR/gMyo8X/yHU1lFc6Hl47RH8Deb
         f8kA==
X-Forwarded-Encrypted: i=1; AJvYcCX7fB9NghnBe2dbHzEdyChSOyVv7XzzNcEE8Qv7vZ/av5sHzjKwmRW0ofJT7+mDqJTiN75mCQYNbG4/1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCR8LVJkoIdN86OulREW7V6Vxk/XT2X1dl+JT6FLWrRxbfDmrg
	9h2qND57yja6/l5VHR8DNL+8Q7FdDr9kYAnPldAHhTuQLHvJTxBPgxfK8VI2ffI=
X-Gm-Gg: ASbGncvUG4tu3g6ApxUI7X8nqsntz0rtvHroqCW11L9sm26DwNizJwHFpcwpLocq8Xy
	sFhZctavY33qxmd79a9JFu468WhvDJaOs6u4+o1wU01eVMOYLBPwVXwj3eoZK0sg9PR1Gmk9+rA
	Vt+6TL1fxob0iWExlEarTVutm6g/OOXGuQSh7DFQA5KSFL047dCjgLSsfr0ziA9mMOHMRzaZG71
	V/MR69Lo2UgzdDTapv/k8WhWrq1Bzr2PJeAq3py4IXot7egvTwhcR4wzj6maT8tA1Uwd4aLvjqr
	Sq3G97Jd794SvMnojl8tSmk9psWMEzhwSuE21txADORy768v5EeBhRs=
X-Google-Smtp-Source: AGHT+IHplK1Odn1krUBJui9aJ3bXui5w4fG7ychKlkG3JoJ8qZ1jCX3WfSDt+grELpA1vaZRwG2+1g==
X-Received: by 2002:a05:6a00:178c:b0:730:8a5b:6e61 with SMTP id d2e1a72fcca58-7308a5b7c17mr217952b3a.2.1739074684846;
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Sun,  9 Feb 2025 09:46:50 +0530
Message-ID: <20250209041655.331470-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201805_678573_AB81F711 
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option is no used anywhere
hence remove it.

Fixes: f94a18249b7f ("genirq: Remove IRQ_MOVE_PCNTXT and related code")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 5432418c0fea..875f25ed6f71 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,10 +31,6 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
-# Deduce delayed migration from top-level interrupt chip flags
-config GENERIC_PENDING_IRQ_CHIPFLAGS
-	bool
-
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
