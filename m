Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE395C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FgHzcSlmCr+0Kc9+Quq5NOqZatB2gFrcCqexnw3wkcc=; b=0KGXjRoU0EA+n/
	7xqPHReLEONVLbkDDtJFEUSKcgj96CJ+H22KUSd6XmKs8HRgdb3YJ0+KvKObgqXYNBiMo1tYdw2rY
	rUIlVWb1zrgFyugpVeaOM89AhIg8JijU++KwcA3IaaIXQD22iNl5frlt4s0CjxlFGxP85R+xvPqRm
	DkigNcZA1MiBIx6IT8N8e5bsfKvOMMvI6Bydqo+pE9vIZAUZ7JPXnf/2cS6y9RVlzBMwF10+EK6LP
	uMXYiFQaHO+BN5mODXhhG9+1uQqJDmo7sqwUyqRXYRTgQVIY5Nw7kg6k0/LA4uL0l30S6eTM9cQPV
	WXJfKQZWDNaubu91DYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4oE-00000004GZI-0Kz5;
	Fri, 10 Jul 2026 06:34:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4oB-00000004GYN-0Sc8
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 06:34:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so755608a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 23:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783665238; x=1784270038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWsQiT76w5iSImzPn/o5lN/n7ToH6AkATnCimW/bQDc=;
        b=QdNAWsvQ9X/xIGwpCiJhVuZPdTdNwZYm0s95fIM5wUycvok03RxNWBeXRML9bKY6MP
         M2D9hJM+H5iMtDRLKbba9+lwHFVioGhwD7YBLzuYrrcheY3nxaWuLiDwBEFfzpqdJRX3
         61BAIpbR1pcVPT3c7vbo4GhpUwLlHP66zq4WyfkOCTDkgC3ynN/116JEuxke2m7cn690
         1egKKpYMixOgt0OMti7G/FaNYlMySfcxxWQ6gj9rLy9LduT8m0dIcf09yeAX24WGpLML
         sGoJOE7EbQzteNOP225nox4b5g9clbqyRNhYg5Y4eKF9Z6ejWSdYyN6SpuIBGCA/azU3
         uylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665238; x=1784270038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWsQiT76w5iSImzPn/o5lN/n7ToH6AkATnCimW/bQDc=;
        b=RdoluLK/CpuF2Ma9s/2XSQPZzgov1OVxKktTeuMdoqbDaayKNJYU20LsNuAc8Yf60a
         GHtapSWXpBhvltVTIBWYlHKMuHRAqe+/Ykiv37yca0RaEWQjIGQaJsUz213z8T9ncf00
         z9BViI0CiuD+NFpKMlWPTKYV4In3chJD7vrzTlLW9GqbftpJ4IKcqvX5kq8IQ5qAg9zY
         fgpd55GSkyNHIacX7LR+zbKsfmlpNPTD5qhCGAncQyY4BkRoHEN93waE4+fF0l7I+U87
         Sz3mdUlcN1vT3ZyeKtdp7E2Rxa+TN/iSzMy/mlkHBqFUiSaT64NaXS8PrOJjimPpYMbK
         uCRw==
X-Forwarded-Encrypted: i=1; AHgh+RoVjq5O017I38jcLyGtDuoBXSKPoQCR5ccYsbocgib+NlOMkirIhFQFiTLRRTYkObrjEJiN6Y2IGLLmsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwemLoPd4NlrnXqOaogoJ+UnhZS5VYEzQs+z6fNwC0hndLacA03
	kl3UGnxAUKhRMxkVinF1FUdkAwf3aA7kvCjQclwXOY9yua4w5u9S2LWt
X-Gm-Gg: AfdE7cmVD5UkgX2wGiimmKytPnvf3WYUus7KLRfkgfuRd12H771iUBG4sNNtnfpl6+E
	KoKZlj545b8ID1gJC8hYmUwUxlGuqdxqa6hoT7rud7CXF1hf7d/B/bjIfnepd/TmIdhuYAlYrxV
	zDvXpOA4bu0BRQbBCp2TgDMPKALTn4yZzRZki94QzFq53wZD9HRmw2Zfz3fgKWCnYHBy5QTbvl3
	VuSaZZk1Nq/MEA85NFxV6zAyloQiWzK1PN6nmSI4jLMzPVH1rD87zVw+VACDC8JxEIdvoXoGtDo
	zoAieJx/QIdsXal8U+pMthihrNAWke9eXs1iOroNlpD6UX/BAVKR3oB2pxslsvnPVsHC4jFh6QE
	ilVD2g7xBJyrwHtWUh54ssOcrDKeW/p4pJ3lIpf4+JF68ZymPrpmvyL5kIFwRAw7fUkKctP1P8W
	8=
X-Received: by 2002:a17:90b:54cd:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-38941101dddmr10813393a91.4.1783665237634;
        Thu, 09 Jul 2026 23:33:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5564f58csm2307070a91.8.2026.07.09.23.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:33:57 -0700 (PDT)
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
Subject: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
Date: Fri, 10 Jul 2026 14:33:12 +0800
Message-ID: <20260710063314.1030249-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_233359_155161_FCB89751 
X-CRM114-Status: GOOD (  10.54  )
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

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 1eb5abbc61f9..b2a7d2d0d3a8 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -200,7 +200,7 @@ phy0: phy@1 {
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
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
