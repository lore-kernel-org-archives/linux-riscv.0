Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B71C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 16:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/HNm/oPxxDu6g4VoBxfQjz9PDVD8xXqiTNvX9Tg9Ak=; b=TPYQM6bJQKm5PW
	YNU8LwQVg3GWpSC4qDMfTZIle4iTOoIsY2K012EBGmjRab4qkq04ziGypsWwcNEei8E6t9UV8HZUS
	kkaT7tkKzss/F99BHYxtGx9z36upu9QadVVqR3L2hYf4aYvyZFT4L7Pqi+a4znBygOXMc/EICXOiK
	LUw6aQKfKmwULhb8BC5FNjcIA3hcAq06c+nfLQ8m/IM/5zjJHURzACh/b/T3sL93Vkzt1+hjmpwTM
	pIThPlkSoCoT1BzyhMyvfV9LVlGKvDgleiH2QJChklnIfy/mjgL+FyAWH9oaSD60snGjV6vvhYw0X
	eBwz+CZWjnCzBf4TX3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3jT-000xyt-19;
	Mon, 08 May 2023 16:29:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3jQ-000xyP-2T
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 16:29:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4620160DD5;
	Mon,  8 May 2023 16:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C252DC433EF;
	Mon,  8 May 2023 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683563339;
	bh=feGALERuqLirZfIT3bBs/N6JFRyyWW2IgyCwmw6yorY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYUk/Uc61HOkwT+RYeVVFRAzRzRgQy3R7D5RHJqObbFl2ZIU6xFemM2PeE3j3hT0+
	 ARTGdJzCWUrm47hH77jsKLB4ZLJOTTKUbVZ3yUEL294sKN3SMuiN3mG4RCh2aRQObR
	 dstunq5YVv7JssAX4likGVe1MTZOrxyvgEFmxIOyhnJ3/3fCcuhnPEoSS5+Qr/66OF
	 uKjBAKO899/pkBjqN0NZ08pK615SbHrhFLXlrCaYyfOBaRsj3EEcnEy9Fv3k69R/Is
	 mtuslIJgDaFO8hYyQh9yzrrNbQPtRCz4oIbdLULvkcjidBKvWt1kZlLwLPUwR5awtp
	 KMtmTjGgbjGOw==
Date: Tue, 9 May 2023 00:17:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Message-ID: <ZFkgsHGvEIxGDxXv@xhacker>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-6-jszhang@kernel.org>
 <20230507-woof-eldercare-f1323b10bde6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507-woof-eldercare-f1323b10bde6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_092900_849880_7F3CB6C8 
X-CRM114-Status: GOOD (  11.46  )
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

On Sun, May 07, 2023 at 10:21:26PM +0100, Conor Dooley wrote:
> Hey Jisheng,

Hi Conor,

> 
> On Mon, May 08, 2023 at 02:23:04AM +0800, Jisheng Zhang wrote:
> > I would like to temporarily maintain the T-HEAD RISC-V SoC support.
> 
> What does "temporarily" mean?

I got a Lichee Pi 4A board, and want to mainline its support. Sending
the new dts patches needs to touch MAINTAINERS entry, so I added it.
But I expected an experienced people from T-HEAD, with many
kernel contribuitions in the past, will take the maintainership
finally, for example, Ren Guo. He knew this SoC better than me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
