Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838FFC00528
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69A+m+LKha/xJjDnZi1q0wQ9klr5uLwgoWcXIdukWz8=; b=09gCRUlDKM92Dz
	4KJVevWzqTdJBRuxPxQyI22HsMoMm0kKGZLcE6C25ygfjQYrVv28O3sKMXJAH8qW/r75AePEODVnw
	yQLbxei2Am6tomMHSlmQ9GdfvTM4xk/YYnkPfpPrR1lxiYgX1vnZqVuxxEhleVjisN+WmhzDGvebS
	ku9DrR8zeifDLdRQQYuJEWfAzyZa5/iwQQSfJT8RBx3cyDxwwKGTcXj082sc/CGsm3oKHMhcv7qgR
	UKLHf1A/g4M1mR3+UOMiV/p1seuoE8/eqZzFszR0NOPOGKvKYHpq2gFwDQVtkQMZLkMRQV8Zrk3cx
	D4TU8p2PI689Xqqd0cCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEt-004zgG-1z;
	Mon, 24 Jul 2023 17:20:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEp-004zdy-11
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 17:20:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b9e93a538dso23702735ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690219250; x=1690824050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buBAvhZqaa8ellf0YVL2gYUlbECC3xBJTY5raF47z40=;
        b=gTIM2kB4vQQaNdDtcqBYuGiP1YsKpqqwI4J1t0SFk8H5M0rJjqx5ap/Yb1U+i2RgzB
         N1LINAqF/Bkn3VYnI7CWayUCXVONVj9/eVYJlAr887/L4rqs9GVRvss/TL84viLPOqiA
         oF0R58MUV2WTaO1AGaYrQoA8+Y47tBvqJ7DHPcDubUyICr8cB1GxYnA0ONhjCfg0KPcI
         6hh2aaB9pM9rwGfzUk86rd6Kr9NN6ybIiJzpg1YdAS/Ahg5EBlwXQRblbUkI+56bG/8V
         Jj8LPtIMdnR3w4NJBYBVF5+4Ad2Q/uOVXlx+eUBY31pC+zC9ZM5FsRua2b/m5q2ZnATO
         YrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690219250; x=1690824050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buBAvhZqaa8ellf0YVL2gYUlbECC3xBJTY5raF47z40=;
        b=OqleAArgiAXcILO7VkjCi3CBVp7Q3AQ1miJN1IpZXwRutxO5LQCNZI/wOCwcwgMPMS
         oissIn2RCr6HXVWOFI8xPSaCB2bpdwRpSr+kD596VvAtpOs1dbo3dSnEeB+f12DJvdVW
         nA7yJB5LaQVIXIGjWLJj5JEw40gj0A63WkyC+FY6knetf4Tt/3fhnXhHZOUqpsmqy4Kt
         COkf6RkFeLq2N5MfZqDSvrqCZEC6xrgcn7acBdkXK/ProZKvhP3jPhcvQxv3v0Visr5A
         9gUT+Owz+HnHZ464P/N8rL5dKwuNvmXG50g/oW+lLdnwIv1te0QdGlelHGgqK71tsqo9
         HKqw==
X-Gm-Message-State: ABy/qLZjLLjIq5mkjH64z+CyplgvmVcERo4MUaetpSTR8JznUEpEPqnU
	DQsAnNcDhlR3yxFl/SfAd0pflw==
X-Google-Smtp-Source: APBJJlG/IxYNfpybnNeZlu9o3AYDP7AHguXUXVbPH7ZH/lPZnrbogHAsCUknUq4NkQUKFozLSPOojw==
X-Received: by 2002:a17:903:2445:b0:1b8:a7ec:38c5 with SMTP id l5-20020a170903244500b001b8a7ec38c5mr9892478pls.57.1690219250281;
        Mon, 24 Jul 2023 10:20:50 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b55a:eeb0:a3a8:248e])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b001b9cf522c0esm146456plb.97.2023.07.24.10.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:20:50 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 24 Jul 2023 10:20:40 -0700
Subject: [PATCH v2 3/3] MAINTAINERS: add reviewer for T-Head RISC-V SoC
 support
MIME-Version: 1.0
Message-Id: <20230722-upstream-beaglev-ahead-dts-v2-3-a470ab8fe806@baylibre.com>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690219247; l=690;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=N7smB4Nhq9ThR0Q1dQ2d331OISGVCJweZ/uFlnD6UHg=;
 b=FNz0zJqz+euHHhcYuXyOiAUhJaKir8B6iGinHSPE63Lf2DS6cE1glAO/LHqp5Sqrmx/BMVZa1
 hsScI33sFqlCEFYGOp8AW3wDdEVehx92uUHN3nisXao4EpbUTZsfmro
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_102051_606132_96E8FAA0 
X-CRM114-Status: UNSURE (   9.07  )
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

Acked-by: Guo Ren <guoren@kernel.org>
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
