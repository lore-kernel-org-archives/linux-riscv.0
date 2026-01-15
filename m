Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6B6D41149
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvTPcx9rmWdILSn5+XSGt6rTMqXcJpZZj5HqpsQV3rY=; b=vGk6iHISZ6bl6K
	7zyigiDf6fL86k5xaux9cj69d7tVssDmYXw7zeti9hvby47ZQQ0RIaGIbdgrr6UGfisfmE23SOQ5P
	7jaATp4/Z8gNEDKu4UrLRhn9iK65BS4f9fipbDh763V9JzpTpuyQIm9PbP145J9qTlT+e2JyRzdlI
	4ddjwWXGkO32fSRwonO4Bflgsb7NExwUefPYYAmnD5K6gga0QDo5Hox9ko3uEjc2GuUQAWY3UZJQH
	jIqyYJVdzSVOAIP+SeFtIR0kZmG/lv5+jK/TleQEMGQ8iZr1hfR5cLfNZrt2M3vIbV0KU5K83q8sy
	Q1IA7wQ0MxnnMP2jBN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJge-0000000C4Wb-3vDo;
	Thu, 15 Jan 2026 09:30:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJgd-0000000C4WD-0dxW
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 09:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB2B601A8;
	Thu, 15 Jan 2026 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5177BC116D0;
	Thu, 15 Jan 2026 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469437;
	bh=7po4v3HVQ6qqRQj1ceHcb4Fh/5z5S/1L/zsYqfwO5Vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TklhVvSkZNO9i5yCfjRQ2FYD9Sogt7P/3QNv+Z0OH+riH3u2GCCmAtTBxnsGmmgWc
	 jiz1g8hRAsvr0AiRjinjqlrh04Q2cSFWlkLMD1Fn55bZu5bF1H7KnP1ta/5VE/PDoq
	 yrXNCVuDnI44m6Hq5HiVjXUXYlV0jR8Hotd4WaHpbzyKlB71Lqh+7RK48Pt0Ra+8RJ
	 x5I8853uHlUJ8sc/IldcgOpDU7O1/sEWUa/PPQMLXb9Lq93VQHL3ezj0gMr8YS0C40
	 xbkX+hrdRy6c3XvcYq0ISZE7Ur+UF5GveHV010K2X+ZgPKCZRhWGZ89wgkf9F/FCRp
	 XBWNOGxHGrZvg==
Date: Thu, 15 Jan 2026 10:30:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, cyy@cyyself.name, 
	dlemoal@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, gaohan@iscas.ac.cn
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: canaan: add 100ask K230
 boards compatible strings
Message-ID: <20260115-muscular-oxpecker-of-typhoon-bbe46f@quoll>
References: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115060801.16819-2-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115060801.16819-2-jiayu.riscv@isrc.iscas.ac.cn>
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

On Thu, Jan 15, 2026 at 02:08:00PM +0800, Jiayu Du wrote:
> K230 CANMV DSHANPI is a development board produced by 100ASK.
> 
> Add compatible string for the board and its SoM.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
