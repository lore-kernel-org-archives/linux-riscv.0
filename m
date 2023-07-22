Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1F8C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 21:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HA6esw0f5Pb89J4CIUjF4YNqmJeOZumddE7ZYUfJIhw=; b=boNM/M7Ca2Oa3U
	eRF4wpxpw9V9xwUGEwsfhLLXG83w3ZPgqs9OISHfYZelvhkd63GDFZ9TYDPutSyvR/uqXpj8D52tE
	wiNJL8/iAHmRUvW9LWaZP5eH9fCitK3uvQKG94xLywX9Nugh1zoYLHVX3jvPqVZ01i+4njvPcEu6O
	/JFKQ1vTQR7WIjS1z0sUpoOCpo7wdHKQldQLOZt8JJk7b1Ullo5fBXsAk9P9rHndEfNctckvPVAuq
	/LHX/RlFh20yALf+GyOXy8EERnpBihh5Tvdc9KaN8m05McJWqpSI75phS6E0WUh6TsfoxHjjqB6ry
	x0l+q/3Ui/ON95iq62+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNKa9-00HM7v-0B;
	Sat, 22 Jul 2023 21:56:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNKZz-00HM5R-2b
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 21:56:05 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-666e97fcc60so1817249b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 14:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690062959; x=1690667759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op8r3roG6OOa9Lv1oC4Z/qAoTQvBrQgFrwVjhxRoefc=;
        b=mTdJFi4UkmtcIztVWh5pYf8zH4Z4pB5cWYDL86PAivIdbNh9UfwYadaN9XjWHg5S2a
         AgdVNuWOQs9lRuGL5m3CfaSWhAnKLNqWgvt4VqbAv9X3828cCDCXf4T/M4IfBD9c/dfp
         Eq7qlpwUHmok/4vGNAegu6ixgsSRvLK+fyp+N/hhC8jhLjC5in2DRiVVMuH53BcBLx42
         7xk0vkrr65OB421xPAmnwhXICEjdNIlzPro/O9nBJo7Xejbi1OUeluzoOOyAof6i8OqL
         hpGXy4vbuNMV0vv7zLjijyQQESkc+EC/9WAuzjhPCAxX20uFGlnzc9jzzYwz+oaUp923
         lMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690062959; x=1690667759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Op8r3roG6OOa9Lv1oC4Z/qAoTQvBrQgFrwVjhxRoefc=;
        b=TUuKBfKsGGej6lAt9N8bld4D4+yoswzn8ya2zqp+7o/nAls5CBvPxSvm/jumX+bLTM
         Vart8KFERcByuE1YlZRhjPnnaujNxtPu+S7Oe1ZwNaY2RqjPRkvo86stMb6+HAsBjyD1
         GPbm9G/0TYM8rsqzO91DGG1eFEgmP3Pe9KHU6TI/0+jGfxy9A+Q4zHGN0hKe8XjKpdra
         6q+tgoAgUsHWuVjPG0ncTkNCS6VydwdfA5hEXqLXUKrFIKVf9EUUbqAydYu6DZNVF4+K
         9aazCE2QiwkCvxu3sEaG3hkJaR203dycIzk/O9uELvfl+3haUSSryMj7rdcDJGEnSqLz
         7Q5g==
X-Gm-Message-State: ABy/qLZB/3HXfnQriQ3kVQij+7me88rE8WnPbx6slWK9QaF3x3/iPSuq
	lkPTFmLr3kMEm7meO0wwb6zLIg==
X-Google-Smtp-Source: APBJJlHi9uPk5HT8P/Bh1fdT5M6EBnO2qNX5zOmrDLhQ6F7I/qp+4TqP6xLAhgWDjArdpAjcRvYiqQ==
X-Received: by 2002:a05:6a00:1821:b0:680:6d16:8f8c with SMTP id y33-20020a056a00182100b006806d168f8cmr3608089pfa.32.1690062959005;
        Sat, 22 Jul 2023 14:55:59 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2a8c:966f:392d:7230])
        by smtp.gmail.com with ESMTPSA id e23-20020a633717000000b0056368adf5e2sm5517642pga.87.2023.07.22.14.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 14:55:58 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Sat, 22 Jul 2023 14:55:41 -0700
Subject: [PATCH 3/3] MAINTAINERS: add reviewer for T-Head RISC-V SoC
 support
MIME-Version: 1.0
Message-Id: <20230722-upstream-beaglev-ahead-dts-v1-3-ccda511357f4@baylibre.com>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690062955; l=651;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=YCC8HQBmQ4ArnnCjLKzrNbZrbvachARgWcNH5nyq8v4=;
 b=DD8uZ+RrE2UU4233SPWBBZvAtSm0Fj+EF7e7TvOfSnv2VL+fdfssMjERfpDTyWjmqIZU2m4G6
 jzN0MYkPTCsD5FC+ozl+/PB+Qr+QiUL5Kuhfs211l48QYFTbmDmmQ3C
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_145559_852474_2AF20F48 
X-CRM114-Status: UNSURE (   8.67  )
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

I will maintain support for the TH1520-based BeagleV Ahead board so
adding myself as a reviewer for T-Head SoC patches.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d516295978a4..eaec3333f2ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18326,6 +18326,7 @@ RISC-V THEAD SoC SUPPORT
 M:	Jisheng Zhang <jszhang@kernel.org>
 M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
+R:	Drew Fustini <dfustini@baylibre.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	arch/riscv/boot/dts/thead/

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
