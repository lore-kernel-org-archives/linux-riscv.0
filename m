Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C30AE7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 09:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh+osTEDZP0NpmrtRvtBjsMJNk1l57niPuP+K203xD0=; b=13B0fhm3fsTm6n
	i3GfEfWd9RikY+iev1GPdW5haVU6Tm9v3zAVGsfzVfkKFuOv1+vCbf0Jl41UUEE/I65iL2nMD298K
	OD2zZtpb98ugBIhAj4dlJtBJsHidL1wPDdYeTkcogxxpFtwfYIlPj5YIGXdWscQGDsU8qRosqwcP4
	UOandMdOZUTXINcUgzThjVgC69fWti0Jp76Gzth1cBdr5jhCOwB55zoWMCJWe4PHPRm9NVOhUmU90
	81EvkK8j7zdQ7NGOU1Xhvi2XbIUiQRr1lqBBvOPV1mJ0YXzLJK6Ww2Wu4Kn//GSXyANeg3WmAMa3P
	M3hqsgVF3yBKc9sZkBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM26F-00000003H6r-44aV;
	Fri, 13 Dec 2024 09:36:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM26D-00000003H6T-1Hnz
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 09:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6ED995C6692;
	Fri, 13 Dec 2024 09:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1295C4CED0;
	Fri, 13 Dec 2024 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734082600;
	bh=2398Dink1XI0qXX1lmBE/iLuxkdh/Ul2IAUIGRgTvqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+zTUY2zEx1rezaCPp4xGqN3x28llyz6ivL6Fe6I9JGNIaG3hreL27Ic9wnjlm2hJ
	 wX16cQILlbJZXV+A3zcotEdaArsKhgp+FM/rco/QgeXzfKY6MrlhgKP1nA/NkDoqYX
	 hTMCU9LAbUjXfvtm95IPUuVfftMDQuHo6Ck+q0Z3UsUiBCnk9Is8Mt0a07nSeltRyc
	 mKZELaFR/CPAfs+7ofURRuVTg/aX6ckJXYN5mdD3AkEZz4R3EwJUfhyWCnMLk/7GY/
	 kolvtBYl739jAJ7E9lP9R6y7BcDLB/bAxYswMIQRe987sF+8HcctUChZdwObh7hoZ9
	 W6DtVPlsoEJww==
Date: Fri, 13 Dec 2024 10:36:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hal Feng <hal.feng@starfivetech.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-pinfunc.h
Message-ID: <rqqh56dyxblzsigse6drluhoeuapsxlr3qbzkzvy2lnpzotma5@ltydfatcrtpx>
References: <20241210014903.154551-1-e@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241210014903.154551-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_013641_386762_F714E9C8 
X-CRM114-Status: UNSURE (   5.38  )
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

On Mon, Dec 09, 2024 at 05:48:57PM -0800, E Shattow wrote:
> Fix a typo in StarFive JH7110 pin function definitions

That's not a "typo", but entire wrong value with actual impact.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
