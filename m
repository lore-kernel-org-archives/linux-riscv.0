Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9183606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JI4GA8lY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JiWH9S92
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NS5Q085I7vgKdrmwn7XTwfnmlz8AiwO6bqZU2PznWKU=; b=JI4GA8lY1cbjXN/ehv6L/p2M1H
	Anv8wPXLSizg8IM46CDcDxm/KY6kRree9U/pO57eSGVhBdrhZjOgJN8k0ZqHdToebqba9TrkFFGZa
	f1SAY3xxwibKYV7dyN05wovTXrXRhbgvFuTN7QdUczqF2uQ3yFsFS8EqUVkeU6cln5k1qm8H18byw
	Nqrrl9zVKhuD0paUPOHUY5dqUDXSKKkBlniJ9D08/5sELrpVG5ytiw663nD0J2kFcoxXhNtFY7lsL
	OniuEXFyxDgImVRvLfSTtu+Vc6Nv06i60MiEv6q+Mep1OLpzpbpZlPzO7I/XhXTMh7uRqahWsGDLG
	mzow5vYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcMS-00000005hA1-0MNH;
	Wed, 04 Nov 2026 14:53:12 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcMO-00000005h8y-3zgC
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:53:10 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-679334baa1fso1171391d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803988; x=1794408788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=JiWH9S9249Gkm4bs2NcWUyqmM0DfMRVejuWdfzHpPwCjgv1EZkdJZV0ZpgvRx7/AG6
         KwIzD/wtjGCst/oh2ERfgIRB+D72FZMQ4u2MjGxW0n8Yt2bYakp4ZniOO5f5Gl0FJdnZ
         Dp5Osj1F2SzVRYhJLd8Y7JAwSonI8fakQVxj1dL/KQxCIiJ6L/tc1IZcbwE2AF2PA6ub
         BCQmhugAW8sAx6rpaYCZ92gRrSHxuDvtX7JlCLROYqs9Tptt7W54/qaW8+/iwT/LvrY8
         GXgeEo3PBccQHO/F6/6aeuH/IkPtR7zwKhtJWR4hxn6gQYevFEbiCRVOKchmrq7A2vN7
         pVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803988; x=1794408788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=RzfWeT0/wNt9TicvUfhwz6C1AqumclVm8/niSnUMDhjwVWkyiAAiVJzvDvt8erbmCH
         SKa8dA08zFjRmNjsiLz/4aBF2+Bd9U38Umf/I1H6C85Afh6IkuwPzFPpswDWMooLRwT3
         TxAXaXBG5u9JqVs+3aUjOD8Jv3XI8fUJaTJA5mcKZf0vwMB80dn4A+b9Ktfj4+pjUv/g
         7lugtkmLMLOVI+8HOjY6pj6aGUUJO/OvlY6eCxlcLHckMTe4tx/84vWbWEA5Td3rxKY6
         r5QB/yViZWz4zlA3dg4XOZRD5x/rvM4vrQHYUAajf7acwtbIsCsPAwNbOrTPf1vmaL/Y
         YcLw==
X-Forwarded-Encrypted: i=1; AKwUvBwkjCXwPrl+jXKbVUPi31LQ2aoOWdfD2qoYI6LJ3ZHBEAWOB9KxPukfDZoPxDkrpeGYGd1GjyNVEEST/w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9PhPUvBsEHhEwpmCNMfGI8nbI3tC0qroO1vJ3OdsXmI+1zeDIi
	2uD8JTnT5dmJaYgbngubA5XF2sC6Z00GeMLL1Zpc/+dtASlMxTNNwKsqAZT0EznNIXg=
X-Gm-Gg: AYBFou1/B/eihUOV0W1YDtLvmANNhtEyIUC00Qd0HBQYBHVpQltWbSGZeCxvmCqVvXb
	0tbvEJfnc4CiVuLpZEpBQjQ1StzvPuuRVrPpzo8gGbwXtkBM/DvfZ2nJOtaoQJz97aUZ+bWDCHW
	nHAqIQeKiPLLdqjx7vUTw+uIZfbzmbd41E+odNdytMcFOmN0qS92T2c+TtvtRDX+IFm0SY5l4VX
	1YKKdUZEI0Uqj8+t1iVKqHvA49+OC5FUyikSwmnOPS1+SBciq9aW9REk0hxQnBdpkfTDc1aYVQk
	D1gtwdif1i9oO4wWFpsuuI4CTIguGK3erDafmb382rV0TbXYf/6aIS0fDRG5nOMDWMaJMl6addk
	P+RBp+n++cdYRrutOvSwCabPif/gLOxHXW1uax+aY18Nt/bSGAJqBp5zYN+JEaaJVBn5GNuDOTO
	KXDufrwbF7g81x9BW+AOSpyC3NA0uoQizbiPny8pfficqRrjhrjGWaXkDCBvpHDnR1ixf0NDwo1
	JGZ5Azl2b3725+bomKLohpYCLV4ldAwWgjXZLGve7iN7whzugXZ9fMt7QwJWaFXbGVdV6C3E7oi
	vAoPSFLDyA2RY1AxaqQ6xtHRYizn/ZUiLbeYS00u3jlbE/rgHklaSZoHA2es+iqUE7l3fQ==
X-Received: by 2002:a05:690e:c6:b0:679:a898:7da2 with SMTP id 956f58d0204a3-67ba50e4d9dmr6951996d50.153.1793803987737;
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:33 -0300
Subject: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_065309_042427_B57B1F87 
X-CRM114-Status: GOOD (  10.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The overlay only enables gmac0 and the MDIO mux, which are common to the
CV180x and SG200x SoCs, so it can be reused by other boards such as the
Milk-V Duo (CV1800B).

Rename it to cv18xx-eth.dtso.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile                                   | 4 ++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}     | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 49639cb0888b..440acd0aa55a 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
-sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
-dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
similarity index 66%
rename from arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
rename to arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
index cc93746d932c..cdb8db063977 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ * Enable ethernet on boards that use the internal ethernet PHY of the
+ * CV180x and SG200x SoCs.
  *
  * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
  */

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
