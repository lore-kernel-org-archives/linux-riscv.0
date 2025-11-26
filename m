Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257FBD1039B
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqqXaW57BCLYj2KkPQil1eMdKJ4kQ6itJ04erQJJmZM=; b=EfZSB3HWnQ5wDb
	2tAxjA9FZEvtda/htMIOTFk/8W6SFiGV/oSxR+cRqq0IaoF32o53o7hm40NoLUWkPsg7WpAyyacXZ
	Uc4kggj+JzsTgyy6la8f9KWfeUxQmK/BE3sYGgoFva3UjBlbHX5KK9k4yTqiTv/ACvbF7ERgBz9mQ
	PHFmCgCItntX9gG9soAraRIo8vUhWaY9V5wVq8OFMufsbV1JMSK6NVnuYvuea54UKApQ/T1UxgWIw
	V2ohkPWVUbo9HAHUzBztt7piMlgTb+1Q2hEdnm/uOXK5/tmx8wuRlvtlZXDhJgft5+sdOVRzieP4u
	vGHgoaU0UP2MCkvnDFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJJZ-0000000FO6D-0Ait;
	Wed, 26 Nov 2025 17:28:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJJV-0000000FO5l-25NL
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 17:28:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso88885f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764178099; x=1764782899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iIZajcwOeO3JlEw92TE30lt4StjWSsYhVcOwVzrTLk=;
        b=PSUw1/6KRX0pRwD02UYR19Jv/brcFTXwaK/qsGg8UrsdG4Gq2s6UgX34TAh4+BIOht
         lNaJHtjYRws7qZ3s+v/yxqigDNeXpLmk7p9MTKXjbNkY7fvVhMINYHh71DElm40yUOjC
         SIb8HV/GU0p9unEtjtbTp/QfoJsyytmLLV6gy6gGxvP69pF27HT9qpJpfolX0mOTfIyx
         4agjFPzsFWoL5X/nwjWKN/WVNrsiMaKUb3ZGrXNKclDAX5h6fAo9278lNpBwA/XLK3yq
         UpaRt33qgDnbIpssfjZGNkPjY93NHR22V6dl78WwgFhAlwa7DlIkAcvsNiX7IVZJpo5x
         vYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178099; x=1764782899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iIZajcwOeO3JlEw92TE30lt4StjWSsYhVcOwVzrTLk=;
        b=Xecp0CmjU+gi0N/VTKjYS9rCspzfruvolRc1ap4jXPvBNOF0nahbDpR7Cx6NZXboaT
         LT/w0NOeV7X0Us7T8uuu/sVNqY61e1WvdtlKBm0pdK2RewhdwRXeaArVAQ73QxvpR09n
         jAUwoTGMlCq0iHtsVaRKZtrnZDVoYTqqdZzZyLZq+4Jp0XaWaUlx1Km1+X1A4QHks7oA
         gorGlUYsfjqlAuxZdvwYX4ugGYEsfiw5KyUOdWOrS8sY9PAXQg/m5rHJhPEeARIJ42tN
         3mQHDmlFsXzaEv+88x41rpdXr2qfj/612VdcRhXoXbnW3PNYuecDyl9v4VmPm0tqvxm1
         RANQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJwJsLe+CDq2//eKoLvd0x6rAePUeTNQTAykMMp34tyxBeee+7WJvxTpACtb0XnP15kTmWQJZvIaJLsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc7ZagUt0BPPH8rYoGtSFUQPv5y6LYXhWqosM2Aq/TdJMMrL7W
	m9DgVz2vWjyUsUPI3CssvlJpzW+dlBQU/NNYttkIhr4RIYgJhwA5VuEx
X-Gm-Gg: ASbGncteqA6dCIhAtAVsNj2M3uEvlSpye3/CI2sTqLKuhpodcPDuAYXmhCn/gmhjaQI
	M5GxPK6TFD+ERyCmnlE0CXRHUSon2eSdv12jo6d7BX2CcaukcJ8DdYMaKHYo6RW/Le3Zv8ojc2v
	X2jzEg6j7D+HV4ISCxUwgsR11ML2pYorWJaS1FUtp5AeA2P68jvyGFMQf19tqKa8zqClI8Y3R9k
	RG27rvvU+YxaOj+1bFUO7XrPdEXywIaEJviIKZJ/C4Gmz3IXahOp71ZKe/4BzYSnuCEAkFeozcZ
	hvJSkAOW1mzt8hFshtJSr6clJ0WVUxuTefoLlYnarKUU3iBtDe1ApwdNI8BykVqQ5JoVIri1Eb5
	Wij3jkZ4J8dxOFP5ryRTphFFL2ucKQ+dkhoPk12k78jrTTShJTXogyezwSpHKgo0fJyuLxLXkU6
	2uBMkBCAzqFsZpWqVuOKRPOvLweV1EHxxG9wdbV/9RGuZKNwIsrJ9NvOw=
X-Google-Smtp-Source: AGHT+IHkE1xTyUwd1e1nQxaACHjDh3t9YedvuMNt3v7wo3xJTnJ11as69WRfu3TcTpDawcaME3AxHA==
X-Received: by 2002:a05:6000:2881:b0:429:bc56:cd37 with SMTP id ffacd0b85a97d-42cc1ac9ce9mr21647296f8f.6.1764178099006;
        Wed, 26 Nov 2025 09:28:19 -0800 (PST)
Received: from dev-AI-Series.. (bba-86-96-93-57.alshamil.net.ae. [86.96.93.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fddsm42423862f8f.14.2025.11.26.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:28:18 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: inochiama@gmail.com
Cc: alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	huangze@whut.edu.cn,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	sophgo@lists.linux.dev,
	thomas.bonnefille@bootlin.com,
	unicorn_wang@outlook.com,
	yu.yuan@sjtu.edu.cn,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
Date: Wed, 26 Nov 2025 21:21:16 +0400
Message-ID: <20251126172115.1894190-2-stavinsky@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611082452.1218817-4-inochiama@gmail.com>
References: <20250611082452.1218817-4-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_092821_576615_F4AB1C7C 
X-CRM114-Status: GOOD (  10.81  )
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

I've tested the current dwc2 FIFO configuration and found that USB
device mode breaks in ECM mode when transmitting frames larger than
128 bytes. For example, large ICMP packets or iperf3 traffic cause
the USB link to hang and eventually disconnect without any messages in
dmesg.

After switching to more conservative FIFO sizes, ECM becomes stable
and no longer drops the connection. iperf3 now shows ~130 Mbit/s RX
and ~100 Mbit/s TX on SG2002 (MilkV Duo 256M).

Fix the FIFO sizes accordingly.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 1b2b1969a648..06b0ce5a2db7 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -438,8 +438,8 @@ usb: usb@4340000 {
 			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
 			clock-names = "otg", "utmi";
 			g-np-tx-fifo-size = <32>;
-			g-rx-fifo-size = <536>;
-			g-tx-fifo-size = <768 512 512 384 128 128>;
+			g-rx-fifo-size = <1536>;
+			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
 			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy>;
 			phy-names = "usb2-phy";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
