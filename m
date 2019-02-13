Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BFFC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 13:11:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13474218D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 13:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ADWFTl64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13474218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2b5pKbqBA2+LNslLIYeUH6dA87BhYg3mYJEXf+DuDNI=; b=ADWFTl64UTuMRK
	ANWTwmuMgBlHU7O7CCao3OTjwUXCu113+kXxgVsK190QPxpshm5EbZgejGOnISBVy054oumO6EEpL
	j0a7QWmY/HR9FA9BdZIte11kQI7Rawgh0ru1Ey98+8GjGln55SUhK7nSiE66mEov/G6Zo2RTphtLb
	FUDsgwVD3LDcFs3EoiqgWcAzBlyx68YrkNLKM0M5BcXuzl6DxZgVBd3FD2k5YOnYsc0LfsKy933Sn
	mOHZX0crSkfG5sew/XentPnifA6rAxbfcOr0l4UwSWo/RRxTntFtyveeXRtpTyFHClXimc9jiyyCj
	/EcUQ3VCLmJmFyzhRgaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtuJc-0003lt-Q6; Wed, 13 Feb 2019 13:11:04 +0000
Received: from mail-it1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtuJU-0003bs-6U
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 13:11:02 +0000
Received: by mail-it1-f196.google.com with SMTP id o131so5723783itc.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 05:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLOvaHcQu0u+0yl4+GninIYh7vtHA7AhGKR+mD8WyNw=;
 b=PbQ6oue+O7YhnN1gzqadR8QgftK1wDwGay0YhqcYyZYhcUWHkF4JsK6DBRMtv64KJk
 gC2T+2qb4v3hPsAVyhIKHY3pCDnLM7sicTbs5yk/RIBB9IM4uY3U4qZ6Rhv3CFqZOuDX
 ++sYE9Kdx64oc8z77ILJ3zay3atIpB4K//tvQslJ/1ziTOzeA7xglGwdbtSm6U1sbLqs
 HfJQKGVLAICG8+Y0yEhpIXq9XcIpZ5ckM9SjDKisfKMDwANaL+1aG7CwwfERyoO5nSr9
 VHxGZPi2lz7MOiMvbeRdWaOZexIj9+SpaKYjlc03qyKtazyIxCe036ncSDTUjS68IlR5
 6Dyw==
X-Gm-Message-State: AHQUAuYDJ+k4al00waSgQwNwTZLvoWHbG6gf1jY0XwRQTnXcLiqtcrOK
 TwGxLQOh4DIi0DeOzGCpOK4FW3yuledfhURihCg=
X-Google-Smtp-Source: AHgI3IbfujnRN2SEFmgryeqGF2Gkan43GpagQjpViV8LMiyAgj6l3cQRtD1/WFj91GkMvS5rK/Qoeel/SytZbuWGNhE=
X-Received: by 2002:a02:187:: with SMTP id 7mr232036jak.115.1550063451222;
 Wed, 13 Feb 2019 05:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20181112142736.15009-1-kernel@esmil.dk>
 <1550052211-21030-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1550052211-21030-1-git-send-email-yash.shah@sifive.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 13 Feb 2019 14:10:40 +0100
Message-ID: <CANBLGcz4PJcChFxOsQYLKRy9SA11j1UsEN1pVpOBwfPQBmpM4A@mail.gmail.com>
Subject: Re: [RFC PATCH] spi: add driver for the SiFive SPI controller
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_051056_236171_85A192D9 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: sachin.ghadi@sifive.com, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yash,

On Wed, 13 Feb 2019 at 11:04, Yash Shah <yash.shah@sifive.com> wrote:
> I am working full time on Linux device drivers for SiFive.
> I have some bandwidth to work on this SPI driver.
> Do you mind if I take over this SPI driver from here on?

No, that's fine. You can pick it up from here:
https://github.com/esmil/linux/commit/870b04e85662a02ee1f6333e1d037c774ed4350e

That's with all of Mark's comments fixed, but the bindings doc
probably needs to be updated and split into a separate patch.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
