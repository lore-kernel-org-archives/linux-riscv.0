Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5BAC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlOjlZjvHnw4y+3++QZ3TO0uJMwQ+C3KOhyGeRwEx5U=; b=Cc67/BiXro/KdY
	YD0AeC7wSnV7vf4zIeC76v2yNxoGD1OjhaZRmNLdI+8ljk48UbFuM79GBLDDgYMSlePCQC75HAqnS
	TPXKKdaCQzeOVDgz4kxuTG7TtiRB+9r3b56CwZz9/AqpvlzuzooAzN95WmvVjT3gwk0SrGXFWN7oO
	d9o9Gt7pBGn91tKqQ25LjCGolZPcRscyuH1UyGBFAHara7UftFc60R2cT7H26JzcOvvO+pJ3qb+t2
	+ptW702ssYbDKSmR0/JriV+TmjS12wZI2VNk0Xp2CHrQQZuyvQOClYrfYMtZl5CGS1/YEpJ2oZfQS
	NMNLXNqkLR3vNKjctwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8FH-007TSz-1t;
	Tue, 09 Jan 2024 09:18:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8FE-007TQB-1m
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 09:18:02 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3bbd1fab03cso2554828b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 01:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704791879; x=1705396679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H81WNcgEuRcj9vRkVpM+pIQnKvMNYSKJ0QdzyPMV5tY=;
        b=ZLQX3oe77eWp2FkPITxZj/R/sn2xCBcBYWTdnHPVKpRjEnFMXIMTx/ufls5Tjgt7eC
         gVuzH6OA6v54/9f95eSWFD2+FDwkcFTRygEhWRRDPa0tsUhxY2sheiBW2qPsMSpG232p
         QBhEnpuBoyQMILe3ZP19ND3iz2WTtHFJ9C73f1zPiZYkuL+5bEVbiXyH34CL+FaR162r
         9+Ath7GzynuA24yH4RKcEO+jvxlzq+rl0IMoLdnr4mMDQ6EDX4zHhBUz3dZjWxfK9CG6
         QP/BmoqvvZQChbgrkU7wULddrgxxjei9zmawfOH0RzUCBz/Ro1+TMDTvPweMhzrytB9I
         TcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704791879; x=1705396679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H81WNcgEuRcj9vRkVpM+pIQnKvMNYSKJ0QdzyPMV5tY=;
        b=b7LzAYt2UCS1CSKaqhO7FtoFsbaKAp4x7Ll+xPe+IFKhDUO9WBK6DYPXD1jbGn9L1N
         2iUqoLPpYYIoRwSVqoBM/jMWqa90Pzrf8MWWfLDX2x4hI6xZ38ktnXRnLHhGCXr+w5ia
         9spbOTJuI9re8KWlxbxaMxlnMX+D4WFZqunkEzj6mDIpOLOegtJZdiWIXN7YFXuWzgSl
         rG9T9sNVj6qv1nfpMbRZBWW3YT9RSkDP/HL4vPN39ZsCFHLbuSf/LL687Kw3Un9LYYKY
         UfvZfMs0eBoEANQALyuVGK+lZlig8Nq8a7Adck/Hwj1/cuD2IlM0POKed2dAAw7mx5wC
         iohQ==
X-Gm-Message-State: AOJu0Yy+B9ePp5d2ioJeoo6Cs/TUrCZdv6p69uD11IdnexVqzerBk1E7
	7I/LnWoI/9Ua9O8K1shjVps=
X-Google-Smtp-Source: AGHT+IF9asNbyA9kkyAZ3O4yJzTefiBP0hcPNyNfOXkQmcM6Og0+Eno5oA4eW2Y9x802ozv6mjy78g==
X-Received: by 2002:a05:6808:309c:b0:3bd:3fa9:426c with SMTP id bl28-20020a056808309c00b003bd3fa9426cmr235310oib.52.1704791879121;
        Tue, 09 Jan 2024 01:17:59 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id o14-20020a05680803ce00b003bbe0c5195csm276580oie.26.2024.01.09.01.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 01:17:58 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 4/4] riscv: dts: add resets property for uart node
Date: Tue,  9 Jan 2024 17:17:51 +0800
Message-Id: <18e1093a7f1357af7d9e9df12ede2e99725632e3.1704790558.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704790558.git.unicorn_wang@outlook.com>
References: <cover.1704790558.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_011800_585041_EFE5C994 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add resets property for uart0 for completeness, although it is
deasserted by default.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index f59081d4f0ee..03266f216021 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -327,6 +327,7 @@ uart0: serial@7040000000 {
 			clock-frequency = <500000000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rstgen RST_UART0>;
 			status = "disabled";
 		};
 	};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
