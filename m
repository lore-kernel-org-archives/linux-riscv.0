Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBDBEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2l35yS0XNPug7ZB2Q5KVPqZxuXRnQ98wUf44A7UTtI=; b=gduKKE3dU5/F8o
	ZVsHpyKCjUS7iFKAWvPz33eqzYDgMa8Fuv5fJu7yatBxFqqhcRMBI9o6SN3LN3AEaMe/yy6VCQD6+
	i/sRI7f2j/SsqEk0OmtyASKMCjipCmbBmiqcaTLkG/NqySSStT35oz1k0uaMRHa9+TVsTHWnRTJLS
	6FjUPnMm1AlmhMIsX0xE5VbtpUdZNwYCIHhDacPFGku0NQjmkMjr/E94WJ5bvbnr7kZJah9DbqEbs
	jzgdvHG2ZLMctjOU8NedqoDW1oSGKiHcGfkv3Rc+/NI1q6aknwWhhPQbK8lU/0WrPbc+HQtTfshH/
	aTwXW5rTGkghIZXkZewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIccf-009o7V-02;
	Sun, 09 Jul 2023 22:11:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIcca-009o6o-0y
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 22:11:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83ADC60C4F;
	Sun,  9 Jul 2023 22:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCB8C433C8;
	Sun,  9 Jul 2023 22:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688940665;
	bh=ma7tEGuHSYjHITgP4MYxB4e0bcIEjw4JgUIHf5e1gJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMcrL1SDsLf7drm4Gah/e2GnvPFqsNogUesvRfa3k0aiElx5gR+GOpmm7VHzNMtLb
	 5Jc3nHdUV2zlZevyof/Gwj/31+yNQnXmGiPoM/tjy3NoCkICPc1decBcFN2p9UwBkG
	 Q+Vlbo87ZI+ywHFhI3jhP9xYWEd9G832gfjAm7vx64Qb+QOn4q9reRM1nlwt13OGYV
	 sqWxAcFcDIzn2AkdTtiz3oEpOJbb0SUZ1vAL5i5t4hU40Smp1YBAK4qbGiwlEmhV12
	 Kht+cKbdXX1A0xYcqPdooJvcIKZCl9njWVwxyonCDxeoEg0C2jBsoHLEXR91V6TkVq
	 TS6kxGVzFkM7g==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Date: Sun,  9 Jul 2023 23:10:47 +0100
Message-Id: <20230709-rundown-unsettled-403e8bf5cca5@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=333; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZqxGtemNh+CFE525qDR8fge9nYf3AFjKNEGQkQg0Cxc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrDVLXODSpmCZxWGgtcDuaMpO3u8s+eLdZuXhOne1JA dcVPOIdpSwMYhwMsmKKLIm3+1qk1v9x2eHc8xZmDisTyBAGLk4BmIgbO8P/ILYjvUmyKhtq+98t 0YqZbPpVS3L9rAUWllu7PjwVTllbxfA/ipHZ12PvrMINrT0f5WdFfJycesNeievpqszDnYF668I 5AQ==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_151112_404684_EC761ADA 
X-CRM114-Status: UNSURE (   6.02  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 25 May 2023 14:18:36 +0800, Jia Jie Ho wrote:
> Selects ARM_AMBA platform support for StarFive SoCs required by spi and
> crypto dma engine.
> 
> 

Applied to riscv-soc-for-next, thanks!

[1/1] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
      https://git.kernel.org/conor/c/1fcaaa1d489c

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
