Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32115C3DA4D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/k/v6WmkzIFlhKx2vjlkHDbnamPaxbrb0zUwTSV0AE=; b=eZocdS+UlI5fyP
	2MGb/l8ZU9bHYAA+VsrMCVvHsJA4flw8MFkss54ct3cT1nJVHC7KQ76LOh/qHEP5CjfX6QmNVl8W3
	JhzPpLKu39dwL/drr8H0qmDSAsJmk/ElG2Tb81njrcbrQd5wwVd/o7X7BMRw3P45V2UbNveQpCrei
	YPDOqgtYdUm5Wg1DPk5JlGbEVOwKlh+NW1vjyLg5OzTYyJwHBN8k8OITo++h0yRViP/3kDqRksGUo
	9DOkVT1m2AkUKW8fKNPzf2GxMmeasUsmV73BvhYRLZyM+5L8z9DKlQIFVMS9JhSoCBxj8Lu5MewHf
	a6JlS4/oSvwdOgSC7ZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx63-0000000ElhO-1A3V;
	Thu, 11 Jul 2024 16:56:43 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx5y-0000000Ele6-14qw
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:56:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70b0d0fefe3so936528b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720716997; x=1721321797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=NG91QsAWSilGl8hSYCJRVJ0S/o6Iux37U2hqgS2Ib+GhwrTGRpEbqQuWOTDoOxsY0F
         wYV7mvaGm+NbR7P7zXkYF9/SmhHphU0tKC+rNSmfk10y9Pf6Km083I+1wjUIChnvrSpr
         sx0tF868nnp1JYPeCWUrBNZu627LHIVbmaqhnI0Dtq73WGSygR6XlXGymfcPvxhnnN85
         oI14/VixJtyas7WZCX1lylO2IpirxxZ4TtgrfKWwc1+HBBccup1AXqeTLgM3/l+Qq9Em
         ICj7X9ISczXVm1PoJxi7SZJyBrfQeDOQJNUPxSxQOfgLnDonvIdAgAPPHTyuGC9B5KAI
         pDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716997; x=1721321797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=RKvtCxmJRvs01VPWQW2uz4QeSQlhgewoP1JR5nsNa2isMdQOvtarQR1iP4f0L9boSe
         UN2+Y8vFmsG9DuRH7OFcXnHVjjJfpT8/LeAPVCGLC/JxFNrKKqyptWa+Ig4sZ/hFRVh+
         j6dvuxV3gVOdRmYrwIT4FmUQRl0zaP411X6ojdU/HccAG0PBcRURtWX5EKeEl5pYYvk3
         Dn3d0ciW782q6CbGVMz/kZltBv7IOuIVJCXaIZgniWQbAmsIXzIcUVCBKgxr/Yk4tEmH
         fl5MdquaFCz56SwKxwuSOHyIMDvMNhTnbiZkGiuYrPxRWL+Xdky1aJrzUJWqQOFbGGTO
         oLRg==
X-Gm-Message-State: AOJu0YzMZABMeFhMq8QEa3vJ+QHFHIEX4U9rJIHQnhz0be5qx4BRNQdl
	52/ORKlkBQk9NUcDAvhmKlUnRlbLi5/WiAkKTZo5peSiev7VMDRvR6sweadaSG0=
X-Google-Smtp-Source: AGHT+IGS+uYFXfGJ90lMZHo8zEZEN9G4YU5Eh+g8USyZFzpQSYTOEhmT81CJZkVjdrCsmZvpPP5WZQ==
X-Received: by 2002:a05:6a00:982:b0:70a:97d9:5b9e with SMTP id d2e1a72fcca58-70b435422ccmr9355831b3a.10.1720716996791;
        Thu, 11 Jul 2024 09:56:36 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm1360038a12.92.2024.07.11.09.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:56:36 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 11 Jul 2024 09:56:25 -0700
Subject: [PATCH v3 7/7] riscv: dts: thead: add clock to TH1520 gpio nodes
MIME-Version: 1.0
Message-Id: <20240711-th1520-clk-v3-7-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
In-Reply-To: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720716985; l=1705;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=1YUFcjPStRQXnRCkm7LFCYqYtH2keuIc2Ndi6ymcweU=;
 b=xWMNMMf5ekN/VYMwCX4FKmLzMFMloIZ7DBupsg48lPSc0R8C8P8pGDv0fotGiJvk2zgTldVTs
 naf1OfccBxoDU7TIFEin5viNRAEti7jbOgJfpdSDyNt29e7mjJpUsBG
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_095638_468582_CF514C54 
X-CRM114-Status: UNSURE (   8.73  )
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

Add clock property to TH1520 gpio controller nodes. These clock gates
refer to corresponding enable bits in the peripheral clock gate control
register. Refer to register PERI_CLK_CFG in section 4.4.2.2.52 of the
TH1520 System User Manual.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d05002ad7c96..351e09beab70 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -237,6 +237,7 @@ gpio2: gpio@ffe7f34000 {
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO2>;
 
 			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -255,6 +256,7 @@ gpio3: gpio@ffe7f38000 {
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO3>;
 
 			portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -273,6 +275,7 @@ gpio0: gpio@ffec005000 {
 			reg = <0xff 0xec005000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO0>;
 
 			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -291,6 +294,7 @@ gpio1: gpio@ffec006000 {
 			reg = <0xff 0xec006000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO1>;
 
 			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
