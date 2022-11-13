Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FACC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 22:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3BiiMQn2E3mxFAJwrnGp6KglzWOCFj0o4TkYWq9LyM=; b=hwK88+mJSuNnn2
	uXYMX5yHSGXpeI24/2VYmsyFQTBbfzbrsSrjfWtqbRlEU9ERXUPTLTT6VKxIjLb28D6fa0oSy+r1c
	cLzTzq/Dhdb5ayHtY1inpcdjfLOvFu4WkeACKPfUBWgULSMSKVqGXLMlwjGMZOxL6JZ57ga26PhLE
	bjJ9o19OMOKHilcl56aGeFPPZ0yAOrIWCN+kp7KgkJcvw2/jURlR8HO9K/+q1gtKkDAQx5av72RF/
	svBeST9BypPcPs1TBanSNtBvMBVR0AsbIO2EOUUHN3gxKCM+kY4mSvPIjOne0Cn/Atgmju/PYgzxY
	M2V2DM2B32wltLvqXooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouLP7-00EcnY-JT; Sun, 13 Nov 2022 22:24:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouLP4-00Eclu-IS; Sun, 13 Nov 2022 22:24:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E382760B7F;
	Sun, 13 Nov 2022 22:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E84C433C1;
	Sun, 13 Nov 2022 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668378275;
	bh=9nBYNgZcm6DrrY3mffoBfHsnmT/WVgjdQ+k7udgQs2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiX7/YvMeYnnk6pgsNNJQqkZlJhQIM1BbLMmTWH7SrIRm4S6BInQ9jvkSMsFcMOKL
	 8GHTEZ8oqZAig19ANVpMQz7yBemwR3SrJH1Zce5Tj0zVDqsXJdPt9VL/fcQyc6KUSH
	 dZcPUdtwu5TmheF9drMzSd1j/U3Wjs0nR+xc1Oilxs5dwvjKw+DFslMyUns5Jzzoui
	 eC22isoP68fkcUbJQ28uk4GOjtuWoIoRr1LdrY2H89j9xCtpmzeECjY9UAMGArpSSg
	 RoxcS4NxPxfLSWauMRysPKKW57lCkrDgSySZtcSLALyM+ajoXjdCRZJ9co8JrXGnP1
	 Klg5hoOU+Zhlg==
Date: Sun, 13 Nov 2022 22:24:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
Message-ID: <Y3FuniwXbN/hRNJj@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
 <Y17i8sRf4KXLFkrK@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y17i8sRf4KXLFkrK@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_142438_668197_55F43B4A 
X-CRM114-Status: GOOD (  11.85  )
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

On Sun, Oct 30, 2022 at 08:47:46PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:40PM +0200, Andrew Jones wrote:

> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index fa427bdcf773..bf969218f609 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),

Forgot to mention it at the time, but given Palmer submitted a resort of
this in canonical order recently - seems like zicboz should sort before
zihintpause?

> >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
