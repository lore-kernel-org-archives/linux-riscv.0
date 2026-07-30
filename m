Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B162CC54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEnjhi4MeY2ag2XA6VbcmKjJTfz4Dwzu3L7DmWvYKLQ=; b=pEVEBgmMMYffib
	W92RdpP4qvWj6yizpp8ejE3vbBuTXWGm6W9BgRAZ0xSnZf/WFgkqJQGL8W/aJI++3DhfamsORK8oJ
	iGmkIsgZIIKuy5DuwzgPu33ULv3wy6yt/WdwOmAWBAUV+aMqqa2cGARjn+2h6oXf1KmMEws7KCn3n
	x2BAC8M9Zl4iiuZOVtAj5PuKX/N7sMZ7sIpQoYyYLfAOiz58z1RixcwYoKEJ57MrS9G108qlaZ8Xe
	lZfARNQqtl2RDS/QABM49MPnoczkmMTxvnhpEWiA+66Cmvq9Ls9LTBHtqAs3wL1lRwsnT/R1v8dhf
	7jn9tKqaoZsYJ3wXxJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL9e-00000009jkR-38CK;
	Thu, 30 Jul 2026 07:26:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL9c-00000009jk8-0f0n
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 07:26:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A287600AB;
	Thu, 30 Jul 2026 07:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CAC1F00A3A;
	Thu, 30 Jul 2026 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785396367;
	bh=W3ATJZYuimYI7I2vIDgoLUhLLq/ceSR+UrM/XTui16Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kzgw2PztcbMlPlRKEScjEKgBTxbyWn8US3ni383zK83sQdwYhAvVyFQEap0uvHN/Y
	 ttjR1QxY7f/Lynp7MFoy3SpU0z89bpz9pcVnKQD3Jv+byUBWNOmofy7LyYhBYnKNrI
	 vM8V3sNKRaDYfE+wOWCQEKBDAvu27wiQLNoZQeVASrVzkyvKBNAARvlzzOpLoW4s3O
	 92XHm3Sx04H88G0GprSrbJa641i4Kqu/8I2Ew6GTgbL1HW+cxhAXnbahWghFeFcCTF
	 VPtAHI9wrb+xmd7E9h4mhDtTPq4l7cLBMSn2TwEt7ddTczGi/0ioaPRG65akVmWol1
	 94TikwPmIXe4g==
Date: Thu, 30 Jul 2026 09:26:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: spacemit: add Milk-V Jupiter
 M1 compatible
Message-ID: <20260730-unnatural-spectacular-pelican-1c21db@quoll>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-4-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729160749.1621415-4-aurelien@aurel32.net>
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

On Wed, Jul 29, 2026 at 06:00:30PM +0200, Aurelien Jarno wrote:
> Add a compatible for the M1 version of the Milk-V Jupiter board, which
> use a CPU with a different packaging with improved cooling performance.
> It enables the CPU to run at up to 1.8 GHz instead of 1.6 GHz.
> 
> Note that the K1 vendor kernel doesn't provide any compatible entry for
> the boards, so use "milkv,jupiter-m1".

Looks like should be compatible with milkv,jupiter as well.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
