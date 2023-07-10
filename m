Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7B3EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lW9ZQwz84uzlE6vIs6xQedupQtbofPRzsO3NlYE+zcs=; b=kfgtQDEDPHQVis
	DFGlzIZjfGMpmRHlknVoI9tq4v/ymrIW8x7A5/FPByrdUxafDkGk+6ydW9tpABw9zuiIQJIhUmnwQ
	PnU0ZlhaJg1gPCE2We9fLFHIt4r76/WssL8Duc4lQ1FWeMK/oihybKLXqAdbU9jjyvbxw0kpaRb9x
	LJ8vYygDCxo4p0sWu4d8IG4lQnVEfrv02PlWya45oIEiaXj8f2Q94tvW64coa9dieSfFXqkpG1Q8g
	Utrp4lwBuQGp0+15DoMhuXYZoa5EbBXPgnBXlIWRKi+E7mkYrw0aXAS1kLGXahJzwCPJXdgaKlpCP
	03Qpj7ywyn1p686pdVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIloF-00Am4p-0w;
	Mon, 10 Jul 2023 07:59:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIloA-00Am3d-0Q
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 07:59:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-314417861b9so4156683f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688975983; x=1691567983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4s0y+CiArgrs8zc1TP81OmeRt+6ofcq3TLiNr7K9G0=;
        b=RGlYcLbHq4I0xKcSYV+BmOT+KQdZNUohhStkIT565OR29Way13n6yLzTPHecHFbs/V
         9znVnmH2wMAsF2FG0fMjoX7iwn0FuScQAblsq3YJ80t6BRNhfesFxHmpXSk3WyaCKLik
         d8ls9LQ9iiJ0QB4RIqIIO5aknSm7s9JY5fMjj7PF1kVvc51jz9KaN5kB2pibziL2MmK+
         emdVstWzD7sqsCIsUiPnVP1X+gtoOOkQbs13sTwIlgTCzq/3vEa5G36H/gMjfe896KyN
         wsLa3gh2m707fiYeX+tbmoYl1ysSXzucAnubgWGEIUS8EAcHkXRGoLV9+5+0SzzQHc2J
         sDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688975983; x=1691567983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4s0y+CiArgrs8zc1TP81OmeRt+6ofcq3TLiNr7K9G0=;
        b=QKzrL/1Jj+iSvteFpGH6cQlXkw1jGjFaDxfMkFf3EkGF9KLZ8wMisDlMMG+wQgbwJG
         MXoq4qmijjor2wPqGXHr53n1KPxDfarBiwcDOBynY885I4/R9rN1+TCCPu1Y/S0x30jA
         IPlQjySUKxttG5u1p4aM7BILLkGS/weaQEjPSu8YlM/jBE0vpTOl6dJhbR3QipVVZzuL
         8JIPBZslrDwI43Kq1VXNnk59WuuWTMBGHECQVLpwiONMeGoJBAlz7/S3ApjgApeoRn2o
         v6CH74rVLVILwicIGNXM3ri8Anhr+1E20hPig7VCAkYjSxea1kUX77KiL8LXJ+EE6WK7
         rGtA==
X-Gm-Message-State: ABy/qLb9V0cq+T3E4auRvhCfAx2DadvIuAt3lcTknmtqisusD0zW/LM5
	uOwze/YWRtdBhL1KRUoJo+lodg==
X-Google-Smtp-Source: APBJJlGpY2voIPQkLFH1Z0/MM2E5JF5SaKSqb7vmKQwdsGe4mvxip5sQYpELQv1YbeLkwSY4zIlVhA==
X-Received: by 2002:a5d:6b0b:0:b0:313:e5f2:7cbf with SMTP id v11-20020a5d6b0b000000b00313e5f27cbfmr10373854wrw.58.1688975983128;
        Mon, 10 Jul 2023 00:59:43 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id a9-20020a5d4d49000000b00315995837aesm2747389wru.36.2023.07.10.00.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:59:42 -0700 (PDT)
Date: Mon, 10 Jul 2023 09:59:40 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 2/3] RISC-V: hwprobe: Expose Zbc and the scalar crypto
 extensions
Message-ID: <ZKu6bCMPX0WKetVp@vermeer>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-3-sameo@rivosinc.com>
 <348f624f-3be0-4df7-ab5d-4a912197d82b@app.fastmail.com>
 <ZJwFs2O85pvjCLXa@vermeer>
 <b208a2cb-bf68-4f4f-9c99-6a2e5853d26e@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b208a2cb-bf68-4f4f-9c99-6a2e5853d26e@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_005946_168216_0150EAE7 
X-CRM114-Status: GOOD (  34.67  )
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

On Wed, Jun 28, 2023 at 09:25:02AM -0400, Stefan O'Rear wrote:
> On Wed, Jun 28, 2023, at 6:04 AM, Samuel Ortiz wrote:
> > On Tue, Jun 27, 2023 at 08:34:20PM -0400, Stefan O'Rear wrote:
> >> On Tue, Jun 27, 2023, at 10:37 AM, Samuel Ortiz wrote:
> >> > Zbc was missing from a previous Bit-Manipulation extension hwprobe
> >> > patch.
> >> >
> >> > Add all scalar crypto extensions bits, and define a macro for setting
> >> > the hwprobe key/pair in a more readable way.
> >> >
> >> > Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> >> > ---
> >> >  Documentation/riscv/hwprobe.rst       | 33 ++++++++++++++++++++++++
> >> >  arch/riscv/include/uapi/asm/hwprobe.h | 11 ++++++++
> >> >  arch/riscv/kernel/sys_riscv.c         | 36 ++++++++++++++++-----------
> >> >  3 files changed, 66 insertions(+), 14 deletions(-)
> >> >
> >> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> >> > index 19165ebd82ba..3177550106e0 100644
> >> > --- a/Documentation/riscv/hwprobe.rst
> >> > +++ b/Documentation/riscv/hwprobe.rst
> >> > @@ -72,11 +72,44 @@ The following keys are defined:
> >> >         extensions.
> >> > 
> >> >    * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, 
> >> > as defined
> >> > +      in version 1.0 of the Bit-Manipulation ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBC`: The Zbc extension is supported, 
> >> > as defined
> >> >         in version 1.0 of the Bit-Manipulation ISA extensions.
> >> > 
> >> >    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, 
> >> > as defined
> >> >         in version 1.0 of the Bit-Manipulation ISA extensions.
> >> > 
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKB`: The Zbkb extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKC`: The Zbkc extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZBKX`: The Zbkx extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKND`: The Zknd extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKNE`: The Zkne extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKNH`: The Zknh extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKR`: The Zkr extension is supported, 
> >> > as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKSED`: The Zksed extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKSH`: The Zksh extension is 
> >> > supported, as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZKT`: The Zkt extension is supported, 
> >> > as defined
> >> > +    in version 1.0 of the Scalar Cryptography ISA extensions.
> >> > +
> >> >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains 
> >> > performance
> >> >    information about the selected set of processors.
> >> > 
> >> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h 
> >> > b/arch/riscv/include/uapi/asm/hwprobe.h
> >> > index 006bfb48343d..8357052061b3 100644
> >> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> >> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> >> > @@ -29,6 +29,17 @@ struct riscv_hwprobe {
> >> >  #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
> >> >  #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
> >> >  #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
> >> > +#define		RISCV_HWPROBE_EXT_ZBC		(1 << 6)
> >> > +#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 7)
> >> > +#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 8)
> >> > +#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 9)
> >> > +#define		RISCV_HWPROBE_EXT_ZKND		(1 << 10)
> >> > +#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 11)
> >> > +#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 12)
> >> > +#define		RISCV_HWPROBE_EXT_ZKR		(1 << 13)
> >> > +#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
> >> > +#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
> >> > +#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
> >> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> >> > diff --git a/arch/riscv/kernel/sys_riscv.c 
> >> > b/arch/riscv/kernel/sys_riscv.c
> >> > index 26ef5526bfb4..df15926196b6 100644
> >> > --- a/arch/riscv/kernel/sys_riscv.c
> >> > +++ b/arch/riscv/kernel/sys_riscv.c
> >> > @@ -145,20 +145,28 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe 
> >> > *pair,
> >> >  	for_each_cpu(cpu, cpus) {
> >> >  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
> >> > 
> >> > -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> >> > -			pair->value |= RISCV_HWPROBE_EXT_ZBA;
> >> > -		else
> >> > -			missing |= RISCV_HWPROBE_EXT_ZBA;
> >> > -
> >> > -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> >> > -			pair->value |= RISCV_HWPROBE_EXT_ZBB;
> >> > -		else
> >> > -			missing |= RISCV_HWPROBE_EXT_ZBB;
> >> > -
> >> > -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> >> > -			pair->value |= RISCV_HWPROBE_EXT_ZBS;
> >> > -		else
> >> > -			missing |= RISCV_HWPROBE_EXT_ZBS;
> >> > +#define SET_HWPROBE_EXT_PAIR(ext)					\
> >> > +		do {							\
> >> > +			if (riscv_isa_extension_available(isainfo->isa, ext)) \
> >> > +				pair->value |= RISCV_HWPROBE_EXT_## ext; \
> >> > +			else						\
> >> > +				missing |= RISCV_HWPROBE_EXT_## ext;	\
> >> > +		} while (false)						\
> >> > +
> >> > +		SET_HWPROBE_EXT_PAIR(ZBA);
> >> > +		SET_HWPROBE_EXT_PAIR(ZBB);
> >> > +		SET_HWPROBE_EXT_PAIR(ZBC);
> >> > +		SET_HWPROBE_EXT_PAIR(ZBS);
> >> > +		SET_HWPROBE_EXT_PAIR(ZBKB);
> >> > +		SET_HWPROBE_EXT_PAIR(ZBKC);
> >> > +		SET_HWPROBE_EXT_PAIR(ZBKX);
> >> > +		SET_HWPROBE_EXT_PAIR(ZKND);
> >> > +		SET_HWPROBE_EXT_PAIR(ZKNE);
> >> > +		SET_HWPROBE_EXT_PAIR(ZKNH);
> >> > +		SET_HWPROBE_EXT_PAIR(ZKR);
> >> 
> >> Does the presence of a HWPROBE_EXT bit imply that userspace software can
> >> actually directly use the described feature?  If so, we should probably
> >> not set ZKR unless mseccfg.USEED=1.
> >
> > mseccfg is MRW, so only accessible from M-mode only afaiu. So I don't
> > think we would be able to check that from Linux in S-mode.
> 
> Check directly, no, but your patch already makes the assumption that
> mseccfg.SSEED=1 if zkr is present in the device tree.  Which is fine as long
> as that contract is documented somewhere (presumably, the device tree
> binding; some of the language in the RVA22U64 profile spec implies USEED=0,
> but linux does not require profiles and they don't exist for rv32).
> 
> If we want U-mode behavior to be discoverable and/or predictable, we have
> three good options:

Thanks for the suggestions.

> Simplest: Document that we expect USEED=0 or USEED=1.  Set zkr appropriately
> in hwprobe.
> 
> Most flexible: Work with the SBI people to add a SBI_EXT_FWFEATURE for USEED,
> as well as defining the value on kernel entry.  Expose this via hwprobe and
> a new prctl.

I'd like to go down that route, but this depends on [1] to get
accepted/merged first.

Would it make sense to go with only documenting the USEED expectation
for now and then move to the more flexible FWFEATURE SBI approach?

Cheers,
Samuel.

[1] https://lists.riscv.org/g/tech-prs/message/540

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
