Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63466FF8868
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L1rtVURgn/9tURTUW8rty6LJwVtqg6lMKMa1WI7ixrk=; b=TKh3NEiCJ69wtW
	csHBn1KU1eZ9fUEYkH9C6dG866l1xsyO1YndGR9fOCXwoDdgXHZGH6fkWg3HNdNdanBS5Xd49bwBP
	6FaiiNNmtKQcf9D1PKz5KZA/CJdw2Y5fPpJjMZPA408Ch4t1FGFB65Igo1zzP+rR8j44Fh4jvmGIq
	0uovzAFnkQkxCyDtkhNM0jbDkqbzQM791fWqOJFdsWQyh2uheG9LkuZzsAfv+8NobcLE3DquRUI7B
	Hu1P26gpDHQBJHyjfrmywSG70F/+4GdIPDPqdnqXEyNdYwKpCrDcrqw0LrGw4vTbWMoQC5/ouPmih
	cc1byF4lVRIgcmzBsIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg8L-00000001EAt-3vDs;
	Tue, 28 Apr 2026 10:57:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg8J-00000001EAV-3UBO
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 10:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20A9640484;
	Tue, 28 Apr 2026 10:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E68DC2BCAF;
	Tue, 28 Apr 2026 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373859;
	bh=sImdUFiTEcsJdvzgMX0S2OmS7j920K5wziuXQQGFWQA=;
	h=From:Date:Subject:To:Cc:From;
	b=UXFcVyUd66XBuZhePJDCFKvm3Y77H7TcLBc5a/CZ87XcuTMwCFiwpVSJLwFxuf1g3
	 G2/XPPz/p0oJALALcTIRGJAHWDKjvO2w1gDtxOa0Ll3c9vsJDgNHmAVYHpHHZuAB/J
	 fOQL8qVGoQUC/2WUl2m2WwWPDQl77q8aXChbJVsKc3U5cGSqySe/F8Le6Fd4Me+Hj3
	 TIEadrsbRiTBdGM2rFgyhRrCIVwqQSKafhAAGhDGejWhBiUfQfE5oVtdFQBOuZc5AI
	 aw36KKJEVjs+5bPZJRZnK4QlqFamKM0qQg4L0ANBQti68YDHmR+Ws3Fuy4laK45kDR
	 L8MCxcPSCjDUg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 28 Apr 2026 10:57:29 +0000
Subject: [PATCH] dts: riscv: spacemit: correct 32k clock frequency
MIME-Version: 1.0
Message-Id: <20260428-06-k3-clk-osc32k-v1-1-e2378da7cb9b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJiS8GkC/x3MTQqAIBBA4avErBvwD6muEi3MphoMC4UIwrsnL
 b/Fey9kSkwZhuaFRDdnPmOFbBvwu4sbIS/VoISywgiJwmLQ6I+AZ/ZaBZR9Nxup3bp4BzW7Eq3
 8/MtxKuUD+sOugGIAAAA=
X-Change-ID: 20260401-06-k3-clk-osc32k-198b413afdca
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=dlan@kernel.org;
 h=from:subject:message-id; bh=sImdUFiTEcsJdvzgMX0S2OmS7j920K5wziuXQQGFWQA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8JKb4can4DX2EGCETug/6t/HtvRYOvcPe/X3y
 Gy0mPy7gR2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafCSmxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1LdQ//fz3qLgK2xl4jCgcTQBwFSGHt2w/qnvoBke6D/sBWr43n/9cRlMwVE
 OZkIvhOITGPVsSbfZTB85uQqOjJODGSb3K2XkDTaQa1BrTD7xH3JdDbfKv8HMMVxLlTl2udl7i6
 JLUy46sqyqfgLiTLO9oxRcQtofjWmZAIVJYTrdozR7IpFrpMQdXzdgj9y5GUNNylkEVCfA4s6a6
 VJ89HJi1AlHoyXuba53lEprGDOPKhaGWHIUXVMGhhePyyse72VN36/tPM+dkj2NN+jd/cq0/g9l
 WUDZ6XyGjOYf99CC9LXLL6pIfij1F/b+yp3MeEV7a3hHF6zyVvgLqnyNV4IJQeKeAjDMYQX14HT
 TYm0bcBjkNlxXJisTJWHeT2mNyoQWaGTWwMs0i8txZ8PnCv6NeQ5FoT1NgdR8wAYEYFq+JF8jRI
 xbWDKBQTCAdfQ0lCLT/ggrfB7iK1utX3djtBlDb7vGTqHRdyDdFdQag/sPn1DDmbMksnD6QBh9k
 gE1Ob01vTF6+C6ikoke72ZQMfATbaCfYyrboI5uc3NlRI88QRON3XfPQzxzTQ5mdV2uzrLd1Qkx
 meMOonposZbPchIeAiHJmQtefX8mAG4aDwbsrhQAfUcB3c6hfxT5/pUZfgisaGFdtnWB3uHDDoH
 EU4iHNnf4oYwgRSw78qnaTuHB+Yn08=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_035739_915210_1FF7B212 
X-CRM114-Status: UNSURE (   9.24  )
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

The 32k oscillator's clock frequency is actually 32768Hz, so correct it.

Fixes: 67072c8cd48c ("riscv: dts: spacemit: k3: add clock tree")
Fixes: a6fafa64b03a ("riscv: dts: spacemit: Add clock tree for SpacemiT K1")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
 arch/riscv/boot/dts/spacemit/k3.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c97..b0b9c19b56a0 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -333,7 +333,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
 		};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..e6faf8d8759e 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -424,7 +424,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
 		};

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260401-06-k3-clk-osc32k-198b413afdca

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
