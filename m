Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB84C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2YnQoyeu1GAE3afwdcHKSlUQ2olpeDO3IuOFxTL6yY=; b=ptCgRSkOKYtp/x
	crBmtSEaUP0sJh3rYaW+1fvSYghPCJBkxzeL9I37+ladvZSWZT6fi7iMJ4ot5nV5L0O58uwuW+I4C
	ipqiA19Be4tb7xxK4OAqhwic3ZohUFl4usmP+QD3nEeh0M+02UqDtvkrudWZZqXWR7iFXKEv9r1KI
	vrZ4/eGV/zofgZGKz2bQB6jHNvU6qSac4F3unmJMpRs+3AS0FTv7xiatncOp6bv/NomVKVvGVnBmh
	0jHLghKlB2dr5yVLYQCeIE/msn3w+/VgG3NRP0T1aXpb0z6JaVAPHoJP1ONSChvyI66FfozKm8oyB
	JybaSTR0ey4CInXLKa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSJF-0070PJ-EB; Tue, 08 Nov 2022 17:22:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSJD-0070OV-Bs
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 17:22:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B77CF616B5;
	Tue,  8 Nov 2022 17:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A90C433D6;
	Tue,  8 Nov 2022 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667928166;
	bh=EBlNNpN7MBm+O+67jLDhlUEULw61dZCE5Kh/19OPtsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3Qn0KdLF8TnGQvdKxzEauemDFC/wJjbGcUAsuoXqGm1H36vKWC7fz1uyQ4ja4gLL
	 PtObRw8k5Io4fyWl8tVoH5XD69mYqJG3gVg5EwelDTjWg+DYw6KaSCjH7/lWOl7XgB
	 /stqFfGY64EpQB3676Sum/0Ri3ngvLCUB5XbL+Wgf3PkesWmp2wcTUqyXp9tYNHtvo
	 0JyvRUdJxSjeLycb1ViilsqYRjwmmCjrfM72A91yI6W38k+dS4SjjxLoHn22bcsLAi
	 XZsiBILFlLJO7XDy+bw5izIso/JaPxCgIeKYx5kMRh3DMLYT4VpjptwDY0AlU0OTPl
	 ItckxP0D//rpg==
Date: Tue, 8 Nov 2022 17:22:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Chris Stillson <stillson@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
Message-ID: <Y2qQYAfZL7I2qXoo@spud>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-4-stillson@rivosinc.com>
 <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
 <f4887649-3933-0a65-7ed5-1bf6bd842a46@rivosinc.com>
 <Y2oLkQSdCBJPvZW/@wendy>
 <95287691-752f-5920-2dbc-b9a5b144d0ac@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95287691-752f-5920-2dbc-b9a5b144d0ac@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_092247_464875_211A88B7 
X-CRM114-Status: GOOD (  20.05  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 08, 2022 at 09:17:26AM -0800, Vineet Gupta wrote:
> On 11/7/22 23:56, Conor Dooley wrote:
> > On Mon, Nov 07, 2022 at 04:04:28PM -0800, Vineet Gupta wrote:
> > > +CC Andy, Conor
> > > =

> > > On 11/7/22 09:21, Bj=F6rn T=F6pel wrote:
> > > > > +config VECTOR
> > > > > +	bool "VECTOR support"
> > > > > +	depends on GCC_VERSION >=3D 120000 || CLANG_VERSION >=3D 130000
> > > > > +	default n
> > > > > +	help
> > > > > +	  Say N here if you want to disable all vector related procedure
> > > > > +	  in the kernel.
> > > > > +
> > > > > +	  If you don't know what to do here, say Y.
> > > > > +
> > > > > +endmenu
> > > > "VECTOR" is not really consistent to how the other configs are name=
d;
> > > > RISCV_ISA_V, RISCV_ISA_VECTOR, RISCV_VECTOR?
> > > =

> > > Good point, I've changed it to RISCV_ISA_V to keep it consistent with
> > > existing RISCV_ISA_C.
> > =

> > Hey Vineet, kinda randomly replying here but the wording makes it look
> > like you're going to take this patchset on?
> > If so, please check out v10 (think it was from April) as there are some
> > comments on that version that IIRC remain un-resolved.
> =

> Sure thing. Although I only see a few from Christoph and kernel build bot.

Yup, they were minor - I just don't wanna see them get lost :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
