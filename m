Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8A2CF31AF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhA9oBbPm2X4fkWjLqIYvvEcb5YOPZBMCUrJbrqZ3j8=; b=tvcyLP6ONfLwzv
	KrO74f0V/qd7SWqMXW4OavoBELGWBYxTjlBPXmoRQHwz0swUAwoFtZ56ygQBOBpFnv1/sAzoCjQF7
	WzIvtTRj0EASdCNUjQJ3/Jh7EQtRTjACiMkyfGr/tWI4YOurtsAXsA+vhA+GlHsm4q7LhDz2CTs6S
	eGJ3d8G/vJUHAzBYuybSLcBkjAq3WJM9MH1+fVIbsH3Rf+Vjs/V9QopH3u8uQlGkFT82+kfK5nGlQ
	2Fne65bliwVNDRwJGukhcxBGX/fT6K5MxQHSlkRngS4+xIfmpEIDQEkkeBmEJQf6o/AY9lrTvTPfM
	uZ9ZtiSGyTGKXsnRJ86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svwnT-00000005Wf0-1OJe;
	Wed, 02 Oct 2024 10:41:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svwn1-00000005WZc-21G7
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 10:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A0295C4186;
	Wed,  2 Oct 2024 10:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369A9C4CEC5;
	Wed,  2 Oct 2024 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727865662;
	bh=gvCktZEtJJF77mMB4+YlCM1pW2osgHebmjJ9rKLs1ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqFGTuvXaYWtBQLcNO360jKdNJvdqcvfwX9P6C028HC47aX7BrjSThFhmzZcyDi0l
	 u14pcFKhtAXzq0XhQdMs452DCPn3AKf9pUSOy2SHidM+DKsLkP8QO+irsi/OXNNO3g
	 oTbjFtpBIB/G3RbEmza+wmVmfpYjiOJSdJhRvIgBvJR6fg2ii45AYYmGxppJn18jfb
	 Ois1vyuv51iGlCwkI+JDFDMCcSqwONaRfbb2W/UMPOhgO1BB0ELo/qstJY62Y4S9fj
	 1v7RCU20S3GSpIj00EnPiL0TwKvesgsgPkPSR/soNPft5Aar/9BYvSEXSdbU5IQA+k
	 RWddKqRG5A7sQ==
Date: Wed, 2 Oct 2024 12:40:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 10/20] dt-bindings: i2c: microchip: corei2c:
 Add PIC64GX as compatible with driver
Message-ID: <hcr7smlja6l3cpxjk7vn4qrxqikte4lfd3sl3ginwa4f5xauwz@wg7knjaqkbfg>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_034103_606404_2C18F51F 
X-CRM114-Status: UNSURE (   7.50  )
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

Hi Pierre-Henry,

On Mon, Sep 30, 2024 at 10:54:39AM GMT, pierre-henry.moussay@microchip.com wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> PIC64GX i2c is compatible with the microchip corei2c, just add fallback
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Just this one merged to i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
