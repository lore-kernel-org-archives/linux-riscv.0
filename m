Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9141CD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 20:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7g/zntGDIuHkNS+xsDuH61wZh+juyDfuvr5L8Ezsj3s=; b=3gEUcfElonK/JI
	K5+6Im0vWWsEKzAkszTncm1xvP43Nw2UYFFEj0cRB0nWPwPVdZHrRDFvXt5ESscF+geo/Sb2KQiPw
	K/nBZck2lD2PBXCCxpaj/A5n7OntaTmIovoMJooyGW2XCeWJ74yyIWBX8bqCzd/G7g+i/c5vPTd5S
	EzRK3VVeh/rlPYf1VFKQtUUuJcN3Gk3Ix7e8CNO9Xt8d/snr5VmrtZuAeAnQWVPevySYE91at8a9h
	ovbVKuQ6IDifqCXP31QlGObn9NA3fLi3+PfuaNf7saUEvxGwcwmUj+1Ll2ByfXrdqAeFWHoFKbaXL
	VetiIVQc98YB8sisQD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIVH-00000001rcs-3MJK;
	Fri, 29 Mar 2024 20:07:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIVD-00000001raO-2ERY
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 20:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711742822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=chv79W8KZV4FF91RJrZsjWXi3bo0UlBJqJ+YGhV9vI8=;
	b=chlHOaPutY3BK587csYzImywVJghEqTw48fqMJBGg+/mUB3Ut/m/xOJ6nwaod7Pfi3e7cn
	QFuPWrOPlxxvojf5cN46qbILjSo316xKO6fvj2TK0kgaEKQxbJcP9y5PUXDXLXdRZawD/r
	MDvsaAPeb7dIQzOlXKfN3UdA/1S2sJI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-ec6iwQskPFapcG8Y4nyrJw-1; Fri, 29 Mar 2024 16:05:20 -0400
X-MC-Unique: ec6iwQskPFapcG8Y4nyrJw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-29dfa2c256fso1804458a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 13:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742719; x=1712347519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chv79W8KZV4FF91RJrZsjWXi3bo0UlBJqJ+YGhV9vI8=;
        b=dNcNIybMDzoNjeucbOdpWODlxgv7d2QsHbagdk399x+/6FVli+M7piZRV1j0dvtIxH
         vkjfuPYE8vwgXra2AUo1XopDb75R2fer1o+UgA9oXMOIzX8c0L5c9TDtABqB9dDjYoy/
         xA35aWvHYVd4HWysVDqdfLbybCqxY4I8kTnLC5ym4fq4S4qYc/p/AhBx6Y0MGRVNFVIh
         90xGw1ULsxuq5LVVA4HP8mI4wrc1X3cjKpVoF/S434EoL8SkpH6W/ZNbCNvWNiUeOZZ7
         HmazmiTJge0UDZaPW/9HJVh937WOyJhIl3epRR1JA/+/3FmLUEGfWlSpHD7syEjxxsHo
         Hflw==
X-Gm-Message-State: AOJu0YyhqR+wUvVoap2Gfugv7AArhoki8EmFQxU6M5cu/W/3tufmVGG8
	LivUchNsk9WViW1wD32lR/fYamU3plTZs5FpUfObuhHEToybpFw+Sqo7LnuQ6kcQxjWbbWPr8gr
	Nl8+9IzaaWTqECxZJ1u/CjXFJsj8luXuPTW5dH98ehKBk0DKd30f9T9/znchmd35gwA==
X-Received: by 2002:a17:903:2290:b0:1e0:b60e:1a33 with SMTP id b16-20020a170903229000b001e0b60e1a33mr4229102plh.31.1711742719432;
        Fri, 29 Mar 2024 13:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/BF0Y8M4+Q3wp921xNHu7UI9MEHoFLlOewsMWLujebRJ0bO50WafD/lpdLCKxaYaACz3mXA==
X-Received: by 2002:a17:903:2290:b0:1e0:b60e:1a33 with SMTP id b16-20020a170903229000b001e0b60e1a33mr4229084plh.31.1711742719151;
        Fri, 29 Mar 2024 13:05:19 -0700 (PDT)
Received: from localhost.localdomain ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b001dd6ebd88b0sm3830017plh.198.2024.03.29.13.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:05:18 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	guoren@kernel.org,
	conor@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jic23@kernel.org,
	lars@metafoo.de,
	andriy.shevchenko@linux.intel.com,
	nuno.sa@analog.com,
	marcelo.schmitt@analog.com,
	bigunclemax@gmail.com,
	marius.cristea@microchip.com,
	fr0st61te@gmail.com,
	okan.sahin@analog.com,
	marcus.folkesson@gmail.com,
	schnelle@linux.ibm.com,
	lee@kernel.org,
	mike.looijmans@topic.nl
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 2/3] riscv: dts: thead: Add XuanTie TH1520 ADC device node
Date: Sat, 30 Mar 2024 04:01:25 +0800
Message-ID: <20240329200241.4122000-3-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329200241.4122000-1-wefu@redhat.com>
References: <20240329200241.4122000-1-wefu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_130703_742953_1A610AB0 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Wei Fu <wefu@redhat.com>

Add nodes for the XuanTie TH1520 ADC device node on the XuanTie TH1520 Soc.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index b7b7e950a7d7..cd6bc89a240c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -417,6 +417,16 @@ uart5: serial@fff7f0c000 {
 			status = "disabled";
 		};
 
+		adc: adc@0xfffff51000 {
+			compatible = "thead,th1520-adc";
+			reg = <0xff 0xfff51000 0x0 0x1000>;
+			interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&aonsys_clk>;
+			clock-names = "adc";
+			/* ADC pin is proprietary,no need to config pinctrl */
+			status = "disabled";
+		};
+
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
