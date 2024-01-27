Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4F0C47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/ajpEMWCbG4hm5C41Ref6oV5C05MPrvfaD7vKdCO+0=; b=4vv9vr4YXpRnoT
	w7ZrHuryXB4gwiRTP7JdguFhAM0QwIJjfRi5m4DKStaKnNJSncO4gdSfLKe9kijZ3KUsqWLylM5AJ
	KQb+ut6SiIZ39bvWSUpM7PVcDOToK4X2c7pvgWCPAUr0TyZVnrcdo5w5Dt7dLVH2U8E0/YVbnHthQ
	bqlOtB/17gnQ4qZf74e+fyLWjER8rOCpOi2Rad82fFqGP99PZBg1pVlhkctRiP1LkHR033WclCaJ8
	8yN2WMKSLVIbMuksT8wOfG5/k/ktfAkaoBYaSpn5WLDUN6K2VdsbheHlo3zRt4QH9/hpMQa3YxZhO
	uF9BR/XUsjiNpZDD9p1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOi-00000007kV5-40Qp;
	Sat, 27 Jan 2024 16:19:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOD-00000007k6G-26mz
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:18:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28e79182570so1047110a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372320; x=1706977120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw82vi7M3z/WKRgMHK7xebZMSrAhDNqGfKMx5twouLw=;
        b=awesli834YS+pdbBZ4/+4EZuasbli9xPIuZOnG+phHStyoWdnG+KO7B2DYb01eO6oN
         Yn7djBk5j2RKKkKMTozJpop+A5MPWBvdM7SCbsrQOqBFZht1MJEP/JibirHrurnsb7nT
         hCFqBPFldnEYC5GkT1uTD8Tw+8QNCfbSJaqd6vK9EM2YCJgjd6OCPVNrKY6m/RCmxyYr
         3mssclIIZRD6dFplD1t5y//fIlORcfeFqWgdFIhYkEnTISq+mpSCbZ/kWPOSfHQO9Zml
         m1vuqSMw20R967YyVRIURAHrSvUyOvUTqiNfhtsz/pjSvBoxhfjLjNfvnMC5rJpjSBA6
         EXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372320; x=1706977120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw82vi7M3z/WKRgMHK7xebZMSrAhDNqGfKMx5twouLw=;
        b=WzEAsgrBEych8VkMTZPLVdBvghCOabEEHkrX+efUywJCnnVkJvEK0St3iGU4BcJtug
         A9sN1NlDqxMuGmRBSqWw6Tdr6u+u75Mypvi/WY/C/UHKwhNe8h2/51deDvr5uyN5vGnq
         csOZQQPFt80AmJ3d4oTiiG3elzJGFLp0bJkLgqX+AC1sGwROpnqwsS2qJcSurWu/Cbfe
         W3+Jfs7nhPqFzmAhjRchxWnQrOR3rc1fwUZ4q7BQSK0i3ogD8LOYS/ifpmdcJTP/tmgi
         By73FkpYSnY3nQwQSraXCU62dDRTyhCgAnLEAvFlrye2QC7ywTvTaSBlPdUw7SCQ9pdq
         F9Vw==
X-Gm-Message-State: AOJu0YzQ+tdfM3Y//YVM4lJHaubhP8XmPBr2pPZoxBNyFHP5uXnMLRi7
	O3ooV9pJhl9jJcZh11GvE3ARx3hESH/xPqUYCkOrhABChhI8lk6ZLaYkLcPHwSY=
X-Google-Smtp-Source: AGHT+IHJKOJDmtp2sr+zp+g3pTHNyJxSDz7IMo9av7dUmiD97kA3wWLzGZjAWdoUrJjJ38/Q4J8vEw==
X-Received: by 2002:a17:90a:d150:b0:290:b20e:125 with SMTP id t16-20020a17090ad15000b00290b20e0125mr1272094pjw.92.1706372320110;
        Sat, 27 Jan 2024 08:18:40 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:18:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 04/25] genirq/irqdomain: Add DOMAIN_BUS_DEVICE_IMS
Date: Sat, 27 Jan 2024 21:47:32 +0530
Message-Id: <20240127161753.114685-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081841_604699_5E43A6AD 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Add a new domain bus token to prepare for device MSI which aims to replace
the existing platform MSI maze.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irqdomain_defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index c29921fd8cd1..4c69151cb9d2 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -26,6 +26,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_DMAR,
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_PCI_DEVICE_IMS,
+	DOMAIN_BUS_DEVICE_IMS,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
