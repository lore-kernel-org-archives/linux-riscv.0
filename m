Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A26CAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 22:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AoY+YQHe2Z/DUxb26a3nmfUJXZ7/s3Vz83vAuGzXPo=; b=wVl6EYEuY6kEeL
	UTcob912GPxwCe4+utWX8A6uPMYaE6eBn+URa5uD0H5NMQE06FHdbJN+2551HbzUCL9FGElKhZ2UQ
	IWBLfNHHqr7yAZkHfMfs7NCut2voz2K36cSYsJk35Q42Xhd6DGwdJ2LaQenIKg55Mms8hOyDv+M51
	a8bxmeWlZK000lb7BSmjngjY0MflX5qA0k6rLr9KP8AHZU6OJOQO/VRUUwMbYUZ6TxRGzKJZhxDHx
	DwQLpWveb79JNtZRHGen++fv1FgdwcTtACgyjlOGN2yC53kxlthlzSkKV3TPScAYI1g/CLXAwIkks
	gWhTLpjH0LLGD/vHfSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2dG1-0000000Cwzy-3pXE;
	Sat, 27 Sep 2025 22:19:09 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2dFy-0000000CwzF-2sJD
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 22:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QfbX
	j9fviVm/KFNwVC8Wb5YOEoZ878PUaOZEfMSIiHY=; b=Q+ZdEJYRpv71A5cbl19+
	RCU21hWfR6wYipSaz2V4xUo5R6tIfyxI4ec+PT1Qscr6twHp/+ms2mdTMr/Y3SpR
	gFkQU9Ngy08Y/1Adw4HkUNwoWeC+ZUcT6owDkV+zQ0XZhlC/Yrx9JCGh26P5nLZR
	1EiMIoYDbzHsmkKZb8EjAekQBi/sh2DhUoGRsh1nIZ7sL+OZvYdMTOaAD1HZCuyA
	blBd457OEJhBRJXiN4eK+pSnXRhZBqckYQR/chIZvnkVFk7WFO+Yo7yv4DB8zF+e
	UEEoT3ZmT6+/r6y6d9BMlHyVAWo2QwYC+wTUd31lRYgBSenW8MT1bverr1ze9syA
	4w==
Received: (qmail 2700857 invoked from network); 28 Sep 2025 00:18:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:18:59 +0200
X-UD-Smtp-Session: l3s3148p1@Fd/tyc8/rJYujnsw
Date: Sun, 28 Sep 2025 00:18:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: add entry for SpacemiT K1 I2C driver
Message-ID: <aNhi0vWtFg2v0nl6@shikoro>
References: <20250926-k1-i2c-maintainer-v1-1-3643be945fac@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926-k1-i2c-maintainer-v1-1-3643be945fac@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_151907_005264_EB748BDE 
X-CRM114-Status: UNSURE (   6.36  )
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

On Fri, Sep 26, 2025 at 10:51:52PM +0800, Troy Mitchell wrote:
> Add a MAINTAINERS entry for the SpacemiT K1 I2C driver and its DT binding.
> (Suggsted by Wolfram[1])
> 
> Link:
> https://lore.kernel.org/all/aNW5KfIg-_4-Et1S@shikoro/ [1]
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Applied to for-current, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
