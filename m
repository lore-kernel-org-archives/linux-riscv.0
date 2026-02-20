Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573DDC55162
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 08:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYinIC5loDQRP9J7x+DIrgCgRjURULMUUCFFynAhCzI=; b=ZdBNVLSLybuxvY
	MKdJMmYBDlYYskv+WvW0uxhLB0gJi+D7kpAPcgHpEW2O3NEObN0Qex7SwUqydX/ZZQ/8LqCMnsFX9
	rPDU8SOJ47OkZGn9Nh+ncz2e2GeDv2JNHvkXM5m2tyHdS4ujffnIrl1DIiREYgXHLUFvG5SdQEcGR
	L8D+cfj8vtYFvJR1iereWon2vQQkgHQjwHX7cZkcVkCulIn+OaCP69yGxVN2R/9o4SyqVUAlDnt7o
	jbX8+IeE5lXR5Qq7+rbUJ8mD9gR30twBehBaLkxBfE1DnPoxe7sYCM0+5GhfV7ua0sQkagcA0SkXm
	UAq44KrF7sNdSvw3WiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLs1-0000000DPlW-30Jv;
	Fri, 20 Feb 2026 08:28:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrz-0000000DPk7-0gYo
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 08:28:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-436263e31abso1621095f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 00:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771576093; x=1772180893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZV5sUmW06PeMcEouxXRCwFu2jwo5fAowFeT/xqFkYvY=;
        b=N45/QKE4sEMI3grq0yjQdAJ5bduU9jO++8KOahluRScgEuYJV+K0YFnDWKKEPvSyG0
         sQtDDHGceR6ILUtuayg3LIloPH7a5i4ILE8zOfYNBlsdyi8MFR8aLBrv9Pp/zdLlEsk1
         ERkAayvvIj3q+a8bdBew/Q0LW+DnzKfhR/4zcsTHrFfqXGy8C9YPkN+s4s0IadaZApLZ
         6zToLUg1rK2yphvUWg59JzZlxrHcs/Z4GrsNTTovd5oS11FafKfMzks1KpNwq1V2vNhX
         kLLf6F4GGoLubpzV87CyoWX8tvpcmL92l9xQLrB8quwbyRSXEOGKxZejUkeyoSx69/55
         hh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771576093; x=1772180893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZV5sUmW06PeMcEouxXRCwFu2jwo5fAowFeT/xqFkYvY=;
        b=nOUlg5FI2pF4cDzi4RnNXVFXDCQXAkw+9hCtbNELyr0abqKFIC3Pv1H9HNlwX07+Qe
         7HKYSH/Ib+ObxmTcfx5RY2fJKR5C2asJdS+S+F/EEa18uD430+MMyQqYW6tG5XNbg68c
         ITPpPfztdFe3p/DBauS3YH6qRzu2UveeRISuT4InmsQCJElO3GHRrma0Ne4OEnfPUItG
         XdweLkZ3abWFn/odM2mu7MMuFBRv5VU9p3yClNzahxyZE0WiKSVDQ9JCBX5vw3byJepo
         i3OiWE8Qptym4I54oPLCf6qCJftJjoqU3drIzwUczLvfmO9ClRM5/CRT4XsVq5P5bYLp
         uqdg==
X-Forwarded-Encrypted: i=1; AJvYcCXSqaaYXyn1sZ62JC1Xyf3oio6BQManpNdn4D+9Z6wzKt5bKLDrCye/xNmixeUpLXMZmlvomFocxCHzUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE6+5PB4H1lsdtBo0Db4uA6T1coRafaI0w6CatAXx+0I+PVKv3
	LI96yDyX4HTlPB5g1prmEP4kFHEAIx9UjORfx5BJZFkun9ZFkrtU8/pO7xQMRCL/lp8=
X-Gm-Gg: AZuq6aJO5hgpGAL8M734I2x8OCukoFlIxqvVe3Ahf0yvIV5PHhZwXyCZBJAMKj1MhMP
	eN1zBES+8PqGZ4YcBygLzzAvuYyumBhY5I6EM5KLflU4rgFPGIpGMvmXjWFEhDKMEZ3mjIU60db
	+B5KiGvXECUC14Q/eruw7DgEprK4burgH1hyFlAyQ6mZxlUE2/K5KkjsEFP4PquFxEJGsasG+Hm
	TSIJTfJWu17ihuwdl5zm8EIIaHvdirse2bajeZYVO2512aAiinoI/rWHEV4jsr/YTHyXLTXstsI
	VCla57sFUApRyYkRMIudPvGHoRWpK2G7qvkKsTd28m7/P3Po5X+FfR1yUZGIuIGht0NznJvOD5W
	D3TjSpUV/0tsuIL1a9ucMrb44V7OitU8/ApTJbW4w5YC+2FYWavAGoPZNaYXOnHabGFGhH1BJ+W
	12eO8sXWKUsnI76L9nIwZG
X-Received: by 2002:a5d:5846:0:b0:436:684:b94a with SMTP id ffacd0b85a97d-4396b02fef8mr1388893f8f.4.1771576093346;
        Fri, 20 Feb 2026 00:28:13 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm54717688f8f.13.2026.02.20.00.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:28:12 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Feb 2026 16:27:08 +0800
Subject: [PATCH 4/5] riscv: dts: sifive: fu740: Use correct ethernet
 compatible string
MIME-Version: 1.0
Message-Id: <20260220-fu740-v1-4-c8af54130c58@sifive.com>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
In-Reply-To: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=A1K63zp8qaSu12/rz2C04BAncHqq+vlSUPdPl98mUA8=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmBr8b2XrUrBxDXHt5A67Hwwa7ka+Ty9EZgdkQ
 7WSQEVEN1eJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZga/AAKCRDSA/2dB3lA
 ve0TDACsrXUlZYiA3LTQB96Ic/SvGiR39+u7jjo1RB8zDPY1fFcdIlM9ICXPe+VMcFkE0MJlwSz
 eSI4zgllduH5jMJBLGiVlFzhCkKG7r8LyrHyB+j+U+MY12Jioy7EGWP7uEdzokTTZBEABG6ft48
 OP7yapHigO+rIauXOp0snpDXnPRS4cA23v5t1/bGBeYWjJtrcpxDEfCIXHn0gcraFlWLAL11Pzh
 TMos7QkH9T1+whYSbQn6Ne8Pa2XfYaDbXynLLQCOptWUYRugy2DyTkYaaoKxFCRqFZUlHh38PJr
 DeXHrbyE3PpDPnS4PY0X+O3HCDFkiCfUyWe7rinj7YwZtte+BzrP1JAAzO5/n/pIsYS4CgPfw81
 3fxEBh0OY6uFUXTwj+FE8Uq1ZYko4KmaI9WBuSIQ00+nn/bijbxhRF3Aj2FIVv1bY/aCr2vDhfG
 UuoKrPQGX6nNz2NXw/tTQP4LXv/sV2yA0xGGYmNbapDjDybxtl9CFyahUAByOTbNPO5x8=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_002815_221780_09B402E0 
X-CRM114-Status: UNSURE (   9.52  )
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

Update the ethernet node compatible string from "sifive,fu540-c000-gem"
to "sifive,fu740-c000-gem" to comply with the SiFive IP versioning
scheme documented in sifive-blocks-ip-versioning.txt.

The versioning scheme requires SoC-specific compatible strings even when
IP blocks are functionally identical.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 6150f3397bff..15e11a03582a 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -273,7 +273,7 @@ spi0: spi@10050000 {
 			status = "disabled";
 		};
 		eth0: ethernet@10090000 {
-			compatible = "sifive,fu540-c000-gem";
+			compatible = "sifive,fu740-c000-gem";
 			interrupt-parent = <&plic0>;
 			interrupts = <55>;
 			reg = <0x0 0x10090000 0x0 0x2000>,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
