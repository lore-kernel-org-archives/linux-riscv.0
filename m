Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747A4E6BF22
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 03:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWEXIh8VMCsbcQ3FWtIeXiAyPKFu/out+ZI+IiigSSo=; b=5AFHZG9eFktPPj
	ZYN/VZAWdO4PLeXZ8ZBMUJ5JL2SCbh8gTLaIBFK62Z6lHvOrIsYXDv5PsZEha68lmknkS0IcnqzNZ
	Jat5QxP10nqKmPgUg/Kxo4/eJSqFtmLNw9kgI6i0cXzBu8L5W/cOokjEO4IpBeHW0HhiYIULY5kWk
	GQQN6RIauNuCKx+W0E74zb4r2dKyIMnSBgiYPfw4GhGv+XaGuz7PQhdjHmq33b46poZYTvfr+zcQb
	U0DjLZS1DoMSRk7gvvwt6XaSgmtynU0EIfo9FUS9egd0/LT9xFGPwT8CDh4FgEWvefIrYmY6x2iOp
	DFi3k/jIgeNHEgWFBDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm23k-00000002I44-0Lg7;
	Sat, 31 Jan 2026 03:54:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm23h-00000002I3W-3Kia
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 03:54:06 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 34E413421B3;
	Sat, 31 Jan 2026 03:54:00 +0000 (UTC)
Date: Sat, 31 Jan 2026 11:53:49 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: spacemit: fix drive-strength check
 warning
Message-ID: <20260131035349-GYA104837@gentoo.org>
References: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
 <20260130-outsmart-ether-73a7927b4c95@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130-outsmart-ether-73a7927b4c95@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_195405_855093_6EE610BD 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Conor,

On 17:11 Fri 30 Jan     , Conor Dooley wrote:
> On Fri, Jan 30, 2026 at 07:22:15PM +0800, Yixun Lan wrote:
> > The problem is that one value from drive-strength may match to more than
> > two different enum groups which lead to DT complaint, switch to use 'anyOf'
> > to fix this kind warning.
> > 
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> And I guess:
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
Yes, thanks for the reporting and fix suggesstion

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
