Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543C8CFA466
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 02:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G7Zyjcpq8sTUoeMFReTCSNBFeQn9a8tVjAPM8iWy8g=; b=bGjy/oGIAOigoyjeRCurJVy/Km
	3DFxcxrPTinIoxm717yoXxIlMGuNW7mKwe+JsdGHbbq32yjKpsf+h4hOeaugk3fZYFZCgTPZQ2lkp
	Cn6HbJvbMkk6LGxjnaxaPakpKmyEr/+wSB7G1Z7DMhlxQXF9CD1NZa8LbqdD4fe/tYDhoNSxE71Zh
	oqgTzGPeJr194goDFiiAtwdSnNW/QJ2d0+l/bG2xzx5aczDgZahmcmKb1b8V1hbkiTJJ+Mm/eZVv9
	BkPGokjs9voCH+lueY+ylhaU0lr5plbM1XphDW74Sxjb1wyaNydgycUZ18hTD/62FIWn9O/d6F2jG
	fIho8mpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGaU-00000007gCl-02UY;
	Fri, 21 Nov 2025 02:09:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGaR-00000007gBj-35yJ;
	Fri, 21 Nov 2025 02:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2282D4445F;
	Fri, 21 Nov 2025 02:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30026C4CEF1;
	Fri, 21 Nov 2025 02:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763690963;
	bh=Bz7xeF2JFxhA+tr4bBYKwtM1aze7r6fWJHliCqTnUpU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j3dSOGzTqbCddJGVT5roKZn7ficPkxCfcZaQAbSHTo9ZEpPBpOUx6A+7D3iJGElrS
	 xERwOpb0HglzyK+cyiMtdgu+xzC+v5c2uu28ifTlgYK2Oge6TJdh2knqdBtSef+qsa
	 n4EASFxrLwd1zfxuHQhx80lddfRqlhkum8rXwIpnFiTVaQjEI29yJEKBIpe+M/FWR8
	 OLEfnFo43eLM03+3tVi64Nr+UnQNI7VzrHe31zP9rsXTL7AzLiKeGnBkSfiX1Gvg3X
	 9VJ4TWJNC3VVZ1aJwt1vadaOPQj2cIIv/pcsMPa30N8hKbqp7RTHENp04Ckbf6rwHH
	 UvjI8iIQZXrfQ==
Date: Thu, 20 Nov 2025 19:09:18 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
cc: Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, 
    Tiezhu Yang <yangtiezhu@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>, 
    loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
    linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
In-Reply-To: <aRsH7RTpAah4g5Xr@willie-the-truck>
Message-ID: <e36f8b19-c801-c872-381e-7eb40dc5e3e4@kernel.org>
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com> <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com> <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com> <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com> <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii> <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com> <aRsH7RTpAah4g5Xr@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1623710078-1763690962=:1910464"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_180923_817158_BDE0305D 
X-CRM114-Status: GOOD (  20.59  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1623710078-1763690962=:1910464
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 17 Nov 2025, Will Deacon wrote:

> On Sat, Nov 15, 2025 at 11:16:42AM +0800, Huacai Chen wrote:
> > On Wed, Nov 12, 2025 at 2:00 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > On Mon, Nov 10, 2025 at 03:00:00PM +0800, Huacai Chen wrote:
> > >
> > > > Changing efistub code and changing objtool (ignore __efistub prefix)
> > > > are both workarounds, but I think changing objtool is a little more
> > > > reasonable. Maybe Josh has different ideas?
> > >
> > > I thought the conversation had converged on what Tiezhu mentioned above,
> > > which is to skip objtool on libstub for loongarch, but leave the other
> > > arches alone.  That way objtool behavior is consistent between loongarch
> > > and x86, and objtool doesn't need to ignore any prefixes.
> > >
> > > So basically, the v2 patch minus the arm64/riscv changes.
> > 
> > Hi, ARM64 and RISC-V maintainers,
> > 
> > Would you mind that this patch modifies the three architectures
> > together (they are exactly the same style now)?
> > 
> > Madhavan is the author of ARM64's objtool, I think your opinion is
> > also very important.
> 
> arm64 doesn't (yet) use objtool.
> 
> I defer to Ard on anything relating to the arm64 efistub. Reading the
> start of this thread, it doesn't look like he's convinced and I'm not
> surprised if it's purely an issue with objtool.

Same for RISC-V.


- Paul
--8323329-1623710078-1763690962=:1910464
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1623710078-1763690962=:1910464--

