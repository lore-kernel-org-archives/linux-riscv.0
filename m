Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7E8C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 17:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfbXYmlllAartDOkbKRt7txmMf39R8Y+8CaNwz3tZcs=; b=1JbmclvECzoQ4l
	r64FG0MiA0qFQds70mHlVOXdLdKdwSccAZuoBT1y7esrmZlGbDJ/uIcCMSu99MiGqidkv+EZ7gh4z
	UDWhwUqf987Is2eKUca6JRycLt4LpQh7Cf0Hf44dShB3cMGEOy18N2NFTvcIyHXVnvjO5IjoERA9D
	poKyPn8vGryvq4p3sSYbkhJnqvKU5y5As4YerXKFj0ZkpPz3mWgRjO5zS8MguYTkmdW+leNQG7Q+L
	D9EK6VOf+v0afFyIl2yT4Gm3P3yTzm0tW80eoOuj4z4MW2MGMipyKTIjzpQsEBJVq4TaizS9/773Z
	d5q3ZXIZfdE3JbY8yWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxu24-001NFn-48; Wed, 23 Nov 2022 17:59:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxu21-001NEY-IB
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 17:59:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3FAACB82196;
	Wed, 23 Nov 2022 17:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFFBC433D6;
	Wed, 23 Nov 2022 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669226371;
	bh=fo+5RajrLOWrgXzM+Dx5VV6uRU0lJQMAjI3KTS77p5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOkPLTiR2ZiV9f0l+NjiZnJhsn0x52zY/ZL5PiWHoxrD2La5EXianO7ellh88t2WX
	 hr166iVCyjUmSqY7LN01JwfRpROB2NbDSKS7qUz5hqJqV8g+7In3WlqgM3g7v5fOsV
	 vkAQC6ZLl1vYZcywAnPMdFaULMpRSGAb7lBz18jXGp3kBtAIGKWL0Mt/LgLjv+bUxS
	 HND3rRTW7oUGYkE/4THvnKBknxqeHAtAussMTvuN3ZujmAGtBrmFSW4lTkhGUYc2pq
	 fZNFyWczoe1zbpsc/9c81jWcIZlXIBMvtBHAPaK/e4ZyIqRTW3reqgtV4UYRspKnsx
	 kyVPfmSLfTiew==
Date: Wed, 23 Nov 2022 17:59:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property
 riscv,timer-can-wake-cpu
Message-ID: <Y35ffSHWy4B6v+Pc@spud>
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com>
 <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
 <CAK9=C2WjU+2cD7UZbja3TT++KCdRyWroT=50dw=fzi5mX30rcw@mail.gmail.com>
 <7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org>
 <CAAhSdy20p5bkVanKGkGyArn94hWJhwncztnX7U+4WkN9-v7NsA@mail.gmail.com>
 <Y3zjQXqEHsaoVVvf@wendy>
 <Y34kM9TZ1FSqpeEB@wendy>
 <CAK9=C2UeUhMXmbMZzS4rnhS++DfsTYTCQ4y-LVu6QgL0c64=0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2UeUhMXmbMZzS4rnhS++DfsTYTCQ4y-LVu6QgL0c64=0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_095933_777402_B615A53E 
X-CRM114-Status: GOOD (  20.84  )
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

On Wed, Nov 23, 2022 at 09:16:55PM +0530, Anup Patel wrote:
> On Wed, Nov 23, 2022 at 7:17 PM Conor Dooley <conor.dooley@microchip.com> wrote:

> > > Adding a new timer DT node would mean, the RISC-V timer driver
> > > will now be probed using the compatible to the new DT node whereas
> > > the RISC-V timer driver is currently probed using CPU DT nodes.
> >
> > In that case, we would have to retain the ability to match against the
> > "riscv". Spitballing:
> > - add a new timer node
> > - keep matching against "riscv"
> > - look up a timer node during init w/ of_find_matching_node() that
> >   contains any new timer properties
> >
> > I think it's unlikely that this will be the last time we have to add
> > some timer properties & we should avoid doing odd things in a DT to suit
> > an operating system?
> >
> > Would something along those lines work Anup, or am I, yet again, missing
> > something?
> 
> I was already working on v3 along these lines. I will try to post a v3 this
> week itself.

Cool, I'll keep my eyes peeled :)

Thanks Anup!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
