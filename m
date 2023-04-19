Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBEBC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzlDH8iatSo/Nr29307pXaB0udldXwmtC1hXY7W/V1o=; b=Qfpp+FpYwkP1r8
	0XN96n+FwGBCXmKs5EOI7rBSyh5Q0wxrLrHgG2gWDh9nWCj47JN9oiBgXyq2yfvpZ4eSpiOmrvjiM
	MiSLStF9vsIsbi/lnVDhpbIv0ZGZbvT0/EJGX/4wV7UoYsP+Zy3C9HLid/kKnyfJj8kiXNCqAElzL
	NkeelhymIQW9fDHgifYdiFEUcEtshM74VXQzRV6p6z9khRaXN823vPJrPYl0OpJ4vRiw4oOOMHPrh
	YsIvJro4uxd8UUYsJjvayPWe3ohAw1/cshGEmS0VKXXkL92Xy3A0mVDr/hxLBUq8nr3wR56JDeU7Y
	dtkrZGy3qKl96BwIDNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6il-005JCD-0f;
	Wed, 19 Apr 2023 12:15:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hj-0058Cs-1F
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a667067275so25321475ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902626; x=1684494626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F7zU+i+fgt15KwVVGwxKhOm7NGAJEpboJ7iHtKcEtA=;
        b=aV4uFLLXRbU0iBRIE297Q6EuQGVnLdUjGgZomWyhtilxlo1Xq5JPOtPmXFKRcqinT0
         ofpucAcyCK12hWD3OSGm2ZBa8cCd7SRz725V46cfkz9Mc3how+qc46mk/Pv1Iir4XwH3
         I+W9X2ydKb5X5SejIFVpYeCGYnMLe84eo3oyFXWBojouGseR4qBtPkM36th81qqCXb6S
         xugkArjRhlFMZwiJYvBNhF+f6h98sog5nw474YuDtsxZCN2cq0gloi3bUk3KqowxoeZk
         zrdDTH+1ANXXhbvzhlyXrcyTllVHQhr4OuyPAT2dipwlDOYDrEYiFYl4VgX1JrWJnY+3
         NgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902626; x=1684494626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1F7zU+i+fgt15KwVVGwxKhOm7NGAJEpboJ7iHtKcEtA=;
        b=gZrIZ0B3jI+xtYttAcquw2JjiOkICHTrqvs/856BGjcwWm+JKG/89bI+53UAjVuXhx
         Y+DVsBvrqi+9z70T5QQozfRMVJsKQ5JzKQlJhcE2fZKiyyWtAbM+1ZI6fhfucrl88KF+
         AHf4K9GT5TLIsZwrKumiN4lODKIDJMDPbe67AmRcp9JRsBfI0V9TlNMlNpmJIFoETFOw
         k0qBBTvhBznjl9er3L6Qm2xJn24mVKfgX1KPg88IRomSQe1EEfvF7toqNiBbvWj/vCo5
         E0euFa+4pU5yGW1045MKlM4HilrY+dOw1Uk2bl0KeFWFQGWmfDC09WIfB7eT4uCfTl5o
         dHGA==
X-Gm-Message-State: AAQBX9cGyZ23I+BnUzSC7aHB8opoawYbH4Kv7G44Llf1QL60S0mVX5SC
	mEKciHqxJDcnXLYavWEmFyE9Eg0O/5e1reHgyhE=
X-Google-Smtp-Source: AKy350aB3waRCVBrNPWUpTvTFh7Oe7hWlqGLAXwcnE0SSE6o5sCO8frWgwt3jy/dLmWZ5MGyUsHLZQ==
X-Received: by 2002:a17:903:230b:b0:1a6:a6e7:8846 with SMTP id d11-20020a170903230b00b001a6a6e78846mr6108159plh.40.1681902626375;
        Wed, 19 Apr 2023 04:10:26 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:25 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 11/21] RISC-V: QoS: add to build when CONFIG_RISCV_ISA_SSQOSID set
Date: Wed, 19 Apr 2023 04:11:01 -0700
Message-Id: <20230419111111.477118-12-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041027_452612_B7664B07 
X-CRM114-Status: GOOD (  12.55  )
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

Add the sqoscfg CSR handling and the resctrl interface to the build when
CONFIG_RISCV_ISA_SSQOSID is set.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/kernel/Makefile     | 2 ++
 arch/riscv/kernel/qos/Makefile | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 arch/riscv/kernel/qos/Makefile

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..57d57e430fb9 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -89,3 +89,5 @@ obj-$(CONFIG_EFI)		+= efi.o
 obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
+
+obj-$(CONFIG_RISCV_ISA_SSQOSID)  += qos/
diff --git a/arch/riscv/kernel/qos/Makefile b/arch/riscv/kernel/qos/Makefile
new file mode 100644
index 000000000000..9ed0c13a854d
--- /dev/null
+++ b/arch/riscv/kernel/qos/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RISCV_ISA_SSQOSID) += qos.o qos_resctrl.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
