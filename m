Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9729C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/kIHtPc27QiftIRvJoH4DLEqquQRBGS+VPCH/BUyF8=; b=ufAuSSrGiKK4kl
	1/Ajb27G+0M5D6ZbfJF6HLufQ8dRhiulj5HQhhEdwe5awK5qzy1A7ubWGll92mfDwKfq8MTuq3m+N
	2NMnYtpU4HKC2vrYPOqfEgxmFy0JOMUuHTqtAJrwy0kY1ChGfW2etsL6z0wXKNGopyS8XOThLmkeH
	2EDGf3RRXmCeXfM6b8pE5K8HiMcE3Q+b5uFdlxtw/4g9B4Fjg7Un8FaR05huQp/EOA0aJB5NbZXD0
	zCuMDlhtkDdQ5oK8prbkA+O5m1u74ehRIJ/LXW82HldiXwK5DACh8gqfeHxDvQtRisZPcKVfg7z+S
	MKDJ4kGXd74soYyfZp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5cE-006Tzu-CE; Fri, 03 Mar 2023 13:38:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5cB-006Tx4-CB
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:38:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id h8so2649103plf.10
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owG1+TzWR6HEJY+37PeJPSBafU3Oc/UAH6XvLtB/Z/0=;
        b=ALnrkentJ1XuHyMDt3GVTiBFmglXp+J6oGK63Gndd4ta2Iqmd0yyXUHUzA/66j+ChC
         2lmK4PZbb6G/W0q8nI72pwOXxW0Vrf+WQU5IJMtPE8lYZV8RYHGFnogdZVTzWnPbbBWW
         XxkBRyJbtBI1GfpKT/y0ctvBAQDlMVtZgblbX/A0LX1ts/Ahm4hwacWBS2rskn/TqLgY
         xOuLFnWoTtLa0ogk8vo9eBf72slJXcy5BT761CltNiFsbODtBE/YsJoajPMzn4enIQXH
         zB52DGs6nFmaKmIgVLexdnUL+BGSJ6NyqXc5vaJ7w254O/0/OKVXzf0xAY6AiaQ1W4Az
         zvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owG1+TzWR6HEJY+37PeJPSBafU3Oc/UAH6XvLtB/Z/0=;
        b=dlFkfGoh87eTtpp46Y2mN60JXylCWKtLg2uB34CWn4mWPPTLcXtgOj3rlt7C7kZN1u
         O0NZ+8/6f5kb0AhhxekiOfxFC5PvNPNaVrofJm8zEwYynztN+M7YvtPOA0YVXf2k9AEP
         WtS6Ftclqd03ANrF1WZWalOnls6VPellPmcWmSC6WuUxUnL5BU5AVNoEiRggWxFv9kEw
         REt6EolbVIpHZTB1RXWJSPoVGB6fBOTCnC27uzSbz1JhqC5YwNLUFZUtcVdx7o23QFEx
         npAWdXJgdbk9UyFSNvr4gM7lqDoyk5SUzYexeBEryVEZ7OhtCbN5TZFHoHdFZ/N8B3Ji
         cO4Q==
X-Gm-Message-State: AO0yUKWISb3oBl5KVT6EUZxhozelLr55pvEC24qZU0V7+kfOmJeXnx30
	aCKZkQ0DFt7sNIYQdiWREtjWeHcGIgN2BV6F
X-Google-Smtp-Source: AK7set8+s+vonEa4TIjfEZbBRmSw5IumgOEqh4wINo2KaMWe7mIDI15umXRgR+Cfyx6Wj+QLOH3mEw==
X-Received: by 2002:a17:902:db02:b0:19c:edcd:26cf with SMTP id m2-20020a170902db0200b0019cedcd26cfmr1870646plx.61.1677850706583;
        Fri, 03 Mar 2023 05:38:26 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:26 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 19/20] RISC-V: Enable ACPI in defconfig
Date: Fri,  3 Mar 2023 19:06:46 +0530
Message-Id: <20230303133647.845095-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053827_451843_0E413837 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..8822b49ddb59 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ACPI=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
