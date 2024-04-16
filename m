Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F91C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ti5EfaE6Bsq1M/JCb/Bao3aXesDTI4ij2drvQQ1E0pg=; b=NcUlD2edR+uF6z
	lEBrn5kvwT0G9EtJiIqQDcYKO/EEePjgqA+d8dNZZXAULi+czDA0E79/FxHlNDaaoxULX0NUOQr2O
	7gVqo2DisQZOK6t3Jvae6fEQGypv9wkPu22VsKn5Zi1PrmHJjsxbPGogiHBdFtIffWqrghWxb4gA2
	8t5HzRntelnTfoaOnktnACXc0XTJJYb9nkocBk7/lODnXi0rEH5pSD0+LOglz6+EYPuQ1P+p9b3+E
	XwkhQD9bEUiqfqGM4Lw7WIlQQkJu58AUMQjIHi4PH6pBOpT0sbLoN6dKWJricZ+wDQ47nSNeYuJB0
	sNN/94bAOx48zA8GK91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnOp-0000000DITC-24R1;
	Tue, 16 Apr 2024 18:19:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnOl-0000000DIQv-40ry
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24C01CE103F;
	Tue, 16 Apr 2024 18:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1C2C113CE;
	Tue, 16 Apr 2024 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713291552;
	bh=OSFyHt08QH9EQT0OH6l2mjM6TDXgg4K1qPiqN9EnzTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJFISS3fPUcd6DEOOP0W+iLg/MehqWAKn84NatA9HD2x9ox4VLLzoRForSafJLD5Z
	 7bknIRzjCT4DAd3BU/lMIEJKmiIGlav6YBMZMbz/DN4vug1w5ufeLyipa8GyG6ee/E
	 2VBwwcud1ujgQzDiV0AkCdaD7egYm3HrIcJ+CWH2QlbK/4r+shqzCLAI8Y66FlC6Qm
	 Df/4O359q3sLIf8HsChGbNGebitD1yY8qQTqMgKU2HRSnIW4bSh5OtY1xFENmbcjcw
	 CvvFesh2ElTtCjgpJuW7rKi4ipanh0qwGxR5nqaPQG5AFADuX/VcD+oLP/Ps2rpJT6
	 4j5kRjU+IlUHw==
Date: Tue, 16 Apr 2024 21:18:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Nam Cao <namcao@linutronix.de>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andreas Dilger <adilger@dilger.ca>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <Zh7A2o59dOIwaRjA@kernel.org>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao>
 <Zh6lD8d7cUZdkZJb@kernel.org>
 <Zh6n952Y7qKRMnMj@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh6n952Y7qKRMnMj@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_111916_200745_A12B5D8E 
X-CRM114-Status: GOOD (  12.65  )
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

On Tue, Apr 16, 2024 at 05:31:51PM +0100, Matthew Wilcox wrote:
> On Tue, Apr 16, 2024 at 07:19:27PM +0300, Mike Rapoport wrote:
> > > "last page of the first gigabyte" - why first gigabyte? Do you mean
> > > last page of *last* gigabyte?
> >  
> > With 3G-1G split linear map can map only 1G from 0xc0000000 to 0xffffffff
> > (or 0x00000000 with 32-bit overflow):
> > 
> > [    0.000000]       lowmem : 0xc0000000 - 0x00000000   (1024 MB)
> 
> ... but you can't map that much.  You need to reserve space for (may not
> be exhaustive):
> 
>  - PCI BARs (or other MMIO)
>  - vmap
>  - kmap
>  - percpu
>  - ioremap
>  - modules
>  - fixmap
>  - Maybe EFI runtime services?
> 
> You'll be lucky to get 800MB of ZONE_NORMAL.

But that does not mean that the last page won't get to the buddy

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
