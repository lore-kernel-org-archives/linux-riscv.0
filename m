Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F37D13595
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFF/Q2Q2HFBxt0mmWS0L69OxIznHf+WxIWPXH0THWQ8=; b=l8VUBmG+XgD4u+
	Wo8jQhAYmZ/95utxdncAqcU/ojamUb7QqXqt4yxxfz9KTYHAVZy0zjAF4rurWCQcDnABRhKrqtnAy
	KnaiGX6dnaMKs+2nyPG7GKVIMplmCJcXbXgbN4Muu2369dU4P5/hOkA1ggAueB1SOFKCZAVR/0PkZ
	sCao0lVAfxUJaLcUSLB+P9zvr1nLeCpoa1Ty7llh29GCgg2yr7izT5dSeLrABPSEjY2qgeuet8ZM2
	8nwI9x08QlUIWqhkhzUUUYCHU/NhgXtxIjEPbZ5Le2G+MN32BcDApAq7ZzzMIbUB6wCEOJYKpK8pF
	BAgPKnlQCMRv1oloOCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7K-0000000A5gb-11BZ;
	Mon, 28 Oct 2024 08:28:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L75-0000000A5bR-0G3u
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 08:28:36 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-72041ff06a0so2550063b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730104114; x=1730708914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwtvLrthbQv2BMJ1OVZkcsmKnwnqfTxkD+MGqQpc7wg=;
        b=PXkpUdhz4w2qEOVf1ztmKMv068JQvY7TZmuG/Ljg6sTnVaWr/2Fv8jD6MSpcOOp4G7
         iCmTPNoB0GmS1UuWlO/idQLAds2wuuw9P356Nvr7oTFKuCEImUbi0LFa1DYBg2MGUN6I
         drd2XROCUfw/nTEoD8IfEW8r4Bijo7gpZJ6vQBzhZd1t9Y+/5qjdajh1nOgWgOdcjKG7
         jRiJcCqmX+YFi30i3SguMtrvcQ68uYCAZ6qqoZw9aBkuhMZ6Sqz2HGY3jwHuIBYRxx8O
         mRLxyilqjLLO+laO+NeL1xkAjme3dfhMiWlMDg969EWR/bxp0TbSGLFbkiTkvYrAdLpX
         tBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104114; x=1730708914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwtvLrthbQv2BMJ1OVZkcsmKnwnqfTxkD+MGqQpc7wg=;
        b=ebx5+zEY2npr5ZCZ2h1mMGtYxtFjqNsrmAfZQuVzt+/Had+XPBePwtmxoV8k4UBKYw
         ykF0V5WHVu4kku1HRNts1SEDfQrKD9rMJ7xxZ3FhsmyujELfJgQz9E8778oMhHlKzASq
         ZRshB7yS3pklswNnUNg4PepPLiftFSEWIMqHugtMFEK6X5ooNALXU8wbG6eqbbxPvD+H
         gQw5q/RsCd1zi9zezWPzlwDh1E+qnlTOFYlbnhn0oloBBH4J8caaVcx24SBy5Qxjg6Oy
         g6beB2pqDa1walU7ebtxT3CIFEPEMj4926pwaMfs5zOojn9bMwGyVA6htNOXxuIx0aKc
         EHzw==
X-Forwarded-Encrypted: i=1; AJvYcCXRbA5BN70kQa33sfBvFOQEyioSGJBi2M5akdESZpT0MFTtyCTg9e1/So23SZ4vFiFMtMQ43SORXNILpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoX4+ArOvwOhjKnK41LpW4aL/f45q2vNusHel0H/RxvpFNV6aR
	0xn8HzZh/AhzLJm1V5yTMP9bwtnrtCAm5nqfc1omjTN+Ph5BT2n0rqvoC6sWlZY=
X-Google-Smtp-Source: AGHT+IH2Ol2g9EuNuGMWMfZ3q43MFeH2KCEL4oV34aGBAKZhi/ESGCLFD02jBgoKIlwsayi+WCNfJQ==
X-Received: by 2002:a05:6a00:c8f:b0:71e:1314:899a with SMTP id d2e1a72fcca58-7206303a746mr11420423b3a.20.1730104114245;
        Mon, 28 Oct 2024 01:28:34 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e451sm5195419b3a.24.2024.10.28.01.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:28:33 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v7 4/5] dt-bindings: riscv: starfive: add deepcomputing,fml13v01
Date: Mon, 28 Oct 2024 16:25:52 +0800
Message-Id: <20241028082553.1989797-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028082553.1989797-1-guodong@riscstar.com>
References: <20241028082553.1989797-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012835_133459_588ED473 
X-CRM114-Status: UNSURE (   9.00  )
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

From: Sandie Cao <sandie.cao@deepcomputing.io>

Add "deepcomputing,fml13v01" as a StarFive SoC-based board.

The DeepComputing FML13V01 board incorporates a StarFive JH7110 SoC, and
it's designed for the Framework Laptop 13 Chassis, which has (Framework)
SKU FRANHQ0001.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
[elder@riscstar.com: considerably shortened the description]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
v7: No change
v6: Added Emil's Reviewed-by
v5: Removed extra "From:" line in the commit message
v4: Added Rob's Ack
    Updated description
    Changed board name from fm7110 to fml13v01
v3: No change
v2: Add deepcomputing,fm7110 into model compatible list

 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 4d5c857b3cac..7ef85174353d 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - deepcomputing,fml13v01
               - milkv,mars
               - pine64,star64
               - starfive,visionfive-2-v1.2a
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
