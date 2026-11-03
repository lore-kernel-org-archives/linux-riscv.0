Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32C6076B87
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEOnHnrr;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=EcLo26a3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XkC5UeSsb6J+PblsSMghk91jJ3cgePQKSeVx6MRDTgY=; b=TEOnHnrrGwx6teOhsD7xrsTrTQ
	veCLseper66b4F9cTsmpD/G6L2ml9ON6A+lufNwb+UPlbADDne7bbCjRExBum8uKz/2Kx7+LgBICe
	7Rc3PIvYg8piO+p9meEeDRLpSyUPEl9UXI2PvEpWx4svH/wcvrN0eUPh75SK6/ZZAJr2DAuzfuK+Q
	iE8j4TW+v8AEc9xfS6PM7/9uJPSoYUCuhBXMh1GBcQW3xZ+QRgao2m7X9Bww4TaW+YS0AkjJ/lXBH
	b/HZWutahHGiwP48FO3ckMcdfoMjAL0SVnjfSm0YrIHLOBGbcTpOd5u/bv+sSR3NemVNNmUOmG/Jb
	aKO9VxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA1b-00000001ZwH-0EdI;
	Tue, 03 Nov 2026 08:37:47 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA1F-00000001ZpW-3Wrd
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695034;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=EcLo26a3AGIS9XZNSijAaKMHz00dPQ/WvTDDzwSX9id3eZ4dshhzDOiY1QM6IuLBg
	 BdBY7z8zU5i9Y5H9tB2Ab7e4tLqn4/xypEHVLmMTjGSbaH0eCYveFahlJOcnJHo9Gg
	 hquJj672weI3fKVME7SxRRHrWdyGrGJs49j2rxds=
X-QQ-mid: esmtpgz12t1793695033tdc4d96fb
X-QQ-Originating-IP: JcdVJio/hJmTz6vZxxa3J3Rp1TnfThoafdDs7/0vr9o=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:37:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8282491870121424289
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 03 Nov 2026 08:36:48 +0000
Subject: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=MskIDgqPGeV/8XRXVLyf9Iga/gwF4QUehWI17LXRw8Y=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5yrnru7ZKtn7onXL9yWxG9MvyClvTH93QWlpWOpF4
 7xTl5V3dJSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAExEVZzhv0vekUhWF/cDDrxR
 pVOqWQ8HlGlVZ/Jsiz1gtfW+YfhpMYa/IoKTVOcGz9JyXvg4a2+4gGt8kbb+7mr9U3eX2zz+vms
 ODwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8BaT0GEeXPx/NNhnjzhsl8/Fiox/cTCavMobl6pYUcejSbd3fePUASI
	HpSumTidgvvd+N/rl1aeQyxWmCyulCDBWWgCQGsAj9TMbXh6tiAwAGy9OuqpRNXaN9njka5
	hSLCWkevuJsy5mEE0i+tScdDAQQnCvAvAGUYZKiGVk1H+iAFIQ2NR/WbO2brfm42tk9EsKM
	xEdfZu4iPbKoBGoSmyRdCE5mSZN7paP/K/CgRRejiaPBWzoGjzdXdaDIk/L17AvmrzwVt8e
	Rtzt/qosckBk/lN086VqbY9mJumxm3N9BoyArJ6oI0O2cGetNyzLlarY1Nxr60a611KosoU
	teWSH5UXUMyr38D/c6JTA6EDLIdepSasCQiAO1ahQPkh+rsRGOqbBQiXxXfKfVxzPm12G6U
	/gzLpQmonTIGJ5kXctYmbfXuIXm8heTkscjnF551I6EhlAXwBbrfp6OgULlYlqbCxtLFlpj
	jDfwU4N7QNY6h/AUp9FzoeMAJN/ZwrftrxRmrgF728w70yJaZtU0tiNm9qtwslLOPlH+a8y
	2vMuiOWa1HcSbP0PAzDZT9BAd513PJuhjYoOJnGq+vEuQKBoIRCcU7AoIfkN4qIeoQdVK9J
	yGAQytn+cFrN7ulwW5YP7z9tTIfxWMrFOpno8FAGfQyJc53XWK8LIN/i/TYc89k+sTeKVU/
	M3j42CTdqQvE2j0qsNTmnhw08c8T/IFmy4FRnxyZtfKfvgP7n1uir9sI+m+OQ5n50IgwfHr
	Jlo1mHjrco4nAXe39C/vquVs6TVgBvTxd0jeuabi3dPA4NtC2clPj8fZYQFOpo4Cp/SgBc1
	6v2gs74rt6UwjGWdskavwovV4lr86/X2ovbbKdGNmbUb/o2kJY/GCfR2ksYYOxroOqjJiUI
	LKqbGprKZnMRstI5t7EbaactnVgnKLVr1QIReDwnLZZzJAJ8Ex6kQ3NvJqHyXv3h1VO9uWU
	XjPTTEoOFwf6y88Z9YUTKWSoAZ4LccwbU3Bd5lD1BjzlnnetkPf8ZNFTcpGlSvBPl5FhDQ/
	3XQ54Uw4fqIpbAuN66Jxf8YWeEkoXuIuWwIFja+tTZqNpi+q0/ES5P6f827+zDBP/OvxiF4
	gy8AUWSYelx6FDiQry5yvnz1u2NtEyREgFRumuW6MkCu+tjcKGHiI/6g0Sspg+T7J0kEZeE
	ctAx
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003726_282369_FC1ABA77 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the first APB timer block and its counter 0 interrupt so it can
provide a shared clockevent. Connect its functional and bus clocks and
reset, and select the oscillator-derived 1 MHz input for a stable counter
rate independent of the PLLs.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..c3db90f6bf14 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -583,6 +583,18 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
+		timer0: timer@d4014000 {
+			compatible = "spacemit,k1-timer";
+			reg = <0x0 0xd4014000 0x0 0x100>;
+			interrupts = <23>;
+			clocks = <&syscon_apbc CLK_TIMERS1>,
+				 <&syscon_apbc CLK_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_TIMERS1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
