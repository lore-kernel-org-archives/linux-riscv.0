Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88FDC27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VA7JE8vPm4SZyyRHVR5g/T8BCTu5vFA7T8k4G/J+W4Y=; b=Zfg6o7Vv9HsVvp
	3d9HTbb5qgg2WbpautxhW1a/EsFuz5kwJ9v4kly0uSVxR8JxlbnX/FaBas9gDemvdb2lS7E7Y8ncN
	uaHHaN5y0HMo++JPPqMNZXhIg2RP4odEF0hsLvS+TNGf0GAZIieaQ+Lnv16L87b8duh0as2WAYdvs
	yLu40b4i2XvWY7/4JK6bCvnnH4xqyr4ZWHT9SmL9adU7hDRznH1SG0h0iYkKoewZjO7D38Qu68/+q
	vEOkmL1/WjtOXhsDwQ7IzJ7+fKgXoNY47nDgBmwap/3y89N0C0JV1Ztv+RxQjt76djLJhk0NbXkSX
	LURnDBLta3a0jg17fU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSq-003Ard-1t;
	Wed, 22 Nov 2023 22:12:56 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSj-003Al5-01;
	Wed, 22 Nov 2023 22:12:50 +0000
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7a93df91813so6582539f.2;
        Wed, 22 Nov 2023 14:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691168; x=1701295968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvKVScUhvKKHq5yH2cV8DV0lJfU3kh2MuS6ZYH4ebh8=;
        b=iUHP5Om+dJOVNtyNE5zhhijepkL0BqqWiF4hzLsXCUe81uZ33mTKJHS1j2VVQj4L/L
         Ut2uCIR1l2jWAUjRION2oKPzuYfaCqle8YGMraAYFtgGa9ZyprW//oucg+M4go1xFr9K
         AA5LAA+ogSNMKu1wF+HHlB2gg2m5wKC85A5c5i0s4C8eNYQJtQUYxSNq03kMieNyvpem
         0dGVUqgoi6e7dsPAsuMLjJnwb00xcw2rgKQhnjGF8QSkVjDL2D51U9LQKnUDB5l/fLRh
         Dj00TYoJK7VgrfLX7dAWohxFNFRKKWr+LZErQLY3j+H56mlna90wUiNBEq2xLAuRpqxh
         UE/Q==
X-Gm-Message-State: AOJu0YxgEktdHdY5obAC5H6+AjAOqnTCft4H26NcG2dX8RmvoZBc636B
	c5WW14Q0na+FzZCrt8shVQ==
X-Google-Smtp-Source: AGHT+IGLO9xpcHV8HSJx4kSfogE9LNdREnwsjAbOU8PWDbp45WItqfhi9+N7Ml1bG8W7Xsf1CyrYyw==
X-Received: by 2002:a05:6602:2c96:b0:792:8d16:91ef with SMTP id i22-20020a0566022c9600b007928d1691efmr4004136iow.18.1700691167790;
        Wed, 22 Nov 2023 14:12:47 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q10-20020a02a30a000000b0043a0aa909bfsm83341jai.159.2023.11.22.14.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:12:47 -0800 (PST)
Received: (nullmailer pid 2753838 invoked by uid 1000);
	Wed, 22 Nov 2023 22:12:33 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 15:12:33 -0700
Subject: [PATCH v2 2/4] kbuild: Allow arch/platform override of dtc warning
 level
MIME-Version: 1.0
Message-Id: <20231122-dtc-warnings-v2-2-bd4087325392@kernel.org>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_141249_047739_C3E8648F 
X-CRM114-Status: GOOD (  10.53  )
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

In order to allow enabling extra dtc warnings on a per arch or platform
basis, define a new variable, KBUILD_EXTRA_WARN_DTC, which contains the
warning level and can be set by an arch or platform independently of
KBUILD_EXTRA_WARN. The default value is KBUILD_EXTRA_WARN as before.

The platform setting and command line setting are merged. For example,
with a platform that defaults to W=1, one can run 'make W=2 dtbs' which
will enable both level 1 and 2 warnings.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a67f781ae8ee..53a74e53e0ca 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -341,8 +341,10 @@ quiet_cmd_gzip = GZIP    $@
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
 
+KBUILD_EXTRA_WARN_DTC += $(KBUILD_EXTRA_WARN)
+
 # Disable noisy checks by default
-ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
+ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN_DTC)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-avoid_unnecessary_addr_size \
 	-Wno-alias_paths \
@@ -353,7 +355,7 @@ DTC_FLAGS += \
         -Wunique_unit_address_if_enabled
 endif
 
-ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
+ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN_DTC)),)
 DTC_FLAGS += -Wnode_name_chars_strict \
 	-Wproperty_name_chars_strict
 else

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
