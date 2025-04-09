Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A676EC369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EO1voaUnETehcnyrBvqBdvuEKP2GHxELy8whTMhyCaA=; b=vxi0qZkkJjZ7uJ
	gE+mlI4Ojv5XTnwAZvQE+iJiLowhKoV1ieKGcTrgutb9/vHN6Vtp+j+/yXcf3PK6TlwoqPO+GlTsb
	lEbVBaxD8GEy7pNIfzir/rWoD3FZubUrI/ZangWVI/giD53fxSSYBcInI+VtT1iETNvRjIUG7Ku6g
	9xTP4fCDd88uKLr8m4GRdsD2V8oS4d6Q8QmpdzcnwNI9HAvn/G9NugKDcTZIlrvDsyVoqYpSSdJ2h
	OLtlWYmA4pH7MhBsM5ctDGieY5+DF7OcdH58PwHGFo9Fh/fZRrcfo/6/hJd+1muGOuCFHj5Z4HLoa
	WDZrMdW0Z/atzBmooQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QWc-00000006XCC-3bIy;
	Wed, 09 Apr 2025 08:11:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QJZ-00000006Ub2-3v7d
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 07:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F8455C553C;
	Wed,  9 Apr 2025 07:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF2FC4CEE3;
	Wed,  9 Apr 2025 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744185460;
	bh=EUUG9DHhySYxln3x01p4RrX+4nqYuXoYoX7Cofr3TbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rw2v9q08XZj3ULwElQzsO94gNVctyG7DE0E90gXDLIQIQk4lNfomDBjoLaefx6Ezo
	 6Zg2bVwomvPwUB9sHJcFVvoWDFLoMFDZcinlsq1MRAAVX6NK7tvQgDb1vfwDTpF87D
	 Jy3JEq/7ML9R7OB05UBm0OOzZS9DnIwhnZTYbK65MlNhFpfChT/nFZ26UxHV9paFtZ
	 L7gdcrxyJxZBi3nFPanS9lYUSE54/+P594wVbIc2Mhqb1vtOkUiwG8MzTMPoxDRAJ4
	 K4gl7nApneBwWI1g3P1mj3nfF3eWjF7qYGkWSi5W43O+8G3WqALpNdvNfejhGk/F0d
	 g9tx6AuYLrjfQ==
Date: Wed, 9 Apr 2025 09:57:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, ghost <2990955050@qq.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <20250409-koel-of-delightful-glee-aa0a01@shite>
References: <20250407072056.8629-1-looong.bin@gmail.com>
 <20250407072056.8629-2-looong.bin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407072056.8629-2-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_005742_015074_1DBAB901 
X-CRM114-Status: UNSURE (   6.84  )
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

On Mon, Apr 07, 2025 at 03:20:38PM GMT, Longbin Li wrote:
> From: ghost <2990955050@qq.com>
> 
> Add compatible string for PWM controller on SG2044.
> 
> Signed-off-by: Longbin Li <looong.bin@gmail.com>

Messed SoB and From.

Use known identities, not ghosts.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
