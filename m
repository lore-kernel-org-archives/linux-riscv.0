Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3393FCD343B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgdQOdNuB4LrW1zm2I0VM9sJVXP2Mucf+T4rMpCHxAg=; b=pMfVQDqgt0Sff0
	/LWj10ZfXtv7+oxfAN/HqEEizGSlVehCFfHk5E+BzgXfMp3N4TwWR08HiuXPWeeKS42wbcZQ6cKNm
	6nT5n2WqTLj3gnWQdUU833PgCj+XcAYZo7Wkk36kuZxa7mpyfcJF1JUOT9POdRJ5094hN8HylV5Y2
	lCo8njeeQnuPUXZV7HU1NsXqOt52bua6QQFoft8QM7uS4ifdc7TtJ1VJpEFgJG130MtdO4DNGWaef
	ImJRgK2T5EBmUfeosDD2/RKu0M/DrLPAa+L8pmqcSGoOxjofsV3cK2+XzutnVET5VcDXmtG6uZGPW
	YNV+gguQFf/jeZFoVHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsdl-00000002y3F-0qA9;
	Thu, 07 May 2026 06:55:21 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsdi-00000002y2T-48yg
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 06:55:19 +0000
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7029228;
	Thu, 7 May 2026 14:50:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: linux.amoon@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	gaohan@iscas.ac.cn,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Thu,  7 May 2026 14:50:02 +0800
Message-Id: <20260507065002.1883127-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502051906.8160-4-linux.amoon@gmail.com>
References: <20260502051906.8160-4-linux.amoon@gmail.com>
MIME-Version: 1.0
X-HM-Tid: 0a9e0133775103a2kunmfaa00f951983c8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGB5MVhpOSE9PHUlLSE0fT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0tVSktLVUtZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_235519_213632_9982C268 
X-CRM114-Status: UNSURE (   4.27  )
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

Hi,

>  	usb3_hub_5v: regulator-usb3-hub-5v {
>  		compatible = "regulator-fixed";
> -		regulator-name = "USB30_HUB";
> +		regulator-name = "VCC5V0_HUB";

Suggested changes:
	vcc5v0_hub: regulator-vcc5v0-hub {
		compatible = "regulator-fixed";
		regulator-name = "vcc5v0_hub";

>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;

Why always on?

> @@ -361,6 +362,7 @@ &usb_dwc3 {
>  	dr_mode = "host";
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> +	vbus-supply = <&usb3_hub_5v>;
>  	status = "okay";

This is incorrect. See the previous reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
