Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E6BEB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kw84XY8mw5Fgi92Vinlr6ZLQ+1EPVviy647K7xNjKwU=; b=upk7SwyKY2yQ+g
	017Qkx55oquiXErKcQJSgJd8kH4ShYO9BOqkHcZQIUoLCdJm3w5E3NlQ9AL3KC2o1cErsC4Ae7QXg
	GeK68icqbsheWskQxJ3fX58/SnMhMJAwvdCFbvuL5VFlngqHyO5nLzlb0LFdWmeN0gkSjo8ASPszH
	ytxo+ROfLCpTTxfJLngG5SdR9683YOQXYfkKbRphsVTEXCO65+dR17qlBXfyS47UTGTfZK/hhFMuC
	s92n+FZd2sO/7roXikbZ7BlnIVf4PuHpWycPgCgPD9P67z6ttgcOBl342HfFYvohDdo62Sl4IMMGj
	9lRY/KAL7JFqv0SuF31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAvDb-006FNY-2b;
	Sun, 18 Jun 2023 16:25:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAvDY-006FL5-2M
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jun 2023 16:25:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F08460C88;
	Sun, 18 Jun 2023 16:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8408C433C8;
	Sun, 18 Jun 2023 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687105524;
	bh=cj0lc42efzA9zyJIt7r/5DSLfw+aWNTYfV86CgQQ2v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HlnolcDypmBwuyNMPmDah4a2HQ6fJ6MyiTNeeOCIZurbSPM3kut6AwAOct9kR48uS
	 w2BBHnFoD6k/qjI4HJtOkCOaIoE7s5inV8PA7bm1TBwKHpC0SSNT59GPpz5eCgP2eM
	 xFcrbMh1V3HJWXlP8JYh69X6sLH+XPgKJT8tFf2wKK4gg7uJNtgdT75FiF4O8CPMFD
	 3LOzZRFqW7rHsU/p8hFlfiJeb0S2h4gKj3hXjPcSeLVPBXA+/XjjO8Vtx34/EiYaBM
	 MXDZxzZiNUJDS4WVj9ykOmWWPIhmlzr5PhHoZIesQuoaBas4F6ENuyJQQ0xtYeP7EA
	 0NZIG2aT/G4Kg==
Date: Mon, 19 Jun 2023 00:14:01 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <ZI8tSYgpz85gYJqW@xhacker>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <20230617-preppy-eggbeater-a256e963bcc6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230617-preppy-eggbeater-a256e963bcc6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_092532_831049_A59E0AB2 
X-CRM114-Status: GOOD (  21.62  )
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

On Sat, Jun 17, 2023 at 06:02:20PM +0100, Conor Dooley wrote:
> Hey Jisheng,

Hi Conor,

> 
> On Sun, Jun 18, 2023 at 12:15:21AM +0800, Jisheng Zhang wrote:
> > Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> > module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> > tree files for the core module and the development board.
> > 
> > Support basic uart/gpio/dmac drivers, so supports booting to a basic
> > shell.
> > 
> > NOTE: the thead cpu reset dt-binding and DT node are removed in v3. This
> > makes secondary CPUs unable to be online.
> 
> The kernel doesn't do anything with that node though, so if you were to
> load a fitImage in U-Boot containing this DT, having booted with
> whatever the factory provided OpenSBI has, that limitation doesn't
> apply, right?

The cpu reset DT node is for opensbi, linux kernel doesn't need it.
So you are right: if the u-boot contains the DT node(no matter how
the DT node is added, statically added or dynamically added with
uboot cmd), the limitation doesn't apply.

> 
> > However, minimal th1520
> > support is better than nothing. And the community has been working on
> > and will work on the cpu reset dt-binding, for example, Conor, Guo and
> > Jessica are discussing about it, I have seen valuable comments and
> > inputs from them. I believe we can add back cpu reset in next
> > development window.
> 
> I'll go take a look through this, if it's good I'll apply it and send it
> on to Arnd for 6.5? Although I assume it is fine since v2 was nearly

Thank you for helping to send out this Pull request!

> fine!
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
