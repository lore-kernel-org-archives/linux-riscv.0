Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1236EC10F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2SjlH0FEc4Clm5pAi8OCr5Ekw/0rQ3X6+roKOJVK4Y=; b=phqhIHXEUzHQsA
	zLICGTKjo0PkoWQBOAU9LHiI7EcRsR0y4PG4DKDo2K0dAG7O9CdPw02UNBqzxqVuS5ZlocxQbTwld
	EeNP3BR/mZW8r36su2yD7QLp0x+paNn92yE1m1+5V4GSYoa8MZNt71JmC/8LNFFJZzTyjwh8fAcUP
	YFdweGa6zPaMkLyq2uP1+OuxLci7Qgp0CrDNe/HJ59sFnlc/y1ePdH3XCe1UazZMIdALEtyvmT716
	mQrUvbNosqB7CSO9x/xsAs+04/aZEw2V3NpgYTfiuYFiPfb+SxylMxSZlARuWb0CFE/Ef0mzHW67R
	445thhiQn+L58amFeZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErF-000000012hC-3qJP;
	Mon, 29 Apr 2024 00:27:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErA-000000012fF-0x7n
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A68D560BDC;
	Mon, 29 Apr 2024 00:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD60C113CC;
	Mon, 29 Apr 2024 00:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350415;
	bh=oTgkNFvfPsJNNr6c8qJP0JFAmo0sDPa2N3exYAFyIsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YfzXQFNaEpaUPyw1zspe5HQciNWWa4VCRsIcmNAj003gvqq9L1h9jiEBmTAp5Hq7T
	 lE0nV/tFIGHi2JdquFbfROkub1yHMRJUs2TbwIfKnoYwgXZhelhDFpCbSU9VFnCL6v
	 V0Uy7KbAw8LMglYp9As57LKOYmCgMUSvGUFJL/Qh+2CDOeC6FQiArbuYDyzhhZ6AVE
	 gJIfL0m7UPlj7SHXGr8ebpJDA1BsXnYXoVdBS8B8lV92mkTAwMxt7cg/tSOItSjPVA
	 qOud96fm40NcZB1Bfow84LjBiAYMhf1MUYOiFvjbpFSG+zOSdcmIxnMQ8HcdDwKqD4
	 Mhz5yQQGxoOdQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v4 3/8] riscv: dts: starfive: visionfive 2: update sound and codec dt node name
Date: Mon, 29 Apr 2024 08:13:12 +0800
Message-ID: <20240429001317.432-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172656_431340_EBCB0201 
X-CRM114-Status: UNSURE (   8.79  )
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

Use "audio-codec" as the codec dt node name, and "sound" as the simple
audio card dt name.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index ccd0ce55aa53..50955cc45658 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -41,12 +41,12 @@ gpio-restart {
 		priority = <224>;
 	};
 
-	pwmdac_codec: pwmdac-codec {
+	pwmdac_codec: audio-codec {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 	};
 
-	sound-pwmdac {
+	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
 		#address-cells = <1>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
