Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B25DC4829B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 03:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfaxAAJGXeyrxhRuY8WrE+jpKV4nRUejr4iq/gtMzJU=; b=3oYRhbSNstTNjz
	PI31dk9pdxIWl5kxBSOQv55dHJyeT9qux7vGiulrvcra5YyHss7HhnMF6y4WSURuBFP1Q80GmqJEB
	T11uuGgoQioWD1RM668XQ2tBDL9Ed5AmQhnoefV76LRqebAQbMy8ke4OLMng4MIz5sxzXk7Hkbz6F
	74vxkR80+VwdQuUs6nj7r0ufX23qH+OHjSo/li1Jv7C/DYb1PUQd4SiZig3+IiDA1qHKJEigPjMHI
	WlXmpvr68+wh7NzhB5aS0Ath6sffS5UCOzbB3dwytxBW6/pO7UMjBCa88uOYOriZ+7sydU06cVi6U
	DdnreqOgup8Z2q/gXgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvLD-0000000CZXs-0gZR;
	Thu, 08 Feb 2024 03:44:47 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvLA-0000000CZWj-1pLI
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 03:44:45 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-206689895bfso943579fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 19:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707363882; x=1707968682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHHbaCQ0poyIlU4NNDp8/EJ+oDcSBjCEciZfSlQAroE=;
        b=gejmA2ZORAd6lS6VHdAvaPmaPOJHPIh0lCF9iQNDwnA2baWlQIic8RhTNERwcxlP90
         KHi59hv/kE7PyHvOp/DegINGfqyNtAQEAUqUi6waGEVL47vtmH6UzGzIuX0qpNiWV47I
         dJe0J12rnookHekwopsgGuUoMTtqNTFg8fsSBRAExlr3zc5pOp7QxP2gloLgdIxDfC18
         HOSDIIpiVWWQa0Ga5UG31cv4NEBYv4b7Cqd6HA16PRS6sP9GC1DJOcLHtF3YnEYdx+US
         cBawK2dE2Cq3uu9t5AqcZqKKCiA84vqjdqwohNP5fzhDdNkZszuSof9xlyeYs2gRuNW6
         ooGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707363882; x=1707968682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHHbaCQ0poyIlU4NNDp8/EJ+oDcSBjCEciZfSlQAroE=;
        b=hsnzyxYuUBLFQZtKDVBPV4vepKGO9bZ4ieA4WA1zzMxL/xynAKl6rFh19zC9D50B5f
         Pjkkn9jDc6BKR5WJu0X5WK81/DGn34osGhLhqyKcltCxN4ad/GLSxFQTNNcI5Tb3kke8
         RXMcoGMh5ZaDfymNBfBzuL+9o+g5pg/8gpYWhYBb0ZhSdwHMywteDRTCfkhZZnSE8zks
         VnRw+i1HIN9SyBAS9ck/OaOPR1EWAEnrDWDLaDjeXqhhh6OXZ4d0kxHFfuwDWd5ZVEm7
         GKXyMCRPOr34CHwZDFcUpFWgWFPXdc4hX/PxCPoMaCCK6gNtKx87FkHHRBcPbP7PaiOm
         1JdA==
X-Gm-Message-State: AOJu0Yx1e6ZJ78yPOf6NDpg+3uQHEXvYWwZx/vf+Y+h85oI263jzqWI4
	cQtwAkUl5KsLpoFe34NHUkLwjwNhoKhHqcyGhz/VuEjJua1sRXqBmpDnnv7ZDzNGSXnSsRF1iYF
	80Yk=
X-Google-Smtp-Source: AGHT+IF8S/sWdD2/t/IehosLthOGcp9RQPnzkTr2qd4mbuxfbLO4HkNLnW4usy2ZbfgHlv8pV/ejiA==
X-Received: by 2002:a05:6870:5aa6:b0:219:efcf:4566 with SMTP id dt38-20020a0568705aa600b00219efcf4566mr608603oab.13.1707363882197;
        Wed, 07 Feb 2024 19:44:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVh/Tfazr2HX3H9HLVSgqn2h5sWZF5zZ5Zu3TylAEJBkg6WlJX4/E7mdRNyYeqRzmewuTn9VXmXv1FtoOtXhtlcOre2zou7FFXQUDmY6pI/9p/FsbwVr0+8GGlVgHQ9AYdz6tBzr5/i8hIFf+7EspTg8jBmrbfhdhTP3qiwyFvjpwO2in0n4qTOitGh8nK7brPcNu/Kvh21nlOV/qTSz2Rnp1Gbk49vPosP7AWKXM6PoV/qytusk6FagZIAGKefqaqZynnwmgekry/tFV+XDLPJWXhLi4W2ycmDpIRCad/Huk1Yjxqhm2F7DjWvdLC3aIgaUNaY9EbYeOBLtVswBA3q71Sj1eHrmp9KORNCA/U8M8UAnDOI4Yp334RzlA1isNR7FePtaKlAYAN/Vo8T3HErx+2vd6HLGUiyszV6wXoj9Hcm2pveNgVjS2wxW6nYATvDx94n
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id g10-20020a056830160a00b006ddbfc37c87sm443595otr.49.2024.02.07.19.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:44:41 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 -next 3/3] RISC-V: defconfig: Enable CONFIG_ACPI_CPPC_CPUFREQ
Date: Thu,  8 Feb 2024 09:14:14 +0530
Message-Id: <20240208034414.22579-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208034414.22579-1-sunilvl@ventanamicro.com>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_194444_496281_67C1F37F 
X-CRM114-Status: UNSURE (   6.78  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CONFIG_ACPI_CPPC_CPUFREQ is required to enable CPPC for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index eaf34e871e30..2988ecd3eb4d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -44,6 +44,7 @@ CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
 CONFIG_CPUFREQ_DT=y
+CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
