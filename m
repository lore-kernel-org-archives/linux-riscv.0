Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5192EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WsIr4BQnILt87AXEshoQ/k+oZwUTck1kGuMqMyGefZ8=; b=AJeDbuLhGi0QL2
	rP6T4GbIf1/BJu9YGLSux1+3AYfNuc8cPi9BezT3RwnQ71gP8FXN+lXlbNRXmD3Z5q7NvuFxxrjfW
	EFdIt7rMIL5N25nFKyrYNIbK5Bl1QlMvI4zJAkzjnbh5qAcnrZO5dqqidp8eILLTcCSJ63Ybi2F2w
	4UEgg2u3nswwjEWXDh3TvjASIikwut8ZszbmtE6dv6MokFUtTxSNrlhCQD69erlImfX5uhan05q5L
	0gQJsePZw4MSWdh2JbNfq03k315TogM8jMgtAAL83AE2Khzih4LALwvQwv3LsI5PXV3FJiSx+cHvh
	ewKX3KeH5UcH8OgEUhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9oDH-00FBrJ-2O;
	Thu, 15 Jun 2023 14:44:39 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9oDE-00FBpz-0T;
	Thu, 15 Jun 2023 14:44:37 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f762b3227dso1114814e87.1;
        Thu, 15 Jun 2023 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840273; x=1689432273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OVYFBud63oBmzgiKeGVku/0LMDSys68f5xBbeb6bPY=;
        b=gvJvlhyz6mGHxA6nEwkgEECKteCPa2XcgRP0HBANaI9uGOK4+v7YqzECwuC3X++sJX
         hmcfk1TB7MorQ53pXiXkFZwE2SnZ5yQzfR5IZkW3JROxBQKCJDev02f6ceBfUnJi/rAN
         wgUhMIn1iEQYRglCfEFTaaeiIMNYZmsFK9TiX7QIXc44bPvXovr0hRQ92G1VaCWX5YtM
         XKkpbbX6WZRNoclcYpz4CdcmOFpXy6eTajJ73BHS6wwvX8QG1gi2AvEEHO37TKs40+5l
         WE76EUYGaOl1joKIc2rXgiudqb8+ZYuylTmuEG7i0D/Kjj1c2WBpnWX0BcZ8+9KeFqr+
         ehGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840273; x=1689432273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OVYFBud63oBmzgiKeGVku/0LMDSys68f5xBbeb6bPY=;
        b=GBbQvD1dpK6bWvnlhjoIKtFvxDVXVdNzN7TYNcSeitxq3CYkJBDGw/cONSVPf+Jwa2
         lVI7mrBEdVvvVbOn/Dp0ohn2D0vSuheJVXgyVfm98kdB6yxWaWkL+bzw5GYh+w1zwg6S
         rsMGSROlYjXmkvVBqFP7yn3VFcML/q7aJ+m/q+kxh2IrLZqC3VklSB6Rz6B8yR6Sfi4P
         NuecMoEvVO97ABA1/uD7kEIs+2hv3XrTXCvJN8SlsU/OfnvXMwCso4yjLFvdPBQxJWJo
         2Ysjdl79wLD3MN4AR6JIZihK2f3t65lvzelHNxcP34o0hqXwenxDxol0HlDTLYS+783B
         GNQw==
X-Gm-Message-State: AC+VfDyv2fHt8UxsSAK0EE9eaUag93dsnOmqBRwwc4c7+Et42Qx5gDUo
	DN38BUxpHpLKwDCB0wRgcA==
X-Google-Smtp-Source: ACHHUZ6DbPaMv5ulJSq95WK2pTU4k2Fu5q20+cJlSAw29Dpc0bbyrB4k2JLeuY6MVfaHWXKm0JpdEA==
X-Received: by 2002:a19:645b:0:b0:4f4:2717:7e6f with SMTP id b27-20020a19645b000000b004f427177e6fmr1101587lfj.23.1686840272990;
        Thu, 15 Jun 2023 07:44:32 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm244451lfp.186.2023.06.15.07.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:44:32 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 15 Jun 2023 17:43:55 +0300
Message-Id: <20230615144423.828698-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_074436_182369_E17165D9 
X-CRM114-Status: GOOD (  11.95  )
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

Hi,

This series adds support for PWM controller on new
Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
provides basic functionality for control PWM channels.

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  70 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 364 ++++++++++++++++++
 5 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
