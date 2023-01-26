Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ADEC54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 04:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJU1E+n1plS8jDtWTr2X0srAia26NNyGMZ1WK0RjCJ8=; b=EuzRU6tADXhZh2
	NLUsN+gW19OQtTz98dN5hcvV8d0wCWNlgEr/Udtk19i/5NZw+/MjhJPzHrFLoOiPNuNxPTuhCrWCg
	P/5unIix+uRVYkXJDjNPY5h2kQ5W8V+tX15r7ylC6L+kMRJatocLxJBQ7QC/Ys2rntuTt87xCU7zC
	Qta1gWL1teeYOCvS2kCzCr22Bate210EjZFxLKFuTqmibeJq93K/rBNSSM0GJEBQZGC8H6135rsQh
	ryZyrCBDJTg4hOJRnw+Mm86+6+adZbn5hCtnskyVDmaXigEnNdcDEJthVY6sG8hlAEpD5PMZqAtSH
	iuzno+DTAUejchm4izWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuKn-009bXZ-GG; Thu, 26 Jan 2023 04:58:01 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuKR-009bQI-T8; Thu, 26 Jan 2023 04:57:42 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 188255C01B6;
	Wed, 25 Jan 2023 23:57:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 25 Jan 2023 23:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1674709059; x=1674795459; bh=X9
	s6cjs86up+hYIsx64vzFJpoNRPbaCk4kY0RDMfADM=; b=ZdfM3FHeaYvIoHcQHq
	Mu1XGs6brJrMAo8pzIvFqLwScLYzcIGA4/oKuganif+5zjOxXSlQ7kuIFKZ8avYT
	EfmX596NVkSAIdcWTDCAjqfuE9/XzN7SZbyCkCt5oIhYNKn5wjtq2kwLdUimeCHa
	1eWgUjERUxTu1YLjXZXfcm18LePGJVLjH6JGfHIMIqPUbbzuMeluTtyEjwPGZ6Ej
	gu9fN2dKLpqCBdK69J+jt7bHyPgwqkfDbNZk0EHa9qoYtHBWn0ZlJU8mCf/l+zvv
	UK5D94FncKy1GfcVXxk/aB5M0/N2XxnTOLBEcZzEN0TCjdZmvas3EiHmv9IeSWav
	okEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674709059; x=1674795459; bh=X9s6cjs86up+h
	YIsx64vzFJpoNRPbaCk4kY0RDMfADM=; b=aMnaHHNqYI09i7aWVOdETtUjh0iXl
	o82oN73/s9VaKfU4CxNbz0a/OfjJoYNTSfDCBnSNVLbzEl4HYGZb2+2KtSlJuDCg
	lCg+Q3+v5acB+D2jHnCDa/u7I1hVip8VfnXbaPMm0+abg63d/VCcsghXUN59sdeF
	2xk0i/wF8enIDLMibiEi2Ey8bsEAem81EHDJ80BZKVr3eotubyd0J1Lu5J/c0TGa
	muRgAVintA06SY7a4EKMh7hfDyGZqfWxscYY/n5UdFlSd1BS9mjU9L+KDZZqq4wM
	uHJUZaNDHLB24KEqKGkbsJnOGCsTYDC1hILNlYPFm0vC9Rs+K4rPKffvw==
X-ME-Sender: <xms:QgjSY1F4guQ851BAJdwAXIb008Ul94EDm9wK0nnSSxWQ0eA2EgVKFQ>
    <xme:QgjSY6UcSPQt2y8vMu-F_O7pprfFklElUaBgfvLgRKHBvMMha3NIXtMt7TMqleS7P
    b2iLu71QwwjfDrFmw>
X-ME-Received: <xmr:QgjSY3LI7EEpPFlG8Hkr0aAPck9gYEs8G4JfLBrY_MaSGcHqcJs8OV6NKJk3Dy2-VjYEEnptW4ZJBYjS7sIQoX0j2GBAXUrvrUnWWwVn8UyzdmlPPRzFOUQhN2_3JUaYulLvgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:QgjSY7Ew47d7ILfejfjoMitEvIH0E2h7fN1GUHwHEYEeNkSVEMtS6w>
    <xmx:QgjSY7WF6gYdzduL_fuaekaHP-J1QAvwOtBUA5T4tCCfJsvmUcGONQ>
    <xmx:QgjSY2Movl_2umPdOTWpoA3raCJrug0nggZetfpCFb9vI03Y18TmDw>
    <xmx:QwjSY8tjoUOnsv8ozOXKhBsh0d9L9hOe84_9EAkn13_4mO_kqitaJA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 23:57:37 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v5 01/11] MAINTAINERS: Match the sun20i family of Allwinner SoCs
Date: Wed, 25 Jan 2023 22:57:28 -0600
Message-Id: <20230126045738.47903-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230126045738.47903-1-samuel@sholland.org>
References: <20230126045738.47903-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_205740_034203_49CAEFFF 
X-CRM114-Status: GOOD (  11.06  )
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

Allwinner sunxi SoCs with a RISC-V CPU use the sun20i designator. Match
that pattern in addition to the designators for 32 and 64-bit ARM SoCs.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b0148001f92..2600c85bdfd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1887,7 +1887,7 @@ F:	drivers/pinctrl/sunxi/
 F:	drivers/soc/sunxi/
 N:	allwinner
 N:	sun[x456789]i
-N:	sun50i
+N:	sun[25]0i
 
 ARM/Amlogic Meson SoC CLOCK FRAMEWORK
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
