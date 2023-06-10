Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE92C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XWaAv2GK3TjarOBEEyFLYeQz8EsQriVDHfUhbjK8WUo=; b=dFF5gK3v02hote
	DJWTHvEuTUYi+WOvNJTBvFPdIelChBziLDUqvIHbLWQZri/rasPWNYLa81dLVvxmJYE+qr/fIaWu7
	+Kqo3BtwEHvSo2MbJckRFqaCd6cTafrEiMNoz5dKeswdiui/mKUadr1oteVQO76irqRaB4MqVYh5/
	P8+I7WxokEy++xku1XKtv9LzVSIWLiVMjcm7IMDfaTvrtqBIG9LsaStZNqzb8yi494CWz9HMT5Zx+
	GHKjI4R77Exbaf0cfh0iFjDz5kHMIYVadRwFaVzUhBXrzReQJ2aJ2CepEdlo02hN2veQjerp9ubzZ
	szZXZ7uuOfziQEP6Mc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zPq-00GKyY-1D;
	Sat, 10 Jun 2023 14:18:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zPk-00GKwm-18;
	Sat, 10 Jun 2023 14:18:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30b023b0068so2022622f8f.0;
        Sat, 10 Jun 2023 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406678; x=1688998678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18qfsJwML2WETjitb+8UZsh0CX3sJjeHPfRntT1ssOk=;
        b=abCNud8TN4GuZ1vG0H87kyReB1a7vZKcnWUabKUl5jvqkBI2yUIZ+h9NyEJUEZ6yEp
         +pkbu/a49F5nmgMTiFyYwqMmyP5ux/Rdy9taVXcxiv6x2lonN2uANfH/17dqs60qTJVG
         NP3s91IwhV7Lt5gOTpJqDYRmz575uGPgQ0MQB8SUYGn9atOsbrl6JSoccUUGD6RYoBci
         fRTgIMe23VO63g4SDYjMnwntzBFLriTwbLWqOYMxTGQ5UHBlwr9yTWLfvcO8yXN2tIZq
         nfUojlEEk+RGZK2aUmJz6clRyGx+6/E3p6rutPQbRujWPlTBHtWRftCo/hZ82Auf5QRl
         mIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406678; x=1688998678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18qfsJwML2WETjitb+8UZsh0CX3sJjeHPfRntT1ssOk=;
        b=iTuIjuQ69v6Bl7zBgqR5c6sKDo/r8uNB+5EYtialgPdW3y8liEGScBzUCMRonPaqIZ
         ABe8l36N4Byed7s8eja7nn5F1R+GPUySBTSZxva/kkGha7dnpih2BEYgN9lrRCUBSYM2
         4o7WvI5vR9DH/MSV9JvlBvJPXmOjEbYK1Pg7x9YxKPMS0YQTD8eaU5A135BSQ6djEpML
         q4DUc5JflP1RM+IpktI5sMu1UET1B2lSJoCS46sianvXvx4DUHQCuJ6qtqO/Yh0gb5F7
         LXIciuOjKAQ0GU1l2GRrbg/sCbh4YgZ4XGcY1NKT6x7xdd6tmPXVDP/CMbywFtZ8+kqv
         P17w==
X-Gm-Message-State: AC+VfDwRbCwuzGAO+aFXU/3R1cqBoOmSeyWXLbNnqMr/dUXklzeM7ZSl
	un5rS7GBEHAng19oMhS0KAc=
X-Google-Smtp-Source: ACHHUZ5YMqHGIZnwmXgTpw+GIEM8hWEPiU7hk3r0PV6Gw4QXYai2MKh6r6WMLxMO74CwCTZ3ueTXKg==
X-Received: by 2002:a5d:4090:0:b0:307:cf71:ed8c with SMTP id o16-20020a5d4090000000b00307cf71ed8cmr1170279wrp.35.1686406677900;
        Sat, 10 Jun 2023 07:17:57 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm5841488wml.9.2023.06.10.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 07:17:57 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] Add D1/T113s thermal sensor controller support
Date: Sat, 10 Jun 2023 17:17:31 +0300
Message-Id: <20230610141739.999268-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_071800_419329_4B00DA73 
X-CRM114-Status: UNSURE (   9.31  )
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

This series adds support for Allwinner D1/T113s thermal sensor controller.
THIS controller is similar to the one on H6, but with only one sensor and
uses a different scale and offset values.

Maxim Kiselev (3):
  thermal: sun8i: Add D1/T113s THS controller support
  riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
  dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller

 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
