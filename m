Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C33C54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7aqm+4gX8aasI6gGst90mCoJA4hSkCq4j9tvbje5k0=; b=gLxtUjdQftpecU
	jrJzvs3J0QpOtrqOJEVTZMyr+eJ/aj3MA3X7iCb73g8xjeu/WHbL5sUzwTthtbec5VzXQH24i/0mG
	L5dFMyhs47XSjZ6ruaCjnQr8xmFIbUuEVvIxTLWrYXCmToSac6Hof+4ZK+5n6yPQuKYtx4fWzQpRa
	NXAXduzTGaJJbDf3tKsaR9ni7H0JmqxA4ELlZORODKkhFg9mPxETLoid2KhUUJVvro7+6IZ7WprAJ
	D8QLz8yKkekgiP56YAXTs8h9SB8OaOw/uii8JPRfSlr8JyzSGuIUn9nq2xzE1NnmgxO1JTNtzLF/b
	XPLwwZyK2YZwjfrDkxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcU2-00BsKD-MR; Wed, 11 Jan 2023 14:53:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcTz-00BsJF-71
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 14:53:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E6A13B81C0B;
	Wed, 11 Jan 2023 14:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECB5C433D2;
	Wed, 11 Jan 2023 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673448816;
	bh=S8TCMSBxMW5bPE48rU1jxWvNlpRNJImC/GWdsalAYZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtqRFJs2S8pX7EFrp1ipnN6jXGtnRnd8GngNUJ7Bm4MjFs8nbmbq0owpWxBb/VhoT
	 mrEtRFptl+eRVzQurxyWso3+0kAnAB7gv4baKhsBKiMWWxpOYliTUEls4ukJYMoOqg
	 qwk6BWNuRq78qAMjj48Dx5i3XQ1y8duGgqORRpYcFUYynqiotRD22JfHY5jUMmQI8f
	 pyta7+rbsqUd0ci+g+hKtjPW7JQwB2fZASJ4TC+Yy9rIaPQ7N0ttkusWDRPgAc5AXS
	 dFc6aCVzIzRupd67lmW7Eluiv9uNYuduybersRw2PI11sTATofJlPkRxKdnWNDhLI/
	 shNyBq7FCnaZw==
Date: Wed, 11 Jan 2023 22:43:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 2/5] RISC-V: add helpers for J-type immediate handling
Message-ID: <Y77LBgMIiXkvVU7F@xhacker>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-3-heiko@sntech.de>
 <20230110084425.wupytnd5juzowzme@orel>
 <Y70nyVNaThxJ+2nr@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y70nyVNaThxJ+2nr@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_065339_429560_91645D20 
X-CRM114-Status: GOOD (  10.91  )
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

On Tue, Jan 10, 2023 at 08:54:33AM +0000, Conor Dooley wrote:
> On Tue, Jan 10, 2023 at 09:44:25AM +0100, Andrew Jones wrote:
> > > +	*insn |= (((imm & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) |
> >                                                                         ^ RV_J_IMM_10_1_OPOFF
> > 									(as pointed out by Conor)
> 
> > > +		  ((imm & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) |
> > > +		  ((imm & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) |
> >                            ^ RV_J_IMM_19_12_MASK
> 
> You'd think that having seen one I'd have picked up on the other one
> being wrong too...
> 

we also need RV_X() usage or do similar ;) 

[1] https://lore.kernel.org/linux-riscv/20221204174632.3677-2-jszhang@kernel.org/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
