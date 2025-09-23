Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB36BCAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUhOzZq6gF7APRM+H1TYP+kxlSQs5aMIdM9sdy0ZFQk=; b=AisdAby4i0rtht
	rPnoh1vEYj84Gy7XX/RHbgYQlgF65kX4V6obd3r2BmN5bLkaAxuiIf+Lh3dlPN6cFU7jMi2alBcG6
	i769k2aan78T4XPw9R7h8HvUdoTAawXUvjfl/CTUDEcDOYp/Nx7+3zEWAlzdwptezPvVZ81jovVLT
	15N+Gsx+ng1pZSx6GmXhW4nLK9USF4uS7s7tk9JUwFQBfscWHvoXd78OpmtX2g2buJqkYeyF0iavL
	PPKfcupHX5iswGBOVrKraucbRtbXk5igGpE4+xy3+ECZzWO7YZ16C2UAZxfZWSy0+1QsqpMdUuiWk
	5mTmSs5E4Z/2IG73yZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18WX-0000000EeOR-3FTX;
	Tue, 23 Sep 2025 19:18:01 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18WT-0000000EeND-43fu
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=88Uw
	VFjX97MoYSMeOH1SLzVclQVNBNbeyiQaeTS1Kp8=; b=Oci7VcRGSXUwUyja3UuD
	l/XYL38sK95BnOdFtnd02bN0te4x/OoEaN0XhYAZh6OD4j4wrOiAXGnqcf0HjGHG
	JycqJ01dyd4jfNrWqdY5BvZTHNnPBUqYM+wCxzN5kCjjMhZIptbInzO4kOkQC/7K
	uOYnmgag4fQB4L/p5R/46rYNXe1DKngU/JGJWxIsKQiJqnh7i9Rz2eO40/8ljyP0
	aN8Sz+9jzGXGjGJ8aY/4RZc6N9zHBZo4ytPzhMlfQ0lkahv8rs4sC1gylSLNharT
	fCaLosJ8UDvK/GZPd8RYxgkU3hZIvoJK4toj/Xx2g7krN9yLVxsThZpQ0Zm9JfQ3
	Cg==
Received: (qmail 1218384 invoked from network); 23 Sep 2025 21:17:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:17:51 +0200
X-UD-Smtp-Session: l3s3148p1@z4vSynw/Ztkujnsp
Date: Tue, 23 Sep 2025 21:17:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Alex Elder <elder@riscstar.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
Message-ID: <aNLyXhmONll14Vj4@shikoro>
References: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_121758_281507_01837F52 
X-CRM114-Status: UNSURE (   7.34  )
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

On Wed, Sep 17, 2025 at 11:38:13AM +0800, Yixun Lan wrote:
> Extend the K1 I2C properties by including generic i2c-controller schema.
> and this will enable it to do the DT validation check later.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-current, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
