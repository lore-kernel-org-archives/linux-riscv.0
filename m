Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2F4EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scIW/wtcPoms8grPSfuTE+MioKB4p1urpDkbnVZMdKo=; b=rpImepXEO3GG8W
	DZzDdFnLA6+m+461jN+zQh3V+LbkNHJHf8hWI0IibUqP6dMkNRGheZWZW+2Ed3C//sFpSW9TW3g9s
	FvwisIKEPx0bu7WXkowkhhRg+25xGdmyJ8PW1xKfMJcLjtPEbe+QPhlTmfPvp+wHdcWAzwzgIgtR7
	Qn0tjRiMQ4eVl9DeyjNtUhzhg8H2PgZsa6SLspXLDDwoKs8La43tdp8WnP/3FxZG5NKDPHwg59LaR
	KFodyTOvwfTaRKYjFIFeb2gZfP+4pQnv2BJ7j8ZzeQCnEQtUlciUnt+Bc2X8hlcTqQVwval2ITpAl
	qPMCytit3JlSQR7hNCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKESf-005ZEi-34;
	Fri, 14 Jul 2023 08:47:37 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKESb-005ZB1-1I
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 08:47:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-521650a7603so286754a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689324451; x=1691916451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA7l8IIaj4aslYJzQ2fc8TOlfhX9HZt+/RtZQq7WtRA=;
        b=IjRI/ni/znH5CfUK0qL5zLtrjXUMOaLNLSrIjp94+7qxfkRqsKiVPVS+QG7xDnOTp5
         zqVS8raXsnlmrk4UofwpwgzbCex35dBTyD18hk9u7sFl1jpNKPh+lX72cNrhFb5pbBau
         V9OQY57fR7x8DEGW5GblZVYzOMBpn48qmiyKffhHB53Iyrdr6hZAsU4FQbUnwglf0/nI
         1kAtgRohXmRo0S3MxwHv2JDA9+VJB2NkEIrC22nQKOinVipQiTkZ1HD8QXSiTDj7O8G9
         8Z11gWKpFdHJY5N91jzvPamwh1Gp414zZHdDII2AF50a8m+nDyOXIdVbgKbwR7/E1CZB
         rFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689324451; x=1691916451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA7l8IIaj4aslYJzQ2fc8TOlfhX9HZt+/RtZQq7WtRA=;
        b=lY0ji8Mt0o1kLgFoGi3k+LeuIk+39UbhHbN3FdLXxbgT6VAirDRi0kan4Lp/Sa2ZRx
         wy2l+aBXCXufeB9C8ysCMKUWPVyVxcr5ZaN+5TgGAR75EHusLuX1/nSNdD1BC8UomsxV
         Q0Iv50PsXvyi5acOzfWBCWFqI8v5OVWHU+vI538/fdGdU8k3nywyZ1hh6He/BsYk4xPB
         wya4yqqjtiw2ctiqYhnnyPTO3PpnTFOiVDVOgMjAOSSY/CGEynHi3zduZAcTr158mned
         fICl0dWwIih6ar6El+wqZBFr29Fewsnrc17lJhDxP4eEU/jQVk733ztvBsKvbraEMyuP
         s7bw==
X-Gm-Message-State: ABy/qLbPjUH8/5OoJD2aIa5sDaGV8QRCtAt/pfYUMF3LYT/c8CQzqdR4
	9VSOHKbztFNveP9X+uILmxAG/g==
X-Google-Smtp-Source: APBJJlGbRMLTxhL0KR5Vo3tgekUEa/KYea9Ns8LQK2+4AHZpZEZ1JvWe0hTShfEvBphmXA2MIroU3Q==
X-Received: by 2002:a05:6402:1210:b0:51d:ec25:ce38 with SMTP id c16-20020a056402121000b0051dec25ce38mr3932884edw.10.1689324450843;
        Fri, 14 Jul 2023 01:47:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w24-20020aa7cb58000000b0051e0f8aac74sm5480662edt.8.2023.07.14.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 01:47:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nishanth Menon <nm@ti.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] Documentation/process: maintainer-soc: add clean platforms profile
Date: Fri, 14 Jul 2023 10:47:24 +0200
Message-Id: <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_014733_443132_366A84BB 
X-CRM114-Status: GOOD (  16.38  )
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

Some SoC platforms require that commits must not bring any new
dtbs_check warnings.  Maintainers of such platforms usually have some
automation set, so any new warning will be spotted sooner or later.
Worst case: they run the tests themselves.  Document requirements for
such platforms, so contributors can expect their patches being dropped
or ignored, if they bring new warnings for existing boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../process/maintainer-handbooks.rst          |  1 +
 .../process/maintainer-soc-clean-dts.rst      | 22 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/maintainer-soc-clean-dts.rst

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 9992bfd7eaa3..976391cec528 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -17,5 +17,6 @@ Contents:
 
    maintainer-netdev
    maintainer-soc
+   maintainer-soc-clean-dts
    maintainer-tip
    maintainer-kvm-x86
diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
new file mode 100644
index 000000000000..87feeb5543ff
--- /dev/null
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+SoC Platforms with Strict DTS
+=============================
+
+Overview
+--------
+
+SoC platforms or subarchitectures follow all the rules from
+Documentation/process/maintainer-soc.rst.  However platforms referencing this
+document impose additional requirements listed below.
+
+Strict DTS DT schema compliance
+-------------------------------
+None of the changes to the SoC platform Devicetree sources (DTS files) can
+bring new ``make dtbs_check W=1`` warnings.  The platform maintainers have
+automation in place which should point out any new warnings.
+
+If a commit introducing new warning gets accepted somehow, the resulting issues
+shall be fixed in reasonable time (e.g. within one release) or the commit
+reverted.
diff --git a/MAINTAINERS b/MAINTAINERS
index b61289fa7891..7405fb6e38c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1561,7 +1561,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
-F:	Documentation/process/maintainer-soc.rst
+F:	Documentation/process/maintainer-soc*.rst
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
