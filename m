Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE003ECDE39
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 18:45:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D9A21486
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 18:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUnHNMd9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YSGmj/dg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D9A21486
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zYyK6O1ZKweH1OZvsKijP26cX5oq1XeMp2WGJCIuoxE=; b=KUnHNMd9QKBgw+4sU6WfiBRAd
	9jiZbPIguSYh4dryqrDnk7YOlaJgSkf2kmKPJJYaQtfKsHQBGVuArJ4b9wALfHwIbTn+0QZnmnYzo
	u1FXdVzqqJUnV4JO7t5MLPxVnlnZi2zOIV151ru3rgcxKQwwxtbMUEG3C+FrSKjIe9MjqPMvkmDmi
	c2YAjoxuFF18FyROibVLEwWF9qdDhsLAwCcjbmWHLAdlR6/MUYBTSdpfAH12PwRn/pqrWrptCHvsU
	eGNbMi/FPd1nVXecdlq3iU1xNv9wwAfE7G9MGGPfBrCTO4fn1k2Hej6yZMjEMXRqWxDHg4Tno82ZH
	ayjD8yTKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCqoZ-0000Kr-3D; Wed, 17 Oct 2018 18:45:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCqoT-0000IC-7s
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 18:44:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id v5-v6so13097132plz.13
 for <linux-riscv@lists.infradead.org>; Wed, 17 Oct 2018 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PeR1LSYkmmDmhhovh9nCrvi0QufayxZyhP4sdomKmXU=;
 b=YSGmj/dgvkoosvb8Mh9JbPMsfgYFD+lF77LWhohcGtKK3GBtDriPxhl6umv+mSlRqS
 ayyuOJuWgSk+swoLIKk3ydcsYU3J6HuIDQj3C5KmjUK+T/YKhthaDFhzfsrfyl2gHTUa
 xCJe7SDc91uE/gv8CeIK3EivqvOHWq1tQLrK5Ad96UJdoqwfb5eBJWGEXK9FqJ9hNkPk
 4z7HpsX3AQfh8YSLuVhxl8l5mgp4PWFSkNOAcmzHC0MRHfgzi2pMW/Xll//9LXpEnTR8
 3xtKYUXacyyCTDMcxezhenQMYymP3UHhKtIymYmaFIIyKrQb6+r2UcI98daZPk8jQ6+k
 wvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PeR1LSYkmmDmhhovh9nCrvi0QufayxZyhP4sdomKmXU=;
 b=ZbqzlLsd5tD94M+lxz2M7q3tb2QgT/jwysvQCNGoiHIhL5UYq3VsemlH3ePP/L5fYj
 R5DbcbulvO/DX3gAVhXjJ/FgJ0rkwhCnhVJTc3mxs81rTvj3OOivV7C5BggREsAWC5Xg
 aRo3c2j/0iKl6tFd7nOyiPKItMLzL3naKdkmBLTX4NbIPq9UutpQx7yWPB2Brzty6RKD
 oNy7eFVBIBAx/ANfxVKhupQcel8Wj1sbRAV2I+f531c6LSDpDhNBIA13ocnLr3cKMutF
 1QNLbBasr4PrU7udbtRi5SkHt8NhG8QQhLAO4HZaZgytCMYnUnEa9UxhRnWZ4Xn4WBo/
 JVIw==
X-Gm-Message-State: ABuFfoj90M8z0BhqtM7HfFu45NpeVPXwwgONX7xV8DmoLElj4u0JDnKu
 fpSojaG27JjKHutgjnMIZehihrF1PWg=
X-Google-Smtp-Source: ACcGV6230OYyuw/I4CatoDDTBgXTp3WUjY7aIcEb9KQVM7gW7SIYo+mYDSxE2dUof0gNFkGxKRSiUA==
X-Received: by 2002:a17:902:4103:: with SMTP id
 e3-v6mr26796031pld.236.1539801884562; 
 Wed, 17 Oct 2018 11:44:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 126-v6sm24887976pfd.16.2018.10.17.11.44.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Oct 2018 11:44:43 -0700 (PDT)
Date: Wed, 17 Oct 2018 11:44:43 -0700 (PDT)
X-Google-Original-Date: Wed, 17 Oct 2018 11:40:25 PDT (-0700)
Subject: Re: next-nofpu build breakage
In-Reply-To: <CAFyWVab2uSy4Br_V5++_iJ+KdbJonFfx2j8wg7FVQq-uGwsA1Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Jim Wilson <jimw@sifive.com>
Message-ID: <mhng-06031d48-53f1-4ecf-9ea7-d70bb469c129@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181017_114457_332451_DB303434 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181017184443.sTfk18XWGXci7ZJazTUa5fqMypLwUB6V7VaSpNZ9erc@z>

On Tue, 16 Oct 2018 19:01:10 PDT (-0700), Jim Wilson wrote:
> Building from Palmer's for-next branch gives an error for an invalid
> -march option.  This bug came in via the next-nofpu branch.  In
> arch/riscv/Makefile I had to change
> riscv-march-$(CONFIG_FPU)               := fd
> to
> riscv-march-$(CONFIG_FPU)               := $(riscv-march-y)fd
> to get past this problem.

Thanks.  Someone else had pointed this out as well, it turns out I'd merged the 
wrong version of a patch set.  This should be fix on both next-nofpu and 
for-next now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
