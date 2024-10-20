Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B77D3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yistQ60/X0GCfGGy0H/u1XKRYgBQVDcmyNRUoQQMyrw=; b=Y8VBZ+nELtBcsr
	OHdGDFN7dpYSLTmA7MTnMLK13BHBzLPusFrJ+N+2ryggl9wrBBgVi3xAwg9eafRf0hTOAaRNaAtCY
	y+yNvdmmUEPIn69mp/22jIT0eWq+0yHvHp4ybUjzMk+EJTdvgRZRM543qkcPmQ8BzpkJtKROoRII6
	3WL+B6Si9Sc56Y/W7O/4wKHYlhbP2jo62EO60QThyaIOWJQiFxNTwsrt5Y5oToixTfcBO0L+vxMdP
	zBtawxS1oTWirQAWTi7+zhtazl7/spfq5IK7QvYPS3XrbM4cGYiFZjWukYk6Mw1pk+u3HLhK/M9Cq
	gBpEcG5mHIWd/Q2lTOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WLH-00000004xgF-2UN9;
	Sun, 20 Oct 2024 13:51:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WLE-00000004xfT-39JW
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 13:51:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c693b68f5so38167485ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729432292; x=1730037092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPBMoaM3chALe3soUlbHbpvyGeNDa4lLSyXt5tFikcU=;
        b=JR9QDeYfxh1YRcvcVPRU2FkSqj+LImS3EKazajrRWjEGxKZ7JNcWnkiAXoP6E0qNzC
         QhdG7SHTYdUpgMkSwyZQ3ADyVrxwfXY4/VvViErlxyU2eG1F3gv9qykbXIXw9jFRYv7X
         o2Hk7D8Vi6aOa5xu70i3Kbnr+o8kbFA61BFznOIKKjDsrpgF9N+PrJaJCHR/MqLbh2tF
         zHkSZdQuVthYSr3VWlhhWeb3nqSp54ervE1EXVLNSrSH0yVPzQKx7QncIhQNVzHNeOl8
         BnRJUzmQojcD4Lvz5bYb9c+1yYKECUpFG+hOgW2FH60Ua8uZIw6Cws3uqSlmrEzNFaOL
         Wx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729432292; x=1730037092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPBMoaM3chALe3soUlbHbpvyGeNDa4lLSyXt5tFikcU=;
        b=kwFOcZJxwE9osk2lXbjgY3gHgAXvGt8Ojbwuf2GySbX0zs7cIwRf3vmsBmBTWUCinn
         LglqIZRoCo7VOlgjwoQE8l7QonHgA0/tvizZR8p0pdPjYBwWb68B96aKdXyjjrtxpNOk
         aDJpxEJJlublBMaHkzE9QlxMGyxALVgGGpfbz/8NcuLhtrAAp0QURNEBe/oBLHvcITMc
         evbVSxkQJs7j2OTTEM+/EAEi+OY7unwSX+42zD6N3d/zKRwT6SXP047nUAqCmO1tKnaP
         G04VzI7d2dxhMebB3gQLkCyGQFwvJyl6XzH/JDavan29OtAS0+W+gLmEF6bDdlZufNe2
         GpVw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZxBiBGxP1NWD+gld4JzDBA2irSHafUB393b0XG3x+xkwU9oHrFC3wt2vG0cX9/WSMm5teyEoSHUOew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3ztInO1EIcq9YTowG7v1zrXt46ne3N4lXkD/IvwWozP2kZiSs
	a/vom1ab4bUDnAivRo2+BNm6rG1j0mzMkS/RSApTa76OmDKyjlGDe0w4nbfTVH8=
X-Google-Smtp-Source: AGHT+IECw/I0U1e01X7oBf0kcDMUr1gGhs11sh52KTHDqUQ3c8u7qUnUBttq9f379hVt7YOOIKw4Qg==
X-Received: by 2002:a17:903:41cd:b0:20c:675d:923d with SMTP id d9443c01a7336-20e5a8f23cfmr114568735ad.39.1729432291432;
        Sun, 20 Oct 2024 06:51:31 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee63f0sm10554935ad.3.2024.10.20.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 06:51:31 -0700 (PDT)
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
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v5 2/3] dt-bindings: riscv: starfive: add deepcomputing,fml13v01
Date: Sun, 20 Oct 2024 21:49:58 +0800
Message-Id: <20241020134959.519462-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241020134959.519462-1-guodong@riscstar.com>
References: <20241020134959.519462-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_065132_814916_17C44EF0 
X-CRM114-Status: UNSURE (   9.06  )
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
---
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
