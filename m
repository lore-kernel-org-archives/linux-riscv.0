Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738E0C5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFDnTJzFV9JUUBh/ToQ81C/nFP5hG+TaD9Ic4fFtuXc=; b=GxOt9/3LPiuK0k
	QDcMk5iCpI9syFvic7IiPVXfrz2J9CA9rMgOtpZ2jN2DBpfu/k607SG5r9S2eLJj2oTPehn+7hoan
	dl9rfB+VEOl1PPSRWwOJP1V8ravtdtrl1jzRkwzviHJHeetzzcKGdiQ9rD2mpWgNSdMwb4vNBHD28
	F84Dv3+pDKT9BTprWlD2pPrpYTNjjhxkfEwgSqq9OnnD9LU12nZmEyculjJdD51QDtwg7JDv4/PMj
	PkNjrj0fbKo1oRioFX5FM+ueVt5+Md+nE3ffrJw1rHIzuIh2lohVRAu+ShtrwAg/tnUTJvSv8/2jk
	36gn6J1nWElQUeek8tsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjKX-0000000DnyB-186X;
	Tue, 11 Aug 2026 10:03:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjKV-0000000Dnxq-1I1i
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 10:03:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10C0041B4F;
	Tue, 11 Aug 2026 10:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4871F000E9;
	Tue, 11 Aug 2026 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786442609;
	bh=u/IzL0ZgCIvODGVKGV0oRzG71HOWOlAnML9MbCNUtjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SUKu6PddNdSmymN3z3JFDIpGFuh7jtkV92p8UZddrFXDiftC6Dwp9rKe0H42YqlBh
	 84CmCk4XzwbrsqAOqOKOTLW/rrJMefc7WtZvqs3sIZmThIY5CoiS04++D8MzUdd8iD
	 6vIAybKXgtRWRw8hisxWbbz3eQFLhVMORHRQntC2h5rs9gfT96u2uk4Bd+tDPiUWGl
	 Zt5qj3ugNuNhVKjbGQJtqHsLwGyTLZsIy9MUznTClr2WJaSYD7waVEM5QKQJUbwNbN
	 BAdIPGRiTKn7Byh5W9byyzdomibM3qftZgYuVE16QgnoDHIDcrdIdUH0dkY3T9icja
	 jao7MZMMUDsAg==
Date: Tue, 11 Aug 2026 10:03:27 +0000
From: Yixun Lan <dlan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, soc@kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
Message-ID: <20260811100327-GKA277506@kernel.org>
References: <20260802024052-KYC1424545@kernel.org>
 <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
 <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
 <cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com>
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

hi Arnd,

On 09:22 Tue 11 Aug     , Arnd Bergmann wrote:
> On Tue, Aug 11, 2026, at 04:49, Troy Mitchell wrote:
> > On Tue Aug 11, 2026 at 12:45 AM +08, Arnd Bergmann wrote:
> >> On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:
> >>
> >>> Troy Mitchell (1):
> >>>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
> >>
> >> This commit caused a build failure, so I reverted it for the 7.3
> >> merge window:
> >>
> >>     Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Unexpected 'CLK_MPMU_I2S_SYSCLK'
> >>
> >> Please make sure that each pull request you send is free of
> >> build failures and warnings and works on its own.
> >>
Ok, Learned

> >
> > The missing macro has been merged here [1].
> >
> > Link: 
> > https://lore.kernel.org/all/20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com/ 
> > [1]
> 
> Right, the problem was that your patch to use the macro was
> applied on a different branch that caused the build to
> fail. Yixun Lan should have caught this problem and rejected
> your patch before sending the pull request when doing
> a 'make dtbs_check'.
> 

Sorry, I didn't catch this problem due to test DT together with the 
clock patches.. I'll be more careful next time to send a PR without
unmerged cross-tree dependency, thanks for taking care of this..

> This is a common problem with unstructured SoC devices:
> If you can't just use the number from a datasheet, you
> have to wait until the binding has been agreed and merged.
> 
> Earlier in the cycle this could have been resolved by
> ensuring the binding change is used as the base for both
> the clk driver and the dts branch, but now you'll have
> to wait until after -rc1 is out to resend.
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
