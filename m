Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9B5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wrqrh+CDFO59eKWj1cI3m/ND2vaVU5lOP1VLL1SMITs=; b=T77pejjhqYL5rh
	M+apoFid4XMIJArn/EZWnOitpYxdMJnZJ+g0x6+AIWoAdfERPbZ+W6h6CBnUSsYQUs6Xverbtiysr
	k4puAykX21tKpAJdUeiVHzsMmwMDr4KLpu50j3WP4/ym6xIMFykoYIlfHSRkijOBUtVoDyYP6yS0u
	Iq8bE3qiQegWyJHdJ/7Qc6i1q9LPtqgR5fUfmfx8LBOPHttnKq4ANHw59fLpt/rDwKwgGAoICWnaP
	maAJZ+BIaXOLM2e0WRHagp84sCUYIPq4gFzRSHvGf0nGm+zbqfL71t8n4zPjdXI0N+7aAyxfuEvEn
	L7kDDVLSzvmRhmkL0egQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD60V-00AEqo-1J; Wed, 04 Jan 2023 15:48:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5kX-00A8ad-8J
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 15:32:19 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pD5kR-0007eN-UP; Wed, 04 Jan 2023 16:32:11 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Ard Biesheuvel <ardb@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com, linux-efi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, alexghiti@rivosinc.com
Subject: Re: [PATCH v3 12/14] efi/riscv: libstub: mark when compiling libstub
Date: Wed, 04 Jan 2023 16:32:11 +0100
Message-ID: <3495322.aeNJFYEL58@diego>
In-Reply-To: <20230104152153.ae7zki6iofc7ugbs@orel>
References: <20221130225614.1594256-1-heiko@sntech.de> <CAMj1kXGBSLf4ppjA5_F4Ork+ZJ45Sk0w6SnPc3eDcWbTMkj3SQ@mail.gmail.com> <20230104152153.ae7zki6iofc7ugbs@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_073217_404080_3E841084 
X-CRM114-Status: GOOD (  30.83  )
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

Am Mittwoch, 4. Januar 2023, 16:21:53 CET schrieb Andrew Jones:
> On Fri, Dec 02, 2022 at 05:37:16PM +0100, Ard Biesheuvel wrote:
> > On Thu, 1 Dec 2022 at 23:39, Heiko St=FCbner <heiko@sntech.de> wrote:
> > >
> > > Hi Ard,
> > >
> > > Am Donnerstag, 1. Dezember 2022, 21:57:00 CET schrieb Ard Biesheuvel:
> > > > On Thu, 1 Dec 2022 at 20:35, Andrew Jones <ajones@ventanamicro.com>=
 wrote:
> > > > >
> > > > > On Wed, Nov 30, 2022 at 11:56:12PM +0100, Heiko Stuebner wrote:
> > > > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > > >
> > > > > > We may want to runtime-optimize some core functions (str*, mem*=
),
> > > > > > but not have this leak into libstub and cause build issues.
> > > > > > Instead libstub, for the short while it's running, should just =
use
> > > > > > the generic implementation.
> > > > > >
> > > > > > So, to be able to determine whether functions, that are used bo=
th in
> > > > > > libstub and the main kernel, are getting compiled as part of li=
bstub or
> > > > > > not, add a compile-flag we can check via #ifdef.
> > > > > >
> > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > >
> > > > I think it would be better to update arch/riscv/kernel/image-vars.h=
 so
> > > > that only these generic implementations are exposed to the stub in =
the
> > > > first place.
> > >
> > =

> > Actually, all references to string and memory functions are going away
> > from the stub. This is already in -next.
> > =

> > EFI now has zboot support, which means you can create a EFI bootable
> > kernel image that carries the actual kernel in compressed form rather
> > than as a hybrid EFI/bare metal image.
> =

> While chatting about EFI stub string functions again in the context of [1]
> we recalled this comment that states the references should be going away
> anyway. I'm just replying here with interested parties on CC to try and
> bring it back to the forefront.
> =

> [1] https://lore.kernel.org/all/20221216162141.1701255-5-alexghiti@rivosi=
nc.com/

I'm currently following Ard's other suggestion and am using a more
traditional model for str* functions (aka non-inline).

One thing I found on the new EFI parts was that while it provides it's own
implementations, it does not provide it's own prototype.

On the real kernel-side all the HAVE_ARCH_* blocks do wrap around
both the generic implementation as well as the prototype in string.h,
and there _are_ other implementations of str* or mem* functions
done as inline, on other arches. So that may be something that might
need fixing on the EFI-side.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
