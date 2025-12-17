Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82246D68BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 22:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iXDl7O3UaZXJPV8CL7n0rFa6BrPz4QnZpShXksfc9Y=; b=IIXSLBTkRBUjOt
	UdUlGxTr+IDyqoLxtSufMgIujAi90WX6OI+Y7iJKqv7ebH4Xf1yNSB95Swz3LAhLUQjnjSaGICcly
	xDDn3LsTUVD/ahgkBeRcmBtjTu59gNWmQRAfw/ANmXL1wqz17ZfZs8QUhm9rJhaWvgJL5forHnd5k
	clARQHdDoa25epf3bdRtvYN4futRUsuLk1Mj/hWCv1p1eE2wq+h7JI0MIK1Xo/2hNJ7z9VZ8gY9m6
	ku0P6zQ2I+cdIj6hGbyajgvs5tn/Po4HP+EQe2x9cx4LW2WLDIi2Lnp1xZ5FJ/5XV5ilCP8kviPf2
	80E1Qt/z0xdd1LlVjS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVzit-00000007TM6-3r4m;
	Wed, 17 Dec 2025 22:10:19 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVziq-00000007TLW-2Yft
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 22:10:18 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id A6F128A0A03;
	Wed, 17 Dec 2025 14:10:04 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 8FBC916006D1; Wed, 17 Dec 2025 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1766009404;
	bh=vmMdTK4xGKalrlZi028JHbfbtYx5xmdfR5Z4lHuxeMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uyZFrm4quEhq7GAN98gpdceCshOXNAyeh2nUfqF26mi1Grbhueu58eb7ClXfQNLiW
	 ahJ92LcbZ31QOtyG3VXrEGYA1gjXqxvxlZ5229LTajLx+JFn5CTkAJA63jqGrDpBD4
	 HcPjIm7NEz+1EVe3Q3drcD2W3RVX1B7O2h+rNk9Y=
Date: Wed, 17 Dec 2025 14:10:04 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Yao Zi <me@ziyao.cc>,
	Yixun Lan <dlan@gentoo.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <20251217221004.GD31109@sventech.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
 <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_141017_215710_F41C7127 
X-CRM114-Status: UNSURE (   8.47  )
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

On Wed, Dec 17, 2025, Michael Opdenacker <michael.opdenacker@rootcommit.com> wrote:
> Wow, that would be awesome indeed, all the more as my time is quite limited.
> Please do!
> I'll have a look at other aspects if I can, like USB and PCI Express.

If it helps, I have PCIe working on my RV2 board. I based it on the BPI
F3 patches but RV2 also requires enabling 3.3v for the M.2 slot.

I haven't ever submitted a DT patch before, but I'd be willing to clean
up my patch.

JE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
