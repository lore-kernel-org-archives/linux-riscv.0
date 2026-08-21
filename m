Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DC8C5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 01:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3Qsj1EK5CGOsIPxSgqAQblFbxKheREznL+SCLwST38=; b=fqLTFlLvvYFV7E
	S57yia2U4gCWai/HSIsGnSR+t3pMGmva39+77P5YGmbnpc87kCpcRY8Pzhg4jMYbMJPn5xjL7pE8y
	bGxdpnOk/xtA6C1BtrLXq8lYW/VnsVDWz5bTB9KZIUVd1lpW4C07z7lqCbmEAaThLgRvMavdA0cEL
	+ONPrRkn9LR0Jz/UbdAEMRDJWqKeq4xrbeXSOGplyRHfkkykPkiAKcZc9I3L95m2fx/WVGBtOzLPx
	WPitJyNXMzCXP4RI0+de8SuxzQLkOnHdtz0QGV+mvDoYqoWM7VqTPqTcxNqdwN+BTF80QBZm7fq9i
	NdpZc+5CajiTRwDbPkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxERs-0000000CQuD-0E2w;
	Fri, 21 Aug 2026 01:53:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxERq-0000000CQu7-0a9K
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 01:53:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29E6B60A58;
	Fri, 21 Aug 2026 01:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268B31F000E9;
	Fri, 21 Aug 2026 01:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787277212;
	bh=dKo2aLMBgmdPLr+9SGvRD08MU3JFbNMO745B0V9ZYu8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=mik8zYI82kKavrlvHO9BvvyrcO678LBFFZJdBq5xSdP5CfUY64tP7NTIbJONk7zyB
	 fivO9+/fwsAGYsdrBYnHROqg3NrpD2bEkRWlsSDX/wMScxKuWfwOztXEVFTzzer97R
	 pMeRNj7w4TqX9bG9XDOhG5Cs5GeQTtggE5bSeuFrOXElmADVdvWnYHt/SljPYse1zm
	 T/RtkkCHLj7xNLJvtOdglC2v8PiHf6iRVdvm5K2ewf1QTGdnI0yisgz6lixEDEaZkT
	 3Xgetb28yu3/ZnakjB1rTePJ29jECSG5sjlZNeaB7fga+MryNrTcxCDavSe7kqeufo
	 EiXN2yflQgeDw==
Date: Thu, 20 Aug 2026 19:53:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Jesse Taube <jtaubepe@redhat.com>
Subject: Re: [PATCH] riscv: Add support for early boot errata application on
 MIPS chips
In-Reply-To: <20260810-p8700-early-boot-v1-1-5c4aa08d500f@htecgroup.com>
Message-ID: <1bd31b3c-bdbe-37e1-0f0a-3cf152ff81d5@kernel.org>
References: <20260810-p8700-early-boot-v1-1-5c4aa08d500f@htecgroup.com>
MIME-Version: 1.0
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

On Mon, 10 Aug 2026, Aleksa Paunovic via B4 Relay wrote:

> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> 
> MIPS errata implementation previously skipped early boot application
> entirely. Although the only currently existing MIPS erratum does not
> require this, amending this now should make any future addition easier to
> implement.
> 
> This commit was based on the existing T-Head implementation.
> 
> Suggested-by: Jesse Taube <jtaubepe@redhat.com>
> Link: https://lore.kernel.org/linux-riscv/CADRr4bcbD57hmR0XGgo8BjgNp4shEADOondZEtwscCJ9-nxXRQ@mail.gmail.com/
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
> The patch was motivated by Jesse's suggestion to implement [2] as an early boot erratum.
> However, since it's in conflict with [1] as well, I decided against sending this one and the ZALRSC patch as a series,
> opting for rebasing [1] and [2] once it's clear we should move forward with this approach.
> 
> I tested this on an eight-hart QEMU config. The testing was done by rebasing [1] and [2] onto the patch
> and running most of the same tests used to verify those patches. This includes: coremark testing, futex kselftests
> and GDB to check errata application. The same tests were run on the Boston board, configured with a single P8700 core.
> 
> Links:
> [1] https://lore.kernel.org/linux-riscv/20260608-p8700-wfi-v2-1-77efc7459f3d@htecgroup.com/
> [2] https://lore.kernel.org/linux-riscv/20260723-p8700-zalrsc-v4-1-59c21b252e29@htecgroup.com/

Thanks, queued for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
