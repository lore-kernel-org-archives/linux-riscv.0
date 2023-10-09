Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51778E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0WIgSosrlKwx6DVuNkqOK7BhwcRrvWMmhi7gubRXMU=; b=oM4Uhs9T0JCmbg
	lfCQA9kMBkaxYoES01UL+q3bZttqY2OG6pHx9NUQD6wbtcIixV0TF8B62q0+9t3NleVxDZkf7X4wD
	qlW5q5KRLXUUe1JogX7ZLVeqZL4yak6LeLhcvSV0JAC+2IP9RHdGVGOllK9uE59PfG/1Dob4vLyl/
	0Qd1qp8I0qqMzHFHnPN43NPJJ7+7+vcLHen1tpZz3tnR1xq0jI7k0u7eOC9BV8DYxLe9IEHTNmAZE
	wVTgfOPqr607h1c7zaUYVgVsb2lcPjmYyODIonXXmxCCCcL2UX6KcVoFMAVoHK8UiRoo7Nc4OFbI2
	EkQgGVpk4DNUWXDrb6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmoa-00A7p6-0n;
	Mon, 09 Oct 2023 09:44:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmoX-00A7nY-1l
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 09:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696844677; x=1728380677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kiFiWXf0X7YTKnlUryjTPWfXBjavhZEL7/N/C8FSjM=;
  b=tVMJtwtaoq89RZhvFrNaHMjrTwfNRvNH5zZAR2iBbEBimuPF3K8J+9Dl
   cqhtYukySKkYXkVKhBlFiYcBwd5a1/PH+/u1EEAogQIYhtRGn2uaeFqHs
   Apa+ouFTbRU4BQ9lPaRZ1+Q70TVXiCm6eR1maQEy8HczyYyuY1fHW6hms
   XAjxKoJkJt43deh0C/6sh9Nb8JoOxKSSZje8dMVIXcEzOvJWQP9jHsKlw
   eNyuTGTWuHRGgorhDYI2fNcrod1ac/GOCTo4ONf6k+PE5nXRurAJrG+Rn
   /8FJOhbt3fI7gn8DRuqLmar1lsxSZg84hkVw9FiiVxlRbpxLI+LF1s03c
   A==;
X-CSE-ConnectionGUID: ExFLQ79KS3SJV7MWrGq2IQ==
X-CSE-MsgGUID: my6VmZ1KS9WOwm6ckdPIdw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="239927170"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:40:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:40:06 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:40:02 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.indradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai
	<wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Daire McNamara <daire.mcnamara@microchip.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Chen Wang
	<unicorn_wang@outlook.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 5/6] riscv: dts: allwinner: convert isa detection to new properties
Date: Mon, 9 Oct 2023 10:37:49 +0100
Message-ID: <20231009-moonlight-gray-92debdc89f30@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=7kiFiWXf0X7YTKnlUryjTPWfXBjavhZEL7/N/C8FSjM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKJ1/Fr8/WfiFqvXtltb7OSo9vh1wvG72dcC1uScmSyFn7 7O+FdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi1amMDAf5Zr48puEkVbn3lW7x9X MGX5d2nFg9x1tXOE/SueR9uAbD/6TXfJuN37w8UlCSuUPsYuqJXAdDxk9vj7+/9H+jCYfucnYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_024437_591563_B0CAA425 
X-CRM114-Status: UNSURE (   8.60  )
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

Convert the D1 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 0856f18dc3cf..64c3c2e6cbe0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -25,6 +25,9 @@ cpu0: cpu@0 {
 			mmu-type = "riscv,sv39";
 			operating-points-v2 = <&opp_table_cpu>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
