Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06E6D1813A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dDsQf8Fm07hnntbI0vmX9nCkG8pSePE4/MdIu9Yq0g=; b=snhviadSNpGxIf
	eWxh3Mxm7rWcsYWLoXgSf38OAz3eXaLR18MGjWbCfl8fTdQWgH0S09qOjgoB+bYJQn0rvrMF6Vx8d
	2gKQ5Nqctm/7fiKZSU+jP8X2Knfj/HCJz7ljC2YXwh+zWFIihFar00IPEk8JKMqRXFzmPkIJWDiwc
	0Mc5lLcnP1vQPdP8EKujGmhFBACWUauZNUtPEL16x/ZgbwmIlAQgPvhz5eRQ0Dfj848sfKEHrmA3u
	PqXAvGCEXcW8pKBOgOP+2paZ3KM3sBqwxreB0w65TuJXAAwGJjPcrRcJeiw6t5txUPN+nkRxchTEA
	HzFJGRz0zzB3tMirFiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHH-000000066dW-3HBa;
	Mon, 14 Oct 2024 17:54:43 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHC-000000066aj-49BG
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:40 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso2857529a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928478; x=1729533278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uos7I1D3jQNEa1jYD68wgLK0dLonPjDnha9WpKrjRLs=;
        b=Cqa277C8TDkwO9+q3l9uj9BC+GMqtAqvDnoOoC6Uhf5uNkywpE+Iy9J+wQ4MbjbxA8
         bGdN2ChmK7W22Vi+PRChZiv6LXmiD/WstEii6SbyRFy6/vodqP7TtdLSrn0/s9meMia0
         a3cge8CJ0sm1eZfvfV95oeUNYcTTfY6qcxjOzplrJuBzugCAIJ+qDb0o5m5INTFwxRJl
         M7IBtuIoZLAvIUhi37WMWL40k1peYXTLTFQW4PKPIjZuWTlTBB2U5CFXw4gzae6tUlHH
         PLL2+vQTzrHFyvJX4yu6iInu7CewqAjVRAWWW1imnsRXeJVg055n7Kc0yXTf8Zto3XkI
         FlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928478; x=1729533278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uos7I1D3jQNEa1jYD68wgLK0dLonPjDnha9WpKrjRLs=;
        b=P4CZChPQdUT398/xzuPhESHrOVOo4XwTkNApHKOVDzTeueegdjkWOl4xnnTrNozHJj
         lOUSGA93RCbECIRw+MR75W3qQCuvTCf41rJBOAhIEm2PyDUF+SspITXXiS8M3vDm89ZA
         KPjdnTTtzx0aSdXApKDVZcGJc4E6inLO98zSxJWygRlGKf0W7bIRQIowFBYit2NF66CN
         MX2IxoQkXGitKSybCVLgH+zXsibyLlaavtdJSd383IgSocEPrac3vkY4hQFJCLj4mqeb
         hHgxYpn5mYdgYd8wBoRmvDKjY/Ypv2FoI6Ntl/7wbKFfsOHoocdcDebe09f47pNiXOB+
         RwHg==
X-Gm-Message-State: AOJu0Yx+5m4vQ6xauyJohX9u0ta/mJX1bOpa+3bRSJcj1CaCAmyiU0BY
	pu2toixMlNMe7sf3fRwz22qWc4mN2P2U2QfZF/wYplE4yr4iiK2brs0f0WYhrMxsvdsxQtZZ1ZG
	G
X-Google-Smtp-Source: AGHT+IEf0p5oqGrtyTppCsRYCXH5JSV8D2MTmtTJC5hsQzJwO0qFZtTU9t9TmbxbmQs9qouXaju6Zw==
X-Received: by 2002:a05:6a21:38f:b0:1cf:7123:86a6 with SMTP id adf61e73a8af0-1d8c96ba856mr15379776637.49.1728928477812;
        Mon, 14 Oct 2024 10:54:37 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:37 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:21 -0700
Subject: [PATCH 4/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-4-268592ca786e@tenstorrent.com>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
In-Reply-To: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_105439_080292_DD566250 
X-CRM114-Status: UNSURE (   7.99  )
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 78977bdbbe3d..724d9645471d 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,6 +25,12 @@ &osc_32k {
 	clock-frequency = <32768>;
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
@@ -39,6 +45,39 @@ &emmc {
 	status = "okay";
 };
 
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
+
 &sdio0 {
 	bus-width = <4>;
 	max-frequency = <198000000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
