Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E43C83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBdf2FbRfRQw9drLujhoc1/sfzf09+6FwhVWS+1PXYI=; b=k5j0vVjkIpj+PI
	q3/2A5h7m8atOrpyN5VsPFU6AtFngCy8flEdc9R31MDL5g2vPMlF5+D5uftpkfrrHA0vqoIe7PnFn
	B0DCQHCLSf/JwbqVU4VPUPFKdJaIpx7cyjM9VY2+pRpTRB3tTFIJje5sjogSL5G/zd5tOiiES0GK8
	HIHEcvsGLQ19bfnt99fxo1xftwS61Tr/uZtOVm9sBvGU5CNdzPW14BISYs09JFia5N3IT/sT1Nfrd
	ZrCP53dbcM5skcIqxFL+PiSfUg3GSvSc+mf/fMN+ElUg3RIaFoPPJXuFh5xjHUc4YYO0ZbbZN5MC6
	TN8qxZicEkSBnB6XPU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciQM-0000000CJUE-2JxX;
	Fri, 18 Jul 2025 10:34:42 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uci0C-0000000CGcb-1xnw
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 10:07:41 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3380A340F28;
	Fri, 18 Jul 2025 10:07:37 +0000 (UTC)
Date: Fri, 18 Jul 2025 18:07:32 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, palmer@dabbelt.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add OrangePi RV2 board
 device tree
Message-ID: <20250718100732-GYA700698@gentoo>
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
 <20250718084339.471449-3-hendrik.hamerlinck@hammernet.be>
 <8ade99a6-84a0-4e69-8ebf-d9dfdc9141b5@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ade99a6-84a0-4e69-8ebf-d9dfdc9141b5@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_030740_526198_A88BBB26 
X-CRM114-Status: GOOD (  21.48  )
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

Hi Vivian,

On 17:10 Fri 18 Jul     , Vivian Wang wrote:
> Hi Hendrik,
> 
> On 7/18/25 16:43, Hendrik Hamerlinck wrote:
> > Add initial device tree support for the OrangePi RV2 board [1], which is
> > marketed as using the Ky X1 SoC but has been confirmed to be 
> > identical to the SpacemiT K1 [2].
> >
> > The device tree is adapted from the OrangePi vendor tree [3], and similar
> > integration can be found in the Banana Pi kernel tree [4], confirming SoC
> > compatibility.
> 
> This isn't particularly crucial, but I wonder if we can do something
> similar to a jh7110-common.dtsi arrangement, where most of the boards
> sharing similar designs can also share devicetree source files.
> 
> Easier said than done, probably, but I think it should be possible by
> just comparing the vendor dts files.
> 
> Again this doesn't need to block this patch.
> 
Sure

> Yixun: I'm assuming you'll be handling this. What do you think about a
> k1-common.dtsi?
> 

Sharing dtsi file for similar boards is generally fine, I saw a few
other SoC maintainers have done the same..

In the practical cases, we have to evaluate and plan carefully, it
should be manageable to support fixed number of boards for one file,
but would be nasty if expect one common dts file to cover all boards..

Anyhow, I think we can revisit this idea and having incremental patch
later, it's not the problem for now

Thanks for the suggestion

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
