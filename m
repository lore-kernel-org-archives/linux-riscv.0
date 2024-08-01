Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10786C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+jj6EAdy+v17OFhwpqOt3QzxrLlts4xjgg8eRuIGjY=; b=LRopivwxuWL54E
	+kyyvn5vxfmgx7jhCIcqvKOYNjSHPdZmiv/aYKhVeUHbTc5ik2OB7Zjus8lWzz32rh4XqyhLe33Ed
	XCa1m/P71tjQrMpacCiQt0FAkGxUZHAbsqcfZLibgJEx2PuB1+ft6m43xYwwrPDTlJUxGBltcN9Nr
	UYx4ezu68UMTwbMGXzqBU+4FQ47NTazFbw67mYCTEBu2b+kZuTaFilJppgsDKt8e3u0EL7rhvei2c
	t6XIELxXOjilyAuDSpJ6/w0qZp+JZsFWNr0+YZcLbPgqyE05SIA+Zmn0Fs8jt6xk2z5DBlNLmx0u7
	9a07t5fl8vYZg0VPr72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah0-00000006PYL-36F2;
	Thu, 01 Aug 2024 18:38:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZagx-00000006PW2-0BYR
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:38:24 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2cf98ba0559so3753188a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722537502; x=1723142302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk3fdWOrHxhGe/z2L68pKaBMmRMZIgpiOTECkCtz9Bg=;
        b=Vv6QDrCzcNRRYt229wbrXDd4QeSzQI91Lu7RcbivpzU0cTGtxdEySbCZhbhvZRYY/z
         lT3YXnf1lEzz7YjMO7chUw0YAE7cC9/Det2PjuZ+IeBa0KZNXys/3cC/L+ZZnF5O1gft
         R6b6pBJcRs+Eb7Ixb2OpAWlwiaC7DjaKh6h5p/GyPwILdZcuDs/QhcIGs3yGrOiVtsab
         RP81Q76fylVNnCsvjmDySyXqHm/vkBCU1m3SZr8hFnoE/4fx+SZ9JeekmzPzniBD4Gqz
         kFXNay/INlsi2yszyXbT6Sx+7uda60M/ctbBwdUwhkgE7yR+P6h67TK/roI7HCHAQoWz
         kn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537502; x=1723142302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk3fdWOrHxhGe/z2L68pKaBMmRMZIgpiOTECkCtz9Bg=;
        b=o1hHp4C/P3nq5wtOksHFVuDEdznfz5YSwudwGPWDTuqunbM5lkc+RsQni9TRPJjfWe
         a2hcr10gKqGCmVOwty44pRZjszbIKDkTcjUVBZTq98ZOPQghoDBASdr9Aw6EyN+pPZdx
         RmaUT84HXIj8PHgdolajKP5sBG8s53dPLdhWlKtWroFFtME5Su6HBBYClEACwXi+MGMy
         m/RD15IAHGgKwIWzr+ADvTXmqYhwL1F8Xg1qMh6nXcnlFePb5mBWo7RwYGASrHlzL4Ex
         5uzuD0sYnLVg35631cbsYSk2mR6e7GpSj7J/TTO1qpqK0dFl0TKrXBTM1wA3TnK2o1ua
         /HRA==
X-Gm-Message-State: AOJu0YzIUjTOONMYt+s4YG4gJ9zg5yV/bdDxTW16JkBQltyOOP9zfhHt
	jmVfPCerMW5KgQFEF5nds9Vg3WEOuNAxVVQHDtO5J+iKPCN7U08Q3OGcQeMJYKs=
X-Google-Smtp-Source: AGHT+IEivcdDbgQ5UTdJZvwjjzFBFMbO3AfwipXdPpcaMO6VuyrFNirJJMGYJHlNvMzav90dOHGVZA==
X-Received: by 2002:a17:90b:33ca:b0:2cb:f9e:3bfb with SMTP id 98e67ed59e1d1-2cff952bdf1mr1296175a91.32.1722537501642;
        Thu, 01 Aug 2024 11:38:21 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:dfa1:41a7:9478:9d47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69d54sm279728a91.12.2024.08.01.11.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:38:21 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Thu, 01 Aug 2024 11:38:05 -0700
Subject: [PATCH 1/6] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
MIME-Version: 1.0
Message-Id: <20240801-th1520-clk-dts-v1-1-71077a0614b8@pdp7.com>
References: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
In-Reply-To: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <drew@pdp7.com>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=drew@pdp7.com;
 h=from:subject:message-id; bh=dnuRibn2g+ZT0aI5L/Shjy6/+JXvi/iMXiSHhCZO6jY=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStviZpuPSdaMu/gLKy9YEPtD2nyP28OvGDp5lh7YPPt
 3Xc66YFdJSyMIhxMMiKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmovqB4b9rZgiLlrCdhK3t
 i7JXq7bERMjc+rL7vuG1pyWcj7gSW+UZGe71um+5bRAbdfweq36mrm65VU/aNF7mZiWhJEthFct
 FzAA=
X-Developer-Key: i=drew@pdp7.com; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_113823_285719_47213D90 
X-CRM114-Status: UNSURE (   9.15  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index aa703da30fc3..25ef5ee729e6 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -419,6 +420,13 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
