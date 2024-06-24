Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78342C2D0D1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04aMQZpzfgPi9qZwRB9nlUnIfsq/Zb6Cbtz38T6BN2E=; b=f/1y/amajAXKcZ
	xlix5xTS/czwPjiJlzZoxSKjxwjRcfJaVxKSP9sUFDw+E0zb4n1YhaQ74xtWUxD1gTk/Eqk3oEvpt
	SJswzt+4c+AJhjHuSAfonIOyhg74j9CWnkEWT5qwdIZnJr6MA5Qxq/gL5PnqopvpzEKT0eszIgFvz
	4S480DS5lh7l/Fxq5l5Cj+bb2s85IAjs3Aj2tOBHkFaEgfaNkUHfDZd/gMtitzU4EbtRkDN5xN177
	C+rv8k09sqAs5sW6+XJOLJfSTpNgDImyiso6X9b7A+V9bSmhPJab9cOQ5tFHG1br7Zv7YNj2iitya
	3YmtPwuXJHkmtpJWaClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFM-0000000FGJt-2Eee;
	Mon, 24 Jun 2024 02:15:56 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFE-0000000FGGs-04Os
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 02:15:50 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-24c0dbd2866so2049312fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 19:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195347; x=1719800147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGMftM3u/EVg1JXHvGCIYFkGfbzrpBOJHnaNcrnQheM=;
        b=huWW7rbNCh8JMUuY/FLlcp4L0f9ztiahkQplgBaPAfEvVCDvPpdyy4Vz+rAgUq+VYV
         QP1MP6SlcgbmaALaiMtPzEKeDUdaTmxchUP5yf9zKI7UP8Qv6Fv7ZQUOcJQo30LAEdwp
         SjMeV1TV2/BvjbAzM1NQJSuKefRL2aVKt3dgsdjlRYh/0Nls9j9bgagaX5wjMkMkYv+0
         m0Y/lgLTS2DAN+ZZX2/FkFmwnFyexP87ESTteo39PN0RRISPTIFVBNndj1iivPa+uZfc
         c73K2DJKonUDgpVM/j+qg5aXQ69xdUpZX//LzXFVtqJ8smw2s7+pLT7dxKEMTrohK9rb
         2D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195347; x=1719800147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGMftM3u/EVg1JXHvGCIYFkGfbzrpBOJHnaNcrnQheM=;
        b=lFf3kLzEHDQJ2k6f+BjcTXU8fQ3BVl/noelEorhWvxYrXmqSKLYIEvOUNqlxZgA+0g
         vWX7ztRwUZQfh6yt8ss0zGiZdWhTh8wYgJ2a4k/JLxg+wUWIJ/ONt26DMNWNKp6RPwK+
         6nqK8kVEjt6fc+GN0URFIv/z8rOFzarciemN/emZbEUcel3IiQCzZf8KPVASjv1FNpqx
         ffykFF5yQWDepV+TvqyCc4BNwAZPdDG38IbUO2e1lDaSutjPKZLGEgQqv64hA7ay/9nX
         k+DMlmdNhPfTGUFs6+UdnbKmB1Ib3WP/59UOy6EO/Ya7og5TxUSBVBtUO6aP4He8KZkm
         oKpw==
X-Gm-Message-State: AOJu0YySn28R9Im0Xj0CLWeDioiKlMZKgh/0T2v+ZFazSFSHbTUgwoDr
	JLScXlY22UTGYb+FuNJ8VXDERMgG3c7IaLHlE93Nicz92ok1a6NLMXWoNL59oT0=
X-Google-Smtp-Source: AGHT+IEpDx0tS68+3PyfSRasBu1UPwFnFC5nIDXZBQcSCJeXpbH89rMfScOc6GKf5M/rx9toXWlgrg==
X-Received: by 2002:a05:6871:587:b0:24f:dd11:4486 with SMTP id 586e51a60fabf-25cfcf2eb04mr5016896fac.36.1719195347161;
        Sun, 23 Jun 2024 19:15:47 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:46 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 23 Jun 2024 19:12:33 -0700
Subject: [PATCH v2 3/7] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
MIME-Version: 1.0
Message-Id: <20240623-th1520-clk-v2-3-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
In-Reply-To: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=1133;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=Tex1awMNjudnvI3gtikHr2F7lrSHZ1e0QS1byS+Ld1c=;
 b=pu8+Mu7mJzVnU5HrfATMNP9rHowooKXJoEvBNn6bXAtFkRqWrQI19xVB26zkobp5fnXrOXElB
 hN1N6vPKEoNCZlE+eMWGRcGy88R8bdUeAt6ViPI/yK9kVPYosF9CtGV
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_191548_095149_D2EF9A7B 
X-CRM114-Status: UNSURE (   8.28  )
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

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..10a38ed55658 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -161,6 +162,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
 			reg = <0xff 0xd8000000 0x0 0x01000000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
