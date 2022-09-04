Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25FCECAAD3
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 20:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QlTORUSkbP6rtSUSPt9KBsz6Mdwje3KTr7RdpFyjgM=; b=1odTHkRmxxwHid
	pkpnCjkhxPfJrRy0m8GU2gGrTgkGKQOgFKazoCXeRQAfGjXRg4OjSe4LfpxoVYtefJ4g7GR+fMW2x
	j1g+TKQe0OtIkrRQK9Wxw2+jCQajsThRU2hPQCfIHDoCFlszibTBTkrU+17ZHGc25DmZ2cF609P9a
	XbXRgKq0q3xl7acZJShB3nipt3ZokSBtihIZQ6Q1pMvtA8ceZO1V96x+PIzeiYfsnXr3bNZWtisO/
	V7vKl/JFO32xgyb9Pb1W0PKhAFKBdufPzmN27TYjteOr2JR+TXiJDq5qkcQ7FfUlwKLVpajdu264l
	55RuffiyZhohisD54ODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUwU7-00BNKj-VA; Sun, 04 Sep 2022 20:44:52 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUvxa-00Az7u-6u
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 20:11:17 +0000
Received: (Authenticated sender: peter@korsgaard.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 74875FF804;
	Sun,  4 Sep 2022 20:10:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
	(envelope-from <peter@korsgaard.com>)
	id 1oUvxD-005rMX-Lq; Sun, 04 Sep 2022 22:10:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <Conor.Dooley@microchip.com>
Cc: <samuel@sholland.org>,  <wens@csie.org>,  <jernej.skrabec@gmail.com>,
  <linux-sunxi@lists.linux.dev>,  <palmer@dabbelt.com>,
  <paul.walmsley@sifive.com>,  <aou@eecs.berkeley.edu>,
  <linux-riscv@lists.infradead.org>,  <robh+dt@kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <heiko@sntech.de>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
References: <20220815050815.22340-1-samuel@sholland.org>
	<20220815050815.22340-8-samuel@sholland.org>
	<adc4a8e2-7347-7616-99b9-59762023b2ff@microchip.com>
Date: Sun, 04 Sep 2022 22:10:51 +0200
In-Reply-To: <adc4a8e2-7347-7616-99b9-59762023b2ff@microchip.com> (Conor
	Dooley's message of "Fri, 19 Aug 2022 22:10:44 +0000")
Message-ID: <87o7vuzyr8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_131114_685923_D87BB69D 
X-CRM114-Status: GOOD (  16.24  )
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

>>>>>   <Conor.Dooley@microchip.com> writes:

 > Hey Samuel,
 > Finally got around to giving this a go with the fix for loading
 > modules which is mostly what was blocking me before..

 > On 15/08/2022 06:08, Samuel Holland wrote:
 >> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
 >> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,

 > I am really not keen on the way you have things, with the memory
 > nodes removed from the device tree. I know your preferred flow
 > for booting these things might be to pass the dtb up from U-Boot,
 > but I think the devicetree in the kernel should be usable in a
 > standalone manner, even if that is the barest-minimum memory
 > config.

Yes, this also confused me. Part of the reason seems to be that u-boot
on RISC-V doesn't fixup the memory node of a provided device tree like
it is done on E.G. ARM for some reason.

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
