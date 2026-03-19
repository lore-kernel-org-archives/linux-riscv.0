Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF381091910
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 19:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RxUcx8BC7xLNrp37mUj6JfnfvLmWiHjB2f7lbc3/Qs=; b=iGtnk2/u4PucVT
	JeURZ1yknwv4Ku8+UbFjbaOqq+ZfIRS0xprpj+F/L+WWZ/kME7hZ14by7mIk1iP2uhSMzsmQZ6Ku2
	JSo2y/gt9K6TaZysgvZ6yS/LHfzwvBKYK5Hr1aOOid84w2TMtU17fpY9wzesrKwlymLklZpBSMXpg
	t7Rr1h0M9WH+UufaT6moyJQvmEAjxSZECafT0TS3ks65HCrPGqnkaoi/mPri0thclKGyes9ENujL5
	6tFgFEkFkttFRGLhePpOSlgJ6VwmclAA9zVtHd07EdqLp7PVJr4b2XEXWS/s2fZLlCCRv/4H5JAe8
	ZLN24uxeyVv3f3kGgNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JSg-0000000BUUl-3OFz;
	Thu, 19 Mar 2026 19:55:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JSd-0000000BUTp-2dEr
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 19:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 884FC40618;
	Thu, 19 Mar 2026 19:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D42EC19424;
	Thu, 19 Mar 2026 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773950114;
	bh=BKVZIah/27SLYSlA2gUiVUQcfkViEh1zQPpjbR2l7E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3RZ7ji8vqCdCclzDcS8bxpmooQGTTnlKkdFQgEXQg1eZhvBRCr9f4qrNJ620yjUg
	 YXtywyDtB3wVVShkAOr430yMfXJiqfY3rfQ1InBq05TObVmEqtHm54N2IyAgiJtvOW
	 iKPvf3mUn/pmOYLr3WRNE9a2eJQ/ySMghE5TG76mi4z5rJtyWPdlt7Egf5zN+IxS6Z
	 xfQ7LaxJFhQw4Il7ujQAJneS9zlanA5TqyXxq2dxbOTEGDdKtnTe1CrvJgY3S/N2zu
	 wrBmDbvn+/z5e9BiWqOALDtaQKasCXlGI8VZEuZybeyU/2gPSvL0WXjLUzh5ckvJ4r
	 Ie4Y49eFc4y2A==
Date: Thu, 19 Mar 2026 19:52:38 +0000
From: Simon Horman <horms@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com
Subject: Re: [PATCH net-next v4 00/13] macb usrio/tsu patches
Message-ID: <20260319195238.GT1753385@horms.kernel.org>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_125515_692384_81BB83E7 
X-CRM114-Status: GOOD (  17.69  )
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

On Wed, Mar 18, 2026 at 04:37:31PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey folks,
> 
> At the very least, it'd be good of the soc vendor folks could check
> their platforms and see if their usrio stuff actually lines up with what
> the driver currently calls "macb_default_usrio". Ours didn't and it was
> a nasty surprise.
> 
> Ryan and I figured out that the sama7g5 stuff is not actually using the
> same usrio bits as earlier devices, so there's now more patches in this
> series to split them apart. I've not tested the split or the new
> property due to lack of hardware, but Ryan has.
> 
> Marking this stuff net-next, because although they're fixes I don't see
> any particular urgency, and it avoids creating some dependencies between
> cleanup items and the fixes.
> 
> Cheers,
> Conor.
> 
> v4:
> - deprecate instead of remove existing devicetree property
> - pick up Theo's patches
> 
> v3:
> - reorder patches
> - fix smatch issue reported by Simon
> - add patches reworking usrio handling of clken/refclk (and remove the
>   issue the llm reported in the process)
> - add a new devicetree property for refclk selection, replacing the
>   existing one.
> - drop the dts patch

Hi Conor,

Unfortunately this does not apply cleanly to net-next, which breaks our CI.

Please rebase and repost.

Thanks!

-- 
pw-bot: changes-requested

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
