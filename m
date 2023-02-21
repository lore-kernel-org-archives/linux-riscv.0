Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B39C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 18:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJ7iV/GHrieWmdY7/kfQfR+C+uCF6DmJNPiBoJFQOQk=; b=a/weP5+RKYTedQ
	iabrz0DUGGb0uFC0w2zn7XoOs8ZzX/+4sjflNfruZh3ZPZY6xB1uVNrbWP7Z6W0EbjEvzMRmj3IdE
	+Urm010h0sYTrRxn7MQ3xEwKmtRu8/a4rzWxBW6x2MmYKTPTID1U2ATBqbh9zPFx/1Fj8UDN3/fs7
	uG1fJdbxxwHRxZ5ng6yLfQH++VPDJOtG9NTPlni5ZvsyWWcd0olnXTyNHoOjudcIvmKMYpVpVT778
	8vD2OJ9ighnMW6PfKqZ6ornbPzqQhd6lUCemXcwQqAmM3c8yz8zAqzRTZnV6706aHgSF39ZWxtQmm
	pFGSrGPZBcIIph2j5x1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoJ-009RmC-PL; Tue, 21 Feb 2023 18:56:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXo7-009Rgq-Pp
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 18:56:09 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g1so20994819edz.7
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 10:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OFhUgBSjOMKHmZF4NaBr44T2PoRo28FKxJzPDZ30T8=;
        b=Z6Nx6DLpYiRnv2AoV/6jaIpO1kPXoe8w2fe4okgDPHfMux4drXYN8navZG1nHLegdW
         XXyRUNJ7PADBsV+WE+arWzvHiCJrp9ZFdTTtA4NBVmM1+/v/WGh33dZ1eUy+GmDlqyWV
         uRsaWpBnvMJLP9kiqWD857BgfvgN4kNjnAGVATU8kj0RyLx1kA9hC0Fsu2Y9pIlFCCo0
         qOI7AXMOknR9TGPc6Sem9WBew65zoamIap7xUiP5wnNQt6wduRJeXR6F2a8tYoJ2ApKS
         uQxqmOhg+aqA0oNwFdsT49vviYlirhPOVlXGiIuHKsO3LBIrSg3kxQZv1wz9wLaeaaGq
         BTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OFhUgBSjOMKHmZF4NaBr44T2PoRo28FKxJzPDZ30T8=;
        b=LM83iYpDfYeFBUtltzIswQHx/5iSiclUXswmC6iIWjb91HD/xcwE/NbWT+3w+d8ukJ
         +R+aF/mhcEEsGE0PxXoHX586BJnsy4GMi1wlBwNP8r8+3aUPqE8ovOYqezppk/kXxump
         TwPhlSyaiI0FDngmLOW++Ybh7YpDnu7+Cxh1pLbtEn50FF6GvjKHlWl0rd1NZoSwhvjW
         Qwzz43P8Iaw1aQ6jCpYEX7C99JFPmeNrrIscReyYjacdGKAXgWuci9dUgSNLlcMxN0fH
         9WRUlx0kamsnXYuu1vbaQZpqfV+5yXVpPDcOMkn1YQoknkrw6pHPnxLhL0UPZY8Fc02S
         of3A==
X-Gm-Message-State: AO0yUKWfjk9Pk4gXT/FZ7A0p0FD/x+r5ckZwSN/MmXExKbBfvmB05egM
	ABDh2JNWJL6tsU6uwDHpqTDjxQLdajU8aqP2
X-Google-Smtp-Source: AK7set+jGOeOXcHsQJZd5RCRrJTvGw3x06BtcJkYbyWuKYli8xP7yj+e/A5OWLbtLnZQKA5k3f5Jxg==
X-Received: by 2002:a17:906:2552:b0:8b1:79d0:bc58 with SMTP id j18-20020a170906255200b008b179d0bc58mr16100234ejb.16.1677005766172;
        Tue, 21 Feb 2023 10:56:06 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k14-20020a1709061c0e00b008e204a57e70sm741335ejg.214.2023.02.21.10.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:56:05 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 1/5] riscv: Rename Kconfig.erratas to Kconfig.errata
Date: Tue, 21 Feb 2023 19:55:59 +0100
Message-Id: <20230221185603.570882-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221185603.570882-1-ajones@ventanamicro.com>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105607_858725_16968EEA 
X-CRM114-Status: UNSURE (   7.84  )
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

Errata is already plural for erratum. Rename it to make the
grammar gooder.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig                             | 2 +-
 arch/riscv/{Kconfig.erratas => Kconfig.errata} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/riscv/{Kconfig.erratas => Kconfig.errata} (100%)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6f52d3ec93c3..736f42f572aa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -244,7 +244,7 @@ config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
 
 source "arch/riscv/Kconfig.socs"
-source "arch/riscv/Kconfig.erratas"
+source "arch/riscv/Kconfig.errata"
 
 menu "Platform type"
 
diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.errata
similarity index 100%
rename from arch/riscv/Kconfig.erratas
rename to arch/riscv/Kconfig.errata
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
