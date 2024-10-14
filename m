Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9F5D1813A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqzClKO+oNU65D7Hy7rRhMIP87L906CwDtrNcowM5pc=; b=MTZ5sjk0JPk8ET
	SQgDSsjA/sR7CBsk2GROvKjmaF5DDdYXL/eT3t+zjUjVlBpQuXp535+Y8nnqtlH3mKtZDg1GoCuhW
	gDSAJsbajfQiofv0I5BDvBjYWVRAhri0YKIroACeqWcs5owWJg3xzjYvvwns/A91d3FuzUrQFvfCB
	YDmFbgg4wIPnsollyNSwT7JywjBnXVl89jqqmMqnlqpGj6GTPbyeh2URlElx/6peX/xFLuNhM9qZA
	IPp8Xv/7j34TYHouEUwjvwXyEr/7/KxJNeNo0KdktBNWzhvGPUEHfCEYz99HESE4XAw+5GsLTX/ht
	LC2XNFPQYm3OnRs0izHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHT-000000066m0-1wia;
	Mon, 14 Oct 2024 17:54:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHK-000000066fb-1XnD
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so451865b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928485; x=1729533285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ib0LzHxCGUP2Of7LzCAvLTsWSTSTY5vzi6Axbb4I5D0=;
        b=Bz4IthqXaBvOCkZ5nP/GaNnOXumgMXAZJpJyh6KDm9mL1jNIHa5RgVb7DXtJ85/lW1
         l3420RnHr7A0qwZ6AQ0UD8bEXYol5zpw19gQaQTg1njUWkIUR2y/lfgFlqYJo77Uozbb
         Dmg2iKEAKbHYza0+zow8gIHCxEslKnbX7IbcdOL++3muKSKYXKpmqD+X3IRFf1O6SnMl
         og7gOmXdxVfceW18IoBhHYytiG+qpjDpjxomafketb/jwfjvJaqo+wJDJy4yZpxI5Wza
         +CXWLX1G49kfD4KrmPTMbA3X0se3PekFDIjE91hiK8pvnumDT+PnriN8TPRQX5fJdg/X
         C3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928485; x=1729533285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ib0LzHxCGUP2Of7LzCAvLTsWSTSTY5vzi6Axbb4I5D0=;
        b=Hobb7+WP9I6iCgV0je8lWlBUIWfScPYY4KPSUykjoExH4Dy0aQ+V8PjtRVV0zzZuiQ
         ujOTF94MCyTWtEB9NHzWUOf6/xqohbqqVN6IQCFHvvBYKQ6PcFHtqEcJWMZ992vb+aSx
         uAszwsHaHB0T+Zzwi2f83bzIaFWfQxs38HDNdZo3Ucj+A7TPbDdiZScv+Lze9rnNNY+c
         oZriJqt3VIB3WROa+QolCvZYhp/sTOxhlWCLKrmVmsW9KtH89oVFVlq/TmfRE8p/AfDp
         dZHBl0Lroa9ncD8GL4Z64IOhtRZ9CGeqbKb1mUjFJbapCkraXlXoymJban3Us3n75bvp
         Q2DA==
X-Gm-Message-State: AOJu0Yz5FGDdyo4ZA8qX0tpCWe6Z7hVhYRfjs7og4TOJnhKfVpVZKRvM
	dtQQp2bpa3skbGxqQDhMXd2HzA50sTF6QsZnSeCs/hGEgxY9wTXKxC/fwEPnyCI=
X-Google-Smtp-Source: AGHT+IGn+w4J6ujcKmDO9lhPgpFFwLHQORkcQhURsA6+UDHkjEM67AndBJceCtyLERFJD54nONsRxA==
X-Received: by 2002:a05:6a00:ac7:b0:71e:4fe4:282a with SMTP id d2e1a72fcca58-71e4fe430admr12455912b3a.2.1728928485620;
        Mon, 14 Oct 2024 10:54:45 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:44 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:25 -0700
Subject: [PATCH 8/8] riscv: dts: thead: remove enabled property for spi0
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-8-268592ca786e@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20241014_105446_457259_CB404622 
X-CRM114-Status: UNSURE (   9.34  )
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

There are currently no nodes that use spi0 so remove the enabled
property for it in the beaglev ahead and lpi4a dts files. It can be
re-enabled in the future if any peripherals will use it. The definition
of spi0 remains in the th1520.dtsi file.

Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 4 ----
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c0cf9b086f81..86feb3df02c8 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -150,7 +150,3 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
-
-&spi0 {
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index f60b1879192d..4020c727f09e 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -59,7 +59,3 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
-
-&spi0 {
-	status = "okay";
-};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
