Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861CFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mh7/PXgP6dkc5naLPxMhHqyTImVF8BozkDdGUdS4wY=; b=gnrTEBcBFJA3W+
	JqWdREx4b3yD6Vuid3rJQGEqdEpqOCj+S7B4B0VJB29syhSv6ywRSwBFC/D83bvAq6o4SmidtfMF1
	dU2FxsGeSWBfI5QnJefmEPvsL8L06otWtrr0JuUKUxrrAyiFiLdkbek4z9mgeEVgJ5XQv1O9sUWgY
	LxPVCsljxw+rDO7MxQi/77FqueljnxK1xeQyQClervTVJmr6tyE43PfYOX0OBoas2RcZ8oUK8fGmE
	r5T5tTQLmOoCIl0APJSXuHM6aCiAP9tZJNOa4qlWi7DT65V4c3p8Gw2nFZEKoV8SIaqcFIiFMauxU
	ixxu50CZITmzonWTjmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CqG-00AaK6-OF; Thu, 08 Dec 2022 09:05:20 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cnl-00AXYS-Gv; Thu, 08 Dec 2022 09:02:47 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 48D1232001AB;
	Thu,  8 Dec 2022 04:02:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Dec 2022 04:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670490162; x=1670576562; bh=/2
	5Zms0aIlGn7UuOR8iB864vzGQsFadP0HWzXb42zI4=; b=0hEhAnbHJNDHMyjC0+
	obqd/bf6wKQ3lqcED9F0ToWleTIW7Eqh/cn2Ya0k+QRiM7YXwXyAmfAeHfIM/t9P
	Af4EQg8FsOOCIk0Pi+BbLeZ6TYW+WPqV2uyJvNTW711ysx8OscXixK+lApD32bhQ
	/lVNNlrp+JXOFUGFjupxOoUWbuwxSBUfy+AfQs9qhyrKbLVXTU+Eg4NtzITaiwky
	ZkBgaGufnhnRy/4tccWhnwAhDXo5MRqwp1JMRU3AMVLy6Py9SQbvWyFdTL459DeU
	U0Q6vN2aCpInHyDgSQsEM2cBKw907VnHzKICb6mtrOfS5SqQf5xdToto+YF3btnl
	vmrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670490162; x=1670576562; bh=/25Zms0aIlGn7
	UuOR8iB864vzGQsFadP0HWzXb42zI4=; b=Iitbe5M0PAyGVAxuUrPucZSEW35de
	NUymnQVdanHenoPwXlAkVWaho2lJvVYkv0iMZsW2Lh89oo1f01kIw/CfsydoWGkQ
	UdfYWdYgnwn5+MnXz72vNEHd14B51GMr782/g2HwIc1V4jJXLOzWcjLy1j75khfH
	w5FQtme3lxebiVZskIY2ox/PXdw2mjjr23xZOwttqojwBq9NNTUhP2/EmIsTeAhZ
	YQEjC81Q4dTUaJTF0ny/AHZ/zQpOmcr+h1JNcdsFtrBW1+3YfmnIRsbNljshUI5w
	gZcksNvxqPrrF9y+yxnbKDP1d81UyTTBKmfLaioG8+w5bz8THC2hgdKTw==
X-ME-Sender: <xms:MqiRY5xjmBgPvyWAdGQbH-FraoLFHLFHtIKlyVjTR3vJoFuA4hg7_w>
    <xme:MqiRY5StJsamoJQzOS9hjy7OiRkNTzqT_UFeBVX9yHKM5sViJJc6Q1wdWLS9SbBOu
    wZZtXbguJvUSPyizg>
X-ME-Received: <xmr:MqiRYzU4O3K8PM1iC-lBYDY8BWlMDBIuvwOkSxGTfTArOPrFZBvn_NLpHwlM3egZUTMtw1-N6yY2BI4ULnJIiFOCtX1ahrcJPwQNYOYR_ImVC0F3PO0c9DXwCMM4hQhqOIB4ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefgudefiedt
    veetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:MqiRY7j4deMr6WbmTd0d0nygcxQBxwF4nCl2-g8LCkVhrAj-PdKWow>
    <xmx:MqiRY7D6k-zOkQ6F6R4A0jQocRm9E2C9mP_jNgvEVik12jdN9Ovm8A>
    <xmx:MqiRY0J5YukAEh5986n_31irKYsE7gRrP36SdLhmm1M1QoX_pGiO7A>
    <xmx:MqiRYzYOOX8tD1le9c60gkdLSXr3hglrCAwiXpEsGe8JvQFcmoIUjA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:02:41 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 01/12] MAINTAINERS: Match the sun20i family of Allwinner SoCs
Date: Thu,  8 Dec 2022 03:02:26 -0600
Message-Id: <20221208090237.20572-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221208090237.20572-1-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010245_660543_EB8C2774 
X-CRM114-Status: UNSURE (   9.25  )
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
index 38293bfb1918..35f5808cc308 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1828,7 +1828,7 @@ F:	drivers/pinctrl/sunxi/
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
