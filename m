Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A123DC27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 22:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIPWvJmlY2r7VA/OPdgHZUBvKOjMQxpa9myidicHMWo=; b=WZMYuaViWkH0oA
	vXYYbVTHA6AafJ0uZ/cLOXah0y+/rKsVfCbbZrCLYUk44igHcEYYlNk4ah2u0cTSsXWst8L4HTanq
	SW1HU6+11/RuQj+yjQk4r76G9A0ntCBqth7D0DYd5HQN6yxI5VGbNqVMLafdRPH70vrKY3Q13azIQ
	XkPJHuWb2LCKVVh5dwFwrJ1zsJkC8HKvUvFnaWAB509so45HYSzVqvlZiQpxIuy0Qg/wMWrfwlXiF
	xWykCmM3jwtrRG/HXTpdfz3/8MDHFRa1qqRfS92nokEeH/rnJagkoynaBTlmcfBt9ZpJKV3ymZIYW
	oYh+KcfOWF+BAcBTNxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyfp-00000008T79-3g4T;
	Sun, 16 Jun 2024 22:48:33 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyfn-00000008T6o-04ZJ
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 22:48:32 +0000
Date: Sun, 16 Jun 2024 22:48:11 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <20240616224811.GC3983622@ofsar>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616-exorcism-computing-e11e26084a62@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_154831_109133_761D3878 
X-CRM114-Status: UNSURE (   8.31  )
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

Hi Conor
 Thanks for bringing this up

On 19:35 Sun 16 Jun     , Conor Dooley wrote:
> On Mon, Jun 17, 2024 at 01:18:52AM +0800, Yangyu Chen wrote:
> 
> No MAINTAINERS update, so I figure that means you don't want to maintain
> it going forwards? If there's someone out that that does care about the
> spacemit k1 (Jesse maybe?), then I'd be more than happy to have them
> look after it.
Yangyu kind of has limited time, too many stuff for him..

I'd volunteered to help on this if it can fill the gap
Also I'd be more than happy if anyone willing step forward to co-maintain..

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
