Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA7DC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:09:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873952151B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qBxIS5D8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fN8SkuFu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vToYG6ri"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873952151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b5JiL2788bB34yq9xK7HOajNxVfBNcfJNfFBlxGuaVA=; b=qBxIS5D8d70ZJPeVATnij8LGz
	/FvmOVAc22lTLN2RuKbDGR0y/LxOZUogEPSWj3NicsKuZ22mQIUEJloRnAIglKmmoLTXKudp1W9TN
	csReim51JGADdbTnX61woPkzU1/CAeJ1GMatBNwtQefQqenZIq2IWU0GcuSFNA2p514Xid7QWnOug
	AzSo1Q7RkYNgqUULlo5a3Olilu5L1z4OZwJCs1WSt2LT/oRy8RfwX05q4vGHwYAb8AHSRPqu3aD5+
	5FvQCUrJWQIWfYNo/OaUiYBbJVWgaelLCLJvVbsSc7cSblgzpIg7upZOsUY3PCbWw2Yx+kC+7Q3Uf
	XHU+CFv2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXWK-0006Ul-Nj; Thu, 05 Nov 2020 05:09:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW17-000145-VF
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:Date:To:Cc:From:Subject:
 References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eYYTytLphm0Z+fdTEl701WCaAIJgeneN/lnyuljDjOU=; b=fN8SkuFu2mHkxJuFhao4CtZyOd
 tn5oCfmqMBUqMY7HTqBhln45IyZ2Tc/Fi0NHGDYjzfPpccvw68/PMHMEtP6o46VYOl3AKguZGOPPn
 GK1w5d4dVqMy7NWExM7e/jweY82jebYEKwWDGGCnsnj6ukky/ncfH5Jq7DwNrE4WzY5o1l3KPof25
 3kCXaXUMuyjPJ8purwx145omMHVywNSRHdhgEm6rN3EP28S4KPaUnfIASikExY+Pq2AP0Clgvtw/j
 Eixpbp8KMMK3tSzDOi8xfPmP7M7N4k76gmK4ADZrc9qOqt1WngtGuJoheqt64vinLB2qPwrWjhtOd
 uVBv87iw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaVHX-00005w-PY
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 02:45:50 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 944272074B;
 Thu,  5 Nov 2020 02:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604544344;
 bh=ZND+etKvo9cOoumubJj8jAyx7zVBF0vSY5DA1VtbySY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=vToYG6rik7/vw09/YnScFZDKwVW3nkERgEDEL8Yf27KpbBKY5P/Ne4vovyhUQYFqY
 ciLFlMCU6d5LuUAGnh9afyXRgmEjB2DaVPKu8XUYAQADGo3d8EuXA6wH9DPToqMjvB
 +KKewqJce9mQktXfsCl34SICmOwIPwpJJUmqlr2E=
MIME-Version: 1.0
In-Reply-To: <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
References: <cover.1602838910.git.zong.li@sifive.com>
 <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
Subject: Re: [PATCH 1/4] clk: sifive: Extract prci core to common base
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, yash.shah@sifive.com
Date: Wed, 04 Nov 2020 18:45:42 -0800
Message-ID: <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_024548_360879_24BBD9DF 
X-CRM114-Status: GOOD (  10.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-10-16 02:18:23)
> Extract common core of prci driver to an independent file, it could
> allow other chips to reuse it. Separate SoCs-dependent code 'fu540'
> from prci core, then we can easily add 'fu740' later.

Please indicate if there are any functional changes or this is just code
movement.

> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/clk/sifive/Makefile      |   2 +
>  drivers/clk/sifive/fu540-prci.c  | 586 +------------------------------
>  drivers/clk/sifive/fu540-prci.h  |  21 ++
>  drivers/clk/sifive/sifive-prci.c | 409 +++++++++++++++++++++
>  drivers/clk/sifive/sifive-prci.h | 201 +++++++++++

How much of this is a copy/pastes? Can you generate patches with
format-patch -M -C to try to find copies and renames?

>  5 files changed, 652 insertions(+), 567 deletions(-)
>  create mode 100644 drivers/clk/sifive/fu540-prci.h
>  create mode 100644 drivers/clk/sifive/sifive-prci.c
>  create mode 100644 drivers/clk/sifive/sifive-prci.h
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
