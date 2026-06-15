Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FBCD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iaETHQNkzg87YTwZ8jGuixnnPdGeZJA4e5xUqWJr3GI=; b=gGqZRylgfY18Ip
	3oOn9HGE1BPm8hCCK8lUlrBhk9WKivCk6rix/5kRx1NKA4vGhdkyCMOBBkNp4sfU0DOH+OCxQ/gZU
	LSl38VLBFKKEYTyFX+wnohjnlfnuNDZPU9cIwZ4g0A1iZC7gGHnEGLMYcINVq6ymtJWVQbaETzsW2
	oqSP/PNhnYbr6C5ZazmfwsM1wnGmFAe8aiOqHR52+MP3hHE97TN6cPoSDFDZVbpcboib7bMSL+Wso
	85WJNhCENgQZdnzW1PmCYekMgaar9LlciLDbvG+V5CjhfZYdz0f+td3BNffx66RItgIJ17tlZSzSu
	pgkxe9goRqknoeI0K9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZE12-0000000Ep3F-3fZS;
	Mon, 15 Jun 2026 20:34:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZE10-0000000Ep2L-1iNz
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 20:34:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso34010805e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781555676; x=1782160476; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlEk+div6nGGh0ueIq6wYoXxweMlzOM7O4EcszKdFpY=;
        b=sGixvPax4MFzpib2kNpRMwcSUtQ2909zUfdl8jLxDzMp4kydsL+feDRfywBWRZ42ar
         FqJPD0XdnEvxjkcMrTyK5nBsnV11anO3zTFAiSdEle7DDr6xxYnCuFz7lTQK1k/n7k26
         IImYZgW3gPSgRRQKzAa29GS2tSjXbwyWeQspu8IRxBEaCavd+nmGnFKOalfbimSEW8ah
         cHwmZEAhwRxC0qf276++baKKfIK8XnimWVnOO0bnCz8GxmjR/i12BKEvtKK6BGSiG2fP
         LQzgfjl5hoaEP5MxY4QOe6Y6e/wqWoVVJLyPpf3Leqd/3doKu1bUCOCBXeO/luLPE3b/
         42pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781555676; x=1782160476;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlEk+div6nGGh0ueIq6wYoXxweMlzOM7O4EcszKdFpY=;
        b=J5K2KBMaWzcEX5fnk3VxT2wYc2pMy2KAf31Qzoo66GG+lcEGS2DoO/5YECheAId6PU
         nBLIyIeJNOEUhO8hABij2VZJo8PBVfohjJfxmaWThq15fsZihZNaUeBRf9y76R6ROtyi
         IKA7cq6FiBVtWuNOHO7nI/cOO89SCvfne8HREIK/BfZIkrq3IHoGSOxcwT7aB+RrgURh
         716al1Gf4QHUM5fm/2BopG9MooqNEhpKFNfl0YmVBd8Bhlcn06Cv+lesEGnB3qqfXRR9
         iBO6vZ+mV09ucfJZGJTwB8yYk77D7PqTVeP1C4uWR/irReBnHksCJhIJamREjzYjw+fQ
         jzWg==
X-Forwarded-Encrypted: i=1; AFNElJ9qYXIdvzEWSnjUjyM5phFsU+fLn1jxHUBnvdyIjG+d6wWE1M2AVqPB4kWn7Dyf98lLpoVYapYB1I7hWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRYuCl2t441fNA4YJid9L0LHN7cMxlzurazQl31y/sncmkmeSm
	5G+dzI0PB/DEqDKaaaLdFsSjXY+4qUBjHc7zbFoil32INHA2fMY0jJu4
X-Gm-Gg: Acq92OGw/DrvUc9gQbn+5o/gYU67bcudmdziJwuVuT0No2yAS0QNA2IODfDAXRvr7kW
	0tPGf4ZS3xgHbCA32aL4LnnL5uzq45idS5/Lt08ramdCkJPItCwvHDirU8bqytzOyLPk9d++XGN
	/Ir5Pe74Z6obY45b0ToXSvcj5xoMiclYIf7Vm0TrAMZHUt4TdiJwN9Yr7KLJC3zcAq1HNOJ5Z9r
	IhRhkeHtr9HWF4NHJ6J/Yae5K1DkDMjApnZYBy67iDmvVVELn1quPht9vupoKbxhrUexaT+KmQJ
	kOfEPyoM+BCBkpW0UDs3TNeZQYaZWlvjv1uiLNppycVuYgR5E7c8wrDpmpWPV2Hw/QX1cyRh7fv
	zpKSkmTBc8ib9DxezFYIK17m1DHF7RldQXemmx/b8mBrMdUySPa00FRW8Oz3PSTWcKANE8/gH0d
	9/0uzc2wMldSSumLJXiPxB2NSWpa7Av3QwgokhXHOZtEqteLxo4rGp
X-Received: by 2002:a05:600c:4e0e:b0:492:2e1c:1d19 with SMTP id 5b1f17b1804b1-4922e1c1d3dmr48342575e9.31.1781555675807;
        Mon, 15 Jun 2026 13:34:35 -0700 (PDT)
Received: from 10.0.0.2 (82-65-243-93.subs.proxad.net. [82.65.243.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922f9cd140sm18001655e9.0.2026.06.15.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:34:35 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Mon, 15 Jun 2026 22:34:34 +0200
Subject: [PATCH v2] riscv: dts: spacemit: k1-orangepi-rv2: Add cpu scaling
MIME-Version: 1.0
Message-Id: <20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOQQ6DIBAAv2I4dxtAIdpT/9F4QFgqbQMW1LQx/
 r1om/Q4m9nZXUjC6DCRU7GQiLNLLvgM/FAQ3St/RXAmM+GUSyqZgDsDPUw24hNC3ITBQZw5CNT
 Y1ILJUhuSt4eI1r328qX9cpq6G+pxy/2MXJnyyfGv9S6NIb73f2a2TYmlJUNWIpjGCqhYpaBrK
 IIqjVCSdrWh4hz8w3k82kjadV0/ViVhtdcAAAA=
X-Change-ID: 20260615-k1-cpufreq-orangepi-rv2-5ece985163cd
To: Shuwei Wu <shuwei.wu@mailbox.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Vincent Legoll <vincent.legoll@gmail.com>
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_133438_467686_46BE3951 
X-CRM114-Status: GOOD (  10.32  )
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

Enable CPU DVFS on OrangePi RV2

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
Tested on a 2GB RAM OrangePi RV2 board, patch applied over
spacemit/for-next + Shuwei Wu's V3 series.

On Void linux (musl libc):

uname -a
Linux opirv2 7.1.0-rc1-00043-gb860bca13be4 #14 SMP PREEMPT Sat Jun 13 
11:02:13 CEST 2026 riscv64 GNU/Linux

awk --version | head -1
GNU Awk 5.3.2, API 4.0

echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor

echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.300s
user    0m0.299s
sys     0m0.001s

echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.432s
user    0m0.429s
sys     0m0.004s

echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.476s
user    0m0.476s
sys     0m0.001s

echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.582s
user    0m0.581s
sys     0m0.001s

echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.778s
user    0m0.773s
sys     0m0.005s

Changes in v2:
- Fix indentation with TABs
Feedback from Yixun Lan (dlan)
- sort includes in alphabetical order
- use b4
- Link to v1: https://patch.msgid.link/f031e13e-d9f5-414a-b90e-a3d5a60b8d05@online.fr
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 35 +++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7c49bce427f3..2c2542e02d6a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -80,6 +81,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -162,7 +195,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

---
base-commit: 32cb211965ea0ba0ab8568959f006c7fa10e9f23
change-id: 20260615-k1-cpufreq-orangepi-rv2-5ece985163cd

Best regards,
--  
Vincent Legoll <vincent.legoll@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
