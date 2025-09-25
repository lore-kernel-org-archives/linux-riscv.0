Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99188CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 21:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWmV9QPj3WjQgorx750ZfjKKKOjxSKOF88TqanhTZCM=; b=g1/YaGDXAWpjhM
	ZUDSKhp2NFYGgo+ZgEv+e7u4ncYBE2uFVDugeSKfKxXiQNMd5Vnj8YOm7ybALENGULtoEKEaiTnUQ
	UJBk2QnQZiZRrHR0qEy+PT+7keh4RqQ+uJ9vkoISxEWAmwNhjnqX2wh2rEBDv4gcIt4vT2bgRZzef
	euCOu98YUegw2MVQ6L/6Rs7LNZH44ub2r6ZzTV2rp0knKHKsRxcmeolaYBcCzjS9JR7wGLaazi0M3
	JJG9ir4YZAvXuoUPyRwfQqIIhKhlyD67lYpLZvh2FreVkSmKfHu4rYvAHoMepLAYCzME9wMxRWClo
	RaOFGvVso78ehWuDQu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1trL-0000000DKU2-24YG;
	Thu, 25 Sep 2025 21:50:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1trJ-0000000DKT1-2lEv
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 21:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ai2u
	ZshFLzPCn4qE1mOlvZEOK2ArYuQo3ep7ThaPWcY=; b=K4rKGIUZEBre9RgdW2Y2
	c+/PC+w9UKQ5bPz1xSY2SfGsQCOLqa6TTkVf5LB3wmLlHDxWT8nK6mmlxsKKmouG
	JusFHRCS6dWfwdKtsTC66jM0JaN0QRAe67emZigp2WSucV0oNQfZccjiPtjpu517
	kkHLdX0vs+53rGjouUOQumR+o2kzJW6hsGqlPYDLPjlDZ7DY1j92iKyt3qahZTja
	qEOYYFg0U/5f3kF6lcS4I8CUfye/5BRo0N+GVkimYQfeTCuePlrRNG7HM0JA+etD
	1VtrSjsBez7nNSbQzqHvbedP1f9aPmHeyIpAiysOuQLl2Z1wBGZrFABINjORQXAL
	4w==
Received: (qmail 2024078 invoked from network); 25 Sep 2025 23:50:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:50:34 +0200
X-UD-Smtp-Session: l3s3148p1@TMKiKKc/BtYujntx
Date: Thu, 25 Sep 2025 23:50:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <aNW5KfIg-_4-Et1S@shikoro>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_145037_969910_DC6C5102 
X-CRM114-Status: UNSURE (   9.54  )
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

On Thu, Sep 25, 2025 at 10:02:24AM +0800, Troy Mitchell wrote:
> Previously, there were a few latent issues in the I2C driver.
> 
> These did not manifest under interrupt mode, but they were
> still present and could be triggered when running in PIO mode.
> 
> This series addresses those issues and adds support for PIO
> mode transfers.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Applied patches 1-5 to for-mergewindow, thanks!

Waiting for a possible review for patch 6.

Troy, maybe you want to add yourself as a maintainer for this driver?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
