Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C51DC61CE7
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeJE9GcHiDWvWK+R1kuPafM9p20kFoCFFQ86uS1Cj6I=; b=kY4F7qQNFxWRhu
	RJqYb/JbYjcaaN0X7I1RhINXLF2D4mu6HvXetzcVlCMp9EL3qvg6kOglppWqTqvRkzmsIza23FrKY
	pemHwZNtKhUO+McSakeedQlEoR0UigC25LocEQ+kecSZ+J4Elhb68F4fUNkenPydJ7i0rzEhDrIid
	yKdWpv5u4Hak7sKDedMbSR9PGW9qbXfCaEMz4zqYt8Kq9Q7DQ/rp8nWB+akarWwphzWJVWSCrVkvy
	8DnJXCPANLXgIVxUSHxRJ5GBy6OSbtxmO2xPPPKdPTNm9l+D10E06H0rhl4T3FRrm/c/JEqFBFALC
	7/bzFL6MAAdhrZGA413w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSz-000000037W2-07FT;
	Sun, 08 Jun 2025 23:30:17 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSw-000000037Sl-08rQ
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:30:15 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4a58ebece05so43611071cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425413; x=1750030213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4yjXSJrUcpYvv+fh7N1bp9yrQ9N5XG6Cs9FRn2x8Y=;
        b=VnPdiJSBiu4ROki5zZ8YHJJXD3veCTXyYmLR3cah5vzMhOMu9LZTdfp0buIUeDiqw+
         4Uocp2bCT3Anr/Z2xOy5dqS2S4GphvC0ZZLqL4GD1csMPES+hAtMwPq2HcZqg7Psd12c
         UQsbLjR9jWvWyEvJHIofqxHYmGEy1V/oYrnbhb5d+J/AKceWHRZT9bnp4NJif5bzyxeF
         1wPazFQhl4cRoxWCd4oWktCHIGmVUcFoCqP7WvuPkawcVbwFoC2Ydbt27zS4SvrrgUfO
         mmbEH0W0vtd5qjlT0wAP9y9NgMaqsunlXcsU2AYQEN35d+whpq2hVb1h2M8Eoep+C7V3
         7UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425413; x=1750030213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dF4yjXSJrUcpYvv+fh7N1bp9yrQ9N5XG6Cs9FRn2x8Y=;
        b=nVc39XoUpzZMvbQmyQTeHKwJ811p/fvhZlNPwbwD1UaL3NoqaPyF7LkNdvJ41d0sWD
         Dx7AnVMq8/1jKMp/yNl2e4Uf3z7sMG+3ABJt3l3N7c1XOhaoagFIBSs0qEeZeLoRUBFB
         mkH3hpdWZcQGcLoVoiHWTBEuwEkK0saKGfqD2Ne0dmnZRMgA6Coru+SCLWT8xU51yZps
         iFHMh8bb6Xgb7YWWDihXVH+iW6xAdWFG1Lq7zVax5+buIQoQYK4CUNjqlNTNSiYsA3my
         KkEjhRHF/ENJ6Zri5OVR+uTlWXcXDYeJOYqc53OYDi0I4a1TeKoq5NVI01uRLwBSntW6
         ccgg==
X-Forwarded-Encrypted: i=1; AJvYcCVdlg5XHxwXxW3amtSzFAinycKwePids4rw+VETv7ubLxo7Dfk3O3vy5RFfLsi+wl88gNbanEirs2BvMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq0Xk/+9K9lNP5zfe6PPpxymxGasdGz56DqtDcUzXlkKQg+SMg
	h8DTEs7lCp3Y64eCIDOn2Kj42wAikIbXBDUunakU4m/3KGHy+HGb3QKH
X-Gm-Gg: ASbGncsdAukuXbVwmkzsXSykn1YMnBp+SWlAZLVojgl4CWT3A0eL/fd6YBuY+cgMR+/
	YqtWz9DqAVMcOznYMB2qlxWiEw1AIPURJ9gTd4JlE+ZO1bxLIKjvptdHJvpsRJc3ETsDSd7r8S2
	QA7mI6pOfdKPjtrVaU4VStUe3FhMSQJZmmR1OWXJYgYZj093unXDu9rf9yCMEKz57ixBbXhP8Rt
	cuU26e4wssMH04IhMat11GYMeYCQ6VFZUY4fV+7aDuFH0m9Ty8bZ83YtliCYcy/8DWeG6tyAiSp
	kc4LuAXNyllhFNzvCRUQRe43Kh58j/Uu7Rg1Ug==
X-Google-Smtp-Source: AGHT+IFJtdD36SLKzA4s4tQ2l6v6xrhKbEE2YacMHc2B6BFbqlcLwe3sQC6STy67hHJv2b5IpjtjiA==
X-Received: by 2002:ac8:530e:0:b0:4a6:ef6d:d608 with SMTP id d75a77b69052e-4a6ef6dd6f2mr102198141cf.38.1749425413058;
        Sun, 08 Jun 2025 16:30:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61115000bsm48297391cf.1.2025.06.08.16.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 09/11] riscv: dts: sophgo: sg2044: Add pinctrl device
Date: Mon,  9 Jun 2025 07:28:33 +0800
Message-ID: <20250608232836.784737-10-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_163014_077445_508F5563 
X-CRM114-Status: UNSURE (   7.93  )
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

Add pinctrl DT node and configuration for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index bbf4191fb87d..be20efd8e2ac 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,sg2044-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2044.h>
 
 #include "sg2044-cpus.dtsi"
 #include "sg2044-reset.h"
@@ -329,6 +330,11 @@ syscon: syscon@7050000000 {
 			clocks = <&osc>;
 		};
 
+		pinctrl: pinctrl@7050001000 {
+			compatible = "sophgo,sg2044-pinctrl";
+			reg = <0x70 0x50001000 0x0 0x1000>;
+		};
+
 		clk: clock-controller@7050002000 {
 			compatible = "sophgo,sg2044-clk";
 			reg = <0x70 0x50002000 0x0 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
