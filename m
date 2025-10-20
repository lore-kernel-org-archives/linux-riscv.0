Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCAECCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 03:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18Rk6f+60Pz7fqnPxowM5kKR7gB8GaC0yJxPF0mENTk=; b=oofckpfd2fyNay
	hh+COyjDPqjPaP4wpy/iyu0D63OcxKGYSqh/4y8XtghatXmThtN9evu9q1POS6G07m//okV9HK0/8
	yO5aCjMdhhIAU3ZVdLG2Npv6VPVImQgCosRKPbHe6VmiLSUM39odJ5rnGBQrISwOR2p9VQcqtkxSR
	cHu9XmWwGiVyWpTklfgSunHbUEURrXeWLJ+fPtfIrQeuqeT9M8OCth0j48TWHqsJXDCVD07yeNGO5
	AEWt5cU/MfXEwDaUI6G51vo5KaUI/A+VTK8zv0WunyfL54Qe7ZVn8tLIjlSEY4Oo15yZLQzVUHpN+
	xP6NFTm7yKXeoW4lM26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgeh-0000000Bmga-1hU9;
	Mon, 20 Oct 2025 03:33:55 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgef-0000000BmgA-21C5
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 03:33:54 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c284d4867eso788751a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 20:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931232; x=1761536032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE+2izhbixPNMGObc2mrhI1AAWPZUT7zIjDQJxZtTJQ=;
        b=AluSb9FCRBvvV5iDapMciraK3cIbqiABqwVz3QXSksuMItmaFlkH5J78cTx4Qg8WUY
         shtqRBIhH62gn1bwJKnFVDi+hwIw3KcOl+03hCYNnEH1ScaEovgzFTyRRHbUFD60ENAX
         YBMLc9S+Uz3sOZginDUYLAYlC2EL0IuPcR9gjprR8wcuOlrzDj+sjb3O1zl7TBPDkvSm
         FmeDpIP1M7QJevEZqAZgbU0CNHPrqiY3gSeftiqFNpmdS/sU2kpkDPpq9OHPGONZuoWo
         XhVThHxC13NVEvZcnhqg/o3eF94aAMJA+vylB5VUaZwPFVY57oFhhubNEVbOc0s8e1Xe
         zqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931232; x=1761536032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eE+2izhbixPNMGObc2mrhI1AAWPZUT7zIjDQJxZtTJQ=;
        b=ajl6WGoLHxSmJs/6wih1I6xRQnYUMpK3ofR0vWbnRPYiaGrIfiWlwILEsP46mHkaA6
         bHlSAwc937t1/xt6FJ/iMDe/RsEwt1rWMDkiaBj9IFR5qzpXMOW01zl5Be5RUNZxVXaa
         HOOa/aSmkGSYKhvxLwqEJblLkrICew2Uk9/BRXkr8eJO38ehKX7obJDWljl+DrPitdic
         q4cwYPJHCdKNHIwtqAkFO0MOo3F/qc7L7x1xFxpY0VNFj6iNwRdevnIWWAqlg1BJJNRT
         nEmE1Q3m2PIweS//8Ib5P/PlsxdUdSJARdZVpY9Qa4qTzAIcUVfj6dYBR+R5P7R7PgVE
         5ttQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoyo4DYx447OOPxfOnED7T9EZ/l5+liZUHmxbKwcL37m6rXjEu/DDHyFGB7Yg07IGpUexcmjJa3DJPzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwftvoHB+kGxbpXktuVwDWrMygDEUOLP1p5TByit7vOFB6y9xk8
	CNZAgF1TW/DIedgPfc12XrgL+l1x7ppF82w8I+KyxZtMmhO9yjVZlFVy
X-Gm-Gg: ASbGncvUDNrIkxHD3IbqP7Fcf7RozXIJ/dQ+yOc1dgNNZmiYASTd98vBPlOEcOsC/g+
	+5ms949MkQeNa8VRtDae6SO4aMpw8XRgLV0KKiaPTItk6bR+J1X5DSd8K4VMpE5htSNhhxxjY0m
	X/nAV4EF2GhMq3pleDuvrMWlxW4RNUN/BTiU2w+EUWkSPVpZtpTSN6wJNgJuuSu8XKwel9XLF1s
	4bQQOBy/1zafuEY+jpol3U6zQnJ6nEIXhD+w+gMlabUVpUoOT99BpnDbtaKh5LFC0ichywk2nq2
	KKTQLdTU5S1E2vpJeGXPFncxCYpuhFFkTfCrwDwXyb3Qban6C5gfEDeqXUlNdqwn1v39qN6mgOI
	Fi2mkzNcynj7ezQvta7hhLz1furCMAigKmLTnL/Oo+0oG++tDGva5qRKwY3RY83PvC4TSSsNVvh
	8e5ea7pmYQaoiZDlhjHXdQ
X-Google-Smtp-Source: AGHT+IH7yi/yFmj7siKHMPw+MkU92NW4tigcvPRgjiSI1spL5Vh8ashM0eVWC/cROlPfU+WidZl7yA==
X-Received: by 2002:a05:6808:1a23:b0:443:a224:8f98 with SMTP id 5614622812f47-443a3179d1amr4879888b6e.61.1760931232450;
        Sun, 19 Oct 2025 20:33:52 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-443df628a35sm1586544b6e.22.2025.10.19.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:33:51 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 1/4] riscv: sophgo: dts: add PCIe controllers for SG2042
Date: Mon, 20 Oct 2025 11:33:43 +0800
Message-Id: <b34d819cd763482e0ecbc5c5ea721f0101d1f844.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_203353_528619_8A802A60 
X-CRM114-Status: UNSURE (   8.10  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add PCIe controller nodes in DTS for Sophgo SG2042.
Default they are disabled.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 88 ++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index c5e49709b308..85d8b89cf9fc 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -240,6 +240,94 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x00800000>,
+			      <0x40 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x40 0xc0000000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc1: pcie@7060800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60800000  0x0 0x00800000>,
+			      <0x44 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x44 0xc0400000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x44 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x44 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x46 0x00000000  0x46 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x45 0x00000000  0x45 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc2: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x48 0xc0800000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc3: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <3>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x4c 0xc0c00000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
+				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
 		clint_mswi: interrupt-controller@7094000000 {
 			compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
 			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
