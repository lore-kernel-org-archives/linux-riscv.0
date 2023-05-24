Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0FDC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 05:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmUbJwYPUAAZuVbahIaoOusXLe+HB0frp5zlgAsm55s=; b=qERr9OcRL2gVRq
	kSUh73fL6mUQgHjCYr7wWMLK/AIOOpawZRlc/aN32JzO4IGCAUrCVgNzHCULFRBzka/87ARsTpwZw
	YkBBmqrmNYJz4Vdk5WzMziFRYkdUWsPadwpyQhoGXmKHgTiAarWh+iJTEPkX2ofjQuWOtTvaqPLy3
	SU4ECk35fMeeEV29hO8/EXZHB4DVnarkoTMF24roLDwDyfhAQFxKKhWFNEiu2Y/ca5yY/1d9VE5Tk
	st299sxib51zh1Q3jO4w1PYOouLfk1kBAfosQaLbVh49nJ5gemT8MTsMvpaN9EXJkRYZ1N6970dmc
	+kIo28GL2HoHMvNNoYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hLG-00CQi6-0R;
	Wed, 24 May 2023 05:47:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hLC-00CQhC-0d
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 05:47:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8EE5E63661;
	Wed, 24 May 2023 05:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D52C433EF;
	Wed, 24 May 2023 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684907237;
	bh=dxM2tJ5nOhZikrkpGLIdzfVYNAQtJdGEAJes99oOE6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ki0wTByhxc5O71eLm4JuXqKscEW9+cFxRAzQJi71whAZz54OP9J3hs3LtPi4EOa/Q
	 WLez9nA2S4arRKekDgtjja92N8DcYoYMeMfW2NVUPygcgmVW5ddVJR5HmTAAbng00b
	 VL5/WWHVSQaQWv1KsLBieUllgclisLnEcuupcU01+AWcHMLSj0KmCXX8lZKgBgy0Mq
	 s3B8W9bo1hHAV8WRrWP+GVJPZg0xugp+WnWXOzijUgmcVcD25fUrOa4xl3Iq//iIxs
	 RG83EqzUl8s765JKLfFD+joZmYslQrdzfYiP3xqu1Y81J4t9MD+Fr06H8ye4iWcNP/
	 cuOFei2JOLcJw==
Date: Wed, 24 May 2023 11:17:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Jaswinder Singh <jassisinghbrar@gmail.com>,
	Boojin Kim <boojin.kim@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	dmaengine@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] dmaengine: pl330: rename _start to prevent build error
Message-ID: <ZG2k4DeQzs3oudxK@matsya>
References: <20230524045310.27923-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524045310.27923-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_224718_270658_D8C1039A 
X-CRM114-Status: GOOD (  12.50  )
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

On 23-05-23, 21:53, Randy Dunlap wrote:
> "_start" is used in several arches and proably should be reserved
> for ARCH usage. Using it in a driver for a private symbol can cause
> a build error when it conflicts with ARCH usage of the same symbol.
> 
> Therefore rename pl330's "_start" to "pl330_start_thread" so that there
> is no conflict and no build error.
> 
> drivers/dma/pl330.c:1053:13: error: '_start' redeclared as different kind of symbol
>  1053 | static bool _start(struct pl330_thread *thrd)
>       |             ^~~~~~
> In file included from ../include/linux/interrupt.h:21,
>                  from ../drivers/dma/pl330.c:18:
> arch/riscv/include/asm/sections.h:11:13: note: previous declaration of '_start' with type 'char[]'
>    11 | extern char _start[];
>       |             ^~~~~~

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
