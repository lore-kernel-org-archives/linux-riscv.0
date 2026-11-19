Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A00606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUf7MN67;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=grjpUPxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:References:Cc:To:
	In-Reply-To:Mime-Version:Message-Id:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=LiTsS6iW1/XFOXHfe711f0zG8DmzGFwz3MAUFh4e/Wk=; b=xUf7MN675ZIHtB0fFprzCZJUDd
	0VmmprjZ+g5vR2Xcnv8y4x+ZBidsv1EoOUqzDE3OavN/ablS111NJFycCQXefo8fQGDbRJ5bNnuxF
	/Z1/oz3+jiGu1XGDJxDOFE7MA4+kLkHoZVbJL9oMq34KL89SKSkVag3UrcPiaxjOOnkdep+T6375L
	+HywT/QZvHCWKji58ExpyLy4ECPOKGSFZR/8iInnlxWX37cmbJ7sYpXpOSCzv8Zu4meOONOhO3qFO
	JbJFgkKdDjyHO9f5FmpRjN6xto2XP0TUbodjCVSX0dpW5u4VIPVnAzZpyDWH8bjHLJXVuD2dkvmWb
	YcBDw+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy64-0000000BLZv-1hF5;
	Thu, 19 Nov 2026 09:06:25 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy5u-0000000BLTP-2ttV
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 09:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1795079166;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=4HX5+/MoRFuL5friO42awFlJeeVyzzPj59afEXfj3X4=;
 b=grjpUPxqeB05GIa1dPz1KJ9Rbrca6OpaoKotakoD7K3u5Yb3UX0SyVmQkUH8ft8bPaoy1Q
 7JzTCIsAwNlQYLTeYnFHnVv2n2GBbtfAmLO4YWi+GWGJldsjpEX8JKGZL1w+gYzEGcHQee
 tw+CLuKJejl+sKk+3iXjU0tjS/h7FSLqLLukiFb4hxRsYMQ8xzym9o++8eeRW30QVYvi0y
 YrNf3Ok4ZCFfuxPdO8xU0MVxZbxxjnzXeonBG4rWUxIp/wIyvXuMWFjjexsi09teMvSIWO
 jybF2WA6Ag12mHLIPmJNUWjpL5Y4z+ak1MAMgufr5w+AlGg7L/NQcHKbm6jqEw==
X-Lms-Return-Path: <lba+26afebbfc+9502a9+lists.infradead.org+yang.wang@deepcomputing.io>
Date: Thu, 19 Nov 2026 17:05:53 +0800
Message-Id: <20261119090553.1886090-1-yang.wang@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
In-Reply-To: <av4iWQb33bya48G1@aurel32.net>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
To: "Conor Dooley" <conor@kernel.org>, 
	"Aurelien Jarno" <aurelien@aurel32.net>
Cc: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-spi@vger.kernel.org>, <broonie@kernel.org>
Received: from ubuntu.. ([183.23.99.162]) by smtp.feishu.cn with ESMTPS; Thu, 19 Nov 2026 17:06:02 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io> <20261118085742.1817536-2-yang.wang@deepcomputing.io> <20261118-backdrop-scrap-1bee34e06336@spud> <av4iWQb33bya48G1@aurel32.net>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: Re: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
X-Mailer: git-send-email 2.43.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010615_487291_A2129C66 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor, Aurelien,

> How is this "eSPI" different to the eSPI described in fsl,espi.yaml and
> implemented by a driver in drivers/spi?

Thank you, Aurelien, for clarifying this. K3 uses the Intel-defined
eSPI interface intended to replace LPC. It is a different protocol from the
Freescale/NXP SPI controller described by fsl,espi.yaml.

On K3, the controller exposes a CPU-accessible window for the eSPI
Peripheral Channel. The EC client accesses its command, response
and memory-map regions through this window, rather than exchanging
ordinary SPI messages.

The proposed controller driver handles clocks, resets, link
configuration and window setup. The EC transport handles the EC
register mapping and host commands. The distinction is therefore
the protocol and access model, rather than the use of MMIO itself.

I will make the Intel eSPI terminology and this access model
explicit in the binding description.

Regards,
Wang Yang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
