Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BC1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jau8AF1MAKSw6A1bnmczg47HsXvJr1gr35AnyObmCi4=; b=sZwK+vWjYM/Cc0
	ISNnBrpa2nW14q8PjnOHskAh3FIdgHi/u8lpAxnSyaCASgKvQnG35OAQxopSqV/KHfT+Vcjt3RM2v
	SH9awzSw8KHQNnE7xnDurqAQXkHLHLun3Z8/o9EDrHSrajJ3G2j1lserMfye82flSUdCCo6DlmcH2
	+w8ldEj5wvxNt5DrSD755ZEFJWlJOZe8do50UaCfnjjkFpl9qRjCKK33Xt50edxlqxVdu2tRq/XAd
	4QOowCWhREOUQJsNBMHuWmsAExuafcfTjnSud1M+6x10QIp/7OxuveDjO/cnL9MBI/evW+YjIX2vZ
	BeNR69HvFHrYHWHEa1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLtQ-00CzT5-Ps; Fri, 11 Nov 2022 04:43:52 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLtA-00CzJ0-3d
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:43:37 +0000
Received: by mail-oi1-x22f.google.com with SMTP id q186so3949926oia.9
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8gSH7BcMR9LDTkxT6jjny0t/ryCD1BHxDOjt6nko30=;
        b=B1fbdqeqOnEjmS7EmE5s2SyFAwtXh283Wobtd82xebmBEWTDII8pDruptfCG9by4OD
         tNfL2DrTyXPnKHmsB763KykEg8WFc13JoOJ99qSRMvTI/SUc1XTyl6QhdLMPhqhKkvE5
         gTFCRfzXoNxfFxLrAWweTeGdOQLiAabsl5NO7h6Yhz3XPdsee/yelTN7Q+4ICO4Vg9ik
         AIhmtczOtaLdysRIlotaElBiWXA0Eib637rPNIrhLDpdE12CXtVrVXn8rH8/O0AwNz7T
         tUj445tiDa8xIhQxoKqH9ywcZ/UhWMyU1KvXtpxgJYILzpcfRli//p2HkzoLFE4K0ZIc
         R+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8gSH7BcMR9LDTkxT6jjny0t/ryCD1BHxDOjt6nko30=;
        b=ryw2YC9Cjf2fhZK5Ufs90aNzaxsNj3gm+Az+i3oM2lxJyTU8Bj/kvo/NsLlGn/UUE7
         bD33JOHv30fZCspY0GDBbUEDzNiTQw67LDiMdxTuOTRkyzuA4VfaeSvfVUH3uyN2UnK3
         mHLLqw7L3PKZVxtgOchbX4LHh0BtJRZBvZDtjT84662MxNtg6JdaaPWXrZ4vWedWPJiM
         nwNRzrpHlkrYyYGYr7TiGyIM2eB/fNaYHWK+eABJufFKcpvxu04m5kO83mOpRSZN0C0J
         15YepMwdTs7QsUSy+XJ0b+E9qRONPKulbN2EJFwia+muKFOt1qJC0IgH//ksxL98OYjS
         MAlg==
X-Gm-Message-State: ACrzQf3izj3nYGtKpeEPcdBrZbVPsntBzrpKzx/docNO9CYdJRKchHTi
	iyRbQA4AjSSZz4qKSVj3TZgmUQ==
X-Google-Smtp-Source: AMsMyM47O4BVwT9ukeNOv94QQ2Gb+D+i7LnaMxMt3+onc4DfQh3ou/4WMkYMAO5SzNBICgMNslOAhA==
X-Received: by 2002:aca:44d7:0:b0:35a:6dc0:2132 with SMTP id r206-20020aca44d7000000b0035a6dc02132mr2479193oia.266.1668141813088;
        Thu, 10 Nov 2022 20:43:33 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:43:32 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 9/9] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Fri, 11 Nov 2022 10:12:07 +0530
Message-Id: <20221111044207.1478350-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111044207.1478350-1-apatel@ventanamicro.com>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204336_181945_F7899614 
X-CRM114-Status: UNSURE (   8.42  )
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

Add myself as maintainer for RISC-V AIA drivers including the
RISC-V INTC driver which supports both AIA and non-AIA platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 046ff06ff97f..8b998144a1bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17713,6 +17713,18 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V AIA DRIVERS
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
+F:	drivers/irqchip/irq-riscv-aplic.c
+F:	drivers/irqchip/irq-riscv-imsic.c
+F:	drivers/irqchip/irq-riscv-intc.c
+F:	include/linux/irqchip/riscv-aplic.h
+F:	include/linux/irqchip/riscv-imsic.h
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
