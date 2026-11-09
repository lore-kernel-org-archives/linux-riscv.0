Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702E6082BD4
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bc+hQQy5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hw5YPMe3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kg2lUIrW9Maus2B+a1cqPCzH+0C8CWUX+W2HgL3mixQ=; b=Bc+hQQy5uM3v1Yl22i+ZvIIkNA
	NCrK6FuX4ivgmz/1AMHbBYHuufJw5Q2ZGxX8rSMXYrgeb4obuKTFZKxO4uDE2T65sNqP3DtavSKb/
	1znqAZQkOi9sp5+4/G5MsPAI4xf9MU3LozEoLvzmqTB5JeWD0DOLWOac0XxweSlxTBcMC3wWcgwQA
	pgMi6XeRIIVKu0Z4tZZ54XA6GWp+LI3U6Q2If2OSgpdaMLpEU/LBqlvzyqltCAo2sg1Ip6TTk0RC3
	/V6qEs4MKZZX6go+gj1LudmYYqbplMD9NclX5oIDG/OPSeAAWQblCS5AKdf4UjBjgN5k6IJqkjnxm
	A3BO5bGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYb-0000000142Z-0fXo;
	Mon, 09 Nov 2026 15:45:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYU-000000013za-41OR
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:45:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so15097035e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239109; x=1794843909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=hw5YPMe3WhT2qnL5oklceQjWkKWFfGWpXa6xpSZlNenaRVWRWKup3DB4x+TBqFtyOX
         QeF6BVdZadkuhQmgUzcRs671w6OGnYSy4MUiaGl+2gPW8BrehguBOLRxdPciv1NOY3PL
         F+J7sehOYy47EsbU1JjUCnks0kZg16eTpirfePerOoHkxrFWs9FUiOYJhXVp/obHqI3p
         bIuE5184heaQFxQDiKkYfH8OnUl8JKHpj+sjODK0T+kSgXJ3c0D24bH0qzDyoenzgM1w
         jamCSs1iU1aOK2KM3c7GRiVXKQYJT2yaGs8VZCKuTUXzZ8KQfqwtadZVA14Jw3FgqCBg
         sOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239109; x=1794843909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=QFjfpHGTxe1rQFJcCGDcqz1PJGjS8yw5qSuKcJzX9e1zCVu38mRR1FDvxtZvZvqoU2
         Rsudv8Kkgkq7mtATXmIFqU4mNuvChI0LB8cOZ3z1wV0OTxduMPIRT+83Pp1RxFhv5fwf
         TYGIYK09JVGbYT41d9A9+aecmgvH4n2k3cjoULYVxWwWNE/FGIfAyJxTLl1d+1xDxNs4
         o90GSBuw3l5qXmZ3K3gXHyFdVGGRO086NKBUdnR7xXQ/6/1fWYDb1xVrwdWKZe1dQtBq
         OLwsAYVBEYeropYFBRLn26EYrIaNpGNHr0Q+r+pX5bGtj2l5+S9KhkA4u5W85vZOTyP2
         3Ijw==
X-Forwarded-Encrypted: i=1; AL+hErH4H5qTpkZ0KwTV8wZc8aY18kCWaltje8lsQjl+SzRyLfZNqwMuPtkmPF6sp+aSbiMwOZ/iHNQClyy0Vw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+rXf1MIr+WTypuRvfIkIcehrJHReYx9wV+/4BcD1WbyFUsd1TE
	bMBz5UD5A9VeOkjzantG7KlaFd21MSKSA726Xm06AsMgc00h95EG3np+
X-Gm-Gg: AYBFou0cQjZ5fIWtnY4gMHISfZXiyr4URf9wITeHZEvP3wnC9HnI6MWfqhwbthUkJ8R
	zJNw7zo8EuaZy7vcl4mtbKyTV8HLQ4Tl7NcnSSIvNWBAMCmzXw2Gbxx3W02Jctr+v3Oiavu4j/B
	4SDFsPNvewuitOErImLJUviwNqSQDU9B+ZiUB4INI9nKqE6Gx+au4VGLPEmmkHN5vy/SQdrif+7
	4W4ibjxnO/ChPX7PBZtQ3YBrbDQn4DOnCPgbLLANCR58cLObBH/PodCsd7jhEhewLY54bZPaXk8
	zdXq0bEaHXt3QhJuG7gZW0e5RczhbOETL8CpWouxu8TbyIavt6IysiazC6G9f5v5AftqsXU1PCZ
	1xwm3iyA1sETV6+QcHggn8DOQrGwmDInOuorxTvQj5pzoOWgrz5uTZ+C6jVfiKn/hQJPlOAZ+9t
	AyV9Jsnp6wK9J52m4lIwQiQAW+FQqCvpCrnzPENC2wh8CEDp+eX4KX/hNdAcN90Lh3CjuPXRMLb
	uDpduCfIZQBmtpyKYibPBnxQRFF5R2nQYdpzjgdOBHo2/Capr4U61a0mCwJv+1Ohllcg4wd7Eky
	/c3KpNHfKc7OJaREu/RvMCXKxF3Lf2DyfQ==
X-Received: by 2002:a05:600c:1d08:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4b960d9b26amr81779735e9.7.1794239108805;
        Mon, 09 Nov 2026 07:45:08 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:08 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 3/4] MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
Date: Mon,  9 Nov 2026 15:45:00 +0000
Message-ID: <20261109154501.63762-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074511_046578_10AF780F 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add myself as maintainer of the StarFive JH7110 RTC driver and its
binding.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d3..2ee86a46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26877,6 +26877,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 F:	sound/soc/starfive/jh7110_pwmdac.c
 
+STARFIVE JH7110 RTC DRIVER
+M:	Owen O'Hehir <oo.hehir@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
+F:	drivers/rtc/rtc-jh7110.c
+
 STARFIVE JH7110 SYSCON
 M:	William Qiu <william.qiu@starfivetech.com>
 M:	Xingyu Wu <xingyu.wu@starfivetech.com>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
