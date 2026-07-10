Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009E7C44501
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sb4AzVKY9S50Rzpj1MHIYp+o8Bmvg2zX//oT7jWwGVE=; b=xzeZYSVfXA+wNM
	jolsYC6wzES2PzvX+uMwB3QieLT9LjpJ0wZHLfSPjEWH6ESgBGYxLSerwEUofDhJbH19RdPWJ0Iqe
	TnfkxcHcMbgocHjQF9dtsVwoOxnLRpirFwWYn9Sdpj8bA6X54hrRNaswDAMnhuxxsTyjdnZRVxy0b
	tgCU8yrl3gXYNsz29LxSFuLOcNbYWBgFdQYCI3VCKraFc4So1hARvysKNlIqKGBsuGyxZzr9PPu8A
	sZXc5eaUy6i8MPiBUFlmRhXIEtun/U54o/06uBHtUAjkepjkfe8d0dxEq5J73tMqXOUvHL2fNkj/S
	Zw3KxFAzi3vdoCvfzn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4oF-00000004GZb-1TWm;
	Fri, 10 Jul 2026 06:34:03 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4oC-00000004GYq-3VPr
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 06:34:02 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8486ac3f347so986933b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783665240; x=1784270040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVhq88axF1qV0hsa5snykJF0ozONqTGS7mDXfQTF8KU=;
        b=Cu27CyVCN4+0c7ELOpo9vVncSiCHkZWJ7SxjFdegIBaQ1fIeC4mBxzFKmiF2LnDsYD
         YgQDMVphLrlmGJfyptJW38iyeRoNgkTvVwGytaaZfdbM5FD2x+dYfXfJR4d2QjKzdnoZ
         sC9vazRDLQu1S8jFYt08QTWWGcuhuoRh+cF2TiaT8fIvQwiq3T7JUWarjjS+CZ283wnM
         dziDu8KQiEtum2z+tU7cC5DTpjVyfDeYd/V/JZ1NqxGqBhfrL+RFbt3lgK+/aqrQSGxD
         bjNrPYNFbC21hvJ0YyphRd0nuWFe1ajOdNqzM+wkxy5mPH9qVXaDAmfyA3AJ6en3qncG
         pjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665240; x=1784270040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVhq88axF1qV0hsa5snykJF0ozONqTGS7mDXfQTF8KU=;
        b=gXtBtdPuSmfHTRdx9KkJN+KowFXS0VTbimVQBiJd/y7qg9IgJZOYncT0Dcep/Y/GVz
         pv3i4X5Fy43R24u29wX3XvXcyQHeJPWs0Q4KD2ViEPiNxGPOemy0LZHUwmtJV9Tbjsxo
         SGzZ/ic1hLDWTcmnAGkuz0TZcYvmjgNItRhImIcRagNtHpLPnd8aXsjTNppE9aLDW8Nf
         0xS9jNW7MbZK6JPzo4ciW0W8rXnVpv7ll+QNjdlw/kOnRlmC/KmKmGE1AC17yA2rx74W
         qb9cOgB76yGvkRfkzcGdO8tnZc22VimmIcg2eBba/EELqDOID/8lakCraIzT3YZtisxO
         Em4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1pMgeRHt2uiLXfGMaAJ/pyx1gGua6UPMBfzofOIFsMu3JyEkFXThlDLgARQny8a/ipHJ5rOqNOGYl5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0qQrgHnL+Kp0/5vGkc/kghIh1Os4os/HYg6+f2+z3A8m2jzqr
	fHDLVPZRknCxsKG0z2QSiAxoTRvNsQuMPJhcFUv4Ay6eAAl0w8UiTZQQ
X-Gm-Gg: AfdE7ckRcGegxwfZnwXf0g/y1fpo9x0m3/VY56dr9MMIMlgNRzNKhGGi+d4hsujRSq1
	1PpmbGQsIFgCcxp0aAcTghKmZU0bebATcX2jFsfkg84ZRmm8XjaAGYUyLiZ7ioQZfL+JaS3jFX9
	FBSrClPVLI7J/hnN59REbDTRi3dVA5wKN1f9DQjJGcJyh/e8WKU1wILkC1pNkCOZiGyTs7nh29t
	8Mzxu6ZvPspFxOT4JUek/AxXh9/VVxL0iP1U/2ME/vjl0oUOmQXh9o3/coKdpc59WNgq8wt4ZCd
	8BKDpYwGjFsdpqEm8Yyp95FQrsvnNf8kZcuvemVrtMm4eZr8Cc23aGDDhyOqktYQE1apzZ50Uz2
	cRgOHC4nqR5wlLq8eQyc8oE3xieFO59UkbtD77/XAIR2d2pAOOatUMjR5Iev30ayWmLmE/JrZhf
	FT/YAYVtbogZY=
X-Received: by 2002:a05:6a00:850:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-84870ba9000mr2044134b3a.36.1783665239872;
        Thu, 09 Jul 2026 23:33:59 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm8174681b3a.8.2026.07.09.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:33:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
Date: Fri, 10 Jul 2026 14:33:13 +0800
Message-ID: <20260710063314.1030249-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
References: <20260710063314.1030249-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_233400_874503_998938FE 
X-CRM114-Status: GOOD (  10.92  )
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

RTL8211F require at least 50ms deassert to guarantee the register
access, 10ms is only enough for the PHY reset.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258..b704b537385c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -178,7 +178,7 @@ phy1: phy@1 {
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <50000>;
 		};
 	};
 };
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
