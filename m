Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38302C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 03:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVbMNSoYywP/SfF1p4Bqx/7J9DRrDQxOO1JYGQ+VXbU=; b=agEhZlmXzEBOdL
	i66hu8+409K85uoi03K9lEKR1nct+J3q73PVcjcmPij4mYk8bUvKJ+Qegse1zYbpgK0KjfaKOFNpp
	N8ofOtTrEaxvy8Yoojty+GwXy5LGuoPH9HIH2OiPPKBZWHtoL9Y27OgPsZII4KXVn6tQB4hJjir5+
	hhQxzI9g8ED8HRXqbUd00xRVsqb6YJ5xTHwfGcJ5WSnGTCmMYIidMoFImYWQTAL6UGLqyD8rs4A4A
	JNheY7Pn3ZBLxVm8L16zilbgQysXKk/mzA7XKlaBUwhRiNxxITEHAKg5ZbckPHRfi/dp8Rju6caJK
	nhkt5oT8HeVkYHwJIs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSus-0000000HXoS-3Hom;
	Sat, 25 Jul 2026 03:19:10 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSuq-0000000HXn1-0hfW
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 03:19:09 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc6bb7476dso2172565ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949547; x=1785554347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=HG8Op+e7J8APO3ZwWZdaxcAQqQTyxJxw0SsN/2n0NvM447JvDw6twVIxXW8t9eDni/
         k4fF5lblIWfBw6NegPI2txoWYEU0oU0IKFT4RnFAo1Q4PHnf0GIIzMWcIeG6ypBrZMDh
         /j1zsnesiYzlaScdRYwAuHd9OGGvWiRiJsJF9783ugKJYNA9vmfwsInQ4rnlqvt2A8gN
         IXjwHqgkkjrAFoziLwIR+6LiHF3NUOhmH6EqIXI34+pm/xYOT2BSxWlBLtpiN0fKaoX3
         73yqh4hlikyr1odR8ZPNm3I5ciUuUMwzn0KAJ/5IudhxQ4GvZ3hy1DO6d7t2aVF+d/pG
         co/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949547; x=1785554347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=n2eQRcOttaeC3kywgSLlm1sOq41xjFB8jfjWQYSi/MkQEF9wuZdg04ivthMAkzm/95
         8vvwIJF/K0FBhDSAOSbwoo/sM64MaXVRH0t0WywstGnLip9akpGAkzeiCbL5qSY3aQ0I
         TiNBcv8/rOnof5Ylj01wUbu9GdY7D7jVD/f3zpv9AX6X9MzxnoY0q7lXXmKhPFaspj68
         zBeTqGOk3hSXX02IUleQHc2DFTYczBP799DYTN2+f+cQAYdA+EvSZ+yQ7bsSGj0FbD5A
         iYHlFOfiHwslW5V/0xsk1DfpLFE328ZuQ2sm+e7naWi4z8RxPtvt+RxjO6HB4hjz57Yt
         wtfg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb1saOLjFyXYunFK23QtjJo+KyLWKqxHdaFm4XBln4Rw4JTDSM52y6AanMX5N1dq1La8/KmOoC4uZgiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpjPGZM6OKImyfMa5y7HK7FJrmA0HwgW0U5m7ndlLJ6dfWO9r1
	m+n9ho9kDE/H+ZffXp8uscw+3P4mFxDIP7puaUKvzzIRlrCwgkIOy3Fu
X-Gm-Gg: AR+sD13+RfgCDyJKEzmWSAsva6B50XhGOqRyP6T5JFDckNRFRdnYQ1G7fnLNnfhObyy
	q/AcIGhxc8XHA4dYe/CAyyN/lsO6z7Iyc2E3n2ZKBwJMhWq1Tb+eLX5oWErkUdlaMkIphhrrE3O
	dZOwYL14XbH4ytm0Z8VRWYRqmbiWa16o2CzocvasZJd7e7+nzyRzskYX4PB5nGlFUOYY3Dkkx6W
	8xcaaNWcJOSqmapIiJKpqIBLJLFUI4ZTuXbHzagjsb2HQZ6IQfkQgaz6gD+fGJpWXKY7XUjclpB
	cGRc1+BXifaJsSuRd2iCtDy/YDhLBPSOD0NcbbfbQmyFsjXc90Oe8MdZMrSQiGlKJumzBqkbhaZ
	O3Ziwyq4zYfpgatjUSIi1GVowg/AxJgflszG+lbhlF9pVIvcoeDhxcJw=
X-Received: by 2002:a05:6a00:852:b0:847:9919:e772 with SMTP id d2e1a72fcca58-84e595426f1mr573194b3a.21.1784949547576;
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:45 -0400
Subject: [PATCH 13/17] MAINTAINERS: add SpacemiT K3 display driver entry
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-13-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_201908_225201_2956B596 
X-CRM114-Status: UNSURE (   8.19  )
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

Cover the Saturn DPU, the Innosilicon DP/eDP controller, the DP PHY and
their bindings.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dea93a41962..9f2910a17c38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25436,6 +25436,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT K3 DISPLAY DRIVER
+M:	Cody Kang <codykang.hk@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/spacemit/
+F:	Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
+F:	drivers/gpu/drm/spacemit/
+F:	drivers/phy/spacemit/phy-k3-inno-dp.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
