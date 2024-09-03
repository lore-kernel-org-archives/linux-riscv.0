Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E541CD342D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 04:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW0cY7WrOzO2vW4AGXb9ysRyw9wC9ye3H+7TfA1keK0=; b=C+YwOjqw9Bj5KB
	kbcnkrKjO9MxopL0ZNlCXMOYWWZ94Oub/NODf+RJ6BoklIJ2Qz/ZKbhWQPVTl+/OfkoUxAmYIJVaj
	O/q5gsztwgDqQ3UushQNdQgD5LELHaWzvHwldua+aAVSdPHWfkfsYnKBl0pZD7u95Mxmda446gofS
	IF0xTTSMuG3sd7nhUvZkehSmnSegUzEZMwcIORIOzq4sGDCx2z9RbIm0IkFu9tmeE1tIfyHBa7+/J
	XU8GAkkR0yNORGpDI9oMmK9h7kt3P4b119Yj7kDPIitTE7t33tfOoIbhPgTPhgFYFjNH+AQ/TJG0n
	omGBsIQcuDE0QdT4doxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqm-0000000GFlh-0GA8;
	Tue, 03 Sep 2024 04:09:04 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqh-0000000GFhL-1Bmn
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 04:09:00 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3df0519a3ceso2975812b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 21:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336538; x=1725941338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/oLJOaGdN8OJwPD6NoJC1cI8myFT/cKMaiS1JkV6LQ=;
        b=JzYxSAKzdatZ/ThHIfhLCQEsQ/MOQ43eAHxq2lIpBRu7ytD/1qh4kRZ6b+tVnuFZ0E
         6Yp7RsDY0JzEwjEIKuoHO/CDi+qHalJjd9qaJZBeybHjttMiRTeTOXqM8WRlB67xcGP1
         xEe35FYR7cw+WEGVyDk7fv3tKo1yvl0Gi8avCanNiK+kgXCFR9ibNtJoUlyv0+d7mhgI
         tXmlszVOG0RY+yYD01owPWX2FyY244lHUE6+9GSo0yAqLNRVmCk35qYFKQqfQMnSv1e4
         aaP5wZQvvZJkNbfPoFd39B8JnxAblqj5U2DJEURwo3VVFkUv65NoOGaicISrDMhGIxMg
         Um1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336538; x=1725941338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/oLJOaGdN8OJwPD6NoJC1cI8myFT/cKMaiS1JkV6LQ=;
        b=oZB8gkavKgoaEg0jF6i3rolcMFtzsXaPaid4Ft1WJ5iOr+LXC/6tGZeChL4WYNNJ8a
         leLWqHngjLvJdZ+ULS2WqBXT317Wz2qinW9okNWxi64JEmoKcR6VhW6NY7xqh/j1Zqwu
         S1hT8hemgjlkqwe/U92/wN59vkW422vwdmMMJjtP16fbXNpp1fcnT6gHIrD41g4dJX2F
         V+75QRKh331zqNZ7vmbFeNyY+UR0jtKRl//pGjUgv0dddY3FhJMdTd3CLxm4lRmRbI6C
         AOUboOVS6ilsb0lYwUwqtIQzJFAyVWMYzTn/E5gPCd2L1OkJgOmiYvl9ltCBg13AenD0
         Q/6A==
X-Gm-Message-State: AOJu0Yxte9sD3ls//j3n77nB0EwRr3ZByKU7xDTX3fe+E9nXGnOEy0tA
	cvE6pZwa8tONFKJFLsKnTNNamKMRXhEgVTTs+Wa6L0IZL9MQdnJ29rggMFK5TGE=
X-Google-Smtp-Source: AGHT+IF4Vcbt1Npkx/U99wloObm9G5U1BlPYaDyyX/50VU3RDtGSJuZqS+ffOtv1ZRWb0VgYf78IAg==
X-Received: by 2002:a05:6808:2f15:b0:3da:ab89:a805 with SMTP id 5614622812f47-3df1c0cb8a9mr14135311b6e.16.1725336538055;
        Mon, 02 Sep 2024 21:08:58 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:57 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:06:59 -0700
Subject: [PATCH 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
MIME-Version: 1.0
Message-Id: <20240902-th1520-pinctrl-v1-6-639bf83ef50a@tenstorrent.com>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_210859_443687_67768058 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 530648ad64f6..276f7e8a2c9b 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -41,6 +41,12 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -60,3 +66,36 @@ &sdio0 {
 	max-frequency = <198000000>;
 	status = "okay";
 };
+
+&gpio0 {
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "",
+			  "GPIO07",
+			  "GPIO08",
+			  "",
+			  "GPIO01",
+			  "GPIO02";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "",
+			  "GPIO11",
+			  "GPIO12",
+			  "GPIO13",
+			  "GPIO14",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "",
+			  "GPIO06";
+};
+
+&gpio2 {
+	gpio-line-names = "GPIO03",
+			  "GPIO05";
+};
+
+&gpio3 {
+	gpio-line-names = "", "",
+			  "GPIO09",
+			  "GPIO10";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
