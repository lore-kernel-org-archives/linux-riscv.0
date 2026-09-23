Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F16C98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8L5L4tiSyWrJLyNjv65bNHAmJjl9A/dBgnmby7wKA6Q=; b=Pvbh89KgUVX8+6
	5OoZgMs3W8W9rT6UJdUSF+bV3m/aXsdO5NFuwVelFhEKvjPLoOYyqJbS6W+R/GGB7o9+iBYn2AZXP
	dJ6fwxJ7d94nSrTcQEEyBQ6OOWMLAO3l1fW6TG+pa+I+wDGI2UKDTMDA1IZnBhYO0oEIjAqJRGWaU
	nuzMsxH3EwXQamey1yI2sFbcjVsJpRWmjQAIz+e9CydgxfYikQqsYsYEAABt3uuTvPjAv2jeUCiml
	W4RHQVDbSdB+X7ra/YBrjNSDGOFUshkn0eZQdDC96SzEKlXjr2dO4txkLnudqgqCdiYoeqArVQqFe
	UMITxoWj7XmF9HUBePXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QrN-000000093f6-31vI;
	Wed, 23 Sep 2026 17:34:21 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qqt-000000093Xh-0ZjO
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 17:33:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790184810; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TK+mhxWqSQlHReN6zjRE3fAskmD8Vi7nKZ6VQaq20716RDwvlnHRyT/pCITIXg86sKTc9EpnMO3o7KbM9Yd0lfGcRJYbCyQSNSPoEArWwCxdWxdE7q5liGQ4SfYmxSG38wqKXpAvHo/+dU6vMAAJXkO99Q0gxz85cxvYSEcop8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790184810; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nsanluhTpoeM0bPWCnlDUgLBI+hwIJEThPZvWCMVm0A=; 
	b=TbKb47s2NDWK917dpDcHeOCsMXYSlAThLAhCqezjHOMy2c07XphGyOK6WieNc4d0pQtHhUC5wL/4BfhBtooYFUZOrBaFpQVauPgVQi6AoymH0g6kKyS+qdiLAgwoj4ubQfeS0T8BJqUmSQ4h5+d0b3e1DE5BEHC5apL0uHqCWx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790184810;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=nsanluhTpoeM0bPWCnlDUgLBI+hwIJEThPZvWCMVm0A=;
	b=CwMkLaAhi97xQnGSnnqt0hhYccOsCycdzbbdWV5zNxjV2MMcXVRGww4uzq+VHBf0
	7vY8cSRgeGiGP6aoVqR2FRX3sMkFvtqXuAZ88Ar4QXB5P11DLskN4P5a69x9z/78t+X
	NI4/ps41AY6+rOPIIxGy2zn+lzFg0s9ocgCVpD+M=
Received: by smtp.zohomail.com with SMTPS id 1790184808288542.8755653328309;
	Wed, 23 Sep 2026 10:33:28 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:33:18 +0000
From: Yao Zi <me@ziyao.cc>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>,
	"Yixun Lan" <dlan@kernel.org>,
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add
 USB controller and USB phy support
Message-ID: <arQNUQ92Dx3TOKCR@pie>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.183.46
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_103351_295033_906C86B7 
X-CRM114-Status: UNSURE (   7.37  )
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

On Tue, Sep 22, 2026 at 07:04:34PM +0800, Sandie Cao wrote:
> Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> USB A works on otg mode, it isn't configured currently.
> - 4 USB-C Ports
>      - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>      - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>      - Port 3 & 4: USB 3.2 Gen 1
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 44 +++++++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi          | 66 +++++++++++++++++++

I think the SoC and board-level changes should be split into separate
patches.

>  2 files changed, 110 insertions(+)

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
