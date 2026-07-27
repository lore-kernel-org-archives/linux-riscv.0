Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08672C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqJ9DvYjxdYtTtsVEqOmjGjfg01hacZGBBBadmcYbGk=; b=gJMZchhrqIDfrX
	AcKYevnaHx0HXhJnwvnnFDZ+gJRrbPeA1TgFO/qpr7gtfFw1LWUfBDbpbrK6WT9oa1h0zQ+lgB5k3
	VSd/A+KETft6+UW2W0gdmlGq3zlhyKyk7AhP3Cou5KwI9Nt0HyZGok9o0UPeITKbAOF3CWmo3v0iV
	KremxTx+tx0RNlYAUQwF0LAWBvtyDQ30vI0hlNVKfNFEyfleln+em949QaY0MwzB6RCdXPQTJMbir
	XszJlzdb/+wXspjpG6V44Uo46wi4rzl+LW/m4frt6c1gVhqm2fv283L02Sxe2z7pP5AbWyUmvZqln
	3pZpu4jczoo4/dN5HCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHji-00000002LDz-3ZPc;
	Mon, 27 Jul 2026 09:35:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHji-00000002LDl-1juM
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 09:35:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CEAA541876;
	Mon, 27 Jul 2026 09:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C00C1F000E9;
	Mon, 27 Jul 2026 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785144900;
	bh=WFlsQzSJEl+MXDtyzozfCwWlLOJBpDw/B1n32t0hzIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gjclF8DR3p2IGOdZt8j98/z5Rxy0e3VxXFn2u4RmPbKPZmhikNypurPu6HXDBUVzk
	 qhI7SfqeH13octvLnjwe57ZNmRm6wZ9zD4vZ3jsaEII/c6xMUwuAwLkD7WjRuH4uYX
	 FTA+46oSW5vkwfumQ6SbhZp0fCdQJe5VK6FSh6/HC7+oLJWnTThNbhl7TPmqjBD3RJ
	 cgkw8qyNwdooi6lNrtPVclgfxkSW+rFK1uKlm3+Z7gROiqZBvKItsNcEeJ/vAdb9u4
	 6o46xS3ve0Eq3zadqXT61tOtQ1o7iMTLB8ifTZKCYd0PMGZc+hfcT/d6AorN/pdKmV
	 3Pf3ku5G2mevQ==
Date: Mon, 27 Jul 2026 09:34:57 +0000
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: spacemit: fixes for v7.2-1
Message-ID: <20260727093457-GKA76518@kernel.org>
References: <20260706203425-KYC2957292@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706203425-KYC2957292@kernel.org>
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

Hi Stephen,

On 20:35 Mon 06 Jul     , Yixun Lan wrote:
> Hi Stephen,
> 
>    Please pull two small SpacemiT's clock fixes for v7.2
> First patch for USB2 clock fix need to go in pair with USB2 reset fix, the
> reset part patch was already accepted by Philipp Zabel as a fix for v7.2.
> Second patch fixes a system hang due to HDMA clock being shut off.

Generally just want to ping for this, the USB2 clock fix need to go in for v7.2
as the counter-part fix in reset driver already merged by Philipp..
https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/?h=reset/fixes&id=1ca22c6aa006b05143367268066fb74e32cfe66b

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
