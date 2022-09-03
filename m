Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E33C38145
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8twf96KuLBvl4cqGPpDCicOjpBV1RrG8KmhHnP3/rs=; b=Vwud93s95K9MSk
	BzLzIiprSDDeyc/VqRYIl83iGGSJD4Q+a/tW4MUvai9H8badVmCfRus/XN75y/QY1Bq5qguZFDeOe
	fIYEcVF1EVdaJw6qeBnaYigK4vzOur5romgQcA5tvBlEhLdB1X2Dl//UIOxZB5/XGCrRPzLPZiqNs
	4pQx4PahAFJZH4lz0cyxO2Xkv8e71fBm71lhiSPd0t4itW06HokD5ItocKW//xmVgCUvoLJcOWQVU
	65Jb2RPk8mswWjF4uCDkn1V3ojazzMCc1h98jA5o3SPGfQXE9yRFiznVAPI7kuyiwZ/thBos4h2VA
	0IDOVFXyS+plewPmXdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUUxh-00Croh-Q7; Sat, 03 Sep 2022 15:21:33 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUUxe-00Cri9-J0
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 15:21:33 +0000
Received: (Authenticated sender: peter@korsgaard.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1FF3C1BF207;
	Sat,  3 Sep 2022 15:21:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
	(envelope-from <peter@korsgaard.com>)
	id 1oUUxS-002V0V-Mt; Sat, 03 Sep 2022 17:21:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  linux-sunxi@lists.linux.dev,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Paul Walmsley <paul.walmsley@sifive.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv@lists.infradead.org,  Rob Herring
 <robh+dt@kernel.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
References: <20220815050815.22340-1-samuel@sholland.org>
	<20220815050815.22340-8-samuel@sholland.org>
Date: Sat, 03 Sep 2022 17:21:18 +0200
In-Reply-To: <20220815050815.22340-8-samuel@sholland.org> (Samuel Holland's
	message of "Mon, 15 Aug 2022 00:08:10 -0500")
Message-ID: <87sfl8zdox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_082130_816932_B2731519 
X-CRM114-Status: UNSURE (   9.56  )
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

>>>>> "Samuel" == Samuel Holland <samuel@sholland.org> writes:

 > "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
 > It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
 > HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
 > plus low-speed I/O from the SoC and a GPIO expander chip.

 > Most other D1 boards copied the Nezha's power tree, with the 1.8V rail
 > powered by the SoCs internal LDOA, analog domains powered by ALDO, and
 > the rest of the board powered by always-on fixed regulators. Some (but
 > not all) boards also copied the PWM CPU regulator. To avoid duplication,
 > factor out the out the regulator references that are common across all

NIT: s/out the out the/out the/

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
