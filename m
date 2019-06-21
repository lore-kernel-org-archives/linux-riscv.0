Return-Path: <SRS0=JY4f=UU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F497C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 22:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E3DA21530
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 22:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bfuMP7Mt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bkZJOh+m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E3DA21530
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EISqgNsObPhM1llLasPbPLNRORj3mRHTro+WuAJ9op8=; b=bfuMP7MtJRpx6C
	Tpetai+0fhKSD5dW01Of8pgOMIgkI7xYRZ9W3ZFDWXpGHAmtkTymv+Cd7of24qqiwxghFphzsj7cQ
	3zrGQM81VvO4SOw83kvWlPhkoRnh3LLNB1HS1oSJFgddB3lfwUydhrmdXKL+Arl1rz9VsXtywDVS2
	ojHTuJh1L4FZUWE2GNnni4szan0LiUfLbXd4S3m/1voJkbW5WjAz4RldYkHZ2PXRXtR3XYD+XuvWv
	0jfcgYkNFnqnt8cWixTugNrdPv5VeNghK3qFMk+vihybFn0yWI7RLDY5e4O/JygQRIgzj6pN4CByu
	cdqG8eOKBbJqFtwPm3Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heRgT-0000Bh-8s; Fri, 21 Jun 2019 22:07:01 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heRgQ-0000AZ-5l
 for linux-riscv@lists.infradead.org; Fri, 21 Jun 2019 22:06:59 +0000
Received: by mail-pg1-x543.google.com with SMTP id m4so3386878pgk.0
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2019 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ryaqQTZCUF/hF6VaO5QT3dMTov2dUM5dS2MnCcID9K0=;
 b=bkZJOh+mMCVPn2xsEFJxgIc9ElvjsMXyto539DExGlvLKQCbEFYxF4Jd5vd9pOyLkR
 CjV5R5M89170qSsfAspvKmuBX6HMni74NRnyMt67MKlELohZ00koslBoKOQTAk8T3c7r
 Y9UBWw3sPchkhSZu2pX50693ihMbgRHvTpWtgjovbnAa0nIWZcVimE8RB9Q6XLJ42PnQ
 +xlBpQUuXhrTABFgdtVBBW3U4jqW4BIeWNRNdETOZ/QW1Fj9s9CLDjVNWIYSuVgxkXWK
 2j4QKgob0abP4Nspj5OVm0H74Oqa3n5eDNulAoiCVmSiZdLE1J7qooYddxZ6upU/MvtL
 +Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ryaqQTZCUF/hF6VaO5QT3dMTov2dUM5dS2MnCcID9K0=;
 b=qXo/nCrp5SYwQsO0c6iEs6l1p5RTWa5CGumcPp5qDobFeCNMEOIf9s47RBGI6pt3Bo
 gD0sgshIg/iNWSQz1obMGQtW/78fGH8XdbaE1/WzugVFWf5bb2I6aCJ6fvHKUTddLwxB
 2UEwF5c9QxhVtMMMr7DDz3touL7eZV+mS3fkbVK+NMHNgPNzMx/C8qqmXqaLZQbHsO2/
 whRqLqznJAh4v9WjbtgDNdd5ojC0OCkss3ZCDa4nhHnaVUKtp0Jt1BYC97SaIOMVd0fZ
 yT+DLIOPCikXlvl7DLpRZhxuea0/wWzx+ijiM4ai7xwwKYFeRvqUpmmC0JfPml8C4aSd
 +oXA==
X-Gm-Message-State: APjAAAUGflyP3oO4pblL+hIrUWYS7VchzkwL8FX5I72xKGxrQJn6qRXg
 cDtVLQHzmhwU0Dez1s4F9ruxWw==
X-Google-Smtp-Source: APXvYqxHWwW/4SNCVZPUXPZki+bZvZo66exifsW1I8Pi10mlK+p5QI70JPDdcKnzJm3wapKHkDCOCA==
X-Received: by 2002:a63:4556:: with SMTP id u22mr14410988pgk.444.1561154814071; 
 Fri, 21 Jun 2019 15:06:54 -0700 (PDT)
Received: from localhost ([38.98.37.134])
 by smtp.gmail.com with ESMTPSA id x7sm3439038pfm.82.2019.06.21.15.06.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 15:06:53 -0700 (PDT)
Date: Fri, 21 Jun 2019 15:06:29 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
In-Reply-To: <1561114429-29612-2-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1906211504170.16518@viisi.sifive.com>
References: <1561114429-29612-1-git-send-email-yash.shah@sifive.com>
 <1561114429-29612-2-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_150658_227629_405FB813 
X-CRM114-Status: GOOD (  11.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 21 Jun 2019, Yash Shah wrote:

> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Thanks, dropped the "reg-names" property from the patch, and queued the 
following updated version for v5.2-rc.


- Paul

From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 21 Jun 2019 16:23:49 +0530
Subject: [PATCH] riscv: dts: Add DT node for SiFive FU540 Ethernet controller
 driver

DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added

Signed-off-by: Yash Shah <yash.shah@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Atish Patra <atish.patra@wdc.com>
[paul.walmsley@sifive.com: dropped the "reg-names" property, as it
 is not documented in the binding nor used in the driver]
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi       | 16 ++++++++++++++++
 .../boot/dts/sifive/hifive-unleashed-a00.dts     |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 3c06ee4b2b29..83f40b00ab63 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -211,5 +211,21 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+		eth0: ethernet@10090000 {
+			compatible = "sifive,fu540-macb";
+			interrupt-parent = <&plic0>;
+			interrupts = <53>;
+			reg = <0x0 0x10090000 0x0 0x2000
+			       0x0 0x100a0000 0x0 0x1000>;
+			reg-names = "control";
+			status = "disabled";
+			local-mac-address = [00 00 00 00 00 00];
+			clock-names = "pclk", "hclk";
+			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
+				 <&prci PRCI_CLK_GEMGXLPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 	};
 };
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 4da88707e28f..d783bf2c3507 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -63,3 +63,12 @@
 		disable-wp;
 	};
 };
+
+&eth0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
