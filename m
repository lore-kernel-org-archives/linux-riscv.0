Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD2606A329
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0MH8HkNA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=vgMm3iiP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LPj5u6I7LrxJ3ZY0sY4j7zP+Ne4bFU1psNRZpbdRCl4=; b=0MH8HkNAfy0EFE1JYZYfR+/vo/
	asABJuvsprta7VTTvXlzUgbgtrtLn/ZvJiOxRWu3AegEXd2PCSeBV1U05/5N4cuvGIfJqzQh5UN/0
	2JRXB0nI4YzCXLII/YVvByzmeb8kaTBdXz6QnDv+7ls9O/HWDm8hMmRsUBh6C/9PXi8lNd+TLJul2
	vuUnAJdjgxSwmcVIN9LmJ+zTsOJUKoAf/gB3nTGCm/GGV6fM/Y5bsyedlNNUnDqDA/uQWJAOxkjmk
	k282iEvPfiF7HM5yf5B2j3P5b8TAb5u8Tx/RfrPzB91Kes8jf65xpeuUpWnKYNzmW4Kxx2+Bh5raD
	zfn25O4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsm6-0000000897V-14Tu;
	Thu, 05 Nov 2026 08:24:46 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsm0-0000000893V-31b3
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867038;
	bh=hwd03b4oCgS4GqFIi/9dUHS1Ps5EbCjQLunVnbEDyFY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=vgMm3iiPkR4Pvr5Fh2GBO7VT5/BsBT8BizL1WyYLQklQOeVsr9E2Sq6AEA7c4pzrq
	 aS5hRAkRZJpVSiSfu1LGY94DON1KGfoRv9BnzOWrwQ0cUQ5dhO1U9mkGxO/2nQEVlE
	 6PjEQWUprQc5jqZ15XVK6V8kx6PuEhaL0TtbMQ68=
X-QQ-mid: zesmtpgz9t1793867036tc136d1f8
X-QQ-Originating-IP: 6MV5lNBqxWrrQ3epTJah2Gro7KiiQX2i2TCR0ZaOn8Q=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10439336763918379975
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:46 +0000
Subject: [PATCH 1/5] riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD
 card vmmc-supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-1-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=LrvbgmnWcLNmZtDiJKa0kTwRdFCDSwqAPnOekOW136M=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbIX5vY+V3WV/lSvwUZKn2XLjr/hFboWOxwrVT2/Vu
 HF2xUGejlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIlwv2X4X+mgKxP1Oez0areJ
 h7x729nvznmxfOo17eOfnV9Kzs3Tb2VkaNY+ZXfg/GZZ0TDRo7WcpbITTARvKN0Sm8n9vsHt2zY
 DHgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MATWLsGrXobhBBI2jLOTzA7v4DtxyQR7vGnGE171GRm/sa3briLTzusM
	Yyu7FEPQrvJl7N34N+xRSMbHRA/Dj67wOCVYGqKWUKOEJxYxXE/2SVtprZNV06xyNiwh5nQ
	uQSKjFXd+YE6Jr6jvSZcb53PmYMJSahLivgbwF3F6GM7eQ2M+uypnGHOm6Aky4ZnzMM9IBP
	07NAHbRpVIrRyVDx265CjuxXCF3tuwCQnuG3AA9VKxiuhhpRxA1sIv0Mgt+ypNvvyWRKSAz
	wRag1sAMm0D3dM2h9x19m14bQ2h4HnJIDU+xNTZCeTFp5ZrdPOzCFGwUxYzsxWtxuchMC1v
	vKPmMOzCQx1LTMYTrmOR/bOD0DdARSK88wHdQbAbOkYIyfQZMC4H+ZNgW5hQCNbxZmPflbc
	olvYUJgBJttG6N5pRCDSbvf8ubOnAEDy8DNHjWQXVpGY+i2DtZ61x61iip7L1bXJexY5xwk
	OEeD7X+AVW/8Qb8CtU63l/zOzsr5+2ywAkEnlVFvjCoDuNQIvmyIw6+Zyj+oLesycCkczYw
	tRzqlC1dILoe5GhOH9oihodlmTyWYxYZvlcmhO4eevEt282shs9aXqzpj6StIRMQvod6Ia8
	Mn+USdqRaoaQrBjqaBxOR6n7ybzoyEDlA9cXbJgUyEu6SzJMjMJY57fu9gtIIyhzv7LnvPM
	u7ppo9orch8IorKd4CUIVrLaMy4NPmQguDSErPGMBmOe/pKYfCoDnwtz6FimO/QTJfKaBUr
	bNrpEHGEe/v2tE31vBlcijP1Zfy20D1czpF5YUoDf3M/381HwcyYv9RvPlOh2hf5/7faySo
	5+XKXPpzyfbtGfnMp+k5FwE2s5hIjTYc9LFxV7T2U6ymxX9ndMfuYYWwbo9Xr/9ex2uO5O/
	IQCBbel2ex2jVBGxhXc0vk4FIjSU7Cw+IEBwawr9l5iw8vmcIm2CZBqaE9Qt9B+uQmP13Od
	ZDCR737zi8qRErN211nCiSEhLJnTmsLAPesfQGOf4To+2ybP4i05wj2gTFFVQYwbkIgYhFH
	HlXXWcDTZ2cTBt3/KqdjN71e4zQKnrrdfUN2LMXCOi0uZNjnIq+mO9MDGKOEriN5f99nhgn
	HcVK48AJA6+NDcPyNG60bNtmUWmJZltMzyeuo3r8Zax1HV8ALzdrLM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002441_187564_0F4F3960 
X-CRM114-Status: UNSURE (   8.77  )
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

The SD card VDD on the K3 CoM260 module comes from a fixed, always-on
3.3 V rail that software cannot control. ALDO4 of the P1 PMIC does not
supply the card, so referencing it as vmmc-supply describes the wrong
power wiring.

Drop the vmmc-supply property. It is optional for a card powered by a
fixed supply, and the SDHCI core then uses the voltages advertised by
the controller.

Fixes: 055044260e7a ("riscv: dts: spacemit: k3: Enable SD card support")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index fadcf28389be..6e295bc6f196 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -122,7 +122,6 @@ &sdhci0 {
 	no-sdio;
 	disable-wp;
 	cap-sd-highspeed;
-	vmmc-supply = <&aldo4>;
 	vqmmc-supply = <&aldo1>;
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
