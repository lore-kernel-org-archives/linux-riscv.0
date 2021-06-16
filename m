Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07332C48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 06:27:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB9D610A3
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 06:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB9D610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BKgLmM8SaW9NdtBhp81pfHmvgGxntcOSB8UJMprGGuY=; b=DSKPvaWPFdF6Xa
	uHXAzlLNOmrcPU9NKD/Na0kcOEBJo0RQ7dN3o96fkLHw/MpjEENWIEjdxD8IRqPLGkA1IJ5MOnxMZ
	DBwMB4+ed9lfr/uIH8F04GKV6RkNw3YdvUOAUPUlyWo8AM1L8DjECFkLzLp02NeJ9KRnMwFXIYpd6
	d77Bjh671f1jmJ+a68GoQnB5MBtjK5Lqgy4IHS+FCAoHetIdUaz7vz2zHFLGG/UhW+Vq2Ot0M/kYw
	kNL9dCh1zIkE77MYJEjTB+996QTJLh+6PviPeEVuDRd7uzCumJ0cQkQUpdeGqG83V9qOoHU+dk0X/
	Eg/opLWuc7hagget2cMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltP1F-0052H3-5Q; Wed, 16 Jun 2021 06:27:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltP1D-0052G9-5l
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 06:27:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id g20so1994970ejt.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+kowIMZQ6qVgiuTZOJNVb1LHky3tzdkwgBTNUCmfeCA=;
 b=IVQy9+VurB3pTo0F55g+gDZYGtgRnY3cZ9LtWQV6vuC1p0C+W7d3alWq5abY7+9x8f
 uJ5MNjY4skEqMtS4/Z+waHETfRZlhmbop9Dq7dq/BLnZOxTUcTC91XwcWC/nW4GGjrxN
 0+ksRhprEoYZ5VgZdVYYn1oaPGwIVo7jVHwkpkxICm6O6xGYYSMmwxY14aGgoisHkx+k
 qzIccUmDkpiM7QINTiDgOf3bDdzuY4217hBeQIV19RTKnLp/HVufzLvc2J61u2eN03DJ
 CcVHkVICdYMWNkixVRpke2hjddt/0gM5WgnDTS/Z9Iy6rgXFwObiulPThV5uVIm7MWtH
 n8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+kowIMZQ6qVgiuTZOJNVb1LHky3tzdkwgBTNUCmfeCA=;
 b=n3s6tTUMmuqOe8/x6qeWDfZPa4zlx1izi2PT3CjefOd3AYycsSoOfsN/3U8+6dBjE5
 MlFJ1lBvAML2UwbmPjrGgkXVDFpUclWmyPvHkKoTmnwsw+dU4zpeZeFAVqJKlpMcCUni
 Sx8CWFZstSy3urNbCLNg2851BTzjv1QUDe5G7v4w8ffnh5tcdaFijJl5cndV54X7RSWH
 d4z6u49CcthIwLvB6fd/r2fzUZRfXfIOnX6klWAiRDraaWuSEbA0Vnu/NrPINg3AeoJx
 7liaMcOMdlSn9c9DJGnLCV/Tbfuws+c4G+0B4sOx+1aFIFxpzAgBTxmPuq8J9B8iXtpd
 OJqA==
X-Gm-Message-State: AOAM531tBlNULSDjZpvVUVrNWAcWRmkNvcRSi79xWQpc7VxniISV0vBe
 H+0HWgPTtaIt/KSl1kdu9YE=
X-Google-Smtp-Source: ABdhPJwW5j3oBNhV/+UvzHR9Xrvr6sMshJZwuZCmm0479skkF9wfS1sgALCiSJ8J02rU3EDVUoAo5g==
X-Received: by 2002:a17:906:7950:: with SMTP id
 l16mr3594476ejo.120.1623824838006; 
 Tue, 15 Jun 2021 23:27:18 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id dn7sm428872edb.29.2021.06.15.23.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 23:27:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] riscv: dts: microchip: Define hart clocks
Date: Wed, 16 Jun 2021 14:27:39 +0800
Message-Id: <20210616062739.398790-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_232719_287127_75208183 
X-CRM114-Status: UNSURE (   7.23  )
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

From: Bin Meng <bin.meng@windriver.com>

Declare that each hart in the DT is clocked by <&clkcfg 0>.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---
Similar to https://patchwork.kernel.org/project/linux-riscv/patch/1592308864-30205-3-git-send-email-yash.shah@sifive.com/,
this adds the same <clock> property to PolarFire SoC CPU nodes so that we can
calculate the running frequency of the hart.

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index a00d9dc560d3..0659068b62f7 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -24,6 +24,7 @@ cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			clocks = <&clkcfg 0>;
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -50,6 +51,7 @@ cpu@1 {
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
+			clocks = <&clkcfg 0>;
 			status = "okay";
 
 			cpu1_intc: interrupt-controller {
@@ -76,6 +78,7 @@ cpu@2 {
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
+			clocks = <&clkcfg 0>;
 			status = "okay";
 
 			cpu2_intc: interrupt-controller {
@@ -102,6 +105,7 @@ cpu@3 {
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
+			clocks = <&clkcfg 0>;
 			status = "okay";
 
 			cpu3_intc: interrupt-controller {
@@ -128,6 +132,7 @@ cpu@4 {
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
+			clocks = <&clkcfg 0>;
 			status = "okay";
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
