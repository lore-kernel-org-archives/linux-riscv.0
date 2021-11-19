Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF3AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 22:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhqJbDNnXVH2IxqsM2oPc2RXRbczkw/bNK2GzpagV8w=; b=m4sJXVHB3YZSM+
	5JPXD+/HTrSLafJawhY9PNp67nVJvjwbhz+ct/L65VGEMbTaWEZlaykk3ZeMZs58MZVeGMeBdxigS
	AlSeS2mTWBDB5U9l/7VCv18br5sW33Yf+Ptxz/Gj8dDnUjv6dw1lVg90+j/XN0HgJ5Im7SPXqy2/U
	R42+4TYabTq3uiApYNnSB7BeDaBRNZZATr9lFdPqL0+6avtrndtUT5nHd38PSwL7Sbrgp2zMOyw1e
	ufegI3LHMems/p8ibnmIF0+t3eWP8fU//7PsnJy6UBd//VAgoQUn0U3g+cr+ZGu6hyajqyn81AW5F
	4IGTsnhKWwHiqY/QO70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCnf-00BkML-L5; Fri, 19 Nov 2021 22:56:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCnY-00BkHh-BW
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 22:56:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id b13so9259083plg.2
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 14:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3BXgwHgh3BDP05DRd5pJFiIUkk6+CLM31HGyYQMwJeY=;
 b=Frx4VYaifZTS407fnv9NG7briSWAEXoIsCXA9ENvCEqMaX0ZTMhazuAkaxifJxxgVx
 vm7xLygR5mqdhHbiGVD8wViQpplby8ewlZI135LLHGmw2RNBt5+WsUXEFfIaoqA9aScT
 e/NweSQjKMky1du7UAowfrUd6p6KuqddMwTkLWgEpgK1RdDowsI8tIp1fh99Zs92iWnP
 2VhTd9PMH6VVAtEZca2CH2hF/HSwSngnIjSaf3iWTjmlMpVrvEvwAu6jE/2L+f629FQ2
 ldfcL74m+rPEqnUU/BLsNZUGNPyIYyVFL0lkDAchfYK6vFlSB2Ib7q3aZl/lJB6nwYF2
 /jJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3BXgwHgh3BDP05DRd5pJFiIUkk6+CLM31HGyYQMwJeY=;
 b=qhTs50p5duDjKZjlmAU7XGrRC3tR2+8/S1vfreIbdPgAukcpP7JHBxOumMIUUfBeXA
 dJW0ORt8pD0t/3caHhGAPfpbNSH4Ls4+PYl+VgJ79Vngi+hNmoBdd+7e5rnHVSYyBTlA
 LdwmZHx2ncdT6bXvrqx14Sx6W/+K96DrbQ/Wv14a0ppvyyVmII5YRdU4b7XYKn0BKShu
 rskliiOdUnpxuIVotGEpzDb7rquJMfYVBb3lJG16vKwvRGg+xTdf5mPnI4rMbIMuXP2R
 ktyI4zflcb5rsGfJ6Cta2T7GUXCbiVYT0wJXZtBRZweBjVgRDssZDW9C1b7fQZNbGeAu
 5vPA==
X-Gm-Message-State: AOAM5305YF/lv/RxrWc29FIkuYPQTmZvULCncXbo/vw4T+VEMVYpRzr9
 aZwj+HYjZ0AKTamiVDqe4dg=
X-Google-Smtp-Source: ABdhPJw+3CUVUTeqDwOdVHAf6zdS5P4LubnNUoQnigVZtPY3y0YVcdgQXTlfSEZnf6ypStU1028gWw==
X-Received: by 2002:a17:902:c202:b0:142:2441:aa25 with SMTP id
 2-20020a170902c20200b001422441aa25mr81386651pll.68.1637362559338; 
 Fri, 19 Nov 2021 14:55:59 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id s16sm672553pfu.109.2021.11.19.14.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:55:59 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 4C93290095A;
 Fri, 19 Nov 2021 22:55:55 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v3 6/6] riscv: dts: sifive unmatched: Link the tmp451 with its
 power supply
Date: Fri, 19 Nov 2021 22:55:42 +0000
Message-Id: <ab42d60d325249d805d99db1c3981dd1fe9422eb.1637362542.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_145600_434946_7FA710FC 
X-CRM114-Status: GOOD (  10.08  )
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

Fixes the following probe warning:
  lm90 0-004c: Looking up vcc-supply from device tree
  lm90 0-004c: Looking up vcc-supply property in node /soc/i2c@10030000/temperature-sensor@4c failed
  lm90 0-004c: supply vcc not found, using dummy regulator

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

---
Changes since v2:
- Fix end-of-commit-message separator so change lists do not end up in them.
Changes since v1:
- Remove trailing "." on subject line.
- Added a commit description.
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 1abad0eec02e..1a952dec74bb 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -59,6 +59,7 @@ regulator@1e {
 	temperature-sensor@4c {
 		compatible = "ti,tmp451";
 		reg = <0x4c>;
+		vcc-supply = <&vdd_bpro>;
 		interrupt-parent = <&gpio>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
