Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0912BC61DA7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 22:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjfgG3pR3NFBeyby/2zRDTupMQgW6v2haolDgTF9xDA=; b=NQ8dKcupVEYvJ4
	WALfqpxyNnQkxgPf0ZFp3aGOF3egIynDOHhwRwoa+Ffiolcayeql/WX3xVJMrgSiieZ0OmCluO1CR
	+y01B14ep0ZPLfD5W1Bo6cM893rum7fvjBKPQnjBHJtJydGitIQ91NDALy8iaQ7+LZ4SCxZ8P4go1
	iIrl/GPff2uMzfuXoSwsA9SbLmEjF1H3y6TFlgTfyGoIMsFi8zgUuGoFNK+HoNQuGKeXjRz6Rt3Im
	cZ2/WAqfS7w9QV5NWgILVhR3EIWy3ww20YVe50+TWFqdeuHVRMyqxAe3Q5UBtq2HUsAAUMyqLOarq
	AS6yBhwuEz56kQjcHa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSl-003Ank-11;
	Wed, 22 Nov 2023 22:12:51 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSg-003AjR-0v;
	Wed, 22 Nov 2023 22:12:47 +0000
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35b0fc91c81so903805ab.1;
        Wed, 22 Nov 2023 14:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691165; x=1701295965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shYyO58BPes3ozOUzmFhahNxoCiZTriaHChWVdh269w=;
        b=pQ8hbjobN51pDLrIOw1ai/YgDuH44XboLN6z781TcpXa8IHuDezQeo1puL/ar8+5mG
         jVQ/PBS3o4GDRdA2/xya+NQDfCuuRrYgEnSOjC0ZKw5lJSIWoy8cWAwWxc5oI76iN4NX
         FQU7uLbuD+qkz+C2sisX1Xkb3JsZYsRzD7EQzVbftvvAb7YhKZYQcN4tN5e5J0FmMZaR
         ZSsuYEEI3Rdev1jqQcHY0IflPLS+kD568MT84/1qApK52WnnhD7bcHFesmc4r4QzGAmU
         g3IOTI+epgza4RZhlonc77kW/tKuSsBkbtSu0oMer0ieIAekcyCg7YW4ati7sYR+DmkX
         a0pQ==
X-Gm-Message-State: AOJu0Yy1NX+G9dhbtZJZInB5D+Cqwe7TBoQ0fcNmaXyKFzqNY4NvEXMq
	W68NoQlsL3cUbqrc5w5AZQ==
X-Google-Smtp-Source: AGHT+IFMJzsEvpbSktexSSdFIfR9OaWDnu0zBfHOB7Y/r6iYkYi/TaZpUgTAHm5TMgYN9AvcD7iJ5A==
X-Received: by 2002:a05:6e02:603:b0:357:704a:8699 with SMTP id t3-20020a056e02060300b00357704a8699mr3547266ils.8.1700691165100;
        Wed, 22 Nov 2023 14:12:45 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id em4-20020a0566384da400b0045b4a059a57sm91639jab.44.2023.11.22.14.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:12:44 -0800 (PST)
Received: (nullmailer pid 2753840 invoked by uid 1000);
	Wed, 22 Nov 2023 22:12:33 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 15:12:34 -0700
Subject: [PATCH v2 3/4] riscv: dts: Always enable extra W=1 warnings
MIME-Version: 1.0
Message-Id: <20231122-dtc-warnings-v2-3-bd4087325392@kernel.org>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_141246_327423_E8404DF2 
X-CRM114-Status: UNSURE (   8.64  )
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

As all RISC-V .dts files are W=1 clean, enable the W=1 warnings all the
time.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/riscv/boot/dts/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 72030fd727af..a7b17e0ac8c8 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+export KBUILD_EXTRA_WARN_DTC=1
+
 subdir-y += allwinner
 subdir-y += canaan
 subdir-y += microchip

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
