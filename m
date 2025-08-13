Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3739CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cVAnQXSB6tqR9qKyS42Y5Mo61ccEEgkfxfY/3Nu27Q=; b=0s+v6Vw0+Jzrn4
	/GDu0r/xFX7DMhJpgShrlukNB2KyFAd9P+NmjUgvn5N/6Zjc32sJ6LCcHxWERFycgNGtt5WjzpxsS
	6d+3tVIgsHefc6VaNf36g/ObLNO4OIdz5PrA/8WTi+xeyMsvelCKszFaOwZoAQ6tfNi8E1r34xWdC
	af7CRbc42ew64AOutbeMS79pPLt0ztP5bJtMtu/qqONnOxROT/mga4YatGyEyLg31WgPffBBN8XvM
	MlEMebMPRHGrhhyG2rD5ytHpg2C0UOmUCSMTi0TFGXYxujYM+tibko3JHKXHNOdrt8vV7XjkNN41s
	oXlKYpo1bVFhMNTYdBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6zr-0000000D7fw-1tDx;
	Wed, 13 Aug 2025 08:38:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6vz-0000000D76K-3ZWN
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 Aug 2025 08:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fLh7Kk4OYjALVNhIIaD4wUDlSppRWWz8p4xTrDTK0VU=; b=MXos4sgWyX6XbHiCuaZGvVBYO5
	dO4h2XFvat/ySWnlatEaocGXJF12udcI4FHdJFwXorlQvgf7CI5O+kp3OkMGmthzXnxFS62Zpgebw
	IA1ogH8aUikPHz+l3jmb+zxZnfC5jyDMisNoTlkX7ovWDgVYyZG+bbM3DHjtHjA69UaXJtRu1/0fp
	sHZlJL07PmACIrwHWy8KYPRVn+yAwXTZBQ26W7SgtLJYinSlJz0hdIBE7NS5ysZzaX5qGyfLEHvbp
	Xk3y30EIMGzZ3FdZ5PiG2UmCPXhzWpHfW18XtEEpLhBbPMCiGTBSj9S9dd9ZayUyX0I/iUfMjJJDk
	aw2rlecA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6vw-0000000G0nx-3hH5
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:34:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2403df11a2aso43044845ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074046; x=1755678846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLh7Kk4OYjALVNhIIaD4wUDlSppRWWz8p4xTrDTK0VU=;
        b=NFPzOay5Nb841MfWrdoRuCJDuQd/RD87p1nWdbMTcaV5rZ7FaYodxOmAT9tmBWLWTU
         wPhv/8nxjve57N1sbVMQGD3OfNZDj9bh/p4sZFIdO/vCNWjj3CtH9EmUolF/ncoxjHHn
         kak0VDBvT3YpxIK2cy37M74uugDvZT4/TPYa04QV+tectZiSqNcJw9zFyE+uU00LdZiw
         f0gryKzE5h5rOJqzmXPxXOHpa0nlinvCbnhHlax2pASmxgDC6Uo+uz9AsK9awClEcspA
         vc22I8ZE1Qb1TCJKmXFM7NzXfIR4KRUxfhxq6hbeDaynfheAGR3RP7hnIHFF8pTxLMRi
         fLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074046; x=1755678846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLh7Kk4OYjALVNhIIaD4wUDlSppRWWz8p4xTrDTK0VU=;
        b=mGZqf0JmgUSD5Q5rJzbvO/xDf4AY5LJM5YXT91xg9rGK4xDYCy1xew8qgz+l5Bc53j
         Sy41YZT5lVYDCFDVPRlXZjPYHYhQQSa1mXHIvvPH0odG6BT9W1U/qZclGVEaEKLt1wuz
         3mUJJu1i2hhBGZd7Vg3mrW+5ZYN8kEaNyiWiTLlSBStUfjoJa9+GMpIbDsN5h6OJtOS4
         3tcSS+UMlzYHyELsh6Kov8eJNMgq3HiYx/UHlaH50gzd07y4cawkbGp+5CO75Ay1j1d6
         bPpaP5OIMJOesC+WJ9QVm3ftpp9n/8ajEINRcfqKzh4kqMwwRlF9WN/B92QBly2sMb1B
         2lBA==
X-Forwarded-Encrypted: i=1; AJvYcCXLdrm8Jh5FUkzYfi9G73dodRLWdTLvXT/FEihglqf9IOKLJ2fLeBY5yuz/wg/7VPF60T1mwZKGlhbjmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRNrld+udlBlrk9hkF0r5SEQ4hN6ITO7fmaKuCofCf0caXVF4b
	KxUgHDvmjT65Hu+r97I2OQHh3LTHh9AcVqA/FVu1e3uL5WaQhBI0B5xEA5iR3wR3lKM=
X-Gm-Gg: ASbGncseaQLdpZCzPe9YSbPAfFOgFqKYjAf+Z2fRWM44AUzGs9ei2o3CoL7nPCItHH3
	ylOkWwnjP6xNvkBQ+vOHE7b+B319MNly9eeVkl3zLBAgR9zXi5k7F06m5F7zlyk4sBKRufsbT0K
	4LkOi/qXw3klkNCZ/AzxvKX5O190LSSu1rEXWMY98YhYG7o+ZIAraruLRGJxJSO3cXeLxxCexMj
	5+A5758sOWgnqbc5selnmNbE7rJkqDwCNfBS9macn647UJwKnNnozB/oWpixO7D53blfL8rpCmE
	631iArra/nUcIIGnWC3vK+amoRwGCeGuBZHGLuyax0jDB59c7N5eAMaG1NZoDA5fF3b5pV6jILd
	zeJy0vcZs1t6cW/h3eo6QOrNz/ORzgypz
X-Google-Smtp-Source: AGHT+IEEUcjPWyW3+EqWvnD5E8+0bREKP1ea0Z5KKh4lSYDKYOfsw0ft79JZxtY8fSAzLb94o+PTcg==
X-Received: by 2002:a17:902:ce8e:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-2430d1ab47dmr33684355ad.35.1755074046271;
        Wed, 13 Aug 2025 01:34:06 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:34:05 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:20 +0800
Subject: [PATCH 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
MIME-Version: 1.0
Message-Id: <20250813-sfg-spidts-v1-4-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=916;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=QR9rt1dx8wRY8ZK0TwZiHfOAeokIcX0oUcFGhOLvmKU=;
 b=Uus7GJwPp8hyacJ983Bo8pDUNcIFyjii86Yas9FPuyQSkIFFV67tvExpI9nc3thUzuBPLdj6T
 1EGrsJin13jDKhinFEmR0uA+IEAu/ygtsCjvUbhfQ/hJiUnN+AuWnom
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_093409_132181_609902AA 
X-CRM114-Status: UNSURE (   8.14  )
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

Enable SPI NOR node for SG2042_EVB_V2 device tree

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886ce17dacce791fa5f2cef14cfa214..7001d8ffdc3e04c5a5cd5da85a4fb1c0351eb9a5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -226,6 +226,18 @@ &sd {
 	status = "okay";
 };
 
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
