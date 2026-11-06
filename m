Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C447C606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H+qd/WN2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbWp1JpS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TxPBZLfB14oW6Axiq4gSefPySLxmVo+8tY4UiA+sU+Y=; b=H+qd/WN2WmZSmsLHDC7x6zJXCC
	lgZmI/2pBgcS8udIto5D9PTGjPpWLFkgm9FbursleKN6CPQrS8bArvUJVf6NrqLwlblfA6IXQNKZ7
	lQ7ZF2JNcexhGTMW2Iap9MMavMX8bGIoFlNdErOCkXigsG36r+eIKlWqayJqAnvsVmM+pACT+mgHK
	5qKvCgwZRTFPyag9mIY26FarChIXEAqR0aJcUk+W0FuJwGEDwBCA2j1oLkw1rRXwry9a7jqEm/ZV/
	+psuwsruehgdZkzCEyTpK6NG1GnxSkPY1dBb04G0RHILP39YVtU9tWETQD2hFIK/40/ehokquDyA+
	l3JX/mNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOs2-0000000DQOc-2Hdv;
	Fri, 06 Nov 2026 18:41:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOrz-0000000DQMw-3lCP
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:41:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10737805e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990458; x=1794595258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
        b=nbWp1JpSDN6XpK06qco3LwhXyZgCc8dIVS9/HyUR6QzSbZTvM9sXD+Axn559gymwK8
         /Y+abDpOKpczW5CBxF8C6GsDv7SF07E/XCEweKHHsNNWqZv3q+LqyEoFT3ClK1EVSfm9
         i/rCMK6+qOefYFYBgPBOxAWEvewLZmPy1ExR3WfeI1BHK5yYA4ikWUzE2DpspFkGyGH0
         ymJMMrvrR8fBP5yIam6/C9lSqUv8p8CFT5IolBeDCEX/7nRmaf9Njp8vttQSk+8yYNHj
         ybFhavZOHPsyDZwvM+DIzczDX2DxlNZWmQpgHDIzG+at/qb8Q32Nr7hHVGH7C1RawSQD
         hHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990458; x=1794595258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
        b=TgWdLJdNuGrao2WxgwVte5ik4wQi/PvjIsrG0DTUzQ20+Bj4OAX6nkVhX3JsJwdhdZ
         tRprZ7d+Na/3xHkt2HX2N/kiaEg9zmfmJHELQEZSxRTDXjGfWjlD1eLpGQ/tfczaLr+G
         7as/ZhkRqnnX6pyVvyU9bdTQ/QCCstxX7HgbF9/c9JjnXMdQC1vWM7IpBAWp30SYl3NY
         icg3VkTG1I6v4J/CjdNjDDoGQpcluQLTPVkEkw9aXEark24q/jqSkqruDYu2DwoDn1qx
         0tYNGgYusr3FnjrqE9cutjdGqFdpmwQFeseJ6rWXGjavjVbwfZkMq69K4WGbhXmz8fBX
         Fuug==
X-Forwarded-Encrypted: i=1; AKwUvBxedCblkcdTm2/EEn9X/orACFIkW8U7sPuOoT+7fZsvWwl+0rh0BQ1kFhTn3i5GiwHjjRYGi25BwbAkhg==@lists.infradead.org
X-Gm-Message-State: APuU4Z//4DQJamnzDRZP57FKLGMdUGK9OPjWX0pTXGnuSZpkRVufM5lz
	46UjcisW6kc7KQARgbNIwH6ylWY0DiDkM4hH/aHXilQXS1HwjBCyAcUM
X-Gm-Gg: AYBFou3dyEHCWk/eglolsNwrKkOlnSVNp0sBKlNb+2azqyFS0Ujpvy+cWe8GQcXSkgs
	Iltmto6l7TDnknCZU7pAsxRUL9HxUirLurMST+FRCj4b4zt5EhS8kZqBrKc4ep/UGqEdS53LgVA
	X0ZEXNCYC9l5G/6WVFEzBcIoXb5GcmeVLiHlDeBWnVwfQ2zzBEzHuS3F8XhbZnJEZ36I926OUqs
	xJcsGAC3pWdgI78gr8QiQQG6cGxnzK8SQ55GepcGXYepSwCAcoL6qO+A6tGXjhzUb5nwLX3zOmV
	N3kki+S1ltIwaVHHRQJUCUIaC+kX+e3sDQBIDhCigU+vBRNph7vlp1V1E/gQLsliMmWQHfCL+yK
	cEz9XnIJsM7mGMsM87lloBvnaGUUxkvD8ZQE+PoqkZEkY2rbyEua6KyLFdTOZZBPHytWhXrZgyb
	iNeeUHD1iwMA6i0tWwB1mKBQD0RRWa33Aw93giC5WFJmZYAQRZAGo91pmv+gFQ9ea0l0wc5AZ/n
	mBGojwnKAZVmWRw7GNyqVhJArM8bPyJoZxZE1D7F1o96uRN/My4yuuQxxLQ+FMCcBWsamFLpaxu
	7VD6jFEx/nyZ3AQU/uvju265JMGiu78=
X-Received: by 2002:a05:600c:4443:b0:4b6:b2cf:3088 with SMTP id 5b1f17b1804b1-4b6ddcf59abmr64076295e9.14.1793990457805;
        Fri, 06 Nov 2026 10:40:57 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795012503sm3874945e9.2.2026.11.06.10.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:40:57 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 18:40:55 +0000
Message-ID: <20261106184055.3891621-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_104059_940541_6DF0FDDA 
X-CRM114-Status: UNSURE (   8.02  )
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

The firmware turns the status power LED on, but the node has no
default-state, so the LED switches off when leds-gpio probes and the
board looks powered down.

Default the LED to on.

Tested on a VisionFive 2 v1.3B.

Fixes: 1ec99dfe9eb0 ("riscv: dts: starfive: jh7110-common: add status power led node")
Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 64de468f2..7ec94e968 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -44,6 +44,7 @@ leds {
 
 		led_status_power: led-0 {
 			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
 		};
 	};
 

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
