Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FA5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEB661251
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DEB661251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4Cn4VkopQpRm1xOBbKrdsh6/UkvtnIG+IUa+VMgIPk=; b=CT+R4e1pJdmXCA
	AGnicGX5z11pF/zSBMIueaewCaPC3jJnnkG538csvR+9m5wkpTkwhKtf4XH1EuathJmM/Ge/GRPme
	gpPCaLxhK19eJfbO3Qmvm7wWHaPSqNO7iT/AokcH8JzJh3BqO2HqL3JSayCEUAyQaIf5dWQuY5r+L
	Br4p8zeALpuIAuZNoGTmu+84412P2c2RPZCoelyAmcrIVxugpjH9psf2IAwygSWlrPDDuSnLPX0kj
	/fWAAry3OAIlwv+oJ88GsadDXSq0dzB6lY5/R231QFBHfiGVdnsbQ74vuHm4N4qT7kAlS3HGC5UY7
	ULaPp+uU55UUbEPYOvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNm5-001KDD-MW; Tue, 09 Nov 2021 09:50:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNk3-001JQs-22
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:36 +0000
Received: by mail-pf1-x435.google.com with SMTP id m14so18972340pfc.9
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/TnOUl4F123mnvANSe6fIkO63Rk+15kCEettwhNh/z0=;
 b=c+oKiP6aTAXv3kd484eeW4UnfjRGvcHzqaDG3PnqjWgSmokMzhdSoGEqb2RhYVnnVZ
 R2HqxI+1/Q5cHL+qudUrM83P+Vbjav0mg3EldzK514G/Fhqs1LTAJYjoz6BTcY1/f9XH
 gBjCEJ/o8XOwUOdqX6a1rLsCXHK94yYEe3h5cDWi8cVkmnZjKp6fGihl68fWt+E7/qiE
 Q9uJFo06TIPrrjBouzLD49IEzfNwE9db8WFTzrdLWI9bjjgiYgsHb1klYa+JHkTsp3YJ
 DzNyyPVDb7nlRG4dMgbQK/LcbTelCcZnbMeS7i5c1NhSZNzKMmjuGviJ18U11YFL29AD
 UW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TnOUl4F123mnvANSe6fIkO63Rk+15kCEettwhNh/z0=;
 b=0XUScKskMnnrsxlRN4vT2tzz/QGONYOyri02AAedtU5ru6Ro3w8a2dH4O+MGHe8i5G
 4Opx2DkgFDnepKooPBK5dsa/0I5piVD3JNTZk/StNwBp+/2yUysE1Dm/ZqAArMpJbmfd
 cNRPtbBKKuJYUIX1FxPAV8eErxzink1UZyJtAqmUxHUJ0PyMhPwXwOaqo+0ezAQlqdPd
 7wGcsJ2g2CljrSm+CitSdrLHo4/YXIi1CDxu1KDHP2Au44MW4KYMO76vqksv2hQdpMcq
 vFIaNAGjvPW40+ZH3Uo9IBUcXrNuG6UBgaklKHosr/kgbvS6v1JUmeqmOrUtNM44uyi6
 R8Eg==
X-Gm-Message-State: AOAM531PvU87ehoDSbpxbC51TC1ktEKgCZx/npTq3lnnLWWPRy2gEGDD
 xL9BPKdDN7CZBv1iNVj8X2YZUA==
X-Google-Smtp-Source: ABdhPJxslxZmgp6HGLXrNO9ENm+ukRudAEyD3TUYAMc2MiU5skbn5f8H5pd83qLPoeINHQerjDYasg==
X-Received: by 2002:a05:6a00:1c65:b0:49f:d8d0:c5d9 with SMTP id
 s37-20020a056a001c6500b0049fd8d0c5d9mr6568239pfw.72.1636451314045; 
 Tue, 09 Nov 2021 01:48:34 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:33 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 01/17] riscv: Separate patch for cflags and aflags
Date: Tue,  9 Nov 2021 17:48:13 +0800
Message-Id: <f76b0312113bf960e114724cb578a060b3f101ab.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014835_141017_B8F0696E 
X-CRM114-Status: UNSURE (   8.08  )
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

From: Guo Ren <ren_guo@c-sky.com>

Use "subst fd" in Makefile is a hack way and it's not convenient
to add new ISA feature. Just separate them into riscv-march-cflags
and riscv-march-aflags.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Makefile | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0eb4568fbd29..37de70df4fae 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -48,12 +48,18 @@ endif
 endif
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
-riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
-riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
-KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
-KBUILD_AFLAGS += -march=$(riscv-march-y)
+riscv-march-cflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
+riscv-march-cflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
+riscv-march-$(CONFIG_FPU)			:= $(riscv-march-y)fd
+riscv-march-cflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-cflags-y)c
+
+riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
+riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
+riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
+riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
+
+KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
+KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)
 
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
