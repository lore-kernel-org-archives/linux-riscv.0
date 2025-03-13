Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8875C28B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 00:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHX4u6w1hxroe2XBlphPcKMUyM4GPIVVRDE+Ra6g6RI=; b=mzSwO+5prmNGWB
	/CLOXcYuceKE4GRsuWg/uNG7YMbVx0qyPOd1uUZngrlKiBwnQJnt5qQGCF+7C9tRA7IbvaqdYaH0Z
	ZBrhN1s7oaLygvj59H/+XVAQSgbIaWJkMizuFagvIv/0ISMtIuUOAXSd6Yz7YfcmOMaKWMB571RSq
	9RZ6O44IstWw5hoRBIF1SwR+UICEXoi3rRjC01klC6fjzMjxnqCIh6Z3zJ7sNG9VoYbJudmML2B5X
	69Egi1SmNcgDuqcZCeT4izIelWtafUiuL94VKsK4cjW5B0brNge447BeKibPzE2mFo7fqbIpVeLs0
	J6OeXIotbn/SGkkq6PUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsW9e-00000009nAX-3lAo;
	Thu, 13 Mar 2025 00:10:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsW9b-00000009nAD-3CPk
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 00:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 314615C04A4;
	Thu, 13 Mar 2025 00:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC902C4CEDD;
	Thu, 13 Mar 2025 00:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741824626;
	bh=8soeqXNN5au4hvLPUpIInyAV09m1jrjYWHYC7wip3jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8YYd/W1Va4DqX+vWN/hqTBRjVKF52OQw9S5xTtXKNEZEaKCZKKvvpARrh7h4KA37
	 NdGwZajanvod9BZutuW0zg316W5OPu8BLBYfMIv7Al3se+N/DZz8E+aHXldMkdViXA
	 dC9SjaKMbmCPHdlEoRGQEVM9RJ/M4ajF27khsvyzXlUYikoFPBfL3CHLsenxxQdlzG
	 DVMHdVSBT4kBJnNgzRb+GG6O4n34K0EcgF3oflK3Pw9HQpTydjHL0eY+g8CPNOjI1X
	 QwNIevz66YQRxs9YN761dVFpdo6raXh+t+9q1Y7gurd3sd7F7zOYppaGe8O0S52gI8
	 5EQZGS3NJ8cJA==
Date: Thu, 13 Mar 2025 01:10:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v6 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <nrmoj7gookedlz2e3fgu3hvn3s5fc6vrxgjueynyp5orj63k4b@cqlhflioxv7h>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
 <20250307-k1-i2c-master-v6-2-34f17d2dae1c@gmail.com>
 <7d9e90ba-8c23-44dc-b64f-80213216faf7@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d9e90ba-8c23-44dc-b64f-80213216faf7@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_171027_846013_2CD29BE2 
X-CRM114-Status: GOOD (  14.63  )
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

On Tue, Mar 11, 2025 at 08:46:31PM -0500, Alex Elder wrote:
> On 3/7/25 7:13 AM, Troy Mitchell wrote:
> > This patch introduces basic I2C support for the SpacemiT K1 SoC,
> > utilizing interrupts for transfers.
> > 
> > The driver has been tested using i2c-tools on a Bananapi-F3 board,
> > and basic I2C read/write operations have been confirmed to work.
> > 
> > Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> 
> I have a bunch of really small suggestions.  Please consider
> them, but whatever you choose to do this looks good to me.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>

thanks Alex for reviewing, I will wait for a v7 with your
suggestions.

Overall the patch looks good to me, as well, even though I have
to give some credit to Wolfram's previous comments about the
i2c-pxa similarities.

I checked the two drivers last night and I can see some
similarities, on the other hand I also understand that it might
require some extra effort.

I want to check it again, though, before applying.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
