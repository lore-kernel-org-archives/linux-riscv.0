Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF1AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 00:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UY8HRzZ5Lhtrih+XT9Fz2OafHwFyMEHHKrpwsYYl0a0=; b=cbl/V2Q+tRx7H3
	klNY8445GfIVJAy+qXCSsteJj6+oOe1PC1Oiqg+g34kFKwqJxGGDGiSGBjqAhxrH32RnIPKqtugXa
	xVUQTyTIkyakSgFkvFsHrOSuNytl6YcveAWAn7hKBZwyoZ8/LfMWs0GfBsKJq+cA3WPausQETJMEy
	wc6OI1ARptlnvbteMz5LMOdWYTbLHevbK+3OeGVOvQVK7/6LyolqYSZM+XSE1j5gW6mT8USwxA55V
	blqWEWTjiZip/CLg2JLJ5875G6NyL+p5iSvapo5YJpK1yr7izFrpR/fGenHaRWx8eX80zgnQgKO5H
	84gjY+LqJzdfoOqO0QtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUH4u-00Awpx-87; Tue, 15 Mar 2022 23:59:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUH4r-00Awp8-BB
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 23:59:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFD7D61387;
 Tue, 15 Mar 2022 23:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCC8C340E8;
 Tue, 15 Mar 2022 23:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647388783;
 bh=9b4hTTeP0bR6aPn4lwbDneU/xQj2l5nU58aIBNZnOSY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hw5xvUyuMU09/78n9pIJpYJYkgzXnqi279u8niki5jTOGhhNFGXaIaG7MvawTgj7/
 XdwFQT0HMYISTpkUvALPzJxtcHB1NRvJULZYPq6WCFWS9DTSjJZsogT+B27HN0/y98
 MRFooug6KIHow/XqbcVyonJyB4oOj3UPdUQ0iYC93dhTj+BG+PNRJCqhGAG+Iod2JJ
 I5AUrgVHJP4vEmHFfSjLbIAls02GHDCQr7KE8GnBZmqsJoQnB82RFWs+fQsHLsqQTy
 jbVNT5nIB7g7TyygYi89ov29KlfaNbaL1Ym28m0bsf4nQMUKF9FMn71wHvoaEay1Z8
 8sSI8kfH5YEOQ==
MIME-Version: 1.0
In-Reply-To: <8cfd57f01cfb59adb716eb13ca0c8250c246dcb2.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
 <8cfd57f01cfb59adb716eb13ca0c8250c246dcb2.1646388139.git.zong.li@sifive.com>
Subject: Re: [PATCH v2 1/5] clk: sifive: duplicate the macro definitions for
 the time being
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>
To: Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
 lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org
Date: Tue, 15 Mar 2022 16:59:40 -0700
User-Agent: alot/0.10
Message-Id: <20220315235943.4FCC8C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_165945_443018_0856D19D 
X-CRM114-Status: GOOD (  10.16  )
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

Quoting Zong Li (2022-03-04 02:03:17)
> This is a temporary patch in whole patch set. We are going to change the
> macro name in dt-binding, in order to avoid breaking the driver build
> and git bisect, add these macro definitions for the time being, and we
> will remove them later.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
